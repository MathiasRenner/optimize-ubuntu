#!/bin/bash

### Software Säuberung ###

echo 'Pakete automatisch aufräumen'
sudo apt-get autoclean autoremove

echo 'Alte Kernel in Boot-Partition säubern'
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

echo 'Install FSlint'
sudo apt-get install fslint

echo 'In der Dash-Suche, deaktiviere Ergebnisse aus dem Internet'
#http://askubuntu.com/questions/271408/how-to-hide-unity-dash-more-suggestions-not-unity-lens-shopping



### Software Update ###



### Optimierung der Einstellungen ###
