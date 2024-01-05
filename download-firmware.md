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
## 1. Download latest products.xml file
The XML file products.xml contains a list of all products for which downloads are available. The following list contains devices with (mainly) A31 module.
```
curl http://silenceota.linkplay.com/wifi_audio_image/products.xml -o products-original-`date '+%Y-%m-%d'`.xml
```
> NOTE: 
> There is a different products list available for devices with (mainly) A28 module (not covered here)
```
curl http://silenceota.linkplay.com/wifi_audio_image/products_v2.xml -o products_v2-original-`date '+%Y-%m-%d'`.xml
```
## 2. Download latest specific product.xml files 
You should download the product.xml files for your product (and maybe a few more), because the URLs may alway point to the latest version only. Therefore it may be hard to guess the name for older versions or it's even impossible to download them if the URL stays the same. I recommend to put them into a directory with the (assumed) release date included in the directory name. 

It's easy to see that the download URLs are the same for products with the same ***<UUID>***


specific p
for all used products (the following short list contains all products from Rakoit/Arylic only!)
mkdir product.xmls-`date '+%Y-%m-%d'`
cd product.xmls-`date '+%Y-%m-%d'`
You may convert the XML file into 'curl' commands for download by using 'search & replace' with regular expressions in your editor
- Search for: `.*<product>.*\n.*<productid>(.*)</productid>.*\n.*\n.*<UUID>(.*)</UUID>.*\n.*<major-url>(.*)</major-url>.*\n.*`
- Replace with: `curl --create-dirs '$3' -o 'product-$2-$1-20220427.xml'`. (see example 1)
and
- Search for: `.*<product>.*\n.*<productid>(.*)</productid>.*\n.*\n.*<major-url>(.*)</major-url>.*\n.*<UUID>(.*)</UUID>.*\n.*`
- Replace with: `curl --create-dirs '$2' -o 'product-$3-$1-20220427.xml''`.
```
# example 1
curl --create-dirs 'http://ota.rakoit.com/release/UP2STREAM_PRO_V3/product.xml' -o 'product-FF31F09E-UP2STREAM_PRO_V3-20220427.xml'
```

It might be better to to put all ***product.xml*** files into a single directory to be able to combine them or extract the products you need. You may replace the "/" with "-" to 

```


curl --create-dirs $3 -o $2/$1/product-$1-original.xml

> NOTE: Don't forget to add read and execute (enter directory) rights for the whole linkplay subdirectories and files at the final end!!
```
chmod -v -R u=rwx,g=rx,o=rx *
```