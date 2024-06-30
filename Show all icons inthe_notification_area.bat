@echo off

REM Set the script path
set "SCRIPT_DIR=%USERPROFILE%\Scripts"
if not exist "%SCRIPT_DIR%" mkdir "%SCRIPT_DIR%"
set "SCRIPT_PATH=%SCRIPT_DIR%\update-notifyicons.ps1"

REM Create the script file
powershell -executionpolicy bypass -Command "Set-Content -Path '%SCRIPT_PATH%' -Value 'Get-ChildItem \"HKCU:\Control Panel\NotifyIconSettings\" | ForEach-Object { Set-ItemProperty -Path $_.PSPath -Name \"IsPromoted\" -Type DWORD -Value 1 }' -Force"

REM Create the shortcut if it doesn't exist
set "SHORTCUT_PATH=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\update-notifyicons.lnk"
set "SHORTCUT_TARGET=powershell.exe"
set "SHORTCUT_ARGUMENTS=-ExecutionPolicy Bypass -File \"%SCRIPT_PATH%\""
set "SHORTCUT_DESCRIPTION=Show all icons in the notification area"

if not exist "%SHORTCUT_PATH%" (
    powershell -executionpolicy bypass -Command "& {$Shell = New-Object -ComObject WScript.Shell; $Shortcut = $Shell.CreateShortcut('%SHORTCUT_PATH%'); $Shortcut.TargetPath = '%SHORTCUT_TARGET%'; $Shortcut.Arguments = '%SHORTCUT_ARGUMENTS%'; $Shortcut.Description = '%SHORTCUT_DESCRIPTION%'; $Shortcut.Save()}"
)

exit :: Script by BigHEAD
