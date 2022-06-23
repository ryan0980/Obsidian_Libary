---
aliases: 
tags: 学习/计算机
author: tusrau
date created: '{{date:YYYYMMDD HH:mm}}'
date updated: 20220504 04:57
---

# Chain Matrix Multiplication

![[Pasted image 20220504050046.png]]

![[Pasted image 20220504050147.png]]

---
![[Pasted image 20220504050937.png]]

![[Pasted image 20220504051018.png]]

![[Pasted image 20220504051710.png]]

36 came from: It's the minimum of the 2 sums (A1)(A2 A3) and (A1 A2)(A3). Doing the first pair (A1)(A2 A3), We know (A2 A3) has the cost 24. Now we just add that to the cost of (A1) and (A2 A3). A1 has dimensions (2, 2) and (A2, A3) has the dimensions (2, 3). We multiply them and get the cost 2 * 2 * 3 = 12. Adding the two together we get 12 + 24 = 36.


![[Pasted image 20220504051659.png]]