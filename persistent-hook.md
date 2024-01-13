# Install Persistent Hook
When the device reboots, any changes in ramfs are lost, but the device is using flash with squashfs and jffs2 file systems. I have not discovered how to modfiy and upload an image to squashfs, but with jffs2 there is a way to install a hook. That hook even survives an upgrade that is done afterwards (see end of this section)!

To start, you have to enable telnet and that may require a downgrade in the first step. See [Downgrade Firmware](/Downgrade.md) and [Enable telnetd](/TELNETD.md).

## Information about file systems on the device
Below is an output of mount command and ***cat /proc/mtd*** output:
```
# mount
rootfs on / type rootfs (rw)
/dev/root on / type squashfs (ro,relatime)
proc on /proc type proc (rw,relatime)
none on /var type ramfs (rw,relatime)
none on /etc type ramfs (rw,relatime)
none on /tmp type ramfs (rw,relatime)
none on /media type ramfs (rw,relatime)
none on /sys type sysfs (rw,relatime)
none on /dev/pts type devpts (rw,relatime,mode=600)
mdev on /dev type ramfs (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
mdev on /dev type ramfs (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
/dev/mtdblock8 on /mnt type jffs2 (rw,relatime)
/dev/mtdblock9 on /vendor type jffs2 (rw,relatime)

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00010000 "ALL"
mtd1: 00030000 00010000 "Bootloader"
mtd2: 00010000 00010000 "Config"
mtd3: 00010000 00010000 "Factory"
mtd4: 00200000 00010000 "bkKernel"
mtd5: 001df508 00010000 "Kernel"
mtd6: 00950af8 00010000 "RootFS"
mtd7: 00b30000 00010000 "Kernel_RootFS"
mtd8: 00080000 00010000 "user"
mtd9: 00200000 00010000 "user2"
#
```
The mtd8 device named "user" is not erased at a reboot, because it may contain a preset list (file ***totalqueue.xml*** and/or ***keymap.xml***) in /mnt directory. There's also a third file in the directory called ***radio.xml***.

The mtd9 device named "user2" is not erased at a reboot, because it may contain additional 'vendor' data. It is mounted as /vendor and a hook can be installed in ***/vendor/user*** directory as described below. On the Up2Stream Pro device that I own that directory was already present and a script called ***user.sh*** was located in that directory. 

## Install Persistent Hook with Code
After a reset to factory settings with release v4.6.415145, release date 2022/04/27, the device has a web interface. To run this web interface the device calls a shell script ***/vendor/user/user.sh where some code can be added to:

```
/usr/sbin/telnetd

cd /system/workdir/
. ./evn.sh

chmod 777 /vendor/user/daemonize
chmod 777 /vendor/user/ws_server

/vendor/user/daemonize /vendor/user/ws_server
```
> **Note:**
> The ***telnetd*** is NOT installed, because the file is missing in the (read only) directory /usr/bin. 

Create a file in ***/vendor/user*** with the name ***usermod.sh***. The shell script has been tested with different devices that are connected via ethernet and wireless. Don't forget to adjust the IP address for the web server (in my case 10.1.1.22)!
```
cd /vendor/user
cat <<\EOF >> /vendor/user/usermod.sh
#!/bin/sh

# time may be reduced if connected to ethernet - WiFi setup could take a bit longer
sleep 20
# get telnetd from full version of busybox and start in background
mkdir /tmp/bin
killall busybox
rm /tmp/bin/busybox
wget -O /tmp/bin/busybox -T 5 http://10.1.1.22/linkplay/a31/bin/busybox -q
chmod 555 /tmp/bin/busybox
ln -s /tmp/bin/busybox /tmp/bin/telnetd
ln -s /tmp/bin/busybox /tmp/bin/ash
ln -s /tmp/bin/busybox /tmp/bin/netstat
sync
/tmp/bin/busybox telnetd -l /tmp/bin/ash &

echo '#!/bin/sh' >/tmp/bin/help
echo '/tmp/bin/busybox --help' >>/tmp/bin/help
chmod 755 /tmp/bin/help

# shut down WiFi after 5 min, but only if the device is connected by LAN (eth2) and got an IP addr on that interface
sleep 300
lanIPup=`ifconfig eth2 | grep 'inet addr:' | wc -l`
if [ $lanIPup -eq 1 ]; then
  ifconfig ra0 down
  ifconfig ra0 down
  ifconfig apcli0 down
  ifconfig apcli0 down
fi
unset lanIPup

# Uncomment to disable sleep after 15 minutes (I haven't used this code - just an example from Crymeiriver)
#while true; do sleep 60; echo 'AXX+MUT+000' >/dev/ttyS0; done &

EOF
```
Make the file executable and add a link to the new script in the existing ***user.sh*** script.
```
chmod 755 usermod.sh
echo '' >> user.sh
echo '/vendor/user/usermod.sh &' >> user.sh
echo '' >> user.sh
```

