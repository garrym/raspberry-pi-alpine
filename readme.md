# Installing Alpine Linux on a Raspberry Pi

Alpine is a fast, lightweight Linux distribution that's easy to install and ideal for the Raspberry Pi. It's designed to be run on minimal hardware so it comes with a barebones setup and limited number of packages which makes it a great choice for those who want to know exactly what applications are running while minimising disk space and processor usage.

### Installation
1. Choose the correct Alpine version for your Raspberry Pi model
2. Format your SD card using FAT32 as the partition scheme
3. Extract the Alpine files and copy them to the SD card
4. Add an answers file (optional)
5. Safely eject the SD card, plug it into the Raspberry Pi and start it up
6. Plug all your cables into the Raspberry Pi (making sure the power cable is last)
7. Log in using the username `root` and blank password
8. Run `setup-alpine` (or `setup-alpine -f /path-to-answer-file` if you added an answers file in step 4.)

After you've followed these steps you will have a working Alpine installation



Now you can following the instructions on [[Getting started with Alpine]] here.



### Choosing the correct Alpine version

There are currently 3 different versions of Alpine for the Raspberry Pi and choosing the right one for your model can be confusing as there isn't a great deal of information to advise you. 

Here are my findings:

| Raspberry Pi Model | armhf | armv7 | aarch64 |
| ------------------ | ----- | ----- | ------- |
| B+                 |       |       |         |
| A+                 |       |       |         |
| 2                  |       | Works |         |
| 3                  |       | Works |         |

#### armhf vs armv7 vs aarch64

I'm going to investigate further and update this section.



### Formatting the SD card

For the purposes of this guide I'll be using the FAT32 partition scheme. As a user who primarily uses Windows I've found that the easiest way to get started with Alpine is by formatting the entire SD card using FAT32 partition scheme.

There are other partition schemes that may be more suitable for a Linux environment (e.g. ext4) but they do require a little more work to get up and running, they'll usually require a 3rd party partitioning tool as Windows does not natively support most Linux file system formats.  If you're choosing an alternative partition scheme you've probably got enough knowledge to know how to do it anyway.

So to get started plug the SD card into your computer and open the disk management tool by typing `diskmgmt` in the start menu, then selecting the entry named 'Create and format hard disk partitions'.

When the to

The reason we use this tool over the 'This PC' view of drives in Windows 10 is that it shows you the physical disk, rather than just the formatted partitions. We need to make sure we delete all existing partitions on the SD card otherwise they will cause Alpine boot issues.



- Plug the SD card into your computer then go to start and type `diskmgmt` then enter. The Windows Disk Management application will open.
- Locate your SD card on the listing and create a primary partition formatted as FAT32.
- Once the card is formatted and appearing as a drive in Windows drive listing you can move on to the next step.











**Detailed instructions - Logging in**

The default username for a new Alpine installation is `root` and the password is blank. This should get you access to the terminal.



**Detailed instructions - Running setup-alpine**

Alpine on the Raspberry Pi comes with a setup script which helps to automate a lot of the settings an features of the newly installed OS.  You can run it just by typing `setup-alpine` and following the instructions.

Some of the answers might be a bit tricky for people newer to Linux or computers in general.

[[I'll provide a list of detailed answers to get you up and running soon]]

If you added an answers file previously, you'll need to specify the path to the file here. This can be a bit confusing because it won't reside where you would expect it in the root `/` . Instead it can be found at: `/media/mmcblk0p1/<ANSWERFILE>`



Getting around Alpine

Where is the SD





#### Troubleshooting

##### Black screen when booting the Raspberry Pi

This typically happens when either the SD card isn't plugged in correctly or the Raspberry Pi can't recognise the boot sequence of the SD card.

First make sure your SD card is seated correctly and restart the Raspberry Pi. If the issue still persists, try re-formatting the SD card, ensuring that all partitions are removed and the card is formatted using the FAT32 partition scheme.

##### Monitor not recognising the Raspberry Pi

The Raspberry Pi has some built in configuration that allows it to run in headless mode and ignore the HDMI port to save power. If the Raspberry Pi is booted without an HDMI cable connected then it will not recognise the monitor. There are some workarounds for this and you can alter the config.txt to permanently enable the HDMI port.

Try to restart the Raspberry Pi with the HDMI cable connected.



**Detailed instructions - Extract the Alpine files and copy them to the SD card**

**Detailed instructions - Optionally include an answers file**

When you run the `setup-alpine` script on your new Raspberry Pi Alpine installation you have the option of providing an answers file. This file will automatically answer all of the questions for you regarding keyboard layout, timezone, network devices etc. It's a good way to save time when setting up new Alpine installations as you won't have to manually answer all the setup questions.

[[Here is a sample answer file to use as a template.]]

**Detailed instructions - Plugging in the SD card**

Ensure the Raspberry Pi is turned off prior to plugging in the SD card.  As the Raspberry Pi doesn't have a switch to turn it on or off, you'll need to make sure that either the power cable is unplugged or it's turned off at the plug socket.

Plugging an SD card in while the Raspberry Pi is working probably won't do any harm, but the system won't boot properly unless the SD card is present when the power is turned on.



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

## Don't forget to commit

Once you have made all the changes you want, you need to commit them to disk by typing:

`lbu commit -d`

This ensures the changes are stored to disk and will re-apply when you restart.

Installation should now be complete.


## Post-Install Setup

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



## Alpine Concepts

Due to Alpine being a barebones Linux distribution it can be a bit trickier to get things set up than say Ubuntu or Raspbian. You will find that even some basic packages you're used to won't be available from a standard installation, but everything is very easy to install.  You get to install just the tools you need to do the job.

Working with Alpine Linux is definitely worth the effort as you'll learn a huge amount about Linux and understand how to install applications that we usually take for granted in more widely used distributions.





### Read-only file system

The installation mode we will be using for the Raspberry Pi is called `sys mode` and by default this is a read-only file system. This means any applications you install or configuration changes you make will not be saved after restarting.  I prefer this setting as the Raspberry Pi feels more like an immutable appliance rather than a computer with mutable data.

In order to persist any changes you will need to commit afterwards. You should do this regularly when working with Alpine by running the following command:

`lbu commit -d`

Once you have done this all changes will be saved and be present after restarting.

It is possible to set up the Raspberry Pi to do a classic install (normal writable file system) but this guide won't cover that.





## Useful resources

- https://wiki.alpinelinux.org/wiki/Installation
- https://wiki.alpinelinux.org/wiki/Raspberry_Pi#Installation
- https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts
- https://www.raspberrypi.org/documentation/configuration/config-txt/
- https://wiki.alpinelinux.org/wiki/Configure_Networking
- https://wiki.alpinelinux.org/wiki/Classic_install_or_sys_mode_on_Raspberry_Pi
- https://beta.docs.alpinelinux.org/user-handbook/0.1a/Installing/setup_alpine.html

## 