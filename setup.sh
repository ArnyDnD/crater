#!/bin/bash

set -e

DNS="crater.local"

echo "Setting up $DNS dns..."
cat /etc/hosts | grep "127.0.0.1  $DNS" >> /dev/null && echo "$DNS already set, skipping" \
 || sudo su -c 'echo "127.0.0.1  $DNS" >> /etc/hosts' 

echo ""

echo "Setting app directories permissions..."
chmod 775 storage/framework storage/logs bootstrap/cache

echo ""

echo "Initializing application..."
docker-compose up -d
./docker-compose/setup.sh

echo "Done"
