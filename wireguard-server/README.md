1.Cài đặt Docker và Docker-Compose
```bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
newgrp docker
```
2.Tạo một docker-compose file
Đầu tiên, Tạo một thư mục **/opt/wireguard-server** và file **docker-compose.yaml** mới trong thư mục này.
```bash
    mkdir /opt/wireguard-server
    nano /opt/wireguard-server/docker-compose.yaml
```

3.Thiết lập WireGuard Server
Chúng ta khởi động bằng command sau:
```bash
    cd /opt/wireguard-server
    docker-compose up -d
```
4.Phân phối tạo các file config đến client
Tất cả file config được lưu trữ tại **/opt/wireguard-server/config**. Chúng ta cần copy file **peer1/peer1.conf** cho client và đổi tên thành **wg0.conf** để kết nối với server. Nếu muốn kết nối với QR code chúng ta dùng command sau để in command lên terminal.
```bash
    docker exec -it wireguard /app/show-peer <peer-number>
```
5. Thêm nhiều config cho client
Trong file docker-compose ta điều chỉnh lại thông số  **PEERS=2** và restart lại container
```bash
    docker-compose up -d --force-recreate
```