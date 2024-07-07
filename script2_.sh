#!/bin/bash

# creating a file in /var/log thatneeds to be backup
log_file_to_backup="/var/log/newlog.log"

# writing some text in that file that is created
echo "log created at $(date)"

#creating file that will contain the backup of /var/log
backup_dir="/var/log_backup"

# name of the backup file 
backup_file="/var/log/log_backup_$(date).tar.gz"


# below will backup all content of /var/log into $backup_file
tar -czvf $backup_file /var/log
 

# to copy all content in desktop
cp $backup_file $HOME/Desktop






