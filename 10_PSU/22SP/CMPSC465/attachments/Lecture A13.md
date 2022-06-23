# Priority Quque (continued) 
[[Lecture A13.pdf]]
[[LectureA13.tex]]
[[LectureA3-Section2.pdf]]
[[LectureA3-Section1.pdf]]
We finally give the pseudo-code for implementing the binary [[heap]]. We not only maintain the arraySbut also the number of elements inS, denoted asn. 

 function empty(PQ) ifn=0: return true; else: return true; end function; function insert(PQ,x) n=n+1; S[n] =x; bubble-up (S,n); end function; function find-min(PQ) returnS[ 1 ]; end function; function delete-min(PQ) S[ 1 ] =S[n]; n=n−1; sift-down (S, 1); end function; function decrease-key(PQ,k, new-key) S[k].key=new-key; bubble-up (S,k); end function; 

Both bubble-up and sift-down procedures runs inO(logn)time. This is because, a complete binary tree withnvertices has a height of logn, while the worst case of either procedure traverses along a path between the root and a leaf. Formally, in each recursive call,kis either halved or doubled, and hence the number of recursive calls is logn. The empty and find-min procedures takesΘ( 1 )time; the other 3 procedures takes O(logn)time, as they are dominated by either bubble-up or sift-down. 

# Single-Source Shortest Path Problem with Unit Edge Length 

In many applications, edges of graphs are associated withlengths. We will consider three cases. 

1. unit edge length: the length of each edge is 1; 

2. positive edge length: the length of each edge is a positive number; 

3. length of edge might be a negative number. 

---

LetG= (V,E)be a graph; letl(e)be the length ofe∈E(in any of above cases). Letpbe a path of G. We define the length of pathp, still denoted asl(p), as the sum of the length of all edges inp, i.e., l(p):=∑e∈pl(e). Givenu,v∈V, theshortest pathfromutov, is the path fromutovwith smallest length. We use notationdistance(u,v)to denote the length of the shortest path fromutov. 

There are different variants of shortest path problems. One category issingle-source shortest path problem, where we are given graphG= (V,E)with edge length (one of the three cases) and asourcevertexs∈V, and we seek to find the shortest path fromstoallvertices. 

We first solve the easiest version of shortest path problem: givenG= (V,E)with unit edge length and a sourcevertexs∈V, to find the shortest path fromsto all vertices, i.e., to finddistance(s,v)for anyv∈V. 

The breadth-first search (BFS) can solve above problem. The idea of BFS is to traverse the vertices of graph in increasing order of their distance froms. Formally, we defineVk,k= 0 , 1 , 2 ,···, as the subset of vertices whose distance (froms) is exactlyk, i.e.,Vk={v∈V|distance(s,v) =k}. BFS will first traverse vertices inV 0 , then vertices inV 1 , thenV 2 , and so on, until all vertices reachable fromsare traversed. 

Notice thatV 0 ={s}asdistance(s,s) =0. How aboutV 1? They are the vertices reachable fromswith one edge (but cannot bes), i.e.,V 1 ={v∈V|(s,v)∈E}\V 0. How aboutV 2? They are the vertices reachable from some vertex inV 1 with one edge, but not inV 0 orV 1 , i.e.,V 2 ={v∈V|u∈V 1 and(u,v)∈E}\(V 0 ∪V 1 ). The general form is thatVk+ 1 ={v∈V|u∈Vkand(u,v)∈E}\(V 0 ∪V 1 ∪···∪Vk). This suggests an iterative framework of BFS: to findVk+ 1 , explore the out-edges ofVkto collect thenewlyreached vertices (i.e., those not inV 0 ∪V 1 ∪···∪Vk). To realize this idea, BFS uses two data structures; the complete algorithm follows. 

1. Arraydistof size|V|, initialized asdist[v] =∞for anyv∈V. Arraydistserves as two purposes:     indicating a vertex has been reached or not, and storing the distance froms(after it has been reached).     Formally, beforevis reached,dist[v] =∞; aftervis reached,dist[v] =distance(s,v). 

2. QueueQ, which stores the vertices haven’t been explored. Vertices will be added toQin the order of     V 0 ,V 1 ,V 2 ,···, and vertices will be deleted fromQin the same order (as queue is first-in-first-out). 

 Algorithm BFS (G= (V,E),s∈V) dist[v] =∞, for anyv∈V; init an empty queueQ; dist[s] =0; insert (Q,s); while (empty (Q) = false) u= find-earliest (Q); delete-earliest (Q); for each edge(u,v)∈E if (dist[v] =∞) dist[v] =dist[u]+1; insert (Q,v); end if; end for; end while; end algorithm; 

---

Initially BFS hasV 0 (i.e.,s) inQ(right before the while loop), then BFS deletessfromQand explores s(newly reached vertices—these areV 1 , will have theirdistset as 1 and be added toQ); at the time of finishing exploringV 0 ,V 1 will be inQ. Next, BFS will gradually delete and explore each of the vertices in Q(i.e.,V 1 ); in this process, vertices inV 2 will be reached, theirdistbe set as 2, and be added toQ; after all of them are deleted and explored,Qwill exactly consist ofV 2. 

In general, BFS keeps the following invariant: for everyk= 0 , 1 , 2 ,···, there is a time at whichQcontains exactlyVk,dist[v] =distance(s,v)for anyv∈V 0 ∪V 1 ∪···Vk, anddist[v] =∞for all other vertices. This invariant explains the behavior of BFS while also proves its correctness: when theQbecomes empty, dist[v] =distance(s,v)for anyv∈V. 

Following above invariant and the pseudo-code, we know that the time that vertexvis reached for the first time (happend when(u,v)∈Eis checked anddist[v] =∞), is also the time that the shortest path tovis found, that thedist[v]gets assigned, and thatvis added toQ. 

