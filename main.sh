export backup_server_ip="188.226.202.141"


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

#download configs
wget -O /www/configs/lsyncd.conf.lua "https://raw.githubusercontent.com/Nigrimmist/Other/master/Configs/lsyncd.conf.lua"

wget -O /www/configs/vsftpd.conf "https://raw.githubusercontent.com/Nigrimmist/Other/master/Configs/vsftpd.conf"

#download scripts
wget -O /www/scripts/lsyncd.sh "https://raw.githubusercontent.com/Nigrimmist/Other/master/Scripts/lsyncd.sh"
chmod +x /www/scripts/lsyncd.sh

sudo /www/scripts/lsyncd.sh #sync

#ftp
sudo apt-get install vsftpd 
sudo useradd -d /www/gifs -m ftpuser
echo "FTP PASSWORD : "
sudo passwd ftpuser
chown ftpuser:ftpuser /www/gifs
cp -f /www/configs/vsftpd.conf /etc/
sudo chmod a-w /www/gifs

echo "Reboot required"