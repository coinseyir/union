**# Kurulum**

```curl -O https://raw.githubusercontent.com/coinseyir/union/refs/heads/main/install_union.sh && chmod +x install_union.sh && ./install_union.sh  ```

**#Paket ve Sürücü Kurulumu**

``` sudo apt update && sudo apt upgrade -y ```

**#Gerekli paketleri yükleyin:**

```sudo apt install curl iptables build-essential git wget jq make gcc nano automake autoconf tmux htop pkg-config libssl-dev tar clang unzip -y```
**#Docker’ı yükleyin:**

```sudo apt update```
```sudo apt install docker.io -y ```

**#Kurulum komutunu girin**

```sudo su```
```cd```
```mkdir -p ceremony && docker pull ghcr.io/unionlabs/union/mpc-client:latest && docker run -v $(pwd)/ceremony:/ceremony -w /ceremony -p 4919:4919 --rm -it ghcr.io/unionlabs/union/mpc-client:latest```

```https://ceremony.union.build/```
