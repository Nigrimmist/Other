export backup_server_ip="188.226.202.141"
export uploadFileUser="fileUploadUser"

mkdir /www
mkdir /www/configs
mkdir /www/logs
mkdir /www/scripts
mkdir /www/gifs
mkdir /www/temp
mkdir /etc/lsyncd



sudo apt-get update
sudo apt-get install xrdp #rdp
sudo apt-get install htop



#download scripts
wget -O /www/scripts/lsyncd.sh "https://raw.githubusercontent.com/Nigrimmist/Other/master/Scripts/lsyncd.sh"
wget -O /www/scripts/nginx.sh "https://raw.githubusercontent.com/Nigrimmist/Other/master/Scripts/nginx.sh"
chmod +x /www/scripts/lsyncd.sh
chmod +x /www/scripts/nginx.sh

sudo /www/scripts/lsyncd.sh #sync
sudo /www/scripts/nginx.sh #nginx

#ftp
#wget -O /www/configs/vsftpd.conf "https://raw.githubusercontent.com/Nigrimmist/Other/master/Configs/vsftpd.conf"
#sudo apt-get install vsftpd 
#sudo useradd -d /www/gifs -m ftpuser
#echo "FTP PASSWORD : "
#sudo passwd ftpuser
#chown ftpuser:ftpuser /www/gifs
#cp -f /www/configs/vsftpd.conf /etc/

#setup ssh upload user
sudo adduser --no-create-home $uploadFileUser
chown $uploadFileUser:$uploadFileUser /www/gifs
chmod 755 /www/gifs



echo "Reboot required"