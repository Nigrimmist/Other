settings {
  logfile    = "/www/logs/lsyncd.log", 
  statusFile = "/www/logs/lsyncd.status", 
  nodaemon   = false 
} 

sync { 
  default.rsyncssh, 
  source="/www/gifs", 
  targetdir="/www/gifs/synced",  
  host = "backupServer",  
  delay=10  
} 
