---
title: Linux kernel
draft: false
tags:
  - unix
  - linux
  - kernel
  - osdev
  - EFI
  - efibootmgr
---

# The Linux Kernel

> [!info] docs.kernel.org README
>
> Click the following link for [Linux Docs official README page](https://docs.kernel.org/admin-guide/README.html).\
> Most of information presented in this subchapter is a selective copy-paste or paraphrasing from the above website.

**Linux** is a clone of the operating system **Unix**, written from scratch by Linus Torvalds with assistance from a loosely-knit team of hackers across the Net. It aims towards **POSIX** and Single UNIX Specification compliance.

It has all the features you would expect in a modern fully-fledged **Unix**, including true multitasking, virtual memory, shared libraries, demand loading, shared copy-on-write executables, proper memory management, and multistack networking including IPv4 and IPv6.

It is distributed under the **GNU General Public License v2** - see the accompanying COPYING file for more details.

> [!summary]- Supported hardware
> 
> Linux runs on a variety of **hardware architectures**, including:
> 
> - 32-bit x86-based PCs (386 or higher)
> - Most general-purpose 32- or 64-bit architectures[^1]
> - ARM
> - Linux itself (UML/UserMode Linux)
> - Compaq Alpha AXP
> - Sun SPARC
> - UltraSPARC
> - Motorola 68000
> - PowerPC
> - PowerPC64
> - Hitachi SuperH
> - Cell
> - IBM S/390
> - HP PA-RISC
> - Intel IA-64
> - DEC VAX
> - AMD x86-64 Xtensa
> - ARC

## Compiling the kernel

## Running the kernel

Booting a kernel directly from a storage device without the assistance of a bootloader such as **LILO** or **GRUB**, is ***no longer supported in BIOS (non-EFI systems)***. On **UEFI/EFI** systems, however, you can use **EFISTUB** which allows the motherboard to boot directly to the kernel. On modern workstations and desktops, it’s generally recommended to use a **bootloader** as difficulties can arise with multiple kernels and secure boot. For more details on **EFISTUB**, see [“The EFI Boot Stub”](https://docs.kernel.org/admin-guide/efi-stub.html) or the [Arch Linux Wiki page on EFI boot stub](https://docs.kernel.org/admin-guide/efi-stub.html).

### EFI boot stub

An **EFI boot stub** AKA **EFI stub** is a kernel that is an **EFI executable**, i.e. that can be directly booted from the UEFI.\
An example with **LTS Linux kernel**, **NVMe storage and BTRFS filesystem** with specific subvolume and hibernation on a **swap partition**: 

```sh
efibootmgr --create \
 --disk /dev/nvme0n1 --part 1 \
 --label "EFISTUB Arch" \
 --loader /vmlinuz-linux-lts \
 --unicode 'root=UUID=01a40dd8-28f0-4636-be1e-aeed60c98095 resume=UUID=2d877d5d-4ca1-4d46-a3d6-b6ee94cbbd78 rw rootflags=subvol=@ loglevel=3 quiet initrd=\initramfs-linux-lts.img'
```

[^1]: Provided they support PMMU (paged memory management unit) and gcc GNU C compiler.
