---
title: Vi/Vim/Neovim(/Nano) Cheatsheet
draft: false
tags:
  - vim
  - neovim
  - term
---

# Vi/Vim/Neovim(/Nano) Cheatsheet

## Emergency FAQ zone:

**Q** :: *"Oh man aw mane, we  are in som troble"*\
**A** :: `<ESC>+qa!+<ENTER>`

**Q** :: *"Aaaa, why cannot I autocomplete file selections in my nooby Neovim setup!?"*\
**A** :: `<CTRL>+<y>`

## General cheatsheet (Vi family)

**Global substitution** :: `<ESC>+:%s/findand/replacewith`[^1]\
**Yank/etc into clipboard** :: `<SHIFT>+<'>+<=>+<y>` / `<">+<=>+<y>`\
**Paste/etc from clipboard** :: `<SHIFT>+<'>+<=>+<p>` / `<">+<=>+<p>`\
**Delete inside two HTML/XML tags** :: `dit`, `<d>+<i>+<t>`\
  e.g.: `<p id="catnet">purge me</p>` -> `<p id="catnet"></p>`

[^1]: Append `/g` if global substitution doesn't work.
