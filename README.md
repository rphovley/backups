# Backups Script
Used to backup development work and old projects for learning in the future

## files_to_ignore.txt
Works like .gitignore. Include directories files you don't want to be synced. Requires a newline at the end (or last record will be skipped).

## home_folders_to_backup.txt
directories within your mac computer's home you want to be synced. Must be relative to the home directory. Requires a newline at the end (or last record will be skipped).

## Run
`bash ./backup.sh`