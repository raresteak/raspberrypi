#!/bin/bash

#raspi-config resize disk
#adduser/change default pi password
#reboot
sudo apt-get update
sudo apt-get install vim wipe imagemagick apache2 nmon byobu at python3-tweepy
sudo update-alternatives --config editor
sudo apt-get full-upgrade
sudo systemctl enable apache2
sudo mkdir /usbdrive1
echo "PARTUUID=a675fc02-01 /usbdrive1 vfat user,umask=000,nosuid,nodev,nofail 0 0" |sudo tee -a /etc/fstab
sudo mount /usbdrive1
echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt
sudo systemctl disable hciuart
sudo wget https://raw.githubusercontent.com/raresteak/Incident-Response/master/SIEM_syslog_transaction_check.sh -O /etc/cron.daily/SIEM_syslog_transaction_check.sh
sudo chmod 555 /etc/cron.daily/SIEM_syslog_transaction_check.sh
echo "vm.swappiness=1" | sudo tee -a /etc/sysctl.conf
echo "alias shot='SHOTTIME=\$(date +\"%Y-%m-%d_%H%M%S\") && raspistill -o shot-\$SHOTTIME.jpg --nopreview --exposure sports --timeout 1'" >> ~/.bashrc
