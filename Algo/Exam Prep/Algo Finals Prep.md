> [!NOTE]
> Lectures tagged with :warning: are essentially low-effort notes. Did not make them right before finals
>
> Lectures tagged with :white_check_mark: were made during finals
>
> Lectures tagged with :x: have not been made yet. Probs will not be if you see it the day after the exam =)

| Topic                                     | Status             |
| ----------------------------------------- | ------------------ |
| 18: Memoization                           | :x:                |
| 18: Tabulation                            | :x:                |
| 21: LCS                                   | :x:                |
| 19: matrix multiplication                 | :x:                |
| 18: rod cutting                           | :x:                |
| 20: knapsack                              | :x:                |
| 12: graph theory 1 (bfs)                  | :white_check_mark: |
| 13: graph theory 2 (dfs)                  | :white_check_mark: |
| 14:mst, prims, kruskal                    | :x:                |
| 15: dijkstra                              | :x:                |
| 16: bellman ford                          | :x:                |
| 10: kmp string matching                   | :x:                |
| 9: naive string matching, rabin karp algo | :x:                |
| 5: merge sort + recurrence relation       | :x:                |
| 6: quick sort                             | :x:                |
| 7: heap sort                              | :x:                |
| 8: linear sorts                           | :x:                |
| 4.1.1: recursion                          | :x:                |
| 4.1.2: recursion tree                     | :x:                |
| 4.2: recurrence relation                  | :x:                |
| 4.3: master method                        | :warning:          |
| 3: insertion sort                         | :x:                |
| 2: complexity analysis                    | :warning:          |

<!--
:white_check_mark:
:warning:
:x:
-->

# 18: Memoization
# 18: Tabulation
# 21: LCS
# 19: matrix multiplication
# 18: rod cutting
# 20: knapsack
# 12: graph theory 1

DiGraph => G=(V,E)

- Where V is the set of Vertices/Nodes
- E is set of Edges
- DiGraph has ordered set, undirected graph has unordered
- For a connected graph, the number of Edges is at least one less than the number of Nodes
	- LogBase2(Edges) is approx proportional to Log(Nodes)

**Graph representations**

| Criteria                     | Adjacency Matrix                               | Adjacency List                           |
|------------------------------|-----------------------------------------------|-----------------------------------------|
| **Space Complexity**         | O(V^2)                                        | O(V + E)                                |
| **Edge Existence Check**     | Efficient (Constant Time)                     | May take O(V) time in the worst case    |
| **Memory Usage**             | Proportional to V^2 (inefficient for sparse)  | Proportional to V + E (efficient)       |
| **Adding/Removing Edges**    | Less efficient, especially for dense graphs    | More efficient, especially for sparse graphs |
| **Graph Density**            | Better for dense graphs                        | Better for sparse graphs                |
| **Memory vs. Time Trade-off**| More memory-intensive, faster edge-checking   | More memory-efficient, slower edge-checking in certain cases |

# 13: graph theory 2
<!--**Breadth-First Search (BFS):**
1. **Initialization:**
    - Start with an initial node and enqueue it into a queue.
    - Mark the node as visited.
2. **Exploration:**
    - While the queue is not empty:
        - Dequeue a node from the front of the queue.
        - Explore all unvisited neighbors of the dequeued node.
        - Enqueue each unvisited neighbor into the queue and mark them as visited.
3. **Termination:**
    - Continue this process until the queue is empty, meaning all reachable nodes have been visited.

**Depth-First Search (DFS):**
1. **Initialization:**
    - Start with an initial node and push it onto a stack (or use recursion with the initial node as the starting point).
    - Mark the node as visited.
2. **Exploration:**
    - While the stack is not empty (or until the recursion base case is reached):
        - Pop a node from the stack.
        - Explore all unvisited neighbors of the popped node.
        - Push each unvisited neighbor onto the stack (or make a recursive call) and mark them as visited.
