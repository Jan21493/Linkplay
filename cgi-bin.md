# Allow own shell scripts in cgi-bin
By default the cgi-bin directory is read-only, but there is a way to make it writable to be able to install own shell scripts on the device. 

Initially I was looking for a way to add a notification message during play of music. There is a binary called ***smplayer*** preinstalled on the device that is exactly doing what I was looking for, even with nice fading of the music.

Here's a shell script called ***notice.sh*** that is calling that program:
```
#!/bin/sh
# notice.sh
# play announcement (any music/speech, e.g. mp3)
echo "Content-type: text/html"
echo
echo "Playing ... $WIIMU_play"
export LD_LIBRARY_PATH='/tmp/lib:/system/workdir/lib:'
/system/workdir/bin/smplayer "$WIIMU_play" >/dev/nul
```
The only problem was a way to run it from remote. The build-in webserver ***GoAhead*** does not accept any command line options and is using ***/etc_ro/web/cgi-bin*** by default. There is a way to get around that problem by creating a ***cgi-bin*** subdirectory in ***/etc*** and mount it on ***/etc_ro/web***. Here are the commands to accomplish this:

```
# allow custom shell scripts to be executed from remote via GoAhead webserver. 
# make /etc_ro/web/cgi-bin directory writeable by pointing to /etc/web/cgi-bin
# umount just in case this script is executed twice
umount /etc_ro/web/cgi-bin/
# create directory for CGI apps
mkdir /etc/web
mkdir /etc/web/cgi-bin
# download shell script to play notice
# note: you may store the script in flash to avoid any download (e.g. in /vendor/user)
wget -O /etc/web/cgi-bin/notice.sh -T 5 http://10.1.1.22/linkplay/scripts/notice.sh -q
# make shell script executable
chmod 755 /etc/web/cgi-bin/notice.sh
# copy existing files from existing (read-only) CGI directory
cp /etc_ro/web/cgi-bin/upload.cgi /etc/web/cgi-bin/upload.cgi
# mount new (read-write) CGI directory to existing CGI path 
mount /etc/web/cgi-bin/ /etc_ro/web/cgi-bin/ -o bind
# add proper library path
export LD_LIBRARY_PATH='/tmp/lib:/system/workdir/lib:'
# optional: play message with new shell script
export WIIMU_play='http://10.1.1.22/linkplay/scripts/Modification_installed.mp3'
/etc_ro/web/cgi-bin/notice.sh
unset WIIMU_play
```
You may add these commands to a persistent hook, see [Install Persistent Hook](/persistent-hook.md) for details.

Now you can play a notice message on the device by calling your script:
```
curl 'http://10.1.1.52/cgi-bin/notice.sh?play=http://10.1.1.22/mp3/SaunaIstAufgeheizt.mp3'
# if you have downloaded any messages to the Linkplay device itself, you may play a message from local storage
curl 'http://10.1.1.52/cgi-bin/notice.sh?play=/tmp/SaunaIstAufgeheizt.mp3'
```
> **Note:**
> Meanwhile Arylic has added an API call to play a notification message: ***/httpapi.asp?command=playPromptUrl:\<url\>***, see https://developer.arylic.com/httpapi/#play-notification-sound for details, but there might be other use cases.