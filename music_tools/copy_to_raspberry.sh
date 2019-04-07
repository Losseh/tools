#!/bin/bash


#TODO: zipping without the trailing directory with unicode characters works just fine, whereas trailing directory spoils the unpacking. Remove the trailing directory and simply unpack all the gathered files into the newly created trailing directory already on the raspberry

# name of the file / directory to send
SUBDIR=`basename "$1"`
echo "$SUBDIR"
# location of the file / directory to send
LOCATION=`dirname "$1"`
echo "$LOCATION"
cd "$LOCATION"
# IP of raspberry
RASP="pi@192.168.0.52"
# delimiter in raspberry address
DELIMITER=":"
# location of music on raspberry
MUSIC_DIR="/media/source1/muzyczka/"
# name of the zip file to transmit
ZIP="tmp.zip"
# name of directory to unpack the sent file [optional] 
TARGETDIR=$2
zip -r $ZIP "$SUBDIR"

TARGET=$RASP$DELIMITER$MUSIC_DIR$ZIP
scp $ZIP $TARGET

ssh $RASP "7z x $MUSIC_DIR$ZIP -o$MUSIC_DIR$TARGETDIR"
#ssh $RASP "rm $MUSIC_DIR$ZIP"
rm $ZIP
