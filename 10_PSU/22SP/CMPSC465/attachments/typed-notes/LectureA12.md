# Deciding Directed Acyclic Graphs 

How to decide if a given directed graph is DAG or not? The following variant of DFS (with timing) gives an algorithm. Specifically, when the algorithm examines an edge(vi,vj): ifvjhas been exploredandits post-number hasn’t been set yet, then the algorithm reports thatGis not a DAG. 

 function DFS (G= (V,E)) clock=1; visited[i] = 0 ,pre[i] =− 1 ,post[i] =−1, for 1≤i≤|V|; fori= 1 →|V| if (visited[i] =0) explore (G,vj); end if; end for; end algorithm; function explore (G= (V,E),vi∈V) visited[i] =1; pre[i] =clock; clock++; for any edge(vi,vj)∈E if (visited[j] =0): explore (G,vj); else if (post[j] =−1): report “Gis not a DAG”; end for; post[i] =clock; clock++; end algorithm; 

Now let’s prove this algorithm is correct. We first prove that ifGis not a DAG then the algorithm will always give that report at some time. Assume thatGcontains a cycleCas it is not a DAG. Letvj∈Cbe the first vertex that is explored inC. Let(vi,vj)∈Ebe an edge inC. Asvjcan reachvi, within exploringvj there will be a time thatviwill be explored. Consider the time of examining edge(vi,vj)within exploring vi: at this timevisited[j]has been set as 1, but its post-number hasn’t been set, as now the algorithm is still within exploringvj. Therefore, the algorithm will report thatGdis not a DAG. 

We then prove that if the algorithm gives that report thenGindeed is not a DAG. Consider that the algorithm is exploringvi, examining edge(vi,vj)and findsvisited[j] = 1 and post[j] =−1. The fact thatpost[j]hasn’t been set implies that the algorithm is within exploringvj. So we have thatvjcan reachvi, as now we are exploringvi. In addition, there exists edge(vi,vj). Combined,Gcontains cycle. 

Note that this algorithm is essentially determining if there exists edge(vi,vj)∈Esuch that the interval [pre[i],post[i]]is within interval[pre[j],post[j]]. (Such edges are calledback edgesin textbook [DPV], page 95.) 

---

# Finding a Linearization of a DAG 

DFS-with-timing can also be used to find a linearization of a DAG: we simply run DFS-with-timing on the given DAGGand get the postlist (the list of vertices in decreasing order of post value); the postlist will be a linearization ofG. 

Why? First, observe that each connected component of a DAGGcontains exactly one vertex, i.e., each vertex in a DAGGforms the connected component of its own. (Can you spot this using Figure 1?) This is because, if a connected component contains at least two verticesuandvthenucan reachvandvcan reach uso a cycle must exist. Consequently, the meta-graphGMof any DAGGis also itself, i.e.,G=GM. 

Now let’s interpret the conclusions for general directed graphs we obtained in Lecture A11 in the context of DAGs. Consider Claim 1 in Lecture A11:Let Ciand Cjbe two connected components of directed graph G= (V,E), i.e., Ciand Cjare two vertices in its coresponding meta-graph GM= (VM,EM). If we have (Ci,Cj)∈EMthen we must have thatmaxu∈Cipost[u]>maxv∈Cjpost[v]. As in a DAG, componentsCi andCjwill degenerate into two vertices, sayviandvj, and its meta-graphGMis the same asG, we can translate this claim for DAG as: if in a DAG we have(vi,vj)∈Ethen we must havepost[i]>post[j]. This immediately gives the desired conclusion following the definition of linearization and the definition of postlist: the postlist is a linearization ofG. 

 v 1 

v (^5) v 6 v 4 v 3 v 2 v 1 v (^5) v 6 v 4 v 3 v 2 

## ( 1 , 12 ) 

## ( 10 , 11 ) 

## ( 6 , 7 ) 

## ( 5 , 8 ) 

## ( 2 , 9 ) ( 3 , 4 ) 

Figure 1: Example of running DFS (with timing) on a DAGG. The[pre,post]interval for each vertex is marked next to each vertex. Thepostlistfor this run is(v 1 ,v 5 ,v 2 ,v 4 ,v 6 ,v 3 ), which is a linearization ofG. 

# Queue 

Aqueuedata structure supports the following four operations. 

1. empty (Q): decides if queueQis empty; 

2. insert (Q,x): add elementxtoQ; 

3. find-earliest (Q): return the earliest added element inQ; 

4. delete-earliest (Q): remove the earliest added element inQ. 

To implement above operations, we can use a (dynamic) arraySto stores all elements, and use two pointers, headandtail, whereheadpointer always points to the first available space inS, andtailpointer always points to the earliest added element inS. When we add an element toSwe can directly add it to the place headpoints to, and when we delete the earliest added element, we can directly remove the onetailpoints to. 

