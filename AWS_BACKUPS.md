Configure AWS CLI
```bash
sudo aws configure --profile aws-profile-name
```

Enable and start crond
```bash
sudo systemctl enable cronie
sudo systemctl start cronie
```

Database container runs as root, therefore database files are with root permissions by
default.

Dump following text into file `/root/cron`
```txt
PATH=$PATH:/usr/local/bin:/usr/bin:/bin

00 * * * * /path/to/crater/aws-backup.sh aws-profile-name aws-s3-bucket
```

Enable root cron
```bash
sudo crontab cron
```