BFS runs inO(|V|+|E|)time, as each vertex will be explored at most once, and each edge will be examined at most once (for directed graph) and at most twice (for undirected graph). Note that BFS (G,s) only traverses those vertices inGcan be reached froms. 

# Single-Source Shortest Path Problem with Positive Edge Length 

We now study the single-source shortest path problem with positive edge length: given graphG= (V,E) with edge lengthl(e)>0 for anye∈Eand source vertexs∈V, to seekdistance(s,v)for anyv∈V. We solve this problem with theDijkstra’s algorithm. 

Similar to BFS, the idea of Dijkstra’s algorithm is also to determine and calculate the distance of each vertex in increasing order of distance. More specifically, let(v∗ 1 ,v∗ 2 ,···,v∗n),n=|V|, be the order of vertices with increasing distance, i.e.,distance(s,v∗k)≤distance(s,v∗k+ 1 ), 1≤k<n. In other words, we define v∗kas thek-th closest vertex froms. We don’t know this order in advance. But Dijktra’s algorithm will identify vertices in this order and calculate their distance. For the sake of writing and notations, we define Rk={v∗ 1 ,v∗ 2 ,···,v∗k}, i.e., the firstkvertices in above list;Rkare also the closestkvertices froms. 

Clearly,v∗ 1 =s,distance(s,v∗ 1 ) =distance(s,s) =0, andR 1 ={s}. The key question is: givenRk(i.e., the closestkvertices froms) and their distances (i.e.,distance(s,v)for everyv∈Rk), how to findv∗k+ 1? Below we show thatv∗k+ 1 must be withinone-edge extensionofRk. 

Claim 1. There must exist vertexu∈Rksuch that(u,v∗k+ 1 )∈E. 

Proof. Suppose conversely that for everyu∈Rkwe have(u,vkk+ 1 )6∈E. Consider the shortest path from stov∗k+ 1. Letwbe the vertex right beforev∗k+ 1 in pathp, i.e,(w,v∗k+ 1 )is the last edge ofp. We have distance(s,v∗k+ 1 ) =distance(s,w)+l(w,v∗k+ 1 ). As edges have positive edge length, we havel(w,v∗k+ 1 )>0, and consequentlydistance(s,w)<distance(s,v∗k+ 1 ). Besides, according to the assumption, we havew6∈Rk. Therefore,v∗k+ 1 cannot be the(k+ 1 )-th closest vertex froms, becausewhas a shorter distance thanv∗k+ 1. This contradicts to the definition ofv∗k+ 1. 

Note that, in above proof, we use the fact that edges have positive lengths. Hence, above claim may not be true for graphs with negative edge length. This also explains why Dijkstra’s algorithm won’t work for graphs with negative edge length. 

The above claim shows that, the last edge(u,v)of the shortest path fromstov∗k+ 1 satisfies thatu∈Rkand 

---

v6∈Rk. Which such edge is the correct one? We don’t know, so we enumerate all such edges(u,v)∈E withu∈Rkandv6∈Rk. Suppose that(u,v)is the last edge of the shortest path fromstov∗k+ 1 , we know thatdistance(s,v) =distance(s,u) +l(u,v). This leads to the following formula to calculatev∗k+ 1 and its predecessor in the shortest path. See an example in Figure 1. 

Corollary 1. We have 

 distance(s,v∗k+ 1 ) =minu∈Rk,v∈V\Rk,(u,v)∈E(distance(s,u)+l(u,v)). 

Let(u′,v′)be the optimal edge in the minimization, i.e., 

 (u′,v′):=arg minu∈Rk,v∈V\Rk,(u,v)∈E(distance(s,u)+l(u,v)). 

Thenv∗k+ 1 =v′andu′is the predecessor ofv∗k+ 1 in the shortest path fromstov∗k+ 1. 

## R 5 

## 0 

## 2 

 s 

 6 a 

 3 d 

 4 e 

 b 

 c 

 k 

 9 f h 

 j 

## 10 

## 4 

## 5 

## 8 

## 7 

## 3 

## 4 

## 9 

## 3 

## 6 

Figure 1: Example for Colollary 1. Suppose that we knowR 5 ={s,a,d,e,f}and their distances froms, marked next to vertices. To findv∗ 6 and calculatedistance(s,v∗ 6 ), we consider all one-edge extension ofR 5 , marked as thick blue edges. Following Corollary 1,distance(s,v∗ 6 ) =minu∈R 5 ,v6∈R 5 ,(u,v)∈E(distance(s,u) + l(u,v)) =min{ 6 + 2 , 3 + 10 , 3 + 4 , 9 + 5 , 9 + 8 }=7, and the optimal edge is(d,c). Hence,v∗ 6 =canddis the predecessor ofdin the shortest path. 

We therefore have the following algorithm (framework), in which we follow above formula to iteratively constructRk,k= 1 , 2 ,···,n. We again use arraydistof sizento store the distance for vertices inRk. 

 Algorithm Dijkstra-Framework (G= (V,E),s∈V) letR 1 ={s}; dist[s] =0;dist[v] =∞for anyv 6 =s; fork= 1 →n− 1 calculate(u′,v′):=arg minu∈Rk,v∈V\Rk,(u,v)∈E(dist[u]+l(u,v)); Rk+ 1 =Rk∪{v′}; dist[v′] =dist[u′]+l(u′,v′); end for; end algorithm; 

A naive implementation of above framework takesO(|V|·|E|)time, as for eachk, the calculation of the minimization may takeO(|E|)time. Next lecture, we will show how to use efficient data structures to speed up, leading to the complete Dijkstra’s algorithm with improved running time. 

