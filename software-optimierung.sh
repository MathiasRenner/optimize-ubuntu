#! /usr/bin/env bash

# USE THIS SCRIPT AT YOUR OWN RISK #

# Terminate on any error
set -e


echo -e "\e[0m\n\n#################################################"
echo -e "### Software Säuberung (automatisiert)"
echo -e "#################################################\n\e[32m"


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Cleanup Pakete automatisch aufräumen\n\e[32m"

sudo apt autoclean autoremove


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Alte Kernel in Boot-Partition säubern\n\e[32m"

sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt -y purge


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Online-Ergebnisse in Dash-Suche deaktivieren (u.a. Amazon)\n\e[32m"

# https://askubuntu.com/questions/450398/how-to-remove-amazon
sudo apt remove -y unity-webapps-common


echo -e "\e[0m\n\n#################################################"
echo -e "### Software Update (automatisiert)"
echo -e "#################################################\n\e[32m"


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Update aller installierten Anwendungen\n\e[32m"

sudo apt update && sudo apt upgrade -y


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere/Aktualisiere Java\n\e[32m"

sudo apt install -y default-jre
# test mit java -version


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere/Aktualisiere shutter\n\e[32m"

sudo apt install -y shutter

# add shortcut with "shutter -f" und autom. speichern
# http://shutter-project.org/faq-help/set-shutter-as-the-default-screenshot-tool/#gnom


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere Adobe Flash Player\n\e[32m"

sudo apt install -y flashplugin-installer


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere TeamViewer\n\e[32m"

curl https://download.teamviewer.com/download/teamviewer_i386.deb | awk  -F '[<>]' -F '["]' ' {print $2}' | xargs curl -o /tmp/teamviewer.deb # parse download page and download .deb file
sudo dpkg -i /tmp/teamviewer.deb


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere AnyDesk\n\e[32m"

curl https://anydesk.com/platforms | grep "Debian/Ubuntu/Mint &#40;64 Bit" | awk  -F '[<>]' -F '["]' ' {print $6}' | xargs curl -o /tmp/anydesk.deb # parse download page and download .deb file
sudo dpkg -i /tmp/anydesk.deb # install deb package


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere Clipboard Manager\n\e[32m"

sudo apt install -y copyq


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere/Aktualisiere Firefox\n\e[32m"

sudo apt install -y firefox


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere/Aktualisiere Chromium\n\e[32m"

sudo apt install -y chromium-browser


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere Firefox Add-Ons\n\e[32m"
# Ideas from: https://www.kuketz-blog.de/jondofox-profil-nutzung-nicht-mehr-empfehlenswert/


  # Install wget and curl as tools
  sudo apt install -y wget curl

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


  # Install Privacy Badger
  wget -O addon-506646-latest.xpi https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/addon-506646-latest.xpi
  mv addon-506646-latest.xpi /tmp/jid1-MnnxcxisBPnSXQ@jetpack.xpi
  cd ~/.mozilla/firefox/
  cd "$(ls -la --sort=time | grep default | awk -F ' ' '{print $9}')" # cd into most recently used profile
  cd extensions/
  cp /tmp/jid1-MnnxcxisBPnSXQ@jetpack.xpi .


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere Libs zum Abspielen von DVDs\n\e[32m"

# http://howtoubuntu.org/how-to-play-a-dvd-in-ubuntu
# https://wiki.ubuntuusers.de/DVD-Wiedergabe/
sudo apt install -y libdvdcss libdvdread4 libdvdnav4 libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Installiere/Aktualisiere Preload\n\e[32m"

# Data about its advantage: http://www.hecticgeek.com/2013/05/using-preload-ubuntu-13-04/
# Compare to package 'ureadahaed' that is installed by default https://wiki.ubuntuusers.de/Tuning/
sudo apt install -y preload


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Install FSlint\n\e[32m"

sudo apt install -y fslint


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Install compizconfig-settings-manager\n\e[32m"
sudo apt install compizconfig-settings-manager
# open it via `ccsm`, go to "effects" and disable checkbox



echo -e "\e[0m\n\n#################################################"
echo -e "### Optimierung der Einstellungen (automatisiert)"
echo -e "#################################################\n\e[32m"


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Create keybinding for taking screenshots when pressing PRINT key\n\e[32m"

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


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Automatische Sicherheits- und Standard-Updates auf nicht-interaktiv setzen\n\e[32m"

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
  // (equivalent to apt autoremove)
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


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Harden Firefox\n\e[32m"

  cd ~/.mozilla/firefox/
  cd "$(ls -la --sort=time | grep default | awk -F ' ' '{print $9}')" # cd into most recently used profile
  wget https://raw.githubusercontent.com/pyllyukko/user.js/master/user.js # get hardening config file

  # Enable keyword search in browser URL
  sed -ie 's/user_pref("keyword.enabled",                                    false);/user_pref("keyword.enabled",                                    true);/g' user.js

  # Don't use private browsing mode all the time
  sed -ie 's/user_pref("browser.privatebrowsing.autostart",                  true);/user_pref("browser.privatebrowsing.autostart",                  false);/g' user.js


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Bluethooth deaktivieren\n\e[32m"

sudo systemctl disable bluetooth
sudo modprobe -r btusb
echo "blacklist btusb #disable bluetooth" >> /etc/modprobe.d/blacklist.conf
apt remove bluez* bluetooth


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Don't send usage data to Canonical\n\e[32m"

dconf write /org/gnome/desktop/privacy/send-software-usage-stats false
dconf write /org/gnome/desktop/privacy/report-technical-problem false


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Abschließend Pakete automatisch aufräumen\n\e[32m"

sudo apt autoclean autoremove


echo -e "\e[0m\n\n**************************************************"
echo -e "----> Remove some animations\n\e[32m"
sudo gsettings set org.compiz.animation:/org/compiz/profiles/unity/plugins/animation/ unminimize-effects [\'animation:None\']
sudo gsettings set org.compiz.animation:/org/compiz/profiles/unity/plugins/animation/ minimize-effects [\'animation:None\']


echo -e "\e[0m\n\nFinished.\e[32m"

### Abschließende Prüfung (manuell)
