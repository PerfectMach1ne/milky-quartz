---
title: find
draft: false
tags:
  - find
  - linux
---

# find

**find** is a UNIX command for file search. It has many extra toy features that let you execute various other commands on files returned on search.

### Assorted usage examples


#### Find all files in current working directory such that:
- All filepaths matching the "*python3.12" expression are pruned (ignored)
- The righthand expression of "-o" AKA "-or" is evaluated, that is:
- Only search for files with .py extension.
In other words, find me all Python files without the environment. 'bit stupid, I could just do `find . -I "python3.12" -name "*.py"` to ignore the env folder, but you never know + it's still a helpful construct to know.

```sh
find . -path "*python3.12" -o -name "*.py"
```

#### Grep through all code files
You can chain `-exec`'s with the help of `\;` expression.\
`-print0` prints the full file name to stdout followed by a NULL character instead of a newline.

```sh
find . -name "*.java" -print0 -exec echo {} \; -exec grep url {} \;
```

![Example usage of `find -exec` with `echo` and `grep`](./img/findexecgrep.png)

#### Resolve the full path of found files (and optionally nuke them)

```sh
find . -name "index.html" -exec realpath {} +
find . -name "index.html" -exec realpath {} \; -exec rm {} \;
```

> [!hint]
>
> When trying to just delete resolved files, literally just `-exec` `rm` and that'll suffice:
> 
> ```sh
> find . -name "TaskEvent.java" -exec rm {} +
> ```

#### Delete all matched files, but search no further than 'level 1 subdirectories' 
```sh
find . -maxdepth 1 -name "*bash_history*" -exec rm {} +
```

> [!help]
>
> Extra info on manipulating with search depths from `find` manual:
> ```
>  -maxdepth levels
>         Descend at most levels (a non-negative integer) levels of  directories  below
>         the  starting-points.   Using  -maxdepth 0 means only apply the tests and ac‐
>         tions to the starting-points themselves.
>
>  -mindepth levels
>         Do not apply any tests or actions at levels less than levels (a  non-negative
>         integer).   Using  -mindepth 1  means  process all files except the starting-
>         points.
> ```

