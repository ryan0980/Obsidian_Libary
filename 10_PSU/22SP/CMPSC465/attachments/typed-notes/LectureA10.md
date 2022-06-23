# Directed Acyclic Graphs 

LetG= (V,E)be a directed graph. If a vertexv∈Vdoes not have any in-edges (i.e.,in-degreeis 0), we call itsource vertex; if a vertexv∈Vdoes not have any out-edges (i.e.,out-degreeis 0), we call itsink vertex. 

A directed graph may contain multiple source vertices or sink vertices, or may not have any source vertex or sink vertex. (Can you give such examples?) 

Claim 1. A DAGG= (V,E)always has source vertex and sink vertex. 

Proof.Let’s prove it by contradiction. Assume thatGdoes not contain any source. First,Gmust not contain self-loop as otherwiseGwon’t be a DAG. Letvbe any vertex inV. Asvis not a source, we know that there exists some vertexupoints tov, i.e.,(u,v)∈E. Now sinceuis not a source then there must exist another vertexwsuch that(w,u)∈E. Notice thatw 6 =vas otherwise there will be a cycle:v=w→u→v. This means thatwis a new vertex. Again aswis not a source, there must exist anothernewvertex points to it. This process can be extended infinitely following the fact and assumption thatGis a DAG and all vertices not are sources, but this is not possible as the number of vertices is limited. The existence of sink can be proved symmetrically. 

Following above fact, we can design an algorithm to find a linearization of a DAG: it iteratively finds source vertex and removes it and its adjacent edges. 

 Algorithm find-linearization (G= (V,E)) initXas empty list; while (|X|<|V|) arbitrarily find a source vertexuofG; adduto the end ofX; removeuand its adjacent edges; end while; end algorithm; 

This algorithm is correct. First, when a vertexuis added toX, it is a source vertex of the current graph, which means that{w|(w,u)∈E}is either empty or all of them have been added toX. Second,Xwill include all vertices. This is because, a source always exists in a DAG (as we just proved). The above algorithm is more a framework, as how we update the graph is not given specifically, and which affects the running time. 

Above algorithm also gives a constructive proof that, a DAG can always be linearized. This completes the proof stated in previous lecture: a directed graph is a DAG if and only if it can be linearized. 

Claim 2. LetXbe any linearization of a DAG. Then the first vertex ofXis a source vertex and the last vertex of ofXis a sink vertex. 

Proof. Letv 1 be the first vertex ofX. Suppose thatv 1 is not a source ofX. By definition of (not being a) source vertex, there exists(u,v 1 )∈E. Then by the definition of linearization, we know thatuwill be beforev 1 inX, contradicting to the fact thatv 1 is the first element ofX. The other side can be proved symmetrically. 

We can use above algorithm to constructively prove following statement. 

---

Claim 3.LetG= (V,E)be a DAG. A vertexu∈Vis a source if and only if there exists a linearizationX ofGsuch thatuis the first vertex inX. 

Proof.We first prove that, ifuis a source, then there exists a linearization whereuis the first vertex ofX. We prove it by showing that, we can construct such a linearizationX. We can use above algorithm, and in its first step, we simply picku. The correctness of above algorithm explains the rest. The other side is exactly Claim 2, which we have proved. 

# Connectivity of Directed Graphs 

For a directed graphG= (V,E), its structure of connectivity can be represented as a new directed graph, calledmeta-graph, denoted asGM= (VM,EM). Each of the vertices of the meta-graph corresponds to a connected component ofG, and two verticesCi,Cj∈VMare connected by edge(Ci,Cj)∈EMif and only if there exists edge(u,v)∈Esuch thatu∈Ciandv∈Cj. An example of meta-graph is given below. 

 v 1 

 v 3 

 v 5 

 v 4 

 v 2 v 9 

 v 7 

 v 6 

 v 8 

 v 10 

## C 1 

## C 2 

## C 4 

## C 3 

## C 2 

## C 4 

## C 1 C^3 

 Figure 1: Example of meta-graph. 

Meta-graph has an important property: it does not contain cycles, i.e., it is a directed acyclic graph (DAG). 

Claim 4. The meta-graphGMof any directed graphGis a directed acyclic graph. 

