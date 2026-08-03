---
title: NeoVim
draft: false
tags:
  - neovim
  - vim
  - linux
---

# NeoVim

Learning NeoVim from scratch, because one error I don't get which interfered with my very trivial attempt to navigate the text file pissed me off not to the extreme, but just enough to make me consider nuking and paving my LazyVim "setup".
As of `03/08/2026` this is mostly about taming the configs.

#### Variables

`vim.uv` – [RTFM, luv.](https://neovim.io/doc/user/lua/#vim.uv); previously `vim.loop`; the event loop.
`vim.fn` – [inbuilt Vimscript functions](https://neovim.io/doc/user/vimfn/)
`vim.v` – Special NeoVim variables or something.
`vim.opt` – Vim/NeoVim's options

#### Stupid tricks

`:help lspconfig-all` -> as per instructions, `<gO/> + gleam + <Enter>` to find specific docs -> "oh no how do I close table of contents" `:lcl` -> "fucking split window what the hell" `:only` to close focused window -> "wait how do i reopen my thing" `:e <thingpath>`

Related: `:split` opens split windows, `<Ctrl> + <w> + [<hjkl and so on>` moves around 'em. Pretty beautifully implemented.
