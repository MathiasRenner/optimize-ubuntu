# Optimize Ubuntu (alpha)

This project optimizes Ubuntu against the following goals:

  - Maximize usability by installing apps that most users usually use every day
  - Maximize security and the user's privacy
  - Recuce the probability of occurrence for errors in a long term
 
Thus, this project is based on the values of the [IT Service Bitleaf](https://www.bitleaf.de).

To achieve these goals, this project contains a list of tasks (see below) that should be applied in the correct order. Some of the tasks can be automated. These tasks are to be applied regularly in order to keep Ubuntu safe and secure.


## Supported Ubuntu-Versions

  - Ubuntu 16.04 LTS

## Tasks for Optimization

**NB! If the tasks are not applied improperly, it can cause problems! Use at your own risk.**


### 1. Preparation

- Data migration required?
- Identify number of users and request their passwords (to be changed later)
- Identify important software for user
- Desired level of security: storage encryption, password manager, VPN, browser fingerprint etc.


### 2. Create backup as RAW diskimage


### 3. Clean hardware with air pressure


### 4. Check drivers and delete unnecessary apps


### 5. Check functions

- Network: Wifi & Ethernet
- USB
- Card-Reader
- Webcam
- Touchpad
- CD-Drive
- Function keys

</br>

> #### *The following 3 steps can be automated with this command:*
>  ```
>  https://raw.githubusercontent.com/bitleaf/optimize-ubuntu/master/automatic-tasks.sh | bash
>  ```

### 6. Software cleanup (automated)
- Remove superfluous apps or plugins
- Install cleanup software


### 7. Software update (automated)

- Update aller installierten Anwendungen
- Installiere/Aktualisiere sinnvolle Anwendungen (Browser, Java etc.) inkl. sinnvolle Browser Plugins,
- Automatische Sicherheits- und Standard-Updates auf nicht-interaktiv setzen


### 8. Optimize settings (automated)

- Optimize all relevant settings to maximize performance, security and privacy


### 9. Final checks (manuell)

- Disable animations with compizconfig-settings-manager
- (Optional) Apply cleanup software
- Remove superfluous browser plugins
- Optimize screen resolution
- Optimize energy settings
- Check network settings
- Check printer settings
- Test Adobe Flash Player
- Check user accounts
- Check startup items
- Create links to important apps in app menu and remove superfluous links
- Check notifications, remove language support icon if not needed
- Reboot and check BIOS settings
- Run backup task, and check the backup
