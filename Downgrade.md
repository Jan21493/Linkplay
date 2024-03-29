# Downgrade Firmware
In recent versions Arylic has fixed several vulnerabilities and I have not found a way to "hack" into the CLI anymore. Telnet acces was still possible with version 4.2.8020 from 2020/02/20 (20th of Feb 2020) that was installed when I had bought the first devices.

The following information is specific for Arylic Up2Stream Amp v2 and Up2Stream Pro v3, but might also helpful for other devices, especially if they are also based on the Linkplay A31 module.

## Firmware Upgrade
Before we are able to downgrade the software, it is important to understand how the firmware upgrade process works.

The URL to the upgrade server can be retrieved via API:
```
curl 'http://10.1.1.38/httpapi.asp?command=GetUpdateServer'
# my device responds with: http://silenceota.linkplay.com/wifi_audio_image
```
You should also get the product ID (called 'project') that is used on your Linkplay device:
```
curl -s 'http://10.1.1.38/httpapi.asp?command=getStatusEx' | jq
{
  "uuid": "FF31F09E2B9A872D18C05AAD",
  "DeviceName": "Mel Luca",
  "GroupName": "Mel Luca",
  "ssid": "Music",
  "language": "en_us",
  "firmware": "4.6.415145",
  "hardware": "A31",
  "build": "release",
  "project": "RP0011_WB60",
  "priv_prj": "RP0011_WB60",
  "project_build_name": "a31rakoit",
  "Release": "20220427",
  ...
}
```

With Wireshark I have sniffed how the upgrade process is working and which files are required. At first the device gets a list of all (or at least many) Linkplay products 
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/products.xml 
```
The XML file contains a list of products with their ID and more, including an URL for specific information. The example contains the two devices listed above (list was retrieved in Oct 2020):
```
<productList>
...
<product>
  <productid>RP0011_WB60</productid>
  <hardwareversion>WiiMu-A31</hardwareversion>
  <UUID>FF31F09E</UUID>
  <major-url>http://ota.rakoit.com/release/RP0011_WB60/product.xml</major-url>
</product>
...
</productList>
```

The following table lists some of the IDs
| Product ID  | Description |
| --------------- | ------------- |
| RP0011_WB60 | Arylic WiFi and Bluetooth 5.0 HiFi Stereo Amplifier Board Up2Stream Amp 2.0 (the pcb on my board shows version 1.1)|
| RP0011_WB60_S | Arylic newer internal version of Up2Stream Amp v2.0 |
| RP0016_S50PRO_S | Arylic S50 Pro  |
| UP2STREAM_PRO_V3 | Arylic Up2Stream Pro v3 |

There are other download sites for other products. You may try:
```
https://awsota.linkplay.com/wifi_audio_image/products.xml
http://silenceota.linkplay.com/wifi_audio_image_v2/products.xml
https://old-ota-redirect.linkplay.co/wifi_audio_image/products.xml
http://old-ota-redirect.linkplay.co/wifi_audio_image_7688/
```
In the next step the player downloads the specific XML file for its own product ID, e.g. for an older Arylic Up2Stream Amp from the ***\<major-url\>*** that is matching the product ID.

```
curl -O http://ota.rakoit.com/release/RP0011_WB60/product.xml
```
> **Note:**
> In previous versions the ***product.xml*** was also retrieved from silenceota.linkplay.com/wifi_audio_image and stored in the same directory as the images below.

The example was downloaded in Oct 2020:
```
<?xml version="1.0" encoding="ISO-8859-1"?>
<product>
  <major-version>20201026</major-version>
  <sign>cfcf8f10e461c886ef39212d666b5492</sign>
  <md5-url>http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/md5.txt</md5-url>
  <ver-url>http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/MVver_20201026</ver-url>
  <layout-url>http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/layout</layout-url>
  <image-uboot>http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/uboot_v632.img</image-uboot>
  <image-backup>http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/backup_new_v1141.img</image-backup>
  <image-kernel>http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/a31rakoit_new_uImage_20201026</image-kernel>
  <image-user>http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/user.jffs2</image-user>
  <image-user2>http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/user2.jffs2</image-user2>
  <project>
    <name>RP0011_WB60</name>
    <mcu-ver>24</mcu-ver>
    <mcu-size>672498</mcu-size>
    <mcu-image>http://ota.rakoit.com/release/RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin</mcu-image>
  </project>