The shutdown of the 'apcli0' WiFi interface does not work within the script when called in the first place, however it works a bit later if executed manually. So I added the 300 seconds (5 minutes) sleep and executed the command twice. Now it looks that it works as expected. I also added some code, so that the WiFi interface is NOT shut down if the Ethernet / LAN interface (eth2) does not get an IP address.

## Differences in telnetd

Compared to the the section [Enable telnetd](/TELNETD.md), the code above has a little enhancement included, because the downloaded version of busybox is used as the shell ***/tmp/bin/ash*** instead of "build-in" version. You can see the difference, because the shell prompt message is ***BusyBox v1.23.2 (2016-09-27 07:54:34 CEST) built-in shell (ash)*** instead of ***BusyBox v1.12.1 () built-in shell (ash)***.

A list of all commands that are included is shown with ***/tmp/bin/busybox --help*** or just 'help' (see shell script below). You may create symbolic links for the commands you need (recommended, see below for an example) or start them directly, e.g. ***/tmp/bin/busybox dmesg***.

## Additional Infos
So far, the device fetches the full version of busybook after each reboot, but stores that binary in ramfs. With ***df*** command you can verify the free space on each of the file systems.

> **IMPORTANT:**
> The hook is NOT called, if the device got stuck during an upgrade, e.g. if you have a ***products.xml*** file with a product ID that is matching your product that triggers an upgrade, but got stuck for some reasons. Therefore I recommend to rename the ***products.xml*** file on your server to something else and block or redirect any upgrade requests on the Internet. See [Downgrade Firmware](/Downgrade.md) section at the end for details. 


> **Note:**
> Neither the directory ***/vendor/user*** nor the **user.sh** script were installed on my Up2Stream devices when I bought them with version 4.2. That may have changed with v4.6

Here's an older script that I found on the device (used to start a daemon called ***socket***):
```
# cat user.sh
#!/bin/sh

echo "runing custom's app socket.............."
sleep 5

chmod 777 /vendor/user/socket

sn=`ps -ef | grep /vendor/user/socket | grep -v grep |wc -l`
echo $sn

if [ $sn -eq 0 ]; then
        /vendor/user/socket &
fi
```

## Verification
For testing purpose, you may ***reboot*** and ***telnet*** to the device afterwards.

> IMPORTANT: The good thing is, that this hook even suvives an upgrade that is done afterwards (tested with v4.6.415145, release date 2022/04/27.):
```
Mac-mini ~ % curl -s 'http://10.1.1.52/httpapi.asp?command=getStatusEx' | jq
{
  "uuid": "FF31F09EAC1C213319CC79B5",
  "DeviceName": "Wohnzimmer",
  "GroupName": "Wohnzimmer",
  "ssid": "Wohnzimmer_4029",
  "language": "en_us",
  "firmware": "4.6.415145",
  "hardware": "A31",
  "build": "release",
  "project": "UP2STREAM_PRO_V3",
  "priv_prj": "UP2STREAM_PRO_V3",
  "project_build_name": "a31rakoit",
  "Release": "20220427",
  "temp_uuid": "B4D39CBCE2C2015F",
  ...
}  
Mac-mini ~ % telnet 10.1.1.52
Trying 10.1.1.52...
Connected to 10.1.1.52.
Escape character is '^]'.


BusyBox v1.23.2 (2016-09-27 07:54:34 CEST) built-in shell (ash)

/system/workdir # exit
Connection closed by foreign host.
```

# Alternate Solution
I found an easier solution to downgrade the firmware, install a hook and upgrade again. You don't have to manipultate any XML files. The following examples use the IP address 10.1.1.38 for an Up2Stream Amp device in my home. You have to adjust this IP address and the one for your PC.

## Get Settings
Get the current settings from the device. The following example is using WiFi with the build in IP address of the hotspot. On your LAN, the IP address is different:
```
curl -s 'http://10.10.10.254/httpapi.asp?command=getStatusEx' | jq
```
Verify firmware (version), project, hardware before you continue.

## Download Firmware
Download the firmware from the Internet to your PC for version 4.2.8020 from 2020/02/20 (20th of Feb 2020) and the latest version (currently 4.6.415145 from 2022/04/27). The following URLs may work for all Linkplay devices from Arylic / Rakoit with a ***Linkplay A31*** module. If you have a different Linkplay module, DON'T install this binary image, because you will likely brick your device. 

