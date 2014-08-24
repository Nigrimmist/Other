export backup_server_ip="107.170.170.183"

wget -O /www/configs/lsyncd.conf.lua "https://raw.githubusercontent.com/Nigrimmist/Other/master/Configs/lsyncd.conf.lua"

sudo touch /www/logs/lsyncd.log /www/logs/lsyncd.status
sudo chmod 774 /www/logs/lsyncd.log /www/logs/lsyncd.status

sudo apt-get -y install lsyncd
echo "$backup_server_ip backupServer" >> /etc/hosts

cp -f /www/configs/lsyncd.conf.lua /etc/lsyncd/
echo "!!!press enter here"
ssh-keygen -t rsa
echo "----------ENTER 'YES'------------"
echo "----------ENTER 'YES'------------"
echo "----------ENTER 'YES'------------"
echo "----------ENTER 'YES'------------"

ssh-copy-id "backupServer"
echo "!!!PLEASE check ssh connect ssh 'root@$backup_server_ip'"

chmod 775 /etc/init.d/lsyncd
chown root:root /etc/init.d/lsyncd

wget -O /www/temp/lsyncd-2.1.5.tar.gz "http://lsyncd.googlecode.com/files/lsyncd-2.1.5.tar.gz"
cd /www/temp/ && tar -xzvf /www/temp/lsyncd-2.1.5.tar.gz

sudo apt-get -y install lua5.1 liblua5.1-0-dev pkg-config

cd /www/temp/lsyncd-2.1.5 && ./configure
cd /www/temp/lsyncd-2.1.5 && sudo make install
cp -f /www/temp/lsyncd-2.1.5/lsyncd /usr/bin/
