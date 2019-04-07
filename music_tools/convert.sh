#!/bin/bash

FILES=./*
for f in $FILES
do
  avconv -i "$f" "${f}.mp3"
done
