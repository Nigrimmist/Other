export backup_server_ip="188.226.186.242"

mkdir root/www
mkdir root/www/configs
mkdir root/www/logs
mkdir root/www/scripts
mkdir /root/www/gifs
mkdir /root/www/ssh
mkdir /etc/lsyncd


sudo su
sudo apt-get update
sudo apt-get install xrdp #rdp

#download configs
wget -O /root/www/configs/lsyncd.conf.lua "https://raw.githubusercontent.com/Nigrimmist/Other/master/Configs/lsyncd.conf.lua"

#download scripts
wget -O /root/www/scripts/lsyncd.sh "https://raw.githubusercontent.com/Nigrimmist/Other/master/Scripts/lsyncd.sh"
chmod +x /root/www/scripts/lsyncd.sh
sudo root/www/scripts/lsyncd.sh