3. **Termination:**
    - Continue this process until the stack is empty (or until the recursion unwinds completely). -->

**BFS Working**

- Create 2 arrays (Visited, Queue) and push the src node to both
- deque first element and enqueue neighbors as they are visited. when visited, add to visited array and do not visit again
**DFS Working**
- Create 2 arrays (Visited, Stack) and push src node to Visited.
- Add adjacent nodes to Stack
- Pop first element and visit. Add to visited
- Repeat until stack is empty
**BFS VS DFS**

| Criteria                  | Breadth-First Search (BFS)                                                                                                                                             | Depth-First Search (DFS)                                                      |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| **Order of Exploration**  | Explores level by level, moving outward. Discovers all vertices at distance **k from s** before discovering any vertices at distance **k+1**. Siblings before children | Explores as far as possible along each branch. Child first then sibling nodes |
| **Data Structure**        | Uses a FIFO queue                                                                                                                                                      | Uses a stack (or recursion). LIFO                                             |
| **Memory Usage**          | Typically requires more memory due to the queue                                                                                                                        | Generally uses less memory                                                    |
| **Completeness**          | Always finds the shortest path in an unweighted graph                                                                                                                  | May not find the shortest path                                                |
| **Backtracking**          | Not suitable                                                                                                                                                           | Best for backtracking, but can be stuck in an infinite loop                   |
| **Termination Condition** | Terminates when the queue is empty                                                                                                                                     | Terminates when the stack is empty (or recursion unwinds)                     |
| **Applications**          | Shortest path, minimum spanning tree, network broadcasting, bipartite testing, finding all nodes within one connected component                                        | Topological sorting, maze solving, cycle detection                            |
| **Implementation**        | Often implemented iteratively with a queue                                                                                                                             | Can be implemented recursively or with a stack                                |
| **Algorithm Complexity**  | O(V + E) for adj lists and O(V<sup>2</sup>) for adj matrix                                                                                                                      | Same as BFS                                                                   |

**Topological Sort**

**Cycle Detection**

- DFS
	- Traverse the graph as normal. If a node is found that is not a direct parent of the current node then we have a cycle. (We got to the child without going through the parent first)
- BFS
	- Traverse the graph as normal. If a node is already visited during scanning then it means we found a new edge to encounter the same node i.e. a cycle
# 14:mst, prims, kruskal

**MST**

- Not unique, can have multiple versions
- Acyclic
- Num of Edges in MST is 1-Num of Vertices
**Spanning Tree**
- A subgraph that is acyclic and connected. If not connected then it is a Spanning Forest
- Undirected, if weighted then the least weight is used
- Greedy approach to keep as many edges as possible from the original graph. "Locally Optimal is Globally Optimal"
	- Theorem: T is MST(G) where G = (V,E). A is a proper subset of V i.e A is a direct neighbor
	- Suppose an Edge (u,v) is the least-weight connecting to A. Then that edge is also a safe edge in MST

**Prim's MST**

- Create an empty set for MST to be returned and an empty priority queue(Can be min/max heap)
- Choose a starting vertex randomly
	- Enqueue all edges connected to that vertex
	- Loop until queue is empty
		- Dequeue the edge with min weight
		- Extract vertices from edge
		- If not in MST Set then add only if it does not make a cycle

| Analysis based on memory use | Extract-Min | Decrease-Key | Total            |
| ---------------------------- | ----------- | ------------ | ---------------- |
| Array                        | O(V)        | O(1)         | O(V<sup>2</sup>) |
| Binary Heap                  | O(lg V)     | O(lg V)      | O(E lg V)        |
| Fibonacci Heap               | O(lg V)     | O(1)         | O(E + V lg V)    |

```python
T = {s}
enqueue edges connected to s in PQ (by inc weight)
while (!PQ.isEmpty)
  if (vertex v linked with e = PQ.remove ∉ T)
    T = T ∪ {v, e}, enqueue edges connected to v
  else ignore e
```

