#!/bin/bash

svn diff -c $1 | grep Index | cut -d" " -f2 | tr "/" " " | tr "\\" " "
