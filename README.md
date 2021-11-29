# Cronjob-backup-script

Simply takes backup of "crontab -l" weekly and push them to s3. 



:warning: Add this command to ~/.bashrc file to  avoid accidentals deletions.

```crontab () { [[ $@ =~ -[iel]*r ]] && echo '"r" not allowed' || command crontab "$@" ;}```

### Schedule @crontab
“At 07:07 on Friday.”

```7 7 * * 5 bash cron_backup.sh ```
