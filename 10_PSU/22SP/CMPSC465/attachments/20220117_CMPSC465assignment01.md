## CMPSC 465 Data Structures & Algorithms 

# Spring 2022 Chunhao Wang and Mingfu Shao Assignment 01 

## Due: Friday 09:00 am, Jan. 21, 2022 

 Instructions: You may work in groups of up to three people to solve the homework. You must write your own solutions and explicitly acknowledge everyone whom you have worked with or who has given you any significant ideas about your solutions. You may also use books or online resources to help solve homework problems. All consulted references must be acknowledged. The acknowledgements need to be made by answering Problem 1 below. You are encouraged to solve the problem sets on your own using only the textbook and lecture notes as a reference. This will give you the best chance of doing well on the exams. Relying too much on the help of group members or on online resources will hinder your performance on the exams. Submissions being late in 2 hours will be accepted with a 20% penalty. Submissions late more than 2 hours will receive 0. There will be no exceptions to this policy, as we post the solutions soon after the deadline. For the full policy on assignments, please consult the syllabus. 

 Formatting: Start a new page for each problem. 

1. (0 pts.) Acknowledgements. The assignment will receive a 0 if this question is not answered. 

1. If you worked in a group, list the members of the group. Otherwise, write “I did not work in a group.” 

2. If you received significant ideas about your solutions from anyone not in your group, list their names     here. Otherwise, write “I did not consult anyone except my group members”. 

3. List any resources besides the course material that you consulted in order to solve the material. If you     did not consult anything, write “I did not consult any non-class materials.” 

2. (15 pts.) For each pairs of functions, indicate one of the three:f=O(g),f= Ω(g), orf= Θ(g). 

1. f(n) =n^4 ,g(n) = (100n)^3 

2. f(n) =n^1.^01 ,g(n) =n^0.^99 ·(logn)^2 

3. f(n) = 4n· 2 n+n^100 ,g(n) = 3n 

4. f(n) =n^2 ·log(n^2 ),g(n) =n·(logn)^3 

5. f(n) = 3n−^1 ,g(n) = 3n 

6. f(n) = 1. 01 n,g(n) =n^2 

7. f(n) = 2log logn,g(n) =n 

8. f(n) = (logn)^100 ,g(n) =n^0.^001 

9. f(n) = 5n+ 

### √ 

 n,g(n) = 3n+ logn 10.f(n) = 2n+ logn,g(n) = 2n+ (logn)^10 11.f(n) =^5 

### √ 

 n,g(n) =^3 

### √ 

 n 

---

 12.f(n) =n!,g(n) = 3n 13.f(n) = log(15n!),g(n) =nlog(n^9 ) 14.f(n) = 

 ∑n k=1k,g(n) = log(n!) 15.f(n) = 

 ∑n k=1k 

(^3) ,g(n) =n (^3) ·logn 

3. (16 pts.) Assume you have positive functionsf(n),g(n)andh(n)over positive integersn≥ 1. For each     of the following statements, decide if you think it is true or false and give a proof or counterexample. 

1. Iff(n) =O(g(n))andg(n) =O(h(n)), thenf(n) =O(h(n)). 

2. Iff(n) = Θ(g(n)), then 2 f(n)= Θ(2g(n)). 

3. Iff(n) =o(g(n)), thenlogf(n) =o(logg(n)) 

4. Iff(n) =O(g(n)), thenf(^1 n)= Ω(g(^1 n)) 

4. (16 pts.) For each pseudo-code below, give the asymptotic running time inΘnotation. You may assume     that standard arithmetic operations takeΘ(1)time. 

### 1. 

 fori:= 1tondo j:=i; whilej≤ndo j:=j+i; end end 

### 2. 

 i:= 1; whilei≤ndo j:= 1; whilej≤ido j:=j+ 1; end i:= 2i; end 

### 3. 

 s:= 0; fori:= 1tondo forj:=i+ 1tondo fork:=j+ 1tondo s:=s+ 1; end end end 

---

### 4. 

 fori:= 1ton^2 do ifi mod n = 0then j:= 1; whilej≤nido j:=j+ 1; end end end 

