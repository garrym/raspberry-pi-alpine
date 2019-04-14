# Instructions for installing Alpine Linux on a Raspberry Pi

## Disclaimer
Please note: This is currently work in progress.

## Introduction

Alpine Linux is a fast, lightweight Linux distribution that's ideal for the Raspberry Pi. It's designed to be run on minimal hardware so it comes with a barebones setup and limited number of packages, making it ideal for those who want to know exactly what is running on their Raspberry Pi to have the minimum disk space and background processor usage. 

Due to Alpine being a barebones Linux distribution it can be a bit trickier to get things set up than say Ubuntu or Raspbian. You'll find that even some basic packages you're used to won't be available (however they are very easy to install).  Using Alpine is definitely worth the effort though as you'll learn a huge amount about Linux while working with it.

## Useful resources
- https://wiki.alpinelinux.org/wiki/Installation
- https://wiki.alpinelinux.org/wiki/Raspberry_Pi#Installation
- https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts
- https://www.raspberrypi.org/documentation/configuration/config-txt/
- https://wiki.alpinelinux.org/wiki/Configure_Networking
- https://wiki.alpinelinux.org/wiki/Classic_install_or_sys_mode_on_Raspberry_Pi
- https://beta.docs.alpinelinux.org/user-handbook/0.1a/Installing/setup_alpine.html

## Setting up the SD card (Windows)
- Use an empty SD card of minimum 4GB, class 10 is the best as it'll be nice and fast. Don't use an SD card with data on it, *following these instructions will mean you lose all data on the SD card*.
- Plug the SD card into your computer then go to start and type `diskmgmt` then enter. The Windows Disk Management application will open.
- Locate your SD card on the listing and create a primary partition formatted as FAT32.
- Once the card is formatted and appearing as a drive in Windows drive listing you can move on to the next step.

## Find the right Alpine version for your Raspberry Pi

## Installation
- Plug the SD card into your computer and open Disk Management (instructions on how to do this, with screenshots)
- Create a 512MB primary partition and assign a drive letter
- Format the partition with FAT32. The rest of the space will become available later, this is just to get alpine up and running.
- Choose correct Alpine version for your Raspberry Pi
    - Detailed list of which ones work
- Extract the file (verify checksums)
- Copy files to new folder
- Copy optional answers file (don't forget to update all the values)
- Safely eject the SD card and plug it into your Raspberry Pi.
    Important note for newbies: If you used a USB stick to plug the SD card into your Windows PC, you'll need to take that off. The SD card needs to go in the Raspberry Pi's SD card slot - not a USB slot!

- Once the Pi has booted up you should be provided with a login prompt.vEnter the username 'root' and you'll be in

- Now it's time to run setup. If you provided an answer file type the following:

    `setup-alpine -f /media/mmcblk0p1/<ANSWERFILE>`

If you get anything wrong you can hit CTRL+C at the same time to cancel setup and start again. Just type setup-alpine again.

## Standard answers to setup questions

DNS domain name type: `local`
DNS nameserver type: `1.1.1.1`
Timezone: `UTC`
For proxy type: `none`
NTP client: `chrony`
SSH server: `openssh`
Enter where to store configs: `mmcblk0p1`
APK cache directory: `/media/mmcblk0p1/cache`

When choosing a mirror you can just press `f` this test the speed to all of the mirrors and choose the fastest, or `r` for a random mirror.

# Don't forget to commit

Once you have made all the changes you want, you need to commit them to disk by typing:

`lbu commit -d`

This ensures the changes are stored to disk and will re-apply when you restart.

Installation should now be complete.


# Post-Install Setup

There are some post-install setup scripts which will set up a number of things for you, such as:

- Useful tools such as sudo, curl and nano
- Standard user for logging in
- Firewall installed and setup to block all traffic apart from SSH
- SSH
- Docker

You can run these scripts individually or all together.  To set them all up run the following commands:

`apk add curl`
`curl -o setup.sh -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/garrym/raspberry-pi-alpine/master/setup.sh`
`chmod +x setup.sh`
`./setup.sh`

This will automatically run everything in order.  However if you wanted to run individual scripts, just use the same code above and replace `setup.sh` with `setup-packages.sh`, `setup-user.sh`, `setup-firewall.sh`, `setup-ssh.sh` or `setup-docker.sh` instead.