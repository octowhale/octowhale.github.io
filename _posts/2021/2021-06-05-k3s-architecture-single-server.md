---
layout: post
title: 5分钟k3s - k3s单节点架构介绍与安装卸载管理
categories: [cate1, cate2]
description: k3s单节点架构介绍与安装卸载管理
keywords: k3s架构, k3s安装, k3s卸载
---

# 5分钟k3s - k3s单节点架构介绍与安装卸载管理

## k3s 单 Server 节点架构

K3s 单节点集群的架构如下图所示，该集群有一个内嵌 SQLite 数据库的单节点 K3s server。

在这种配置中，每个 agent 节点都注册到同一个 server 节点。K3s 用户可以通过调用 server 节点上的 K3s API 来操作 Kubernetes 资源。

单节点k3s server的架构

![k3s-single-server](https://docs.rancher.cn/assets/images/k3s-architecture-single-server-42bb3c4899985b4f6d8fd0e2130e3c0e.png)

## Server 安装

## 安装条件

**两个节点不能有相同的主机名**

+ 如果您的所有节点都有相同的主机名，请使用 `--with-node-id` 选项为每个节点添加一个随机后缀，+ 或者为您添加到集群的每个节点设计一个独特的名称，用 `--node-name` 或 `$K3S_NODE_NAME` 传递。


## 安装

```bash
# 通用
curl -sfL https://get.k3s.io | sh -


# 国内安装
curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -

```

执行命令， 不到一分钟集群就安装好了

```log
curl -sfL http://rancher-mirror.cnrancher.com/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -

[INFO]  Finding release for channel stable
[INFO]  Using v1.21.1+k3s1 as release
[INFO]  Downloading hash http://rancher-mirror.cnrancher.com/k3s/v1.21.1-k3s1/sha256sum-amd64.txt
[INFO]  Downloading binary http://rancher-mirror.cnrancher.com/k3s/v1.21.1-k3s1/k3s
[INFO]  Verifying binary download
[INFO]  Installing k3s to /usr/local/bin/k3s
[INFO]  Creating /usr/local/bin/kubectl symlink to k3s
[INFO]  Creating /usr/local/bin/crictl symlink to k3s
[INFO]  Skipping /usr/local/bin/ctr symlink to k3s, command exists in PATH at /usr/bin/ctr
[INFO]  Creating killall script /usr/local/bin/k3s-killall.sh
[INFO]  Creating uninstall script /usr/local/bin/k3s-uninstall.sh
[INFO]  env: Creating environment file /etc/systemd/system/k3s.service.env
[INFO]  systemd: Creating service file /etc/systemd/system/k3s.service
[INFO]  systemd: Enabling k3s unit
[INFO]  systemd: Starting k3s
```

### 使用 kubectl 管理集群

```
kubectl get node
kubectl get pod --all-namespaces
```

执行 kubectl , 毫无切换成本

```bash
# kubectl get node
NAME             STATUS   ROLES                  AGE   VERSION
vm-0-41-ubuntu   Ready    control-plane,master   33s   v1.21.1+k3s1

# kubectl get pod --all-namespaces
NAMESPACE     NAME                                      READY   STATUS              RESTARTS   AGE
kube-system   helm-install-traefik-6pgml                0/1     ContainerCreating   0          26s
kube-system   helm-install-traefik-crd-nxhww            0/1     ContainerCreating   0          26s
kube-system   local-path-provisioner-5ff76fc89d-2zjnn   0/1     ContainerCreating   0          26s
kube-system   metrics-server-86cbb8457f-2nhmb           0/1     ContainerCreating   0          26s
kube-system   coredns-7448499f4d-lplnk                  0/1     ContainerCreating   0          26s
```


## 卸载


```bash
/usr/local/bin/k3s-uninstall.sh

```