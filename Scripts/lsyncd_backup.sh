wget -O /www/configs/lsyncd.conf.lua "https://raw.githubusercontent.com/Nigrimmist/Other/master/Configs/lsyncd.conf.lua"

sudo touch /www/logs/lsyncd.log /www/logs/lsyncd.status
sudo chmod 774 /www/logs/lsyncd.log /www/logs/lsyncd.status

sudo apt-get -y install lsyncd

cp -f /www/configs/lsyncd.conf.lua /etc/lsyncd/
chmod 775 /etc/init.d/lsyncd
chown root:root /etc/init.d/lsyncd


wget -O /www/temp/lsyncd-2.1.5.tar.gz "http://lsyncd.googlecode.com/files/lsyncd-2.1.5.tar.gz"
cd /www/temp/ && tar -xzvf /www/temp/lsyncd-2.1.5.tar.gz

sudo apt-get -y install lua5.1 liblua5.1-0-dev pkg-config

cd /www/temp/lsyncd-2.1.5 && ./configure
cd /www/temp/lsyncd-2.1.5 && sudo make install
cp -f /www/temp/lsyncd-2.1.5/lsyncd /usr/bin/
echo "REBOOT REQUIRED"