#!/bin/bash

FILENAME=crontab-backup-"`date +"%d-%m-%Y"`"
BACKUP_PATH=$HOME/crontab_backup

if [ -d "$BACKUP_PATH" ]
then
	echo "Directory exist"
else
	mkdir -p "$BACKUP_PATH"
	echo "Directory $BACKUP_PATH created!"
fi

crontab -l > "$BACKUP_PATH/$FILENAME"
