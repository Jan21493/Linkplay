#!/bin/sh
# the following download URLs were created on 2024-01-03 - 
# you need to adjust the content for newer versions and/or other products and extract the products you need (don't download all)
#
# preparation - create a base directory on your webserver, e.g. linkplay
mkdir /Library/WebServer/Documents/linkplay
cd /Library/WebServer/Documents/linkplay
#
# NOTE: don't forget to add read rights for the whole linkplay subdirectories and files and the final end!!
chmod -v -R u=rwx,g=rx,o=rx *
# 1. download products.xml with current date. The list contains devices with (mainly) A31 module
curl http://silenceota.linkplay.com/wifi_audio_image/products.xml -o products-original-`date '+%Y-%m-%d'`.xml
#
# FYI: There is a different products list available for devices with (mainly) A28 module (not covered here)
# curl http://silenceota.linkplay.com/wifi_audio_image/products_v2.xml -o products_v2-original-`date '+%Y-%m-%d'`.xml
#
# 2. download specific product.xml files for all used products (the following short list contains all products from Rakoit/Arylic only!)
mkdir product.xmls-`date '+%Y-%m-%d'`
cd product.xmls-`date '+%Y-%m-%d'`
curl http://ota.rakoit.com/release/ARYLIC_A50N/product.xml -o product-ARYLIC_A50N.xml  
curl http://ota.rakoit.com/release/Audioengine_X20_S/product.xml -o product-Audioengine_X20_S.xml  
curl http://ota.rakoit.com/release/Audioengine_X20_S/product.xml -o product-AE1W.xml
curl http://ota.rakoit.com/release/SMART_HYDE/product.xml -o product-SMART_HYDE.xml
curl http://ota.rakoit.com/release/SMART_ZONE4/product.xml -o product-SMART_ZONE4.xml
curl http://ota.rakoit.com/release/SMART_S30/product.xml -o product-SMART_S30.xml
curl http://ota.rakoit.com/release/ARYLIC_A50S/product.xml -o product-ARYLIC_A50S.xml
curl http://ota.rakoit.com/release/ARYLIC_S50A/product.xml -o product-ARYLIC_S50A.xml  
curl http://ota.rakoit.com/release/UP2STREAM_MINI_V3/product.xml -o product-UP2STREAM_MINI_V3.xml
curl http://ota.rakoit.com/release/UP2STREAM_AMP_2P1/product.xml -o product-UP2STREAM_AMP_2P1.xml
curl http://ota.rakoit.com/release/UP2STREAM_PRO_V3/product.xml -o product-UP2STREAM_PRO_V3.xml
curl http://ota.rakoit.com/release/UP2STREAM_AMP_V3/product.xml -o product-UP2STREAM_AMP_V3.xml
curl http://ota.rakoit.com/release/RAKOIT_NUPR_WR1/product.xml -o product-RAKOIT_NUPR_WR1.xml
curl http://ota.rakoit.com/release/RAKOSO_SA100/product.xml -o product-RAKOSO_SA100.xml
curl http://ota.rakoit.com/release/RP0010_D5/product.xml -o product-RP0010_D5.xml
curl http://ota.rakoit.com/release/RP0010_D5_S/product.xml -o product-RP0010_D5_S.xml
curl http://ota.rakoit.com/release/RP0011_WB60/product.xml -o product-RP0011_WB60.xml
curl http://ota.rakoit.com/release/RP0011_WB60_S/product.xml -o product-RP0011_WB60_S.xml
curl http://ota.rakoit.com/release/RP0013_WA31S_S/product.xml -o product-RP0013_WA31S_S.xml
curl http://ota.rakoit.com/release/RP0014_A50C_S/product.xml -o product-RP0014_A50C_S.xml
curl http://ota.rakoit.com/release/RP0016_S50PRO_S/product.xml -o product-RP0016_S50PRO_S.xml
curl http://ota.rakoit.com/release/X-20/product.xml -o product-X-20.xml
curl http://ota.rakoit.com/release/SA100/product.xml -o product-SA100.xml
curl http://ota.rakoit.com/release/ARYLIC_V20/product.xml -o product-ARYLIC_V20.xml
curl http://ota.rakoit.com/release/WANFENGDA_EF_W280/product.xml -o product-WANFENGDA_EF_W280.xml
curl http://ota.rakoit.com/release/ARYLIC_S50/product.xml -o product-ARYLIC_S50.xml
curl http://ota.rakoit.com/release/ARYLIC_SUBWOOFER/product.xml -o product-ARYLIC_SUBWOOFER.xml
curl http://ota.rakoit.com/release/RAKOSO_M400/product.xml -o product-RAKOSO_M400.xml
curl http://ota.rakoit.com/release/UP2STREAM_AMP_V4/product.xml -o product-UP2STREAM_AMP_V4.xml
curl http://ota.rakoit.com/release/ARYLIC_A30/product.xml -o product-ARYLIC_A30.xml
curl http://ota.rakoit.com/release/Rakoso_SA100_V3/product.xml -o product-Rakoso_SA100_V3.xml
# not available: curl http://ota.rakoit.com/release/UP2STREAM_PRO_V3_1/product.xml -o product-UP2STREAM_PRO_V3_1.xml
curl http://ota.rakoit.com/release/WSA50/product.xml -o product-WSA50.xml
curl http://ota.rakoit.com/release/AURIS_S50A/product.xml -o product-AURIS_S50A.xml
curl http://ota.rakoit.com/release/RAKOIT_NUPR_A200/product.xml -o product-RAKOIT_NUPR_A200.xml
curl http://ota.rakoit.com/release/RAKOSO_C650/product.xml -o product-RAKOSO_C650.xml
curl http://ota.rakoit.com/release/RP0013_WA31S/product.xml -o product-RP0013_WA31S.xml
curl http://ota.rakoit.com/release/RP0013_WA31S_S/product.xml -o product-RP0013_WA31S_S.xml
curl http://ota.rakoit.com/release/RP0014_A50D_S/product.xml -o product-RP0014_A50D_S.xml
curl http://ota.rakoit.com/release/ARYLIC_A50TE/product.xml -o product-ARYLIC_A50TE.xml
curl http://ota.rakoit.com/release/JMR_AGAPE/product.xml -o product-JMR_AGAPE.xml
curl http://ota.rakoit.com/release/UP2STREAM_PLATE_2P1/product.xml -o product-UP2STREAM_PLATE_2P1.xml
curl http://ota.rakoit.com/release/UP2STREAM_MINI_V4/product.xml -o product-UP2STREAM_MINI_V4.xml
curl http://ota.rakoit.com/release/TENTRONICS_A1462/product.xml -o product-TENTRONICS_A1462.xml
curl http://ota.rakoit.com/release/TENTRONICS_A1469/product.xml -o product-TENTRONICS_A1469.xml
curl http://ota.rakoit.com/release/HAMILTON_WSA50P/product.xml -o product-HAMILTON_WSA50P.xml  
curl http://ota.rakoit.com/release/WSA50/product.xml -o product-WSA50.xml
# clean up directory - there might be URLs with no content (http 404 error message)
#
# 3. download images and additional files
# combine all files into single file for easier modification
cat ./* > all-products.xml
# manually convert 'all-products.xml' file into curl downloads - regular expressions and visual studio code are your friends ;-)
#
# the following list contains images and additional files for Linkplay A31 module 
# and several MCUs used in Rakoit/Arylic products
mkdir a31
cd a31
#
# I've looked into the combined list 'all-products.xml' file  from the product list above and 
# ALMOST ALL products are using the same binaries with 'cryptic' ID 2ANRu7eyAEYtoo4NZPy9dL (they have EXCACTLY the same URLs)
# exceptions are only: AURIS_S50A - it has the same 'cryptic' ID, but an an older relase date 20211206
#                 and: AE1W, Audioengine_X20_S, X-20 - they use 'cryptic' ID 3e2BsdNiza3MAfpALWxWac and have an older relase date 20211116
# 
# All other products have also the same version (release date) which is 20220427. Therefor I've downloaded the images
# and additional files only once per version and used 'common' and the release dates as a subdirectories.
# Note: I'm not using on of the four exceptions, so I've skipped these. 
#
# Conclusion (but only partly verified): If all these products are using the same binaries for the latest release 20220427,
# this should be the same for older versions. The older versions follow a different URL path scheme where each product had its own 'cryptic' ID path/subdirectory.
#
# It turned out that the two files with '.jffs2' ending were not available from the update server. Actually you get an xml error message as a content 
# that the file was not available for download. Therefore I've commented them out.
#
# uBoot and backup images are stored in main directory (cryptic ID 2ANRu7eyAEYtoo4NZPy9dL is used for many product IDs)
# subdirectory 2ANRu7eyAEYtoo4NZPy9dL skipped, only 20220427 used
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/uboot_v632.img -o common/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/backup_new_v1141.img -o common/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/md5.txt -o common/20220427/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/MVver_20220427 -o common/20220427/MVver_20220427
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/layout -o common/20220427/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/a31rakoit_new_uImage_20220427 -o common/20220427/a31rakoit_new_uImage_20220427
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/user.jffs2 -o common/20220427/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/user2.jffs2 -o common/20220427/user2.jffs2
# subdirectory 2ANRu7eyAEYtoo4NZPy9dL skipped, only 20211206 used
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20211206/md5.txt -o common/20211206/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20211206/MVver_20211206 -o common/20211206/MVver_20211206
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20211206/layout -o common/20211206/layout -o
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20211206/a31rakoit_new_uImage_20211206 -o common/20211206/a31rakoit_new_uImage_20211206
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20211206/user.jffs2 -o common/20211206/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20211206/user2.jffs2 -o common/20211206/user2.jffs2
# subdirectory 3e2BsdNiza3MAfpALWxWac replaced by Audioengine and release date is 20211116
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Audioengine/20211116/md5.txt -o Audioengine/20211116/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Audioengine/20211116/MVver_20211116 -o Audioengine/20211116/MVver_20211116
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Audioengine/20211116/layout -o Audioengine/20211116/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Audioengine/20211116/a31slave_noasr_new_uImage_20211116 -o Audioengine/20211116/a31slave_noasr_new_uImage_20211116
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Audioengine/20211116/user.jffs2 -o Audioengine/20211116/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Audioengine/20211116/user2.jffs2 -o Audioengine/20211116/user2.jffs2
#
# MCUs are stored in subdirectories (they have the version included in their file names)
curl --create-dirs http://ota.rakoit.com/release/AURIS_S50A/AURIS_S50A-0030-5afeaef5-20211029.mcu.bin -o AURIS_S50A/AURIS_S50A-0030-5afeaef5-20211029.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_A30/ARYLIC_A30-0041-b8ea2564-20230619.mcu.bin -o ARYLIC_A30/ARYLIC_A30-0041-b8ea2564-20230619.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_A50N/ARYLIC_A50N-0035-2b814e71-20220622.mcu.bin -o ARYLIC_A50N/ARYLIC_A50N-0035-2b814e71-20220622.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_A50S/ARYLIC_A50S-0034-85e6877a-20220428.mcu.bin -o ARYLIC_A50S/ARYLIC_A50S-0034-85e6877a-20220428.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_A50TE/ARYLIC_A50TE-0041-7882a285-20231125.mcu.bin -o ARYLIC_A50TE/ARYLIC_A50TE-0041-7882a285-20231125.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_S50/ARYLIC_S50-0035-99e42697-20220506.mcu.bin -o ARYLIC_S50/ARYLIC_S50-0035-99e42697-20220506.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_S50A/ARYLIC_S50A-0035-99e42697-20220506.mcu.bin -o ARYLIC_S50A/ARYLIC_S50A-0035-99e42697-20220506.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_SUBWOOFER/ARYLIC_SUBWOOFER-0031-a3e827a1-20211113.mcu.bin -o ARYLIC_SUBWOOFER/ARYLIC_SUBWOOFER-0031-a3e827a1-20211113.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_V20/ARYLIC_V20-0037-1deec5d1-20220806.mcu.bin -o ARYLIC_V20/ARYLIC_V20-0037-1deec5d1-20220806.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/HAMILTON_WSA50P/HAMILTON_WSA50P-0044-0143ae73-20230314.mcu.bin -o HAMILTON_WSA50P/HAMILTON_WSA50P-0044-0143ae73-20230314.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/JMR_AGAPE/JMR_AGAPE-0045-a20eb55d-20220825.mcu.bin -o JMR_AGAPE/JMR_AGAPE-0045-a20eb55d-20220825.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RAKOIT_NUPR_A200/RAKOIT_NUPR_A200-0031-b751ddef-03142022.mcu.bin -o RAKOIT_NUPR_A200/RAKOIT_NUPR_A200-0031-b751ddef-03142022.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RAKOIT_NUPR_WR1/RAKOIT_NUPR_WR1-0016-d97bbe9a-08312020.mcu.bin -o RAKOIT_NUPR_WR1/RAKOIT_NUPR_WR1-0016-d97bbe9a-08312020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RAKOSO_C650/RAKOSO_C650-0035-f3af5f53-20220511.mcu.bin -o RAKOSO_C650/RAKOSO_C650-0035-f3af5f53-20220511.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RAKOSO_SA100/RAKOSO_SA100-0003-0bab5ec9-10132020.mcu.bin -o RAKOSO_SA100/RAKOSO_SA100-0003-0bab5ec9-10132020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0010_D5/RP0010_D5-0025-0271ab62-05282021.mcu.bin -o RP0010_D5/RP0010_D5-0025-0271ab62-05282021.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0010_D5_S/RP0010_D5_S-0025-0271ab62-05282021.mcu.bin -o RP0010_D5_S/RP0010_D5_S-0025-0271ab62-05282021.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin -o RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60_S/RP0011_WB60_S-0024-99617ee3-08182020.mcu.bin -o RP0011_WB60_S/RP0011_WB60_S-0024-99617ee3-08182020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0013_WA31S/RP0013_WA31S-0006-3637b8c6-08262021.mcu.bin -o RP0013_WA31S/RP0013_WA31S-0006-3637b8c6-08262021.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0013_WA31S_S/RP0013_WA31S_S-0005-a8a09c07-07312020.mcu.bin -o RP0013_WA31S_S/RP0013_WA31S_S-0005-a8a09c07-07312020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0014_A50C_S/RP0014_A50C_S-0007-e07519f2-05292021.mcu.bin -o RP0014_A50C_S/RP0014_A50C_S-0007-e07519f2-05292021.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/RP0016_S50PRO_S/RP0016_S50PRO_S-0005-81895f40-09292020.mcu.bin -o RP0016_S50PRO_S/RP0016_S50PRO_S-0005-81895f40-09292020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/SMART_HYDE/SMART_HYDE-0044-771df39f-20231117.mcu.bin -o SMART_HYDE/SMART_HYDE-0044-771df39f-20231117.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/SMART_S30/SMART_S30-0035-99e42697-20220530.mcu.bin -o SMART_S30/SMART_S30-0035-99e42697-20220530.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_2P1/UP2STREAM_AMP_2P1-0044-b8929039-20231129.mcu.bin -o UP2STREAM_AMP_2P1/UP2STREAM_AMP_2P1-0044-b8929039-20231129.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_V3/UP2STREAM_AMP_V3-0035-99e42697-20220509.mcu.bin -o UP2STREAM_AMP_V3/UP2STREAM_AMP_V3-0035-99e42697-20220509.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_V4/UP2STREAM_AMP_V4-0036-30cb0ae0-20220702.mcu.bin -o UP2STREAM_AMP_V4/UP2STREAM_AMP_V4-0036-30cb0ae0-20220702.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PLATE_2P1/UP2STREAM_PLATE_2P1-0044-2d793fb3-20231129.mcu.bin -o UP2STREAM_PLATE_2P1/UP2STREAM_PLATE_2P1-0044-2d793fb3-20231129.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PRO_V3/UP2STREAM_PRO_V3-0044-44b0e3c1-20230808.mcu.bin -o UP2STREAM_PRO_V3/UP2STREAM_PRO_V3-0044-44b0e3c1-20230808.mcu.bin
#
# The same product.xml files that were downloaded above into a common directory are also copied into the product ID directory.
# They were also renamed to "-20220427-original.xml" to makes it easier to create an xml file that is pointing to your own local web server.
#
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_A50N/product.xml -o ARYLIC_A50N/product-ARYLIC_A50N-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/Audioengine_X20_S/product.xml -o Audioengine_X20_S/product-Audioengine_X20_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/Audioengine_X20_S/product.xml -o AE1W/product-AE1W-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/SMART_HYDE/product.xml -o SMART_HYDE/product-SMART_HYDE-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/SMART_ZONE4/product.xml -o SMART_ZONE4/product-SMART_ZONE4-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/SMART_S30/product.xml -o SMART_S30/product-SMART_S30-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_A50S/product.xml -o ARYLIC_A50S/product-ARYLIC_A50S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_S50A/product.xml -o ARYLIC_S50A/product-ARYLIC_S50A-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_MINI_V3/product.xml -o UP2STREAM_MINI_V3/product-UP2STREAM_MINI_V3-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_2P1/product.xml -o UP2STREAM_AMP_2P1/product-UP2STREAM_AMP_2P1-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PRO_V3/product.xml -o UP2STREAM_PRO_V3/product-UP2STREAM_PRO_V3-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_V3/product.xml -o UP2STREAM_AMP_V3/product-UP2STREAM_AMP_V3-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RAKOIT_NUPR_WR1/product.xml -o RAKOIT_NUPR_WR1/product-RAKOIT_NUPR_WR1-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RAKOSO_SA100/product.xml -o RAKOSO_SA100/product-RAKOSO_SA100-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0010_D5/product.xml -o RP0010_D5/product-RP0010_D5-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0010_D5_S/product.xml -o RP0010_D5_S/product-RP0010_D5_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60/product.xml -o RP0011_WB60/product-RP0011_WB60-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60_S/product.xml -o RP0011_WB60_S/product-RP0011_WB60_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0013_WA31S_S/product.xml -o RP0013_WA31S_S/product-RP0013_WA31S_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0014_A50C_S/product.xml -o RP0014_A50C_S/product-RP0014_A50C_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0016_S50PRO_S/product.xml -o RP0016_S50PRO_S/product-RP0016_S50PRO_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/X-20/product.xml -o X-20/product-X-20-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/SA100/product.xml -o SA100/product-SA100-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_V20/product.xml -o ARYLIC_V20/product-ARYLIC_V20-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/WANFENGDA_EF_W280/product.xml -o WANFENGDA_EF_W280/product-WANFENGDA_EF_W280-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_S50/product.xml -o ARYLIC_S50/product-ARYLIC_S50-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_SUBWOOFER/product.xml -o ARYLIC_SUBWOOFER/product-ARYLIC_SUBWOOFER-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RAKOSO_M400/product.xml -o RAKOSO_M400/product-RAKOSO_M400-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_AMP_V4/product.xml -o UP2STREAM_AMP_V4/product-UP2STREAM_AMP_V4-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_A30/product.xml -o ARYLIC_A30/product-ARYLIC_A30-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/Rakoso_SA100_V3/product.xml -o Rakoso_SA100_V3/product-Rakoso_SA100_V3-20220427-original.xml
# not available: curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PRO_V3_1/product.xml -o UP2STREAM_PRO_V3_1/product-UP2STREAM_PRO_V3_1-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/WSA50/product.xml -o WSA50/product-WSA50-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/AURIS_S50A/product.xml -o AURIS_S50A/product-AURIS_S50A-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RAKOIT_NUPR_A200/product.xml -o RAKOIT_NUPR_A200/product-RAKOIT_NUPR_A200-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RAKOSO_C650/product.xml -o RAKOSO_C650/product-RAKOSO_C650-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0013_WA31S/product.xml -o RP0013_WA31S/product-RP0013_WA31S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0013_WA31S_S/product.xml -o RP0013_WA31S_S/product-RP0013_WA31S_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/RP0014_A50D_S/product.xml -o RP0014_A50D_S/product-RP0014_A50D_S-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/ARYLIC_A50TE/product.xml -o ARYLIC_A50TE/product-ARYLIC_A50TE-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/JMR_AGAPE/product.xml -o JMR_AGAPE/product-JMR_AGAPE-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PLATE_2P1/product.xml -o UP2STREAM_PLATE_2P1/product-UP2STREAM_PLATE_2P1-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_MINI_V4/product.xml -o UP2STREAM_MINI_V4/product-UP2STREAM_MINI_V4-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/TENTRONICS_A1462/product.xml -o TENTRONICS_A1462/product-TENTRONICS_A1462-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/TENTRONICS_A1469/product.xml -o TENTRONICS_A1469/product-TENTRONICS_A1469-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/HAMILTON_WSA50P/product.xml -o HAMILTON_WSA50P/product-HAMILTON_WSA50P-20220427-original.xml
curl --create-dirs http://ota.rakoit.com/release/WSA50/product.xml -o WSA50/product-WSA50-20220427-original.xml
#
# here's an older version where I had the URLs for (might not be important)
#
# subdirectory 2ANRu7eyAEYtoo4NZPy9dL skipped, only 20201026 used (related to many product IDs)
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/md5.txt -o common/20201026/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/MVver_20201026 -o common/20201026/MVver_20201026
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/layout -o common/20201026/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/a31rakoit_new_uImage_20201026 -o common/20201026/a31rakoit_new_uImage_20201026
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/user.jffs2 -o common/20201026/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20201026/user2.jffs2 -o common/20201026/user2.jffs2
#
# 4. download product.xml files for all used products (the following list contains all products from products.xml file from early 2020)
# Note: naming convention was different at that time - the cryptic product ID is related to a specific product
cd /Library/WebServer/Documents/linkplay
mkdir product.xmls-20200220
cd product.xmls-20200220
curl http://ota.uyesee.com/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/product.xml -o product-a31youyishi.xml
curl http://ota.uyesee.com/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/product.xml -o product-iEAST-01.xml
curl http://ota.uyesee.com/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/product.xml -o product-a31youyishi_triangle.xml
curl http://ota.uyesee.com/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/product.xml -o product-iEAST-4Z.xml
curl http://ota.uyesee.com/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/product.xml -o product-a28youyishi.xml
curl http://ota.uyesee.com/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/product.xml -o product-uyesee-i50.xml
curl http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/product.xml -o product-MET8040.xml
curl http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/product.xml -o product-CAW-12150.xml
curl http://silenceota.linkplay.com/wifi_audio_image/BJ8Kp4cDDNkbJJ2BMFZBPg/product.xml -o product-CVTE_SoundMax_Soundbar.xml
curl http://silenceota.linkplay.com/wifi_audio_image/rnr6zEepJNK4J5BNzanJc6/product.xml -o product-CVTE_SoundMax_7.xml
curl http://silenceota.linkplay.com/wifi_audio_image/T8WHW3WBC388ZPp5T3kZmL/product.xml -o product-CVTE_SoundMax_5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/iRCSrsweuKU7N8mEBBmrmm/product.xml -o product-CVTE_SoundMax_3.xml
curl http://silenceota.linkplay.com/wifi_audio_image/MkWhpLEVeBDcUhWAwMAP7K/product.xml -o product-CVTE_SoundMax_1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/product.xml -o product-HX-P590.xml
curl http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/product.xml -o product-HMDX_W3211_EU.xml
curl http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/product.xml -o product-HMDX_W3111_EU.xml
curl http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/product.xml -o product-HMDX_W3211.xml
curl http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/product.xml -o product-HMDX_W3111.xml
curl http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/product.xml -o product-DOSS_FabriqChorus.xml
curl http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/product.xml -o product-WB_22_FABRIQ.xml
curl http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/product.xml -o product-GGMM_E2A.xml
curl http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/product.xml -o product-AudioPro_C5A.xml
curl http://silenceota.linkplay.com/wifi_audio_image/a5FAAmtbdxXSc3v4QHEtnn/product.xml -o product-TTS-7199-92.xml
curl http://silenceota.linkplay.com/wifi_audio_image/HDSkP7JxxiZjeB76HS8RBP/product.xml -o product-XORO_XVS_200.xml
curl http://silenceota.linkplay.com/wifi_audio_image/9sdYrtLfzDEi7eYf3x5zUW/product.xml -o product-Essb_Virtuoz_401.xml
curl http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/product.xml -o product-Drumfire_D-1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/product.xml -o product-Zolo_Halo.xml
#curl http://silenceota.linkplay.com/wifi_audio_image/CxsyU3Z46kx9mymxiyjYki/product.xml -o product-RSR_WR762.xml
curl http://silenceota.linkplay.com/wifi_audio_image/J64extwJht7VRYByUEuDXK/product.xml -o product-IHOME_iAV14.xml
curl http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/product.xml -o product-GGMM_E3.xml
curl http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/product.xml -o product-XWF_500.xml
curl http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/product.xml -o product-GGMM_E5A.xml
curl http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/product.xml -o product-CAW-37052.xml
curl http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/product.xml -o product-HOME2.xml
curl http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/product.xml -o product-808XL-V.xml
curl http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/product.xml -o product-MSH315V.xml
curl http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/product.xml -o product-808SL-V.xml
curl http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/product.xml -o product-Smart_Speaker_PN.xml
curl http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/product.xml -o product-SWF2001.xml
curl http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/product.xml -o product-SWF3001.xml
curl http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/product.xml -o product-PWF1002.xml
curl http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/product.xml -o product-KS_31330.xml
curl http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/product.xml -o product-BUSH_31326.xml
curl http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/product.xml -o product-MD43631.xml
curl http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/product.xml -o product-Accelerate.xml
curl http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/product.xml -o product-RHYMEET_R1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/product.xml -o product-SYLVANIA.xml
curl http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/product.xml -o product-CAW-18057.xml
curl http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/product.xml -o product-SUPERSONIC.xml
curl http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/product.xml -o product-MusicMan_BT-X34.xml
curl http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/product.xml -o product-IKBFV378.xml
curl http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/product.xml -o product-AudioPro_C3.xml
curl http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/product.xml -o product-AudioPro_C10.xml
curl http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/product.xml -o product-GGMMA31_E5A.xml
curl http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/product.xml -o product-AudioPro_C5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/product.xml -o product-AudioPro_C5I.xml
curl http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/product.xml -o product-AudioPro_LINK1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/product.xml -o product-DIDA.xml
curl http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/product.xml -o product-Venus.xml
curl http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/product.xml -o product-Auvisio_QAS_300.xml
curl http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/product.xml -o product-ICOS.xml
curl http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/product.xml -o product-SWF4001.xml
curl http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/product.xml -o product-BOX.xml
curl http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/product.xml -o product-MD-3119.xml
curl http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/product.xml -o product-a31faravs.xml
curl http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/product.xml -o product-AudioPro_A10.xml
curl http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/product.xml -o product-AudioPro_A40.xml
curl http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/product.xml -o product-iHome_iAV14.xml
curl http://silenceota.linkplay.com/wifi_audio_image/tpRLhAoidnvrNXqnNrBDXg/product.xml -o product-JENSEN_31324.xml
curl http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/product.xml -o product-TIBO_31322.xml
curl http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/product.xml -o product-TIBO_31323.xml
curl http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/product.xml -o product-OE_VAALEXSB80.xml
curl http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/product.xml -o product-TIBO_31220.xml
curl http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/product.xml -o product-WBA31.xml
curl http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/product.xml -o product-T2328A.xml
curl http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/product.xml -o product-HE_MINI.xml
curl http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/product.xml -o product-WB_135.xml
curl http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/product.xml -o product-Smart5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/product.xml -o product-Smart7.xml
curl http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/product.xml -o product-MXQ_HF30.xml
curl http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/product.xml -o product-Verdera_Voice_Lighted_Mirror.xml
curl http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/product.xml -o product-a31ihomefaralexa.xml
curl http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/product.xml -o product-iHome_iAVS16.xml
curl http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/product.xml -o product-WS07VCA.xml
curl http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/product.xml -o product-SWF1005.xml
curl http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/product.xml -o product-GoHawk_Lit.xml
curl http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/product.xml -o product-MD44120.xml
curl http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/product.xml -o product-MD44130.xml
curl http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/product.xml -o product-Creative_Nova.xml
curl http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/product.xml -o product-iHome_CAV5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/product.xml -o product-X-50.xml
curl http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/product.xml -o product-a31jam.xml
curl http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/product.xml -o product-a31jameup.xml
curl http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/product.xml -o product-R1700A.xml
#curl http://silenceota.linkplay.com/wifi_audio_image/w2RFwDQDE96NuQ5mmcz5N8/product.xml -o product-EDIFIER_R1700A.xml
curl http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/product.xml -o product-SANSI_C22RL_TD01.xml
curl http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/product.xml -o product-CVTE_MOVEit.xml
curl http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/product.xml -o product-iHome_CAV1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/product.xml -o product-RP0010_D5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/product.xml -o product-RP0011_WB60.xml
#curl http://silenceota.linkplay.com/wifi_audio_image/FHRBYybPARNN2rYPYadjxC/product.xml -o product-EDIFIER_S1000A.xml
curl http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/product.xml -o product-A104.xml
curl http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/product.xml -o product-KS_QM003.xml
curl http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/product.xml -o product-PROLINK_PSB8602E.xml
curl http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/product.xml -o product-Hepburn_Voice.xml
curl http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/product.xml -o product-GGMMA31_E5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/product.xml -o product-MV_GoPiano.xml
curl http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/product.xml -o product-TuneBox.xml
curl http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/product.xml -o product-IZY_SPEAK.xml
curl http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/product.xml -o product-IZY_SPEAK_MINI.xml
curl http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/product.xml -o product-TuneBox_2.xml
curl http://ota.uyesee.com/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/product.xml -o product-AudioCast-M.xml
curl http://ota.uyesee.com/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/product.xml -o product-iEAST-M.xml
curl http://ota.uyesee.com/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/product.xml -o product-iEAST-03.xml
curl http://ota.uyesee.com/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/product.xml -o product-iEAST-02.xml
curl http://ota.uyesee.com/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/product.xml -o product-iEast-03.xml
curl http://ota.uyesee.com/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/product.xml -o product-iEast-02.xml
curl http://ota.uyesee.com/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/product.xml -o product-uyesee-am160.xml
curl http://ota.uyesee.com/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/product.xml -o product-uyesee-i50.xml
curl http://ota.uyesee.com/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/product.xml -o product-Uyesee-80X.xml
curl http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/product.xml -o product-AudioPro_A36.xml
curl http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/product.xml -o product-AudioPro_A26.xml
curl http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/product.xml -o product-WMS-1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/product.xml -o product-Smart_UX1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/product.xml -o product-X-Stream9.xml
curl http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/product.xml -o product-MyConnect_50.xml
curl http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/product.xml -o product-Advance_Playstream_A31.xml
curl http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/product.xml -o product-MyConnect_60.xml
curl http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/product.xml -o product-MyConnect150.xml
curl http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/product.xml -o product-A7.xml
curl http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/product.xml -o product-A5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/product.xml -o product-DOSS_ask_WB39.xml
curl http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/product.xml -o product-IAG_S5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/product.xml -o product-WTX-StreamPro.xml
curl http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/product.xml -o product-a31imuzobox.xml
curl http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/product.xml -o product-KD_W02.xml
curl http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/product.xml -o product-KD_W01.xml
curl http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/product.xml -o product-APPIO.xml
curl http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/product.xml -o product-GGMM_E2B.xml
curl http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/product.xml -o product-GGMM_E5.xml
curl http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/product.xml -o product-iHome_iLP14.xml
curl http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/product.xml -o product-RP0010_D5_S.xml
curl http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/product.xml -o product-RP0011_WB60_S.xml
curl http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/product.xml -o product-RP0016_S50PRO_S.xml
curl http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/product.xml -o product-RAKOIT_NUPR_WR1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/product.xml -o product-VR80.xml
curl http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/product.xml -o product-WM1103.xml
curl http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/product.xml -o product-WM2205.xml
curl http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/product.xml -o product-Pantheone_V1.xml
curl http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/product.xml -o product-ORPT.xml
curl http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/product.xml -o product-PSAUDIO_Stellar.xml
curl http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/product.xml -o product-Alpha_T18.xml
curl http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/product.xml -o product-TiBo_Bond_2.xml
# clean up directory - there might be URLs with no content (http 404 error message)
#
# 5. download images and additional files for version 20200220 for a downgrade
# combine all files into single file for easier modification
cat ./* > all-products.xml
# manually convert all-products.xlm file into curl downloads - regular expressions and visual studio code are your friends ;-)
#
# Similar to the new version, I have downloaded specific product IDs to their product directory with an 
The same product.xml files that were downloaded above into a common directory are also copied into the product ID directory.
# They were also renamed to "-20200220-original.xml" to makes it easier to create an xml file that is pointing to your own local web server.
curl http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/product.xml -o RP0011_WB60/product-RP0011_WB60-20200220-original.xml
curl http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/product.xml -o RP0011_WB60_S/product-RP0011_WB60_S-20200220-original.xml
curl http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/product.xml -o RP0016_S50PRO_S/product-RP0016_S50PRO_S-20200220-original.xml
curl http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/product.xml -o RP0010_D5/product-RP0010_D5-20200220-original.xml
curl http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/product.xml -o RP0010_D5_S/product-RP0010_D5_S-20200220-original.xml
curl http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/product.xml -o RAKOIT_NUPR_WR1/product-RAKOIT_NUPR_WR1-20200220-original.xml
curl http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/product.xml -o X-50/product-X-50-20200220-original.xml
# MCUs are stored in subdirectories - the first few products are for Arylic/Rakoit
curl --create-dirs http://ota.rakoit.com/release/RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin -o RP0011_WB60/RP0011_WB60-0024-99617ee3-08182020.mcu.bin
curl --create-dirs http://ota.rakoit.com/release/UP2STREAM_PRO_V3/UP2STREAM_PRO_V3-0021-37e5f282-20201212.mcu.bin -o UP2STREAM_PRO_V3/UP2STREAM_PRO_V3-0021-37e5f282-20201212.mcu.bin
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0011_WB60/RP0011_WB600022.mcu.bin -o RP0011_WB60/RP0011_WB600022.mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0011_WB60_S/RP0011_WB60_S0022.mcu.bin -o RP0011_WB60_S/RP0011_WB60_S0022.mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0016_S50PRO_S/RP0016_S50PRO_S0002.mcu.bin -o RP0016_S50PRO_S/RP0016_S50PRO_S0002.mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0010_D5/RP0010_D50021.mcu.bin -o RP0010_D5/RP0010_D50021.mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/RP0010_D5_S/RP0010_D5_S0021.mcu.bin -o RP0010_D5_S/RP0010_D5_S0021.mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/RAKOIT_NUPR_WR1/RAKOIT_NUPR_WR1_0014.mcu.bin -o RAKOIT_NUPR_WR1/RAKOIT_NUPR_WR1_0014.mcu.bin

#########################################################################################################################

#
# the following list contains images and additional files for Linkplay A31 module 
# and several MCUs used in Rakoit/Arylic products
cd a31
# uBoot and backup images are stored in main directory 
# downloads were done above (for version 20220427) -> they differ slightly by binary compare via 'diff', but only in build date
# I believe that they don't differ in functionality, so I skiped an extra download
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/uboot_v632.img -o common/uboot_v632.img
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/backup_new_v1141.img -o common/backup_new_v1141.img
# subdirectory for version 20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/md5.txt -o common/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/MVver_20200220 -o common/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/layout -o common/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/a31rakoit_new_uImage_20200220 -o common/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/user.jffs2 -o common/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/user2.jffs2 -o common/20200220/user2.jffs2
#
# I have downloaded specific products from Arylic and have compared them with 'diff'. In between the products (with same version!) I found no differences.
#
# Below you find "curl" commands that download all firmware to specific subdirectories as I'm not sure if the binaries might differ for some products
#
# subdirectory NTeDAvvJzTUtBekHVnqJrB is reated to product ID RP0011_WB60
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/md5.txt -o RP0011_WB60/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/MVver_20200220 -o RP0011_WB60/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/layout -o RP0011_WB60/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/uboot_v632.img -o RP0011_WB60/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/backup_new_v1141.img -o RP0011_WB60/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/a31rakoit_new_uImage_20200220 -o RP0011_WB60/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/user.jffs2 -o RP0011_WB60/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/NTeDAvvJzTUtBekHVnqJrB/20200220/user2.jffs2 -o RP0011_WB60/20200220/user2.jffs2
# subdirectory drPb6dKCSrFvPiYD8tJiqe is reated to product ID RP0011_WB60_S
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/md5.txt -o RP0011_WB60_S/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/MVver_20200220 -o RP0011_WB60_S/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/layout -o RP0011_WB60_S/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/uboot_v632.img -o RP0011_WB60_S/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/backup_new_v1141.img -o RP0011_WB60_S/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/a31rakoit_new_uImage_20200220 -o RP0011_WB60_S/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/user.jffs2 -o RP0011_WB60_S/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/drPb6dKCSrFvPiYD8tJiqe/20200220/user2.jffs2 -o RP0011_WB60_S/20200220/user2.jffs2
# subdirectory 8kdyt34xmAKp4VC7u5Q3rf is reated to product ID RP0016_S50PRO_S
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/20200220/md5.txt -o RP0016_S50PRO_S/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/20200220/MVver_20200220 -o RP0016_S50PRO_S/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/20200220/layout -o RP0016_S50PRO_S/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/uboot_v632.img -o RP0016_S50PRO_S/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/backup_new_v1141.img -o RP0016_S50PRO_S/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/20200220/a31rakoit_new_uImage_20200220 -o RP0016_S50PRO_S/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/20200220/user.jffs2 -o RP0016_S50PRO_S/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/8kdyt34xmAKp4VC7u5Q3rf/20200220/user2.jffs2 -o RP0016_S50PRO_S/20200220/user2.jffs2
# subdirectory tbdU8hnHdWZTjVNcRuUWxk is reated to product ID RP0010_D5
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/20200220/md5.txt -o RP0010_D5/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/20200220/MVver_20200220 -o RP0010_D5/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/20200220/layout -o RP0010_D5/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/uboot_v632.img -o RP0010_D5/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/backup_new_v1141.img -o RP0010_D5/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/20200220/a31rakoit_new_uImage_20200220 -o RP0010_D5/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/20200220/user.jffs2 -o RP0010_D5/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tbdU8hnHdWZTjVNcRuUWxk/20200220/user2.jffs2 -o RP0010_D5/20200220/user2.jffs2
# subdirectory RV6PaSaUP7eysnK3nzVG4P is reated to product ID RP0010_D5_S
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/20200220/md5.txt -o RP0010_D5_S/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/20200220/MVver_20200220 -o RP0010_D5_S/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/20200220/layout -o RP0010_D5_S/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/uboot_v632.img -o RP0010_D5_S/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/backup_new_v1141.img -o RP0010_D5_S/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/20200220/a31rakoit_new_uImage_20200220 -o RP0010_D5_S/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/20200220/user.jffs2 -o RP0010_D5_S/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RV6PaSaUP7eysnK3nzVG4P/20200220/user2.jffs2 -o RP0010_D5_S/20200220/user2.jffs2
# subdirectory 3zB73J4srEVwcYLG6VCdJ7 is reated to product ID RAKOIT_NUPR_WR1
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/20200220/md5.txt -o RAKOIT_NUPR_WR1/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/20200220/MVver_20200220 -o RAKOIT_NUPR_WR1/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/20200220/layout -o RAKOIT_NUPR_WR1/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/uboot_v632.img -o RAKOIT_NUPR_WR1/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/backup_new_v1141.img -o RAKOIT_NUPR_WR1/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/20200220/a31rakoit_new_uImage_20200220 -o RAKOIT_NUPR_WR1/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/20200220/user.jffs2 -o RAKOIT_NUPR_WR1/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3zB73J4srEVwcYLG6VCdJ7/20200220/user2.jffs2 -o RAKOIT_NUPR_WR1/20200220/user2.jffs2
# subdirectory 2ANRu7eyAEYtoo4NZPy9dL is reated to product ID X-50 (but may be reated to many other products as well)
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/md5.txt -o X-50/20220427/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/MVver_20220427 -o X-50/20220427/MVver_20220427
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/layout -o X-50/20220427/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/uboot_v632.img -o X-50/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/backup_new_v1141.img -o X-50/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/a31rakoit_new_uImage_20220427 -o X-50/20220427/a31rakoit_new_uImage_20220427
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/user.jffs2 -o X-50/20220427/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20220427/user2.jffs2 -o X-50/20220427/user2.jffs2
# version 20200220 manually "crafted"
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20200220/md5.txt -o X-50/20200220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20200220/MVver_20200220 -o X-50/20200220/MVver_20200220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20200220/layout -o X-50/20200220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20200220/a31rakoit_new_uImage_20200220 -o X-50/20200220/a31rakoit_new_uImage_20200220
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/20200220/user.jffs2 -o X-50/20200220/user.jffs2
#curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2ANRu7eyAEYtoo4NZPy9dL/2022020022020427/user2.jffs2 -o X-50/20200220/user2.jffs2
#
# MCUs for other products 
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/A104/AP8064_25Q16_A104_India_V15_MK662X_20190724_jch_enmcu.bin -o A104/AP8064_25Q16_A104_India_V15_MK662X_20190724_jch_enmcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/Alpha_T18/T18_V0.0.4.1_20200420mcu.bin -o Alpha_T18/T18_V0.0.4.1_20200420mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/GGMMA31_E5/GGMMA31_E5_Tencent_024_mcu.bin -o GGMMA31_E5/GGMMA31_E5_Tencent_024_mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/GGMM_E2A/E2A_Alexa_047_mcu.bin -o GGMM_E2A/E2A_Alexa_047_mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/GGMM_E2B/E2B-Tencent_023_mcu.bin -o GGMM_E2B/E2B-Tencent_023_mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/GGMM_E3/E3-Alexa_061_mcu.bin -o GGMM_E3/E3-Alexa_061_mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/GGMM_E5/E5_Tencent_024_mcu.bin -o GGMM_E5/E5_Tencent_024_mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/GGMM_E5A/GGMM_E5A_Alexa_V32_mcu.bin -o GGMM_E5A/GGMM_E5A_Alexa_V32_mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/GoHawk_Lit/AP8064_25Q16_GoHawk_Lit_flat_V28_20190423_jch_enmcu.bin -o GoHawk_Lit/AP8064_25Q16_GoHawk_Lit_flat_V28_20190423_jch_enmcu.bin
curl --create-dirs http://awsota.linkplay.com/wifi_audio_image_mcu/HMDX_W3111/smv15-304-W3111-V0.1.75.MVA.V2mcu.bin -o HMDX_W3111/smv15-304-W3111-V0.1.75.MVA.V2mcu.bin
curl --create-dirs http://awsota.linkplay.com/wifi_audio_image_mcu/HMDX_W3111_EU/smv15-304-W3111-EU-V0.1.53.MVA.V2mcu.bin -o HMDX_W3111_EU/smv15-304-W3111-EU-V0.1.53.MVA.V2mcu.bin
curl --create-dirs http://awsota.linkplay.com/wifi_audio_image_mcu/HMDX_W3111/smv15-304-W3111-V0.1.75.MVA.V2mcu.bin -o HMDX_W3111/smv15-304-W3111-V0.1.75.MVA.V2mcu.bin
curl --create-dirs http://awsota.linkplay.com/wifi_audio_image_mcu/HMDX_W3111_EU/smv15-304-W3111-EU-V0.1.53.MVA.V2mcu.bin -o HMDX_W3111_EU/smv15-304-W3111-EU-V0.1.53.MVA.V2mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/iHome_iAV14/ATS2825_25Q32_TaiDe_iHome_WBT281_V52_20181022_LJCmcu.bin -o iHome_iAV14/ATS2825_25Q32_TaiDe_iHome_WBT281_V52_20181022_LJCmcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/IKBFV378/AP8064_KFJ_8024_V18_20180119_YQRENmcu.bin -o IKBFV378/AP8064_KFJ_8024_V18_20180119_YQRENmcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/jensen/20171025_JENSEN_31324_V048.MVA.V2mcu.bin -o jensen/20171025_JENSEN_31324_V048.MVA.V2mcu.bin
curl --create-dirs http://awsota.linkplay.com/wifi_audio_image_mcu/A6/OE_VAALEXSB80_V14_20181212_YQRENmcu.bin -o A6/OE_VAALEXSB80_V14_20181212_YQRENmcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/ORPT/ORPT_V063_KEY.MVA.V2mcu.bin -o ORPT/ORPT_V063_KEY.MVA.V2mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/Pantheone_V1/ORPT_V063_KEY.MVA.V2mcu.bin -o Pantheone_V1/ORPT_V063_KEY.MVA.V2mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/SANSI_C22RL_TD01/sansi_dingdangver19_E_close_hint_release_mva_wifimcu.bin -o SANSI_C22RL_TD01/sansi_dingdangver19_E_close_hint_release_mva_wifimcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/TIBO_31220/SMV15-440_20181126_TIBO_31220_V036.MVA.mcu.bin -o TIBO_31220/SMV15-440_20181126_TIBO_31220_V036.MVA.mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/TIBO_31322/SMV15-440_20181126_TIBO_31322_V042.MVA.V2mcu.bin -o TIBO_31322/SMV15-440_20181126_TIBO_31322_V042.MVA.V2mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/TIBO_31323/SMV15-440_20181115_TIBO_31323_V042.MVA.V2mcu.bin -o TIBO_31323/SMV15-440_20181115_TIBO_31323_V042.MVA.V2mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/TiBo_Bond_2/TiBo_Bond2_038M_mcu.bin -o TiBo_Bond_2/TiBo_Bond2_038M_mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/WBA31/WBA31_021_mcu.bin -o WBA31/WBA31_021_mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/WMS-1/mcu033.bin -o WMS-1/mcu033.bin
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image_mcu/a28youyishi/mcu.bin -o a28youyishi/mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/iAVS16/iHome_iAVS16_MCU_V4.0.59_20190222_OTA_mcu.bin -o iAVS16/iHome_iAVS16_MCU_V4.0.59_20190222_OTA_mcu.bin
curl --create-dirs http://awsota.linkplay.com/wifi_audio_image_mcu/HMDX_W3111/smv15-304-W3111-V0.1.75.MVA.V2mcu.bin -o HMDX_W3111/smv15-304-W3111-V0.1.75.MVA.V2mcu.bin
curl --create-dirs http://awsota.linkplay.com/wifi_audio_image_mcu/HMDX_W3111_EU/smv15-304-W3111-EU-V0.1.53.MVA.V2mcu.bin -o HMDX_W3111_EU/smv15-304-W3111-EU-V0.1.53.MVA.V2mcu.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_mcu/CAV5/iHome_CAV5_V1.2.35_20190514_mcu.bin -o CAV5/iHome_CAV5_V1.2.35_20190514_mcu.bin
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image_mcu/uyesee-am160/mcu.bin -o uyesee-am160/mcu.bin
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image_mcu/uyesee-i50/mcu.bin -o uyesee-i50/mcu.bin
# DSPs
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_dsp/MV_GoPiano/linkplay_cxdish_pack_64bit_slave_6.180.4.118.bin -o MV_GoPiano/linkplay_cxdish_pack_64bit_slave_6.180.4.118.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_dsp/SANSI_C22RL_TD01/linkplay_cxdish_pack_64bit_master_7.76.12.101.bin -o SANSI_C22RL_TD01/linkplay_cxdish_pack_64bit_master_7.76.12.101.bin
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image_dsp/iAVS16/linkplay_cxdish_pack_64bit_slave_7.26.0.30.bin -o iAVS16/linkplay_cxdish_pack_64bit_slave_7.26.0.30.bin
#
# other products
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/20191209/md5.txt -o mtQsgWcAi6AqQaWmGryt3L/20191209/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/20191209/MVver_20191209 -o mtQsgWcAi6AqQaWmGryt3L/20191209/MVver_20191209
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/20191209/layout -o mtQsgWcAi6AqQaWmGryt3L/20191209/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/uboot_v632.img -o mtQsgWcAi6AqQaWmGryt3L/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/backup_new_v1141.img -o mtQsgWcAi6AqQaWmGryt3L/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/20191209/a31faravs_new_uImage_20191209 -o mtQsgWcAi6AqQaWmGryt3L/20191209/a31faravs_new_uImage_20191209
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/20191209/user.jffs2 -o mtQsgWcAi6AqQaWmGryt3L/20191209/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mtQsgWcAi6AqQaWmGryt3L/20191209/user2.jffs2 -o mtQsgWcAi6AqQaWmGryt3L/20191209/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/20191209/md5.txt -o EfNxWY2R37AoHKx5G5uQZG/20191209/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/20191209/MVver_20191209 -o EfNxWY2R37AoHKx5G5uQZG/20191209/MVver_20191209
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/20191209/layout -o EfNxWY2R37AoHKx5G5uQZG/20191209/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/uboot_v632.img -o EfNxWY2R37AoHKx5G5uQZG/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/backup_new_v1141.img -o EfNxWY2R37AoHKx5G5uQZG/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/20191209/a31faravs_new_uImage_20191209 -o EfNxWY2R37AoHKx5G5uQZG/20191209/a31faravs_new_uImage_20191209
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/20191209/user.jffs2 -o EfNxWY2R37AoHKx5G5uQZG/20191209/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EfNxWY2R37AoHKx5G5uQZG/20191209/user2.jffs2 -o EfNxWY2R37AoHKx5G5uQZG/20191209/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/20210806/md5.txt -o 4KKFSr84R4eGhFvsQetS7B/20210806/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/20210806/MVver_20210806 -o 4KKFSr84R4eGhFvsQetS7B/20210806/MVver_20210806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/20210806/layout -o 4KKFSr84R4eGhFvsQetS7B/20210806/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/uboot_v632.img -o 4KKFSr84R4eGhFvsQetS7B/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/backup_new_v1141.img -o 4KKFSr84R4eGhFvsQetS7B/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/20210806/a31lighting_new_uImage_20210806 -o 4KKFSr84R4eGhFvsQetS7B/20210806/a31lighting_new_uImage_20210806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/20210806/user.jffs2 -o 4KKFSr84R4eGhFvsQetS7B/20210806/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4KKFSr84R4eGhFvsQetS7B/20210806/user2.jffs2 -o 4KKFSr84R4eGhFvsQetS7B/20210806/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/20191125/md5.txt -o ZSm5WDueqcsXWPGgDH7E2U/20191125/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/20191125/MVver_20191125 -o ZSm5WDueqcsXWPGgDH7E2U/20191125/MVver_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/20191125/layout -o ZSm5WDueqcsXWPGgDH7E2U/20191125/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/uboot_v632.img -o ZSm5WDueqcsXWPGgDH7E2U/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/backup_new_v1141.img -o ZSm5WDueqcsXWPGgDH7E2U/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/20191125/a31fortex_srcout_advance_new_uImage_20191125 -o ZSm5WDueqcsXWPGgDH7E2U/20191125/a31fortex_srcout_advance_new_uImage_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/20191125/user.jffs2 -o ZSm5WDueqcsXWPGgDH7E2U/20191125/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZSm5WDueqcsXWPGgDH7E2U/20191125/user2.jffs2 -o ZSm5WDueqcsXWPGgDH7E2U/20191125/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/20191125/md5.txt -o CUQxQiFeeZ5stg8LNehL8g/20191125/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/20191125/MVver_20191125 -o CUQxQiFeeZ5stg8LNehL8g/20191125/MVver_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/20191125/layout -o CUQxQiFeeZ5stg8LNehL8g/20191125/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/uboot_v632.img -o CUQxQiFeeZ5stg8LNehL8g/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/backup_new_v1141.img -o CUQxQiFeeZ5stg8LNehL8g/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/20191125/a31fortex_srcout_advance_new_uImage_20191125 -o CUQxQiFeeZ5stg8LNehL8g/20191125/a31fortex_srcout_advance_new_uImage_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/20191125/user.jffs2 -o CUQxQiFeeZ5stg8LNehL8g/20191125/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CUQxQiFeeZ5stg8LNehL8g/20191125/user2.jffs2 -o CUQxQiFeeZ5stg8LNehL8g/20191125/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/20230324/md5.txt -o HzwLbzLaUUYAWJNTyt2xLP/20230324/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/20230324/MVver_20230324 -o HzwLbzLaUUYAWJNTyt2xLP/20230324/MVver_20230324
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/20230324/layout -o HzwLbzLaUUYAWJNTyt2xLP/20230324/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/uboot_v632.img -o HzwLbzLaUUYAWJNTyt2xLP/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/backup_new_v1141.img -o HzwLbzLaUUYAWJNTyt2xLP/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/20230324/a28slave_noasr_new_uImage_20230324 -o HzwLbzLaUUYAWJNTyt2xLP/20230324/a28slave_noasr_new_uImage_20230324
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/20230324/user.jffs2 -o HzwLbzLaUUYAWJNTyt2xLP/20230324/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HzwLbzLaUUYAWJNTyt2xLP/20230324/user2.jffs2 -o HzwLbzLaUUYAWJNTyt2xLP/20230324/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/20180828/md5.txt -o kcEHShDffGQgQJEMR88TDA/20180828/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/20180828/MVver_20180828 -o kcEHShDffGQgQJEMR88TDA/20180828/MVver_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/20180828/layout -o kcEHShDffGQgQJEMR88TDA/20180828/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/uboot_v632.img -o kcEHShDffGQgQJEMR88TDA/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/backup_new_v1141.img -o kcEHShDffGQgQJEMR88TDA/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/20180828/a31faralexa_new_uImage_20180828 -o kcEHShDffGQgQJEMR88TDA/20180828/a31faralexa_new_uImage_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/20180828/user.jffs2 -o kcEHShDffGQgQJEMR88TDA/20180828/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/kcEHShDffGQgQJEMR88TDA/20180828/user2.jffs2 -o kcEHShDffGQgQJEMR88TDA/20180828/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/20201024/md5.txt -o vbffPpTPZbchGmBGXLjJyg/20201024/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/20201024/MVver_20201024 -o vbffPpTPZbchGmBGXLjJyg/20201024/MVver_20201024
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/20201024/layout -o vbffPpTPZbchGmBGXLjJyg/20201024/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/uboot_v632.img -o vbffPpTPZbchGmBGXLjJyg/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/backup_new_v1141.img -o vbffPpTPZbchGmBGXLjJyg/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/20201024/a31youyishi_advance_new_uImage_20201024 -o vbffPpTPZbchGmBGXLjJyg/20201024/a31youyishi_advance_new_uImage_20201024
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/20201024/user.jffs2 -o vbffPpTPZbchGmBGXLjJyg/20201024/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vbffPpTPZbchGmBGXLjJyg/20201024/user2.jffs2 -o vbffPpTPZbchGmBGXLjJyg/20201024/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/20200319/md5.txt -o E9V3GZxKjiT4L4XKckfaL2/20200319/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/20200319/MVver_20200319 -o E9V3GZxKjiT4L4XKckfaL2/20200319/MVver_20200319
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/20200319/layout -o E9V3GZxKjiT4L4XKckfaL2/20200319/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/uboot_v632.img -o E9V3GZxKjiT4L4XKckfaL2/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/backup_new_v1141.img -o E9V3GZxKjiT4L4XKckfaL2/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/20200319/a31iotcontrl_new_uImage_20200319 -o E9V3GZxKjiT4L4XKckfaL2/20200319/a31iotcontrl_new_uImage_20200319
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/20200319/user.jffs2 -o E9V3GZxKjiT4L4XKckfaL2/20200319/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/E9V3GZxKjiT4L4XKckfaL2/20200319/user2.jffs2 -o E9V3GZxKjiT4L4XKckfaL2/20200319/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/20220913/md5.txt -o rXG8g94Pke2JAXDMS8ZCZa/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/20220913/MVver_20220913 -o rXG8g94Pke2JAXDMS8ZCZa/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/20220913/layout -o rXG8g94Pke2JAXDMS8ZCZa/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/uboot_v632.img -o rXG8g94Pke2JAXDMS8ZCZa/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/backup_new_v1141.img -o rXG8g94Pke2JAXDMS8ZCZa/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/20220913/a31youyishi_audiocastM5_new_uImage_20220913 -o rXG8g94Pke2JAXDMS8ZCZa/20220913/a31youyishi_audiocastM5_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/20220913/user.jffs2 -o rXG8g94Pke2JAXDMS8ZCZa/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rXG8g94Pke2JAXDMS8ZCZa/20220913/user2.jffs2 -o rXG8g94Pke2JAXDMS8ZCZa/20220913/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/20211111/md5.txt -o JFuvwvZoFqsiMw33MQ6prF/20211111/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/20211111/MVver_20211111 -o JFuvwvZoFqsiMw33MQ6prF/20211111/MVver_20211111
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/20211111/layout -o JFuvwvZoFqsiMw33MQ6prF/20211111/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/uboot_v632.img -o JFuvwvZoFqsiMw33MQ6prF/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/backup_new_v1141.img -o JFuvwvZoFqsiMw33MQ6prF/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/20211111/a28audiopro_new_uImage_20211111 -o JFuvwvZoFqsiMw33MQ6prF/20211111/a28audiopro_new_uImage_20211111
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/20211111/user.jffs2 -o JFuvwvZoFqsiMw33MQ6prF/20211111/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JFuvwvZoFqsiMw33MQ6prF/20211111/user2.jffs2 -o JFuvwvZoFqsiMw33MQ6prF/20211111/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/20211210/md5.txt -o xDxwQLTqJjaDXBLJKHkspF/20211210/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/20211210/MVver_20211210 -o xDxwQLTqJjaDXBLJKHkspF/20211210/MVver_20211210
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/20211210/layout -o xDxwQLTqJjaDXBLJKHkspF/20211210/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/uboot_v632.img -o xDxwQLTqJjaDXBLJKHkspF/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/backup_new_v1141.img -o xDxwQLTqJjaDXBLJKHkspF/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/20211210/a28audiopro_nomfi_new_uImage_20211210 -o xDxwQLTqJjaDXBLJKHkspF/20211210/a28audiopro_nomfi_new_uImage_20211210
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/20211210/user.jffs2 -o xDxwQLTqJjaDXBLJKHkspF/20211210/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xDxwQLTqJjaDXBLJKHkspF/20211210/user2.jffs2 -o xDxwQLTqJjaDXBLJKHkspF/20211210/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/20211210/md5.txt -o Dmn9C4PxMuZDQEgcGi5p7e/20211210/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/20211210/MVver_20211210 -o Dmn9C4PxMuZDQEgcGi5p7e/20211210/MVver_20211210
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/20211210/layout -o Dmn9C4PxMuZDQEgcGi5p7e/20211210/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/uboot_v632.img -o Dmn9C4PxMuZDQEgcGi5p7e/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/backup_new_v1141.img -o Dmn9C4PxMuZDQEgcGi5p7e/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/20211210/a28audiopro_nomfi_new_uImage_20211210 -o Dmn9C4PxMuZDQEgcGi5p7e/20211210/a28audiopro_nomfi_new_uImage_20211210
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/20211210/user.jffs2 -o Dmn9C4PxMuZDQEgcGi5p7e/20211210/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Dmn9C4PxMuZDQEgcGi5p7e/20211210/user2.jffs2 -o Dmn9C4PxMuZDQEgcGi5p7e/20211210/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/20211111/md5.txt -o uebawJcsZVqzvAxtRVyJdM/20211111/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/20211111/MVver_20211111 -o uebawJcsZVqzvAxtRVyJdM/20211111/MVver_20211111
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/20211111/layout -o uebawJcsZVqzvAxtRVyJdM/20211111/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/uboot_v632.img -o uebawJcsZVqzvAxtRVyJdM/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/backup_new_v1141.img -o uebawJcsZVqzvAxtRVyJdM/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/20211111/a28audiopro_new_uImage_20211111 -o uebawJcsZVqzvAxtRVyJdM/20211111/a28audiopro_new_uImage_20211111
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/20211111/user.jffs2 -o uebawJcsZVqzvAxtRVyJdM/20211111/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uebawJcsZVqzvAxtRVyJdM/20211111/user2.jffs2 -o uebawJcsZVqzvAxtRVyJdM/20211111/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/20211130/md5.txt -o WSEwi3ZkfptWrkwRr6RjN7/20211130/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/20211130/MVver_20211130 -o WSEwi3ZkfptWrkwRr6RjN7/20211130/MVver_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/20211130/layout -o WSEwi3ZkfptWrkwRr6RjN7/20211130/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/uboot_v632.img -o WSEwi3ZkfptWrkwRr6RjN7/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/backup_new_v1141.img -o WSEwi3ZkfptWrkwRr6RjN7/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/20211130/a28audiopro_new_uImage_20211130 -o WSEwi3ZkfptWrkwRr6RjN7/20211130/a28audiopro_new_uImage_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/20211130/user.jffs2 -o WSEwi3ZkfptWrkwRr6RjN7/20211130/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WSEwi3ZkfptWrkwRr6RjN7/20211130/user2.jffs2 -o WSEwi3ZkfptWrkwRr6RjN7/20211130/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/20211130/md5.txt -o PoyrfPSq2E5HML9RfUHyha/20211130/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/20211130/MVver_20211130 -o PoyrfPSq2E5HML9RfUHyha/20211130/MVver_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/20211130/layout -o PoyrfPSq2E5HML9RfUHyha/20211130/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/uboot_v632.img -o PoyrfPSq2E5HML9RfUHyha/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/backup_new_v1141.img -o PoyrfPSq2E5HML9RfUHyha/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/20211130/a28audiopro_new_uImage_20211130 -o PoyrfPSq2E5HML9RfUHyha/20211130/a28audiopro_new_uImage_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/20211130/user.jffs2 -o PoyrfPSq2E5HML9RfUHyha/20211130/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PoyrfPSq2E5HML9RfUHyha/20211130/user2.jffs2 -o PoyrfPSq2E5HML9RfUHyha/20211130/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/20211130/md5.txt -o soMmKdzxQHXzis5Jb2tqgf/20211130/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/20211130/MVver_20211130 -o soMmKdzxQHXzis5Jb2tqgf/20211130/MVver_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/20211130/layout -o soMmKdzxQHXzis5Jb2tqgf/20211130/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/uboot_v632.img -o soMmKdzxQHXzis5Jb2tqgf/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/backup_new_v1141.img -o soMmKdzxQHXzis5Jb2tqgf/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/20211130/a28audiopro_new_uImage_20211130 -o soMmKdzxQHXzis5Jb2tqgf/20211130/a28audiopro_new_uImage_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/20211130/user.jffs2 -o soMmKdzxQHXzis5Jb2tqgf/20211130/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/soMmKdzxQHXzis5Jb2tqgf/20211130/user2.jffs2 -o soMmKdzxQHXzis5Jb2tqgf/20211130/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/20220318/md5.txt -o KVLPHmYrzTHEhDkEapoQTL/20220318/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/20220318/MVver_20220318 -o KVLPHmYrzTHEhDkEapoQTL/20220318/MVver_20220318
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/20220318/layout -o KVLPHmYrzTHEhDkEapoQTL/20220318/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/uboot_v632.img -o KVLPHmYrzTHEhDkEapoQTL/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/backup_new_v1141.img -o KVLPHmYrzTHEhDkEapoQTL/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/20220318/a28audioproalexa_new_uImage_20220318 -o KVLPHmYrzTHEhDkEapoQTL/20220318/a28audioproalexa_new_uImage_20220318
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/20220318/user.jffs2 -o KVLPHmYrzTHEhDkEapoQTL/20220318/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KVLPHmYrzTHEhDkEapoQTL/20220318/user2.jffs2 -o KVLPHmYrzTHEhDkEapoQTL/20220318/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/20211130/md5.txt -o fDAFfzo8adRzvRXQLopnJ9/20211130/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/20211130/MVver_20211130 -o fDAFfzo8adRzvRXQLopnJ9/20211130/MVver_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/20211130/layout -o fDAFfzo8adRzvRXQLopnJ9/20211130/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/uboot_v632.img -o fDAFfzo8adRzvRXQLopnJ9/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/backup_new_v1141.img -o fDAFfzo8adRzvRXQLopnJ9/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/20211130/a28audiopro_new_uImage_20211130 -o fDAFfzo8adRzvRXQLopnJ9/20211130/a28audiopro_new_uImage_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/20211130/user.jffs2 -o fDAFfzo8adRzvRXQLopnJ9/20211130/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fDAFfzo8adRzvRXQLopnJ9/20211130/user2.jffs2 -o fDAFfzo8adRzvRXQLopnJ9/20211130/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/20211210/md5.txt -o DJGVsJphEarZDsSEEREfSa/20211210/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/20211210/MVver_20211210 -o DJGVsJphEarZDsSEEREfSa/20211210/MVver_20211210
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/20211210/layout -o DJGVsJphEarZDsSEEREfSa/20211210/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/uboot_v632.img -o DJGVsJphEarZDsSEEREfSa/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/backup_new_v1141.img -o DJGVsJphEarZDsSEEREfSa/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/20211210/a28audioproLINK1_alexa_new_uImage_20211210 -o DJGVsJphEarZDsSEEREfSa/20211210/a28audioproLINK1_alexa_new_uImage_20211210
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/20211210/user.jffs2 -o DJGVsJphEarZDsSEEREfSa/20211210/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DJGVsJphEarZDsSEEREfSa/20211210/user2.jffs2 -o DJGVsJphEarZDsSEEREfSa/20211210/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/20180927/md5.txt -o LpAjWLLUSC6rgviKLTHJab/20180927/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/20180927/MVver_20180927 -o LpAjWLLUSC6rgviKLTHJab/20180927/MVver_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/20180927/layout -o LpAjWLLUSC6rgviKLTHJab/20180927/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/uboot_v632.img -o LpAjWLLUSC6rgviKLTHJab/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/backup_new_v1141.img -o LpAjWLLUSC6rgviKLTHJab/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/20180927/a31nearalexa_new_uImage_20180927 -o LpAjWLLUSC6rgviKLTHJab/20180927/a31nearalexa_new_uImage_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/20180927/user.jffs2 -o LpAjWLLUSC6rgviKLTHJab/20180927/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LpAjWLLUSC6rgviKLTHJab/20180927/user2.jffs2 -o LpAjWLLUSC6rgviKLTHJab/20180927/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/20181023/md5.txt -o WqeUtpRum4p2sQ4hJszenY/20181023/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/20181023/MVver_20181023 -o WqeUtpRum4p2sQ4hJszenY/20181023/MVver_20181023
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/20181023/layout -o WqeUtpRum4p2sQ4hJszenY/20181023/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/uboot_v632.img -o WqeUtpRum4p2sQ4hJszenY/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/backup_new_v1141.img -o WqeUtpRum4p2sQ4hJszenY/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/20181023/a31slave_noasr_new_uImage_20181023 -o WqeUtpRum4p2sQ4hJszenY/20181023/a31slave_noasr_new_uImage_20181023
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/20181023/user.jffs2 -o WqeUtpRum4p2sQ4hJszenY/20181023/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WqeUtpRum4p2sQ4hJszenY/20181023/user2.jffs2 -o WqeUtpRum4p2sQ4hJszenY/20181023/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/20180828/md5.txt -o ZUDJAUB7hHZigfRCCm6Zei/20180828/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/20180828/MVver_20180828 -o ZUDJAUB7hHZigfRCCm6Zei/20180828/MVver_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/20180828/layout -o ZUDJAUB7hHZigfRCCm6Zei/20180828/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/uboot_v632.img -o ZUDJAUB7hHZigfRCCm6Zei/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/backup_new_v1141.img -o ZUDJAUB7hHZigfRCCm6Zei/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/20180828/a31faralexa_new_uImage_20180828 -o ZUDJAUB7hHZigfRCCm6Zei/20180828/a31faralexa_new_uImage_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/20180828/user.jffs2 -o ZUDJAUB7hHZigfRCCm6Zei/20180828/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZUDJAUB7hHZigfRCCm6Zei/20180828/user2.jffs2 -o ZUDJAUB7hHZigfRCCm6Zei/20180828/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/20180829/md5.txt -o DpcPCDUfSWRrtJYibqkbqA/20180829/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/20180829/MVver_20180829 -o DpcPCDUfSWRrtJYibqkbqA/20180829/MVver_20180829
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/20180829/layout -o DpcPCDUfSWRrtJYibqkbqA/20180829/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/uboot_v632.img -o DpcPCDUfSWRrtJYibqkbqA/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/backup_new_v1141.img -o DpcPCDUfSWRrtJYibqkbqA/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/20180829/a31junlandpi_alexa_new_uImage_20180829 -o DpcPCDUfSWRrtJYibqkbqA/20180829/a31junlandpi_alexa_new_uImage_20180829
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/20180829/user.jffs2 -o DpcPCDUfSWRrtJYibqkbqA/20180829/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/DpcPCDUfSWRrtJYibqkbqA/20180829/user2.jffs2 -o DpcPCDUfSWRrtJYibqkbqA/20180829/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/20180828/md5.txt -o PXbnWPjZDVa8NKNynpHtXZ/20180828/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/20180828/MVver_20180828 -o PXbnWPjZDVa8NKNynpHtXZ/20180828/MVver_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/20180828/layout -o PXbnWPjZDVa8NKNynpHtXZ/20180828/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/uboot_v632.img -o PXbnWPjZDVa8NKNynpHtXZ/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/backup_new_v1141.img -o PXbnWPjZDVa8NKNynpHtXZ/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/20180828/a31faralexa_new_uImage_20180828 -o PXbnWPjZDVa8NKNynpHtXZ/20180828/a31faralexa_new_uImage_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/20180828/user.jffs2 -o PXbnWPjZDVa8NKNynpHtXZ/20180828/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PXbnWPjZDVa8NKNynpHtXZ/20180828/user2.jffs2 -o PXbnWPjZDVa8NKNynpHtXZ/20180828/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/20190702/md5.txt -o YZEmUv2kNkmtQZhjefXUB4/20190702/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/20190702/MVver_20190702 -o YZEmUv2kNkmtQZhjefXUB4/20190702/MVver_20190702
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/20190702/layout -o YZEmUv2kNkmtQZhjefXUB4/20190702/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/uboot_v632.img -o YZEmUv2kNkmtQZhjefXUB4/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/backup_new_v1141.img -o YZEmUv2kNkmtQZhjefXUB4/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/20190702/a31faravs_new_uImage_20190702 -o YZEmUv2kNkmtQZhjefXUB4/20190702/a31faravs_new_uImage_20190702
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/20190702/user.jffs2 -o YZEmUv2kNkmtQZhjefXUB4/20190702/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/YZEmUv2kNkmtQZhjefXUB4/20190702/user2.jffs2 -o YZEmUv2kNkmtQZhjefXUB4/20190702/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/20190827/md5.txt -o sXS622bh4fWhzxBRUpJWjS/20190827/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/20190827/MVver_20190827 -o sXS622bh4fWhzxBRUpJWjS/20190827/MVver_20190827
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/20190827/layout -o sXS622bh4fWhzxBRUpJWjS/20190827/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/uboot_v632.img -o sXS622bh4fWhzxBRUpJWjS/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/backup_new_v1141.img -o sXS622bh4fWhzxBRUpJWjS/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/20190827/a31slave_noasr_easylink_new_uImage_20190827 -o sXS622bh4fWhzxBRUpJWjS/20190827/a31slave_noasr_easylink_new_uImage_20190827
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/20190827/user.jffs2 -o sXS622bh4fWhzxBRUpJWjS/20190827/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sXS622bh4fWhzxBRUpJWjS/20190827/user2.jffs2 -o sXS622bh4fWhzxBRUpJWjS/20190827/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/MkWhpLEVeBDcUhWAwMAP7K/20180507/MVver_20180507 -o MkWhpLEVeBDcUhWAwMAP7K/20180507/MVver_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/MkWhpLEVeBDcUhWAwMAP7K/20180507/layout -o MkWhpLEVeBDcUhWAwMAP7K/20180507/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/MkWhpLEVeBDcUhWAwMAP7K/uboot_v632.img -o MkWhpLEVeBDcUhWAwMAP7K/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/MkWhpLEVeBDcUhWAwMAP7K/backup_new_v1141.img -o MkWhpLEVeBDcUhWAwMAP7K/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/MkWhpLEVeBDcUhWAwMAP7K/20180507/a31slave_noasr_new_uImage_20180507 -o MkWhpLEVeBDcUhWAwMAP7K/20180507/a31slave_noasr_new_uImage_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/MkWhpLEVeBDcUhWAwMAP7K/20180507/user.jffs2 -o MkWhpLEVeBDcUhWAwMAP7K/20180507/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/MkWhpLEVeBDcUhWAwMAP7K/20180507/user2.jffs2 -o MkWhpLEVeBDcUhWAwMAP7K/20180507/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/iRCSrsweuKU7N8mEBBmrmm/20180507/MVver_20180507 -o iRCSrsweuKU7N8mEBBmrmm/20180507/MVver_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/iRCSrsweuKU7N8mEBBmrmm/20180507/layout -o iRCSrsweuKU7N8mEBBmrmm/20180507/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/iRCSrsweuKU7N8mEBBmrmm/uboot_v632.img -o iRCSrsweuKU7N8mEBBmrmm/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/iRCSrsweuKU7N8mEBBmrmm/backup_new_v1141.img -o iRCSrsweuKU7N8mEBBmrmm/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/iRCSrsweuKU7N8mEBBmrmm/20180507/a31slave_noasr_new_uImage_20180507 -o iRCSrsweuKU7N8mEBBmrmm/20180507/a31slave_noasr_new_uImage_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/iRCSrsweuKU7N8mEBBmrmm/20180507/user.jffs2 -o iRCSrsweuKU7N8mEBBmrmm/20180507/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/iRCSrsweuKU7N8mEBBmrmm/20180507/user2.jffs2 -o iRCSrsweuKU7N8mEBBmrmm/20180507/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/T8WHW3WBC388ZPp5T3kZmL/20180507/MVver_20180507 -o T8WHW3WBC388ZPp5T3kZmL/20180507/MVver_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/T8WHW3WBC388ZPp5T3kZmL/20180507/layout -o T8WHW3WBC388ZPp5T3kZmL/20180507/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/T8WHW3WBC388ZPp5T3kZmL/uboot_v632.img -o T8WHW3WBC388ZPp5T3kZmL/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/T8WHW3WBC388ZPp5T3kZmL/backup_new_v1141.img -o T8WHW3WBC388ZPp5T3kZmL/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/T8WHW3WBC388ZPp5T3kZmL/20180507/a31slave_noasr_new_uImage_20180507 -o T8WHW3WBC388ZPp5T3kZmL/20180507/a31slave_noasr_new_uImage_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/T8WHW3WBC388ZPp5T3kZmL/20180507/user.jffs2 -o T8WHW3WBC388ZPp5T3kZmL/20180507/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/T8WHW3WBC388ZPp5T3kZmL/20180507/user2.jffs2 -o T8WHW3WBC388ZPp5T3kZmL/20180507/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/rnr6zEepJNK4J5BNzanJc6/20180507/MVver_20180507 -o rnr6zEepJNK4J5BNzanJc6/20180507/MVver_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/rnr6zEepJNK4J5BNzanJc6/20180507/layout -o rnr6zEepJNK4J5BNzanJc6/20180507/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/rnr6zEepJNK4J5BNzanJc6/uboot_v632.img -o rnr6zEepJNK4J5BNzanJc6/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/rnr6zEepJNK4J5BNzanJc6/backup_new_v1141.img -o rnr6zEepJNK4J5BNzanJc6/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/rnr6zEepJNK4J5BNzanJc6/20180507/a31slave_noasr_new_uImage_20180507 -o rnr6zEepJNK4J5BNzanJc6/20180507/a31slave_noasr_new_uImage_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/rnr6zEepJNK4J5BNzanJc6/20180507/user.jffs2 -o rnr6zEepJNK4J5BNzanJc6/20180507/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/rnr6zEepJNK4J5BNzanJc6/20180507/user2.jffs2 -o rnr6zEepJNK4J5BNzanJc6/20180507/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/MVver_20180507 -o BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/MVver_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/layout -o BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BJ8Kp4cDDNkbJJ2BMFZBPg/uboot_v632.img -o BJ8Kp4cDDNkbJJ2BMFZBPg/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BJ8Kp4cDDNkbJJ2BMFZBPg/backup_new_v1141.img -o BJ8Kp4cDDNkbJJ2BMFZBPg/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/a31slave_noasr_new_uImage_20180507 -o BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/a31slave_noasr_new_uImage_20180507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/user.jffs2 -o BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/user2.jffs2 -o BJ8Kp4cDDNkbJJ2BMFZBPg/20180507/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/20190111/md5.txt -o pbbCA2qMutBWnvDVmSf8rA/20190111/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/20190111/MVver_20190111 -o pbbCA2qMutBWnvDVmSf8rA/20190111/MVver_20190111
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/20190111/layout -o pbbCA2qMutBWnvDVmSf8rA/20190111/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/uboot_v632.img -o pbbCA2qMutBWnvDVmSf8rA/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/backup_new_v1141.img -o pbbCA2qMutBWnvDVmSf8rA/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/20190111/a28faravs_new_uImage_20190111 -o pbbCA2qMutBWnvDVmSf8rA/20190111/a28faravs_new_uImage_20190111
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/20190111/user.jffs2 -o pbbCA2qMutBWnvDVmSf8rA/20190111/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pbbCA2qMutBWnvDVmSf8rA/20190111/user2.jffs2 -o pbbCA2qMutBWnvDVmSf8rA/20190111/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/20180927/md5.txt -o BUCugjpzLGJDaScjijEDMY/20180927/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/20180927/MVver_20180927 -o BUCugjpzLGJDaScjijEDMY/20180927/MVver_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/20180927/layout -o BUCugjpzLGJDaScjijEDMY/20180927/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/uboot_v632.img -o BUCugjpzLGJDaScjijEDMY/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/backup_new_v1141.img -o BUCugjpzLGJDaScjijEDMY/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/20180927/a31nearalexa_new_uImage_20180927 -o BUCugjpzLGJDaScjijEDMY/20180927/a31nearalexa_new_uImage_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/20180927/user.jffs2 -o BUCugjpzLGJDaScjijEDMY/20180927/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BUCugjpzLGJDaScjijEDMY/20180927/user2.jffs2 -o BUCugjpzLGJDaScjijEDMY/20180927/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/20181205/md5.txt -o c3uDQx9i6Azno9fH25kMbR/20181205/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/20181205/MVver_20181205 -o c3uDQx9i6Azno9fH25kMbR/20181205/MVver_20181205
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/20181205/layout -o c3uDQx9i6Azno9fH25kMbR/20181205/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/uboot_v632.img -o c3uDQx9i6Azno9fH25kMbR/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/backup_new_v1141.img -o c3uDQx9i6Azno9fH25kMbR/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/20181205/a31dossfabriqplus_global_new_uImage_20181205 -o c3uDQx9i6Azno9fH25kMbR/20181205/a31dossfabriqplus_global_new_uImage_20181205
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/20181205/user.jffs2 -o c3uDQx9i6Azno9fH25kMbR/20181205/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/c3uDQx9i6Azno9fH25kMbR/20181205/user2.jffs2 -o c3uDQx9i6Azno9fH25kMbR/20181205/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/20191129/md5.txt -o bg8u4bkjEwq3HzT5DzA5wR/20191129/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/20191129/MVver_20191129 -o bg8u4bkjEwq3HzT5DzA5wR/20191129/MVver_20191129
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/20191129/layout -o bg8u4bkjEwq3HzT5DzA5wR/20191129/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/uboot_v632.img -o bg8u4bkjEwq3HzT5DzA5wR/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/backup_new_v1141.img -o bg8u4bkjEwq3HzT5DzA5wR/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/20191129/a31faravs_new_uImage_20191129 -o bg8u4bkjEwq3HzT5DzA5wR/20191129/a31faravs_new_uImage_20191129
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/20191129/user.jffs2 -o bg8u4bkjEwq3HzT5DzA5wR/20191129/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/bg8u4bkjEwq3HzT5DzA5wR/20191129/user2.jffs2 -o bg8u4bkjEwq3HzT5DzA5wR/20191129/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/20211130/md5.txt -o tPgrXrJcbqL4rpVypJ5BSP/20211130/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/20211130/MVver_20211130 -o tPgrXrJcbqL4rpVypJ5BSP/20211130/MVver_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/20211130/layout -o tPgrXrJcbqL4rpVypJ5BSP/20211130/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/uboot_v632.img -o tPgrXrJcbqL4rpVypJ5BSP/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/backup_new_v1141.img -o tPgrXrJcbqL4rpVypJ5BSP/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/20211130/a28audiopro_new_uImage_20211130 -o tPgrXrJcbqL4rpVypJ5BSP/20211130/a28audiopro_new_uImage_20211130
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/20211130/user.jffs2 -o tPgrXrJcbqL4rpVypJ5BSP/20211130/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tPgrXrJcbqL4rpVypJ5BSP/20211130/user2.jffs2 -o tPgrXrJcbqL4rpVypJ5BSP/20211130/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9sdYrtLfzDEi7eYf3x5zUW/20180604/MVver_20180604 -o 9sdYrtLfzDEi7eYf3x5zUW/20180604/MVver_20180604
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9sdYrtLfzDEi7eYf3x5zUW/20180604/layout -o 9sdYrtLfzDEi7eYf3x5zUW/20180604/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9sdYrtLfzDEi7eYf3x5zUW/uboot_v632.img -o 9sdYrtLfzDEi7eYf3x5zUW/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9sdYrtLfzDEi7eYf3x5zUW/backup_new_v1141.img -o 9sdYrtLfzDEi7eYf3x5zUW/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9sdYrtLfzDEi7eYf3x5zUW/20180604/a31virtuozalexa_new_uImage_20180604 -o 9sdYrtLfzDEi7eYf3x5zUW/20180604/a31virtuozalexa_new_uImage_20180604
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9sdYrtLfzDEi7eYf3x5zUW/20180604/user.jffs2 -o 9sdYrtLfzDEi7eYf3x5zUW/20180604/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9sdYrtLfzDEi7eYf3x5zUW/20180604/user2.jffs2 -o 9sdYrtLfzDEi7eYf3x5zUW/20180604/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/20200319/md5.txt -o 2wZ48rJHPEBJHPa46U77Um/20200319/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/20200319/MVver_20200319 -o 2wZ48rJHPEBJHPa46U77Um/20200319/MVver_20200319
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/20200319/layout -o 2wZ48rJHPEBJHPa46U77Um/20200319/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/uboot_v632.img -o 2wZ48rJHPEBJHPa46U77Um/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/backup_new_v1141.img -o 2wZ48rJHPEBJHPa46U77Um/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/20200319/a31tvs2_nearggmm_new_uImage_20200319 -o 2wZ48rJHPEBJHPa46U77Um/20200319/a31tvs2_nearggmm_new_uImage_20200319
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/20200319/user.jffs2 -o 2wZ48rJHPEBJHPa46U77Um/20200319/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2wZ48rJHPEBJHPa46U77Um/20200319/user2.jffs2 -o 2wZ48rJHPEBJHPa46U77Um/20200319/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/20200706/md5.txt -o p7g5dwB2D4xExMyY4SmiLh/20200706/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/20200706/MVver_20200706 -o p7g5dwB2D4xExMyY4SmiLh/20200706/MVver_20200706
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/20200706/layout -o p7g5dwB2D4xExMyY4SmiLh/20200706/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/uboot_v632.img -o p7g5dwB2D4xExMyY4SmiLh/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/backup_new_v1141.img -o p7g5dwB2D4xExMyY4SmiLh/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/20200706/a31ggmmalexa_new_uImage_20200706 -o p7g5dwB2D4xExMyY4SmiLh/20200706/a31ggmmalexa_new_uImage_20200706
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/20200706/user.jffs2 -o p7g5dwB2D4xExMyY4SmiLh/20200706/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/p7g5dwB2D4xExMyY4SmiLh/20200706/user2.jffs2 -o p7g5dwB2D4xExMyY4SmiLh/20200706/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/20200706/md5.txt -o th5KUjZvmvPxGXgfj2YDAg/20200706/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/20200706/MVver_20200706 -o th5KUjZvmvPxGXgfj2YDAg/20200706/MVver_20200706
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/20200706/layout -o th5KUjZvmvPxGXgfj2YDAg/20200706/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/uboot_v632.img -o th5KUjZvmvPxGXgfj2YDAg/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/backup_new_v1141.img -o th5KUjZvmvPxGXgfj2YDAg/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/20200706/a31ggmmalexa_new_uImage_20200706 -o th5KUjZvmvPxGXgfj2YDAg/20200706/a31ggmmalexa_new_uImage_20200706
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/20200706/user.jffs2 -o th5KUjZvmvPxGXgfj2YDAg/20200706/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/th5KUjZvmvPxGXgfj2YDAg/20200706/user2.jffs2 -o th5KUjZvmvPxGXgfj2YDAg/20200706/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/20200319/md5.txt -o 9y3Aodzv9gmY2iw2T3pDG4/20200319/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/20200319/MVver_20200319 -o 9y3Aodzv9gmY2iw2T3pDG4/20200319/MVver_20200319
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/20200319/layout -o 9y3Aodzv9gmY2iw2T3pDG4/20200319/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/uboot_v632.img -o 9y3Aodzv9gmY2iw2T3pDG4/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/backup_new_v1141.img -o 9y3Aodzv9gmY2iw2T3pDG4/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/20200319/a31tvs2_nearggmm_new_uImage_20200319 -o 9y3Aodzv9gmY2iw2T3pDG4/20200319/a31tvs2_nearggmm_new_uImage_20200319
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/20200319/user.jffs2 -o 9y3Aodzv9gmY2iw2T3pDG4/20200319/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/9y3Aodzv9gmY2iw2T3pDG4/20200319/user2.jffs2 -o 9y3Aodzv9gmY2iw2T3pDG4/20200319/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/20200706/md5.txt -o ZRKmdxQ3JjXGhxafN399DA/20200706/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/20200706/MVver_20200706 -o ZRKmdxQ3JjXGhxafN399DA/20200706/MVver_20200706
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/20200706/layout -o ZRKmdxQ3JjXGhxafN399DA/20200706/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/uboot_v632.img -o ZRKmdxQ3JjXGhxafN399DA/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/backup_new_v1141.img -o ZRKmdxQ3JjXGhxafN399DA/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/20200706/a31ggmmalexa_new_uImage_20200706 -o ZRKmdxQ3JjXGhxafN399DA/20200706/a31ggmmalexa_new_uImage_20200706
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/20200706/user.jffs2 -o ZRKmdxQ3JjXGhxafN399DA/20200706/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZRKmdxQ3JjXGhxafN399DA/20200706/user2.jffs2 -o ZRKmdxQ3JjXGhxafN399DA/20200706/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/20200401/md5.txt -o A9brNWLJGkkmu83oMBkCBG/20200401/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/20200401/MVver_20200401 -o A9brNWLJGkkmu83oMBkCBG/20200401/MVver_20200401
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/20200401/layout -o A9brNWLJGkkmu83oMBkCBG/20200401/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/uboot_v632.img -o A9brNWLJGkkmu83oMBkCBG/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/backup_new_v1141.img -o A9brNWLJGkkmu83oMBkCBG/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/20200401/a28ggmmneartvs_new_uImage_20200401 -o A9brNWLJGkkmu83oMBkCBG/20200401/a28ggmmneartvs_new_uImage_20200401
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/20200401/user.jffs2 -o A9brNWLJGkkmu83oMBkCBG/20200401/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A9brNWLJGkkmu83oMBkCBG/20200401/user2.jffs2 -o A9brNWLJGkkmu83oMBkCBG/20200401/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/20200720/md5.txt -o ET4zJuZbHwLY34qXrpA5N2/20200720/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/20200720/MVver_20200720 -o ET4zJuZbHwLY34qXrpA5N2/20200720/MVver_20200720
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/20200720/layout -o ET4zJuZbHwLY34qXrpA5N2/20200720/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/uboot_v632.img -o ET4zJuZbHwLY34qXrpA5N2/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/backup_new_v1141.img -o ET4zJuZbHwLY34qXrpA5N2/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/20200720/a28ggmm_alexa_new_uImage_20200720 -o ET4zJuZbHwLY34qXrpA5N2/20200720/a28ggmm_alexa_new_uImage_20200720
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/20200720/user.jffs2 -o ET4zJuZbHwLY34qXrpA5N2/20200720/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ET4zJuZbHwLY34qXrpA5N2/20200720/user2.jffs2 -o ET4zJuZbHwLY34qXrpA5N2/20200720/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/20190415/md5.txt -o CBeNHSYJTHTrGiZUQUsfyJ/20190415/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/20190415/MVver_20190415 -o CBeNHSYJTHTrGiZUQUsfyJ/20190415/MVver_20190415
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/20190415/layout -o CBeNHSYJTHTrGiZUQUsfyJ/20190415/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/uboot_v632.img -o CBeNHSYJTHTrGiZUQUsfyJ/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/backup_new_v1141.img -o CBeNHSYJTHTrGiZUQUsfyJ/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/20190415/a31lighting_new_uImage_20190415 -o CBeNHSYJTHTrGiZUQUsfyJ/20190415/a31lighting_new_uImage_20190415
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/20190415/user.jffs2 -o CBeNHSYJTHTrGiZUQUsfyJ/20190415/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/CBeNHSYJTHTrGiZUQUsfyJ/20190415/user2.jffs2 -o CBeNHSYJTHTrGiZUQUsfyJ/20190415/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/20200512/md5.txt -o xBPU2JUGdpexkUA2oPsRnM/20200512/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/20200512/MVver_20200512 -o xBPU2JUGdpexkUA2oPsRnM/20200512/MVver_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/20200512/layout -o xBPU2JUGdpexkUA2oPsRnM/20200512/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/uboot_v632.img -o xBPU2JUGdpexkUA2oPsRnM/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/backup_new_v1141.img -o xBPU2JUGdpexkUA2oPsRnM/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/20200512/a31faravs_new_uImage_20200512 -o xBPU2JUGdpexkUA2oPsRnM/20200512/a31faravs_new_uImage_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/20200512/user.jffs2 -o xBPU2JUGdpexkUA2oPsRnM/20200512/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xBPU2JUGdpexkUA2oPsRnM/20200512/user2.jffs2 -o xBPU2JUGdpexkUA2oPsRnM/20200512/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/md5.txt -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/MVver_20210208 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/MVver_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/layout -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/uboot_v632.img -o xUBr33GdJ9ZhbjqHcWuhxB/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/backup_new_v1141.img -o xUBr33GdJ9ZhbjqHcWuhxB/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/a31jam_new_uImage_20210208 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/a31jam_new_uImage_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/user.jffs2 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/user2.jffs2 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/md5.txt -o A6t36nZJ6PJy6EoBr4kmLE/20210208/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/MVver_20210208 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/MVver_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/layout -o A6t36nZJ6PJy6EoBr4kmLE/20210208/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/uboot_v632.img -o A6t36nZJ6PJy6EoBr4kmLE/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/backup_new_v1141.img -o A6t36nZJ6PJy6EoBr4kmLE/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/a31jameup_new_uImage_20210208 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/a31jameup_new_uImage_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/user.jffs2 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/user2.jffs2 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/md5.txt -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/MVver_20210208 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/MVver_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/layout -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/uboot_v632.img -o xUBr33GdJ9ZhbjqHcWuhxB/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/backup_new_v1141.img -o xUBr33GdJ9ZhbjqHcWuhxB/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/a31jam_new_uImage_20210208 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/a31jam_new_uImage_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/user.jffs2 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/user2.jffs2 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/md5.txt -o A6t36nZJ6PJy6EoBr4kmLE/20210208/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/MVver_20210208 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/MVver_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/layout -o A6t36nZJ6PJy6EoBr4kmLE/20210208/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/uboot_v632.img -o A6t36nZJ6PJy6EoBr4kmLE/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/backup_new_v1141.img -o A6t36nZJ6PJy6EoBr4kmLE/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/a31jameup_new_uImage_20210208 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/a31jameup_new_uImage_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/user.jffs2 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/user2.jffs2 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/20180806/md5.txt -o Lq26UV9vtmTDnq8rfdANRa/20180806/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/20180806/MVver_20180806 -o Lq26UV9vtmTDnq8rfdANRa/20180806/MVver_20180806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/20180806/layout -o Lq26UV9vtmTDnq8rfdANRa/20180806/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/uboot_v632.img -o Lq26UV9vtmTDnq8rfdANRa/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/backup_new_v1141.img -o Lq26UV9vtmTDnq8rfdANRa/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/20180806/a31faravs_new_uImage_20180806 -o Lq26UV9vtmTDnq8rfdANRa/20180806/a31faravs_new_uImage_20180806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/20180806/user.jffs2 -o Lq26UV9vtmTDnq8rfdANRa/20180806/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lq26UV9vtmTDnq8rfdANRa/20180806/user2.jffs2 -o Lq26UV9vtmTDnq8rfdANRa/20180806/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/20201024/md5.txt -o SqUE45nGNcqD2938iAMe2A/20201024/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/20201024/MVver_20201024 -o SqUE45nGNcqD2938iAMe2A/20201024/MVver_20201024
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/20201024/layout -o SqUE45nGNcqD2938iAMe2A/20201024/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/uboot_v632.img -o SqUE45nGNcqD2938iAMe2A/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/backup_new_v1141.img -o SqUE45nGNcqD2938iAMe2A/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/20201024/a31dossjamvoice_nearalexa_new_uImage_20201024 -o SqUE45nGNcqD2938iAMe2A/20201024/a31dossjamvoice_nearalexa_new_uImage_20201024
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/20201024/user.jffs2 -o SqUE45nGNcqD2938iAMe2A/20201024/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SqUE45nGNcqD2938iAMe2A/20201024/user2.jffs2 -o SqUE45nGNcqD2938iAMe2A/20201024/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/20220802/md5.txt -o u8S9rtgdWSWofcAW9MDWDi/20220802/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/20220802/MVver_20220802 -o u8S9rtgdWSWofcAW9MDWDi/20220802/MVver_20220802
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/20220802/layout -o u8S9rtgdWSWofcAW9MDWDi/20220802/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/uboot_v632.img -o u8S9rtgdWSWofcAW9MDWDi/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/backup_new_v1141.img -o u8S9rtgdWSWofcAW9MDWDi/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/20220802/a31faravs_new_uImage_20220802 -o u8S9rtgdWSWofcAW9MDWDi/20220802/a31faravs_new_uImage_20220802
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/20220802/user.jffs2 -o u8S9rtgdWSWofcAW9MDWDi/20220802/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/u8S9rtgdWSWofcAW9MDWDi/20220802/user2.jffs2 -o u8S9rtgdWSWofcAW9MDWDi/20220802/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/20230621/md5.txt -o Tth3GvEiTsMEXcqaQwHJCk/20230621/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/20230621/MVver_20230621 -o Tth3GvEiTsMEXcqaQwHJCk/20230621/MVver_20230621
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/20230621/layout -o Tth3GvEiTsMEXcqaQwHJCk/20230621/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/uboot_v632.img -o Tth3GvEiTsMEXcqaQwHJCk/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/backup_new_v1141.img -o Tth3GvEiTsMEXcqaQwHJCk/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/20230621/a28faravs_new_uImage_20230621 -o Tth3GvEiTsMEXcqaQwHJCk/20230621/a28faravs_new_uImage_20230621
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/20230621/user.jffs2 -o Tth3GvEiTsMEXcqaQwHJCk/20230621/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Tth3GvEiTsMEXcqaQwHJCk/20230621/user2.jffs2 -o Tth3GvEiTsMEXcqaQwHJCk/20230621/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/20180927/md5.txt -o XvDSKd8vQ7hhRyGZekYjwn/20180927/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/20180927/MVver_20180927 -o XvDSKd8vQ7hhRyGZekYjwn/20180927/MVver_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/20180927/layout -o XvDSKd8vQ7hhRyGZekYjwn/20180927/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/uboot_v632.img -o XvDSKd8vQ7hhRyGZekYjwn/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/backup_new_v1141.img -o XvDSKd8vQ7hhRyGZekYjwn/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/20180927/a31nearalexa_new_uImage_20180927 -o XvDSKd8vQ7hhRyGZekYjwn/20180927/a31nearalexa_new_uImage_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/20180927/user.jffs2 -o XvDSKd8vQ7hhRyGZekYjwn/20180927/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/XvDSKd8vQ7hhRyGZekYjwn/20180927/user2.jffs2 -o XvDSKd8vQ7hhRyGZekYjwn/20180927/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/20190402/md5.txt -o SibD9c3o8BA8AbXHYNFwKC/20190402/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/20190402/MVver_20190402 -o SibD9c3o8BA8AbXHYNFwKC/20190402/MVver_20190402
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/20190402/layout -o SibD9c3o8BA8AbXHYNFwKC/20190402/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/uboot_v632.img -o SibD9c3o8BA8AbXHYNFwKC/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/backup_new_v1141.img -o SibD9c3o8BA8AbXHYNFwKC/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/20190402/a31ihomeiav14_new_uImage_20190402 -o SibD9c3o8BA8AbXHYNFwKC/20190402/a31ihomeiav14_new_uImage_20190402
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/20190402/user.jffs2 -o SibD9c3o8BA8AbXHYNFwKC/20190402/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SibD9c3o8BA8AbXHYNFwKC/20190402/user2.jffs2 -o SibD9c3o8BA8AbXHYNFwKC/20190402/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/20180903/md5.txt -o gcspFRqWFZJtbuUe5rsoxe/20180903/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/20180903/MVver_20180903 -o gcspFRqWFZJtbuUe5rsoxe/20180903/MVver_20180903
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/20180903/layout -o gcspFRqWFZJtbuUe5rsoxe/20180903/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/uboot_v632.img -o gcspFRqWFZJtbuUe5rsoxe/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/backup_new_v1141.img -o gcspFRqWFZJtbuUe5rsoxe/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/20180903/a31junlandpiglobal_alexa_new_uImage_20180903 -o gcspFRqWFZJtbuUe5rsoxe/20180903/a31junlandpiglobal_alexa_new_uImage_20180903
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/20180903/user.jffs2 -o gcspFRqWFZJtbuUe5rsoxe/20180903/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gcspFRqWFZJtbuUe5rsoxe/20180903/user2.jffs2 -o gcspFRqWFZJtbuUe5rsoxe/20180903/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/20211123/md5.txt -o gAzWgKMY9e7PfVrB3qCqyK/20211123/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/20211123/MVver_20211123 -o gAzWgKMY9e7PfVrB3qCqyK/20211123/MVver_20211123
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/20211123/layout -o gAzWgKMY9e7PfVrB3qCqyK/20211123/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/uboot_v632.img -o gAzWgKMY9e7PfVrB3qCqyK/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/backup_new_v1141.img -o gAzWgKMY9e7PfVrB3qCqyK/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/20211123/a31intelbras_new_uImage_20211123 -o gAzWgKMY9e7PfVrB3qCqyK/20211123/a31intelbras_new_uImage_20211123
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/20211123/user.jffs2 -o gAzWgKMY9e7PfVrB3qCqyK/20211123/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gAzWgKMY9e7PfVrB3qCqyK/20211123/user2.jffs2 -o gAzWgKMY9e7PfVrB3qCqyK/20211123/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/20211123/md5.txt -o 2cqRfnvv4jNPbr7xjGBN5N/20211123/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/20211123/MVver_20211123 -o 2cqRfnvv4jNPbr7xjGBN5N/20211123/MVver_20211123
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/20211123/layout -o 2cqRfnvv4jNPbr7xjGBN5N/20211123/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/uboot_v632.img -o 2cqRfnvv4jNPbr7xjGBN5N/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/backup_new_v1141.img -o 2cqRfnvv4jNPbr7xjGBN5N/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/20211123/a31intelbras_new_uImage_20211123 -o 2cqRfnvv4jNPbr7xjGBN5N/20211123/a31intelbras_new_uImage_20211123
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/20211123/user.jffs2 -o 2cqRfnvv4jNPbr7xjGBN5N/20211123/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/2cqRfnvv4jNPbr7xjGBN5N/20211123/user2.jffs2 -o 2cqRfnvv4jNPbr7xjGBN5N/20211123/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tpRLhAoidnvrNXqnNrBDXg/20180502/MVver_20180502 -o tpRLhAoidnvrNXqnNrBDXg/20180502/MVver_20180502
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tpRLhAoidnvrNXqnNrBDXg/20180502/layout -o tpRLhAoidnvrNXqnNrBDXg/20180502/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tpRLhAoidnvrNXqnNrBDXg/uboot_v632.img -o tpRLhAoidnvrNXqnNrBDXg/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tpRLhAoidnvrNXqnNrBDXg/backup_new_v1141.img -o tpRLhAoidnvrNXqnNrBDXg/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tpRLhAoidnvrNXqnNrBDXg/20180502/a31faralexa_new_uImage_20180502 -o tpRLhAoidnvrNXqnNrBDXg/20180502/a31faralexa_new_uImage_20180502
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tpRLhAoidnvrNXqnNrBDXg/20180502/user.jffs2 -o tpRLhAoidnvrNXqnNrBDXg/20180502/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/tpRLhAoidnvrNXqnNrBDXg/20180502/user2.jffs2 -o tpRLhAoidnvrNXqnNrBDXg/20180502/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/20191129/md5.txt -o LzPFpshkD8ayHzJ3ztAsb4/20191129/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/20191129/MVver_20191129 -o LzPFpshkD8ayHzJ3ztAsb4/20191129/MVver_20191129
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/20191129/layout -o LzPFpshkD8ayHzJ3ztAsb4/20191129/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/uboot_v632.img -o LzPFpshkD8ayHzJ3ztAsb4/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/backup_new_v1141.img -o LzPFpshkD8ayHzJ3ztAsb4/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/20191129/a31slave_noasr_new_uImage_20191129 -o LzPFpshkD8ayHzJ3ztAsb4/20191129/a31slave_noasr_new_uImage_20191129
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/20191129/user.jffs2 -o LzPFpshkD8ayHzJ3ztAsb4/20191129/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/LzPFpshkD8ayHzJ3ztAsb4/20191129/user2.jffs2 -o LzPFpshkD8ayHzJ3ztAsb4/20191129/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/20191129/md5.txt -o uRUnmvLnmVu9g9RikaPbPh/20191129/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/20191129/MVver_20191129 -o uRUnmvLnmVu9g9RikaPbPh/20191129/MVver_20191129
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/20191129/layout -o uRUnmvLnmVu9g9RikaPbPh/20191129/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/uboot_v632.img -o uRUnmvLnmVu9g9RikaPbPh/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/backup_new_v1141.img -o uRUnmvLnmVu9g9RikaPbPh/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/20191129/a31slave_noasr_new_uImage_20191129 -o uRUnmvLnmVu9g9RikaPbPh/20191129/a31slave_noasr_new_uImage_20191129
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/20191129/user.jffs2 -o uRUnmvLnmVu9g9RikaPbPh/20191129/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/uRUnmvLnmVu9g9RikaPbPh/20191129/user2.jffs2 -o uRUnmvLnmVu9g9RikaPbPh/20191129/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/20210827/md5.txt -o dCoTmQkQhyzwZgKk66v9fF/20210827/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/20210827/MVver_20210827 -o dCoTmQkQhyzwZgKk66v9fF/20210827/MVver_20210827
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/20210827/layout -o dCoTmQkQhyzwZgKk66v9fF/20210827/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/uboot_v632.img -o dCoTmQkQhyzwZgKk66v9fF/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/backup_new_v1141.img -o dCoTmQkQhyzwZgKk66v9fF/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/20210827/a31kitsound_new_uImage_20210827 -o dCoTmQkQhyzwZgKk66v9fF/20210827/a31kitsound_new_uImage_20210827
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/20210827/user.jffs2 -o dCoTmQkQhyzwZgKk66v9fF/20210827/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dCoTmQkQhyzwZgKk66v9fF/20210827/user2.jffs2 -o dCoTmQkQhyzwZgKk66v9fF/20210827/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/20190930/md5.txt -o B5W9m4XXGE5rnXQVBx5PYP/20190930/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/20190930/MVver_20190930 -o B5W9m4XXGE5rnXQVBx5PYP/20190930/MVver_20190930
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/20190930/layout -o B5W9m4XXGE5rnXQVBx5PYP/20190930/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/uboot_v632.img -o B5W9m4XXGE5rnXQVBx5PYP/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/backup_new_v1141.img -o B5W9m4XXGE5rnXQVBx5PYP/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/20190930/a31kaishuneartvs_new_uImage_20190930 -o B5W9m4XXGE5rnXQVBx5PYP/20190930/a31kaishuneartvs_new_uImage_20190930
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/20190930/user.jffs2 -o B5W9m4XXGE5rnXQVBx5PYP/20190930/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B5W9m4XXGE5rnXQVBx5PYP/20190930/user2.jffs2 -o B5W9m4XXGE5rnXQVBx5PYP/20190930/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/20180927/md5.txt -o ZFUmZdQMLRAvLvY2842mj6/20180927/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/20180927/MVver_20180927 -o ZFUmZdQMLRAvLvY2842mj6/20180927/MVver_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/20180927/layout -o ZFUmZdQMLRAvLvY2842mj6/20180927/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/uboot_v632.img -o ZFUmZdQMLRAvLvY2842mj6/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/backup_new_v1141.img -o ZFUmZdQMLRAvLvY2842mj6/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/20180927/a31nearalexa_new_uImage_20180927 -o ZFUmZdQMLRAvLvY2842mj6/20180927/a31nearalexa_new_uImage_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/20180927/user.jffs2 -o ZFUmZdQMLRAvLvY2842mj6/20180927/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZFUmZdQMLRAvLvY2842mj6/20180927/user2.jffs2 -o ZFUmZdQMLRAvLvY2842mj6/20180927/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/20200512/md5.txt -o w9XRsCTHFwDcwvEhvwFpkh/20200512/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/20200512/MVver_20200512 -o w9XRsCTHFwDcwvEhvwFpkh/20200512/MVver_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/20200512/layout -o w9XRsCTHFwDcwvEhvwFpkh/20200512/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/uboot_v632.img -o w9XRsCTHFwDcwvEhvwFpkh/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/backup_new_v1141.img -o w9XRsCTHFwDcwvEhvwFpkh/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/20200512/a31faravs_new_uImage_20200512 -o w9XRsCTHFwDcwvEhvwFpkh/20200512/a31faravs_new_uImage_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/20200512/user.jffs2 -o w9XRsCTHFwDcwvEhvwFpkh/20200512/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/w9XRsCTHFwDcwvEhvwFpkh/20200512/user2.jffs2 -o w9XRsCTHFwDcwvEhvwFpkh/20200512/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/20200512/md5.txt -o hJbSC6fx2xmQM663LgvzAc/20200512/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/20200512/MVver_20200512 -o hJbSC6fx2xmQM663LgvzAc/20200512/MVver_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/20200512/layout -o hJbSC6fx2xmQM663LgvzAc/20200512/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/uboot_v632.img -o hJbSC6fx2xmQM663LgvzAc/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/backup_new_v1141.img -o hJbSC6fx2xmQM663LgvzAc/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/20200512/a31faravs_new_uImage_20200512 -o hJbSC6fx2xmQM663LgvzAc/20200512/a31faravs_new_uImage_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/20200512/user.jffs2 -o hJbSC6fx2xmQM663LgvzAc/20200512/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hJbSC6fx2xmQM663LgvzAc/20200512/user2.jffs2 -o hJbSC6fx2xmQM663LgvzAc/20200512/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/20200512/md5.txt -o vHyuxMK2ugTnS88eCpZRAd/20200512/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/20200512/MVver_20200512 -o vHyuxMK2ugTnS88eCpZRAd/20200512/MVver_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/20200512/layout -o vHyuxMK2ugTnS88eCpZRAd/20200512/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/uboot_v632.img -o vHyuxMK2ugTnS88eCpZRAd/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/backup_new_v1141.img -o vHyuxMK2ugTnS88eCpZRAd/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/20200512/a31faravs_new_uImage_20200512 -o vHyuxMK2ugTnS88eCpZRAd/20200512/a31faravs_new_uImage_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/20200512/user.jffs2 -o vHyuxMK2ugTnS88eCpZRAd/20200512/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vHyuxMK2ugTnS88eCpZRAd/20200512/user2.jffs2 -o vHyuxMK2ugTnS88eCpZRAd/20200512/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/20211008/md5.txt -o WFX9CA6rUhkE2UxMK2RVkF/20211008/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/20211008/MVver_20211008 -o WFX9CA6rUhkE2UxMK2RVkF/20211008/MVver_20211008
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/20211008/layout -o WFX9CA6rUhkE2UxMK2RVkF/20211008/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/uboot_v632.img -o WFX9CA6rUhkE2UxMK2RVkF/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/backup_new_v1141.img -o WFX9CA6rUhkE2UxMK2RVkF/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/20211008/a31junlandpiglobal_alexa_new_uImage_20211008 -o WFX9CA6rUhkE2UxMK2RVkF/20211008/a31junlandpiglobal_alexa_new_uImage_20211008
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/20211008/user.jffs2 -o WFX9CA6rUhkE2UxMK2RVkF/20211008/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/WFX9CA6rUhkE2UxMK2RVkF/20211008/user2.jffs2 -o WFX9CA6rUhkE2UxMK2RVkF/20211008/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/20180806/md5.txt -o Aq778sde98yYesKgi84rYJ/20180806/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/20180806/MVver_20180806 -o Aq778sde98yYesKgi84rYJ/20180806/MVver_20180806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/20180806/layout -o Aq778sde98yYesKgi84rYJ/20180806/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/uboot_v632.img -o Aq778sde98yYesKgi84rYJ/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/backup_new_v1141.img -o Aq778sde98yYesKgi84rYJ/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/20180806/a31faralexa_new_uImage_20180806 -o Aq778sde98yYesKgi84rYJ/20180806/a31faralexa_new_uImage_20180806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/20180806/user.jffs2 -o Aq778sde98yYesKgi84rYJ/20180806/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Aq778sde98yYesKgi84rYJ/20180806/user2.jffs2 -o Aq778sde98yYesKgi84rYJ/20180806/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/20190925/md5.txt -o BemYXtkwznZGkSJQ8wuSzK/20190925/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/20190925/MVver_20190925 -o BemYXtkwznZGkSJQ8wuSzK/20190925/MVver_20190925
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/20190925/layout -o BemYXtkwznZGkSJQ8wuSzK/20190925/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/uboot_v632.img -o BemYXtkwznZGkSJQ8wuSzK/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/backup_new_v1141.img -o BemYXtkwznZGkSJQ8wuSzK/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/20190925/a31roland_new_uImage_20190925 -o BemYXtkwznZGkSJQ8wuSzK/20190925/a31roland_new_uImage_20190925
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/20190925/user.jffs2 -o BemYXtkwznZGkSJQ8wuSzK/20190925/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/BemYXtkwznZGkSJQ8wuSzK/20190925/user2.jffs2 -o BemYXtkwznZGkSJQ8wuSzK/20190925/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/20190715/md5.txt -o Y4mfH68L8okr83Dn34R5yk/20190715/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/20190715/MVver_20190715 -o Y4mfH68L8okr83Dn34R5yk/20190715/MVver_20190715
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/20190715/layout -o Y4mfH68L8okr83Dn34R5yk/20190715/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/uboot_v632.img -o Y4mfH68L8okr83Dn34R5yk/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/backup_new_v1141.img -o Y4mfH68L8okr83Dn34R5yk/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/20190715/a31lifepodcaregiver_new_uImage_20190715 -o Y4mfH68L8okr83Dn34R5yk/20190715/a31lifepodcaregiver_new_uImage_20190715
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/20190715/user.jffs2 -o Y4mfH68L8okr83Dn34R5yk/20190715/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Y4mfH68L8okr83Dn34R5yk/20190715/user2.jffs2 -o Y4mfH68L8okr83Dn34R5yk/20190715/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/20180903/md5.txt -o SXsboBbzXjm8DgNvvQuZJd/20180903/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/20180903/MVver_20180903 -o SXsboBbzXjm8DgNvvQuZJd/20180903/MVver_20180903
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/20180903/layout -o SXsboBbzXjm8DgNvvQuZJd/20180903/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/uboot_v632.img -o SXsboBbzXjm8DgNvvQuZJd/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/backup_new_v1141.img -o SXsboBbzXjm8DgNvvQuZJd/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/20180903/a31musicman_new_uImage_20180903 -o SXsboBbzXjm8DgNvvQuZJd/20180903/a31musicman_new_uImage_20180903
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/20180903/user.jffs2 -o SXsboBbzXjm8DgNvvQuZJd/20180903/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/SXsboBbzXjm8DgNvvQuZJd/20180903/user2.jffs2 -o SXsboBbzXjm8DgNvvQuZJd/20180903/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/20191125/md5.txt -o mJhBYYnbtZ9zymDkeSXgB9/20191125/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/20191125/MVver_20191125 -o mJhBYYnbtZ9zymDkeSXgB9/20191125/MVver_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/20191125/layout -o mJhBYYnbtZ9zymDkeSXgB9/20191125/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/uboot_v632.img -o mJhBYYnbtZ9zymDkeSXgB9/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/backup_new_v1141.img -o mJhBYYnbtZ9zymDkeSXgB9/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/20191125/a31fortex_srcout_advance_new_uImage_20191125 -o mJhBYYnbtZ9zymDkeSXgB9/20191125/a31fortex_srcout_advance_new_uImage_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/20191125/user.jffs2 -o mJhBYYnbtZ9zymDkeSXgB9/20191125/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/mJhBYYnbtZ9zymDkeSXgB9/20191125/user2.jffs2 -o mJhBYYnbtZ9zymDkeSXgB9/20191125/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/20191125/md5.txt -o As7BsyYKx4f96qsckPG2dM/20191125/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/20191125/MVver_20191125 -o As7BsyYKx4f96qsckPG2dM/20191125/MVver_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/20191125/layout -o As7BsyYKx4f96qsckPG2dM/20191125/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/uboot_v632.img -o As7BsyYKx4f96qsckPG2dM/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/backup_new_v1141.img -o As7BsyYKx4f96qsckPG2dM/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/20191125/a31fortex_srcout_advance_new_uImage_20191125 -o As7BsyYKx4f96qsckPG2dM/20191125/a31fortex_srcout_advance_new_uImage_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/20191125/user.jffs2 -o As7BsyYKx4f96qsckPG2dM/20191125/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/As7BsyYKx4f96qsckPG2dM/20191125/user2.jffs2 -o As7BsyYKx4f96qsckPG2dM/20191125/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/20191125/md5.txt -o xNghMZ7MSkDAQfiS3MYvj3/20191125/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/20191125/MVver_20191125 -o xNghMZ7MSkDAQfiS3MYvj3/20191125/MVver_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/20191125/layout -o xNghMZ7MSkDAQfiS3MYvj3/20191125/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/uboot_v632.img -o xNghMZ7MSkDAQfiS3MYvj3/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/backup_new_v1141.img -o xNghMZ7MSkDAQfiS3MYvj3/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/20191125/a31fortex_srcout_advance_new_uImage_20191125 -o xNghMZ7MSkDAQfiS3MYvj3/20191125/a31fortex_srcout_advance_new_uImage_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/20191125/user.jffs2 -o xNghMZ7MSkDAQfiS3MYvj3/20191125/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xNghMZ7MSkDAQfiS3MYvj3/20191125/user2.jffs2 -o xNghMZ7MSkDAQfiS3MYvj3/20191125/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/20190417/md5.txt -o gZWbehQP3JL2Ytd7BNMWqK/20190417/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/20190417/MVver_20190417 -o gZWbehQP3JL2Ytd7BNMWqK/20190417/MVver_20190417
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/20190417/layout -o gZWbehQP3JL2Ytd7BNMWqK/20190417/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/uboot_v632.img -o gZWbehQP3JL2Ytd7BNMWqK/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/backup_new_v1141.img -o gZWbehQP3JL2Ytd7BNMWqK/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/20190417/a31faravs_new_uImage_20190417 -o gZWbehQP3JL2Ytd7BNMWqK/20190417/a31faravs_new_uImage_20190417
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/20190417/user.jffs2 -o gZWbehQP3JL2Ytd7BNMWqK/20190417/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gZWbehQP3JL2Ytd7BNMWqK/20190417/user2.jffs2 -o gZWbehQP3JL2Ytd7BNMWqK/20190417/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/20220407/md5.txt -o 5Kat45kXDQjWNKurHssS6b/20220407/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/20220407/MVver_20220407 -o 5Kat45kXDQjWNKurHssS6b/20220407/MVver_20220407
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/20220407/layout -o 5Kat45kXDQjWNKurHssS6b/20220407/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/uboot_v632.img -o 5Kat45kXDQjWNKurHssS6b/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/backup_new_v1141.img -o 5Kat45kXDQjWNKurHssS6b/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/20220407/a31faravs_new_uImage_20220407 -o 5Kat45kXDQjWNKurHssS6b/20220407/a31faravs_new_uImage_20220407
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/20220407/user.jffs2 -o 5Kat45kXDQjWNKurHssS6b/20220407/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/5Kat45kXDQjWNKurHssS6b/20220407/user2.jffs2 -o 5Kat45kXDQjWNKurHssS6b/20220407/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/20190924/md5.txt -o 3xbwVFmb7rhtRqdaZzX4nd/20190924/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/20190924/MVver_20190924 -o 3xbwVFmb7rhtRqdaZzX4nd/20190924/MVver_20190924
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/20190924/layout -o 3xbwVFmb7rhtRqdaZzX4nd/20190924/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/uboot_v632.img -o 3xbwVFmb7rhtRqdaZzX4nd/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/backup_new_v1141.img -o 3xbwVFmb7rhtRqdaZzX4nd/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/20190924/a31faravs_new_uImage_20190924 -o 3xbwVFmb7rhtRqdaZzX4nd/20190924/a31faravs_new_uImage_20190924
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/20190924/user.jffs2 -o 3xbwVFmb7rhtRqdaZzX4nd/20190924/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/3xbwVFmb7rhtRqdaZzX4nd/20190924/user2.jffs2 -o 3xbwVFmb7rhtRqdaZzX4nd/20190924/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/20230621/md5.txt -o pj6WiBVWKmCP2WVTGMvMxT/20230621/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/20230621/MVver_20230621 -o pj6WiBVWKmCP2WVTGMvMxT/20230621/MVver_20230621
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/20230621/layout -o pj6WiBVWKmCP2WVTGMvMxT/20230621/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/uboot_v632.img -o pj6WiBVWKmCP2WVTGMvMxT/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/backup_new_v1141.img -o pj6WiBVWKmCP2WVTGMvMxT/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/20230621/a31srcoutwm8918_new_uImage_20230621 -o pj6WiBVWKmCP2WVTGMvMxT/20230621/a31srcoutwm8918_new_uImage_20230621
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/20230621/user.jffs2 -o pj6WiBVWKmCP2WVTGMvMxT/20230621/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pj6WiBVWKmCP2WVTGMvMxT/20230621/user2.jffs2 -o pj6WiBVWKmCP2WVTGMvMxT/20230621/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/20180828/md5.txt -o 6q3URCwuZD9azSpMNAjjg4/20180828/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/20180828/MVver_20180828 -o 6q3URCwuZD9azSpMNAjjg4/20180828/MVver_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/20180828/layout -o 6q3URCwuZD9azSpMNAjjg4/20180828/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/uboot_v632.img -o 6q3URCwuZD9azSpMNAjjg4/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/backup_new_v1141.img -o 6q3URCwuZD9azSpMNAjjg4/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/20180828/a31faralexa_new_uImage_20180828 -o 6q3URCwuZD9azSpMNAjjg4/20180828/a31faralexa_new_uImage_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/20180828/user.jffs2 -o 6q3URCwuZD9azSpMNAjjg4/20180828/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/6q3URCwuZD9azSpMNAjjg4/20180828/user2.jffs2 -o 6q3URCwuZD9azSpMNAjjg4/20180828/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/20220407/md5.txt -o EPBXaDkUEHTXC2x9GopSjL/20220407/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/20220407/MVver_20220407 -o EPBXaDkUEHTXC2x9GopSjL/20220407/MVver_20220407
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/20220407/layout -o EPBXaDkUEHTXC2x9GopSjL/20220407/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/uboot_v632.img -o EPBXaDkUEHTXC2x9GopSjL/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/backup_new_v1141.img -o EPBXaDkUEHTXC2x9GopSjL/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/20220407/a31faravs_new_uImage_20220407 -o EPBXaDkUEHTXC2x9GopSjL/20220407/a31faravs_new_uImage_20220407
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/20220407/user.jffs2 -o EPBXaDkUEHTXC2x9GopSjL/20220407/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EPBXaDkUEHTXC2x9GopSjL/20220407/user2.jffs2 -o EPBXaDkUEHTXC2x9GopSjL/20220407/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/20190813/md5.txt -o sqAnLRHsMi2taESA86kuBT/20190813/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/20190813/MVver_20190813 -o sqAnLRHsMi2taESA86kuBT/20190813/MVver_20190813
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/20190813/layout -o sqAnLRHsMi2taESA86kuBT/20190813/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/uboot_v632.img -o sqAnLRHsMi2taESA86kuBT/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/backup_new_v1141.img -o sqAnLRHsMi2taESA86kuBT/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/20190813/a31edifiers1000a_new_uImage_20190813 -o sqAnLRHsMi2taESA86kuBT/20190813/a31edifiers1000a_new_uImage_20190813
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/20190813/user.jffs2 -o sqAnLRHsMi2taESA86kuBT/20190813/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/sqAnLRHsMi2taESA86kuBT/20190813/user2.jffs2 -o sqAnLRHsMi2taESA86kuBT/20190813/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/20180829/md5.txt -o pv6Bwb2gHvXCjTpQZYQFvQ/20180829/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/20180829/MVver_20180829 -o pv6Bwb2gHvXCjTpQZYQFvQ/20180829/MVver_20180829
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/20180829/layout -o pv6Bwb2gHvXCjTpQZYQFvQ/20180829/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/uboot_v632.img -o pv6Bwb2gHvXCjTpQZYQFvQ/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/backup_new_v1141.img -o pv6Bwb2gHvXCjTpQZYQFvQ/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/20180829/a31faravs_new_uImage_20180829 -o pv6Bwb2gHvXCjTpQZYQFvQ/20180829/a31faravs_new_uImage_20180829
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/20180829/user.jffs2 -o pv6Bwb2gHvXCjTpQZYQFvQ/20180829/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pv6Bwb2gHvXCjTpQZYQFvQ/20180829/user2.jffs2 -o pv6Bwb2gHvXCjTpQZYQFvQ/20180829/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/20191121/md5.txt -o vNmgGitSvCaY5E2YkuXv7B/20191121/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/20191121/MVver_20191121 -o vNmgGitSvCaY5E2YkuXv7B/20191121/MVver_20191121
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/20191121/layout -o vNmgGitSvCaY5E2YkuXv7B/20191121/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/uboot_v632.img -o vNmgGitSvCaY5E2YkuXv7B/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/backup_new_v1141.img -o vNmgGitSvCaY5E2YkuXv7B/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/20191121/a31fartencent2_sansi_new_uImage_20191121 -o vNmgGitSvCaY5E2YkuXv7B/20191121/a31fartencent2_sansi_new_uImage_20191121
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/20191121/user.jffs2 -o vNmgGitSvCaY5E2YkuXv7B/20191121/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vNmgGitSvCaY5E2YkuXv7B/20191121/user2.jffs2 -o vNmgGitSvCaY5E2YkuXv7B/20191121/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/20180829/md5.txt -o myj2QNyw8yUvq8RtHxhhVJ/20180829/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/20180829/MVver_20180829 -o myj2QNyw8yUvq8RtHxhhVJ/20180829/MVver_20180829
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/20180829/layout -o myj2QNyw8yUvq8RtHxhhVJ/20180829/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/uboot_v632.img -o myj2QNyw8yUvq8RtHxhhVJ/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/backup_new_v1141.img -o myj2QNyw8yUvq8RtHxhhVJ/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/20180829/a31faravs_new_uImage_20180829 -o myj2QNyw8yUvq8RtHxhhVJ/20180829/a31faravs_new_uImage_20180829
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/20180829/user.jffs2 -o myj2QNyw8yUvq8RtHxhhVJ/20180829/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/myj2QNyw8yUvq8RtHxhhVJ/20180829/user2.jffs2 -o myj2QNyw8yUvq8RtHxhhVJ/20180829/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/20190305/md5.txt -o hXKURrQn9B3zHXe5AaSRxW/20190305/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/20190305/MVver_20190305 -o hXKURrQn9B3zHXe5AaSRxW/20190305/MVver_20190305
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/20190305/layout -o hXKURrQn9B3zHXe5AaSRxW/20190305/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/uboot_v632.img -o hXKURrQn9B3zHXe5AaSRxW/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/backup_new_v1141.img -o hXKURrQn9B3zHXe5AaSRxW/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/20190305/a31faravs_new_uImage_20190305 -o hXKURrQn9B3zHXe5AaSRxW/20190305/a31faravs_new_uImage_20190305
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/20190305/user.jffs2 -o hXKURrQn9B3zHXe5AaSRxW/20190305/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hXKURrQn9B3zHXe5AaSRxW/20190305/user2.jffs2 -o hXKURrQn9B3zHXe5AaSRxW/20190305/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/20180806/md5.txt -o PnN66fBBfqKKs9XK5WtMhN/20180806/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/20180806/MVver_20180806 -o PnN66fBBfqKKs9XK5WtMhN/20180806/MVver_20180806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/20180806/layout -o PnN66fBBfqKKs9XK5WtMhN/20180806/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/uboot_v632.img -o PnN66fBBfqKKs9XK5WtMhN/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/backup_new_v1141.img -o PnN66fBBfqKKs9XK5WtMhN/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/20180806/a31faralexa_new_uImage_20180806 -o PnN66fBBfqKKs9XK5WtMhN/20180806/a31faralexa_new_uImage_20180806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/20180806/user.jffs2 -o PnN66fBBfqKKs9XK5WtMhN/20180806/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/PnN66fBBfqKKs9XK5WtMhN/20180806/user2.jffs2 -o PnN66fBBfqKKs9XK5WtMhN/20180806/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/20180806/md5.txt -o EKaPFvGi6sJaYLcqDDKsNZ/20180806/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/20180806/MVver_20180806 -o EKaPFvGi6sJaYLcqDDKsNZ/20180806/MVver_20180806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/20180806/layout -o EKaPFvGi6sJaYLcqDDKsNZ/20180806/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/uboot_v632.img -o EKaPFvGi6sJaYLcqDDKsNZ/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/backup_new_v1141.img -o EKaPFvGi6sJaYLcqDDKsNZ/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/20180806/a31faralexa_new_uImage_20180806 -o EKaPFvGi6sJaYLcqDDKsNZ/20180806/a31faralexa_new_uImage_20180806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/20180806/user.jffs2 -o EKaPFvGi6sJaYLcqDDKsNZ/20180806/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/EKaPFvGi6sJaYLcqDDKsNZ/20180806/user2.jffs2 -o EKaPFvGi6sJaYLcqDDKsNZ/20180806/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/20181101/md5.txt -o gGQgYPKXVeTGUHNHQsfb8d/20181101/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/20181101/MVver_20181101 -o gGQgYPKXVeTGUHNHQsfb8d/20181101/MVver_20181101
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/20181101/layout -o gGQgYPKXVeTGUHNHQsfb8d/20181101/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/uboot_v632.img -o gGQgYPKXVeTGUHNHQsfb8d/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/backup_new_v1141.img -o gGQgYPKXVeTGUHNHQsfb8d/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/20181101/a31faravs_new_uImage_20181101 -o gGQgYPKXVeTGUHNHQsfb8d/20181101/a31faravs_new_uImage_20181101
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/20181101/user.jffs2 -o gGQgYPKXVeTGUHNHQsfb8d/20181101/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gGQgYPKXVeTGUHNHQsfb8d/20181101/user2.jffs2 -o gGQgYPKXVeTGUHNHQsfb8d/20181101/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/20180828/md5.txt -o 7aTrFZ29jN3d6UfCV7GkjD/20180828/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/20180828/MVver_20180828 -o 7aTrFZ29jN3d6UfCV7GkjD/20180828/MVver_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/20180828/layout -o 7aTrFZ29jN3d6UfCV7GkjD/20180828/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/uboot_v632.img -o 7aTrFZ29jN3d6UfCV7GkjD/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/backup_new_v1141.img -o 7aTrFZ29jN3d6UfCV7GkjD/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/20180828/a31faralexa_new_uImage_20180828 -o 7aTrFZ29jN3d6UfCV7GkjD/20180828/a31faralexa_new_uImage_20180828
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/20180828/user.jffs2 -o 7aTrFZ29jN3d6UfCV7GkjD/20180828/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/7aTrFZ29jN3d6UfCV7GkjD/20180828/user2.jffs2 -o 7aTrFZ29jN3d6UfCV7GkjD/20180828/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/20200909/md5.txt -o hBUAFHH53gRcFMx79sHt4V/20200909/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/20200909/MVver_20200909 -o hBUAFHH53gRcFMx79sHt4V/20200909/MVver_20200909
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/20200909/layout -o hBUAFHH53gRcFMx79sHt4V/20200909/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/uboot_v632.img -o hBUAFHH53gRcFMx79sHt4V/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/backup_new_v1141.img -o hBUAFHH53gRcFMx79sHt4V/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/20200909/a31energysystemfaravs_new_uImage_20200909 -o hBUAFHH53gRcFMx79sHt4V/20200909/a31energysystemfaravs_new_uImage_20200909
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/20200909/user.jffs2 -o hBUAFHH53gRcFMx79sHt4V/20200909/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/hBUAFHH53gRcFMx79sHt4V/20200909/user2.jffs2 -o hBUAFHH53gRcFMx79sHt4V/20200909/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/20200907/md5.txt -o pcKhXNADH2CJr72q6smn7g/20200907/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/20200907/MVver_20200907 -o pcKhXNADH2CJr72q6smn7g/20200907/MVver_20200907
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/20200907/layout -o pcKhXNADH2CJr72q6smn7g/20200907/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/uboot_v632.img -o pcKhXNADH2CJr72q6smn7g/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/backup_new_v1141.img -o pcKhXNADH2CJr72q6smn7g/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/20200907/a31energysystemnearavs_new_uImage_20200907 -o pcKhXNADH2CJr72q6smn7g/20200907/a31energysystemnearavs_new_uImage_20200907
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/20200907/user.jffs2 -o pcKhXNADH2CJr72q6smn7g/20200907/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/pcKhXNADH2CJr72q6smn7g/20200907/user2.jffs2 -o pcKhXNADH2CJr72q6smn7g/20200907/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/20191209/md5.txt -o F7EeQvQS8EX76KDiUgoruT/20191209/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/20191209/MVver_20191209 -o F7EeQvQS8EX76KDiUgoruT/20191209/MVver_20191209
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/20191209/layout -o F7EeQvQS8EX76KDiUgoruT/20191209/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/uboot_v632.img -o F7EeQvQS8EX76KDiUgoruT/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/backup_new_v1141.img -o F7EeQvQS8EX76KDiUgoruT/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/20191209/a31faravs_new_uImage_20191209 -o F7EeQvQS8EX76KDiUgoruT/20191209/a31faravs_new_uImage_20191209
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/20191209/user.jffs2 -o F7EeQvQS8EX76KDiUgoruT/20191209/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/F7EeQvQS8EX76KDiUgoruT/20191209/user2.jffs2 -o F7EeQvQS8EX76KDiUgoruT/20191209/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/20210301/md5.txt -o 4mvAXqqe7GkgFM42BE9FaD/20210301/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/20210301/MVver_20210301 -o 4mvAXqqe7GkgFM42BE9FaD/20210301/MVver_20210301
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/20210301/layout -o 4mvAXqqe7GkgFM42BE9FaD/20210301/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/uboot_v632.img -o 4mvAXqqe7GkgFM42BE9FaD/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/backup_new_v1141.img -o 4mvAXqqe7GkgFM42BE9FaD/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/20210301/a31fortex_srcout_advance_new_uImage_20210301 -o 4mvAXqqe7GkgFM42BE9FaD/20210301/a31fortex_srcout_advance_new_uImage_20210301
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/20210301/user.jffs2 -o 4mvAXqqe7GkgFM42BE9FaD/20210301/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/4mvAXqqe7GkgFM42BE9FaD/20210301/user2.jffs2 -o 4mvAXqqe7GkgFM42BE9FaD/20210301/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/20200512/md5.txt -o B6jfpcdQNoM3WpxFcaZzVC/20200512/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/20200512/MVver_20200512 -o B6jfpcdQNoM3WpxFcaZzVC/20200512/MVver_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/20200512/layout -o B6jfpcdQNoM3WpxFcaZzVC/20200512/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/uboot_v632.img -o B6jfpcdQNoM3WpxFcaZzVC/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/backup_new_v1141.img -o B6jfpcdQNoM3WpxFcaZzVC/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/20200512/a31faravs_new_uImage_20200512 -o B6jfpcdQNoM3WpxFcaZzVC/20200512/a31faravs_new_uImage_20200512
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/20200512/user.jffs2 -o B6jfpcdQNoM3WpxFcaZzVC/20200512/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/B6jfpcdQNoM3WpxFcaZzVC/20200512/user2.jffs2 -o B6jfpcdQNoM3WpxFcaZzVC/20200512/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/20181226/md5.txt -o b8qc7jwY6ducYa2vUEegaD/20181226/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/20181226/MVver_20181226 -o b8qc7jwY6ducYa2vUEegaD/20181226/MVver_20181226
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/20181226/layout -o b8qc7jwY6ducYa2vUEegaD/20181226/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/uboot_v632.img -o b8qc7jwY6ducYa2vUEegaD/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/backup_new_v1141.img -o b8qc7jwY6ducYa2vUEegaD/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/20181226/a31hsmmalexa_new_uImage_20181226 -o b8qc7jwY6ducYa2vUEegaD/20181226/a31hsmmalexa_new_uImage_20181226
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/20181226/user.jffs2 -o b8qc7jwY6ducYa2vUEegaD/20181226/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/b8qc7jwY6ducYa2vUEegaD/20181226/user2.jffs2 -o b8qc7jwY6ducYa2vUEegaD/20181226/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/20200629/md5.txt -o HThe62PtNVK7bEdxybzv47/20200629/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/20200629/MVver_20200629 -o HThe62PtNVK7bEdxybzv47/20200629/MVver_20200629
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/20200629/layout -o HThe62PtNVK7bEdxybzv47/20200629/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/uboot_v632.img -o HThe62PtNVK7bEdxybzv47/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/backup_new_v1141.img -o HThe62PtNVK7bEdxybzv47/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/20200629/a31hsmmtiboalexa_new_uImage_20200629 -o HThe62PtNVK7bEdxybzv47/20200629/a31hsmmtiboalexa_new_uImage_20200629
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/20200629/user.jffs2 -o HThe62PtNVK7bEdxybzv47/20200629/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HThe62PtNVK7bEdxybzv47/20200629/user2.jffs2 -o HThe62PtNVK7bEdxybzv47/20200629/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/20200629/md5.txt -o KaMuoRPYZM5YkDduppD2yJ/20200629/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/20200629/MVver_20200629 -o KaMuoRPYZM5YkDduppD2yJ/20200629/MVver_20200629
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/20200629/layout -o KaMuoRPYZM5YkDduppD2yJ/20200629/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/uboot_v632.img -o KaMuoRPYZM5YkDduppD2yJ/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/backup_new_v1141.img -o KaMuoRPYZM5YkDduppD2yJ/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/20200629/a31hsmmtiboalexa_new_uImage_20200629 -o KaMuoRPYZM5YkDduppD2yJ/20200629/a31hsmmtiboalexa_new_uImage_20200629
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/20200629/user.jffs2 -o KaMuoRPYZM5YkDduppD2yJ/20200629/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/KaMuoRPYZM5YkDduppD2yJ/20200629/user2.jffs2 -o KaMuoRPYZM5YkDduppD2yJ/20200629/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/a5FAAmtbdxXSc3v4QHEtnn/20180518/MVver_20180518 -o a5FAAmtbdxXSc3v4QHEtnn/20180518/MVver_20180518
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/a5FAAmtbdxXSc3v4QHEtnn/20180518/layout -o a5FAAmtbdxXSc3v4QHEtnn/20180518/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/a5FAAmtbdxXSc3v4QHEtnn/uboot_v632.img -o a5FAAmtbdxXSc3v4QHEtnn/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/a5FAAmtbdxXSc3v4QHEtnn/backup_new_v1141.img -o a5FAAmtbdxXSc3v4QHEtnn/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/a5FAAmtbdxXSc3v4QHEtnn/20180518/a31nearalexa_new_uImage_20180518 -o a5FAAmtbdxXSc3v4QHEtnn/20180518/a31nearalexa_new_uImage_20180518
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/a5FAAmtbdxXSc3v4QHEtnn/20180518/user.jffs2 -o a5FAAmtbdxXSc3v4QHEtnn/20180518/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/a5FAAmtbdxXSc3v4QHEtnn/20180518/user2.jffs2 -o a5FAAmtbdxXSc3v4QHEtnn/20180518/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/20210518/md5.txt -o vhF7skkHUNSRuW3uQs5EG4/20210518/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/20210518/MVver_20210518 -o vhF7skkHUNSRuW3uQs5EG4/20210518/MVver_20210518
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/20210518/layout -o vhF7skkHUNSRuW3uQs5EG4/20210518/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/uboot_v632.img -o vhF7skkHUNSRuW3uQs5EG4/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/backup_new_v1141.img -o vhF7skkHUNSRuW3uQs5EG4/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/20210518/a31slave_noasr_easylink_new_uImage_20210518 -o vhF7skkHUNSRuW3uQs5EG4/20210518/a31slave_noasr_easylink_new_uImage_20210518
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/20210518/user.jffs2 -o vhF7skkHUNSRuW3uQs5EG4/20210518/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/vhF7skkHUNSRuW3uQs5EG4/20210518/user2.jffs2 -o vhF7skkHUNSRuW3uQs5EG4/20210518/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/20211108/md5.txt -o JxTAxa82ApvTo38RSxzn76/20211108/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/20211108/MVver_20211108 -o JxTAxa82ApvTo38RSxzn76/20211108/MVver_20211108
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/20211108/layout -o JxTAxa82ApvTo38RSxzn76/20211108/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/uboot_v632.img -o JxTAxa82ApvTo38RSxzn76/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/backup_new_v1141.img -o JxTAxa82ApvTo38RSxzn76/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/20211108/a31slave_noasr_easylink_new_uImage_20211108 -o JxTAxa82ApvTo38RSxzn76/20211108/a31slave_noasr_easylink_new_uImage_20211108
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/20211108/user.jffs2 -o JxTAxa82ApvTo38RSxzn76/20211108/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/JxTAxa82ApvTo38RSxzn76/20211108/user2.jffs2 -o JxTAxa82ApvTo38RSxzn76/20211108/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/md5.txt -o Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/MVver_20211108 -o Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/MVver_20211108
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/layout -o Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/uboot_v632.img -o Lfu8ZzkqPDxsMmrjhuk8Tf/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/backup_new_v1141.img -o Lfu8ZzkqPDxsMmrjhuk8Tf/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/a31slave_noasr_easylink_new_uImage_20211108 -o Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/a31slave_noasr_easylink_new_uImage_20211108
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/user.jffs2 -o Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/user2.jffs2 -o Lfu8ZzkqPDxsMmrjhuk8Tf/20211108/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/20220913/md5.txt -o cB9CWp6Ed2G4jz2pcjYZqF/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/20220913/MVver_20220913 -o cB9CWp6Ed2G4jz2pcjYZqF/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/20220913/layout -o cB9CWp6Ed2G4jz2pcjYZqF/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/uboot_v632.img -o cB9CWp6Ed2G4jz2pcjYZqF/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/backup_new_v1141.img -o cB9CWp6Ed2G4jz2pcjYZqF/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/20220913/a31youyishi_new_uImage_20220913 -o cB9CWp6Ed2G4jz2pcjYZqF/20220913/a31youyishi_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/20220913/user.jffs2 -o cB9CWp6Ed2G4jz2pcjYZqF/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/cB9CWp6Ed2G4jz2pcjYZqF/20220913/user2.jffs2 -o cB9CWp6Ed2G4jz2pcjYZqF/20220913/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/20200310/md5.txt -o x78jEHotBjfw6U4yiFSmo4/20200310/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/20200310/MVver_20200310 -o x78jEHotBjfw6U4yiFSmo4/20200310/MVver_20200310
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/20200310/layout -o x78jEHotBjfw6U4yiFSmo4/20200310/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/uboot_v632.img -o x78jEHotBjfw6U4yiFSmo4/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/backup_new_v1141.img -o x78jEHotBjfw6U4yiFSmo4/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/20200310/a31faravs_new_uImage_20200310 -o x78jEHotBjfw6U4yiFSmo4/20200310/a31faravs_new_uImage_20200310
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/20200310/user.jffs2 -o x78jEHotBjfw6U4yiFSmo4/20200310/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x78jEHotBjfw6U4yiFSmo4/20200310/user2.jffs2 -o x78jEHotBjfw6U4yiFSmo4/20200310/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/20180927/md5.txt -o gEwLFVZBrYc9Z9Dr2bBGgE/20180927/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/20180927/MVver_20180927 -o gEwLFVZBrYc9Z9Dr2bBGgE/20180927/MVver_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/20180927/layout -o gEwLFVZBrYc9Z9Dr2bBGgE/20180927/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/uboot_v632.img -o gEwLFVZBrYc9Z9Dr2bBGgE/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/backup_new_v1141.img -o gEwLFVZBrYc9Z9Dr2bBGgE/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/20180927/a31nearalexa_new_uImage_20180927 -o gEwLFVZBrYc9Z9Dr2bBGgE/20180927/a31nearalexa_new_uImage_20180927
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/20180927/user.jffs2 -o gEwLFVZBrYc9Z9Dr2bBGgE/20180927/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/gEwLFVZBrYc9Z9Dr2bBGgE/20180927/user2.jffs2 -o gEwLFVZBrYc9Z9Dr2bBGgE/20180927/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/20190717/md5.txt -o ZASVj93wiBwfWDngch3LjN/20190717/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/20190717/MVver_20190717 -o ZASVj93wiBwfWDngch3LjN/20190717/MVver_20190717
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/20190717/layout -o ZASVj93wiBwfWDngch3LjN/20190717/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/uboot_v632.img -o ZASVj93wiBwfWDngch3LjN/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/backup_new_v1141.img -o ZASVj93wiBwfWDngch3LjN/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/20190717/a31kohlersmartmirror_new_uImage_20190717 -o ZASVj93wiBwfWDngch3LjN/20190717/a31kohlersmartmirror_new_uImage_20190717
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/20190717/user.jffs2 -o ZASVj93wiBwfWDngch3LjN/20190717/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZASVj93wiBwfWDngch3LjN/20190717/user2.jffs2 -o ZASVj93wiBwfWDngch3LjN/20190717/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/20181220/md5.txt -o fvkd89tmZV3SxTEoPwbWVC/20181220/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/20181220/MVver_20181220 -o fvkd89tmZV3SxTEoPwbWVC/20181220/MVver_20181220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/20181220/layout -o fvkd89tmZV3SxTEoPwbWVC/20181220/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/uboot_v632.img -o fvkd89tmZV3SxTEoPwbWVC/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/backup_new_v1141.img -o fvkd89tmZV3SxTEoPwbWVC/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/20181220/a31slave_noasr_new_uImage_20181220 -o fvkd89tmZV3SxTEoPwbWVC/20181220/a31slave_noasr_new_uImage_20181220
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/20181220/user.jffs2 -o fvkd89tmZV3SxTEoPwbWVC/20181220/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fvkd89tmZV3SxTEoPwbWVC/20181220/user2.jffs2 -o fvkd89tmZV3SxTEoPwbWVC/20181220/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/20200909/md5.txt -o Akdp6e7hBkctVUxmFE6G4W/20200909/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/20200909/MVver_20200909 -o Akdp6e7hBkctVUxmFE6G4W/20200909/MVver_20200909
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/20200909/layout -o Akdp6e7hBkctVUxmFE6G4W/20200909/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/uboot_v632.img -o Akdp6e7hBkctVUxmFE6G4W/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/backup_new_v1141.img -o Akdp6e7hBkctVUxmFE6G4W/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/20200909/a31energysystemfaravs_new_uImage_20200909 -o Akdp6e7hBkctVUxmFE6G4W/20200909/a31energysystemfaravs_new_uImage_20200909
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/20200909/user.jffs2 -o Akdp6e7hBkctVUxmFE6G4W/20200909/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/Akdp6e7hBkctVUxmFE6G4W/20200909/user2.jffs2 -o Akdp6e7hBkctVUxmFE6G4W/20200909/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/20181204/md5.txt -o FGgoHceueykzaZMM4PqH77/20181204/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/20181204/MVver_20181204 -o FGgoHceueykzaZMM4PqH77/20181204/MVver_20181204
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/20181204/layout -o FGgoHceueykzaZMM4PqH77/20181204/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/uboot_v632.img -o FGgoHceueykzaZMM4PqH77/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/backup_new_v1141.img -o FGgoHceueykzaZMM4PqH77/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/20181204/a31dossora_new_uImage_20181204 -o FGgoHceueykzaZMM4PqH77/20181204/a31dossora_new_uImage_20181204
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/20181204/user.jffs2 -o FGgoHceueykzaZMM4PqH77/20181204/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FGgoHceueykzaZMM4PqH77/20181204/user2.jffs2 -o FGgoHceueykzaZMM4PqH77/20181204/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/20200318/md5.txt -o x46bMMNAa5AuroGeh9UZCX/20200318/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/20200318/MVver_20200318 -o x46bMMNAa5AuroGeh9UZCX/20200318/MVver_20200318
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/20200318/layout -o x46bMMNAa5AuroGeh9UZCX/20200318/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/uboot_v632.img -o x46bMMNAa5AuroGeh9UZCX/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/backup_new_v1141.img -o x46bMMNAa5AuroGeh9UZCX/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/20200318/a31faravs_new_uImage_20200318 -o x46bMMNAa5AuroGeh9UZCX/20200318/a31faravs_new_uImage_20200318
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/20200318/user.jffs2 -o x46bMMNAa5AuroGeh9UZCX/20200318/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/x46bMMNAa5AuroGeh9UZCX/20200318/user2.jffs2 -o x46bMMNAa5AuroGeh9UZCX/20200318/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/20200318/md5.txt -o QkwcEfAWLsKNifHskuwiPb/20200318/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/20200318/MVver_20200318 -o QkwcEfAWLsKNifHskuwiPb/20200318/MVver_20200318
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/20200318/layout -o QkwcEfAWLsKNifHskuwiPb/20200318/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/uboot_v632.img -o QkwcEfAWLsKNifHskuwiPb/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/backup_new_v1141.img -o QkwcEfAWLsKNifHskuwiPb/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/20200318/a31faravs_new_uImage_20200318 -o QkwcEfAWLsKNifHskuwiPb/20200318/a31faravs_new_uImage_20200318
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/20200318/user.jffs2 -o QkwcEfAWLsKNifHskuwiPb/20200318/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/QkwcEfAWLsKNifHskuwiPb/20200318/user2.jffs2 -o QkwcEfAWLsKNifHskuwiPb/20200318/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/20191129/md5.txt -o xLunHPEmyrV3oaQSwj2z4m/20191129/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/20191129/MVver_20191129 -o xLunHPEmyrV3oaQSwj2z4m/20191129/MVver_20191129
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/20191129/layout -o xLunHPEmyrV3oaQSwj2z4m/20191129/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/uboot_v632.img -o xLunHPEmyrV3oaQSwj2z4m/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/backup_new_v1141.img -o xLunHPEmyrV3oaQSwj2z4m/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/20191129/a31slave_noasr_new_uImage_20191129 -o xLunHPEmyrV3oaQSwj2z4m/20191129/a31slave_noasr_new_uImage_20191129
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/20191129/user.jffs2 -o xLunHPEmyrV3oaQSwj2z4m/20191129/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xLunHPEmyrV3oaQSwj2z4m/20191129/user2.jffs2 -o xLunHPEmyrV3oaQSwj2z4m/20191129/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/20190305/md5.txt -o z3Sb4gSownEnFk27pDTN8P/20190305/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/20190305/MVver_20190305 -o z3Sb4gSownEnFk27pDTN8P/20190305/MVver_20190305
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/20190305/layout -o z3Sb4gSownEnFk27pDTN8P/20190305/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/uboot_v632.img -o z3Sb4gSownEnFk27pDTN8P/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/backup_new_v1141.img -o z3Sb4gSownEnFk27pDTN8P/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/20190305/a31faravs_new_uImage_20190305 -o z3Sb4gSownEnFk27pDTN8P/20190305/a31faravs_new_uImage_20190305
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/20190305/user.jffs2 -o z3Sb4gSownEnFk27pDTN8P/20190305/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/z3Sb4gSownEnFk27pDTN8P/20190305/user2.jffs2 -o z3Sb4gSownEnFk27pDTN8P/20190305/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/20210301/md5.txt -o ZxgzzzdDjK7QS4ymHyLpWL/20210301/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/20210301/MVver_20210301 -o ZxgzzzdDjK7QS4ymHyLpWL/20210301/MVver_20210301
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/20210301/layout -o ZxgzzzdDjK7QS4ymHyLpWL/20210301/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/uboot_v632.img -o ZxgzzzdDjK7QS4ymHyLpWL/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/backup_new_v1141.img -o ZxgzzzdDjK7QS4ymHyLpWL/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/20210301/a31fortex_new_uImage_20210301 -o ZxgzzzdDjK7QS4ymHyLpWL/20210301/a31fortex_new_uImage_20210301
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/20210301/user.jffs2 -o ZxgzzzdDjK7QS4ymHyLpWL/20210301/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ZxgzzzdDjK7QS4ymHyLpWL/20210301/user2.jffs2 -o ZxgzzzdDjK7QS4ymHyLpWL/20210301/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/20191125/md5.txt -o zRJrJ2ybB5Rqjy9scDaaVU/20191125/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/20191125/MVver_20191125 -o zRJrJ2ybB5Rqjy9scDaaVU/20191125/MVver_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/20191125/layout -o zRJrJ2ybB5Rqjy9scDaaVU/20191125/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/uboot_v632.img -o zRJrJ2ybB5Rqjy9scDaaVU/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/backup_new_v1141.img -o zRJrJ2ybB5Rqjy9scDaaVU/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/20191125/a31fortex_srcout_advance_new_uImage_20191125 -o zRJrJ2ybB5Rqjy9scDaaVU/20191125/a31fortex_srcout_advance_new_uImage_20191125
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/20191125/user.jffs2 -o zRJrJ2ybB5Rqjy9scDaaVU/20191125/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/zRJrJ2ybB5Rqjy9scDaaVU/20191125/user2.jffs2 -o zRJrJ2ybB5Rqjy9scDaaVU/20191125/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HDSkP7JxxiZjeB76HS8RBP/20180502/MVver_20180502 -o HDSkP7JxxiZjeB76HS8RBP/20180502/MVver_20180502
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HDSkP7JxxiZjeB76HS8RBP/20180502/layout -o HDSkP7JxxiZjeB76HS8RBP/20180502/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HDSkP7JxxiZjeB76HS8RBP/uboot_v632.img -o HDSkP7JxxiZjeB76HS8RBP/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HDSkP7JxxiZjeB76HS8RBP/backup_new_v1141.img -o HDSkP7JxxiZjeB76HS8RBP/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HDSkP7JxxiZjeB76HS8RBP/20180502/a31faralexa_new_uImage_20180502 -o HDSkP7JxxiZjeB76HS8RBP/20180502/a31faralexa_new_uImage_20180502
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HDSkP7JxxiZjeB76HS8RBP/20180502/user.jffs2 -o HDSkP7JxxiZjeB76HS8RBP/20180502/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/HDSkP7JxxiZjeB76HS8RBP/20180502/user2.jffs2 -o HDSkP7JxxiZjeB76HS8RBP/20180502/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/20180716/md5.txt -o RdmfxxoZzQLj5KBfTkqiRV/20180716/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/20180716/MVver_20180716 -o RdmfxxoZzQLj5KBfTkqiRV/20180716/MVver_20180716
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/20180716/layout -o RdmfxxoZzQLj5KBfTkqiRV/20180716/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/uboot_v632.img -o RdmfxxoZzQLj5KBfTkqiRV/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/backup_new_v1141.img -o RdmfxxoZzQLj5KBfTkqiRV/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/20180716/a31faravs_new_uImage_20180716 -o RdmfxxoZzQLj5KBfTkqiRV/20180716/a31faravs_new_uImage_20180716
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/20180716/user.jffs2 -o RdmfxxoZzQLj5KBfTkqiRV/20180716/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/RdmfxxoZzQLj5KBfTkqiRV/20180716/user2.jffs2 -o RdmfxxoZzQLj5KBfTkqiRV/20180716/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/20211008/md5.txt -o M7hFsDfNwwQmU5WbsJmnFZ/20211008/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/20211008/MVver_20211008 -o M7hFsDfNwwQmU5WbsJmnFZ/20211008/MVver_20211008
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/20211008/layout -o M7hFsDfNwwQmU5WbsJmnFZ/20211008/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/uboot_v632.img -o M7hFsDfNwwQmU5WbsJmnFZ/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/backup_new_v1141.img -o M7hFsDfNwwQmU5WbsJmnFZ/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/20211008/a31ankera1alexa_new_uImage_20211008 -o M7hFsDfNwwQmU5WbsJmnFZ/20211008/a31ankera1alexa_new_uImage_20211008
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/20211008/user.jffs2 -o M7hFsDfNwwQmU5WbsJmnFZ/20211008/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/M7hFsDfNwwQmU5WbsJmnFZ/20211008/user2.jffs2 -o M7hFsDfNwwQmU5WbsJmnFZ/20211008/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/20220913/md5.txt -o rpWakU8uucPBhJMfK3gN35/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/20220913/MVver_20220913 -o rpWakU8uucPBhJMfK3gN35/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/20220913/layout -o rpWakU8uucPBhJMfK3gN35/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/uboot_v632.img -o rpWakU8uucPBhJMfK3gN35/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/backup_new_v1141.img -o rpWakU8uucPBhJMfK3gN35/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/20220913/a28youyishi_new_uImage_20220913 -o rpWakU8uucPBhJMfK3gN35/20220913/a28youyishi_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/20220913/user.jffs2 -o rpWakU8uucPBhJMfK3gN35/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/rpWakU8uucPBhJMfK3gN35/20220913/user2.jffs2 -o rpWakU8uucPBhJMfK3gN35/20220913/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/20190305/md5.txt -o nv8mSnoNidCyPaYEDZCZq8/20190305/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/20190305/MVver_20190305 -o nv8mSnoNidCyPaYEDZCZq8/20190305/MVver_20190305
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/20190305/layout -o nv8mSnoNidCyPaYEDZCZq8/20190305/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/uboot_v632.img -o nv8mSnoNidCyPaYEDZCZq8/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/backup_new_v1141.img -o nv8mSnoNidCyPaYEDZCZq8/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/20190305/a31faravs_new_uImage_20190305 -o nv8mSnoNidCyPaYEDZCZq8/20190305/a31faravs_new_uImage_20190305
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/20190305/user.jffs2 -o nv8mSnoNidCyPaYEDZCZq8/20190305/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/nv8mSnoNidCyPaYEDZCZq8/20190305/user2.jffs2 -o nv8mSnoNidCyPaYEDZCZq8/20190305/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/20190301/md5.txt -o FFw78mCStJTXgYZaTELp5F/20190301/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/20190301/MVver_20190301 -o FFw78mCStJTXgYZaTELp5F/20190301/MVver_20190301
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/20190301/layout -o FFw78mCStJTXgYZaTELp5F/20190301/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/uboot_v632.img -o FFw78mCStJTXgYZaTELp5F/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/backup_new_v1141.img -o FFw78mCStJTXgYZaTELp5F/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/20190301/a31ihomefaralexa_new_uImage_20190301 -o FFw78mCStJTXgYZaTELp5F/20190301/a31ihomefaralexa_new_uImage_20190301
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/20190301/user.jffs2 -o FFw78mCStJTXgYZaTELp5F/20190301/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/FFw78mCStJTXgYZaTELp5F/20190301/user2.jffs2 -o FFw78mCStJTXgYZaTELp5F/20190301/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/20191217/md5.txt -o dLUcFcWTiswf2HgGsJ2gZ4/20191217/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/20191217/MVver_20191217 -o dLUcFcWTiswf2HgGsJ2gZ4/20191217/MVver_20191217
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/20191217/layout -o dLUcFcWTiswf2HgGsJ2gZ4/20191217/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/uboot_v632.img -o dLUcFcWTiswf2HgGsJ2gZ4/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/backup_new_v1141.img -o dLUcFcWTiswf2HgGsJ2gZ4/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/20191217/a31imuzobox_new_uImage_20191217 -o dLUcFcWTiswf2HgGsJ2gZ4/20191217/a31imuzobox_new_uImage_20191217
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/20191217/user.jffs2 -o dLUcFcWTiswf2HgGsJ2gZ4/20191217/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/dLUcFcWTiswf2HgGsJ2gZ4/20191217/user2.jffs2 -o dLUcFcWTiswf2HgGsJ2gZ4/20191217/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/md5.txt -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/MVver_20210208 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/MVver_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/layout -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/uboot_v632.img -o xUBr33GdJ9ZhbjqHcWuhxB/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/backup_new_v1141.img -o xUBr33GdJ9ZhbjqHcWuhxB/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/a31jam_new_uImage_20210208 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/a31jam_new_uImage_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/user.jffs2 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/xUBr33GdJ9ZhbjqHcWuhxB/20210208/user2.jffs2 -o xUBr33GdJ9ZhbjqHcWuhxB/20210208/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/md5.txt -o A6t36nZJ6PJy6EoBr4kmLE/20210208/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/MVver_20210208 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/MVver_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/layout -o A6t36nZJ6PJy6EoBr4kmLE/20210208/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/uboot_v632.img -o A6t36nZJ6PJy6EoBr4kmLE/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/backup_new_v1141.img -o A6t36nZJ6PJy6EoBr4kmLE/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/a31jameup_new_uImage_20210208 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/a31jameup_new_uImage_20210208
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/user.jffs2 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/A6t36nZJ6PJy6EoBr4kmLE/20210208/user2.jffs2 -o A6t36nZJ6PJy6EoBr4kmLE/20210208/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/md5.txt -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/MVver_20220913 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/layout -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/uboot_v632.img -o w6L7XKJ8uJe3Tey7zSiA7F/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/backup_new_v1141.img -o w6L7XKJ8uJe3Tey7zSiA7F/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/a31youyishi_new_uImage_20220913 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/a31youyishi_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/user.jffs2 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/user2.jffs2 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/md5.txt -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/MVver_20220913 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/layout -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/uboot_v632.img -o w6L7XKJ8uJe3Tey7zSiA7F/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/backup_new_v1141.img -o w6L7XKJ8uJe3Tey7zSiA7F/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/a31youyishi_new_uImage_20220913 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/a31youyishi_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/user.jffs2 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/user2.jffs2 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/md5.txt -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/MVver_20220913 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/layout -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/uboot_v632.img -o w6L7XKJ8uJe3Tey7zSiA7F/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/backup_new_v1141.img -o w6L7XKJ8uJe3Tey7zSiA7F/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/a31youyishi_new_uImage_20220913 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/a31youyishi_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/user.jffs2 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/user2.jffs2 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/md5.txt -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/MVver_20220913 -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/layout -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/uboot_v632.img -o NDGb8Hj8vnGLgieVhMiU2Z/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/backup_new_v1141.img -o NDGb8Hj8vnGLgieVhMiU2Z/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/a31youyishi_audiocastM5_new_uImage_20220913 -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/a31youyishi_audiocastM5_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/user.jffs2 -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/user2.jffs2 -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/md5.txt -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/MVver_20220913 -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/layout -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/uboot_v632.img -o NDGb8Hj8vnGLgieVhMiU2Z/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/backup_new_v1141.img -o NDGb8Hj8vnGLgieVhMiU2Z/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/a31youyishi_audiocastM5_new_uImage_20220913 -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/a31youyishi_audiocastM5_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/user.jffs2 -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/NDGb8Hj8vnGLgieVhMiU2Z/20220913/user2.jffs2 -o NDGb8Hj8vnGLgieVhMiU2Z/20220913/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/md5.txt -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/MVver_20220913 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/layout -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/uboot_v632.img -o w6L7XKJ8uJe3Tey7zSiA7F/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/backup_new_v1141.img -o w6L7XKJ8uJe3Tey7zSiA7F/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/a31youyishi_new_uImage_20220913 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/a31youyishi_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/user.jffs2 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/w6L7XKJ8uJe3Tey7zSiA7F/20220913/user2.jffs2 -o w6L7XKJ8uJe3Tey7zSiA7F/20220913/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/20220913/md5.txt -o u9H6EfHtkxNg6VftQUUgPC/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/20220913/MVver_20220913 -o u9H6EfHtkxNg6VftQUUgPC/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/20220913/layout -o u9H6EfHtkxNg6VftQUUgPC/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/uboot_v632.img -o u9H6EfHtkxNg6VftQUUgPC/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/backup_new_v1141.img -o u9H6EfHtkxNg6VftQUUgPC/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/20220913/a31youyishi_audiocastM5_new_uImage_20220913 -o u9H6EfHtkxNg6VftQUUgPC/20220913/a31youyishi_audiocastM5_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/20220913/user.jffs2 -o u9H6EfHtkxNg6VftQUUgPC/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/u9H6EfHtkxNg6VftQUUgPC/20220913/user2.jffs2 -o u9H6EfHtkxNg6VftQUUgPC/20220913/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/20190806/md5.txt -o m24EiXYk2t83dQnwHWSCb7/20190806/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/20190806/MVver_20190806 -o m24EiXYk2t83dQnwHWSCb7/20190806/MVver_20190806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/20190806/layout -o m24EiXYk2t83dQnwHWSCb7/20190806/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/uboot_v632.img -o m24EiXYk2t83dQnwHWSCb7/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/backup_new_v1141.img -o m24EiXYk2t83dQnwHWSCb7/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/20190806/a31ihomecav1_new_uImage_20190806 -o m24EiXYk2t83dQnwHWSCb7/20190806/a31ihomecav1_new_uImage_20190806
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/20190806/user.jffs2 -o m24EiXYk2t83dQnwHWSCb7/20190806/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/m24EiXYk2t83dQnwHWSCb7/20190806/user2.jffs2 -o m24EiXYk2t83dQnwHWSCb7/20190806/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/20190509/md5.txt -o fxicwREXGrCy5WdjnRW83k/20190509/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/20190509/MVver_20190509 -o fxicwREXGrCy5WdjnRW83k/20190509/MVver_20190509
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/20190509/layout -o fxicwREXGrCy5WdjnRW83k/20190509/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/uboot_v632.img -o fxicwREXGrCy5WdjnRW83k/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/backup_new_v1141.img -o fxicwREXGrCy5WdjnRW83k/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/20190509/a31ihomecav5_new_uImage_20190509 -o fxicwREXGrCy5WdjnRW83k/20190509/a31ihomecav5_new_uImage_20190509
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/20190509/user.jffs2 -o fxicwREXGrCy5WdjnRW83k/20190509/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/fxicwREXGrCy5WdjnRW83k/20190509/user2.jffs2 -o fxicwREXGrCy5WdjnRW83k/20190509/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/20190925/md5.txt -o D7MG8RCHMvmjoqTmCkYozU/20190925/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/20190925/MVver_20190925 -o D7MG8RCHMvmjoqTmCkYozU/20190925/MVver_20190925
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/20190925/layout -o D7MG8RCHMvmjoqTmCkYozU/20190925/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/uboot_v632.img -o D7MG8RCHMvmjoqTmCkYozU/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/backup_new_v1141.img -o D7MG8RCHMvmjoqTmCkYozU/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/20190925/a31ihomefaralexa_new_uImage_20190925 -o D7MG8RCHMvmjoqTmCkYozU/20190925/a31ihomefaralexa_new_uImage_20190925
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/20190925/user.jffs2 -o D7MG8RCHMvmjoqTmCkYozU/20190925/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/D7MG8RCHMvmjoqTmCkYozU/20190925/user2.jffs2 -o D7MG8RCHMvmjoqTmCkYozU/20190925/user2.jffs2
#
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/20210507/md5.txt -o ajKPF7CYaRaaemSHZxgNgR/20210507/md5.txt
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/20210507/MVver_20210507 -o ajKPF7CYaRaaemSHZxgNgR/20210507/MVver_20210507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/20210507/layout -o ajKPF7CYaRaaemSHZxgNgR/20210507/layout
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/uboot_v632.img -o ajKPF7CYaRaaemSHZxgNgR/uboot_v632.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/backup_new_v1141.img -o ajKPF7CYaRaaemSHZxgNgR/backup_new_v1141.img
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/20210507/a31farlifepod_new_uImage_20210507 -o ajKPF7CYaRaaemSHZxgNgR/20210507/a31farlifepod_new_uImage_20210507
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/20210507/user.jffs2 -o ajKPF7CYaRaaemSHZxgNgR/20210507/user.jffs2
curl --create-dirs http://silenceota.linkplay.com/wifi_audio_image/ajKPF7CYaRaaemSHZxgNgR/20210507/user2.jffs2 -o ajKPF7CYaRaaemSHZxgNgR/20210507/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/20220913/md5.txt -o MzTK2RkpRp9EDYb5wxnn89/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/20220913/MVver_20220913 -o MzTK2RkpRp9EDYb5wxnn89/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/20220913/layout -o MzTK2RkpRp9EDYb5wxnn89/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/uboot_v632.img -o MzTK2RkpRp9EDYb5wxnn89/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/backup_new_v1141.img -o MzTK2RkpRp9EDYb5wxnn89/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/20220913/a31youyishi_new_uImage_20220913 -o MzTK2RkpRp9EDYb5wxnn89/20220913/a31youyishi_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/20220913/user.jffs2 -o MzTK2RkpRp9EDYb5wxnn89/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/MzTK2RkpRp9EDYb5wxnn89/20220913/user2.jffs2 -o MzTK2RkpRp9EDYb5wxnn89/20220913/user2.jffs2
#
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/20220913/md5.txt -o 5YVgvj9cCSV3w6Cd5gwMqT/20220913/md5.txt
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/20220913/MVver_20220913 -o 5YVgvj9cCSV3w6Cd5gwMqT/20220913/MVver_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/20220913/layout -o 5YVgvj9cCSV3w6Cd5gwMqT/20220913/layout
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/uboot_v632.img -o 5YVgvj9cCSV3w6Cd5gwMqT/uboot_v632.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/backup_new_v1141.img -o 5YVgvj9cCSV3w6Cd5gwMqT/backup_new_v1141.img
curl --create-dirs http://d1r81jiegqii1z.ucdn.net/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/20220913/a31youyishi_new_uImage_20220913 -o 5YVgvj9cCSV3w6Cd5gwMqT/20220913/a31youyishi_new_uImage_20220913
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/20220913/user.jffs2 -o 5YVgvj9cCSV3w6Cd5gwMqT/20220913/user.jffs2
curl --create-dirs http://ota.ucdn.net/wifi_audio_image/5YVgvj9cCSV3w6Cd5gwMqT/20220913/user2.jffs2 -o 5YVgvj9cCSV3w6Cd5gwMqT/20220913/user2.jffs2
#
