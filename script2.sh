#!/bin/bash
#write a bash script to  add file in /var/log and backup of that folder by creating a archive at 3:30 pm monday june 2024. also script copies the archive to desktop folder


# created a file in /var/log which has to be backup
Log_file="/var/log/newlog.log"
echo "log file created on $(date)" > $Log_file

#made the backup directory which will backup all content from /var/log
backup_dir="/var/log_backup"

#ensures that backup_dir exists or not
mkdir -p $backup_dir

# back_up filepresent in backup_dir  will contain the backup of /var/log 
backup_file="/var/log_backup/log_backup_$(date).tar.gz"

# doing archive using tar
tar -czvf $backup_file /var/log
echo "backup file created at $backup_file"

#coping the backup file to desktop
cp $backup_file $HOME/Desktop

#in terminal -> crontab -e ->
#30 15 * * 4 /home/iteradmin/Desktop/MRINAL_DEVOPS/script2.sh


