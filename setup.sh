REPOSITORY_URL=https://raw.githubusercontent.com/garrym/raspberry-pi-alpine/master
NO_CACHE_HEADER="Cache-Control: no-cache"

curl -o setup-packages.sh -H '$NO_CACHE_HEADER' $REPOSITORY_URL/setup-packages.sh
curl -o setup-user.sh -H '$NO_CACHE_HEADER' $REPOSITORY_URL/setup-user.sh
curl -o setup-firewall.sh -H '$NO_CACHE_HEADER' $REPOSITORY_URL/setup-firewall.sh
curl -o setup-ssh.sh -H '$NO_CACHE_HEADER' $REPOSITORY_URL/setup-ssh.sh
curl -o setup-docker.sh -H '$NO_CACHE_HEADER' $REPOSITORY_URL/setup-docker.sh

chmod +x setup-packages.sh
chmod +x setup-user.sh
chmod +x setup-firewall.sh
chmod +x setup-ssh.sh
chmod +x setup-docker.sh

./setup-packages.sh
./setup-user.sh
./setup-firewall.sh
./setup-ssh.sh
./setup-docker.sh