#!/bin/bash

if [ $# -eq 1 ]; then
  svn diff -c $1 | grep Index | cut -d" " -f2 | tr "/" " " | tr "\\" " " | sed '/iml/d' | sed '/^\s*$/d'
elif [ $# -eq 0 ]; then
  svn diff | grep Index | cut -d" " -f2 | tr "/" " " | tr "\\" " " | sed '/iml/d' | sed '/^\s*$/d'
else
  echo "Invalid number of parameters"
fi
