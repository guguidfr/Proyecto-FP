#!/bin/bash
apt update && apt -y upgrade
# ---------------------------
systemctl stop ssh
cat /home/vagrant/host_key >> /home/vagrant/.ssh/authorized_keys
rm /home/vagrant/host_key
systemctl start ssh
# ---------------------------
# chpasswd syntax -> user_name:password
# Change the default user password to whatever you want
echo "vagrant:vagrant" | chpasswd
