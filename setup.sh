#!/bin/bash

# Uzak masaüstü için kullanıcı ve şifre değişkenlerini tanımlayın
# Root kullanmayın
USER="zener"
PASSWORD="zenerbaba"

# Paket listesini günceller
apt update && apt upgrade -y

# GNOME Masaüstünü yükler
sudo apt install -y ubuntu-desktop

# Uzak masaüstü sunucusunu (xrdp) kurar
sudo apt install -y xrdp

# USER kullanıcısını şifreyle ekler
sudo useradd -m -s /bin/bash $USER
echo "$USER:$PASSWORD" | sudo chpasswd

# USER kullanıcısını yönetim hakları için sudo grubuna ekler
sudo usermod -aG sudo $USER

# xrdp'yi GNOME masaüstünü kullanacak şekilde yapılandırır
echo "gnome-session" > ~/.xsession

# xrdp hizmetini yeniden başlatır
sudo systemctl restart xrdp

# Başlangıçta xrdp'yi etkinleştirir
sudo systemctl enable xrdp

# Rivalz.ai rClient için gereklilikleri kurar
sudo apt install -y wget

# Rivalz.ai rClient AppImage'ı indirir
wget https://api.rivalz.ai/fragmentz/clients/rClient-latest.AppImage -O rClient-latest.AppImage

# AppImage'ı çalıştırılabilir hale getirir
chmod +x rClient-latest.AppImage

# Eğer mevcut değilse Belgeler dizinini oluşturur
sudo -u $USER mkdir -p /home/$USER/Documents

# AppImage'ı kullanıcının Belgeler dizinine taşır
sudo mv rClient-latest.AppImage /home/$USER/Documents/rClient-latest.AppImage

# rClient'in sahibini belirtilen kullanıcıyla değiştirir
sudo chown $USER:$USER /home/$USER/Documents/rClient-latest.AppImage

echo "Kurulum tamamlandi. GNOME Desktop, xrdp ve Rivalz.ai rClient kuruldu. Lutfen VPSFix.sh dosyasini calistiriniz."
