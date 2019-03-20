---
layout: post
title: golang-user-regex-group
categories: [golang]
description: golang 正则表达式替换时使用 regex group
keywords: golang
---

# golang 使用 regex group 的值

与常用的语言正则不同， golang 使用 `$1` 表示 `regex group`。 而类似 `sed, python` 中常用的是 `\1`

+ golang [playgroud](https://play.golang.org/p/eBsJMyv-25z)

```golang

package main

import (
	"fmt"
	"regexp"
)

func main() {
	re := regexp.MustCompile(`([A-Z])`)
	s := re.ReplaceAllString("UserCreate", ".$1")
	fmt.Println(s) // .User.Create

}

// https://stackoverflow.com/questions/43586091/how-golang-replace-string-by-regex-group
```

+ python

```python
import re
name = re.sub(r'([A-Z])', r'.\1', "UserCreate")
print(name) # .User.Create

```