apk add ufw
ufw default deny incoming
ufw allow ssh
ufw enable

lbu commit -d