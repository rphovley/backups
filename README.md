# Backups Script

Used to backup development work and old projects for learning in the future

## files_to_ignore.txt

Works like .gitignore. Include directories files you don't want to be synced. Requires a newline at the end (or last record will be skipped).

## home_folders_to_backup.txt

directories within your mac computer's home you want to be synced. Must be relative to the home directory. Requires a newline at the end (or last record will be skipped).

## NOTES on Cloud Storage pricing

<https://cloud.google.com/storage/pricing#network-pricing>
When storing data to `archival` or `coldline` storage, there are several factors that can make it far more expensive. For one, as an example, `archival` storage has an "early delete fee." Any data that is uploaded to `archival` storage will be charged for a full year regardless if it is still there (or has been deleted). This includes data that is rewritten. So, do not overwrite data in archival storage, as that will double the storage costs per time overwritten.  

`archive` storage is also about 10 times more expensive per operation than regular storage. So anytime you write data to storage, it will be expensive, but if you keep it there for a really long time, it is worth it. This is ideal for data you are accessing maybe once a year. Like for some sort of audit or just a safety net.  

## Run

`bash ./backup.sh`  
