# Download and Prepare Firmware on your own web server
After I had downloaded some firmware files my web server became quite messy, so I've created a list of commands to download firmware for different products and versions. 

```
/Library/WebServer/Documents/linkplay
|-- products-original-2024-01-03.xml                            # downloaded products.xml file renamed by current date for future use
|-- products.xml                                                # crafted file that contains the products I own and the URLs are pointing to this local web server
|-- product.xmls-2024-01-03                                     # directory for specific product.xml files with date when the download was done 
|    |-- all-products.xml                                       # combined XML file from all product.xml files for easier modification
|    |-- product-XXXXX.xml                                      # specific product.xlm files renamed with their product IDs
|    |-- ... 
|-- a31                                                         # subdirectories for images, binaries and other files for devices with Linkplay A31 module
|    |-- a31rakoit                                              # common directory for images and other files that are the same for many products
|    |    |-- 20200220                                          # subdirectory with images and other files named with release date of that version
|    |    |    |-- a31rakoit_new_uImage_20200220                # kernel image as an example 
|    |    |    +-- ... 
|    |    |-- 20220427                                          # other (latest) version
|    |    |    +-- ... 
|    |    +-- uboot_v632.img                                    # image of uBoot loader (all versions use the same loader)
|    +-- bin                                                    # binary applications from Open WRT archive
|    |    +-- readelf 
|    |-- RP0011_WB60                                            # directory for MCU images and product.xml files for that specific product ID 
|    |    |-- RP0011_WB60_S-0024-99617ee3-08182020.mcu.bin      # MCU image (they have a version number included in their name)
|    |    |-- product-RP0011_WB60-20220427-original.xml         # product.xml file (there might be several files with release date included in their names)
|    |    |-- product-RP0011_WB60-20220427.xml                  # modified product.xml file that points to files on this server
|    +-- ...
+-- mp3                                                         # notification messages in mp3 format
+-- scripts                                                     # shell scripts for linkplay devices
...
```

I've provided shell script that can be used to download products.xml, the specific product.xml files for the products in use and their images for the two important versions:
- 20200220 - version with security vulnerability to allow telnet to the device
- 20220427 - actual version for my Linkplay devices (today is 2024/01/05).

You may only want to download the files that are interesting for you. The shell script contains a lot of commands that should be skipped, but it is easier to start with and it contains the URLs for the OLDER versions of many products. Unfortunately only the latest products.xml and product.xml files are available on the Internet. 
- http://silenceota.linkplay.com/wifi_audio_image/products.xml (entry link with list of products with URLs and more)
- http://ota.rakoit.com/release/RP0011_WB60_S/product.xml (example for one of the product IDs)

See shell script for more information [Shell script to download](/download-firmware.sh)

## Preparation
Create a base directory on your web server, e.g. 'linkplay'. On my Mac mini the base directory for the apache web server is ***/Library/WebServer/Documents***, so I've created
```
mkdir /Library/WebServer/Documents/linkplay
cd /Library/WebServer/Documents/linkplay
```
Later I realized, that it might be easier to allow exactly the same URLs locally, so I added a symbolic link to the default subdirectory for the ***product.xml*** file:
```
ln -s /Library/WebServer/Documents/linkplay /Library/WebServer/Documents/wifi_audio_image
```
## 1. Download latest products.xml file
The XML file products.xml contains a list of all products for which downloads are available. The following list contains devices with (mainly) A31 module.
```
curl http://silenceota.linkplay.com/wifi_audio_image/products.xml -o products-`date '+%Y-%m-%d'`.xml
```
> NOTE: 
> There is a different products list available for devices with (mainly) A28 module (not covered here)
```
curl http://silenceota.linkplay.com/wifi_audio_image/products_v2.xml -o products_v2-`date '+%Y-%m-%d'`.xml
```
## 2. Download latest specific product.xml files 
You should download the product.xml files for your product (and maybe a few more), because the URLs may alway point to the latest version only. Therefore it may be hard to guess the name for older versions or it's even impossible to download them if the URL stays the same. 

When you look into the products.xml file, you can find the URLs, UUIDs, product IDs for each product that can be upgraded. It's easy to see that the download URLs are the same for products with the same UUID, so I added the UUID to the name (see below). I also added the (assumed) version as a prefix. It might be a good idea to use "-original.xml" for all downloaded files for later reference and modify copies only. The names get longer, but by using such a naming scheme it's easier to find the original file, know which products are using the same binaries and to distinguish between files, e.g. if they are loaded in an editor.

It is more complicated to retrieve the exact release date from the content of the xml file, so I used a fixed string (20220427 in the example below). 

You may convert the XML file into 'curl' commands for easy downloading by using 'search & replace' with regular expressions in your editor
- Search for: `.*<product>.*\n.*<productid>(.*)</productid>.*\n.*\n.*<UUID>(.*)</UUID>.*\n.*<major-url>(.*)</major-url>.*\n.*`
- Replace with: `curl --create-dirs '$3' -o 'product-$2-$1-20220427.xml'`. (see example below)
and
- Search for: `.*<product>.*\n.*<productid>(.*)</productid>.*\n.*\n.*<major-url>(.*)</major-url>.*\n.*<UUID>(.*)</UUID>.*\n.*`
- Replace with: `curl --create-dirs '$2' -o 'product-$3-$1-20220427.xml''`.

