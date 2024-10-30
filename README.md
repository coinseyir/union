```bash  
curl -O https://raw.githubusercontent.com/coinseyir/union/refs/heads/main/install_union.sh && chmod +x install_union.sh && ./install_union.sh  
```  
```bash  
wget https://raw.githubusercontent.com/coinseyir/union/refs/heads/main/sifre.sh && chmod +x sifre.sh && ./sifre.sh
```  
# Paket ve Sürücü Kurulumu  
```bash  
sudo apt update && sudo apt upgrade -y  
```  

# Gerekli paketleri yükleyin:  
```bash  
sudo apt install curl iptables build-essential git wget jq make gcc nano automake autoconf tmux htop pkg-config libssl-dev tar clang unzip -y  
```  

# Docker’ı yükleyin:  
```bash  
sudo apt update  
sudo apt install docker.io -y  

```  

# Kurulum komutunu girin  
```bash  
sudo su  
cd 
```  

[https://ceremony.union.build/](https://ceremony.union.build/)  
```bash 
mkdir -p ceremony && docker pull ghcr.io/unionlabs/union/mpc-client:v1.2 && docker run -v $(pwd)/ceremony:/ceremony -w /ceremony -p 4919:4919 --rm -it ghcr.io/unionlabs/union/mpc-client:v1.2
```  