Proof.Suppose conversely thatGMcontains a cycle,C 1 →C 2 →Ck→C 1 , then the union of the vertices in these connected components form a single connected component, contradicting to themaximalproperty of connected component. 

We now design algorithms to determine the connected components of directed graphs and then to construct the corresponding meta-graph. Recall that the DFS algorithm introduced in Lecture A9 can successfully determine all connected components in an undirected graph. Does this work also work for directed graph? Let’s try. See Figure 2. Recall that the (top-layer) of the DFS algorithm is to tranverse all vertices in some ordering, and if the current vertexvis not yet visited, we will explorev. For the example in Figure 2, let’s try it with the (natrual) orderingv 1 ,v 2 ,···,v 10. The resulting visited array is given in the figure (please make sure you try it yourself). Unfortunately, it does not give all connected components. In fact, the vertices marked as “1”s are the union ofC 3 andC 4 , and the vertices marked as “2”s are the union ofC 1 andC 2. The reason is quite clear: we start with explorev 1 , and during it all vertices reachable fromv 1 will be marked as “1” in the visted array. It turns out thatv 1 is in connected componentC 4 , andC 4 can reachC 3 in the 

---

meta-graph. Therefore, all vertices inC 4 andC 3 are reachable fromv 1 ; consequently, the visited array is set as “1” for vertices inC 4 andC 3 during explorev 1. Similarly, we can also see why the vertices marked as “2”s are the union ofC 1 andC 2. After exploringv 1 ,{v 1 ,v 2 ,v 7 }are visited; the next unvisited vertex is v 3 according to above natural ordering, the the algorithm will explorev 3. Again, during it all (unvisited) vertices reachable fromv 3 will be marked as “2” in the visted array. It turns out thatv 3 is in connected componentC 1 , andC 1 can reachC 2 in the meta-graph. Therefore, all vertices inC 1 andC 2 are reachable fromv 2 ; consequently, the visited array is set as “2” for vertices inC 1 andC 2. 

 v 1 v 3 

 v 5 

 v 4 

 v 2 

 v 9 v^7 

 v 6 

 v 8 

 v 10 

## C 1 

## C 2 

## C 4 

## C 3 

## C 2 

## C 4 

## C 1 C^3 

 final array ofvisitedafter running DFS with ordering(v 1 ,v 2 ,···,v 10 ): 

## 1 1 2 2 2 2 1 2 2 2 

 v 1 v 2 v 3 v 4 v 5 v 6 v 7 v 8 v 9 v 10 

 final array ofvisitedafter running DFS with a special ordering(v 2 ,v 7 ,v 4 ,v 6 ,v 8 ,v 1 ,v 3 ,v 9 ,v 10 ,v 5 ):^2143332434 

 v 1 v 2 v 3 v 4 v 5 v 6 v 7 v 8 v 9 v 10 

Figure 2: Run the DFS algorithm with an arbitrary ordering (introduced in Lecture A9) and a special ordering (pseudo-code given below) on above example. 

How to fix this issue? The idea is to use aspecial orderingof vertices, instead of an arbitrary ordering, in above DFS. This special ordering should allow us to determine connected component one by one. Hence, the first vertex we explore in DFS, should be one vertex in asinkcomponent of the meta-graph. In Figure 2, the only sink component isC 3 , and since there is only one vertex inC 3 , we should start with exploring v 2. Clearly, exploringv 2 will exactly determine the single connected componentC 2. Next, afterC 3 is determined, the next component we can determine is again a sink component after removingC 3 from the meta-graph. It isC 4. So, the next vertex the DFS should explore must bev 1 orv 7. It does matter which one we pick; let’s assume we pickv 7 (and it does not matter wherev 1 is in the ordering as long as it is afterv 2 andv 7 ). Clearly, exploringv 2 will exactly determine the single connected componentC 4 —see the visited array. The next component we can determine is again a sink component after removingC 3 andC 4 from the meta-graph. It isC 2. So, the next vertex the DFS should explore must be in{v 4 ,v 5 ,v 6 ,v 9 }. And it does matter which one we pick neither the ordering of remaining ones as long as they are behind the one we pick. Let’s say we pickv 4. Clearly, exploringv 4 will exactly determine the single connected componentC 2. Now the only component remaining isC 1 after removingC 2 ,C 3 andC 4 from the meta-graph. So, the next vertex the DFS should explore must be in{v 3 ,v 8 ,v 10 }. Let’s say we pickv 8. Clearly, exploringv 8 will exactly determine the last connected componentC 1. 

