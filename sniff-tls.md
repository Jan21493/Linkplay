# Sniff TLS communication between 4Stream app an player

To find undocumented commands an better understand the communication between the 4Stream app an the player, it is possible to log all commands. The player is using a separate program called ***stunnel*** to enable TLS communication. This tool is a TLS wrapper that is simply added to the existing http service / daemon.

The configuration for ***stunnel*** can be found in the ***tmp*** directory:
```
cat /tmp/st7374756E6E656C.conf
[web_https]
accept = 443
connect = 127.0.0.1:80
requireCert = yes
verify = 2
checkHost = www.linkplay.com
checkEmail = mail@linkplay.com
cert = /tmp/st7374756E6E656C.pem
CAfile = /tmp/st7374756E6E656C_ca.pem
```
In the default configuration the service is using ***st7374756E6E656C.pem*** as its own certificate with a private key that is stored in the same file. The service is also requesting a certificate from the client side that needs to be signed from the CA listed in ***st7374756E6E656C_ca.pem***. 

I tried to decrypt a TLS session between the app and the player by importing the RSA keys from the server certificate, but TLS is negotiating the cipher that is used and by default a cipher with Diffie Hellman (DH) is choosen. Sessions negotiated with Diffie-Hellman don’t use the RSA key directly; instead each side generate a one-time key that stored only in RAM. The actual key is calculated from the own random key and the other half that is exchanged with the other side.

By modifiing the configuration file it is possible to select a cipher that is included in the 4stream app, but not using DH. In Wireshark you have to add the RSA key and then you are able to see the decrypted communication.

```
log = append
output = /tmp/stunnel.log
syslog = no

[web_https]
accept = 443
connect = 127.0.0.1:80
requireCert = yes
ciphers=AES128-GCM-SHA256
debug = notice
verify = 0
verifyPeer = yes
checkHost = www.linkplay.com
checkEmail = mail@linkplay.com
cert = /tmp/st7374756E6E656C.pem
CAfile = /tmp/st7374756E6E656C_ca.pem
```
![Wireshark screenshot](/pictures/Wireshark - TLS decoded.png)

The answer to the requests can be seen in Wireshark by following the TLS stream, but it's also possible to try the discovered command directly with curl:
```
curl -s 'http://10.1.1.58/httpapi.asp?command=getNetworkHealth' | jq
{
  "softap_enable": "0",
  "ssid": "",
  "securemode": "1",
  "psk": "546D62317A746B324E4876577A614D77616B725A666733656F51464D2B6D30523947363151573652666B633D",
  "WifiChannel": "11",
  "auth": "WPAPSKWPA2PSK",
  "encry": "AES",
  "eth": "10.1.1.58",
  "wifi": ""
}
```
The ***PSK*** looks to be hex encoded, but I haven't figured out how to convert it to clear text.

## Socat
If Wireshark looks to be too complicated to you, you may add ***socat*** as an additional 'layer' between ***stunnel*** and the http daemon ***rootApp***. Socat is not available in the OpenWRT archive for v15.05 / Chaos Calmer, but in a newer version. In newer versions OpenWRT has switched the program interpreter from ***/lib/ld-uClibc.so.0**** to ***/lib/ld-musl-mipsel-sf.so.1***.

At first you have to get the program interpreter from somewhere. I have compiled binwalk with squashfs-tools and sasquatch on my Mac mini, but it may work with the following command (and binwalk from e.g. MacPorts).
```
curl 'https://archive.openwrt.org/snapshots/trunk/ramips/mt7621/openwrt-ramips-mt7621-dir-860l-b1-squashfs-factory.bin' -O
binwalk -v -e -D 'squashfs:squashfs:7z x %e' openwrt-ramips-mt7621-dir-860l-b1-squashfs-factory.bin
open _openwrt-ramips-mt7621-dir-860l-b1-squashfs-factory.bin.extracted/
# find /lib/ld-musl-mipsel-sf.so.1 and copy it to e.g. /Library/WebServer/Documents/linkplay/a31/lib
```

Get ***socat*** from an OpenWRT package with ***mipsel_24kc*** type, extract the package and get the binary on your Mac or Linux PC.
```
curl 'https://downloads.openwrt.org/releases/packages-18.06/mipsel_24kc/packages/socat_1.7.3.2-3_mipsel_24kc.ipk' -o socat_1.7.3.2-3_mipsel_24kc.ipk
mkdir socat_1.7.3.2-3_mipsel_24kc
cd socat_1.7.3.2-3_mipsel_24kc
tar zxpvf ../socat_1.7.3.2-3_mipsel_24kc.ipk
tar zxpvf control.tar.gz
tar zxpvf data.tar.gz
open .
# copy the socat binary from /usr/bin to e.g. /Library/WebServer/Documents/linkplay/a31/bin
```
The path to the program interpreter is /lib, but that directory is read only. So I have patched the socat binary with hex editor 0xED on my Mac. Just search for ***lib/ld-musl-mipsel-sf.so.1*** and modify the path to ***/tmp***. You may also look for a utility called ***patchelf*** to do the job.


With ***readelf*** you are able to see which interpreter is used by a binary program and verify the patch from above.
```
wget -O /tmp/bin/readelf -T 5 'http://10.1.1.22/linkplay/a31/bin/readelf'
chmod 555 /tmp/bin/readelf
wget -O /tmp/ld-musl-mipsel-sf.so.1 -T 5 'http://10.1.1.22/linkplay/a31/lib/ld-musl-mipsel-sf.so.1'
chmod 555 /tmp/ld-musl-mipsel-sf.so.1
wget -O /tmp/bin/socat -T 5 http://10.1.1.22/linkplay/a31/bin/socat -q
chmod 555 /tmp/bin/socat
```

Then modify the configuration file for stunnel ***/tmp/st7374756E6E656C.conf *** as shown above, but use ```connect = 127.0.0.1:8800``` instead. Start ***socat*** as a daemon and restart ***stunnel***. All commands are shown in ***/tmp/socat.log***. They may be interleaved, so it's a bit complicated to find the answers for specific requests. 
```
killall stunnel
stunnel /tmp/st7374756E6E656C.conf&
socat -v TCP-LISTEN:8800,bind=127.0.0.1,fork TCP:localhost:80 1> /tmp/socat.log 2>&1 &
```
By default ***stunnel*** is started with ***rootApp***.
