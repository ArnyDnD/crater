#!/bin/bash

set -e

CURRENT_DATE=$(date --utc +%FT%H-%M-%S)
SCRIPT_PATH=$(dirname $0)
PROFILE=$1
BUCKET=$2

DB_FILE_NAME=db-${CURRENT_DATE}.tgz
FILES_FILE_NAME=files-${CURRENT_DATE}.tgz

mkdir -p /tmp/crater-backup
tar czvf /tmp/crater-backup/$DB_FILE_NAME -C $SCRIPT_PATH/docker-compose/db/data .
tar czvf /tmp/crater-backup/$FILES_FILE_NAME -C $SCRIPT_PATH/storage/app/public .

aws s3 --profile $PROFILE cp /tmp/crater-backup/$DB_FILE_NAME s3://$BUCKET/crater/$DB_FILE_NAME
aws s3 --profile $PROFILE cp /tmp/crater-backup/$FILES_FILE_NAME s3://$BUCKET/crater/$FILES_FILE_NAME

rm -rf /tmp/crater-backup
