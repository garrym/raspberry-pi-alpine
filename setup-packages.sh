echo -e "/media/mmcblk0p1/apks\nhttp://dl-cdn.alpinelinux.org/alpine/v3.9/main\nhttp://dl-cdn.alpinelinux.org/alpine/v3.9/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing" > /etc/apk/repositories

# Update packages to latest versions
apk update
apk upgrade

# Add basic tools
apk add sudo
apk add curl
apk add nano

lbu commit -d