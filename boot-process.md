# Reverse Engineering of boot process
Connect Pins from A31 module board to USB-to-Serial Board (FT232R) - Pin 24 RX, 25 TX, 28 GND

Output with 57600 (after boot up)
```
AXX+MUT+001
AXX+BOT+DON
AXX+BOT+UP0
AXX+MUT+000
AXX+MIC+000
AXX+MCU+RDY
AXX+GET+RTC
AXX+VOL+GET
AXX+CHN+GET
AXX+MCU+VER
AXX+PLM+GET
AXX+ETH+001
AXX+WWW+001
AXX+STA+002
AXX+STA+001
AXX+WWW+001
AXX+WWW+001
AXX+SET+RTC20201227223359&
AXX+SET+WEK0&
AXX+NXT+ALS-1&
```
--> This is the communication between the WiFi module and the MCU

## Installing tools
Guide to Mediatek development board LinkIt Smart 7688 that has the same SoC:
https://docs.labs.mediatek.com/resource/linkit-smart-7688/en/tutorials/firmware-and-bootloader/bootloader-and-kernel-console

The Bootloader console and Linux kernel console are configured to serial port UART2 (P8/UART_TXD2 and P9/UART_RXD2) at a baud rate of 57600.

--> This is specific for the Mediatek development board, but not the Linkplay A31 module!

Tools were also available from https://docs.labs.mediatek.com/resource/linkit-smart-7688/en/downloads

> **Note:**
> The links listed above seem not to work anymore and are redirected to a Chinese web site.

I was able to download a firmware image (lks7688.img) version 0.9.4 and extract a binary of "**_busybox_**" with **_binwalk_**. You may download the binary from here or use a similar version from the Open WRT archive, see below.

> **Note:**
> The busybox tool from the A31 module is a reduced version that does not contain many tools, not even a telnetd anymore!


Binary files are available from Open WRT archive, (Chaos Calmer) v15.05 and v15.05.1:
https://archive.openwrt.org/chaos_calmer/15.05/ramips/mt7628/packages/base/
and
https://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7628/packages/

