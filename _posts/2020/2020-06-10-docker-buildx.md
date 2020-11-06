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

## 0x01 准备

+ `docker` 开启实验模式
+ `buildx` 插件
+ `qemu` 模拟器
+ `Linux kernel >= 4.8` 

### linux 系统内核

由于 `binfmt_misc` 机制开启需要依赖 `Linux kernel >= 4.8` 。 因此，在对 linux 系统操作选型上有一定要求。

建议使用 **发行版** 出场内核已经满足需求的操作系统。 而不是选择自己升级系统内核。

+ `ubuntu:18.04 LTS` 及以上
+ `debian:10` 及以上

参考文章:
+ [build multi architecture docker image with buildx](https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408)

### 开启实验模式

当前 buildx 还是一个实验模式, 如需要支持, 需要进行如下配置

1. 开启实验模式。 修改 `/etc/docker/daemon.json`, 增加 `experimental` 字段， 如下。

```bash
# vi /etc/docker/daemon.json
{
    "experimental": true
}
```

### 安装 buildx

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

### 安装 `qemu`

下载并安装 `qumu` 到 `/usr/bin/qemu-$(uname -m)-static`

```bash
# https://github.com/multiarch/qemu-user-static#multiarchqemu-user-static-images

QEMU_VERSION=v5.0.0-2

wget -c https://github.com/multiarch/qemu-user-static/releases/download/${QEMU_VERSION}/qemu-$(uname -m)-static -O qemu-$(uname -m)-static \
    && chmod +x qemu-$(uname -m)-static     \
    && mv qemu-$(uname -m)-static /usr/local/bin/qemu-$(uname -m)-static

```


## 0x02 example

### 创建 buildx builder

```bash

## 1. 创建指定名称及指定平台的builder
docker buildx create --use --platform=linux/amd64,linux/arm64 --name localbuilder

### 创建随机名称的 默认参数 builder
# docker buildx create --use
```


### 创建 Dockerfile 和 bakefile

目录结构如下

```bash

# tree
# .
# ├── alpine-bake
# │   └── alpine.Dockerfile
# └── bake.hcl

```

+ `alpine-bake/alpine.Dockerfile`

```Dockerfile
FROM alpine:3.12

ARG TARGETARCH
RUN echo "TARGETARCH is $TARGETARCH"

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

### 使用 `bake` 执行编译

```bash
docker buildx bake -f bake.hcl # -f alias to bake
```

当命令中省略 `-f` 参数时, 默认 bake 文件为:

+ docker-bake.json
+ docker-bake.hcl
+ docker-compose.yaml


#### 执行结果

可以在 [tangx/alpine:buildx-bake-hcl](https://hub.docker.com/repository/docker/tangx/alpine/tags?page=1&name=buildx-bake-hcl) 看到，生成的镜像， 支持了 5个 cpu 架构。

![buildx-bake-demo](/images/post/202006/10/buildx-bake-hcl-demo.png)


+ 执行过程

```bash
# docker buildx bake -f bake.hcl

[+] Building 46.9s (19/19) FINISHED
 => [internal] booting buildkit              3.3s
 => [internal] load build definition from alpine.Dockerfile            0.1s
 => [internal] load .dockerignore            0.1s
 => [linux/arm/v6 internal] load metadata for docker.io/library/alpine:3.12        13.1s
 => [linux/arm64 internal] load metadata for docker.io/library/alpine:3.12         10.4s
 => [linux/amd64 internal] load metadata for docker.io/library/alpine:3.12         13.1s
 => [linux/s390x internal] load metadata for docker.io/library/alpine:3.12         13.1s
 => [linux/arm/v7 internal] load metadata for docker.io/library/alpine:3.12        13.1s
 => [linux/amd64 1/2] FROM docker.io/library/alpine:3.12@sha256:c0e9560cda118f9ec63ddefb4a173a2b2a0347082d7dff7dc14272e7841a5b5a        6.1s
 => [linux/arm/v7 1/2] FROM docker.io/library/alpine:3.12@sha256:c0e9560cda118f9ec63ddefb4a173a2b2a0347082d7dff7dc14272e7841a5b5a       5.9s
 => [linux/arm/v6 1/2] FROM docker.io/library/alpine:3.12@sha256:c0e9560cda118f9ec63ddefb4a173a2b2a0347082d7dff7dc14272e7841a5b5a       6.0s
 => [linux/arm64 1/2] FROM docker.io/library/alpine:3.12@sha256:c0e9560cda118f9ec63ddefb4a173a2b2a0347082d7dff7dc14272e7841a5b5a        6.1s
 => [linux/s390x 1/2] FROM docker.io/library/alpine:3.12@sha256:c0e9560cda118f9ec63ddefb4a173a2b2a0347082d7dff7dc14272e7841a5b5a        6.3s
 => [linux/arm/v7 2/2] RUN echo "TARGETARCH is arm"       0.9s
 => [linux/arm/v6 2/2] RUN echo "TARGETARCH is arm"       0.8s
 => [linux/amd64 2/2] RUN echo "TARGETARCH is amd64"      0.7s
 => [linux/arm64 2/2] RUN echo "TARGETARCH is arm64"      0.5s
 => [linux/s390x 2/2] RUN echo "TARGETARCH is s390x"      0.4s
 => exporting to image         22.9s

