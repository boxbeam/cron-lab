#!/bin/bash

# file push.sh
# brief Used to push to apache from a remote server using rsync
# author Julien Marcuse
# Lab 9. Scheduled Tasks
# date 10/31/2020

#Constants
HOST="23.254.229.147"
LOGINUSER="push-web"
KEY="/home/redempt/tmp/key/push-web"
LOCALDIR="/home/redempt/tmp/cron-lab/web-content/"

#Change to working directory
cd /home/redempt/tmp/cron-lab

#Rsync
rsync -e "ssh -i ${KEY}" -vraO --no-perms --chmod=660 --chown=${LOGINUSER}:www-data ${LOCALDIR} ${LOGINUSER}@${HOST}:/

#Write a log entry
logger -t $0 "web content pushed to ${HOST}"
sendmail julien.marcuse@mymail.champlain.edu<<EMAIL
Subject: Web content pushed
web content pushed to ${HOST}
EMAIL
