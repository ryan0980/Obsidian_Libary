# 1 Introduction to Algorithms 

## Algorithm, Problem, and Instance 

What’s an algorithm? Algorithm is a sequence of unambiguous specifications/instructions for solving a problem. Such specifications can be followed by a human, or implemented with a machine program. The problemstudied in theoretical computer science needs to be formally defined, usually described using input and output. 

For example, consider thesorting problem: its input is an arrayA= [a 1 ,a 2 ,···,an], and its output is the sorted array, say in ascending order, ofA. 

A problem describes a template. It’s concrete, instantiated version is called aninstance. For example, an instance for above sorting problem would beA= [ 4 , 2 , 10 ,− 5 , 8 ]. The relationship between problem and instance is very similar to that betweenclassandobjectin object-oriented programming languages. You may also think a problem is the set of all its possible instances. 

## Principles of Algorithm Design 

There is always a straightforward algorithm to solve a problem, which is just enumerating all possible solution (and then pick the correct/best one). This is calledbrute-force. Brute-force may work for instances of size small, but in general it isnot efficient. 

We focus on designingefficientalgorithms in this course. Here, “efficient” means “runs in polynomial-time”, which we will formally define. There are two basic principles in designing efficient algorithms. Recall that analgorithmproduces asolutionfor aproblem. 

 1.Partitioning problem into smaller subproblems. This principle is from the perspective of problem. There are two strategies to reduce the size of a problem. First, we can partition a problem of sizen into smaller subproblems with size ofn−1; this strategy leads todynamic programmingalgorithms. Second, we can partition a problem of sizeninto smaller subproblems with size ofn/2; this strategy leads todivide-and-conqueralgorithms. 

 2.Iteratively Improving. This principle is from the perspective of solution, i.e., we start with an initial/trivial solution, and we then gradually improve it to finally obtain the (optimal) solution. There are two strategies. First, we can start with a feasible but non-optimal solution, and then gradually improve it to achieve an optimal solutions;linear programmingandnetwork flowalgorithms follow this strategy. Second, we can start with a partial-solution, and then gradually make it to a completesolution;greedy algorithms follow this strategy. 

## Relationship between Problems 

We not only design algorithms for individual problems, but also study the relationship between problems. This is very important. Studying how problems relate help in the following three folds. 

1. Allow us to build the hierarchy (i.e., classes of problems) and understand them. This is the targets of     theory of computational complexity. 

---

2. Allow us to solve new problems using existing algorithms. For example, if we know that problem     Xcan be transformed into problemY(we will formally define what does this mean) and we know a     good algorithm for problemY, and we know that we can use this algorithm forYto solveX. 

3. Allow us to prove that a problem is hard to solve. For example, if we know that problemXcan be     transformed into problemY, and that there does not exist any efficient algorithhm forX, then we know     that there does not exist efficient algorithm for problemY. 

## Example of Algorithm Design and Analysis 

Let’s consider the problem ofmerging two sorted arrays. The input of this problem is two sorted arrays, in ascending order,AandB, and the output is a sorted arrayCthat consists of all elements inAandB. An instance of this problem is:A= [− 4 , 2 , 5 , 8 ]andB= [− 3 , 2 , 3 , 4 ]. For this instance, the output should be C= [− 4 ,− 3 , 2 , 2 , 3 , 4 , 5 , 8 ]. 

 An algorithm usually requiresdata structuresto store key intermediate information. In this case, we maintain two pointers,kAandkB. Throughout the algorithm, we guarantee thatkAandkBpoint to the smallest number inAandBthat haven’t been added toC. 

 The idea of the algorithm is to iteratively constructC(so you may call it a greedy algorithm). In each step, we compare the two numbers at the two pointers: the smaller one of the two will be the smallest one in allnumbers that haven’t been added toC; we then add it toCand update the pointers accordingly. The pseudo-code for this algorithm is given below. function merge-two-sorted-arrays (A[ 1 ···m],B[ 1 ···n]) init an empty arrayC; (#units = 1) init pointerskA=1 andkB=1; (#units = 2) add a big numberM(larger than any number inAandB) to the end ofAandB:A[m+ 1 ] =Mand B[n+ 1 ] =M; (think: why we do it?); (#units = 2) fork= 1 →m+n(#units =m+n) ifA[kA]≤B[kB](#units =m+n) C[k] =A[kA]; (#units =a 1 ) kA=kA+1; (#units =a 2 ) else C[k] =B[kB]; (#units =m+n−a 1 ) kB=kB+1; (#units =m+n−a 2 ) end if; end for; returnC; (#units = 1) end algorithm; To analyze an algorithm, we need to (1) prove it’s correct, and (2) analyze its running time. 

 We first prove this algorithm is correct, i.e., the resultingCis sorted and includes all numbers inAandB. This seems obvious. To give a formal and complete proof, we define the followinginvariant. 

---

Invariant:For anyk= 0 , 1 , 2 ,···,m+n, at the end of thek-th iteration of above algorithm, we must have thatCstores the smallestknumbers inAandB,kAandkBpoints to the smallest number ofA\CandB\C, respectively. 

We now prove above invariant is correct, byinduction. The base case isk=0. At this time (i.e., before the for-loop and after the initialization),Cis empty andkAandkBpoints to the first number inAandB respectively (and therefore the smallest one, as the givenAandBare sorted). We now show the inductive step: assume that the invariant is correct fork= 0 , 1 ,···,i, we prove that the invariant is correct fork=i+1. The inductive assumption tells that at the end of thei-th iteration,C[ 1 ···i]stores the firstismallest numbers. Consider what the algorithm does in the(i+ 1 )-th iteration: it compare the numbers at the pointers, and adds the smaller one toC. As each pointer now points to the smallest one inA\CandB\C, we have that the smaller one is the(i+ 1 )-th smallest number inAandB. Besides, how the algorithm updates the pointers guarantees the pointers always point to the smallest one inA\CandB\C, respectively. Therefore, the invariant holds after(i+ 1 )-th iteration. 

We then analyze its running time. The running time is measured with thebasic computing unitsused by the algorithm in theworst case. The definition of basic computing units depends on the computing model. Usually, we think each operation like assignment, basic arithmetic operation, comparison, etc, takes 1 unit. The worst case is w.r.t. all instances, i.e., the instance takes largest number of computing units. 

The required units in each step of the algorithm is marked with blue text. LetT(m,n)be the running time of this algorithm when|A|=mand|B|=n. We can writeT(m,n) = 4 m+ 4 n+6. 

Note that the running time of an algorithm is a function ofinput size, rather than theinput. The input size is usually the amount of memory needed to store the actually input. In this example, array of sizemcan be stored in a block of memory withmmemory units. An implicit assumption here is that, every number in the given arrays can be stored in a single memory unit (for example, 32 bits to store an integer in C++). This is reasonable and widely used. In certain cases, where we study very large number (which cannot be stored in 32 bits for example), then we cannot assume that such number takes 1 memory unit; instead, a (large) numberxuses log 2 xbits in memory. 

The running time ofT(m,n) = 4 m+ 4 n+6 a brief, coarse estimation, as it depends on the computing model. Therefore, it doesn’t make much sense to keep the coefficients 4 and the constants 5. Besides, we care how the running time grows asmandngrows. Hence, it suffices to writeT(m,n) =Θ(m+n), meaning it grows as fast as functionm+n. We will introduce asymptotic notations to facilitate this way of analyzing running time in next lecture. 

