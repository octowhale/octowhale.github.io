#!/bin/bash

## 初始化环境变量
# export APP_CONFIG="__App_CDN_URL=https://cdn.example.com;__App_SERVER_API=https://api.example.com;__App_USER=user1"
for val in $(echo $APP_CONFIG | sed 's/;/ /g')
do
{
    # 
    read key value <<< $( echo $val | sed 's/=/ /')
    sed -i "s@$key@$value@" /usr/share/nginx/html/index.html
}
done

## 启动 nginx
exec nginx -g "daemon off;"
