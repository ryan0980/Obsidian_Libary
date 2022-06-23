---
aliases: 
tags:
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220514 03:37
---

# Heap

https://leetcode.com/explore/featured/card/heap/643/heap/4018/

Priority Queue

A priority queue is an abstract data type, while a Heap is a data structure

Therefore, a Heap is not a Priority Queue, but a way to implement a Priority Queue.

## **Heap**

- Is a **complete binary tree**
- The value of each node must be **no greater than (or no less than)** the value of its child nodes

## 有两种Heap

**Max Heap** and **Min Heap**

![[Pasted image 20220514014520.png]]

## Insertion

1. 确定是complete binary tree
2. 确定之前的heap符合max或者min

把新元素加在heap的底端，逐渐上浮

## Deletion

1. 确定是complete binary tree
2. 确定之前的heap符合max或者min

将底端的元素取代顶端的，然后删除底端，再逐渐下浮
