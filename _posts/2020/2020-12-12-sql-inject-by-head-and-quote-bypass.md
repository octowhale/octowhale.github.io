---
layout: post
title: SQL注入之 head 注入与引号绕过
categories: [安全, SQL注入]
description: SQL注入之 head 注入与引号绕过
keywords: SQL注入
---

# SQL注入之 head 注入与引号绕过

Content here

**burpsuite repeat**

```
POST /Pass-07/index.php HTTP/1.1
Host: injectx1.lab.aqlab.cn:81
Content-Length: 51
Cache-Control: max-age=0
Origin: http://injectx1.lab.aqlab.cn:81
Upgrade-Insecure-Requests: 1
DNT: 1
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Referer: http://injectx1.lab.aqlab.cn:81/Pass-07/index.php
Accept-Encoding: gzip, deflate
Accept-Language: zh,en-US;q=0.9,en;q=0.8,zh-CN;q=0.7
Connection: close

username=123&password=123&submit=%E7%99%BB%E5%BD%95
```
