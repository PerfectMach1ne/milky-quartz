---
title: cURL cheatsheet
draft: false
tags:
  - curl
  - networking
  - term
---

# cURL cheatsheet

Use a custom loopback interface (e.g. 127.1.2.3):
```sh
curl --interface 127.1.2.3 -v http://127.57.57.57:8057/
```

![Example screenshot](./img/curl-interface.png)
