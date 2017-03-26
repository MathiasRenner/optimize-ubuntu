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
curl https://download.teamviewer.com/download/teamviewer_i386.deb | awk  -F '[<>]' -F '["]' ' {print $2}' | xargs curl -o /tmp/teamviewer.deb # parse download page and download .deb file
sudo dpkg -i /tmp/teamviewer.deb

printf "\n----> Installiere AnyDesk"
curl https://anydesk.com/platforms | grep "Debian/Ubuntu/Mint &#40;64 Bit" | awk  -F '[<>]' -F '["]' ' {print $6}' | xargs curl -o /tmp/anydesk.deb # parse download page and download .deb file
sudo dpkg -i /tmp/anydesk.deb # install deb package

printf "\n----> Installiere Clipboard Manager"
sudo apt-get install -y copyq

printf "\n----> Installiere/Aktualisiere Firefox"
sudo apt-get install -y firefox

printf "\n----> Installiere/Aktualisiere Chromium"
sudo apt-get install -y chromium-browser

printf "\n----> Installiere Firefox Add-Ons"
  # Install uBlock
wget https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon-607454-latest.xpi
mv addon-607454-latest.xpi /tmp/uBlock0@raymondhill.net.xpi
cd ~/.mozilla/firefox/
cd "$(ls -la --sort=time | grep default | awk -F ' ' '{print $9}')" # cd into most recently used profile
cd extensions/
cp /tmp/uBlock0@raymondhill.net.xpi .


  # Install https-everywhere
wget https://addons.mozilla.org/firefox/downloads/latest/https-everywhere/addon-229918-latest.xpi
mv addon-229918-latest.xpi /tmp/https-everywhere@eff.org.xpi
cd ~/.mozilla/firefox/
cd "$(ls -la --sort=time | grep default | awk -F ' ' '{print $9}')" # cd into most recently used profile
cd extensions/
cp /tmp/https-everywhere@eff.org.xpi .


  # Install CanvasBlocker
wget https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/addon-534930-latest.xpi
mv addon-534930-latest.xpi /tmp/CanvasBlocker@kkapsner.de.xpi
cd ~/.mozilla/firefox/
cd "$(ls -la --sort=time | grep default | awk -F ' ' '{print $9}')" # cd into most recently used profile
cd extensions/
cp /tmp/CanvasBlocker@kkapsner.de.xpi .


  # Install cookie-controller
wget https://addons.mozilla.org/firefox/downloads/latest/cookie-controller/addon-334572-latest.xpi
mv addon-334572-latest.xpi /tmp/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi
cd ~/.mozilla/firefox/
cd "$(ls -la --sort=time | grep default | awk -F ' ' '{print $9}')" # cd into most recently used profile
cd extensions/
cp /tmp/{ac2cfa60-bc96-11e0-962b-0800200c9a66}.xpi .


  # Install privacy-settings
wget https://addons.mozilla.org/firefox/downloads/latest/privacy-settings/addon-627512-latest.xpi
mv addon-627512-latest.xpi /tmp/jid1-CKHySAadH4nL6Q@jetpack.xpi
cd ~/.mozilla/firefox/
cd "$(ls -la --sort=time | grep default | awk -F ' ' '{print $9}')" # cd into most recently used profile
cd extensions/
cp /tmp/jid1-CKHySAadH4nL6Q@jetpack.xpi .


# Required to play DVs
# http://howtoubuntu.org/how-to-play-a-dvd-in-ubuntu
# https://wiki.ubuntuusers.de/DVD-Wiedergabe/
sudo apt install -y libdvdcss libdvdread4 libdvdnav4 libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg

printf "\n----> Installiere/Aktualisiere Preload"
# Data about its advantage: http://www.hecticgeek.com/2013/05/using-preload-ubuntu-13-04/
# Compare to package 'ureadahaed' that is installed by default https://wiki.ubuntuusers.de/Tuning/
sudo apt-get install -y preload

printf "\n----> Install FSlint"
sudo apt-get install -y fslint


#################################################
### Optimierung der Einstellungen (automatisiert)
#################################################

# Create keybinding for taking screenshots when pressing PRINT key
  # Create folder to save screenshots to
mkdir $HOME/Screenshots

  # Write screenshot command to file
