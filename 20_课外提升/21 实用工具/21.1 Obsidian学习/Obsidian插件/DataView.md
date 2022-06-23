---
aliases: 
tags:
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220623 02:29
---

# DataView

可以查询YMAL和元数据（包括文件生成，修改日期等）
但如果文件名更改，无法跟着变动 ^49305a
显示方式包括list， table， field1， 2等
可以通过 tab，文件夹 或者link
可以二次过滤
可以排序，asc、desc ^5caecf

>https://blacksmithgu.github.io/obsidian-dataview/

## Implicit Fields

Dataview automatically adds a large amount of metadata to each page:

- `file.name`: The file title (a string).
- `file.folder`: The path of the folder this file belongs to.
- `file.path`: The full file path (a string).
- `file.ext`: The extension of the file type; generally '.md' (a string).
- `file.link`: A link to the file (a link).
- `file.size`: The size (in bytes) of the file (a number).
- `file.ctime`: The date that the file was created (a date + time).
- `file.cday`: The date that the file was created (just a date).
- `file.mtime`: The date that the file was last modified (a date + time).
- `file.mday`: The date that the file was last modified (just a date).
- `file.tags`: An array of all unique tags in the note. Subtags are broken down by each level, so `#Tag/1/A` will be stored in the array as `[#Tag, #Tag/1, #Tag/1/A]`.
- `file.etags`: An array of all explicit tags in the note; unlike `file.tags`, does not include subtags.
- `file.inlinks`: An array of all incoming links to this file.
- `file.outlinks`: An array of all outgoing links from this file.
- `file.aliases`: An array of all aliases for the note.
- `file.tasks`: An array of all tasks (I.e., `- [ ] blah blah blah`) in this file.
- `file.lists`: An array of all list elements in the file (including tasks); these elements are effectively tasks and can be rendered in task views.
- `file.frontmatter`: Contains the raw values of all frontmatter; mainly useful for checking raw frontmatter values or for dynamically listing frontmatter keys.

If the file has a date inside its title (of form `yyyy-mm-dd` or `yyyymmdd`), or has a `Date` field/inline field, it also has the following attributes:

- `file.day`: An explicit date associated with the file.

If you use the Obsidian default "Starred Files" plugin, the following metadata is also available:

- `file.starred`: If this file has been starred by the "stars" Obsidian plugin.

## 测试

```dataview
table rating, file.size as 文件大小
from "30_Past/34_Past_Videos/34.1_Past_Movies"
SORT rating desc
```

---

```dataview
list
from "01_Personal_Info"
```

```dataview
table
from "40_Planning/44_影视计划/44.1_电影计划"
```

---

![[Dataview_github_readme]]
