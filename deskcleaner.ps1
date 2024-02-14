
# Clear the contents of the Recycle Bin
Clear-RecycleBin -Force

# Define the path to the desktop folder
$desktopPath = "C:\Users\user name\Desktop"

# Define paths for files and folders to preserve
$preservePaths = @(
    "C:\Users\user name\Desktop\Recycle Bin"
)

# Get all items in the desktop folder except for the ones to preserve
$itemsToDelete = Get-ChildItem -Path $desktopPath | Where-Object { $_.FullName -notin $preservePaths -and $_.FullName -ne $desktopPath }

# Delete all items in the desktop folder except for the ones to preserve
foreach ($item in $itemsToDelete) {
    Remove-Item -Path $item.FullName -Recurse -Force
}

# Copy files from the specified source path to the desktop
$sourcePath = "C:\Users\user name\Documents\stuff that should be on desktop"
$destinationPath = $desktopPath
Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
