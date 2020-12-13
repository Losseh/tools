#!/bin/bash

OUTPUT=backup-"`date +"%d-%m-%Y"`".zip 
BACKUP_DISC=/media/outer_disk
BACKUP_STORE=$BACKUP_DISC/backups/

if [ -f backups/$OUTPUT ]
then
  echo "---desired file exists. zipping is omitted"
else
  echo "---zipping files to backups/$OUTPUT"
  zip -r backups/$OUTPUT cv_justyna dokumenty felka finanse hasla mieszkanie pity ubezpieczenia zlobki backup.sh oneliners.txt
fi

if [ -d $BACKUP_DISC ]
then
  echo "---copying backup to $BACKUP_STORE"
  mkdir -p $BACKUP_STORE/
  cp backups/$OUTPUT $BACKUP_STORE/$OUTPUT
else
  echo "---$BACKUP_STORE does not exist. no copy will be made"
  exit -1
fi
