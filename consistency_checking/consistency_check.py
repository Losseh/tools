#!/bin/python
# example usage = python consistency_check.py toshiba_device /home/outer/foteczki

import hashlib, os, sys

def hash(name, directory):
  print('report name={}, dir={}'.format(name, os.path.abspath(directory)))
  for subdir in os.listdir(directory):
    full_dir_path = os.path.join(directory, subdir)
    if os.path.isdir(full_dir_path):
      dir_files = os.listdir(full_dir_path)
      dir_files_names = ''.join(dir_files)
      files_names_hash = hashlib.sha256(dir_files_names.encode('utf-8')).hexdigest()
      print('dir={}, #files={}, hash={}'.format(subdir, len(dir_files), files_names_hash))

if len(sys.argv) != 3:
  print('insufficient arguments!')
  sys.exit(-1)

name = sys.argv[1]
directory = sys.argv[2]
hash(name, directory)
