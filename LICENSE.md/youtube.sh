#!/bin/bash
if [ -e /data/data/com.termux/files/usr/bin/python2 ]
then
	echo "Python2 already installed"
else
	apt-get install python2
fi
if [ -d /data/data/com.termux/files/usr/lib/python2.7/site-packages/youtube_dl ]
then
	echo "Youtube-dl exists "
else
	pip2 install youtube-dl
fi
if [ -d $HOME/config ]
then
	rm -rf config
	mkdir $HOME/config
	mkdir $HOME/config/youtube-dl
	cd $HOME/config/youtube-dl
	if [ -d /data/data/com.termux/files/home/storage/shared/youtube ]
	then
		rm -rf /data/data/com.termux/files/home/storage/shared/youtube
		mkdir /data/data/com.termux/files/home/storage/shared/youtube
	else
		mkdir /data/data/com.termux/files/home/storage/shared/youtube
	fi
	touch config
	echo "--no-mtime" >> config
	echo "-o /data/data/com.termux/files/home/storage/shared/youtube/%(title)s.%(ext)s" >> config
	echo '-f "best[height<=480]"' >> config
else
	mkdir $HOME/config
	mkdir $HOME/config/youtube-dl
	cd $HOME/config/youtube-dl
	if [ -d /data/data/com.termux/files/home/storage/shared/youtube ]
	then
		rm -rf /data/data/com.termux/files/home/storage/shared/youtube
		mkdir /data/data/com.termux/files/home/storage/shared/youtube
	else
		mkdir /data/data/com.termux/files/home/storage/shared/youtube
	fi
	touch config
	echo "--no-mtime" >> config
	echo "-o /data/data/com.termux/files/home/storage/shared/youtube/%(title)s.%(ext)s" >> config
	echo '-f "best[height<=480]"' >> config
fi
if [ -d $HOME/bin ]
then

	rm -rf $HOME/bin
	mkdir $HOME/bin
	cd $HOME/bin
	touch termux-url-opener
	echo "cd /sdcard/youtube" >> termux-url-opener
	echo 'youtube-dl $1'>> termux-url-opener
else
	mkdir $HOME/bin
	cd $HOME/bin
	touch termux-url-opener
	echo "cd /sdcard/youtube" >> termux-url-opener
	echo 'youtube-dl $1'>> termux-url-opener

fi
