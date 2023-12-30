# Enable telnetd
To enable telnetd on these devices, a security vulnerability had to be exploited. The first version on my devices was 4.2.8020 from 2020/02/20 (20th of Feb 2020) that still had a vulnerability in their code: internally a "sprintf" function was used to prepare a Linux CLI commands. That function was using an IP address as an input, but the input could be extended with ";" and additional commands to download and install a telnetd.

The command that has this vulnerability is "**_getsyslog_**", see https://developer.arylic.com/httpapi/#get-system-log and https://labs.withsecure.com/advisories/linkplay-firmware-wanlan-remote-code-execution. The command has an option to add an IP address from a slave device, e.g. "getsyslog:ip:10.1.1.90", so a CLI command is executed on the device to retrieve the system log from the slave device that includes the IP address. Instead of just having an IP address as a parameter, that CLI command can also include a ";"  and a second CLI command.


curl "http://10.1.1.52/httpapi.asp?command=getsyslog:ip:10.1.1.22/index.html;ifconfig+ra0+down+>+/tmp/web/cmd.out+2>+/tmp/web/cmd.err;"
