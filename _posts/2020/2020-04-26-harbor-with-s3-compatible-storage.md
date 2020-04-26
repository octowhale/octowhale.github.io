---
layout: post
title: harbor 使用 s3v4 兼容模式对象存储保存数据
categories: [s3, docker]
description: harbor 使用 s3v4 兼容模式对象存储保存数据。
keywords: s3, harbor, docker
---

# harbor使用 s3v4 兼容模式的对象存储数据

`harbor v1.9.4` 测试通过


```yaml
# The default data volume
data_volume: /data

# Harbor Storage settings by default is using /data dir on local filesystem
# Uncomment storage_service setting If you want to using external storage
# storage_service:
#   # ca_bundle is the path to the custom root ca certificate, which will be injected into the truststore
#   # of registry's and chart repository's containers.  This is usually needed when the user hosts a internal storage with self signed certificate.
#   ca_bundle:

#   # storage backend, default is filesystem, options include filesystem, azure, gcs, s3, swift and oss
#   # for more info about this configuration please refer https://docs.docker.com/registry/configuration/
#   filesystem:
#     maxthreads: 100
#   # set disable to true when you want to disable registry redirect
#   redirect:
#     disabled: false

storage_service:
  s3:
    accesskey: ACID_XXXXXXXXXXXXXXX
    secretkey: ACKEY_YYYYYYYYYYYYYYY
    region: pek3b
    regionendpoint: https://s3.pek3b.qingstor.com
    bucket: harbor
    encrypt: true
    # keyid: mykeyid
    secure: true
    v4auth: true
    chunksize: 5242880
    multipartcopychunksize: 33554432
    multipartcopymaxconcurrency: 100
    multipartcopythresholdsize: 33554432
    rootdirectory: /your/path/to/storage
```