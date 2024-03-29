# Linkplay
Reverse Engineering with Arylic audio streaming devices that contain a Linkplay A31 module.

## Motivation
A few years ago I bought an Arylic Up2Stream Amp audio device to play and stream music in my new sauna. Later I've added such a device to give my good, but old stereo speakers a second life. I also bought an Up2Stream Pro device for my Denon AV receiver, because the build-on vTuner was not working anymore without additional payments. So far the devices were working well, but I was missing a "notification message feature" to play messages from my home automation system  while music was playing. That feature was added by Arylic in version 4.6, see https://developer.arylic.com/httpapi/#play-notification-sound. 

Another feature that I really miss is "WiFi disable". There is a function to hide the SSID, but there is no way to disable WiFi completely. For security reasons, but also to avoid additional devices sending on the 2,4GHz WiFi band I like to have such a feature. That was the starting point to dig deeper into these devices. It turned out that these devices have a Linux CLI with a SoC similar to older Internet routers. I tried to document and share my findings with others.

## Other Researchers
I'd like to thank others that have done resarches and that I have used as a starting point:

Inofficial Linkplay API documentation from Anders Fluur:
https://github.com/AndersFluur/LinkPlayApi

Official API documentation from Arylic:
https://developer.arylic.com/httpapi/#http-api

Reverse Engineering by Crymeiriver:
https://github.com/Crymeiriver/LS150/blob/master/README.md

## Enable telnetd
To get started exploring these devices, a security vulnerability had to be exploited to install a telnetd. [Enable telnetd](/TELNETD.md)

## Hardware and Firmware
More information about the hardware and Firmware, file systems, including information how to add binary files the device. [Hardware and Firmware](/Hardware.md)

## Reverse Engineering
Information about the boot process, file systems including environment (NVRAM). [Reverse Engineering](/boot-process.md)

## Downgrade Firmware
The first version on my devices was 4.2.8020 from 2020/02/20 (20th of Feb 2020). That version still has some vulnerabilites to be able to get onto the CLI with telnet by pushing a single command to these devices. Although it is good when the vendor is providing upgrades with additional feature and security fixes, I'd still like to be able to "hack" into the CLI. Therefore I had to downgrade the firmware. See [Downgrade Firmware](/Downgrade.md) and next section for more information.

## Download and Prepare Firmware on your own web server
If you have some Linkplay devices I have compiled a list / script with useful commands (mainly 'curl')' to download XML files, images and more for version 4.2.80 mentioned above and latest version. There is a lot of information, especially for devices with Linkplay A31 module, but may also be a starting point for other Linkplay modules. The script may help you to download and prepare the firmware on your own web server. [Download and prepare Firmware](/download-firmware.md)

## Install Persistent Hook
When the device reboots, any changes in ramfs are lost, however there is a way to install a script or command so that it survives a reboot. [Install Persistent Hook](/persistent-hook.md)

## Allow own shell scripts in cgi-bin
By default the cgi-bin directory is read-only, but there is a way to make it writable to be able to install own shell scripts on the device. See [Allow own shell scripts in cgi-bin](/cgi-bin.md)

## Discover undocumented commands
By sniffing the communication between the 4steam app and the player, you may find new commands that are not documented so far. See [Sniff TLS communication between 4Stream app an player](/sniff-tls.md)
