---
title: grep
draft: false
tags:
  - grep
  - linux
---

# grep

**grep** is a UNIX command for text & pattern matching within multiple files. Linux devs love it and so do I!

### Assorted usage examples

#### Find all files of a particular extension, but with grep instead of find, like the fucking little terminal snowflake that I am.

```sh
grep -rl --include="*.java" ''
```

#### Find lines matching two given words

In this particular example, we are looking for variables relating to kernel writeback; useful when you want to know if data is being saved and you could use a little `sync`, and when you wanna be sure that all data is saved to an external device (especially during heavy I/O operations).

```sh
grep -E 'Writeback|Dirty|' /proc/meminfo
```
