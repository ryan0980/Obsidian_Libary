## CMPSC 465 Data Structures & Algorithms 

# Spring 2022 Chunhao Wang and Mingfu Shao Worksheet 1 

 Jan 19, 2021 

1. Compare Growth Rates.Order the following functions by asymptotic growth: 

 (i)f 1 (n) = 3n (ii)f 2 (n) =n^13 (iii)f 3 (n) = 12 (iv) f 4 (n) = 2log^2 n (v)f 5 (n) = 

### √ 

 n (vi)f 6 (n) = 2n (vii)f 7 (n) = log 2 n (viii)f 8 (n) = 2 

 √n 

 (ix)f 9 (n) =n^3 

 Solutionf 3 , f 7 , f 2 , f 5 , f 4 , f 9 , f 8 , f 6 , f 1 

2. Prove Order of Growth.Prove the following: 

 (i)log(n!) = Θ(nlogn) (ii) 

 Pn i=1 

 1 i= Θ(logn) Solution (i) Observe that n! = 1∗ 2 ∗ 3 ···∗n≤n∗n∗n···∗n≤nn and assumingnis even (without loss of generality) 

 n! = 1∗ 2 ∗ 3 ···∗n≥n∗(n−1)∗(n−2)···∗(n−n/2)≥ 

 n 2 

 n 2 . 

 Hence 

  n 2 

 n 2 ≤n!≤nn. Then, n 2 

 log 

 n 2 

###  

 ≤log(n!)≤nlogn. 

 (ii) This can be proved using integration. We need to find both upper and lower bound forΘ. 

 CMPSC 465, Spring 2022, Worksheet 1 1 

---

 Red area = Blue Area = 

 Pn k=1 

 1 k Red area is right shifted by one to obtain the blue area. Area under the graph of f(x) is greater than red area but less than blue area. Area under the curve for 1 to n = 

 Rn 1 

 1 xdx As the actual value of f(x) goes to∞for 0, we can substitute it with 1 and red area will still be less than area under f(x). Red Area (RHS)≤1 + 

 Rn 1 

 1 xdx= 1 +logn Blue Area (RHS)≥ 

 Rn+1 1 

 1 xdx=log(n+ 1) The last two statements provide the upper and lower bound, thus 

 Pn k=1^1 kΘ(logn) 

CMPSC 465, Spring 2022, Worksheet 1 2 

