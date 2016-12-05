---
layout: page
title: Wiki
description: 人越学越觉得自己无知
keywords: 维基, Wiki
comments: false
menu: 维基
permalink: /wiki/
---

> 汉化文档库

+ [kickstart 汉化文档 - 批量系统安装](https://github.com/octowhale/doc2cn_kickstart/blob/master/README.md)
+ [moosefs 汉化文档 - 分布式文件存储系统](https://github.com/octowhale/doc2cn_moosefs/blob/master/SUMMARY.md) 
+ [openpyxl 汉化文档 - python excel库](https://github.com/octowhale/doc2cn_openpyxl/blob/master/SUMMARY.md) 
+ [docker 汉化文档](https://github.com/octowhale/doc2cn_docker/blob/master/SUMMARY.md)



> 记多少命令和快捷键会让脑袋爆炸呢？

<ul class="listing">
{% for wiki in site.wiki %}
{% if wiki.title != "Wiki Template" %}
<li class="listing-item"><a href="{{ wiki.url }}">{{ wiki.title }}</a></li>
{% endif %}
{% endfor %}
</ul>