```


### 使用命令行执行编译 

```bash
# docker buildx build --platform=linux/amd64,linux/arm64 --file alpine-bake/alpine.Dockerfile --tag tangx/alpine:multi-arch --push alpine-bake/
```

#### 参数解释

+ `docker buildx build` : 主命令及子命令
+ `--platform=linux/amd64,linux/arm64` : 执行 cpu 架构
+ `--file` : 指定 `Dockerfile` 的文件及路径。 省略则表示**当前目录下的 `Dockerfile`** 
+ `--tag` : 镜像名字及TAG
+ `--push` : 完成并推送到仓库
+ `alpine-bake` : docker context 的目录地址。

#### 执行结果

略


## 相关文档

1. `buildx`
    + [buildx README.md](https://github.com/docker/buildx/blob/master/README.md#documentation) in `Github.com`
    + [buildx Documents](https://docs.docker.com/buildx/working-with-buildx/#high-level-build-options) in `docs.docker.com`
2. `buildx bake`
    + [buildx bake hcl variables](https://github.com/docker/buildx/blob/e5217f26e2e4ea6e4d35db95750bf7ff9eb9f188/bake/bake.go#L322:6)
    + [buildx bake hcl examples](https://github.com/docker/buildx/blob/master/README.md#file-definition)
3. `docker`
    + [builder arg](https://docs.docker.com/engine/reference/builder/#arg)
    + [docker manifest](https://docs.docker.com/engine/reference/commandline/manifest/)
    + [docker register v2](https://docs.docker.com/registry/spec/api/)
    + [global platform args](https://docs.docker.com/engine/reference/builder/#automatic-platform-args-in-the-global-scope)


**buildx hcl 支持的变量值**

```go
type Target struct {
	Name string `json:"-" hcl:"name,label"`

	// Inherits is the only field that cannot be overridden with --set
	Inherits []string `json:"inherits,omitempty" hcl:"inherits,optional"`

	Context    *string           `json:"context,omitempty" hcl:"context,optional"`
	Dockerfile *string           `json:"dockerfile,omitempty" hcl:"dockerfile,optional"`
	Args       map[string]string `json:"args,omitempty" hcl:"args,optional"`
	Labels     map[string]string `json:"labels,omitempty" hcl:"labels,optional"`
	Tags       []string          `json:"tags,omitempty" hcl:"tags,optional"`
	CacheFrom  []string          `json:"cache-from,omitempty"  hcl:"cache-from,optional"`
	CacheTo    []string          `json:"cache-to,omitempty"  hcl:"cache-to,optional"`
	Target     *string           `json:"target,omitempty" hcl:"target,optional"`
	Secrets    []string          `json:"secret,omitempty" hcl:"secret,optional"`
	SSH        []string          `json:"ssh,omitempty" hcl:"ssh,optional"`
	Platforms  []string          `json:"platforms,omitempty" hcl:"platforms,optional"`
	Outputs    []string          `json:"output,omitempty" hcl:"output,optional"`
	Pull       *bool             `json:"pull,omitempty" hcl:"pull,optional"`
	NoCache    *bool             `json:"no-cache,omitempty" hcl:"no-cache,optional"`
	// IMPORTANT: if you add more fields here, do not forget to update newOverrides and README.
}
```

## 在 github action 上使用 buildx

> https://github.com/marketplace/actions/customizable-docker-buildx

## troubleshoot

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

参考 [qemu-user-static #getting-started](https://github.com/multiarch/qemu-user-static#getting-started) 执行以下命令。 如果正常返回，则表示成功

```bash
$ uname -m
x86_64

$ docker run --rm -t arm64v8/ubuntu uname -m
standard_init_linux.go:211: exec user process caused "exec format error"

$ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

$ docker run --rm -t arm64v8/ubuntu uname -m
aarch64
```

+ https://github.com/multiarch/qemu-user-static#getting-started
+ https://github.com/docker/buildx/issues/132#issuecomment-521759117

