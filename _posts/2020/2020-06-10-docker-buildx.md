---
layout: post
title: 使用 docker buildx 实现多平台编译
categories: [docker]

description: 使用 docker buildx 实现多平台编译
keywords: keyword1, keyword2
---

# 使用 docker buildx 实现多平台编译

[`docker registry api v2`](https://docs.docker.com/registry/spec/api/) 支持多 CPU 架构镜像.

同时  `harbor v2` 也实现了 `docker registry api v2` 的支持.

# docker buildx

当前 buildx 还是一个实验模式, 如需要支持, 需要进行如下配置

1. `experimental` 监控模式

```bash
# vi ~/docker/daemon.json
{
    "experimental": true
}


```

1. 将 `buildx` 放到 `~/.docker/cli-plugins/` 目录下

```bash
# https://github.com/docker/buildx/blob/master/README.md#docker-ce


BUILDX_VERSION=v0.4.1

ARCH=$(uname -m)
[ "${ARCH}" == "x86_64" ] && ARCH=amd64
[ "${ARCH}" == "aarch64" ] && ARCH=arm64

mkdir -p ~/.docker/cli-plugins
wget -c https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-${ARCH} -O docker-buildx\
    && chmod +x docker-buildx   \
    && mv docker-buildx ~/.docker/cli-plugins/
```

2. 安装 `quem` 到 `/usr/bin/qemu-$(uname -m)-static`

```bash
# https://github.com/multiarch/qemu-user-static#multiarchqemu-user-static-images

QEMU_VERSION=v5.0.0-2

wget -c https://github.com/multiarch/qemu-user-static/releases/download/${QEMU_VERSION}/qemu-$(uname -m)-static -O qemu-$(uname -m)-static \
    && chmod +x qemu-$(uname -m)-static     \
    && mv qemu-$(uname -m)-static /usr/local/bin/qemu-$(uname -m)-static

```

## compile

```bash

# tree
# .
# ├── alpine-bake
# │   └── alpine.Dockerfile
# └── bake.hcl

# 1. create build
docker buildx create --use

# 2. compile
## way1
docker buildx build --platform=linux/amd64,linux/arm64
## way2
docker buildx bake # default hcl file: docker-bake.json, docker-bake.hcl , docker-compose.yaml
docker buildx bake -f bake.hcl # -f alias to bake
docker buildx bake -f docker-compose.yml

```

+ `docker-bake.hcl`

```hcl
group "default" {
	targets = ["alpine"]
}

target "alpine" {
    context = "./alpine-bake"
    dockerfile = "alpine.Dockerfile"
    tags = ["docker.io/tangx/alpine:buildx-bake-hcl"]
    platforms = ["linux/amd64", "linux/arm64", "linux/arm/v6", "linux/arm/v7", "linux/s390x"]
    ## push to registry
    output = ["type=registry"]
    ## pull base image always
    pull = true
}


target "debian" {
    context = "./debian-bake"
    ## default: Dockerfile
    # dockerfile = "Dockerfile"  
    tags = ["docker.io/tangx/debian:buildx-bake-hcl"]

    platforms = ["linux/amd64", "linux/arm64", "linux/arm/v6", "linux/arm/v7", "linux/s390x"]

    ## push to registry
    output = ["type=registry"]
    ## pull base image always
    pull = true
}

```



## 相关文档

1. `buildx`
    + [buildx README.md](https://github.com/docker/buildx/blob/master/README.md#documentation) in `Github.com`
    + [buildx Documents](https://docs.docker.com/buildx/working-with-buildx/#high-level-build-options) in `docs.docker.com`
2. `buildx bake`
    + [buildx bake hcl variables](https://github.com/docker/buildx/blob/e5217f26e2e4ea6e4d35db95750bf7ff9eb9f188/bake/bake.go#L322:6)
    + [buildx bake hcl examples](https://github.com/docker/buildx/blob/master/README.md#file-definition)


## 在 github action 上使用 buildx

> https://github.com/marketplace/actions/customizable-docker-buildx

## debug

1. `multiple platforms feature is currently not supported for docker driver`

当前模式不支持 buildx : https://github.com/docker/cli/blob/master/experimental/README.md

```bash
# 开始实验模式 
# ~/docker/daemon.json
{
    "experimental": true
}

# docker version -f '{{.Server.Experimental}}'
## true
```

2. `auto-push is currently not implemented for docker driver`

缺少 builder

```bash
# 创建一个 builder 
docker buildx create --use # a random name

docker buildx create --user --name specified_name # specified name

```

2. `failed to solve: rpc error: code = Unknown desc = failed to load LLB: runtime execution on platform linux/arm64 not supported`

```bash
## https://github.com/multiarch/qemu-user-static#getting-started

# >> https://github.com/docker/buildx/issues/132#issuecomment-521759117



```


