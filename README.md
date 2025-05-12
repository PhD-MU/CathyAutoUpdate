# CathyAutoUpdate

It helps the Cathy Disk cataloging application to keep the database up to date by working with Task Scheduler at regular intervals in the Windows operating system. Thus, you can find everything you are looking for in Windows.

## Updater.bat
```
@echo off
CathyCmd.exe -f update_Disks_List.txt
exit
```

## update_Disks_List.txt (#DEV DriveLetter:\\,AnyNameThatRemindsTheDriver)
```
#DEV D:\,SQLServer
#DEV F:\,FileBackup
#DEV G:\,SQL-BACKUPS
#DEV C:\,-C---
#DEV E:\,DocumentsSSD
```

# BONUS

I prepared two Windows PowerShell Scripts to find what I was looking for in the Windows operating system. After all, searching for the location of a file in a text file will be much, much faster than searching on disk. The outputs are written to the filelist.txt file created in the same location as the executed script file. You can edit the script files with any text editor and change the output file and location.

## Catalog Single or Multi Drives into a single text file :

```
indexDisks.ps1
```

## Catalog Single Folder With its Sub-Folders into a single text file :

```
indexFolders.ps1
```

