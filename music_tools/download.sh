#!/bin/bash

if [ ! -d "$1" ]; then
	echo "The first argument must be an existing path"
  exit -1
fi

LINKS_FILE="to_download"
LINKS=`cat $LINKS_FILE | grep "$http.*"`

for LINK in $LINKS
do
	youtube-dl --extract-audio --audio-format mp3 --yes-playlist -i $LINK
done

# comment
sed -i 's/\(^https.*\)/#\1/g' $LINKS_FILE

# remove hashes from all the downloaded mp3 files
./yt_remove_hashes.sh

# move downloadees to the given path
mv *.mp3 $1
