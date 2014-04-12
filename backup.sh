mkdir /root/www
mkdir /root/www/configs
mkdir /www/logs
mkdir /www/scripts
mkdir /www/gifs
mkdir /www/gifs/all
mkdir /www/gifs/synced
mkdir /www/temp
mkdir /etc/lsyncd

sudo apt-get update
sudo apt-get install xrdp #rdp
sudo apt-get install htop

#download configs
wget -O /www/configs/lsyncd.conf.lua "https://raw.githubusercontent.com/Nigrimmist/Other/master/Configs/lsyncd.conf_backup.lua"

#download scripts
wget -O /www/scripts/lsyncd.sh "https://raw.githubusercontent.com/Nigrimmist/Other/master/Scripts/lsyncd_backup.sh"
chmod +x /www/scripts/lsyncd.sh

sudo /www/scripts/lsyncd.sh

