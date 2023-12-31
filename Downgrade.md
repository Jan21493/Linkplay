# Downgrade Firmware
In recent versions Arylic has fixed several vulnerabilities and I have not found a way to "hack" into the CLI anymore. Telnet acces was still possible with version 4.2.8020 from 2020/02/20 (20th of Feb 2020) that was installed when I had bought the first devices.

The following information is specific for Arylic Up2Stream Amp v2 and Up2Stream Pro v3, but might also help for other devices.

## Firmware Upgrade
Before we are able to downgrade the software, it is important to understand the firmware upgrade process.

The URL to the upgrade server can be retrieved via API:
```
curl http://10.1.1.52/httpapi.asp?command=GetUpdateServer
# my device responds with http://silenceota.linkplay.com/wifi_audio_image
```

With Wireshark I have sniffed how the upgrade process is working and which files are required. At first the device gets a list of all (or many) Linkplay products 
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/products.xml 
```
The XML file contains a list of products with their ID and some information including an URL for specific information. The example contains the two devices listed above (list was retrieved in Oct 2020):
```
<productList>
...
<product>
<productid>RP0011_WB60</productid>
<hardwareversion>WiiMu-A31</hardwareversion>
<UUID>FF31F09E</UUID>
<major-url>
http://ota.rakoit.com/release/RP0011_WB60/product.xml
</major-url>
</product>
<product>
...
</productList>
```

The following table lists some of the IDs
| Product ID  | Description |
| --------------- | ------------- |
| RP0011_WB60 | Arylic WiFi and Bluetooth 5.0 HiFi Stereo Amplifier Board Up2Stream amp 2.0 |
| RP0011_WB60_S | Arylic A30 Pro  |
| RP0016_S50PRO_S | Arylic S50 Pro  |
| UP2STREAM_PRO_V3 | Arylic Up2Stream Pro v3 |

```
curl -O http://ota.rakoit.com/release/RP0011_WB60/product.xml
```
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
| <md5-url> | <major-version> | plain text file with MD5 checksums for image files (uBoot, backup, user2, kernel)  |
| <ver-url> | <major-version> | plain text file with version information and release date |
| <layout-url> | <major-version> | plain text file with layout (e.g. offset, size, version, fstype, name, size) of file system in flash (user2, user, kernel) |
| <image-kernel> | <major-version> | main binary image for kernel |
| <image-user> | <major-version> | image for user file system (persistent) |
| <image-user2> | <major-version> | image for user file system (persistent) |
| <image-uboot> | - | boot loader uBoot |
| <image-backup> | - | backup image |

I'm not sure if the **<sign>** tag is used. I've modified the URLs (different FQDN and path) and got no error. Only the following files are downloaded during an upgrade (verified with Up2Stream Amp v2.0):
| URL | Description |
| --------------- | ------------- |
| http://silenceota.linkplay.com/wifi_audio_image/products.xml | List of all Linkplay products in XML format with infos and URL |
| http://ota.rakoit.com/release/RP0011_WB60/product.xml | Infos and URLs for images for a specific Linkplay product |
| http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/MVver_20201026 | Version information |
| http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/layout | Layout of file system in flash |
| http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/a31rakoit_new_uImage_20201026 | main image |

The other images, e.g. uBoot loader (was already installed), user and user2 images were not downloaded.

> **Note:**
> If an upgrade is available, it may be installed automatically without any notice! In the 4Stream app you might see that a new version is highlighted with "new" and you might get a popup with a notification. I have not found out, when an update is installed automatically. 

## Firmware Downgrade
To be able to downgrade the firmware you need to modify DNS names, e.g. you may install dnsmasq on your local network and point to that DNS server from your DHCP server. To redirect the firmware up-/downgrade process to your own webserver, you can create a simple file in the /etc/dnsmasq.d directory with the following content (10.1.1.22 is the IP address of my webserver located on my MacMini)
 The following records are required on the DNS server:
```
cat /etc/dnsmasq.d/linkplay.conf
address=/silenceota.linkplay.com/10.1.1.22
address=/ota.rakoit.com/10.1.1.22
```
You may modify the configuration file on your webserver to use different folders for different FQDNs. Be sure to verify any URLs from a web browser or curl. On your PC you may manually point to a public DNS server to be able to download XML files and images from the Internet.

> **Note:**
> The modification of the two FQDNs will prevent any further updates!

A firmware downgrade has been tested from v4.6 to v4.2.8026 (release date 20200220). Here it is documented from v4.2.8826 to v4.2.8026. To get information about the product ID (project), the current version and release date you can use the "getStatusEx" command. The following output is "enhanced" / beautified with the tool "jq" (JSON processor):

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
> There is no link to older version available. The **_products.xml_** file only contains URLs for the latest version, so you need to know (or guess) the URL for the specific **_product.xml_** file. The following URL is working for the Up2Stream Amp v2 and partially also for the Up2Stream Pro v3 (without MCU). I've added the URL for the **_products.xml_** file to the Wayback archive (https://web.archive.org) on Dec 31th 2023, so it does not work for older versions.

The **_products.xml_** file that has been archived on 20231231 can be retrieved here:
```
curl https://web.archive.org/web/20231231141235/http://silenceota.linkplay.com/wifi_audio_image/products.xml
```

At first you can download the actual **_products.xml_** file, remove everything except your products, adjust the URLs (optionally) and install it on your web server:
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/products.xml
```

