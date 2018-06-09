#!/bin/bash
# Post install script for Raspbian for the purposes of a NAS w/NFS, Samba
# Need a spinning disk for nas
# run script with sudo

apt-get update && apt-get upgrade

apt-get install vim python3 python3-pip tree ntp rclone wget samba samba-common-bin nfs-common apache2 byobu rkhunter

pip install -upgrade pip

systemctl enable smbd
systemctl enable apache2
systemctl enable sshd

raspi-config
#adjust gpu memory
#set hostname
#set timezone
#expand to full disk

# Nmon performance monitor
wget http://sourceforge.net/projects/nmon/files/nmon16e_arm_ubuntu1510 -O /usr/local/bin/nmon
chmod 555 /usr/local/bin/nmon
mkdir -m 755 /var/log/nmon
wget http://sourceforge.net/projects/nmon/files/nmonchart33.tar -O /usr/local/bin/
cd /usr/local/bin && tar xvf /usr/local/bin/monchart33.tar
wget https://raw.githubusercontent.com/raresteak/linux_scripts/master/process_nmon.sh -O /usr/local/bin/
echo "TODO: Setup crontab" >> /etc/motd

# customize
# partition spinning disk
# use ext4 for spinning disk.  i tried xfs but NFS performance was terrible
# would hang pi after a short while of writes into export.   ext4 did not
#mkfs.ext4 /dev/sda1
#mkdir /tmp/tmpmount
#mount /dev/sda1 /tmp/tmpmount
#cp -r -p /var/log/* /tmp/tmpmount
#echo "/dev/sda1 /var/log ext4 defaults 0 0" >> /etc/fstab

#change editor for each user su to them and run command
/usr/bin/select-editor

# grab ddns client
wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz
# don't forget to set this up later
echo "TODO: Remember to setup ddns client." >> /etc/motd


#################### Get Skeleton files
# Get .bash_profile
wget https://raw.githubusercontent.com/raresteak/linux_scripts/master/bash_profile -O /etc/skel/.bash_profile
# Get my .bashrc file
wget https://raw.githubusercontent.com/raresteak/linux_scripts/master/bashrc -O /etc/skel/.bashrc
# Get my .vimrc file
wget https://raw.githubusercontent.com/raresteak/linux_scripts/master/vimrc -O /etc/skel/.vimrc

# Did you prepare the disk above??????????
##configure a big swapfile AFTER mounting spinning disk
# update /etc/dphys-swapfile
#cp /etc/dphys-swapfile /etc/dphys-swapfile.bak1
#sed -i s/^CONF_SWAPFILE/#CONF_SWAPFILE/ /etc/dphys-swapfile
#sed -i s/^CONF_SWAPSIZE/#CONF_SWAPSIZE/ /etc/dphys-swapfile
#echo "CONF_SWAPFILE=/var/log/swap" >> /etc/dphys-swapfile
#echo "CONF_SWAPSIZE=2048" >>  /etc/dphys-swapfile

## Customize
# Add users
#useradd -s /bin/bash -m elf 
# Disable or rename PI user

# Set static IP /etc/dhcpcd.conf
