# Install Persistant Hook
When the device reboots, any changes in ramfs are lost, but the device is using flash with squashfs and jffs2 file systems. I have not discovered how to modfiy and upload an image to squashfs, but with jffs2 there is a way to install a hook. That hook even survives an upgrade that is done afterwards (see end of this section)!

To start, you have to enable telnet and that may require a downgrade in the first step. See [Downgrade Firmware](/Downgrade.md) and [Enable telnetd](/TELNETD.md).

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
The mtd9 device named "user2" is not erased at a reboot, because it contains play lists. It is mounted as /vendor and a hook can be installed in ***/vendor/user*** directory as described below. On the Up2Stream Pro device that I own that directory was already present and a script called ***user.sh*** was located in that directory. 

> **Note:**
> Neither that directory nor the **user.sh** script were installed on my Up2Stream Amp device by default. Both devices have the same software version 4.2.8020 from 2020/02/20 (20th of Feb 2020) and were downgraded from v4.6.415145, release date 2022/04/27. 

Here's the file from the device where the script was already present (used to start a daemon called ***socket***):
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
Just append the code below at the end of that file. On the device where the script was not present, I've just created it.

Compared to the the section [Enable telnetd](/TELNETD.md), the code below has a little enhancement included, because the downloaded version of busybox is used as the shell ***/tmp/bin/ash*** instead of "build-in" version. You can see the difference, because the shell prompt message is ***BusyBox v1.23.2 (2016-09-27 07:54:34 CEST) built-in shell (ash)*** instead of ***BusyBox v1.12.1 () built-in shell (ash)***.

A list of all commands that are included is shown with ***/tmp/bin/busybox --help*** or just 'help' (see shell script below). You may create symbolic links for the commands you need (recommended, see below for an example) or start them directly, e.g. ***/tmp/bin/busybox dmesg***.
```
mkdir /vendor/user
cat <<\EOF >> /vendor/user/user.sh
#!/bin/sh

sleep 5
# get telnetd from full version of busybox and start in background
mkdir /tmp/bin
wget -O /tmp/bin/busybox -T 5 http://10.1.1.22/linkplay/a31/bin/busybox -q
chmod 555 /tmp/bin/busybox
ln -s /tmp/bin/busybox /tmp/bin/telnetd
ln -s /tmp/bin/busybox /tmp/bin/ash
/tmp/bin/telnetd telnetd -l/tmp/bin/ash &

echo '#!/bin/sh' >/tmp/bin/help
echo '/tmp/bin/busybox --help' >>/tmp/bin/help
chmod 755 /tmp/bin/help

# shut down WiFi - use only if the device is connected by LAN - eth0
ifconfig apcli0 down
ifconfig ra0 down
sleep 600
ifconfig apcli0 down
ifconfig apcli0 down

# Uncomment to disable sleep after 15 minutes
#while true; do sleep 60; echo 'AXX+MUT+000' >/dev/ttyS0; done &
EOF
chmod 755 /vendor/user/user.sh
cd /vendor/user
ls -l
```
The shutdown of the 'apcli0' WiFi interface does not work within the script, however it works a bit later if executed manually.

So far, the device fetches the full version of busybook after each reboot, but stores that binary in ramfs. With ***df*** command you can verify the free space on each of the file systems.

> **IMPORTANT:**
> The hook is NOT called, if the device got stuck during an upgrade, e.g. if you have a ***products.xml*** file with a product ID that is matching your product that triggers an upgrade, but got stuck for some reasons. Therefore I recommend to rename the ***products.xml*** file on your server to something else and block or redirect any upgrade requests on the Internet. See [Downgrade Firmware](/Downgrade.md) section at the end for details. 

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