**Kruskal's MST**
- The forest is constructed – with each node in a separate tree
- The edges are placed in a priority queue (Essentially sorted the entire thing)
- Until we've added n-1 edges (assumption: connected graph)
	- Extract the cheapest edge from the queue
	- If it forms a cycle, reject it
	- Else add it to the forest. Adding it to the forest will join two trees
(Practice example from slides 13 and 14. Using the actual names of the .pptx files not the gcr numbering)

```python
Sort E edges by increasing weight
T = {}
for (i = 0; i < edgeList.length; i++)
  if adding e = edgelist[i] does not form a cycle
    add e to T
  else ignore e
```

**Prim's VS Kruskal's**

| Criteria                  | Prim's Algorithm                             | Kruskal's Algorithm                          |
|---------------------------|----------------------------------------------|---------------------------------------------|
| **Selection Criteria**    | Chooses the smallest edge connected to the growing MST | Sorts all edges and greedily selects the smallest edge that doesn't form a cycle |
| **Data Structures Used**  | Typically uses a priority queue or a min-heap to efficiently extract the minimum edge | Uses a disjoint-set data structure (Union-Find) to track connected components and detect cycles |
| **Efficiency**            | Generally more efficient on dense graphs with many edges | Generally more efficient on sparse graphs with fewer edges |
| **Implementation**        | Involves maintaining a priority queue and updating key values | Involves sorting all edges and using a disjoint-set data structure |
| **Edge Weights**          | Works well with both positive and negative edge weights | Works well with positive edge weights, not suitable for graphs with negative edge weights without modifications |
| **Parallelization**       | Challenging to parallelize efficiently due to dependencies | More amenable to parallelization as sorting and disjoint-set operations can be parallelized |
| **Applications**          | Commonly used in network design, such as routing and clustering | Widely used in various fields including network design, circuit design, and image segmentation |
| **Termination Condition** | Stops when all vertices are included in the MST | Stops when the MST has (V-1) edges, where V is the number of vertices |
| **Complexity**            | O((V + E) * log(V))                          | O(E * log(V)) since the running time is O(V + ElgE + ElgV) and E=O(V<sup>2</sup>)=>lgE=O(2lgV)                       |

# 15: dijkstra
# 16: bellman ford
# 10: kmp string matching
# 9: naive string matching, rabin karp algo
# 5: merge sort + recurrence relation
# 6: quick sort
# 7: heap sort
# 8: linear sorts
# 4.1.1: recursion
# 4.1.2: recursion tree
# 4.2: recurrence relation
# 4.3: master method

Suppose you are given the following equation where a >=1 and b>1$$T(n) = aT\left(\frac{n}{b}\right)+f(n) $$ where $$f(n)=Θ(n^klog^pn)$$

- Note that you're supposed to do a reverse thingy and find powers of K and P yourself
- Structure of Values to note down
	- A, B, K, P

**Cases**

- **Case 1** $$log_{b}a>k$$
	- Then just n^the greater value$$Θ(n^{log_{b}{a}})$$
- **Case 2** $$log_{b}a=k$$
	- Sub-cases
		- p > -1 == f(n) but p+1
			- $$Θ(n^klog^{p+1}n)$$
		- p = -1
			- $$Θ(n^kloglog(n))$$
		- p < -1
			- $$Θ(n^k)$$
- **Case 3** $$log_{ba}< k$$
	- Sub-cases
		- p >= 0 == f(n)
			- $$Θ(n^klog^pn)$$
		- p < 0 but only n^k
			- $$Θ(n^k)$$

# 3: insertion sort
# 2: complexity analysis
- **Platform Independence**
    - Ideal Algo
        - Each elementary operation takes 1 step of time
        - Each elementary instance occupies 1 unit of memory

**Analyzing an Algo statement**

- Order of O's
    - Goes in order of **Best** to **Worst**
        - O(1)
        - O(log(N))
        - O(N)
        - O(n*log(n))
        - O(n^m), where m is any number > 0
        - O(2^n)
        - O(!n)
