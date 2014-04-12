sudo touch /root/www/logs/lsyncd.log /root/www/logs/lsyncd.status
sudo chmod 774 /root/www/logs/lsyncd.log /root/www/logs/lsyncd.status

sudo apt-get install lsyncd

cp -f /root/www/configs/lsyncd.conf.lua /etc/lsyncd/
chmod 775 /etc/init.d/lsyncd
chown root:root /etc/init.d/lsyncd


wget -O /root/www/temp/lsyncd-2-1.5.tar.gz "http://lsyncd.googlecode.com/files/lsyncd-2.1.5.tar.gz"
tar -xzvf /root/www/temp/lsyncd-2-1.5.tar.gz

sudo apt-get install lua5.1 liblua5.1-0-dev pkg-config

sudo /root/www/temp/lsyncd-2.1.5/configure
cd /root/www/temp/lsyncd-2.1.5/ && sudo make install
cp -f /root/www/temp/lsyncd-2.1.5/lsyncd /usr/bin/
echo "REBOOT REQUIRED"