The FUSE driver is a prerequisite for rclone mounting and should be installed on host:
```
sudo apt-get -y install fuse
```

Create two directories required by rclone docker plugin:
```
sudo mkdir -p /var/lib/docker-plugins/rclone/config
sudo mkdir -p /var/lib/docker-plugins/rclone/cache
```

Install the managed rclone docker plugin for your architecture (here amd64):
```
docker plugin install rclone/docker-volume-rclone:amd64 args="-v" --alias rclone --grant-all-permissions
docker plugin list
```

Refer: `https://github.com/rclone/rclone/blob/master/docs/content/docker.md`

---
Mount Volumes
```
sudo docker volume create ggdrive  -d rclone -o remote=GDrive~ 
```