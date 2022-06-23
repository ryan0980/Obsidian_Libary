Lecture A4 CMPSC 465 Spring 2022 Mingfu Shao 
[[LectureA14.tex]]
[[LectureA14.pdf]]
[[LectureA14-Section2.pdf]]
[[LectureA14-Section1.pdf]]
## Running Time of the Selection Algorithm 

By definition, the find-pivot functions takes timeΘ(n) +T(|M|). Therefore, the total running time of the selection problem, in the form of a recurrence, isT(n) =Θ(n)+T(|M|)+max{T(|A 1 |),T(|A 2 |)}. 

We now bound the size of|M|and max{|A 1 |,|A 2 |}. Clearly,|M|=n/5, as the number of subarrays is n/5. Think: how many numbers inAareguaranteedsmaller thanx(this number then gives a lower bound of|A 1 |)? First, in thesen/5 medians, half of them, i.e.,n/10 numbers, are smaller thanx, asxis the median of these medians. Second, consider thesen/10 subarrays whose median is smaller thanx: clearly in each of these subarrays, at least two numbers are smaller thanx. This is because the median of this subarray is smaller thanxand there are two numbers in this subarray that are smaller than its median. Combined, we have a lower bound of|A 1 |:|A 1 |≥n/ 10 + 2 ·n/ 10 = 3 n/10. This gives an upper bound of |A 2 |:|A 2 |=n−|A 1 |≤ 7 n/10. 

Symmetrically, we have that|A 2 |≥ 3 n/10 and hence|A 1 |=n−|A 2 |≤ 7 n/10. This is because, in thesen/ 5 medians,n/10 of them are larger thanx, and in these correspondingn/10 subarrays whose median is larger thanx, there are in total 2·n/10 numbers larger thanx. 

Combined, we have max{|A 1 |,|A 2 |}≤ 7 n/10. The above recurrence becomesT(n)≤Θ(n) +T(n/ 5 ) + T( 7 n/ 10 ). How to solve this recurrence? Here is the conclusion (you will see its prove via assignment). For a more generalized version is this recurrence:T(n) =Θ(n) +T(c 1 n) +T(c 2 n), where 0<c 1 ,c 2 <1, we haveT(n) =Θ(n)ifc 1 +c 2 <1;T(n) =Θ(nlogn)ifc 1 +c 2 =1. For the selection problem we have c 1 +c 2 = 1 / 5 + 7 / 10 <1. Hence its running timeT(n) =Θ(n). 

### Choices of the Size of Subarrays 

How about we partitionAinto subarrays of size 3? Note, in this case the algorithm is still correct. But will the algorithm still run in linear time? Let’s analyze it. Now we have|M|=n/3, as the number of subarrays is n/3. In thesen/3 medians, half of them, i.e.,n/6 numbers, are smaller thanx, and in these correspondingn/ 6 subarrays whose median is smaller thanx, there are in total 1·n/6 numbers smaller thanx. This gives that |A 1 |≥n/ 6 +n/ 6 =n/3, which gives|A 2 |≤ 2 n/3. Symmetrically we can prove|A 1 |≤ 2 n/3 and combined we have max{|A 1 |,|A 2 |}≤ 2 n/3. The recursion in this case, will beT(n) =Θ(n)+T(n/ 3 )+T( 2 n/ 3 ). In fact, nowT(n) =Θ(nlogn)as 1/ 3 + 2 / 3 =1. In sum, choosing subarrays of size 3 won’t give a linear time algorithm. (Note: by using the idea of “median-of-median-of-medians”, a linear-time algorithm can still be obtained in this case; see assignment.) 

