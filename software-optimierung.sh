#! /usr/bin/env bash

# USE THIS SCRIPT AT YOUR OWN RISK #

# Terminate on any error
set -e


#################################################
### Software Säuberung (automatisiert)
#################################################

echo "----> Cleanup Pakete automatisch aufräumen"
sudo apt-get autoclean autoremove

printf "\n----> Alte Kernel in Boot-Partition säubern"
sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

printf "\n----> Install FSlint"
sudo apt-get install -y fslint

printf "\n----> Online-Ergebnisse in Dash-Suche deaktivieren (u.a. Amazon)"
# https://askubuntu.com/questions/450398/how-to-remove-amazon
sudo apt-get remove -y unity-webapps-common



#################################################
### Software Update (automatisiert)
#################################################

printf "\n----> Update aller installierten Anwendungen"
sudo apt-get update && sudo apt-get upgrade -y

printf "\n----> Installiere/Aktualisiere Java"
sudo apt-get install -y default-jre
# test mit java -version

printf "\n----> Installiere/Aktualisiere shutter"
sudo apt-get install -y shutter

# add shortcut with "shutter -f" und autom. speichern
# http://shutter-project.org/faq-help/set-shutter-as-the-default-screenshot-tool/#gnom

printf "\n----> Installiere Adobe Flash Player"
sudo apt-get install -y flashplugin-installer

printf "\n----> Installiere TeamViewer"
sudo apt-get install -y teamViewer

printf "\n----> Installiere Clipboard Manager"
sudo apt-get install -y copyq


printf "\n----> Installiere/Aktualisiere Firefox"
sudo apt-get install -y firefox

printf "\n----> Installiere/Aktualisiere Chromium"
sudo apt-get install -y chromium-browser

printf "\n----> Installiere Firefox Add-Ons"
# uBlock, PrivacyBadger
#http://askubuntu.com/questions/73474/how-to-install-firefox-addon-from-command-line-in-scripts

#ggf. Plugins entfernen

# Required to play DVs
# http://howtoubuntu.org/how-to-play-a-dvd-in-ubuntu
# https://wiki.ubuntuusers.de/DVD-Wiedergabe/
sudo apt-get install -y libdvdcss libdvdread4 libdvdnav4 libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg



#################################################
### Optimierung der Einstellungen (automatisiert)
#################################################

# firefox: Beim start leere Seite anzeigen, Startpage oder Ecosia als Suchmaschine anpassen und als Startseite setzen, Immer den privaten Modus verwenden, Cookies von Drittanbietern nie akzeptieren, keinerelei Passwörter speichern, (Erweitert → Datenübermittlung) Keine Daten senden

# Automatische Sicherheits- und Standard-Updates auf nicht-interaktiv setzen

# Bluethooth deaktivieren (/etc/bluetooth/main.conf, RememberPowered und InitiallyPowered →  false)

#In Systemeinstellungen, Senden von Berichten an Canonical unterbinden (setze Parameter auf "0" in /etc/default/apport)


printf "\n----> Abschließend Pakete automatisch aufräumen"
sudo apt-get autoclean autoremove

#remove effects
sudo apt-get install compizconfig-settings-manager
# open it via `ccsm`, go to "effects" disable checkbox

printf "\n----> Finished.\n"

### Abschließende Prüfung (manuell)
