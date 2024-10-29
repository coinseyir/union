#!/bin/bash  

# union adında bir dizin oluştur ve bu dizine geç  
mkdir union  
cd union  

# setup.sh dosyasını indirin  
echo "setup.sh dosyası indiriliyor..."  
curl -O https://raw.githubusercontent.com/coinseyir/union/main/setup.sh  

# Çalıştırılabilir hale getirin  
chmod +x setup.sh  

# setup.sh dosyasını çalıştırın  
echo "setup.sh dosyası çalıştırılıyor..."  
./setup.sh  

# fix.sh dosyasını indirin  
echo "fix.sh dosyası indiriliyor..."  
curl -O https://raw.githubusercontent.com/coinseyir/union/main/fix.sh  

# Çalıştırılabilir hale getirin  
chmod +x fix.sh  

# fix.sh dosyasını çalıştırın  
echo "fix.sh dosyası çalıştırılıyor..."  
./fix.sh  

# Dış IP adresinizi gösterin  
IP=$(curl -s ifconfig.me)  
echo "Dış IP adresiniz: $IP"
