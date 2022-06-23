---
aliases: 
tags: 学习/计算机
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220503 08:33
---

# Prim's Algorithm

>https://www.youtube.com/watch?v=cplfcGZmX7I

Minimum Spanning Tree

创建一个empty list

随机选一个点加入list，然后依次加入距离任意已经访问点的最近的点（不形成cycle）
![[Pasted image 20220503203218.png]]

By this algorithm, MST will be unique

![[Pasted image 20220503203229.png]]

Time complexity

![[Pasted image 20220503203241.png]]

![[Pasted image 20220503203250.png]]
