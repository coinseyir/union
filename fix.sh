#!/bin/bash

# Version 1.1

# Hizmet dosyası yolunu tanımlar
SERVICE_FILE="/etc/systemd/system/default-interface-config.service"

# Komut dosyasının root ayrıcalıklarıyla çalıştırılıp çalıştırılmadığını kontrol eder
if [ "$EUID" -ne 0 ]; then
  echo "Lutfen root olarak çaliştirin."
  exit 1
fi

# Zaten yüklü değilse ethtool'u yükler
if ! command -v ethtool &> /dev/null; then
  echo "ethtool bulunamadi, yukleniyor..."
  apt-get update
  apt-get install -y ethtool
fi

# Varsayılan ağ arayüzünü alır
DEFAULT_INTERFACE=$(ip route show default | awk '/default/ {print $5}')

# systemd hizmet dosyasını oluşturur
cat <<EOL > $SERVICE_FILE
[Unit]
Description=Configure default network interface
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/sbin/ethtool -s $DEFAULT_INTERFACE speed 1000 duplex full autoneg off
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOL

# Yeni hizmeti tanımak için systemd'yi yeniden yükler
systemctl daemon-reload

# Hizmetin önyüklemede başlatılmasını sağlar
systemctl enable default-interface-config.service

# Starts the service immediately
systemctl start default-interface-config.service

echo "Varsayilan arayuz yapilandirmasi hizmeti $DEFAULT_INTERFACE arayuzune yuklendi ve baslatildi."
