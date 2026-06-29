---
title: Bash pipes
draft: false
tags:
  - bash
  - pipe
---

# Bash pipes

Or whatever they're called.

## `>`, `&>` and `>&` operators

`>` – `file_descriptor > file_name`
`&>` – `&> file_name`
`>&` – `file_descriptor >& file_descriptor`

If the file descriptor is omitted, the default is `0` for stdin, `1` for stdout and `2` for stderr. `&> name` is equivalent to `1>name 2>name`.

Egg samples:

Write a line from `echo` to stderr:
```bash
echo "Error: xclip is not installed." >&2
```
