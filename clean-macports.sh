#! /bin/sh

# —— stats —— 
before=`du -sh /opt`

# —— normal clean —— 
#Remove leftovers:
sudo port clean --all installed
sudo port -f uninstall inactive

# —— extra clean —— 
#Remove leftover build files (this is done automatically by default):
sudo rm -rf /opt/local/var/macports/build/*
#Remove download files:
sudo rm -rf /opt/local/var/macports/distfiles/*
#Remove archives (these aren't created by default):
sudo rm -rf /opt/local/var/macports/packages/*

# —— stats —— 
after=`du -sh /opt`
echo 'before ' $before
echo 'after  ' $after
