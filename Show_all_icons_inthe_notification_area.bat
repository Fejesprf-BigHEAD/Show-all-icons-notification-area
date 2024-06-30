@echo off

REM Set the script path
set "SCRIPT_DIR=%USERPROFILE%\Scripts"
set "SCRIPT_PATH=%SCRIPT_DIR%\update-notifyicons.ps1"

REM Check and create the script directory if it doesn't exist
if not exist "%SCRIPT_DIR%" (
    mkdir "%SCRIPT_DIR%"
)

REM Create or overwrite the PowerShell script file
(
    echo Get-ChildItem "HKCU:\Control Panel\NotifyIconSettings" ^| ForEach-Object { Set-ItemProperty -Path $_.PSPath -Name "IsPromoted" -Type DWORD -Value 1 }
) > "%SCRIPT_PATH%"

REM Create the shortcut if it doesn't exist
set "SHORTCUT_PATH=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\update-notifyicons.lnk"
set "SHORTCUT_TARGET=powershell.exe"
set "SHORTCUT_ARGUMENTS=-ExecutionPolicy Bypass -File \"%SCRIPT_PATH%\""
set "SHORTCUT_DESCRIPTION=Show all icons in the notification area"

if not exist "%SHORTCUT_PATH%" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "& {$Shell = New-Object -ComObject WScript.Shell; $Shortcut = $Shell.CreateShortcut('%SHORTCUT_PATH%'); $Shortcut.TargetPath = '%SHORTCUT_TARGET%'; $Shortcut.Arguments = '%SHORTCUT_ARGUMENTS%'; $Shortcut.Description = '%SHORTCUT_DESCRIPTION%'; $Shortcut.Save()}"
)

exit /b
