#!/bin/bash
for filename in *.mp3; do
	filename1=`echo $filename | perl -pe 's|\-[a-zA-Z0-9\_\-]{11}||g'`
	mv "$filename" "$filename1"
done
#output = $(mv 1 2)
#echo "$output"