---

 tail head 

 4 8 5 10 

 tail head 

 4 8 5 10 

 tail head 

 8 5 10 

 insert (Q, 2) 

## 2 

 delete-earliest (Q) 

## 2 

 Figure 2: An example of queue. 

 function empty(Q) ifhead=tail: return true; else: return false; end function; function insert(Q,x) S[head] =x; head = head + 1; end function; function find-earliest(Q) returnS[tail]; end function; function delete-earliest(Q) tail = tail + 1; end function; 

Note, a queue data structure exhibits a first-in-first-out property (while a stack is first-in-last-out). 

# Priority Queue 

In a priority queue, each element is associated with apriority(also called key). In other words, each element in a priority queue is a pair (key, value), wherekeyindicates its priority, whilevaluestores the actual data. Apriority queuedata structure supports the following operations. 

1. empty (PQ): decides if priority queuePQis empty; 

2. insert (PQ,x): add elementxtoPQ; 

3. find-min (PQ): return the element inPQwith smallest key (i.e., highest priority); 

4. delete-min (PQ): remove the element inPQwith smallest key (i.e., highest priority). 

---

5. decrease-key (PQ, pointer-to-an-element, new-key): set the key of the specified element as the given     new-key. 

Note that a queue can be regarded as a special case of priority, for which the priority is the time an element is added to the queue. 

There are numerous different implementations for priority queue (check wikipedia). Here we introduce one of them,binary [[heap]]. To do it, let’s first formally introduceheap. 

Aheapis a (rooted) tree data structure satisfies theheap property. A [[heap]] is either amin-heapif it satisfies themin-[[heap]] property: for any edge(u,v)in the (rooted) treeT, the key ofuis smaller than that ofv, or amax-heapif it satisfies themax-[[heap]] property: for any edge(u,v)in the (rooted) treeT, the key ofuis larger than that ofv. Here we always consider a [[heap]] as a min-[[heap]], unless otherwise specified. 

## 6 

## 15 

## 7 

## 9 

(^1122) 

## 8 

## 12 

## 10 

## 5 

 Figure 3: An example of [[heap]]. The key of an element is next to vertices 

Abinary heapis a [[heap]] with the tree being thecomplete binary tree. Acomplete binary treeis a binary tree (i.e., each vertex has at most 2 children) and that in every layer of the tree, except possibly the last, is completely filled, and all vertices in the last layer are placed from left to right. 

## 15 

## 9 

(^1122) 

## 12 

## 10 

## 5 

## 13 20 

## 14 

 Figure 4: An example of binary [[heap]]. 

Since a binary heapTis so regular, we can use an arraySto store its elements (rather than using adjacency list). The root (i.e., layer 0) ofTis placed inS[ 1 ](we assume that the index ofSstarts from 1), the first element of the layer 1 is placed inS[ 2 ], and so on. Generally, thej-th element in thei-th layer ofTwill be placed inS[ 2 i+j− 1 ]. We can also easily access the parent and children of an element: 

1. the parent element ofS[k]isS[k/ 2 ](floor ofk/2); 

2. the left child ofS[k]isS[ 2 k]; the right child ofS[k]isS[ 2 k+ 1 ]. 

---

We now introduce two common procedures used in implementing a binary [[heap]]. These procedures apply when one vertex violates the [[heap]] property, and they can adjust the [[heap]] to make it satisfy the [[heap]] property. 

Thebubble-upfunction applies when a vertex has a smaller key than its parent. 

 function bubble-up (S,k) p=k/2; if (S[k].key<S[p].key); swapS[p]andS[k]; bubble-up (S,p); end if; end function; 

## 15 

## 9 

(^1122) 

## 12 

## 10 

## 5 

## 8 20 

## 14 

## 15 

## 9 

(^1122) 

## 8 

## 10 

## 5 

## 12 20 

## 14 

## 15 

## 9 

(^1122) 

## 10 

## 8 

## 5 

## 12 20 

## 14 

 Figure 5: Illustrating bubble-up procedure. 

Thesift-downfunction applies when a vertex has a larger key than its children. 

 function sift-down (S,k) c=arg mint∈{ 2 k, 2 k+ 1 }S[t].keybe the index of the child ofS[k]with smaller key; if (S[k].key>S[c].key); swapS[c]andS[k]; sift-down (S,c); end if; end function; 

## 15 

## 9 

## 22 

## 14 

## 12 

## 10 

## 16 

## 18 20 

## 17 

## 15 

(^1622) 

## 10 

## 18 20 

## 17 

## 15 

## 9 

(^1622) 

## 10 

## 18 20 

## 17 

## 9 

## 14 

## 12 14 

## 12 

 Figure 6: Illustrating sift-down procedure. 

