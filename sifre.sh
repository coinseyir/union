#!/usr/bin/env bash  

# Apt update ve upgrade işlemleri  
sudo apt update && sudo apt upgrade -y  

# Gerekli paketlerin kurulumu  
sudo apt install curl iptables build-essential git wget jq make gcc nano automake autoconf tmux htop pkg-config libssl-dev tar clang unzip -y  

# Docker kurulumu  
sudo apt update  
sudo apt install docker.io -y  

# Expect dosyası oluştur (zenerbaba şifresini kullanacağız)  
expect << EOF  
spawn sudo su  
expect "password for"  
send "zenerbaba\n"  
interact  
EOF
