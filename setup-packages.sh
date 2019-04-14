# Edit /etc/apk/repositories and ensure the following lines are uncommented:
# http://<mirror>/alpine/<version>/main
# http://<mirror>/alpine/<version>/community
# http://<mirror>/alpine/edge/testing

# Update packages to latest versions
apk update
apk upgrade

# Add basic tools
apk add sudo
apk add curl
apk add nano

lbu commit -d