Next you download the specific **_product.xml_** file. The following URL is for the RP0011_WB60_S product ID, but except for the MCU all images look to be the same as for product ID RP0011_WB60, UP2STREAM_PRO_V3, and others. I'm not sure, but all devices with the Linkplay A31 module might use the same firmware. You may download and compare the RP0011_WB60_S product below with your device (including MD5 checksums) and replace MCU part show below with the one from your device. It looks that older versions of the **_product.xml_** files and images are still available for download - you just need to know (or guess) the URLs.

> **Important:**
> I do not take responsibilities for results or consequences. You might damage your device! Do not try to downgrade your device if you are unsure!

The following URL is for the RP0011_WB60_S product ID, version 4.2.8020, release date 0200220
```
curl -O http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/product.xml
```

Here is a copy for reference:
```
<?xml version="1.0" encoding="ISO-8859-1" ?>
<product>
  <major-version>20200220</major-version>
  <sign>27178fb574eafbdab8e1493a1569dd36</sign>
  <md5-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/md5.txt</md5-url>
  <ver-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/MVver_20200220</ver-url>
  <layout-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/layout</layout-url>
  <image-uboot>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/uboot_v632.img</image-uboot>
  <image-backup>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/backup_new_v1141.img</image-backup>
  <image-kernel>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/a31rakoit_new_uImage_20200220</image-kernel>
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

Modify the <major-version> in the **_product.xml_** file to be one day ahead of your current release date, e.g. 20201027 if your current release date is 20201026. You may also combine the content with a different MCU (project). Be sure that the project name is exactly matching your device!
```
<?xml version="1.0" encoding="ISO-8859-1" ?>
<product>
 <major-version>20201027</major-version>
 <sign>27178fb574eafbdab8e1493a1569dd36</sign>
 <md5-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/md5.txt</md5-url>
 <ver-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/MVver_20200220</ver-url>
 <layout-url>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/layout</layout-url>
 <image-uboot>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/uboot_v632.img</image-uboot>
 <image-backup>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/backup_new_v1141.img</image-backup>
 <image-kernel>http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/a31rakoit_new_uImage_20200220</image-kernel>
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

Modifiy the version number in the **_MVver_20200220_** file (first line) to be higher than your current version number, e.g. WiiMu.4.2.8027 if your current version is 4.2.8826. 

Modify the release date in the **_MVver_20200220_** file (6th line) with the same date used in the previous step.

Here is an example of the modified  **_MVver_20200220_** file:
```
 WiiMu.4.2.8827
WiiMu
WiiMu-A31
a31rakoit
release
20201027
customuuid=FF31F09E
```
Modify the version (ver, 4th column) in the **_layout_** file (4th line) with the same date used in the previous step (here 8827):
```
#offset :max_size:min_size:ver:flag:fstype:name:img_size
00e00000:00200000:00000040:00000000:2:jffs2:user2:00200000
00d80000:00080000:00000000:00000000:2:jffs2:user:1
00250000:00b30000:00000040:00008827:0:null:kernel:8533256
```

Trigger an update with the following commands and verify the progress with Wireshark running on your web server. You may use "http" as a filter to see the downgrade process:
```
curl -s 'http://10.1.1.52/httpapi.asp?command=getMvRemoteUpdateStartCheck
curl -s 'http://10.1.1.52/httpapi.asp?command=getMvRemoteUpdateStatus
```
