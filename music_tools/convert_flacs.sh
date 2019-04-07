#!/bin/bash
[[ $# == 0 ]] && set -- *.flac
for f; do
  avconv -i "$f" -qscale:a 0 "${f[@]/%flac/mp3}"
done