It may work with other vendors (if they also use a Linkplay A31 module), but it's your risk and therefore I recommend to follow the instructions in [Download Firmware](/download-firmware.md).
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/a31rakoit_new_uImage_20200220
curl -O http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/a31rakoit_new_uImage_20220427
```

## Reset to factory defaults
This is not a requirement, but I did it to have a clean setup. If you like to use the web interface with v4.6 you have to do a reset to factory defaults before you can use it. The reset to factory defaults may also be done with the following methods:
 - long press the reset button on the device for 8-10 seconds
 - use the 4stream app, select the settings wheel for your device, select info menu, scroll to the bottom and select 'restore to factory defaults'
 - from your PC with shell command, e.g.: curl -s 'http://10.1.1.38/httpapi.asp?command=restoreToDefault'

Wait for the device reboot and notice sound from device via speaker.

> IMPORTANT: You should disconnect the cable from your home network to the Internet to prevent an accidental upgrade. If you are fast, you may ignore this notice. I may take about 10 minutes after the device automatically upgrades to the latest version.

## Connect PC to WiFi hotspot from your device
If your device is connected by ethernet / LAN cable, then skip this step. Otherwise connect your PC (not mobile phone!) to the WiFi hotspot that starts when the device is turned on. The SSID has the format 'SoundSystem_XXXX', where XXXX is a different hex code for each system. 

> Note: This is an open WLAN, without any security!

## Downgrade Firmware
Install the firmware for version 4.2.8020 you've downloaded on your device.

```
curl --user-agent Mozilla -v -F "file=@a31rakoit_new_uImage_20200220" http://10.10.10.254/cgi-bin/upload.cgi
```

> Note: The installation is not finished when the message 'We are completely uploaded and fine' is shown. It's just the upload that has finished, so it's safe to end curl (CTRL-C).

The device uploads and installs the firmware. You may get some notification sounds if speakers are connected to your device. At the end it reboots. Wait for the device to come back. It may take about a minute for all these steps. 

## Connect PC to WiFi hotspot from your device
Reconnect to the WiFi hotspot from your device with your PC as described above. If your device is connected by ethernet / LAN cable, then skip this step.

## Install Telnetd
If your device is connected by ethernet / LAN cable, you have to adjust the IP addresses: the first IP address is from your Linkplay device and the two other IP addresses are from your PC.

> Note: you have to install a web server on your PC, so that the device is able to copy the software 'busybox' from your PC.

```
curl "http://10.10.10.254/httpapi.asp?command=getsyslog:ip:10.10.10.128/index.html;mkdir+/tmp/bin;wget+-O+/tmp/bin/busybox+-T+5+http://10.10.10.128/linkplay/a31/bin/busybox+-q;chmod+555+/tmp/bin/busybox;/tmp/bin/busybox+telnetd+-l/bin/ash;"
```
Connect to your device via telnet from your PC:
```
telnet 10.10.10.254
```
> Note: It may take a bit longer, e.g. 20 seconds until you get the telnet prompt.

Verify the SSID and password for your hotspot. You may change the settings from the example and choose your own password. It should have at least 8 characters.
```
ralink_init show 2860 | grep 1\'=
  'SSID1'='SoundSystem_4345'
  'WPAPSK1'='Plattfisch09'
nvram_set SSID1 Music
nvram_set WPAPSK1 Plattfisch09
```

## Install a persistent hook
Follow instructions from above in section [Install persistent hook with code](/persistent-hook.md#install-persistent-hook-with-code) . Don't forget to make the file executable and add a link to the new script in the existing ***user.sh*** script!

## Configure the device for your WiFi network at home
If your device is connected by ethernet / LAN cable, then skip this step. Otherwise use an online tool to convert the SSID and password for your WiFi network at home from ASCII to hex. Then configure your device to connect to your WiWi network at home. The following example is using Melbourne as an SSID and Elwood2005! as the password.
```
curl "http://10.10.10.254/httpapi.asp?command=wlanConnectApEx:ssid=4D656C626F75726E65:ch=0:auth=WPA2PSK:encry=AES:pwd=456C776F6F643230303521:chext=1"
```
> Note: All parameters are required, even a channel! You may set the channel to 0, but it is changed to the channel that is active on your network.

> Note: The device immediately connects to local WiFi network as a client, so you'll loose the connection from the hotspot. You should hear a notification sound that the device has connected to your local WiFi network. Otherwise you have to start again.

There is a command to verify the connect state, but if it does not connect, you can't reach it and it may not have an IP address. So it's just for reference:
```
curl "http://10.1.1.38/httpapi.asp?command=wlanGetConnectState"
```
The Answer is either PROCESS or OK. 
--> if PROCESS then connection is not established
--> if OK the variables shown below are added to NVRAM

## Verify settings
You may verify the settings, because you it is easier to reinstall ***telnetd*** before you do the upgrade.
```
telnet 10.1.1.38 (the IP address that was assigned to the device)

ralink_init show 2860 | grep ApCli
  'ApCliSsid'='4D656C626F75726E65'
  'ApCliWPAPSK'='456C776F6F643230303521'
  'ApCliAuthMode'='WPA2PSK'
  'ApCliEncrypType'='AES'
  'ApCliChannel'='6'
  'ApCliEnable'='1'

reboot
```
Wait for notification sound after device comes back. Telnet to the device again.

## Upgrade to latest firmware
You may either wait or upgrade the firmware manually.
```
curl --user-agent Mozilla -v -F "file=@a31rakoit_new_uImage_20220427" http://10.1.1.38/cgi-bin/upload.cgi
```
As before, the device uploads and installs the firmware. At the end it reboots. 

## Verifiy Version
At the end you may verify the version and telnet access. The default password for the web interface of the device is 'admin'.
```
curl -s 'http://10.1.1.38/httpapi.asp?command=getStatusEx' | jq
telnet 10.1.1.38 
```