To abtract above observation, the determined connected components with above DFS forms a reverse

---

linearization of the meta-graph. Therefore, the special ordering of vertices should satisfy this condition: the ordering of connected components sorted by their first appearance in the special ordering of vertices should form a reverse-linearization of the meta-graph. And if the special ordering of vertices satisfies this condition, the DFS algorithm will work—it will identify all connected components. 

Again see Figure 2, the ordering(v 2 ,v 7 ,v 4 ,v 6 ,v 8 ,v 1 ,v 3 ,v 9 ,v 10 ,v 5 )satisfies above condition. To see that, the corresponding list of connected components is(C 3 ,C 4 ,C 2 ,C 2 ,C 1 ,C 4 ,C 1 ,C 2 ,C 1 ,C 2 ), and hence the ordering of their first appearance is(C 3 ,C 4 ,C 2 ,C 1 )which is indeed a reviers-linearization of the meta-graph. 

 function DFS (G= (V,E)) num-cc = 0; forviin a specific order if (visited[i] =0) num-cc = num-cc + 1; explore (G,vj); end if; end for; end algorithm; 

 function explore (G= (V,E),vi∈V) visited[i] =num-cc; for any edge(vi,vj)∈E if (visited[j] =0): explore (G,vj); end for; end algorithm; 

To summarize, the algorithm to identify connected components of directed graphs is essentially the same with that for undirected graphs (introduced in Lecture A9, copied above), except a single line of difference (marked blue): for directed graphs, we need to explore vertices in a specific order that satisfy above condition, while for undirected graphs, we can explore all vertices in any arbitrary order. 

How to find an ordering of vertices that satisfy above condition? We need a combination of two techniques: DFS-with-timing and reverse-graph. 

# DFS with Timing 

The DFS-with-timing is a variant of DFS, which uses the following data structures (we assumen=|V|): 

1. variable clock servers as a timer that stores the current time; 

2. binary arrayvisited[ 1 ..n], wherevisited[i]indicates ifv[i]has been explored, 1≤i≤n; 

3. arraypre[ 1 ..n], wherepre[i]records the time of starting exploringvi, 1≤i≤n; 

4. arraypost[ 1 ..n], wherepost[i]records the time of finishing exploringvi, 1≤i≤n; 

5. arraypostlist, stores the vertices in increasing order ofpost[·]. 

---

The pseudo-code of DFS with timing is given below. 

 function DFS-with-timing (G= (V,E)) clock=1; fori= 1 →|V| if (visited[i] =0): explore (G,vi); end for; end algorithm; 

 function explore (G= (V,E),vi∈V) visited[i] =1; pre[i] =clock; clock++; for any edge(vi,vj)∈E if (visited[j] =0): explore (G,vj); end for; post[i] =clock; clock++; addvito the end ofpostlist; end algorithm; 

An example of running DFS with timing is given below. Notice that the DFS searching partitions all edges into two categories: solid edges(u,v)implies thatvis visited for the first time (and therefore explorevwill start right now), while dashed edges(u,v)implies that at that timevhas been visited already (and therefore vwill be skipped and the next adjacent vertex ofuwill be examined in the for-loop). 

 v 1 

 v 3 

 v 5 v^4 

 v 2 

 v 6 

 v 7 

 input graph:G= (V,E) 

 v 1 

 v 3 

 v 5 

 v 2 

 DF S(G)with timing 

 v 6 

 v 4 

 v 7 

## ( 1 , 10 ) 

## ( 2 , 5 ) 

## ( 3 , 4 ) 

## ( 6 , 9 ) 

## ( 12 , 13 ) 

## ( 7 , 8 ) 

## ( 11 , 14 ) 

Figure 3: Example of running DFS (with timing) on a directed graph. The[pre,post]interval for each vertex is marked next to each vertex. Thepostlistfor this run ispostlist= (v 5 ,v 2 ,v 6 ,v 3 ,v 1 ,v 7 ,v 4 ). 

