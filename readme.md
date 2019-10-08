# Installing Alpine Linux on a Raspberry Pi
Alpine is a fast, lightweight Linux distribution that's easy to install and ideal for the Raspberry Pi. It's designed to be run on minimal hardware so it comes with a barebones setup and limited number of packages which makes it a great choice for those who want to know exactly what applications are running while minimising disk space and processor usage.

## Alpine Concepts
Due to Alpine being a barebones Linux distribution it can be a bit trickier to get things set up than say Ubuntu or Raspbian. You will find that even some basic packages you're familiar with won't be available from a standard installation, but everything is deceptively easy to install and when you're finished you're guaranteed to only have installed only the tools you need rather than lots of unnecessary packages and background services.

Working with Alpine Linux is definitely worth the effort as you'll learn a huge amount about Linux and understand how to install applications that we usually take for granted in more widely used distributions.

## Installation

These installation instructions have been designed for absolute beginners to Raspberry Pi, Alpine and Linux in general.  If you have any issues while following them 

1. [Choose the correct Alpine version for your Raspberry Pi model](#ChooseAlpineVersion)
2. [Formatting the SD card](#FormatSDCard)
3. [Copy Alpine to the SD card](#CopyAlpine)
4. [(Optional) Add an answers file](#AddAnswersFile)
5. [Plug the SD card in](#PlugInSDCard)
6. [Plug all the cables in](#PlugCablesIn)
7. [Log in for the first time](#LogIn)
8. [Run setup](#RunSetup) or if you created an answers file [run setup with an answers file](#RunSetupAnswersFile) instead
9. [(Optional) Additional setup for user accounts, SSH, Firewall and Docker](#AdditionalSetup)
10. [(Important) Learn about committing changes](#Committing)

After you've followed these steps you will have a working Alpine installation.  Now you can follow the instructions on [Getting started with Alpine](#GettingStarted).  However, if you got stuck or had unexpected results then please check out the [troubleshooting section](#Troubleshooting).

And if you're still stuck after all that please feel free to open an issue or send me a [Tweet](https://twitter.com/garrymarsland) and I'll do my best to help.

### <a id="ChooseAlpineVersion"></a> Choosing the correct Alpine version

There are currently 3 different versions of Alpine for the Raspberry Pi on the [Alpine downloads page](https://alpinelinux.org/downloads/); `armhf`, `aarch64` and `armv7` and choosing the right one for your model can be very confusing.  There isn't a great deal of simple information to tell you which version you need based on the architecture of the processor on your Pi.

The following table shows the Raspberry Pi versions I've tried this script on so far.  I'll update with more as I test them:

| Raspberry Pi Model | armhf | armv7 | aarch64 |
| ------------------ | ----- | ----- | ------- |
| A+                 |       |       |         |
| B+                 |       |       |         |
| 2B                 |       |<center>✓</center>|         |
| 3B                 |       |       |         |
| 3A+                |       |       |         |
| 3B+                |       |<center>✓</center>|         |
| 4B                 |       |       |         |
| Zero               |       |       |         |
| Zero W             |       |       |         |
| Zero WH            |       |       |         |

### <a id="FormatSDCard"></a> Formatting the SD card

#### On Windows
For the purposes of this guide I'll be using the FAT32 partition scheme. As a user who primarily uses Windows I've found that the easiest way to get started with Alpine is by formatting the entire SD card using FAT32 partition scheme.

There are other partition schemes that may be more suitable for a Linux environment (e.g. ext4) but they do require a little more work to get up and running, they'll usually require a 3rd party partitioning tool as Windows does not natively support most Linux file system formats.  If you're choosing an alternative partition scheme you've probably got enough knowledge to know how to do it anyway.

So to get started plug the SD card into your computer and open the disk management tool by typing `diskmgmt` in the start menu, then selecting the entry named 'Create and format hard disk partitions'.

The reason we use this tool over the _This PC_'_ view of drives in Windows 10 is that it shows you the physical disk, rather than just the formatted partitions. We need to make sure we delete all existing partitions on the SD card otherwise they will cause Alpine boot issues.

- Plug the SD card into your computer then go to start and type `diskmgmt` then enter. The Windows Disk Management application will open.
- Locate your SD card on the listing and create a primary partition formatted as FAT32.
- Once the card is formatted and appearing as a drive in Windows drive listing you can move on to the next step.


- Plug the SD card into your computer and open Disk Management (instructions on how to do this, with screenshots)
- Create a 512MB primary partition and assign a drive letter
- Format the partition with FAT32. The rest of the space will become available later, this is just to get alpine up and running.

### <a id="CopyAlpine"></a> Copy Alpine to the SD card

Alpine is great because you don't necessarily need to use a dedicated application like Etcher to put it on the SD card.  You can just copy the files in Windows Explorer.

- Extract the file (verify checksums)

### <a id="AddAnswersFile"></a> Add an Answers File
When you run the `setup-alpine` script on your new Raspberry Pi Alpine installation you have the option of providing an answers file. This file will automatically answer all of the questions for you regarding keyboard layout, timezone, network devices etc. It's a good way to save time when setting up new Alpine installations as you won't have to manually answer all the setup questions.

You don't have to add an answers file for setup to run. If you don't provide one it will run in interactive mode asking you questions on each step.  An answers file just removes this step from setup and makes it easier if you're setting up more than one Pi to share the same settings.

You'll need to download a copy of [this sample answers file](https://github.com/garrym/raspberry-pi-alpine/blob/master/setup-alpine.in) and replace all the values for the following `<KEYBOARDLAYOUT>`, `<KEYBOARDVARIANT>`, `<HOSTNAME>`, `<IP>`, `<NETMASK>`, `<GATEWAY>` and `<DNS>`.

Once this is done you can copy it to the root of the SD card alongside all the other Alpine installation files.

### <a id="PluginSDCard"></a> Plug in the SD Card
Safely eject the SD card from your computer, ensuring that all the files have finished copying and it is not being accessed.

Ensure the Raspberry Pi is turned off before attempting to plug in the SD card.  As it doesn't have an on/off switch you'll need to make sure it's turned off at the socket or the power cable is unplugged.  Once it is off turn it upside down and along one of the short edges you'll notice an SD card slot where you can plug in the card.

Plugging an SD card in while the Raspberry Pi is working probably won't do any harm, but the system won't boot properly unless the SD card is present when the power is turned on.

**Important note:** If you used a USB stick to plug the SD card into your PC you'll need to take that off. The Raspberry Pi will only boot from the SD card slot, it won't boot from a USB port.

### <a id="PlugCablesIn"></a> Plug the Cables In
Plug all your cables into the Raspberry Pi (making sure the power cable is last)

### <a id="LogIn"></a> Log In for the First Time

The default username for a new Alpine installation is `root` and the password is empty. This should get you access to the terminal where you'll be able to make whatever changes you want.

I highly recommend that you add a strong password to the root account immediately to stop unauthorised access to your Raspberry Pi. You can do this by using the command:

`sudo passwd root`

Once you've set the password you'll need to use it when logging in with the root account. It's also best practice with Linux to not use the root account unless you absolutely have to, instead using a secondary account for day-to-day access and only using root when it's absolutely required.

### <a id="RunSetup"></a> Run Setup
Alpine on the Raspberry Pi comes with a setup script which really helps to automate setting up the applications and features for new users.

If you run `setup-alpine` you'll enter an interactive setup questionaire that will help you configure everything.  Some of the questions might be a bit confusing for those users who are new to Linux, networking and computers in general so here are some sample answers that can get you up and running quickly (however if you created an [answer file](#AddAnswersFile) previously then skip this step):

If you get anything wrong you can hit CTRL+C at the same time to cancel setup and start again. Just run setup again using the command above.

|DNS domain name type|`local`|
|DNS nameserver type|`1.1.1.1`|
|Timezone|`UTC`|
|Proxy type|`none`|
|NTP client|`chrony`|
|SSH server|`openssh`|
|Enter where to store configs|`mmcblk0p1`|
|APK cache directory|`/media/mmcblk0p1/cache`|

When choosing a mirror you can just press `f` this test the speed to all of the mirrors and choose the fastest, or `r` for a random mirror.

### <a id="RunSetupAnswersFile"></a> Run Setup with Answers File
If you created an [answers file](#AnswersFile) and copied it onto the SD card you should be able to provide it as an input parameter to the setup script which will then use those values to automate the setup script. To run the setup script with an answers file run the following command:

`setup-alpine -f /media/mmcblk0p1/<ANSWERFILE>`

Replacing the `<ANSWERFILE>` part with the name of the file.

### <a id="AdditionalSetup"></a> Additional Setup

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

## <a id="Committing"></a> Important: Committing

This Alpine installation runs in `sys mode` which is a read-only file system.  This means any applications you install, configuration changes you make or files you write will not be saved after restarting unless you commit them using the command:

`lbu commit -d`

It's important to remember to do this when working with Alpine. It can be very frustrating when you forget to commit and all your changes disappear after a restart. You can commit as regularly as you want and it won't cause any problems. Commit early, commit often.

I prefer using `sys mode` with Alpine as it makes your device feel more like an appliance with immutable data that you can guarantee will be in the same state even after restarting, however it is possible to have a writable filesystem by doing the classic Alpine install. For more information on this check out the [Alpine Wiki on classic install vs sys mode](https://wiki.alpinelinux.org/wiki/Classic_install_or_sys_mode_on_Raspberry_Pi).




### <a id="GettingStarted"></a> Getting Started

#### Getting around Alpine
Access the SD card by `cd /media/mmcblk0p1/`


#### Alpine Package Manager
Alpine uses `apk` as it's package manager. This is what you can use to install and remove software. For more information check out the (Alpine Linux package management page)[https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management] on the wiki.

## <a id="Troubleshooting"></a> Troubleshooting

### Blank screen when booting the Raspberry Pi

This typically happens when either the SD card isn't plugged in correctly or the Raspberry Pi can't recognise the boot sequence of the SD card.

First make sure your SD card is seated correctly and restart it by unplugging the USB power cable and plugging it back in.

If the issue still persists try re-following the instructions for [formatting the SD card](#FormatSDCard), making sure that all existing partitions have been removed and the card is formatted using the FAT32 partition scheme.

### Monitor not recognising the Raspberry Pi

The Raspberry Pi has some built in configuration that allows it to run in headless mode and ignore the HDMI port to save power. If the Raspberry Pi is booted without a HDMI cable connected then it will not recognise the monitor. There are some workarounds for this and you can alter the config.txt to permanently enable the HDMI port.

Try to restart the Raspberry Pi with the HDMI cable connected.

## Useful resources

- https://wiki.alpinelinux.org/wiki/Installation
- https://wiki.alpinelinux.org/wiki/Raspberry_Pi#Installation
- https://wiki.alpinelinux.org/wiki/Alpine_setup_scripts
- https://www.raspberrypi.org/documentation/configuration/config-txt/
- https://wiki.alpinelinux.org/wiki/Configure_Networking
- https://wiki.alpinelinux.org/wiki/Classic_install_or_sys_mode_on_Raspberry_Pi
- https://beta.docs.alpinelinux.org/user-handbook/0.1a/Installing/setup_alpine.html