Here's an example how to download a package from the Open WRT archive and get the binaries from it to show the environment. The commands were executed from a terminal window on my MacBook:
```
cd ~/Downloads
curl 'https://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7628/packages/base/uboot-envtools_2014.10-2_ramips_24kec.ipk' -o uboot-envtools_2014.10-2_ramips_24kec.ipk
mkdir uboot-envtools_2014.10-2_ramips_24kec
cd uboot-envtools_2014.10-2_ramips_24kec
tar zxpvf ../uboot-envtools_2014.10-2_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz
# copy dropbear binary to a subdirectory on your webserver
cp usr/sbin/fw_printenv /Library/WebServer/Documents/a31/
# you may open finder to search for additional information in the package
open .
```
In the next step you can you can download and install the tool on the Up2Stream device (telnetd already installed):
``` 
cd /tmp
mkdir /tmp/bin
wget -O /tmp/bin/fw_printenv -T 5 'http://10.1.1.22/a31/fw_printenv'
chmod 777 /tmp/bin/fw_printenv
ln -s /tmp/bin/fw_printenv /tmp/bin/fw_setenv
```
and the same for dmesg:
```
cd ~/Downloads
curl 'https://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7628/packages/base/dmesg_2.25.2-4_ramips_24kec.ipk' -o dmesg_2.25.2-4_ramips_24kec.ipk
mkdir dmesg_2.25.2-4_ramips_24kec
cd dmesg_2.25.2-4_ramips_24kec
tar zxpvf ../dmesg_2.25.2-4_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz
cp ./usr/sbin/dmesg /Library/WebServer/Documents/a31
```
Installit on the Up2Stream device and dig for some useful information:
```
wget -O /tmp/dmesg -T 5 'http://10.1.1.22/a31/dmesg';/bin/chmod 777 /tmp/dmesg

cat /proc/version
Linux version 2.6.36+ (linkplay@linkplay-build-2) (gcc version 4.6.4 (Buildroot 2013.11) ) #1 Thu Feb 20 11:45:09 CST 2020

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

# dmesg
[    0.000000] Linux version 2.6.36+ (linkplay@linkplay-build-2) (gcc version 4.6.4 (Buildroot 2013.11) ) #1 Thu Feb 20 11:45:09 CST 2020
...
[    0.000000] Kernel command line: console=ttyS1,57600n8 root=/dev/mtdblock6
...
[    0.444000] flash manufacture id: ef, device id 40 18
[    0.456000] W25Q128BV(ef 40180000) (16384 Kbytes)
[    0.464000] mtd .name = raspi, .size = 0x01000000 (16M) .erasesize = 0x00010000 (64K) .numeraseregions = 0
[    0.484000] user1 00d80000 - 00e00000  size 00080000
[    0.492000] user2 00e00000 - 01000000  size 00200000
[    0.504000] Creating 10 MTD partitions on "raspi":
[    0.512000] 0x000000000000-0x000001000000 : "ALL"
[    0.524000] 0x000000000000-0x000000030000 : "Bootloader"
[    0.532000] ===========check_rootfs offset=42f4c8 i=64, ret=0  ==============
[    0.548000] name:Wiimu Rootfs
[    0.552000] ih_time:0x9e024e5e
[    0.560000] ih_magic:0x56190527
[    0.564000] ih_hcrc:0xb7e4affc
[    0.572000] ih_size:6569984 Bytes
[    0.580000] ih_dcrc:0x509122d0
[    0.584000] os=6, arch=5, type=7, comp=1
[    0.592000] ih_ksz:0x00000000


[    0.604000] 0x000000030000-0x000000040000 : "Config"
[    0.616000] 0x000000040000-0x000000050000 : "Factory"
[    0.624000] 0x000000050000-0x000000250000 : "bkKernel"
[    0.636000] 0x000000250000-0x00000042f508 : "Kernel"
[    0.648000] mtd: partition "Kernel" doesn't end on an erase block -- force read-only
[    0.664000] 0x00000042f508-0x000000d80000 : "RootFS"
[    0.672000] mtd: partition "RootFS" doesn't start on an erase block boundary -- force read-only
[    0.692000] 0x000000250000-0x000000d80000 : "Kernel_RootFS"
[    0.700000] 0x000000d80000-0x000000e00000 : "user"
[    0.712000] 0x000000e00000-0x000001000000 : "user2"
...

# cat -n /proc/kmsg
<5>[    0.000000] Linux version 2.6.36+ (linkplay@linkplay-build-2) (gcc version 4.6.4 (Buildroot 2013.11) ) #1 Mon Jun 22 15:40:26 CST 2020
<4>[    0.000000]
<4>[    0.000000]  The CPU feqenuce set to 575 MHz
<4>[    0.000000]
<4>[    0.000000]  MIPS CPU sleep mode enabled.
<6>[    0.000000] CPU revision is: 00019655 (MIPS 24Kc)
<6>[    0.000000] Software DMA cache coherency
<6>[    0.000000] Determined physical RAM map:
<6>[    0.000000]  memory: 04000000 @ 00000000 (usable)
<4>[    0.000000] Zone PFN ranges:
<4>[    0.000000]   Normal   0x00000000 -> 0x00004000
...
<6>[    0.284000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
<6>[    0.296000] JFFS2 version 2.2 (NAND) (ZLIB) (RTIME) (c) 2001-2006 Red Hat, Inc.
<6>[    0.312000] fuse init (API version 7.15)
...
<4>[    0.444000] flash manufacture id: ef, device id 40 18
<4>[    0.456000] W25Q128BV(ef 40180000) (16384 Kbytes)
<4>[    0.464000] mtd .name = raspi, .size = 0x01000000 (16M) .erasesize = 0x00010000 (64K) .numeraseregions = 0
<4>[    0.484000] user1 00d80000 - 00e00000  size 00080000
<4>[    0.492000] user2 00e00000 - 01000000  size 00200000
<5>[    0.504000] Creating 10 MTD partitions on "raspi":
<5>[    0.512000] 0x000000000000-0x000001000000 : "ALL"
<5>[    0.524000] 0x000000000000-0x000000030000 : "Bootloader"
<4>[    0.532000] ===========check_rootfs offset=42f3be i=64, ret=0  ==============
<4>[    0.548000] name:Wiimu Rootfs
<4>[    0.552000] ih_time:0x7b62f05e
<4>[    0.560000] ih_magic:0x56190527
<4>[    0.564000] ih_hcrc:0xc82acb88
<4>[    0.572000] ih_size:6529024 Bytes
<4>[    0.580000] ih_dcrc:0x39e11b49
<4>[    0.584000] os=6, arch=5, type=7, comp=1
<4>[    0.592000] ih_ksz:0x00000000
<4>[    0.592000]
<4>[    0.592000]
<5>[    0.604000] 0x000000030000-0x000000040000 : "Config"
<5>[    0.616000] 0x000000040000-0x000000050000 : "Factory"
<5>[    0.624000] 0x000000050000-0x000000250000 : "bkKernel"
<5>[    0.636000] 0x000000250000-0x00000042f3fe : "Kernel"
<4>[    0.648000] mtd: partition "Kernel" doesn't end on an erase block -- force read-only
<5>[    0.664000] 0x00000042f3fe-0x000000d80000 : "RootFS"
<4>[    0.672000] mtd: partition "RootFS" doesn't start on an erase block boundary -- force read-only
<5>[    0.692000] 0x000000250000-0x000000d80000 : "Kernel_RootFS"
<5>[    0.700000] 0x000000d80000-0x000000e00000 : "user"
<5>[    0.712000] 0x000000e00000-0x000001000000 : "user2"
<4>[    0.724000] rdm_major = 253
<4>[    0.728000] GMAC1_MAC_ADRH -- : 0x00000022
<4>[    0.736000] GMAC1_MAC_ADRL -- : 0x6c25402b
<4>[    0.744000] Ralink APSoC Ethernet Driver Initilization. v3.1  256 rx/tx descriptors allocated, mtu = 1500!
<4>[    0.772000] get_rootfs_checked_flag = 1
<4>[    0.780000] this is not first bootup, ignore check rootfs
<4>[    0.788000] GMAC1_MAC_ADRH -- : 0x00000022
<4>[    0.796000] GMAC1_MAC_ADRL -- : 0x6c25402b
<1>[    0.804000] PROC INIT OK!
<4>[    0.816000]
...
```
Install **_dd_** from busybox and **_scp_** from dropbear package (see **_Enable Telnet_** section to install **_busybox_** and **_Hardware and Firmware_** section to install **dropbear**), then
```
# tools included in busybox just need a symbolic link with their name
ln -s /tmp/bin/busybox /tmp/bin/dd
## copy mtd1 to a file and save for future use
dd if=/dev/mtd1 of=/tmp/mtd1.img bs=512 count=128000 skip=0
scp -v -S /tmp/bin/dbclient /tmp/mtd1.img pi@10.1.1.40:mtd1.img
rm /tmp/mtd1.img
```
--> size 0x30000 = 196608 bytes. The command above tries to copy more data, so the whole mtd1 partition is copied. See **_cat /proc/mtd_** from above for details. 