cat << EOM >> /usr/local/bin/take-screenshot
"gnome-screenshot -f $HOME/Screenshots/Screenshot-$(date +%G-%m-%d--%H-%M-%S).png"
EOM

  # Make file executable
chmod a+x /usr/local/bin/take-screenshot

  # Install xbindkeys
apt install -y xbindkeys

  # Create keybinding of print-key to the take-screenshot "binary"
cat << EOM >> /home/mac/.xbindkeysrc
"bash /usr/local/bin/take-screenshot"
Print
EOM


# Automatische Sicherheits- und Standard-Updates auf nicht-interaktiv setzen
sudo apt install unattended-upgrades

  # Edit config file 1
cat << EOM >> /etc/apt/apt.conf.d/20auto-upgrades
APT::Periodic::Update-Package-Lists "7";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "1";
APT::Periodic::Unattended-Upgrade "1";
EOM

  # Edit config file 2
cat << EOM >> /etc/apt/apt.conf.d/50unattended-upgrades
// Automatically upgrade packages from these (origin:archive) pairs
Unattended-Upgrade::Allowed-Origins {
	"${distro_id}:${distro_codename}";
	"${distro_id}:${distro_codename}-security";
	"${distro_id}:${distro_codename}-updates";
//	"${distro_id}:${distro_codename}-proposed";
//	"${distro_id}:${distro_codename}-backports";
};

// List of packages to not update (regexp are supported)
Unattended-Upgrade::Package-Blacklist {
//	"vim";
//	"libc6";
//	"libc6-dev";
//	"libc6-i686";
};

// This option allows you to control if on a unclean dpkg exit
// unattended-upgrades will automatically run
//   dpkg --force-confold --configure -a
// The default is true, to ensure updates keep getting installed
Unattended-Upgrade::AutoFixInterruptedDpkg "true";

// Split the upgrade into the smallest possible chunks so that
// they can be interrupted with SIGUSR1. This makes the upgrade
// a bit slower but it has the benefit that shutdown while a upgrade
// is running is possible (with a small delay)
Unattended-Upgrade::MinimalSteps "true";

// Install all unattended-upgrades when the machine is shuting down
// instead of doing it in the background while the machine is running
// This will (obviously) make shutdown slower
Unattended-Upgrade::InstallOnShutdown "false";

// Send email to this address for problems or packages upgrades
// If empty or unset then no email is sent, make sure that you
// have a working mail setup on your system. A package that provides
// 'mailx' must be installed. E.g. "user@example.com"
//Unattended-Upgrade::Mail "root";

// Set this value to "true" to get emails only on errors. Default
// is to always send a mail if Unattended-Upgrade::Mail is set
//Unattended-Upgrade::MailOnlyOnError "true";

// Do automatic removal of new unused dependencies after the upgrade
// (equivalent to apt-get autoremove)
Unattended-Upgrade::Remove-Unused-Dependencies "true";

// Automatically reboot *WITHOUT CONFIRMATION*
//  if the file /var/run/reboot-required is found after the upgrade
//Unattended-Upgrade::Automatic-Reboot "false";

// If automatic reboot is enabled and needed, reboot at the specific
// time instead of immediately
//  Default: "now"
//Unattended-Upgrade::Automatic-Reboot-Time "02:00";

// Use apt bandwidth limit feature, this example limits the download
// speed to 1Mb/sec
Acquire::http::Dl-Limit "1000";
EOM


  # restart service
/etc/init.d/unattended-upgrades restart


# firefox: Beim start leere Seite anzeigen, Startpage oder Ecosia als Suchmaschine anpassen und als Startseite setzen, Immer den privaten Modus verwenden, Cookies von Drittanbietern nie akzeptieren, keinerelei Passwörter speichern, (Erweitert → Datenübermittlung) Keine Daten senden



# Bluethooth deaktivieren (/etc/bluetooth/main.conf, RememberPowered und InitiallyPowered →  false)

#In Systemeinstellungen, Senden von Berichten an Canonical unterbinden (setze Parameter auf "0" in /etc/default/apport)


printf "\n----> Abschließend Pakete automatisch aufräumen"
sudo apt-get autoclean autoremove

#remove effects
sudo apt-get install compizconfig-settings-manager
# open it via `ccsm`, go to "effects" disable checkbox

printf "\n----> Finished.\n"

### Abschließende Prüfung (manuell)
