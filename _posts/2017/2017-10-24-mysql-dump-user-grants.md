---
layout: post
title: "MYSQL 导出用户权限脚本"
categories: [mysql]
description: "MYSQL 导出用户权限脚本"
keywords: mysql
---

# MYSQL 导出用户权限脚本

```bash
#!/bin/bash  
#Function export user privileges 
source /etc/profile
pwd=your_password  

MYSQL_AUTH=" -uroot -p${pwd} -h127.0.0.1 --port=3306 "
expgrants()  
{  
  mysql -B ${MYSQL_AUTH} -N $@ -e "SELECT CONCAT('SHOW GRANTS FOR ''', user, '''@''', host, ''';') AS query FROM mysql.user" | mysql ${MYSQL_AUTH} $@ | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/-- \1 /;/--/{x;p;x;}'  
} 
expgrants > ./grants.sql

```
