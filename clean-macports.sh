#! /bin/sh

# —— stats —— 
before=`du -sh /opt`

# —— normal clean —— 
#Remove misc leftover data:
sudo port clean --all installed
sudo port -f uninstall inactive

# —— extra clean —— 
#Remove leftover build files:
sudo rm -rf /opt/local/var/macports/build/*
#Remove download files:
sudo rm -rf /opt/local/var/macports/distfiles/*
#Remove archives:
sudo rm -rf /opt/local/var/macports/packages/*

# —— extra extra clean —— 
#Remove dependencies of uninstalled ports:
sudo port -f uninstall leaves

# —— stats —— 
after=`du -sh /opt`
echo 'before ' $before
echo 'after  ' $after
