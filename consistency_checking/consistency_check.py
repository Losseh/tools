#!/bin/python

import hashlib, os, sys

def hash(directory):
  for files in os.listdir(directory):
    for subfile in files:
      full_dir_path = os.path.join(directory, subfile)
      if os.path.isdir(full_dir_path):
        dir_files = os.listdir(full_dir_path)
        dir_files_names = ''.join(dir_files)
        files_names_hash = hashlib.md5(dir_files_names.encode('utf-8')).hexdigest()
        print('dir=', full_dir_path, ', #files=', len(dir_files), ', hash=', files_names_hash)

if len(sys.argv) != 2:
  print('insufficient arguments!')
  sys.exit(-1)

hash(sys.argv[1])
