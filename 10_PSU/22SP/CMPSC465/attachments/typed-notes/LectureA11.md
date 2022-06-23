# DFS with Timing and Properties 

Recall that the DFS-with-timing algorithm gives an interval[pre,post]for each vertex. For two vertices vi,vj∈V, their corresponding intervals can either bedisjoint, i.e., the two intervals do not overlap, or nested, i.e., one interval is within the other. See Figure 1. But two intervals cannot bepartially overlapping. Why? This is because the explore funtion is recursive. There are only two possiblities thatpre[i]<pre[j]. The first one is that explorevjiswithinexplorevi; in this case the recursive behaviour of explore leads to thatpost[j]<post[i], as explorevjmust return/terminate first and then exploreviwill return/terminate. This case corresponds to that the two intervals are nested. The second one is that explorevjstarts after explorevi finishes; this case corresponds to that the two intervals are disjoint. 

 pre[i] pre[j] post[j] post[i] [ [ ] ] 

## [ ] [ ] 

## [ [ ] ] 

 pre[i] post[i] pre[j] post[j] 

 pre[i] pre[j] post[i] post[j] 

 time 

 nested 

 disjoint 

 partially overlapping (not possible) 

 Figure 1: Relations between two[pre,post]intervals. 

We now show and prove a key claim that relates the post values and the meta-graph. 

Claim 1.LetCiandCjbe two connected components of directed graphG= (V,E), i.e.,CiandCjare two vertices in its coresponding meta-graphGM= (VM,EM). If we have(Ci,Cj)∈EMthen we must have that maxu∈Cipost[u]>maxv∈Cjpost[v]. 

Intuitively, following an edge in the meta-graph, the largest post value decreases. Before seeing a formal proof, please see an example in Figure 2: the largest post values forC 1 ,C 2 ,C 3 , andC 4 are 9, 6, 10, and 14, and you may verify that following any edge in the meta-graph, the largest post value always decreases. 

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

 DFS-with-timing(G) 

 v 6 

 v 4 

 v 7 

## ( 1 , 10 ) 

## ( 8 , 9 ) 

## ( 5 , 6 ) 

## ( 2 , 7 ) 

## ( 12 , 13 ) 

## ( 3 , 4 ) 

 ( 11 , 14 ) C 2 ={v 5 } 

 C 4 ={v 7 ,v 4 } 

 C 1 ={v 2 } C^3 ={v^1 ,v^3 ,v^6 } 

 meta-graphGM= (VM,EM)ofG 

Figure 2: Example of running DFS (with timing) on a directed graph. The[pre,post]interval for each vertex is marked next to each vertex. Thepostlistfor this run ispostlist= (v 4 ,v 7 ,v 1 ,v 3 ,v 6 ,v 2 ,v 5 ). 

Proof.Letu∗:=arg minu∈Ci∪Cjpre[u], i.e.,u∗is the first explored vertex inCi∪Cj. Consider the two cases. 

First, assume thatu∗∈Ci. Thenu∗can reach all vertices inCi∪Cj\{u∗}. Hence, all vertices inCi∪Cj\ 

---

 u∗ 

 Ci Cj 

 u∗ Ci Cj 

 Figure 3: Two cases in proving above claim. 

{u∗}will be exploredwithinexploringu∗. In other words, for any vertexv∈Ci∪Cj\{u∗}, the interval [pre[v],post[v]]is a subset of[pre[u∗],post[u∗]]. This results in two facts: maxu∈Cipost[u] =post[u∗]and maxv∈Cjpost[v]<post[u∗]. Combined, we have that maxu∈Cipost[u]>maxv∈Cjpost[v]. 

Second, assume thatu∗∈Cj. Thenu∗cannotreach any vertex inCi; otherwiseCi∪Cjform a single connected component, conflicting to the fact that any connected component must be maximal. Hence, all vertices inCiwill remain unexplored after exploringu∗. In other words, for any vertexv∈Ci, the interval[pre[v],post[v]]locates after (and disjoint with)[pre[u∗],post[u∗]]. This gives that maxu∈Cipost[u]> post[u∗]. Besides, we also have maxv∈Cjpost[v] =post[u∗]as all vertices inCj\{u∗}will be examined within exploringu∗. Combined, we have that maxu∈Cipost[u]>maxv∈Cjpost[v]. 

The above key claim directly suggest a property about the structure of the meta-graph, given below. 

Corollary 1. The list of all connected components inVMsorted in decreasing order of maxu∈Cipost[u], 1 ≤i≤k, is a linearization ofGM. 

Verify this is the case in Figure 2. Answer: such list is(C 4 ,C 3 ,C 1 ,C 2 ), and it is a linearization ofGM. 

Above property also suggests us to consider anordering of verticesin descending post values. Specifically, we definepostlistas such ordering of vertices. Notice that postlist can be stored in an array and can be efficiently constructed in DFS-with-time. Please refer to Lecture A10 for its pseudo-code. See Figure 2 for an example. 

