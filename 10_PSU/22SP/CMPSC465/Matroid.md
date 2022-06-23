---
aliases: 
tags: 学习/计算机
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220504 02:56
---

# Matroid

>https://www.youtube.com/watch?v=fdjvPRyJkVo
>https://liyanxu.blog/2018/10/18/greedy-algorithm-matroid/

## 3 Property

U is ground set

And I is a set of independent subset of U

I 有3个特性

- empty set is an element of I ( empty set is an independent set)
- I 中的A 和 B， 如果A 是 subset of B， B 是 independent set， A也是 (every subset of B is independent /subset 继承了independent property)
- Augmentation: A, B 对 I independent， A 比 B 大， 那么A 中的某些元素 与B合并后依旧对 I independent.

![[Pasted image 20220504024500.png]]

---

![[Pasted image 20220504024937.png]]

第三条最关键，比如下图，将绿色edge加入B后依旧成立
![[Pasted image 20220504025257.png]]

---

## Algorthim

start with a empty set, check if we can find the heavese element to still keep independent and add to set, reprete till can't

Greedy algorthim 

Problem specific: 需要知道这两步的time

![[Pasted image 20220504025858.png]]