#!/bin/bash

# THIS SCRIPT HAS NOT BEEN TESTED - USE WITH CAUTION #

### Software Säuberung ###

echo 'Pakete automatisch aufräumen'
sudo apt-get autoclean autoremove

echo 'Alte Kernel in Boot-Partition säubern'
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

echo 'Install FSlint'
sudo apt-get install -y fslint

echo 'In der Dash-Suche, deaktiviere Ergebnisse aus dem Internet'
# Delete all webapps: https://askubuntu.com/questions/450398/how-to-remove-amazon
sudo apt-get remove -y unity-webapps-common



### Software Update ###

echo 'Update aller installierten Anwendungen'
sudo apt-get update && sudo apt-get upgrade -y 

echo 'Installiere/Aktualisiere Java'
sudo apt-get install -y default-jre
# test mit java -version

echo 'Installiere/Aktualisiere shutter'
sudo apt-get install -y shutter

# add shortcut with "shutter -f" und autom. speichern

echo 'Installiere/Aktualisiere Adobe Flash Player'
sudo apt-get install -y flashplugin-installer

echo 'Installiere/Aktualisiere TeamViewer'
sudo apt-get install -y teamViewer

echo 'Installiere/Aktualisiere Firefox'
sudo apt-get install -y firefox

echo 'Installiere/Aktualisiere Chromium'
sudo apt-get install -y chromium

echo 'Installiere Firefox Add-Ons'
#http://askubuntu.com/questions/73474/how-to-install-firefox-addon-from-command-line-in-scripts


# Required to play DVs
# http://howtoubuntu.org/how-to-play-a-dvd-in-ubuntu
# https://wiki.ubuntuusers.de/DVD-Wiedergabe/
sudo apt-get install -y libdvdcss libdvdread4 libdvdnav4
sudo dpkg-reconfigure libdvd-pkg 
### Optimierung der Einstellungen ###
