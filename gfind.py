import os
import sys
import re

def string_matches_regex(text):
    result = regex.match(text)
    return result is not None

def find_files(directory):
    return [(root + os.sep + file).replace('\\', '/').replace('\r','') for root, dirs, files in os.walk(directory) for file in files if string_matches_regex(file)]

dir = sys.argv[1] if len(sys.argv) > 1 else "."
regx = sys.argv[2] if len(sys.argv) > 2 else ".*"
regex = re.compile(regx)
for file in find_files(dir):
    print(file)
