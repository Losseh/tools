#!/bin/bash
# example use: ./consistency_check.sh /home/outerdisk/foty toshiba

CHECKED_DIR=$1
POSTFIX=$2

if [ -z "$CHECKED_DIR" ];
then
  echo "first arg=checked_dir is empty! -> breaking"
  exit -1
fi

if [ -z "$POSTFIX" ];
then
  echo "second arg=checklist_postfix is empty! -> braeking"
  exit -1
fi

OUTPUT_DIR=`date +%d_%m_%Y`
mkdir -p $OUTPUT_DIR

CHECK_OUTPUT="$OUTPUT_DIR/checklist_$POSTFIX.chk"

dir_md5sum() {
  echo `ls -alR $1 | md5sum`
}

touch $CHECK_OUTPUT
echo "date=`date +%Y-%m-%d.%H:%M:%S`, checked_dir=$CHECKED_DIR, postfix=$POSTFIX" > $CHECK_OUTPUT
for dir in `find $CHECKED_DIR/. -type d`
do
  echo "$dir $(dir_md5sum $dir)" >> $CHECK_OUTPUT
done


# check against generated checklist
# md5sum -c checklist.chk
