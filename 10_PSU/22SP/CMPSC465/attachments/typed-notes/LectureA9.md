# DFS and Connectivity of Graphs 
[[LectureA9.pdf]]
Recall that theexplorefunction starting from a given vertexvfinds all vertices inGreachable fromv. Below we give two examples of runningexplore. 

 v 1 

 v 3 

v (^5) v 4 v 2 v 1 →(v 2 ,v 3 ) v 2 →(v 1 ,v 5 ) v 3 →(v 1 ,v 4 ,v 5 ) v 4 →(v 3 ,v 5 ) v 5 →(v 2 ,v 3 ,v 4 ) v 6 v 7 v 6 →(v 7 ) v 7 →(v 6 ) input graph:G= (V,E) adjacency list ofG explore(G,v 1 ) final array ofvisited 1 1 1 1 1 0 0 Figure 1: Runningexplore(G,v 1 )on an undirected graph. v 1 v 3 v 5 v^4 v 2 v 1 →(v 2 ,v 3 ) v 2 →(v 5 ) v 3 →(v 5 ) v 4 →(v 3 ,v 5 ) v 5 →() v 6 v 7 v 6 →(v 1 ,v 3 ) v 7 →(v 4 ,v 6 ) input graph:G= (V,E) adjacency list ofG explore(G,v 1 ) final array ofvisited 1 1 1 0 1 1 0 Figure 2: Runningexplore(G,v 1 )on an directed graph. We now define “connected” and “connected component” to formally reveal the connectivity-structure of graphs. Letu,v∈V. We sayuandvareconnectedif and only if there exists a path fromutov andthere exists a path fromvtou. We note that this definition applies to both directed and undirected graph. In undirected graph, the existence of a path fromutovimplies the existence of a path fromvtou. However, this is not necessarily true in directed graphs. For example, in Figure 2, there exists a path fromv 1 tov 5 but there is no path fromv 5 tov 1 (so they are not connected). LetG= (V,E). LetV 1 ⊂V. We sayV 1 is aconnected componentofG, if and only if (1), forevery pair of u,v∈V 1 ,uandvare connected, and (2),V 1 ismaximal, i.e., there does not exists vertexw∈V\V 1 such thatV 1 ∪{w}satisfies condition (1). For example, in Figure 2,{v 1 ,v 3 ,v 6 }is a connected component;{v 2 } 

---

is a connected component;{v 1 ,v 3 }is not a connected component (as it is not maximal, i.e., does not satisfy condition 2). 

The explore algorithm identifies all vertices that can be reached fromvi. Hence, in the case of undirected graphs, these vertices (includingvi) are pairwise reachable, i.e., they form a connected component ofG(summarized below). In other words,explore(G,vi)identifies the connected component ofGthat includesvi. 

Fact 1. For undirected graphs, afterexplore(G,vi), the vertices that are marked by visited, i.e.,{vj| visited[j] = 1 }forms a connected component ofGthat includesvi. 

However, the above fact does not apply to directed graph: Figure 2 gives such an example, where{v 1 ,v 2 ,v 3 ,v 5 ,v 6 } does not form a connected component. Note: in directed graphs{vj|visited[j] = 1 }are still those vertices that are reachable fromvi; it’s just that they may not be a connected component ofG. 

How to identifyallconnected components of an undirected graph? We can run above explore algorithm multiple times, each of which starts from an un-explored vertex, until all vertices are explored. To keep track of which vertices are in which connected component, we will introduce variablenum-ccto store the index of current connected component. We redefine the behavior ofvisitedarray: visited[j] =0 still represents thatvjhas not yet been explored;visited[j] =k,k≥1, represents thatvjhas been explored andvjis in the k-th connected component. 

This new algorithm that traverses all vertices and edges of a graph is named as DFS (depth first search). We also slightly changed the explore function, which allows to store which connected component each vertex is in. The pseudo-codes are given below. 

 function DFS (G= (V,E)) num-cc = 0; visited[i] =0, for all 1≤i≤|V|; fori= 1 →|V| if (visited[i] =0) num-cc = num-cc + 1; explore (G,vi); end if; end for; end algorithm; function explore (G= (V,E),vi∈V) visited[i] =num-cc; for any edge(vi,vj)∈E if (visited[j] =0): explore (G,vj); end for; end algorithm; 