How about we partitionAinto subarrays of size 7? Now we have|M|=n/7, as the number of subarrays is n/7. In thesen/7 medians, half of them, i.e.,n/14 numbers, are smaller thanx, and in these corresponding n/7 subarrays whose median is smaller thanx, there are in total 3·n/14 numbers smaller thanx. This gives that|A 1 |≥n/ 14 + 3 n/ 14 = 2 n/7, which gives|A 2 |≤ 5 n/7. Symmetrically we can prove|A 1 |≤ 5 n/7 and combined we have max{|A 1 |,|A 2 |}≤ 5 n/7. The recursion in this case, will beT(n) =Θ(n) +T(n/ 7 ) + T( 5 n/ 7 ). SoT(n) =Θ(n)as 1/ 7 + 5 / 7 <1. In fact, any odd size that is larger than 5 will lead to a lineartime algorithm. But bigger size will result in bigger factor in sorting these subarrays. For example, compare size of 7 and size of 5: it takesn/ 7 · 7 ·log 7=log 7·ntime to sort in the case of size 7, which is larger than log 5·nin the case of size 5. 

#### 1 

---

Lecture A4 CMPSC 465 Spring 2022 Mingfu Shao 

## Randomized Algorithm for Selection Problem 

We now design arandomized algorithmfor selection problem. The idea is simply pick the pivot uniformly at random fromA. The pseudo-code is given below. 

 function find-pivot-random (A) pick pivotxuniformly at random fromA; end function ; 

First, note that the selection algorithm combined with above random function to pick pivot is correct, i.e., it will still find thek-th smallest number ofA. We now analyze its running time. Again, letT(n)be the running time of selection (A,k), with above random function to select pivot, when|A|=n. Define random variable Z:=max{|A 1 |,|A 2 |}. Hence we can writeT(n) =Θ(n)+T(Z). Again, hereZis a random variable,T(Z) is a random variable, and thereforeT(n)is also a random variable. 

We aim to calculate the expected running time, a common practice in analyzing randomized algorithms. We first estimate the distribution ofZ. Think: what’s the probability for eventZ≤ 3 n/4? Answer: at least 1 /2. Why? This is because we pickxuniformly at random fromx. Therefore, the probability of event of {xis between 25-percentile and 75-percentile ofA}is 1/2. And this event is equivalent to the event that Z≤ 3 n/4, according to the definition ofZ. Hence, Pr(Z≤ 3 n/ 4 ) = 1 /2. 

We now calculate its expected running time. We start with recursionT(n) =Θ(n) +T(Z). We first take 

### expectation overZon both sides:EZ[T(n)] =Θ(n)+EZ[T(Z)]. Note thatT(n)does not containZ(although 

### T(n)is a random variable), we haveEZ[T(n)] =T(n). That isT(n) =Θ(n)+EZ[T(Z)]. 

### We now estimateEZ[T(Z)]. 

### EZ[T(Z)] = 

 n 

# ∑ 

 k=n/ 2 

 Pr(Z=k)·T(k) 

#### = 

 3 n/ 4 

# ∑ 

 k=n/ 2 

 Pr(Z=k)·T(k)+ 

 n 

# ∑ 

 k= 3 n/ 4 

 Pr(Z=k)·T(k) 

 ≤ T( 3 n/ 4 )· 

 3 n/ 4 

# ∑ 

 k=n/ 2 

 Pr(Z=k)+T(n)· 

 n 

# ∑ 

 k= 3 n/ 4 

 Pr(Z=k) 

 = T( 3 n/ 4 )·Pr(Z≤ 3 n/ 4 )+T(n)·Pr(Z≥ 3 n/ 4 ) ≤ T( 3 n/ 4 )· 1 / 2 +T(n)· 1 / 2. 

Hence, now we haveT(n)≤Θ(n) +T( 3 n/ 4 )/ 2 +T(n)/2, which givesT(n)≤Θ(n) +T( 3 n/ 4 ). We now 

### take expectation, overT(n), on both sides:ET[T(n)] =Θ(n) +ET[T( 3 n/ 4 )]. By using master’s theorem, 

### we have thatET[T(n)] =Θ(n). 

#### 2 

