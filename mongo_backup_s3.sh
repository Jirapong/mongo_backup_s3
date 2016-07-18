# Database credentials
db_name="test"

# Other options
backup_path="/backup/backup-mongo-file"
date=$(date +"%d-%b-%Y")

# Dump database into Mongo file
mongodump -h 127.0.0.1 -d $db_name --gzip --archive=$backup_path/$db_name-$date.gz

# Delete files older than 30 days
find $backup_path/* -mtime +30 -exec rm -rf {} \;

/usr/bin/aws s3 sync $backup_path/ s3://datadump123/mongo_backup