</product>
```
The URLs include a "random" ID that might be mapped to the product ID and a subdirectory with the version (date) for some files. The MCU files follow a different structure with the product ID used as a subdirectory  and a version number that is included in the name of the image.
| XML ID  | Subdirectory | Description |
| --------------- | ------------- | ------------- |
| \<md5-url\> | major-version | plain text file with MD5 checksums for image files (uBoot, backup, user2, kernel)  |
| \<ver-url\> | major-version | plain text file with version information and release date |
| \<layout-url\> | major-version | plain text file with layout (e.g. offset, size, version, fstype, name, size) of file system in flash (user2, user, kernel) |
| \<image-kernel\> | major-version | main binary image for kernel |
| \<image-user\> | major-version | image for user file system (persistent) - not available for download |
| \<image-user2\> | major-version | image for user file system (persistent) - not available for download |
| \<image-uboot\> | - | boot loader uBoot |
| \<image-backup\> | - | backup image |

I'm not sure if the **\<sign\>** tag is used at all and what is covered with that 'signature'. I've modified the URLs (different FQDN and path) and got no error. Only the following files are downloaded during an upgrade and in that order (verified with Up2Stream Amp v2.0 and Wireshark):
| URL | Description |
| --------------- | ------------- |
| http://silenceota.linkplay.com/wifi_audio_image/products.xml | List of all Linkplay products in XML format with infos and URL |
| http://ota.rakoit.com/release/RP0011_WB60/product.xml | Infos and URLs for images for a specific Linkplay product |
| http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/MVver_20201026 | Version information |
| http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/layout | Layout of file system in flash |
| http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/a31rakoit_new_uImage_20201026 | main image |

The other images, e.g. uBoot loader (was already installed), user and user2 images were not downloaded during the downgrade process.

> **Note:**
> If an upgrade is available, it may be installed automatically without any notice! In the 4Stream app you might see that a new version is highlighted with "new" and you might get a popup with a notification. I have not found out, when an update is installed automatically. 

## Firmware Downgrade v4.2
To be able to downgrade the firmware you need to modify DNS names, e.g. you may install dnsmasq on your local network and point to that DNS server from your DHCP server. To redirect the firmware up-/downgrade process to your own webserver, you can create a simple file in the /etc/dnsmasq.d directory with the following content (10.1.1.22 is the IP address of my webserver located on my MacMini)

The downgrade needs to be adjusted for newer versions, e.g. v4.6.415145, release date 20220427". If you have a device with that version, continue to read section 
[Firmware Downgrade from v4.6](Downgrade.md#firmware-downgrade-v46)below.

The following records were added on the DNS server:
```
cat /etc/dnsmasq.d/linkplay.conf
address=/silenceota.linkplay.com/10.1.1.22
address=/ota.rakoit.com/10.1.1.22
```
Restart dnsmasq after any changes:
```
/etc/init.d/dnsmasq restart
```
You may modify the configuration file on your webserver to use different folders for different FQDNs. Be sure to verify any URLs from a web browser or curl. On your PC you may manually point to a public DNS server to be able to download XML files and images from the Internet.

> **Note:**
> The modification of the two FQDNs will prevent any further updates!

Here it is documented from v4.2.8826 to v4.2.8020. To get information about the product ID (project), the current version and release date you can use the "getStatusEx" command. The following output is "enhanced" / beautified with the tool "jq" (JSON processor):

```
curl -s 'http://10.1.1.52/httpapi.asp?command=getStatusEx' | jq
{
  "language": "en_us",
  "ssid": "SoundSystem_305D",
  ...
  "firmware": "4.2.8826",
  "build": "release",
  "project": "RP0011_WB60_S",
  "priv_prj": "RP0011_WB60_S",
  "project_build_name": "a31rakoit",
  "Release": "20201026",
```

At first you have to download the following XML files, install them in the appropriate directory on your webserver (you may keep the path and create the directories as required). 

> **Important:**
> There is no link to older version available. The ***products.xml*** file only contains URLs for the latest version, so you need to know (or guess) the URL for the specific ***product.xml*** file. The following URL is working for the Up2Stream Amp v2 and partially also for the Up2Stream Pro v3 (without MCU). I've added the URL for the ***products.xml*** file to the Wayback archive (https://web.archive.org) on Dec 31th 2023, so it does not work for older versions.

The ***products.xml*** file that has been archived on 20231231 can be retrieved here:
```
curl https://web.archive.org/web/20231231141235/http://silenceota.linkplay.com/wifi_audio_image/products.xml
```

At first you can download the actual ***products.xml*** file, remove everything except your products, adjust the URLs (optionally) and install it on your web server:
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/products.xml
```

Next you download the specific ***product.xml*** file. The following URL is for the RP0011_WB60_S product ID, but except for the MCU all images look to be the same as for product ID RP0011_WB60, UP2STREAM_PRO_V3, and others. I'm not sure, but all devices with the Linkplay A31 module might use the same firmware. You may download and compare the RP0011_WB60_S product below with your device (including MD5 checksums) and replace MCU part show below with the one from your device. It looks that older versions of the ***product.xml*** files and images are still available for download - you just need to know (or guess) the URLs.

> **Important:**
> I do not take responsibilities for results or consequences. You might damage your device! Do not try to downgrade your device if you are unsure!

The following URL is for product ID RP0011_WB60_S:
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/product.xml
```
Here is a copy from the file with version 4.2.8020, release date 0200220 for reference:
```
<?xml version="1.0" encoding="ISO-8859-1" ?>
<product>
  <major-version>20200220</major-version>
  <sign>27178fb574eafbdab8e1493a1569dd36</sign>
  <md5-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/md5.txt</md5-url>
  <ver-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/MVver</ver-url>
  <layout-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/layout</layout-url>
  <image-uboot>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/uboot_v632.img</image-uboot>
  <image-backup>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/backup_new_v1141.img</image-backup>
  <image-kernel>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/a31rakoit_new_uImage</image-kernel>
  <image-user>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/user.jffs2</image-user>
  <image-user2>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/user2.jffs2</image-user2>


<project>
<name>RP0011_WB60_S</name>
<mcu-ver>0022</mcu-ver>
<mcu-size>670246</mcu-size>
<mcu-image>http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0011_WB60_S/RP0011_WB60_S0022.mcu.bin</mcu-image>
</project>
</product>
```

Modify the <major-version> in the ***product.xml*** file to be one day ahead of your current release date, e.g. 20201027 if your current release date is 20201026. You may also combine the content with a different MCU (project). Be sure that the project name is exactly matching your device!
```
<?xml version="1.0" encoding="ISO-8859-1" ?>
<product>
 <major-version>20201027</major-version>
 <sign>27178fb574eafbdab8e1493a1569dd36</sign>
 <md5-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/md5.txt</md5-url>
 <ver-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/MVver</ver-url>
 <layout-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/layout</layout-url>
 <image-uboot>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/uboot_v632.img</image-uboot>
 <image-backup>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/backup_new_v1141.img</image-backup>
 <image-kernel>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/a31rakoit_new_uImage</image-kernel>
 <image-user>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/user.jffs2</image-user>
 <image-user2>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/user2.jffs2</image-user2>
 <project>
  <name>RP0011_WB60_S</name>
  <mcu-ver>0022</mcu-ver>
  <mcu-size>670246</mcu-size>
  <mcu-image>http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0011_WB60_S/RP0011_WB60_S0022.mcu.bin</mcu-image>
 </project>
</product>
```
Download and install all files from the list above on your web server. 

Modifiy the version number in the ***MVver*** file (first line) to be higher than your current version number, e.g. WiiMu.4.2.8027 if your current version is 4.2.8826. 

Modify the release date in the ***MVver*** file (6th line) with the same date used in the previous step.

Here is an example of the modified  ***MVver*** file:
```
WiiMu.4.2.8827
WiiMu
WiiMu-A31
a31rakoit
release
20201027
customuuid=FF31F09E
```
Modify the version (ver, 4th column) in the ***layout*** file (4th line) with the same date used in the previous step (here 8827):
```
#offset :max_size:min_size:ver:flag:fstype:name:img_size
00e00000:00200000:00000040:00000000:2:jffs2:user2:00200000
00d80000:00080000:00000000:00000000:2:jffs2:user:1
00250000:00b30000:00000040:00008827:0:null:kernel:8533256
```

Trigger an update with the following commands and verify the progress with Wireshark running on your web server. You may use "http" as a filter to see the downgrade process:
```
curl -s 'http://10.1.1.52/httpapi.asp?command=getMvRemoteUpdateStartCheck'
curl -s 'http://10.1.1.52/httpapi.asp?command=getMvRemoteUpdateStatus'
```

## Firmware Downgrade v4.6
In newer versions it does not work to modifiy your DNS server to add a spoofed (local) IP address like 10.1.1.22 for silenceota.linkplay.com anymore. With Wireshark I was not able to see any http requests to the ***products.xml*** file from the Linkplay device. I'm not sure if that's due to the fact that this is a local IP address or spoofing is not allowed for silenceota.linkplay.com anymore. The following procedure has been tested with v4.6.415145, release date 2022/04/27.

To be able to prevent an automatic upgrade afterwards you need to modify DNS names or block specific DNS requests. You may either install dnsmasq on your local network and point to that DNS server from your DHCP server or block DNS requests from the Linkplay device to the Internet. To install dnsmasq follow instructions from the Internet, create a simple file in the /etc/dnsmasq.d directory with the following content (10.1.1.22 is the IP address of my webserver located on my MacMini)

The downgrade process seem only to work with plain IP addresses instead of DNS names in all config files and the SetUpdateServer command, so you may not need to run your own dnsmasq server, but you need to block DNS requests from the Linkplay devices to the Internet to prevent automatic upgrades afterwards.

The following records were created on the DNS server:
```
cat /etc/dnsmasq.d/linkplay.conf
address=/silenceota.linkplay.com/10.1.1.22
address=/ota.rakoit.com/10.1.1.22
address=/api.linkplay.com/10.1.1.22
```
Restart dnsmasq after any changes:
```
/etc/init.d/dnsmasq restart
```
You may modify the configuration file on your webserver to use different folders for different FQDNs. Be sure to verify any URLs from a web browser or curl. On your PC you may manually point to a public DNS server to be able to download XML files and images from the Internet.

> **Note:**
> Beside of your own DNS server (typically set by DHCP), the Linkplay devices also send DNS requests to ***8.8.8.8*** and ***8.8.4.4*** (the two Google DNS servers). The device also sends DNS requests with ***firehose.eu-central-1.amazonaws.com***, ***api.linkplay.com*** as names and asks for their IP addresses. You may need to block these requests on your Internet router or point to your local web server to prevent automatic updates later on. I've blocked any DNS requests on my Internet router (Fritz!box) by using a blocking list and adding DNS service to this list. Older version (v.4.2) send DNS requests with s000.linkplay.com and avs-alexa-na.amazon.com as a name. The DNS requests may be related to the music services that are available or configured on the device.

To get information about the product ID (project), the current version and release date you can use the ***"getStatusEx"*** command. The following output is "enhanced" / beautified with the tool "jq" (JSON processor):

```
curl -s 'http://10.1.1.58/httpapi.asp?command=getStatusEx' | jq
{
  "uuid": "FF31F09E2BE2384A4E6CF9BB",
  "DeviceName": "Sauna",
  ...
  "firmware": "4.6.415145",
  "hardware": "A31",
  "build": "release",
  "project": "RP0011_WB60_S",
  "priv_prj": "RP0011_WB60_S",
  "project_build_name": "a31rakoit",
  "Release": "20220427",
  ...
```

At first you have to download the following XML files, install them in the appropriate directory on your webserver (you may keep the path and create the directories as required). 

> **Important:**
> There is no link to older version available. The ***products.xml*** file only contains URLs for the latest version, so you need to know (or guess) the URL for the specific ***product.xml*** file. The following URL is working for the Up2Stream Amp v2 and partially also for the Up2Stream Pro v3 (without MCU). I've added the URL for the ***products.xml*** file to the Wayback archive (https://web.archive.org) on Dec 31th 2023, so it does not work for older versions.

The ***products.xml*** file that has been archived on 20231231 can be retrieved here:
```
curl https://web.archive.org/web/20231231141235/http://silenceota.linkplay.com/wifi_audio_image/products.xml
```

At first you can download the actual ***products.xml*** file, remove everything except your products, adjust the URLs (optionally) and install it on your web server:
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/products.xml
```

I've modified the FQDNs to point directly to the IP address of my web server and have only these three products in the list (only the 'product' in the middle with product ID ***RP0011_WB60_S*** is used in the example):
```
<?xml version="1.0" encoding="ISO-8859-1" ?>
<productList>
  <product>
    <productid>RP0011_WB60</productid>
    <hardwareversion>WiiMu-A31</hardwareversion>
    <UUID>FF31F09E</UUID>
    <major-url>http://10.1.1.22/linkplay/a31/RP0011_WB60/20200220/product.xml</major-url>
  </product>
  <product>
    <productid>RP0011_WB60_S</productid>
    <hardwareversion>WiiMu-A31</hardwareversion>
    <UUID>FF31F09E</UUID>
    <major-url>http://10.1.1.22/linkplay/a31/RP0011_WB60_S/20200220/product.xml</major-url>
  </product>
  <product>
    <productid>UP2STREAM_PRO_V3</productid>
    <hardwareversion>WiiMu-A31</hardwareversion>
    <UUID>FF31F09E</UUID>
    <major-url>http://10.1.1.22/linkplay/a31/UP2STREAM_PRO_V3/20200220/product.xml</major-url>
  </product>
</productList>
```

Next you download the specific ***product.xml*** file. The following URL is for the RP0011_WB60_S product ID, but except for the MCU all images look to be the same as for product ID RP0011_WB60, RP0011_WB60_S, UP2STREAM_PRO_V3, and others. I'm not sure, but all devices with the Linkplay A31 module might use the same firmware. You may download and compare the RP0011_WB60_S product below with your device (including MD5 checksums) and replace MCU part show below with the one from your device. It looks that older versions of the ***product.xml*** files and images are still available for download - you just need to know (or guess) the URLs.

> **Important:**
> I do not take responsibilities for results or consequences. You might damage your device! Do not try to downgrade your device if you are unsure!

The following URL is for product ID RP0011_WB60_S:
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/product.xml
```
Here is a copy from the file with version 4.2.8020, release date 0200220 for reference:
```
<?xml version="1.0" encoding="ISO-8859-1" ?>
<product>
  <major-version>20200220</major-version>
  <sign>27178fb574eafbdab8e1493a1569dd36</sign>
  <md5-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/md5.txt</md5-url>
  <ver-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/MVver</ver-url>
  <layout-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/layout</layout-url>
  <image-uboot>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/uboot_v632.img</image-uboot>
  <image-backup>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/backup_new_v1141.img</image-backup>
  <image-kernel>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/a31rakoit_new_uImage</image-kernel>
  <image-user>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/user.jffs2</image-user>
  <image-user2>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/user2.jffs2</image-user2>


<project>
<name>RP0011_WB60_S</name>
<mcu-ver>0022</mcu-ver>
<mcu-size>670246</mcu-size>
<mcu-image>http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0011_WB60_S/RP0011_WB60_S0022.mcu.bin</mcu-image>
</project>
</product>
```

Modify the <major-version> in the ***product.xml*** file to be one day ahead of your current release date, e.g. 20220428 if your current release date is 20220427. You may also combine the content with a different MCU (project). Be sure that the project name is exactly matching your device! As before I've also modified the FQDNs to point to my own domain and the subdirectory names to be more descriptive. The last two files with '.jffs2' are removed, because they were not available from the update server (actually they have an error message as a content that the file was not available).
```
<?xml version="1.0" encoding="ISO-8859-1" ?>
<product>
  <major-version>20220428</major-version>
  <sign>27178fb574eafbdab8e1493a1569dd36</sign>
  <md5-url>http://10.1.1.22/linkplay/a31/RP0011_WB60_S/20200220/md5.txt</md5-url>
  <ver-url>http://10.1.1.22/linkplay/a31/RP0011_WB60_S/20200220/MVver</ver-url>
  <layout-url>http://10.1.1.22/linkplay/a31/RP0011_WB60_S/20200220/layout</layout-url>
  <image-uboot>http://10.1.1.22/linkplay/RP0011_WB60_S/uboot_v632.img</image-uboot>
  <image-backup>http://10.1.1.22/linkplay/a31/RP0011_WB60_S/backup_new_v1141.img</image-backup>
  <image-kernel>http://10.1.1.22/linkplay/a31/RP0011_WB60_S/20200220/a31rakoit_new_uImage</image-kernel>
  <project>
    <name>RP0011_WB60_S</name>
    <mcu-ver>0022</mcu-ver>
    <mcu-size>670202</mcu-size>
    <mcu-image>http://10.1.1.22/linkplay/a31/RP0011_WB60_S/RP0011_WB60_S0022.mcu.bin</mcu-image>
  </project>
</product>
```
Download and install all files from the list above (from the original server!) on your web server in the appropriate directories.

Modifiy the version number in the ***MVver*** file (first line) to be higher than your current version number, e.g. WiiMu.4.6.415146 if your current version is 4.6.415145. 

Modify the release date in the ***MVver*** file (6th line) with the same date used in the previous step.

Here is an example of the modified  ***MVver*** file:
```
WiiMu.4.6.415146
WiiMu
WiiMu-A31
a31rakoit
release
20220428
customuuid=FF31F09E
```
Modify the version (ver, 4th column) in the ***layout*** file (4th line) with the same date used in the previous step (here 8827):
```
#offset :max_size:min_size:ver:flag:fstype:name:img_size
00e00000:00200000:00000040:00000000:2:jffs2:user2:00200000
00d80000:00080000:00000000:00000000:2:jffs2:user:1
00250000:00b30000:00000040:00415146:0:null:kernel:8533256
```
After you've downloaded the images and prepared the files as described above, you need to inform the device about your own web server. On my Mac mini it's the directory ***/Library/WebServer/Documents/linkplay*** that is accessible as http://10.1.1.22/linkplay. The ***products.xml*** file needs to be located in the main directory of that URL.

Trigger an update with the following commands and verify the progress with Wireshark running on your web server. You may use "http || dns" as a filter to see the downgrade process:
```
# inform the device about the local web server URL
curl -s 'http://10.1.1.58/httpapi.asp?command=SetUpdateServer:http://10.1.1.22/linkplay'
# trigger an update/downgrade (may not be required)
curl -s 'http://10.1.1.58/httpapi.asp?command=getMvRemoteUpdateStartCheck'
# retrieve the status about the update/downgrade
curl -s 'http://10.1.1.58/httpapi.asp?command=getMvRemoteUpdateStatus'
```
To verify that the downgrade was sucessful, you may retrieve the extended status from the device.
```
curl -s 'http://10.1.1.58/httpapi.asp?command=getStatusEx' | jq
{
  ...
  "firmware": "4.2.8020",
  "build": "release",
  "project": "RP0011_WB60_S",
  "priv_prj": "RP0011_WB60_S",
  "Release": "20200220",
  "branch": "stable/wiimu-4.2",
```
> **IMPORTANT:**
> I recommend to rename the ***products.xml*** file on your server after an up- or downgrade to something else and block or redirect any upgrade requests on the Internet. If a ***products.xml*** is found on that server in the proper directory (the default URL is pointing to http://silenceota.linkplay.com/wifi_audio_image) then an automatic upgrade may be triggered. 

## Problem with Upgrade after downgrade
In v4.6 Arylic has added a command to play a notification URL from my home automation system while music is playing. The music is faded out before the notification message is played, so this is quite nice. After I had installed a permanent hook that even survives a reboot I wanted to upgrade afterwards. See [Install Persistent Hook](/persistent-hook.md) for details.

I don't know why, but an upgrade with cli commands always got stuck after the device has fetched the ***MVver_20220427*** file. The three files ***products.xml***, ***product.xml***, and ***MVver_new*** were downloaded properly and temporarily stored in ***/tmp*** directory on the device. For some reason the device believes that an upgrade is not required, so the upgrade process is stopped. 

I thought that a variable in NVRAM might block the upgrade and had a closer look to them with ***ralink_init show 2860***, but could not find an answer. That's what I have tried:
```
ralink_init show 2860

nvram_set 2860 FirmwareServerVersion 4.2.8020
nvram_set 2860 Ota_Fw_New 4.2.8020
nvram_set 2860 part_ver_kernel 8020
reboot
```
I also tried
```
nvram_set 2860 FirmwareServerVersion 0
nvram_set 2860 Ota_Fw_New 0
nvram_set 2860 McuServerVersion 0
nvram_set 2860 McuSaveVersion 0
nvram_set 2860 Ota_Mcu_New 0
```
I also played around with the FQDNs (the DNS hostname or IP address) and the URLs that are used in ***products.xml***, ***product.xml***, and ***MVver*** without any luck. I tried IP addresses as well as FQDNs. I even pointed to the real update servers on the Internet, but that failed with the same result as well. So it looks that the problem must be on the device itself. 

There is a simple way to work around that problem: install the upgrade via 4Stream app from you mobile phone. It was working on my iPhone (4Stream app version 2.8.11908) and I upgraded from v4.2.8020 release date 2020/02/20 to v4.6.415145, release date 2022/04/27.

> **Update on the issue:**
> It looks that you just have to wait about 10 minutes. Then an automatic upgrade is called. I installed ***dnsmasq*** with the redirects shown above, and created a symbolic link
> for wifi_audio_image pointing to linkplay as explained in  [Download and prepare Firmware](/download-firmware.md). The ***'products-... .xml*** file has the following content and the content is exactly matching
> to the content that is available online.
``` 
<?xml version="1.0" encoding="ISO-8859-1" ?>
<productList>
  <product> 
    <productid>RP0011_WB60</productid>  
    <hardwareversion>WiiMu-A31</hardwareversion>  
    <UUID>FF31F09E</UUID>  
    <major-url>http://silenceota.linkplay.com/linkplay/a31/RP0011_WB60/product-RP0011_WB60-20220427.xml</major-url> 
  </product>  
</productList>
```
The ***product.xml*** file has the following content:
```
<?xml version="1.0" encoding="ISO-8859-1"?>
<product>
  <major-version>20220427</major-version>
  <sign>94ccec31377c06c429bf2e167240696c</sign>
  <md5-url>http://silenceota.linkplay.com/wifi_audio_image/a31/a31rakoit/20220427/md5.txt</md5-url>
  <ver-url>http://silenceota.linkplay.com/wifi_audio_image/a31/a31rakoit/20220427/MVver_20220427</ver-url>
  <layout-url>http://silenceota.linkplay.com/wifi_audio_image/a31/a31rakoit/20220427/layout</layout-url>
  <image-uboot>http://silenceota.linkplay.com/wifi_audio_image/a31/a31rakoit/uboot_v632.img</image-uboot>
  <image-backup>http://silenceota.linkplay.com/wifi_audio_image/a31/a31rakoit/backup_new_v1141.img</image-backup>
  <image-kernel>http://silenceota.linkplay.com/wifi_audio_image/a31/a31rakoit/20220427/a31rakoit_new_uImage_20220427</image-kernel>
  <image-user>http://silenceota.linkplay.com/wifi_audio_image/a31rakoit/20220427/user.jffs2</image-user>
  <image-user2>http://silenceota.linkplay.com/wifi_audio_image/a31rakoit/20220427/user2.jffs2</image-user2>
  <project>
    <name>RP0011_WB60_S</name>
    <mcu-ver>24</mcu-ver>
    <mcu-size>672538</mcu-size>
    <mcu-image>http://ota.rakoit.com/linkplay/a31/RP0011_WB60_S/RP0011_WB60_S-0024-99617ee3-08182020.mcu.bin</mcu-image>
  </project>
</product>
```

