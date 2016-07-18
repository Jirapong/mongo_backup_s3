## Mongo Backup and Sync to S3

1. Download and install AWS-CLI - https://github.com/aws/aws-cli
2. Run `aws configure`
3. Edit script file
4. Make a crontab to run everyday at 1:00 AM

    0 1 * * * /backup-db/backup-mongo-db.sh >> /var/log/job-backup-mongo-db.log 2>&1
