---
aliases: 
tags: 学习/计算机
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220502 05:09
---

# Memory Mangements

![[Pasted image 20220501223256.png]]

---

## [[Heap]]

>In certain programming languages including [C](https://www.techtarget.com/searchwindowsserver/definition/C) and [Pascal](https://www.techtarget.com/whatis/definition/Pascal) , a [[heap]] is an area of pre-reserved computer [main storage](https://www.techtarget.com/searchstorage/definition/primary-storage) ( [memory](https://www.techtarget.com/searchstorage/definition/memory-card) ) that a program [process](https://www.techtarget.com/whatis/definition/process) can use to store data in some variable amount that won't be known until the program is running.

>[在包括C](https://www.techtarget.com/searchwindowsserver/definition/C)和[Pascal](https://www.techtarget.com/whatis/definition/Pascal)在内的某些编程语言中，堆是预先保留的计算机[主存储](https://www.techtarget.com/searchstorage/definition/primary-storage)（[内存](https://www.techtarget.com/searchstorage/definition/memory-card)）区域，程序[进程](https://www.techtarget.com/whatis/definition/process)可以使用它来存储在程序运行之前不知道的可变数量的数据。

---

# `new` and `delete` Operators

https://docs.microsoft.com/en-us/cpp/cpp/new-and-delete-operators?view=msvc-170

>C++支持使用new和delete操作符对对象进行动态分配和取消分配。这些操作符从一个叫做free store的池中为对象分配内存。新操作符调用特殊函数操作符new，而删除操作符调用特殊函数操作符delete。

---

## Manual Memory Management and GC

### GC

>The basic principles of garbage collection are to find data objects in a program that cannot be accessed in the future, and to reclaim the resources used by those objects.

>https://en.wikipedia.org/wiki/Garbage_collection_(computer_science)#:~:text=In%20computer%20science%2C%20garbage%20collection,longer%20referenced%E2%80%94also%20called%20garbage.

#### Straight Forward

![[20220420CMPSC461Class40]]

poor real-time performance

#### Reference Counting

`q=p`
使得两个item都指向同一个value，即可删除多余的(之前的q)

---
