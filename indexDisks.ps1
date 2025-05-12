# This script lists all files in the specified drives and writes the results to filelist.txt.
# It was created by Murat UZUN to help locate partially distributed DB backups
# due to disk space constraints.

# Define the list of drive letters separated by commas
$driveLetters = "U", "W", "Y", "X"  # You can add drive letters here, separated by commas (e.g., C,D,E)

# Specify the name of the output file (saved in the script's working directory)
$outputFileName = "filelist.txt"

# Initialize the file (clears previous content if any)
New-Item -Path $outputFileName -Force -ItemType File | Out-Null

# Process each drive
foreach ($driveLetter in $driveLetters) {
    
    Write-Host "Scanning Drive: $driveLetter"

    # Get volume info
    $volume = Get-Volume | Where-Object { $_.DriveLetter -eq $driveLetter }

    # Get volume label
    $volumeName = $volume.FriendlyName -replace '\s', '_'

    # Write drive header
    "Drive: $driveLetter - $volumeName" | Out-File -FilePath $outputFileName -Append
    "--------------------------------------------------" | Out-File -FilePath $outputFileName -Append

    # List all files on the drive and write to output file
    Get-ChildItem -Path "${driveLetter}:\" -Recurse |
        Select-Object @{Name="FullPath";Expression={$_.FullName.PadRight(100)}}, 
                      @{Name="Name";Expression={$_.Name.PadRight(70)}}, 
                      @{Name="Size";Expression={$_.Length.ToString().PadRight(30)}} |
        Out-File -Width 200 -FilePath $outputFileName -Append

    # Add an empty line between drives
    "" | Out-File -FilePath $outputFileName -Append

    Write-Host "Finished scanning drive $driveLetter."
}

# Notify user that file was created
Write-Host "Output file created: $outputFileName"
