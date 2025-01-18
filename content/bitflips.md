---
title: Bitflips
draft: false
tags:
  - bitflip
  - RAM
  - memory
  - errors
  - btrfs
  - unix
  - linux
  - kernel
  - osdev
---

# Bitflips

Bitflip is a kind of memory error that is an unintentional state switch from 0 to 1 or vice versa. Typically it affects random access memory.

## Diagnosing bitflips

In this [Btrfs LKML 2025-01 thread](https://lore.kernel.org/linux-btrfs/adf490d379b1970b8cbac849f98b92247d7f1cbb.camel@gmail.com/T/#t), an Arch Linux user reported issues with their filesystem, sharing `dmesg` logs of Btrfs errors regarding leaf corruption, resulting in their filesystem going **read-only**:

```sh
[  +0.000001] BTRFS critical (device nvme0n1p2): corrupt leaf: block=3279774253056 slot=66 extent bytenr=3148007481344 len=8192 invalid extent refs, have 1 expect >= inline 513
[  +0.000005] BTRFS info (device nvme0n1p2): leaf 3279774253056 gen 381142 total ptrs 198 free space 1189 owner 2
...
[  +0.000002] BTRFS error (device nvme0n1p2): block=3279774253056 write time tree block corruption detected
[  +0.007065] BTRFS: error (device nvme0n1p2) in btrfs_commit_transaction:2523: errno=-5 IO failure (Error while writing out transaction)
[  +0.000004] BTRFS info (device nvme0n1p2 state E): forced readonly
```

One of Btrfs maintainers Qu Wenruo quickly identified it as a faulty hardware issue by looking for obvious bit flips.\
Consider the following `dmesg` log excerpt:

```sh
[  +0.000001] 	item 66 key (3148007481344 168 8192) itemoff 13022 itemsize 53
[  +0.000001] 		extent refs 1 gen 380990 flags 1
[  +0.000001] 		ref#0: extent data backref root 260 objectid 68965 offset 407224320 count 513
```

Quoting Qu:

> This is the offending bad extent item.
> 
> Firstly it shows the extent item should have only 1 ref ("extent refs 1").\
> But the inlined one has ref count 513, completely beyond the expected 1 ref.
> 
> **hex(513) = 0x201**\
> **hex(1)   = 0x001**
> 
> Very obvious bitflip.