Create the file **_/etc/fw_env.config_** with the following content, e.g. with vi: 
```
cat <<\EOF > /etc/fw_env.config 
# MTD device name       Device offset   Env. size       Flash sector size
/dev/mtd2 0x02000 0x4000 0x4000
EOF
mkdir /var/lock
```
Before setting the correct values for the size the following error is shown:
```
fw_printenv
Warning: Bad CRC, using default environment
bootcmd=bootp; setenv bootargs root=/dev/nfs nfsroot=${serverip}:${rootpath} ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}::off; bootm
bootdelay=5
baudrate=115200
```
With the correct settings from above you get a list with all environment variables. These values are stored in NVRAM, so they will survive a reboot:
```
fw_printenv
WebInit=1
HostName=wiimu
OperationMode=3
Platform=MT7628
wanConnectionMode=DHCP
wan_ipaddr=192.168.1.1
wan_netmask=255.255.255.0
wan_gateway=192.168.1.254
wan_primary_dns=168.95.1.1
wan_secondary_dns=8.8.8.8
wan_l2tp_server=l2tp_server
wan_l2tp_mode=0
wan_l2tp_ip=192.168.1.1
wan_l2tp_netmask=255.255.255.0
wan_l2tp_gateway=192.168.1.254
wan_pptp_server=pptp_server
wan_pptp_mode=0
wan_pptp_ip=192.168.1.1
wan_pptp_netmask=255.255.255.0
wan_pptp_gateway=192.168.1.254
lan_ipaddr=10.10.10.254
lan_netmask=255.255.255.0
dhcpEnabled=1
dhcpStart=10.10.10.100
dhcpEnd=10.10.10.200
dhcpMask=255.255.255.0
dhcpPriDns=168.95.1.1
dhcpSecDns=8.8.8.8
dhcpGateway=10.10.10.254
dhcpLease=86400
stpEnabled=0
lltdEnabled=0
igmpEnabled=0
natEnabled=1
IPPortFilterEnable=0
PortForwardEnable=0
MacFilterEnable=0
DefaultFirewallPolicy=1
DMZEnable=0
CountryRegion=1
CountryRegionABand=7
CountryCode=DE
BssidNum=1
SSID1=SoundSystem_305D
WirelessMode=9
TxRate=0
Channel=11
BasicRate=15
BeaconPeriod=100
DtimPeriod=1
TxPower=100
DisableOLBC=0
BGProtection=0
TxPreamble=0
RTSThreshold=2347
FragThreshold=2346
TxBurst=1
PktAggregate=1
TurboRate=0
WmmCapable=1
APAifsn=3;7;1;1
APCwmin=4;4;3;2
APCwmax=6;10;4;3
APTxop=0;0;94;47
APACM=0;0;0;0
BSSAifsn=3;7;2;2
BSSCwmin=4;4;3;2
BSSCwmax=10;10;4;3
BSSTxop=0;0;94;47
BSSACM=0;0;0;0
AckPolicy=0;0;0;0
APSDCapable=0
DLSCapable=0
NoForwarding=0
NoForwardingBTNBSSID=0
HideSSID=0
ShortSlot=1
AutoChannelSelect=0
SecurityMode=0
VLANEnable=0
VLANID=0
VLANPriority=0
WscConfMode=0
WscConfStatus=2
WscAKMP=1
WscConfigured=0
WscModeOption=0
WscActionIndex=9
WscRegResult=1
WscUseUPnP=1
WscUseUFD=0
WscSSID=RalinkInitialAP
WscKeyMGMT=WPA-EAP
WscConfigMethod=138
WscAuthType=1
WscEncrypType=1
WscNewKey=scaptest
IEEE8021X=0
IEEE80211H=0
CSPeriod=6
PreAuth=0
AuthMode=WPAPSKWPA2PSK
EncrypType=AES
RekeyInterval=3600
RekeyMethod=DISABLE
PMKCachePeriod=10
WPAPSK1=Plattfisch
DefaultKeyID=1
Key1Type=0
Key2Type=0
Key3Type=0
Key4Type=0
HSCounter=0
HT_HTC=1
HT_RDG=0
HT_LinkAdapt=0
HT_OpMode=0
HT_MpduDensity=5
HT_EXTCHA=1
HT_BW=0
HT_AutoBA=1
HT_BADecline=0
HT_AMSDU=0
HT_BAWinSize=64
HT_GI=1
HT_STBC=1
HT_MCS=33
HT_PROTECT=1
HT_MIMOPS=3
HT_40MHZ_INTOLERANT=0
HT_TxStream=1
HT_RxStream=1
HT_DisallowTKIP=1
HT_BSSCoexistence=0
NintendoCapable=0
AccessPolicy0=0
AccessPolicy1=0
AccessPolicy2=0
AccessPolicy3=0
WdsEnable=0
WdsEncrypType=NONE
WirelessEvent=0
RADIUS_Port=1812
RADIUS_Acct_Port=1813
session_timeout_interval=0
idle_timeout_interval=0
RadioOn=1
Login=admin
Password=admin
WAN_MAC_ADDR=0:22:6C:14:30:60

CAP_STREAMS=fffffbfe
CAP_PLM=6
Private_PrjName=RP0011_WB60_S
wiimuLanguage=en_us
LangInit=1
PresetNumber=10
CAP_CAP1=305200
CAP_CAP2=28490a00
ALI_PRJ_ID=RAKOIT_MA1
MaxPromptVolume=50
upnp_manufacture=RAKOIT
upnp_manufacture_url=https://www.rakoit.com/
upnp_model_name=Up2Stream AMP
upnp_model_url=https://www.rakoit.com/
upnp_model_description=RAKOIT Wi-Fi Sound System
SPOTIFY_TYPE=1
SPOTIFY_NAME=RP0011_WB60_S
SPOTIFY_BRAND=RAKOIT
SPOTIFY_NAME_DISPLAY=SoundSystem
SPOTIFY_BRAND_DISPLAY=RAKOIT
SPOTIFY_PRODUCT_ID=0
CAP_MPTV=0
CAP_ALINK=0
SSID_CONFIRM=1
FIRST_BOOTUP=0
mvProductId=RP0011_WB60_S
mvHardwareVersion=WiiMu-A31
mv_uuid=FF31F09E2BE2384A4E6CF9BB
upnp_uuid=uuid:FF31F09E-2BE2-384A-4E6C-F9BBFF31F09E
rootfs_checked=1
TIME_ZONE=1.0
GroupName=Lab
DeviceName=Lab
part_ver_kernel=8827
silenceOTA=1
SoftEQ=1
EQ_Bass=2
EQ_Treble=1
Prompt=1
AudioCH=0
NTPValid=1
DefaultPassword=1
SSID_HIDE=2
TZ=CET-1CEST,M3.5.0,M10.5.0/3
WpsApCliSsid=
WpsApCliWPAPSK=4B61726C4172736368
WpsApCliAuthMode=WPA2PSK
WpsApCliEncrypType=AES
WpsApCliChannel=6
ApCliEnable=1
ApCliSsid=4D656C626F75726E65
ApCliWPAPSK=5265645365613230303521
ApCliAuthMode=WPA2PSK
ApCliEncrypType=AES
ApCliChannel=6

# a similar output will provide
ralink_init show 2860
```
To read a specific variable from NVRAM or modify its value use these commands:
```
nvram_get 2860 HostName
nvram_get 2860 lan_ipaddr
nvram_get 2860 lan_netmask

# displays password admin and sets a new one
nvram_get 2860 Password
nvram_set Password newpassword
```

