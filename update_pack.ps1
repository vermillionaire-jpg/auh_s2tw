# Verify Location & move to dir
Write-Output "Script Root:"
Write-Output $PSScriptRoot

# move to script dir
Set-Location $PSScriptRoot

# Settings file path
$SettingsFile = Join-Path $PSScriptRoot "directories.txt"

# Check if settings file exists
if (!(Test-Path $SettingsFile)) {
    Write-Error "settings.txt not found!"
    exit
}

# Read settings
$Settings = Get-Content $SettingsFile

if ($Settings.Count -lt 2) {
    Write-Error "settings.txt must contain at least 2 lines."
    exit
}

$PackDir = $Settings[0]
$GameDir = $Settings[1]

# Directories
# $PackDir = ..\auh_s2tw.pack
# $GameDir = 'C:\Program Files (x86)\Steam\steamapps\common\Total War SHOGUN 2\data\auh_s2tw.pack'
# Copy to Dir
Copy-Item -Path $PackDir -Destination $GameDir -Force