---
title: robots.txt
draft: false
tags:
  - robots.txt
  - sitemap.xml
  - web-scraping
  - web-crawling
---

# robots.txt

A semi-informal standard made by Google to tell webscraping robots (provided they are polite; some aren't) to fuck off.\
See official [Google documentation here](https://developers.google.com/search/docs/crawling-indexing/robots/intro).

**All `robots.txt` files should be encoded in UTF-8.**

Example `robots.txt` file:

```http
User-agent: Googlebot
Disallow: /nogooglebot/

User-agent: *
Allow: /

Sitemap: https://www.example.com/sitemap.xml
```

# sitemap.xml
