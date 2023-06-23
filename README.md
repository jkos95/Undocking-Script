# Undocking-Script


### Prerequisite ###
Download and install the AutoHotkey scripting tool: https://www.autohotkey.com

It is recommended to place the .ahk or .exe script on your desktop so it can quickly be run when you are ready to undock.

### Description ### 
This script was created for enterprise users that use a laptop docking station with external monitors connected. The Undocking script records window sizes and positions when run, then restores them when you re-dock your PC and click "Restore".

### Instructions ###
When ready to undock your PC, run the script and click "Yes". Read and click "Ok" on the next popup. This will leave an AutoHotkey window minimized on your task bar, and you MUST leave it there while undocked! When you re-dock your PC, wait ~10-15 seconds for your windows to finish moving and resizing, then click the minimized AutoHotkey window and click the "Restore" button. All of your windows will return to the size and position they were at before undocking. You may need to close Microsoft Teams from the icon tray on the bottom right of your screen as the notification box will get stuck after resizing. 

Please feel free to report any bugs or issues with as much detail as possible and I will be happy to review it and correct them.

See the lower half of the main script for commented details on what each line of code is for. Feel free to further customize the script to your liking. This script can be downloaded, modified, and redistributed freely, but only without compensation of any kind. I learned the AHK syntax and created this script over 3 days to solve an annoying issue that has been present in my organization for years.
