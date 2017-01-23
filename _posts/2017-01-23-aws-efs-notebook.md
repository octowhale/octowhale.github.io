---
layout: post
title: AWS EFS 使用笔记
categories: [aws]
description: "AWS EFS 使用笔记"
keywords: aws, nfs
---

# AWS EFS 使用笔记


```bash
# 安装 nfs utils 组件
# On an Amazon Linux, Red Hat Enterprise Linux, or SuSE Linux instance:
sudo yum install -y nfs-utils
# On an Ubuntu instance:
#sudo apt-get install nfs-common
```

## iptables 与 sg 设置

mount 的时候注意防火墙 或 security group 的设置
EFS 使用了防火墙，需要将 EFS 所在的 SG 允许中设置允许访问来源。

+ portmap 端口 111 udp/tcp；
+ nfsd 端口 2049 udp/tcp；
+ mountd 端口 "xxx" udp/tcp

> 通常设置允许某 security group.


## 挂载
### 使用域名挂载

```bash
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $EFS_DOMAIN:/ $MOUNT_POINT
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 fs-55xxxxfc.efs.us-west-2.amazonaws.com:/ /usr/share/nginx/html
```

### 使用 IP 地址挂载

```bash
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $EFS_IPADDR_IN_AZ:/ $MOUNT_POINT
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 172.xx.xxx.251:/ efs
```


## 遗留问题
+ mount efs 后， nginx 提示 403 Forbidden
