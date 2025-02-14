---
title: Vim cheatsheet
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

**Q** :: *"What!! WHate !! WHAET!!! How do I . SUBSTITUTE !!! GLOBALLY !!!1111"*\
**A** :: `<ESC>+:%s/ReplaceMe/WithThis/+<ENTER>`

## General cheatsheet (Vi family)

**Global substitution** :: `<ESC>+:%s/findand/replacewith`[^1]\
**Yank/etc into clipboard** :: `<SHIFT>+<'>+<=>+<y>` / `<">+<=>+<y>`\
**Paste/etc from clipboard** :: `<SHIFT>+<'>+<=>+<p>` / `<">+<=>+<p>`\
**Delete inside two HTML/XML tags** :: `dit`, `<d>+<i>+<t>`\
  e.g.: `<p id="catnet">purge me</p>` -> `<p id="catnet"></p>`\
**Go to first line** :: `<g>+<g>`\
**Go to beginning of current line** :: `<0>`\
**Go to beginning of current line** :: `<$>` / `<SHIFT>+<4>`\
**Append arbitrary identical characters in an arbitrary vertical line**:

`<CTRL>+<v>` -> `<j>` or `<k>` as much as needed -> `<I>` / `<SHIFT>+<i>` -> type your arbitrary character collection! -> `<ESC>`

> [!example] Example
> 
> ### Before edit:
> ```md
> The key sequence:
> 
> `0<Ctrl>v1jI> <Esc>`
> ```
>
> ### The key sequence:
> 
> `0<Ctrl>v2jI> <Esc>`
> 
> ### After edit:
> ```markdown
> > The key sequence:
> > 
> > `0<Ctrl>v1jI> <Esc>`
> ```


[^1]: Append `/g` if global substitution doesn't work.
