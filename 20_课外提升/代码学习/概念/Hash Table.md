---
aliases: 
tags:
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220609 09:49
---

# Hash Table

`{key:value, key2:value}`

![[Pasted image 20220607204706.png]]

---

![[Pasted image 20220607205048.png]]

---

![[Pasted image 20220607210728.png]]

---

# [[Big O]]

![[Pasted image 20220609201353.png]]

# Pros and Cons

![[Pasted image 20220609201604.png]]

# Example

![[Pasted image 20220609202007.png]]

**注意，s里面的多个不同的char可以对应t里相同的char**

![[Pasted image 20220609202030.png]]

## [[Python]]

![[Pasted image 20220609202644.png]]

## [[Big O]]

time will be O(n)

space will be O(n) at most

---

# Example 2

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol Value I 1 V 5 X 10 L 50 C 100 D 500 M 1000 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9. X can be placed before L (50) and C (100) to make 40 and 90. C can be placed before D (500) and M (1000) to make 400 and 900. Given a roman numeral, convert it to an integer.

## Solution

先做一个hashmap，I对应1，M对应1000等等

倒着来，如果前面的比后面的小， 则减去前面的，否则就相加

loop through