- Simple Statement
    - Order of O(1)
    - Basic step = 1, as long as number of statements are constant
    - Examples
        - Assignments: `int x = y;`
        - Arithmetic Operations: `x += i;`
        - Array Referencing: `A\[j\] = 5;`
        - Conditionals (Most): `if(x<12){};`
- Simple Loop
    - Basic step = N x 1
    - Quiz Note:: For a reminder on how a for loop works
        - int i = 0. This is the starting point for the loop
        - i < n. This is a condition thats checked at the end of every iteration
        - i++.

```
//Here even if the loop increments by 
N it will still be N times and therefore 
the complexity is O(n)

	for(int i =0; i < n; i++){
		s      //Statement that does stuff
	}


//However for factors i.e the iterator being 
multiplied or divided the 
time complexity is O(log(n))

	for(int i =0; i < n; i*n){
		s      //Statement that does stuff
	}


//For the iterator going up in order of
power i.e from i^2 to i^3 or from 
i^2 to sqrt(i) the complexity is O(log(log(n)))

	for(int i =0; i < n; i=pow(i,c)){
		s      //Statement that does stuff
	}



> 2^(c^i) = n      //Take log of base 2 on both sides
> log2(2^(c^i)) = log2(n)
> c^i = log(n)     //Take log of base c on both sides
> logc(c^i) = logc(log(n)
> i = log(c(log(n)))
```

- Nested Loops
    - Basic step = i x j
    - Where i and j increment by one only
    - order of O(n2)

```
for(int i =0; i < n; i++){
	for(int j =0; j < n; j++){
		s      //Statement that does stuff
	}
}
```

- Inner Loop depends on Outer Loop
    - Where Outer loop goes till N and inner loop goes till outer loop index
        - Inner loop is executed N time while the outer loop is
    - Pick the highest order `This went over my head`
    - order of O(n2) thru n(n+1)/2

```
for(int i =0; i < n; i++){
	for(int j =0; j < i; j++){
		s      //Statement that does stuff
	}
}
```

- Array
    - Loop where a Sum of all elements is calculated

**Analyzing sequence of statements**

- Generally observe the time complexity of each statement line-by-line and sum it all up.
    - The sum is the final answer with the coefficients and low order factors discarded
- If-Statements
    - These statements themselves are always o(1)
    - However, Big-Oh assumes the worst case/Upper limit therefore we pick whatever higher order value for O() we can get

**Why are we not so exact with numbers?**

- Constants/Coefficients do no matter
- This is due to **Asymptotic Complexity** as N gets large, concentrate on the highest order term
    - This is due to the fact that time is linear in N
    - We can approximate the complexity of an algorithm
        - This is due to the fact that a lot of operations take varying amounts of time and are hardware-dependent
- Time complexity is shown as
    - Big O (Upper bound)
    - Theta (Tighter bound)
    - Omega (Lower bound)
        - There is also little-o and little omega, same scenes just that theres no equal sign.

**Asymptotic Analysis**

- Simple way to go about this, use the table function in your calculator to get a list of values
    - Basically bruteforcing ur way until the equality fails or passes, need to look for the point where it changes and it should give you solid enough proof to use
- Do not forget to use log **BASE 2** not **BASE 10**
- Highly likely the first change in growth wont be the only one, check for others if you find one point of intersection
- Equality Signs
    - Omega >=
    - Theta ==
    - Big-O <=
    - Little-O <
    - Little-Omega >

**Properties of O notation**

- Fastest growing term dominates
    - for example, n^2 at some point can and will grow faster than n^3
- Transitive
    - Product of upper bounds is the upper bound for the entire thing
- All logarithms grow at the same rate
    - Exponentials grow **slower** than powers
    - Logarithms grow **faster** than powers
- Sum of the first m-th powers grows as the m+1-th power$$n^m$$