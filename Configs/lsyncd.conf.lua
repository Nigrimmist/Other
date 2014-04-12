settings = {
  logfile    = "/root/www/logs/lsyncd.log", 
  statusFile = "/root/www/logs/lsyncd.status", 
  nodaemon   = false 
} 

sync { 
  default.rsyncssh, 
  source="/root/www/gifs", 
  targetdir="/root/www/gifs/synced",  
  host = "backupServer",  
  delay=10  
} 
