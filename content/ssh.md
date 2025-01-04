---
title: SSH
draft: false
tags:
  - ssh
  - linux
  - term
---

# OpenSSH (Secure Shell)

OpenSSH is a collection of tools, here's a brief overview of them all:

- `ssh` - "**S**ecure **Sh**ell", the command that allows a secure tunnel for a shell connection to some other device.
- `sshd` - The **OpenSSH daemon**, which allows SSH connections to be made to the device running it.

## `ssh`

## `sshd`

Not installed by default on Linux Mint.

```sh
sudo apt install openssh-server
```

### `/etc/ssh/sshd_config`

The `sshd` server system-wide configuration file. It has a manpage.

