# Hardware and Firmware
The specs for the Linkplay A31 module are as follows
```
# cat /proc/cpuinfo
system type             : MT7628
processor               : 0
cpu model               : MIPS 24Kc V5.5
BogoMIPS                : 386.04
wait instruction        : yes
microsecond timers      : yes
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
ASEs implemented        : mips16 dsp
shadow register sets    : 1
core                    : 0
VCED exceptions         : not available
VCEI exceptions         : not available
```

Here are some useful links go get more information about the hardware:
https://openwrt.org/docs/techref/hardware/soc/soc.mediatek
https://openwrt.org/docs/techref/instructionset/mipsel_24kc
https://www.linkplay.com/modules-wi-fi-2

There is an OpenWRT archive where you can get precompiled binaries for almost all utilities you may need:
https://archive.openwrt.org/chaos_calmer/15.05/ramips/mt7628/packages/base/
and
https://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7628/

The binaries are included in packages, so you have to find out which packages includes a specific binary. A list of packages can be found here: https://archive.openwrt.org/chaos_calmer/15.05/ramips/mt7628/packages/base/Packages

Here's an example how to download a package and get the binaries from it for a SSH server (dropbear). The commands were executed from a terminal window on my MacMini:

```
cd ~/Downloads
curl 'https://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7628/packages/base/dropbear_2015.67-1_ramips_24kec.ipk' -o dropbear_2015.67-1_ramips_24kec.ipk
mkdir dropbear_2015.67-1_ramips_24kec
cd dropbear_2015.67-1_ramips_24kec
tar zxpvf ../dropbear_2015.67-1_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz
# copy dropbear binary to a subdirectory on your webserver
cp usr/sbin/dropbear /Library/WebServer/Documents/a31/
# you may open finder to search for additional information in the package
open .
```
In the next step you can you can download and install dropbear on the Up2Stream device (telnetd already installed):
``` 
cd /tmp
mkdir /tmp/bin
wget -O /tmp/bin/dropbear -T 5 'http://10.1.1.22/a31/dropbear'
chmod 777 /tmp/bin/dropbear
# create links for additional commands
ln -s /tmp/bin/dropbear /tmp/bin/dropbearkey
ln -s /tmp/bin/dropbear /tmp/bin/scp
ln -s /tmp/bin/dropbear /tmp/bin/dbclient
# not sure if PATH needs to be set (can't remember anymore) 
# export PATH=$PATH:/tmp/bin
# generate SSH keys (only once - you may save and reuse your keys later)
dropbearkey -t rsa -f /tmp/rsa_host_key
# save public key to file (may also be used to show key)
dropbearkey -y -f rsa_host_key | grep ^ssh-rsa > key_public
# example how to use scp with dbclient (ssh client from dropbear) to copy
# key to a remote Linux system
scp -S /tmp/bin/dbclient /tmp/rsa_host_key pi@10.1.1.45:rsa_host_key
# later on you may reuse your saved keys to avoid key mismatches
# wget -O /tmp/rsa_host_key -T 5 'http://10.1.1.22/a31/rsa_host_key'
chmod 666 /tmp/rsa_host_key
dropbear -r /tmp/rsa_host_key
```
Log in with ssh from remote by using username admin, password admin

I tried to install a sftp server on my Up2Stream device to be able to add the file system via sshfs from my MacMini, but it's not working so far. Here are the commands that I've used: 
```
cd ~/Downloads
curl 'https://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7628/packages/packages/openssh-sftp-server_7.1p2-1_ramips_24kec.ipk' -o openssh-sftp-server_7.1p2-1_ramips_24kec.ipk
mkdir openssh-sftp-server_7.1p2-1_ramips_24kec
cd openssh-sftp-server_7.1p2-1_ramips_24kec
tar zxpvf ../openssh-sftp-server_7.1p2-1_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz
# copy sftp server binary to a subdirectory on your webserver
cp usr/lib/sftp-server /Library/WebServer/Documents/a31/
# you may open finder to search for additional information in the package
open .
```
and on the Up2Stream device:
```
wget -O /tmp/bin/sftp-server -T 5 'http://10.1.1.22/a31/sftp-server'
chmod 777 /tmp/bin/sftp-server
```

Goal was to mount the Up2Stream device on my MacMini with sshfs:
```
sshfs -C -o volname=up2stream -p 22 -o allow_other -o sftp_server=/tmp/bin/sftp-server admin@10.1.1.52:/ ~/Volumes/up2stream
```

-> segmentation fault for sftp server!

tried older version from Barrier Breaker, but got the same error.
https://archive.openwrt.org/barrier_breaker/14.07/ramips/mt7620n/packages/packages/

there are also packages for newer version available:
https://downloads.openwrt.org/releases/18.06.8/targets/ramips/mt76x8/

Some useful utilites that I've tried, e.g. readelf, file and strings:
```
# download binutils_2.24-3_ramips_24kec.ipk
mkdir binutils_2.24-3_ramips_24kec
cd binutils_2.24-3_ramips_24kec
tar zxpvf ../binutils_2.24-3_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz

# on Up2Stream device:
wget -O /tmp/readelf -T 5 'http://10.1.1.22/a31/readelf';/bin/chmod 777 /tmp/readelf

# download libbfd_2.24-3_ramips_24kec.ipk
mkdir libbfd_2.24-3_ramips_24kec
cd libbfd_2.24-3_ramips_24kec
tar zxpvf ../libbfd_2.24-3_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz

# on Up2Stream device:
wget -O /tmp/libbfd-2.24.so -T 5 'http://10.1.1.22/a31/libbfd-2.24.so';/bin/chmod 777 /tmp/libbfd-2.24.so

# download file_5.25-1_ramips_24kec.ipk
mkdir file_5.25-1_ramips_24kec
cd file_5.25-1_ramips_24kec
tar zxpvf ../file_5.25-1_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz

# on Up2Stream device:
wget -O /tmp/file -T 5 'http://10.1.1.22/a31/file';/bin/chmod 777 /tmp/file

# on Up2Stream device:
wget -O /tmp/strings -T 5 'http://10.1.1.22/a31/strings';/bin/chmod 777 /tmp/strings
```
Here are some code snippets from a script on the device (can't remember any details). It looks that the commands for NTP are not working anymore, also the commands to switch power for the WiFi interface off:
```
srv=`nvram_get 2860 NTPServerIP`
sync=`nvram_get 2860 NTPSync`
tz=`nvram_get 2860 TZ`
nvram_set 2860 TZ 

nvram_set 2860 RadioOn 0
nvram_set 2860 ApCliEnable 0
--> blinking LED, but apcli0 and ra0 still enabled after reboot

nvram_set 2860 TxPower 0 or 1
--> no effect
```
You can turn the WiFi interface and the internal access point off with the following commands:
```
ifconfig ra0 down
ifconfig apcli0 down
```