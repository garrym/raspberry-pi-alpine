# Instructions for installing Alpine Linux on a Raspberry Pi

## Disclaimer
Please note: This is currently work in progress.

## Introduction

Alpine Linux is a fast, lightweight Linux distribution that's ideal for the Raspberry Pi. It's designed to be run on minimal hardware so it comes with a barebones setup and limited number of packages, making it ideal for those who want to know exactly what is running on their Raspberry Pi to have the minimum disk space and background processor usage. 

Due to Alpine being a barebones Linux distribution it can be a bit trickier to get things set up than say Ubuntu or Raspbian. You'll find that even some basic packages you're used to won't be available (however they are very easy to install).  Using Alpine is definitely worth the effort though as you'll learn a huge amount about Linux while working with it.

## Useful resources
- https://wiki.alpinelinux.org/wiki/Raspberry_Pi#Installation


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

    setup-alpine -f /media/mmcblk0p1/<ANSWERFILE>

If you get anything wrong you can hit CTRL and C at the same time to cancel setup and start again. Just type setup-alpine again.

For DNS domain name type: local
For DNS nameserver type: 1.1.1.1

Enter root password

Timezone: UTC

For proxy type: none
NTP client: chrony

When choosing a mirror you can just press f this test the speed to all of the mirrors and choose the fastest


SSH server choose: openssh

Enter where to store configs: mmcblk0p1 (your SD card)

APK cache directory: /media/mmcblk0p1/cache

Now write all the changes to disk by typing: lbu_commit


Installation has now completed. You can test you set up the network connection by pinging 1.1.1.1


Download the setup script here:

apk add curl

curl 






Install tools - bash, curl, sudo

apk add curl
apk add sudo
apk add nano

How to set up bash
