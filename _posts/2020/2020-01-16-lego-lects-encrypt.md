---
layout: post
title: 使用 lego 申请 let's encrypt 证书
categories: [tls, nginx]
description: 使用 lego 申请 let's encrypt 证书
keywords: tls
---

# 使用 lego 申请 let's encrypt 证书

`lego` 是用来申请 `let's encrypt` 免费证书的, 现在支持多种验证方式。

以下是使用 `alidns` 解析验证。

```bash
#!/bin/bash
#
# lego-letsencrypt.sh
#

cd $(dirname $0)

DOMAIN="*.example.com"
EMAIL="your@email.com"
export ALICLOUD_ACCESS_KEY=LTAxxxxxx
export ALICLOUD_SECRET_KEY=yyyyyyyyyyyyyyyyy

function run()
{

    lego --email="${EMAIL}" \
        --domains="${DOMAIN}" \
        --path=$(pwd) --dns alidns --accept-tos run
}

function renew()
{
    lego --email="${EMAIL}" \
        --domains="${DOMAIN}" \
        --path=$(pwd) --dns alidns --accept-tos renew
}

function _usage()
{
    echo "$0 run|renew"
    exit 1
}
case $1 in 
run|renew) $1 ;;
*) _usage ;;
esac
```
