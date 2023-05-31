#!/bin/bash
systemctl stop ssh
mkdir /root/.ssh
cat /home/vagrant/ssh_access/user_key >> /home/vagrant/.ssh/authorized_keys
cat /home/vagrant/ssh_access/root_key >> /root/.ssh/authorized_keys
rm /home/vagrant/ssh_access/user_key
rm /home/vagrant/ssh_access/root_key
systemctl start ssh
