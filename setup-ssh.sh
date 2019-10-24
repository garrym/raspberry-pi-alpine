# Add SSH
apk add openssh
rc-update add sshd

# (INSECURE) Allow password authentication via SSH
sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo "AllowUsers $username" >> /etc/ssh/sshd_config

# Start SSH
/etc/init.d/sshd start

lbu commit -d