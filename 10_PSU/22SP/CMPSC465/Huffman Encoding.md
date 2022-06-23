---
aliases: 
tags: 学习/计算机
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220504 02:04
---

# Huffman Encoding

>https://www.youtube.com/watch?v=dM6us854Jk0

Huffman coding is a lossless data compression algorithm

本来是给每个Character分配一个code

## Past

![[Pasted image 20220504014037.png]]

## Algorithm

找到frequency最小的两个node

![[Pasted image 20220504014310.png]]

![[Pasted image 20220504020107.png]]

这里12，13独立是因为18比这两个都大，15会偏向2个sub tree中较小的一个

![[Pasted image 20220504020430.png]]
