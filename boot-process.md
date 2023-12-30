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


Example to download the tools from the OpenWRT version Chaos Calmer:
-----------------------------------------------
uboot-envtools_2014.10-2_ramips_24kec.ipk

mkdir uboot-envtools_2014.10-2_ramips_24kec
cd uboot-envtools_2014.10-2_ramips_24kec
tar zxpvf ../uboot-envtools_2014.10-2_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz

wget -O /tmp/fw_printenv -T 5 'http://10.1.1.22/a31/fw_printenv';/bin/chmod 777 /tmp/fw_printenv
ln -s /tmp/fw_printenv /tmp/fw_setenv

curl 'https://archive.openwrt.org/chaos_calmer/15.05.1/ramips/mt7628/packages/base/dmesg_2.25.2-4_ramips_24kec.ipk' -o dmesg_2.25.2-4_ramips_24kec.ipk
mkdir dmesg_2.25.2-4_ramips_24kec
cd dmesg_2.25.2-4_ramips_24kec
tar zxpvf ../dmesg_2.25.2-4_ramips_24kec.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz
open .
# copy ./usr/sbin/dmesg to your webserver, e.g. /Library/WebServer/Documents/a31
on Up2Stream device:
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

install dd from busybox and scp from dropbear package, then

dd if=/dev/mtd1 of=/tmp/mtd1.cp bs=512 count=128000 skip=0
scp -v -S /tmp/bin/dbclient /tmp/mtd1.cp pi@10.1.1.40:mtd1.cp
rm /tmp/mtd1.cp

--> size 0x30000 = 196608 bytes. The command above tries to copy more data, so the whole mtd1 partition is copied.

mtd1: 00030000 00010000 "Bootloader" - no environment variables
mtd2: 00010000 00010000 "Config" - from 0x2000 to 0x6000
mtd3: 00010000 00010000 "Factory"
mtd4: 00200000 00010000 "bkKernel"
mtd5: 001df508 00010000 "Kernel"
mtd6: 00950af8 00010000 "RootFS"
mtd7: 00b30000 00010000 "Kernel_RootFS"
mtd8: 00080000 00010000 "user"
mtd9: 00200000 00010000 "user2"

mkdir /var/lock

create file /etc/fw_env.config 
with
# MTD device name       Device offset   Env. size       Flash sector size
/dev/mtd2 0x02000 0x4000 0x4000

before setting the correct values:
/tmp/fw_printenv
Warning: Bad CRC, using default environment
bootcmd=bootp; setenv bootargs root=/dev/nfs nfsroot=${serverip}:${rootpath} ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}::off; bootm
bootdelay=5
baudrate=115200

with settings from above:
# fw_printenv
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

# show contents of NVRAM
ralink_init show 2860

--> similar output

code snippet from a script:
srv=`nvram_get 2860 NTPServerIP`
sync=`nvram_get 2860 NTPSync`
tz=`nvram_get 2860 TZ`
nvram_set 2860 TZ 


nvram_set 2860 RadioOn 0
nvram_set 2860 ApCliEnable 0

--> blinking LED, but apcli0 and ra0 still enabled after reboot

nvram_set 2860 TxPower 0 or 1

--> no effect

 The environment is usually at the end of the uboot partition.