Below there is a shortlist with products that I own, but you may either follow the instructions above or extract the files for products you need from the [download-firmware.sh](/download-firmware.sh) shell script. The example below is using the current date as a directory name, but a fixed version in the filename. After you've downloaded the files you may adjust the filename with the real version from the content of the file.
```
mkdir product.xmls-`date '+%Y-%m-%d'`
cd product.xmls-`date '+%Y-%m-%d'`
curl --create-dirs 'http://ota.rakoit.com/release/UP2STREAM_PRO_V3/product.xml' -o 'product-FF31F09E-UP2STREAM_PRO_V3-20220427.xml'
curl --create-dirs 'http://ota.rakoit.com/release/UP2STREAM_AMP_V3/product.xml' -o 'product-FF31F09E-UP2STREAM_AMP_V3-20220427.xml'
curl --create-dirs 'http://ota.rakoit.com/release/UP2STREAM_AMP_V4/product.xml' -o 'product-FF31F09E-UP2STREAM_AMP_V4-20220427.xml'
curl --create-dirs 'http://ota.rakoit.com/release/RP0011_WB60/product.xml' -o 'product-FF31F09E-RP0011_WB60-20220427.xml'
curl --create-dirs 'http://ota.rakoit.com/release/RP0011_WB60_S/product.xml' -o 'product-FF31F09E-RP0011_WB60_S-20220427.xml'
```
You may also download the product.xml files into the directories where the images are stored as shown in the structure tree above. You should clean up the directory afterwards, because there might be some product.xml files having only a xml error message as a content. It's easy to identify these files, because they have a length of less than 200 byte.

## 3. Download latest files for specific products
The product.xml file includes URLs for images for kernel, MCUs, boot loader and additional files e.g. version information, layout for flash file system and md5 checksums. You may combine all product.xml file into a single file for easier modification with search & replace.
```
cat ./* > all-products.xml
```
Manually convert 'all-products.xml' file into curl downloads - regular expressions and visual studio code are your friends ;-)

My focus is on products from Arylic / Rakoit. All these products are using the Linkplay A31 module, but use different MCUs. Almost all of them are using the same UUID (not included in the product.xml files) and the same 'cryptic' ID 2ANRu7eyAEYtoo4NZPy9dL in the URLs. Only the following product IDs are different:
- AURIS_S50A - it has the same 'cryptic' ID, but an an older relase date 20211206
- AE1W, Audioengine_X20_S, X-20 - they use 'cryptic' ID 3e2BsdNiza3MAfpALWxWac and have an older relase date 20211116

All other products have also the same version (release date) which is 20220427. Therefore I've downloaded the images and additional files only once per version and used ***'a31rakoit'*** and the release dates as a subdirectories.

> Note: I'm not using on of the four exceptions, so I've skipped these. 

> Important Conclusion: If all these products are using the same binaries for the latest release 20220427, this should be the same for older versions. The  older versions however follow a different URL path scheme where each product had its own 'cryptic' ID as path/subdirectory. This assumption is the key to be able to downgrade to an older version even if the exact product was not available for that version. You may use a different product (from the same vendor) that has the same UUID or the same URL as the product you own. If you downgrade your product, the MCU part can be constructed and be the same as the current version. I was able to verify this assumption for product ID RP0011_WB60_S. 

It turned out that the two files with '.jffs2' ending were not available from the update server. Actually you get an xml error message as a content that the file was not available for download. Therefore I've commented them out. I'm not sure if this is the case for all products, but at least for all products from Arylic this is the case.

I've downloaded uBoot and backup images in main directory ***'a31rakoit'*** for all products with 'cryptic' ID 2ANRu7eyAEYtoo4NZPy9dL and all other files (kernel image, md5 checksum, loader information for flashfs, version information) into a subdirectory that are named with the release date of the version to which the file belongs to.

