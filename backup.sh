#!/bin/bash

current_time=$(date "+%Y.%m.%d")
echo "Current Time : $current_time"
 
#create excludes from file
while IFS= read -r line; do
  excludes_arg+=(--exclude="$line")
done < files_to_ignore.txt

backup_folder=backup_reduced_$current_time

mkdir $backup_folder
# #create aggregate folder
while IFS= read -r line; do
  echo "Backup of ~/${line}"
  rsync -av --progress "${excludes_arg[@]}" "/Users/$USER/$line" $backup_folder
done < home_folders_to_backup.txt

printf "\n Files Transferred: \n\n"

du -a $backup_folder | cut -d/ -f2 | sort | uniq -c | sort -nr
printf "\n Folder Sizes \n\n"
du -sh $backup_folder/* | sort -hr
printf "\n\n"

while true; do
    read -p "Does this information look correct? Would you like to proceed with the backup?(y/n)" yn
    case $yn in
        [Yy]* ) gsutil -m cp -r $backup_folder "gs://phovley-backups/backups/${backup_folder}"; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done