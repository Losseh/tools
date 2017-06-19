#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Illegal number of parameters. You should pass output file to this script. Example:"
  echo "  $> ./trim_drop_errors.sh without_drops.out"
  echo "P.S. Implicitely input files is here: /c/swl/svn/trunk/bin/db/out.log"
  echo "     If you don't like the input file, please open me and change my behaviour."
  exit -1
fi

INPUT_FILE="/c/swl/svn/trunk/bin/db/out.log"

cat $INPUT_FILE | perl -0777 -pe 's/DROP.*?vorhanden\.\s*//igs' > $1
