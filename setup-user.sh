read -p "Enter username of account to create: " username

# Add user, set password and enable terminal login
apk add shadow
addgroup -S $username
adduser -S $username
passwd $username
usermod -s /bin/ash garry

# Enable login for the new user
# Edit /etc/passwd and change /bin/nologin to /bin/ash

lbu commit -d