Below we gave examples of running DFS on undirected graphs and undirected graphs. 

DFS runs inΘ(|E|+|V|)time. This is because, each vertex is explored exactly once, and each edge is examined exactly once (in the case of directed graphs) or exactly twice (in the case of undirected graphs). 

---

 v 1 

 v 3 

v (^5) v 4 v 2 v 1 →(v 2 ,v 3 ) v 2 →(v 1 ,v 5 ) v 3 →(v 1 ,v 4 ,v 5 ) v 4 →(v 3 ,v 5 ) v 5 →(v 2 ,v 3 ,v 4 ) v 6 v 7 v 6 →(v 7 ) v 7 →(v 6 ) input graph:G= (V,E) adjacency list ofG final array ofvisitedafter runningDFS(G)^1111122 Figure 3: RunningDFS(G)on an undirected graph. v 1 v 3 v 5 v^4 v 2 v 1 →(v 2 ,v 3 ) v 2 →(v 5 ) v 3 →(v 5 ) v 4 →(v 3 ,v 5 ) v 5 →() v 6 v 7 v 6 →(v 1 ,v 3 ) v 7 →(v 4 ,v 6 ) input graph:G= (V,E) adjacency list ofG final array ofvisitedafter runningDFS(G)^1112113 Figure 4: RunningDFS(G)on a directed graph. Fact 2. For undirected graphs, DFS (G) identifies all connected components ofG: {vj|visited[j] =k} constitutes thek-th connected component ofG. Again, the above fact does not apply to directed graphs:{vj|visited[j] =k}are not necessarily form a connected component, although you can still run DFS on directed graphs. In Figure 4,{vj|visited[j] = 1 } gives such an counter-example. To prepare revealing the connectivity-structure of directed graphs, we first introduce a spsecial class of directed graphs, given below. 

# Directed Acyclic Graph (DAG) 

Definition 1(DAG).A directed graphG= (V,E)isacyclicif and only ifGdoes not contain cycles. 

Definition 2(Linearization / Topological Sorting).LetG= (V,E)be a directed graph. LetXbe an ordering ofV. IfXsatisfies: if(vi,vj)∈E, thenviis beforevjinX, then we sayXis a linearization (or toplogical sorting) ofG. 

See some examples below. 

---

 v 1 

 v 3 

 v 5 v^4 

 v 2 v 6 

 (v 2 ,v 1 ,v 5 ,v 3 ,v 4 ,v 6 ) linearization? Yes (v 2 ,v 5 ,v 1 ,v 4 ,v 3 ,v 6 ) linearization? Yes (v 2 ,v 5 ,v 3 ,v 4 ,v 1 ,v 6 ) linearization? No, see edge(v 1 ,v 3 ) (v 2 ,v 1 ,v 4 ,v 5 ,v 3 ,v 6 ) linearization? No, see edge(v 5 ,v 4 ) 

 Figure 5: Examples of linearization. 

If a directed graphGadmits a linearization, then we sayGcan belinearized. We now show that linearization is anequivalentcharacterization of DAGs. 

Claim 1. A directed graphGcan be linearized if and only ifGis a DAG. 

Proof. Let’s first prove that ifGcan be linearized, thenGis a DAG. This is equivalent to proving its contraposition: ifGcontains a cycle, thenGcannot be linearized. Suppose that there exists an cycle vi 1 →vi 2 →···→vik→vi 1 inG. Then the linearizationXmust satisfy thatvijis beforevij+ 1 for allj= 1 , 2 ,···,k−1, and thatvikis beforevi 1 , inX. Clearly, this is not possible. 

The other side of the statement, i.e., ifGis a DAG, thenGcan always be linearized, can be proved constructively. We will design an algorithm (see below), that constructs a linearization for any DAG. 

