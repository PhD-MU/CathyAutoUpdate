# CathyAutoUpdate

It helps the Cathy Disk cataloging application to keep the database up to date by working with Task Scheduler at regular intervals in the Windows operating system. Thus, you can find everything you are looking for in Windows.

# Updater.bat
@echo off
CathyCmd.exe -f update_Disks_List.txt
exit

# update_Disks_List.txt (#DEV DriveLetter:\,AnyNameThatRemindsTheDriver)
#DEV D:\,SQLServer
#DEV F:\,FileBackup
#DEV G:\,SQL-BACKUPS
#DEV C:\,-C---
#DEV E:\,DocumentsSSD
