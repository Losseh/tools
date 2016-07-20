#!/bin/bash -xe
if [ "$#" -eq "0" ]; then
    svn diff | vim -
else
    svn diff -c $1 | vim -
fi
