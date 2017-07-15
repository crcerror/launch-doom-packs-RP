#!/bin/bash
# +------------------------------------------------------------------------------------+
# | Launch Doom, Doom2, Plutonia, TNT-Evilution and other WAD files      rel. 07/15/17 |
# | Prerequisites:                                                                     |
# | 1. PrBOOM working on your Pie                                                      |
# | 2. WAD files of doom, doom2, tnt...                                                |
# | 3. Working zip! If not type "sudo apt install zip"                                 |
# |                                                                                    |
# +------------------------------------------------------------------------------------+
# |                                                                                    |
# | Why:                                                                               |
# | I think it's better to have a collection of all doom files in one folder and you   |
# | don't not have to mess around with symlinking and copy of prboom.wad.              |
# | So this will automate save game working in the same destination folder via zipping |
# |                                                                                    |
# | How to:                                                                            |
# | In your base folder ~/RetroPie/roms/doom/ copy all your WAD files you want to run  |
# |                                                                                    |
# | Check settings in Synopsis!                                                        |
# | Check if path locations is correct                                                 |
# | Check if wadfile settings load correct edition!                                    |
# | Save variable is autogenerated by wadfilename, you can change if you don't like    |
# |                                                                                    |
# +------------------------------------------------------------------------------------+
# |                                                                                    |
# |                            !!old but not outdated!!                                |
# |                                                                                    |
# +------------------------------------------------------------------------------------+
# | v1.0:  initial release based on https://github.com/crcerror/launch-quake-packs-RP  |
# +------------------------------------------------------------------------------------+


# ------------------------------- Settings area ----------------------------------------

# Synopsis - Douple Check pathes and settings
#
# path variable should not end with slash!
# doom1.wad     loads all versions of DOOM and Final DOOM
# doom2.wad     loads all versions of DOOM II
# tnt.wad       loads extra TNT-Evilution  
# plutonia.wad  loads Mission Pack 2
#------------

path="/home/pi/RetroPie/roms/ports/doom"
wadfile="doom1.wad"

# --------------------------------------------------------------------------------------

#
# Is file definated really available?
#------------
if ! [ -e "${path}/$wadfile" ]; then
echo "Error! ${path}/$wadfile not found!"
echo "Please resolve problem in script or install file!"
sleep 10
exit
fi

unzip -qq -o "${path}/savegames_${wadfile%.*}.zip" -d "$path"
"/opt/retropie/supplementary/runcommand/runcommand.sh" 0 _PORT_ "doom" "${path}/$wadfile"
cd "$path" && zip -mj "savegames_${wadfile%.*}.zip" prbmsav?.dsg