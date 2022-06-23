# Bellman-Ford Algorithm 
 [[LectureA15.pdf]]
 [[LectureA15.tex]]
 [[LectureA15-Section1.pdf]]
 [[LectureA15-Section2.pdf]]
Bellman-Ford algorithm can be used to solve the (single-source) shortest path problem with negative edge length, and its extension can also be used to detect if a graph contains negative cycle (reachable from the given source). 

Bellman-Ford algorithm is quite simple. It only maintain an array,distof size|V|, as its data structure. And it just does a bunch of “update” operations. An “update” function takes an edgee= (u,v)as input, and updatesdist[v]asdist[u]+l(u,v)if the former is larger than the latter. 

 procedure update(edge(u,v)∈E) if (dist[v]>dist[u]+l(u,v)) dist[v] =dist[u]+l(u,v); end if; end procedure; 

Bellman-Ford algorithm iterates(|V|− 1 )rounds, and in each round, updatesalledges, in an arbitrary order. If the givenGdoes contain negative cycle reachable from givens, when the algorithm terminates, we will have thatdist[v] =distance(s,v)for everyv∈V. 

 Algorithm Bellman-Ford (G= (V,E),l(e)for anye∈E,s∈V) init an arraydistof size|V|; dist[s] =0;dist[v] =∞for anyv 6 =s; fork= 1 →|V|− 1 for each edge(u,v)∈E update(u,v); end for; end for; end algorithm; 

Sinceupdatefunction takes constant time, clearly, Bellman-Ford algorithm runs inΘ(|V|·|E|)time. See examples below. 

### 2 

 s 

 a 

 c 

 b 

### 4 3 

### 1 

### − 2 

### 0 

### R 1 

 s a b c 

 init ∞ ∞ ∞ 

(^04) 4 4 

### 0 

### 0 

### 3 

### 3 2 

R (^22) R 3 graph dist array 

### ∞ ∞ 

### 2 

 s 

 c 

 a 

 b 

### 4 3 

### 1 

### − 2 

### 0 

 s a b c ∞ ∞ ∞ 

 0 4 

 2 

 2 

### 0 

### 0 

### 7 

### 3 4 

### 4 

 graph dist array 

### R 1 ∞ ∞ 

 init 

### R 2 

### R 3 

Figure 1: The dist array (after each round) running Bellman-Ford algorithm on each example. In each example, in each round, we choose to update all edges in lexicographic order, i.e.,(a,b),(a,c),(c,b),(c,s),(s,a). 

Now let’s see why this algorithm is correct. We first show an invariant about the data structuredistarray: 

---

Fact 1.Throughout the algorithm, ifdist[v] 6 =∞thendist[v]represents the length of some path fromsto v. In other words,dist[v]≥distance(s,v)throughout the algorithm, asdist[v]represents the length ofsome path fromstov, whiledistance(s,v)represents the length of theshortestpath fromstov. 

Clearly, in the initialization step which setsdist[s] =0 anddist[v] =∞for allv 6 =s, above claim holds, as dist[s]stores a path fromstoswithout any edge and therefore its length is 0. Now to show above fact is correct throughout the algorithm, we just need to show that the “update” operation keeps this invariant (as this algorithm does nothing else but “update” operations). 

Fact 2. The update operation keeps the invariant thatdist[v]represents the length of some path fromstov whendist[v] 6 =∞, i.e.,dist[v]≥distance(s,v), for everyv∈V. 

Proof. We prove this by induction w.r.t. the sequence of update operations. Assume that up to then-th update opertion above claim holds, i.e.,dist[v]stores the length of some path fromstovwhendist[v] 6 =∞. Now consider the(n+ 1 )-th update operation on edgee= (u,v). Assume thatdist[v]>dist[u]+l(u,v), as otherwise this operation does not changedistand the claim continues to be true. Nowdist[v]is updated as dist[u]+l(u,v). Since, according to the inductive assumption,dist[u]stores the length of some path froms tou, we have thatdist[v]stores the length of the path that consists of the aforementioned path fromstou followed by edge(u,v). 

In Bellman-Ford algorithm,dist[v]starts from a trivial upper bound (i.e., infinity) ofdistance(s,v), and will get closer and closer todistance(s,v)through the “update” procedures, and eventually reachdistance(s,v). We now state the conditions for this to happen. 

Fact 3. If edge(u,v)is the last edge on one shortest path fromstovanddist[u] =distance(s,u), then after update(u,v)we will havedist[v] =distance(s,v). 

Since edge(u,v)is the last edge on one shortest path fromstov, according to Property 3 of Lecture A14, we know thatdistance(s,v) =distance(s,u)+l(u,v) =dist[u]+l(u,v). Throughupdate(u,v),dist[v]will be compared withdist[u] +l(u,v) =distance(s,v). The first case will be thatdist[v]≤dist[u] +l(u,v) = distance(s,v). Notice that in this case we must havedist[v] =distance(s,v)according to above fact, i.e., dist[v]already stores the distance. The second case will be thatdist[v]>dist[u] +l(u,v) =distance(s,v), and in this case the “update” function will setdist[v] =dist[u] +l(u,v) =distance(s,v). Hence, in either case, we will havedist[v] =distance(s,v)after updating edge(u,v). 

