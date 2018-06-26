## Modified from code found [here](https://github.com/Blasman/mIRC-Twitch-Scripts)

# Script Documentation  

**[![Click here to visit the WIKI for detailed information and documentation for most of the scripts on this GitHub](http://i.imgur.com/URVntZX.png)](https://github.com/Blasman/mIRC-Twitch-Scripts/wiki/Script-Documentation "Script Documentation")**  

# Rights and Distributing  

I created this GitHub for the purpose of sharing these scripts for free with anyone who wants to use them. Please feel free to do with any of the scripts as you please. Although not required, it would also be nice if could you let me know if you have found any of the scripts to be of use to you by either sending me a Twitch whisper, following me on Twitch, and/or checking out [my Twitch channel](https://twitch.tv/Blasman13) sometime. :)  

# Installation  

### If You Do Not Have a mIRC Twitch Bot, Set One Up  

**Here is a video tutorial on how to set everything up as quickly and painlessly as possible:**  

[![Instructional Video](http://i.imgur.com/ZJqfWom.png)](https://www.youtube.com/watch?v=8YefioQhUZA "Instructional Video")

1. Download and install mIRC. UNCHECK EVERYTHING except "Scripts" and "Help Files" on the "Choose Components" section of the install, as you don't need most of it. http://www.mirc.com/get.html  

2. Get **YOUR BOT'S** Twitch account (**NOT** the Twitch name that you stream with) up and running with mIRC, and set up your main Twitch account's channel as an auto-join channel as well. See http://help.twitch.tv/customer/portal/articles/1302780-twitch-irc#MIRC You may ignore the section titled "Join/Parts - mIRC," as one of the required scripts below will perform the same function automatically.  Keep in mind that for Step 5 of the tutorial, you will need to be logged into Twitch using your BOT'S Twitch account when retreiving the oauth token to use as your password.  

## Once You Do Have a mIRC Twitch Bot  

### Download Required Scripts  

To use any of the games scripts on this GitHub, you will need to download the following scripts to your MAIN (root) mIRC directory.  If you did not change the default install directory of mIRC, you can find the directory by typing **%APPDATA%/mIRC** into your Windows Folder Titlebar.
* [JSONForMirc.mrc](https://github.com/SReject/JSON-For-Mirc/releases/download/v1.0.3006-rc2/JSONFormIRC.mrc): right click this link and "save link as..." to your mIRC directory.
* [mTwitch.Core.mrc](https://raw.githubusercontent.com/SReject/mTwitch/master/mTwitch.Core.mrc): right click this link and "save link as..." to your mIRC directory.
* [mTwitch.DisplayName.mrc](https://raw.githubusercontent.com/SReject/mTwitch/master/mTwitch.DisplayName.mrc): right click this link and "save link as..." to your mIRC directory.
* [mIRC SQLite](http://reko.tiira.net/msqlite/): Extract the .zip file from this webpage to your mIRC directory.
* [BlasBot.mrc](http://raw.githubusercontent.com/Blasman/mIRC-Twitch-Scripts/master/BlasBot.mrc) : right click this link and "save link as..." to your mIRC directory.

### Install Required Scripts  

In mIRC, type in the following commands anywhere. Accept and run any initialization command prompts. When loading the last script (BlasBot.mrc), you will have to enter some information into input boxes that will pop up. Ignore the "unknown command" error messages that will pop up in mIRC:  

`/load -rs JSONForMirc.mrc`  
`/load -rs mTwitch.Core.mrc`  
`/load -rs mTwitch.DisplayName.mrc`  
`/load -rs msqlite.mrc`  
`/load -rs BlasBot.mrc`  

**You will have to exit and re-open mIRC after installing these scripts.**  

### Download and Install Desired Scripts  

For detailed information about each script, please visit the [WIKI](https://github.com/Blasman/mIRC-Twitch-Scripts/wiki/Script-Documentation) page.  You can also right click the links on the [WIKI](https://github.com/Blasman/mIRC-Twitch-Scripts/wiki/Script-Documentation) (NOT THE MAIN GITHUB PAGE) and select "save link as..." and then use `/load -rs scriptname.mrc` just like the previous install instructions.  Again, do NOT "save link as..." using the links on the main GitHub page, as they are links to the GitHub html pages! Use the  [WIKI](https://github.com/Blasman/mIRC-Twitch-Scripts/wiki/Script-Documentation)!  

You may install as many of the games scripts as desired, as to prevent spam, most of the games are designed so that if one of them is currently being played by a user in the channel, then another game cannot be started by a user until that current game is completed.  

## Updating Scripts  

There are multiple ways to "update" your scripts on this GitHub. IMO, the ideal way seems to take a little more effort but it is worth the time based on how some of the scripts are written and their various dependencies.  

**Step 1**: Determine what scripts actually need to be updated. "All required scripts" means all of the scripts (except for msqlite.mrc) in the "Install Required Scripts" section of this GitHub above. "Optional scripts" are any of the scripts found on the [WIKI](https://github.com/Blasman/mIRC-Twitch-Scripts/wiki/Script-Documentation).  

**Step 2**: While mIRC is loaded, disconnect from the Twitch server (little lightning bolt in the top left).  

**Step 3**: Proceed to UNLOAD all of the scripts that you wish to update by typing in mIRC `/unload -rs scriptname.mrc` Note: if desired, you can see all scripts that you have loaded in mIRC by pressing ALT-R and clicking the "View" menu at the top, you can also unload/load them this way as well if you are careful and know what you're doing.  

**Step 4**: Download and overwrite (if necessary) all of your old .mrc files with all the new ones that you wish to update. Remember to download optional scripts from the [WIKI](https://github.com/Blasman/mIRC-Twitch-Scripts/wiki/Script-Documentation) and the required scripts from the "Install Required Scripts" section above. Do NOT download from the very top of the GitHub as those are just HTML files.  

**Step 5**: Proceed to `/load -rs scriptname.mrc` for all the scripts that you are upgrading. If you are updating any of the required scripts, be sure to load them in the order that they are listed in the "Install Required Scripts" section of the GitHub above. (you may need to actually be connected to the server if loading BlasBot.mrc so it can get your bot's name)  

**Step 6**: Close mIRC and restart it. If you did everything properly, then you should not have any issues.  

## Troubleshooting / FAQ  

**Issue:** User names are either blank and/or being returned as "$true" and/or other weird stuff has recently started to happen since updating scripts.  
**Answer:** The creator of the mTwitch and JSON scripts (SReject) recently updated those scripts. They now require that you are running the most recent version of mIRC. Many of the scripts that I have writen have had to be edited to work with those new versions. Therefor, all required scripts (except SQLite) need to be updated as well most other scripts on the GitHub. Update all the scripts from the "Install Required Scripts" section of this GitHub (except SQLite), as well as any other scripts that you are using from this GitHub. Again, be sure that you are also running the most recent version of mIRC. This should solve any issues.  

**Question:** How do I get rid of (unload) a script, I don't want it on my mIRC anymore!?  
**Answer:** Simply do the same as if you were loading the script from the instructions above, just replace **/load** with **/unload**.  

**Question:** How do I "update" a script from this GitHub?  
**Answer:** They are multiple ways. I recommend unloading the script that you wish to update (see question above). Then download the updated script and overwrite the old one. Then /load in mIRC as you originally did when you first installed the script.  

**Issue:** The scripts are not responding to my commands or do not appear to work at all.  
**Answer:** Please be sure that you are right clicking the scripts on the [WIKI](https://github.com/Blasman/mIRC-Twitch-Scripts/wiki/Script-Documentation) and choosing "save as..." rather than using the main GitHub page, as the links on the main page are links to html pages. If you know what you're doing, you can also just download the zip file of all the scripts using the link on the GitHub page and load those files into mIRC. **Always be sure that you are running the LATEST versions of the scripts on the GitHub as well, especially BlasBot.mrc.**  

**Issue:** The scripts appear to be running very slow and/or using a lot of CPU.  
**Answer:** Please make sure that you are using the latest mIRC version 7.47 (or higher). Earlier versions contained an old memory leak that has been fixed in the latest version.  

**Issue:** Whispers sent from your bot are not being received by users.  
**Answer:** If this is happening after your bot has been sending out a lot of whispers successfully and it just happens to temporarily stop working, then it is likely Twitch's anti-spam measures that are preventing the whispers from being sent. See this post on instructions on how to whitelist your bot. [Are your whispers not going through for your bot?](https://discuss.dev.twitch.tv/t/are-your-whispers-not-going-through-for-your-bot/5183) 
