#!/bin/bash
apt update && apt -y upgrade
apt update
apt install -y neofetch sl
echo "vagrant:vagrant" | chpasswd
# sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
# systemctl restart sshd;