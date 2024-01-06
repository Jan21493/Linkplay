# Adjust Gain in Amplifier
A while ago I bought 3 Up2Stream Amp v2 devices (v1.0 and v1.1 are printed on the pcb). They are working well, but I have a problem with the power control with the one that is installed in my Sauna. When I'm relaxing there I'd like to hear soft music or nature sounds, but even at volume level 1 (on a scale from 1-100) it's a bit too loud and its difficult to use the slider in the app when you only need values 1-5, but not the rest from 6-99. I have asked Arylic support and they were really friendly and explained a way to solve my problem: you can swap resistors, and that will adjust the gain of the amplifier directly. You can refer to the specifications of amplifier chip TI3116 from Texas Instruments.

See data sheet https://www.ti.com/product/TPA3116D2

In chapter 7.3 Feature Description, especially 7.3.1 Gain Setting and Master and Slave you find the following information:

| Mode   | Gain   | R1    |  R2   | Impedance |
|--------|--------|-------|-------|-----------|
| Master | 20dB   | 5.6k  | open  | 60k (use this setting if volume was too loud) |
| Master | 26dB   | 20k   | 100k  | 30k (default setting for Arylic PCB) |
| Master | 32dB   | 39k   | 100k  | 15k |

R1 in TPA3116D2 data sheet is R19 in Arylic PCB and R2 is R18. The arrows n the following schema for the Arlyic pcb are pointing to these resistors.  

![Arylic Up2Stream Amp TPA3116D2 Power Amplifier](https://github.com/Jan21493/Linkplay/assets/25911411/34e3e97c-ece0-4dd1-812d-55a416b5fb12)

On the Up2Stream Amp board with pcb version 1.0 the numbers are printed on the pcb, so it's easy to find them:

![Arylic Up2Stream Amp v2 0 - pcb v1 0](https://github.com/Jan21493/Linkplay/assets/25911411/36736092-f36c-44aa-8c4c-ea2fb2a68f15)

On the Up2Stream Amp board with pcb version 1.1 the numbers are not printed on the pcb, so it's hard to find them:

![Arylic Up2Stream Amp v2 0 - pcb v1 1](https://github.com/Jan21493/Linkplay/assets/25911411/1f65d660-1c93-4fbc-85b3-a65eaa6cdbd2)

I have removed R18 (R1 in the data sheet for the TPA3116D2) and used 5.6k for R19 (R1 in the data sheet) and now the volume is softer. Now its easier to adjust the volume with the slider in the app as well. 

To set and verify volume control, use these API commands:
```
# set volume to e.g. 1:
curl 'http://10.1.1.52/httpapi.asp?command=setPlayerCmd:vol:1'
 
# show volume:
curl -s 'http://10.1.1.52/httpapi.asp?command=getPlayerStatus' | jq
``` 
See https://developer.arylic.com/httpapi/#adjusting-volume
