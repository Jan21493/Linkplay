# Adjust Gain in Amplifier
A while ago I bought 3 Up2Stream Amp v2 devices (v1.1 is printed on the pcb). They are working well, but I have a problem with the power control with the one that is installed in my Sauna. When I'm relaxing there I'd like to hear soft music or nature sounds, but even at volume level 1 (on a scale from 1-100) it's a bit too loud. I have asked Arylic support and they were really friendly and explained a way to solve my problem:

: they are just too loud with my speakers that I have installed in the ceiling. I have set the volume to 1 or 2 via 4Stream app and with API commands already, e.g.
 
set volume to 1:
curl 'http://192.168.1.64/httpapi.asp?command=setPlayerCmd:vol:1'
 
show volume:
curl 'http://192.168.1.67/httpapi.asp?command=setPlayerCmd:Vol--'
 
but I'd like to reduce the volume even more. Is there any way to reduce the volume, e.g. with a special API command that lowers the amplification in the MV8064 chip to e.g. 20 or 30% or by changing a resistor on the mainboard that will lower the amplification? It would be great if there is an option to reduce the "master" volume to use the full volume control slider in the 4stream app / range 1-100 via API. Currently 10 is already very loud and it's difficult to set 1 via app. This might also help other customers to adjust the volume with different speakers in a multiroom setup so that the volume is on the same level with the same value for volume control.
 
Kind Regards,
Jan


ANSWER:
Hi , dear sir . Thanks for your mail .

You can swap resistors, and that can adjust the gain of the amplifier directly.、You can refer to the specifications of TI3116

Thanks
Kathryn / Customer Service
info@arylic.com

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TPA3116D2 data sheet: 


7.3 Feature Description
7.3.1 Gain Setting and Master and Slave

Mode    Gain    R1      R2      Impedance
-----------------------------------------
Master  20dB    5.6k    open    60k
Master  26dB    20k     100k    30k (default setting for Arylic PCB)
Master  32dB    39k     100k    15k

R1 in TPA3116D2 data sheet is R19 in Arylic PCB and R2 is R18
