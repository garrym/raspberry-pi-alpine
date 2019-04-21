read -p "Enter username of account to create: " username

# Add user, set password and enable terminal login
apk add shadow
addgroup -S $username
adduser -s /bin/ash $username
passwd $username

lbu commit -d