The commands are located here:
```
cd /bin
ls l
...
-rwxrwxr-x    1 1000     1000        33220 ralink_init
lrwxrwxrwx    1 1000     1000           11 nvram_set -> ralink_init
lrwxrwxrwx    1 1000     1000           11 nvram_get -> ralink_init
-rwxrwxr-x    1 1000     1000         7800 nvram_daemon
...
```

I found a documentation for these commands:
```
Usage:
a. get: nvram_get [<2860/rtdev>] <field>
b. set: nvram_set [<2860/rtdev>] <field>
c. init: ralink_init <command> [<platform>] [<file>]

<Commands>:
 rt2860_nvram_show    (display rt2860 values in nvram)
 rtdev_nvram_show     (display rtdev values in nvram)
 show                 (display values in nvram for <platform>)
 gen                  (generate config file from nvram for <platform> - does not work)
 renew                (replace nvram values for <platform> with <file>)
 clear                (??? clear all entries in nvram for - found in a different documentation)
<Platform>:
 2860 - rt2860 station or the first Wi-Fi interface
 rtdev - intelligent nic or the second Wi-Fi interface (not available for Linkplay A31)
<File>: File name for renew command

Example:
a. nvram_get 2860 SSID               /* get the SSID */
b. nvram_set 2860 SSID ralink        /* set the SSID to ralink */
c. ralink_init gen 2860              /* generate the RT2860 .dat file from NVRAM */
d. ralink_init show 2860             /* display the INIC configurations in NVRAM */
e. ralink_init renew 2860 ra.dat     /* set NVRAM values for RT2860 platform according to ra.dat file */
f. nvram_daemon &                    /* start the nvram_daemon */
```
