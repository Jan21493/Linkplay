# Download and Prepare Firmware on your own web server
After I had downloaded some firmware files my web server became quite messy, so I've created a list of commands to download firmware for different products and versions. 

/Library/WebServer/Documents/linkplay
|-- products-original-2024-01-03.xml                            # downloaded products.xml file renamed by current date for future use
|-- products.xml                                                # crafted file that contains the products I own and the URLs are pointing to this local web server
|-- product.xmls-2024-01-03                                     # directory for product.xml files with date when the download was done 
|    |-- all-products.xml                                       # combined xml files from all products for easier modification
|    |-- product-XXXXX.xml                                      # specific product.xlm files renamed with their product IDs
|    |-- ... 
|-- a31                                                         # subdirectory with all images, binaries and other files for devices with Linkplay A31 module
|    |-- common                                                 # common directory for images and other files that are the same for many products
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
...

I've provided shell script that can be used to download products.xml, the specific product.xml files for the products in use and their images for the two important versions:
- 20200220 - version with security vulnerability to allow telnet to the device
- 20220427 - actual version for my Linkplay devices (today is 2024/01/05).

You may only want to download the files that are interesting for you. The shell script contains a lot of commands that should be skipped, but it is easier to start with and it contains the URLs for the OLDER versions of many products. Unfortunately only the latest products.xml and product.xml files are available on the Internet. 
- http://silenceota.linkplay.com/wifi_audio_imageproducts.xml (entry link with list of products with URLs and more)
- http://ota.rakoit.com/release/RP0011_WB60_S/product.xml (example for one of the product IDs)

See shell script for more information [Shell script to download](/download-firmware.sh)