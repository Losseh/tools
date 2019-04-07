#!/bin/bash -xe
FILES=*.*
for f in $FILES
do
  NEWNAME=`echo $f | sed $1`
  mv "$f" "$NEWNAME"
done
