---
layout: post
title: k8s 部署工具 kustomize 的实用小技巧
categories: [k8s, tools]
description: 巧用 kustomize 实现 patch ， 实现快速定制化部署
keywords: keyword1, keyword2
---

# k8s 部署工具 kustomize 的实用小技巧

`kustomize`, 完全一款 k8s 部署工具届 *嫁衣神功* ， 偷懒神器。

关于 kustomize 的介绍文章很多就不赘述了。 

这里主要将一下笔者日常实用中的几个小技巧。

对于一个完整的组件 如 **ELK**， **LOKI** ， 不经没有必要重新维护一套部署文档， 也不一定有精力这样做。 最主要的是， 不一定有官方支持的写的好。 

在实际使用中， 组件在一个大版本下的部署方式并不会有太大的变化。 因此完全可以直接使用 helm 生成模版， 并使用 kustomize 进行定制化的替换。

个人觉得， **使用 kustomize 替换在使用和管理上，比直接使用 helm 参数更为清晰** 。

本文有大量代码和配置， demo 文件已经放在 Github: https://github.com/tangx/kusutomize-usage-tips-demo

更多 API 细节， 参考官方文档: https://kubectl.docs.kubernetes.io/references/kustomize/

## 准备

本文实践基于 `kubectl v1.19.3` 

```bash
kubectl version --client=true
Major:"1", Minor:"19", GitVersion:"v1.19.3", 
```

**文件结构目录**

```bash
tree .
.
├── Makefile
├── bases
│   ├── dep.yml
│   ├── kustomization.yaml
│   └── svc.yml
└── overlays
    └── online
        ├── configs
        │   └── app.conf
        ├── kustomization.yaml
        └── patches
            └── dep.yml

5 directories, 7 files
```

## 最主要的几个工具

### bases

`bases`: 模版引用， 他人结果原始文档， helm 渲染结果。

1. **注意**: 虽然官方 api 上说 `bases` 是即将被废弃的接口。 但到 `kubectl 1.19.3` 为止， **引用`只能`使用 bases**。

```yaml
# kustomization.yaml

bases:
  - ../../bases
```

### patch

`patch`: 打补丁， 替换已有配置， 或新增配置

1. **注意**: 由于需要锚定被 patch 的对象， 因此 patch 文件 的 yaml 树结构与需要被管理的一致。
2. **建议**: 使用 `patchesStrategicMerge` , 使用文件描述， 因此需要变更的结果最直观。


```yaml
# kustomization.yaml
patchesStrategicMerge:
  - patches/dep.yml
```


```yaml
# patches/dep.yml
--- 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-demo
spec:
  replicas: 3
  template:
    spec:
      containers:
      - name: nginx
        resources:
          limits:
            cpu: 1
            memory: 1Gi
      nodeSelector:
        node-env: online

```

### image

`image`: 镜像替换。 使用本地镜像或加速镜像镜像仓库。 
 
1. **tips** : 与 patch 结合 **套娃** 最好用。


```yaml
# kustomization.yaml

images:
  - name: tangx/nginx
    newName: cr.aliyun.com/nginx
    newTag: latest
```

### generate

`generator`: 渲染工具， secret 和 configmap 使用方式一致

1. `secretGenerator` : 渲染 secret 对象
2. `configMapGenerator`: 渲染 configmap 对象
3. `generatorOptions` : 渲染规则


```yaml
# kustomization.yaml

generatorOptions:
  disableNameSuffixHash: true

secretGenerator:
  - name: app-secret
    files:
      - app.cfg=configs/app.conf
      - configs/app.conf
  - name: mysql-secret
    literals:
      - MYSQL_PASSWD=root123
      
configMapGenerator:
  - name: app-config
    files:
      - app.cfg=configs/app.conf
      - configs/app.conf
```

