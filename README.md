# Show-all-icons-notification-area
Show all icons in the notification area for Windows 11
This Batchfile invites Powershell and executes a code that will create a folder inside of your user profile called 'Scripts' and tthen also creates a .ps1 script.
It also creates a shortcut to this script in your user profile's 'startup' folder.
The aforementioned .ps1 script will always run whenever you reboot your system.

# How-it-works
The Batchfile checks for the 'Scripts' folder and if it doesn't exists creates it.
Then it also checks for the .ps1 file and creates it if it doesn't exist.
Creates the shortcut in the 'startup' folder in your profile and pairs the shortcut to powershell, if it doesn't exist then creates it
The script makes itself exit.
On every startup the shortcut will execute the script.

# Uninstall
Get rid of the script, it will be located like this: "c:\Users\'YourProfile'\Scripts\update-notifyicons.ps1"
Also get rid of the shortcut which is located here: "c:\Users\'YourProfile'\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\update-notifyicons.lnk"
