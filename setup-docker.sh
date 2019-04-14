# Add Docker
apk add docker

# Set Docker to start at boot
rc-update add docker boot

# Start the service
service docker start

lbu commit -d