# Asymptotic Notations 

## Definitions and Properties 

Definition 1(Big-O).Letf=f(n)andg=g(n)be two positive functions over integersn. We wayf= O(g), if there exists positive numberc>0 and integerN≥0 such thatf(n)≤c·g(n)for alln≥N. 

Similarly, we can define Big-O for multiple-variable functions. 

Definition 2(Big-O). Letf=f(m,n)andg=g(m,n)be two positive functions over integersmandn. We wayf=O(g), if there exists positive numberc>0 and integersM≥0 andN≥0 such that f(m,n)≤ c·g(m,n)for allm≥Mandn≥N. 

Intuitively, Big-O is analogous to “≤”. 

Example. Let f(m,n) = 4 m+ 4 n+5 andg(m,n) =m+n. We now show that f=O(g), using above definition. To show it, we need to findc,M, andN. What are good choices for them? There are lots of choices; one set of it is:c=7,M=1, andN=1. Let’s verify:f(m,n)−c·g(m,n) = 4 m+ 4 n+ 5 − 7 m− 7 n= 5 − 3 m− 3 n≤ 5 − 3 − 3 =− 1 ≤0, where we use thatm≥M=1 andn≥N=1. This proves that f=O(g). 

Definition 3(Big-Omega).Letf=f(n)andg=g(n)be two positive functions over integersn. We way f=Ω(g), if there exists positive numberc>0 and integerN≥0 such thatf(n)≥c·g(n)for alln≥N. 

Similarly, we can define Big-Omega for multiple-variable functions. 

Definition 4(Big-O). Letf=f(m,n)andg=g(m,n)be two positive functions over integersmandn. We wayf=Ω(g), if there exists positive numberc>0 and integersM≥0 andN≥0 such that f(m,n)≥ c·g(m,n)for allm≥Mandn≥N. 

Intuitively, Big-Omega is analogous to “≥”. 

Example. Let f(m,n) = 4 m+ 4 n+5 andg(m,n) =m+n. We now show that f=Ω(g), using above definition. To show it, we need to findc,M, andN. We can choose:c=1,M=0, andN=0. Let’s verify: f(m,n)−c·g(m,n) = 4 m+ 4 n+ 5 −m−n= 5 + 3 m+ 3 n≥ 5 ≥0, where we use thatm≥M= 0 andn≥N=0. This proves thatf=Ω(g). 

Claim 1. f=O(g)if and only ifg=Ω(f). 

Proof.We have 

 f=O(g) ⇔ ∃c> 0 ,N≥ 0 ,s.t.f(n)≤c·g(n),∀n≥N ⇔ ∃c> 0 ,N≥ 0 ,s.t. 1/c·f(n)≤g(n),∀n≥N ⇔ ∃c′= 1 /c> 0 ,N≥ 0 ,s.t.g(n)≥c′·f(n),∀n≥N ⇔ g=Ω(f) 

Definition 5(Big-Theta). We sayf=Θ(g)if and only iff=O(g)andf=Ω(g). 

Intuitively, Big-Theta is analogous to “=”. 

Example.Letf(m,n) = 4 m+ 4 n+5 andg(m,n) =m+n. We havef=Θ(g)as we proved thatf=O(g) 

---

and thatf=Ω(g). 

Below we give an equivalent description of Big-Theta. 

Fact 1. Letfandgbe two positive functions. Thenf=Θ(g)if and only if limn→∞f(n)/g(n) =c>0. 

Example. Let f(m,n) = 4 m+ 4 n+5 andg(m,n) =m+n. We now show f=Θ(g)using above fact. limm→∞,n→∞f/g=limm→∞,n→∞( 4 m+ 4 n+ 5 )/(m+n) = 4 >0. Hence,f=Θ(g). 

Definition 6(small-o). Letf=f(n)andg=g(n)be two positive functions. We sayf=o(g)if and only if limn→∞f(n)/g(n) =0. 

Intuitively, small-o is analogous to “<”. 

Example. Letf(n) =nandg(n) =n^2. We now show f=o(g)using above definition. limn→∞f/g= limn→∞n/n^2 =limn→∞ 1 /n=0. Hence,f=o(g). 

## Commonly-Used Functions in Algorithm Analysis 

In theoretical computer science, we often see following categories of functions. 

1. logarithmic functions: log logn, logn,(logn)^2 ; 

2. polynomial functions: 

### √ 

 n=n^0.^5 ,n,nlogn,n^1.^001 ; 

3. exponential functions:n^2 ,n 2 n, 3n; 

4. factorial functions:n!; 

In above lists, any logarithmic function is small-o of any polynomial function: for example,(logn)^2 = o(n^0.^01 ); any polynomial function is small-o of any exponential function: for example,n^2 =o( 2 n); any exponential function is small-o of any factorial function: for example,n 2 n=o(n!). Within each category, a function to the left is small-o of a function to the right, for examplenlogn=o(n^1.^001 ). 

# Merge-Sort 

We now start introducing the first algorithm-design technique: divide-and-conquer. A typical divide-andconquer algorithm follows the framework below. 

1. partition the original problem into smaller problems; 

2. recursively solve all subproblems; 

3. combine the solutions of the subproblems to obtain the solution of the original problem. 

We use sorting as the first problem to demonstrate designing divide-and-conquer algorithms. Recall that the sortingproblem is to find the sorted array (say, in increasing order)S′of a given arrayS. We now design a divide-and-conquer algorithm for it. For any recursive algorithm, we always need to clearly define the recursion. In this case, we define function merge-sort (S) returns the sorted array (in ascending order) ofS. 

---

The idea is to sort the first half and second half ofS, by recursively call the merge-sort function. How to obtain the sorted array ofSthen with the two sorted half-sized arrays? We have introduced such an algorithm to merge two sorted arrays into a single sorted array. That’s exactly the algorithm we need here in the combining step. 

 Algorithm merge-sort (S[ 1 ···n]) ifn≤1: returnS; S′ 1 =merge-sort (S[ 1 ···n/ 2 ]); S′ 2 =merge-sort (S[n/ 2 + 1 ···n]); return merge-two-sorted-arrays (S′ 1 ,S′ 2 ); end algorithm; 

