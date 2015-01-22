export backup_server_ip="107.170.170.183"
export uploadFileUser="fileuploaduser"

mkdir /www
mkdir /www/configs
mkdir /www/logs
mkdir /www/scripts
mkdir /www/gifs
mkdir /www/gifs/original
mkdir /www/gifs/demotivators
mkdir /www/temp
mkdir /etc/lsyncd



sudo apt-get update
sudo apt-get install make
sudo apt-get -y install xrdp #rdp
sudo apt-get -y install htop



#download scripts
#wget -O /www/scripts/lsyncd.sh "https://raw.githubusercontent.com/Nigrimmist/Other/master/Scripts/lsyncd.sh"
wget -O /www/scripts/nginx.sh "https://raw.githubusercontent.com/Nigrimmist/Other/master/Scripts/nginx.sh"
#chmod +x /www/scripts/lsyncd.sh
chmod +x /www/scripts/nginx.sh

#sudo /www/scripts/lsyncd.sh #sync
sudo /www/scripts/nginx.sh #nginx


#setup ssh upload user
sudo adduser --no-create-home $uploadFileUser
chown $uploadFileUser:$uploadFileUser /www/gifs
chmod 755 /www/gifs



echo "Reboot required"