Suppose thats→v 1 →v 2 →···→vis one shortest path fromstov. In the initialization step we have dist[s] =distance(s,s) =0. If at a later time,update(s,v 1 )is executed, then following above Fact 3, we know thatdist[v 1 ] =distance(s,v 1 )after this update (reasons:dist[s] =distance(s,s), and(s,v 1 )is the last edge on one shortest path fromstov 1 according to the optimal substrcture property). Oncedist[v 1 ]becomes distance(s,v 1 ),dist[v 1 ]will stay asdistance(s,v 1 )according to Fact 1. If at a later timeupdate(v 1 ,v 2 )happens then following Fact 3, we know thatdist[v 2 ] =distance(s,v 2 ). Note that it doesn’t matter if additional updates happen betweenupdate(s,v 1 )andupdate(v 1 ,v 2 ). We can continue this argument; a general form is summarized below. 

Fact 4. If there exists a sequence of udpate procedures (not necessarily consecutive) that update all the edges following one shortest path fromstov, then after that we will havedist[v] =distance(s,v). Again, there can be other “update”(s) between any two “update”s in this sequence. 

But we don’t know the the shortest path in advance. That’s fine. As the number of edges in the shortest path will not exceed(|V|− 1 ), the Bellman-Ford algorithm simply updatealledges in each round, and do this (|V|− 1 )times. This therefore guarantees that thei-th edge on the shortest path can be updated during the 

---

i-th round. Consequently, this guarantees the existence of a sequence of update procedures that update all edges following the shortest path. This analysis leads to the following conclusion, which actually proves the correctness of Bellman-Ford algorithm. See an illustration in Figure 2. 

Fact 5.IfGdoes not contain negative cycle, then we havedist[v] =distance(s,v)forv∈Vafter|V|− 1 rounds. In particular, letpbe one shortest path fromstovwithkedge. Then afterkrounds of the BellmanFord algorithm,dist[v] =distance(s,v). 

 s a b v 

 Bellman-Ford 

 shortest path from s to v 

 update all edges 

 update all edges 

 update all edges 

 update all edges 

 update all edges 

### 1 2 3 ··· |V|− 1 

Figure 2: Illustration of the correctness of the Bellman-Ford algorithm. Dotted lines represent additional updates on the corresponding edge. 

## Detecting Negative Cycles 

We can slightly modify Bellman-Ford algorithm to detect if a given graph contains negative cycle that is reachable froms. The algorithm does one more round of updates, in which it determines if somedistvalue can be further reduced. 

 Algorithm Bellman-Ford-Detect-Negative-Cycle (G= (V,E),l(e)for anye∈E,s∈V) init an arraydistof size|V|; dist[s] =0;dist[v] =∞for anyv 6 =s; fork= 1 →|V|− 1 for each edge(u,v)∈E update(u,v); end for; end for; for each edge(u,v)∈E if (dist[v]>dist[u]+l(u,v)): reportGcontains negative cycle and exit end for; report thatGdoes not contain negative cycle end algorithm; 

Let’s show that above algorithm is correct. We first prove that, ifGdoes not contain negative cycle (reachable froms), then in above additional rounddist[v]>dist[u]+l(u,v)will never happen, i.e., we will get the report that “Gdoes not contain negative cycle”. As per Fact 5 and the assumption thatGdoes not contain negative cycle, we know thatdist[v] =distance(s,v)after|V|−1 rounds. Also, according to Fact 2, update function will never makedist[v]smaller thandistance(s,v)whenGdoes not contain negative cycle. Hence, during 

---

the|V|-th round in above algorithm, none of thedistvalue can be further reduced. 

We then prove that, ifGcontains negaive cycle (reachable froms), then in above additional round, there must exist an edge(u,v)such thatdist[v]>dist[u] +l(u,v). Suppose conversely that, in above additional round, all edges satisfydist[v]≤dist[u]+l(u,v). LetC=v 1 →v 2 →···→vk− 1 →vk→v 1 be one negative reachable froms. We have∑e∈Cl(e)<0 asCis a nagative cycle. Applyingdist[v]≤dist[u]+l(u,v)to all edges inCgives: dist[v 2 ] ≤ dist[v 1 ]+l(v 1 ,v 2 ) dist[v 3 ] ≤ dist[v 2 ]+l(v 2 ,v 3 ) ··· dist[vk] ≤ dist[vk− 1 ]+l(vk− 1 ,vk) dist[v 1 ] ≤ dist[vk]+l(vk,v 1 ) 

Summing up both sides of all above inequalities gives∑e∈Cl(e)≥0, a contradiction. 

