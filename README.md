# Linkplay
Reverse Engineering with Arylic audio streaming devices that contain a Linkplay A31 module

## Motivation
A few years ago I bought an Arylic Up2Stream Amp audio device to play and stream music in my new sauna. Later I've added such a device to give my good, but old stereo speakers a second life. I also bought an Up2Stream Pro device for my Denon AV receiver, because the build-on vTuner was not working anymore without additional payments. So far the devices were working well, but I was missing a "notification message feature" to play messages from my home automation system  while music was playing. That feature was added by Arylic in version 4.6, see https://developer.arylic.com/httpapi/#play-notification-sound. 

Another feature that I really miss is "WiFi disable". There is a function to hide the SSID, but there is no way to disable WiFi completely. For security reasons, but also to avoid additional devices sending on the 2,4GHz WiFi band I like to have such a feature. That was the starting point to dig deeper into these devices. It turned out that these devices have a Linux CLI with a SoC similar to older Internet routers. I tried to document my findings in

dies ist ein text
