---
layout: page
title: About
description: 
keywords: 
comments: true
menu: 关于
permalink: /about/
---

我是唐鑫，一个成都小伙。
正为成为 1% 而努力。

## 联系

* GitHub：[@octowhale](https://github.com/octowhale)
* 博客：[tangx.in](http://tangx.in) 
+ 准备下线的：[博客](http://www.uyinn.com)

## Skill Keywords

#### Software Engineer Keywords
<div class="btn-inline">
    {% for keyword in site.skill_software_keywords %}
    <button class="btn btn-outline" type="button">{{ keyword }}</button>
    {% endfor %}
</div>

#### Mobile Developer Keywords
<div class="btn-inline">
    {% for keyword in site.skill_mobile_app_keywords %}
    <button class="btn btn-outline" type="button">{{ keyword }}</button>
    {% endfor %}
</div>

#### Windows Developer Keywords
<div class="btn-inline">
    {% for keyword in site.skill_windows_keywords %}
    <button class="btn btn-outline" type="button">{{ keyword }}</button>
    {% endfor %}
</div>