As a direct consequence of Corollary 1 and the definition of postlist, we have the following property. This is true as “the first appearance” exactly gives the “largest post value” since the postlist is sorted in descending order of post values. 

Corollary 2. The list of all connected components inVMsorted by their first appearance of in the postlist is a linearization ofGM. 

Verify this is the case in Figure 2. Answer: followingpostlistthe corresponding list of connected components is(C 4 ,C 4 ,C 3 ,C 1 ,C 3 ,C 2 ,C 3 ). The first appearance of each component is(C 4 ,C 3 ,C 1 ,C 2 ), which is a linearization ofGMand exactly the one that is sorted by their largest post value. 

To summarize, now we can build a postlist that satisfies above Corollary 2. This almost achieves the desired property of the special ordering: “the ordering of connected components sorted by their first appearance in the special ordering should form a reverse-linearization of the meta-graph.” The only difference is that postlist implies alinearizationof the meta-graph while special ordering requires areverse-linearizationof the meta-graph. Below, we introducereverse graphto fill this gap. 

---

# Reverse Graph 

Definition 1.LetG= (V,E)be a directed graph. Thereverse graphofG, denoted asGR= (V,ER), has the same set of vertices and edges with reversed direction, i.e.,(u,v)∈Eif and only if(v,u)∈ER. 

 v 1 

 v 5 v^3 

 v 4 

 v 2 

 v 6 

 v 7 

 graph:G= (V,E) 

 v 8 

 v 10 

 v 9 

 C 1 ={v 6 ,v 9 ,v 10 } C^2 ={v^2 ,v^4 } 

 C 3 ={v 1 } 

 C 4 ={v 5 } C 5 ={v 3 ,v 7 ,v 8 } 

 meta-graph ofG:GM= 

## ( 

## VM,EM 

## ) 

 v 1 

 v 5 v^3 

 v 4 

 v 2 

 v 6 

 v 7 

 reverse graph:GR= (V,ER) 

 v 8 

 v 10 

 v 9 

 C 1 ={v 6 ,v 9 ,v 10 } C^2 ={v^2 ,v^4 } 

 C 3 ={v 1 } 

 C 4 ={v 5 } C 5 ={v 3 ,v 7 ,v 8 } 

 meta-graph ofGR:GMR= 

## ( 

## VM,EMR 

## ) 

 Figure 4: Graph and its reverse graph, and the corresponding meta-graphs. 

Following properties can be easily proved using above definition. 

Property 1. There is a path fromutovinGif and only if there is a path fromvtouinGR. In other words, ucan reachvinGif and only ifucan be reached fromvinGR. 

Property 2.(GR)R=G. 

Property 3.A vertexvof DAGGis a source vertex if and only ifvis a sink vertex ofGR. 

Property 4.GandGRhas the same set of connected components. 

Property 5. The meta-graph ofGRis the reverse graph of the meta-graph ofG. Formally,(GR)M= (GM)R. 

Property 6.Xis a linearization of DAGGif and only if the reverse ofXis a linearization ofGR(or,Xis a reverse-linearization ofGR). In particular, since any meta-graph is a DAG, we have thatXis linearization of GMif and only ifXis a reverse-linearization of(GM)R= (GR)M, and thatXis a linearization of(GR)M= (GM)Rif and only ifXis a reverse-linearization ofGM. 

---

# Algorithm to Determine Connected Components in Directed Graphs 

Combining above DFS-with-timing and reverse graph, here is the pseudo-code we use to obtain a special ordering. The key is that we run DFS-with-timing on the reverse graphGR, instead of on the given graphG. 

 Algorithm to determine the specific order buildGRofG; run DFS with timing onGRto getpostlist; returnpostlist; end algorithm; 

We now show that, abovepostlist, i.e., thepostlistobtained by running DFS-with-timing onGR, satisfies the condition that “the ordering of connected components sorted by their first appearance in abovepostlist forms a reverse-linearization of the meta-graphGM”. In fact, since abovepostlistis obtained by running DFS-with-timing onGR, according to Corollary 2, the list of all connected components sorted by their first appearance of in abovepostlistis a linearization of(GR)M. According to Property 6 of reverse graph, we know that a linearization of(GR)Mis a reverse-linearization ofGM. 

Abovepostlistcan then be used by the DFS algorithm as a special order to obtain all connected components, with pseudo-code copied below. 

 function DFS (G= (V,E)) num-cc = 0; forviin thepostlistobtained above if (visited[i] =0) num-cc = num-cc + 1; explore (G,vj); end if; end for; end algorithm; 

 function explore (G= (V,E),vi∈V) visited[i] =num-cc; for any edge(vi,vj)∈E if (visited[j] =0): explore (G,vj); end for; end algorithm; 

The entire algorithm runs inΘ(|V|+|E|)time. 

