# This script lists all files in the specified drives and writes the results to filelist.txt.
# It was created by Murat UZUN to help locate partially distributed DB backups
# due to disk space constraints.

Get-ChildItem -Recurse | 
    Select-Object @{Name="FullPath";Expression={$_.FullName.PadRight(100)}}, 
                  @{Name="Name";Expression={$_.Name.PadRight(70)}}, 
                  @{Name="Size";Expression={$_.Length.ToString().PadRight(30)}} |
    Out-File -Width 200 -FilePath dosyalistesi.txt
