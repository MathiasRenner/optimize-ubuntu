# Optimize Ubuntu

**THIS SOFTWARE IS NOT READY TO USE YET - ALPHA STATUS**

This project optimizes Ubuntu against the following goals:

  - Maximize usability by installing apps that most users require regularly
  - Maximize security and the user's privacy
  - Reduce the probability of occurrence for errors in a long term
 
Thus, this project is based on the values of the [IT Service Bitleaf](https://www.bitleaf.de).

To achieve these goals, this project contains a list of tasks (see below) that are to be applied on an Ubuntu installation. Some of the tasks can be automated. These automated tasks can be applied regularly in order to keep Ubuntu safe and secure in a long term.


## Supported Ubuntu-Versions

  - Ubuntu 16.04 LTS

## Tasks for Optimization

**NB! If the tasks are applied improperly, it can cause problems! Use at your own risk.**


### 1. Preparation

- Identify if any data migration is required
- Identify number of users and request their passwords (passwords will be changed in the last task)
- Identify important software to users
- Identify desired level of security: storage encryption, password manager, VPN, browser fingerprint etc.


### 2. Create backup as RAW diskimage


### 3. Clean hardware with air pressure


### 4. Check drivers and delete superfluous apps


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

- Update installed apps
- Install useful apps (browser, Java etc.) incl. useful browser plugins
- Configure fully automated updates


### 8. Optimize settings (automated)

- Optimize all relevant settings to maximize performance, security and privacy


### 9. Final checks (manuell)

- Optimize screen resolution
- Disable animations with compizconfig-settings-manager
- Optionally apply cleanup software
- Remove superfluous browser plugins
- Optimize energy settings
- Check network settings
- Check printer settings
- Test Adobe Flash Player
- Check user accounts
- Check startup items
- Create links to important apps in app menu and remove superfluous links
- Check notifications, remove language support icon if not needed
- Change passwords of user
- Reboot and check BIOS settings
- Run backup task, check the backup
