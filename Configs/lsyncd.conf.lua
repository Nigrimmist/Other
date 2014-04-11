settings = {
  logfile    = "/root/www/logs/lsyncd.log", 
  statusFile = "/root/www/logs/lsyncd.status", 
  nodaemon   = false 
} 

sync { 
  default.rsync, 
  source="/root/www/gifs", 
  target="backupServer:/root/www/gifs",   
  delay=10 
} 
