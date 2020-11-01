#!/bin/bash

# file pull.sh
# brief Used to pull logs from a remote server using rsync
# author Julien Marcuse
# Lab 9. Scheduled Tasks
# date 10/31/2020

# constants
HOST="23.254.229.147"
LOGINUSER="pull-log"
LOCALDIR="apache-logs/"
KEY="/home/redempt/tmp/key/pull-log"

# Change to working directory
cd /home/redempt/tmp/cron-lab

# Rsync
rsync -e "ssh -i ${KEY}" -av ${LOGINUSER}@${HOST}:/ ${LOCALDIR}

# Write an entry to syslog
logger -t $0 "apache logs pulled from ${HOST}"