As before, the list below is a shortlist with commands for the products that I own. You may either follow the instructions above or extract the files for products you need from the [download-firmware.sh](/download-firmware.sh).
```
cd /Library/WebServer/Documents/linkplay
mkdir a31
cd a31
# subdirectory 2ANRu7eyAEYtoo4NZPy9dL is mapped to a31rakoit
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/uboot_v632.img -o a31rakoit/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/backup_new_v1141.img -o a31rakoit/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/md5.txt -o a31rakoit/20220427/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/MVver_20220427 -o a31rakoit/20220427/MVver_20220427
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/layout -o a31rakoit/20220427/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/a31rakoit/_new_uImage_20220427 -o a31rakoit/20220427/a31rakoit_new_uImage_20220427
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/user.jffs2 -o a31rakoit/20220427/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/user2.jffs2 -o a31rakoit/20220427/user2.jffs2
#
# MCUs are stored in subdirectories (they have the version included in their file names)
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin -o RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60_S/RP0011_WB60_S-0024-99617ee3-08182020.mcu.bin -o RP0011_WB60_S/RP0011_WB60_S-0024-99617ee3-08182020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_V3/UP2STREAM_AMP_V3-0035-99e42697-20220509.mcu.bin -o UP2STREAM_AMP_V3/UP2STREAM_AMP_V3-0035-99e42697-20220509.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_V4/UP2STREAM_AMP_V4-0036-30cb0ae0-20220702.mcu.bin -o UP2STREAM_AMP_V4/UP2STREAM_AMP_V4-0036-30cb0ae0-20220702.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PRO_V3/UP2STREAM_PRO_V3-0044-44b0e3c1-20230808.mcu.bin -o UP2STREAM_PRO_V3/UP2STREAM_PRO_V3-0044-44b0e3c1-20230808.mcu.bin
#
# The same product.xml files that were downloaded above into a common directory are also copied into the product ID directory.
# They were also renamed to "-20220427-original.xml" to makes it easier to create an xml file that is pointing to your own local web server.
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PRO_V3/product.xml -o UP2STREAM_PRO_V3/product-UP2STREAM_PRO_V3-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_V3/product.xml -o UP2STREAM_AMP_V3/product-UP2STREAM_AMP_V3-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60/product.xml -o RP0011_WB60/product-RP0011_WB60-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60_S/product.xml -o RP0011_WB60_S/product-RP0011_WB60_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_V4/product.xml -o UP2STREAM_AMP_V4/product-UP2STREAM_AMP_V4-20220427-original.xml
```
## 4. Download product.xml files for all used products for version 20200220
Now it gets interesting, because you can't find these files on the Internet directly, but they are still available for download if you know the URLs.

> NOTE:
> The naming convention was different at that time - the cryptic product ID is related to a specific product and version. It's stored in the same directory as the files for that release.

As before, the list below is a shortlist with commands for the products that I own. Extract the files for products you need from the [download-firmware.sh](/download-firmware.sh).
```
cd /Library/WebServer/Documents/linkplay
mkdir product.xmls-20200220
cd product.xmls-20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/product.xml -o product-RP0011_WB60-20200220-original.xml
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/product.xml -o product-RP0011_WB60_S-20200220-original.xml
#
cd ../a31
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/product.xml -o RP0011_WB60/product-RP0011_WB60-20200220-original.xml
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/product.xml -o RP0011_WB60_S/product-RP0011_WB60_S-20200220-original.xml
```
> NOTE:
> There are no product.xml files for new products like UP2STREAM_PRO_V3, UP2STREAM_AMP_V3, or UP2STREAM_AMP_V4, but that's no problem, because of the conclusion from above and the fact that there IS a product in the list that has the same UUID / 'cryptic' ID (in the latest version). 

It may not be important to have the MCU files for an older version. You can just copy the part from the latest version. Even if the device will not work with that MCU, the main reason to do a downgrade is to install a persistent hook in flashfs that survives a reboot and even an upgrade, see [Install Persistant Hook](/persistant-hook.md) After the hook is installed, you may upgrade again to the version that was used before.

If there is no product with the same UUID available, but your product is based on the Linkplay A31 module, then it might be possible (although more risky) to install the files for a different product from the same or even another vendor by manipulating the product ID. At the end it's your risk - don't blame me if it is not working and you've bricked your device! 

## 5. Download images and additional files for version 20200220 for a downgrade
Again, you may either modify the product.xml files and convert them into 'curl' commands or extract them from the shell script.

I followed the directory structure from above and have downloaded the files in a subdirectory below the common ***a31rakoit*** subdirectory.

> Note: uBoot and backup images are the same as for the latest version (same filename and same content). They differ slightly in binary compare via 'diff', but only in build date so I believe that they don't differ in functionality and were just compiled at a different date. For this reason and the fact that the device was never asking for these files during a downgrade, I've skipped the download.
```
cd /Library/WebServer/Documents/linkplay/a31
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/uboot_v632.img -o a31rakoit/uboot_v632.img
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/backup_new_v1141.img -o a31rakoit/backup_new_v1141.img
# subdirectory for version 20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/md5.txt -o a31rakoit/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/MVver_20200220 -o a31rakoit/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/layout -o a31rakoit/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/a31rakoit_new_uImage_20200220 -o a31rakoit/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/user.jffs2 -o a31rakoit/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/user2.jffs2 -o a31rakoit/20200220/user2.jffs2
#
# MCUs are stored in subdirectories - the first few products are for Arylic/Rakoit
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin -o RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PRO_V3/UP2STREAM_PRO_V3-0021-37e5f282-20201212.mcu.bin -o UP2STREAM_PRO_V3/UP2STREAM_PRO_V3-0021-37e5f282-20201212.mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0011_WB60/RP0011_WB600022.mcu.bin -o RP0011_WB60/RP0011_WB600022.mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0011_WB60_S/RP0011_WB60_S0022.mcu.bin -o RP0011_WB60_S/RP0011_WB60_S0022.mcu.bin
```

> NOTE: Don't forget to add read and execute (enter directory) rights for the whole linkplay directory structure on your web server at the final end!!
```
chmod -v -R u=rwx,g=rx,o=rx *
```