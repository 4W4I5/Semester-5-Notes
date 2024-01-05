> [!NOTE]
> Lectures tagged with :warning: are essentially low-effort notes. Did not make them right before finals
>
> Lectures tagged with :white_check_mark: were made during finals
>
> Lectures tagged with :x: have not been made yet.
>
> Lectures tagged with :exclamation: will not be made.

| Topic                                     | Status                                       | Prep(Ignore this, its for personal use) |
| ----------------------------------------- | -------------------------------------------- | --------------------------------------- |
| 18:  Dynamic Programming: Memoization     | :warning:                                          | :warning:                               |
| 18: Dynamic Programming: Tabulation       | :warning:                                          | :warning:                               |
| 21: LCS                                   | :warning:                                          | :white_check_mark:                               |
| 19: matrix multiplication                 | :warning:                                          | :white_check_mark:                               |
| 18: rod cutting                           | :warning:                                          | :warning:                                     |
| 20: knapsack                              | :warning:                                          | :white_check_mark:                                     |
| 12: graph theory 1 (bfs)                  | :white_check_mark:                           | :warning:                               |
| 13: graph theory 2 (dfs)                  | :white_check_mark:                           | :warning:                               |
| 14:mst, prims, kruskal                    | :white_check_mark:                           | :warning:                               |
| 15: dijkstra                              | GPT Content :warning:                        | :warning:                               |
| 16: bellman ford                          | GPT Content :warning:                        | :warning:                               |
| 9: naive string matching, rabin karp algo | Incomplete :x:                               | :warning:                               |
| 10: kmp string matching                   | Incomplete :x:                               | :warning:                               |
| 2: complexity analysis                    | :white_check_mark:                           | :warning:                                     |
| 4.1.1: recursion                          | :white_check_mark:                           | :warning:                                     |
| 4.1.2: recursion tree                     | :white_check_mark:                           | :warning:                                     |
| 4.2: recurrence relation                  | :white_check_mark:                           | :warning:                                     |
| 4.3: master method                        | :white_check_mark:                           | :white_check_mark:                      |
| 3: insertion sort                         | :white_check_mark:                           | :white_check_mark:                      |
| 5: merge sort                             | Recurrence Relation + Tree missing :warning: | Practice recurrence :warning:           |
| 6: quick sort                             | :x:                                          | Practice working :warning:              |
| 7: heap sort                              | :x:                                          | :x:                                     |
| 8: linear sorts                           | :x:                                          | :x:                                     |

<!--
:white_check_mark:
:warning:
:x:
-->

# 18: Dynamic Programming: Memoization
- Top Down approach for recursive solutions. Example of divide and conquer in some way
- Solves recurring subproblems by caching the answer for smaller subproblems
	- Only computations that are required are solved. Lazy method.
- Table filled on demand. Can be called a form of caching
# 18: Dynamic Programming: Tabulation
- Bottom-Up, can also be iterative
- Knapsack is bottom up as all the calculations are tabulated first.
- Consider it as greedy?
# 21: LCS

Find the longest sequence in the message. Has to be **sequential**

Conditions:

Assume X and Y are two strings to search in and Z is the pattern string

- x<sub>m</sub> == y<sub>n</sub> then z<sub>k</sub>=x<sub>m</sub>=y<sub>n</sub> and Z<sub>k-1</sub> is LCS of X<sub>m-1</sub> and Y<sub>n-1</sub>
	- If both have the same length then find Z in both X and Y (sure of it)
- x<sub>m</sub> != y<sub>n</sub> then z<sub>k</sub>!=x<sub>m</sub> implies that Z is LCS of X<sub>m-1</sub> and Y
	- If not equal and same goes for Z and X. then X is the longer string and must contain both Z and Y (i guess)
- x<sub>m</sub> != y<sub>n</sub> then z<sub>k</sub>!=y<sub>n</sub> implies that Z is LCS of X and Y<sub>n-1</sub>
	- If not equal and same goes for Z and Y. then Y is the longer string and must contain both Z and X (i guess)

**Naive approach (Top Down)**

Code:

```C
int LCS(i, j){
	if(str1[i]=='\0' || str2[j]=='\0'){
		return 0;
	}
	else if(str1[i]==str2[j]){
		return 1+LCS(i+1, j+1);
	}
	else{
		return max(LCS(i+1, j), LCS(i, j+1));
	}
}

```

**Memoization approach (Bottom Up)**

Code:

```python
def lcs(i, j, dp):
	if(str1[i] == str2[j]):
		LCS[i, j] = 1 + LCS[i-1, j-1]
	else:
		LCS[i, j] = max(LCS[i-1, j], LCS[i, j-1])

```

Time & Space Efficiency:

- Bruteforce: O(n\*2<sup>m</sup>), uses LCS(i+1,j+1) calls
- Memoization: Theta(n\*m), uses LCS(i-1, j-1) calls
# 19: matrix multiplication

**Bottom-Up Approach**
- Two tables
	- One is called C for cost and the other is the K-table
- Fill diagonal with 0's.
- Start calculations using general formula.
	- Find the K value for which the lowest number of multiplications is found
- Final answer is in top-right most rowcol of C table
- Brackets will be found from K table
	- Use the number on the final answer rolcol to determine range of brackets
	- Follow the path from there

General formula:
- c\[i, j\] = <sup>min i ≤ k &lt j</sup> {\[c\[i, k\] + c\[k+1, j\]\] + (d<sub>i-1</sub>\*d<sub>j</sub>\*d<sub>k</sub>)}


# 18: rod cutting

Algo that bruteforces what cuts need to be made in order to maximize profits

- Running Time: O(n<sup>2</sup>)
- space: O(n)

General Formula

- Value(n) = max<sup>n-1</sup><sub>i=0</sub> (Price\[i\] + Value\[n-i-1\])

Memoization Approach (Top-Down)

```Algo
    MemoizedCutRod(p, n)
        r: array(0..n) := (0 => 0, others =>MinInt)
        return MemoizedCutRodAux(p, n, r)

    MemoizedCutRodAux(p, n, r)
        if r(n) = MinInt then     -- calculate a new solution?
                q: int := MinInt
                for i in 1 .. n loop
                    q := max(q, p(i) + MemoizedCutRodAux(p, n-i, r))
                end loop
            end if
            r(n) := q
        end if
        return r(n)

```

Tabulation Approach (Bottom-Up)

- also gives the best cuts as well

# 20: knapsack

GeeksforGeeks stuff:

- Case 1 (include the Nth item): Value of the Nth item plus maximum value obtained by remaining N-1 items and remaining weight i.e. (W-weight of the Nth item).
- Case 2 (exclude the Nth item): Maximum value obtained by N-1 items and W weight.
- If the weight of the ‘Nth‘ item is greater than ‘W’, then the Nth item cannot be included and **Case 2** is the only possibility.

Given in Question:

- price array known as P{}
- weight array known as W{}
- total capacity as M
- number of objects as N

Init (Tabulation)

- Create a table; Number of objects N as Rows, Capacity M in integer increments as Columns
- Write down P\[i\], W\[i\] alongside the row number
- Go row by row **cumulatively

Last row formula:

- V\[i, w\] = max(V\[i-1, w\], V\[i-1, w-w\[i\]\] + P\[i\])
	- Where,
		- i = Row Number
		- W\[i\] = Weight @ row i
		- P\[i\] = Price @ row i

Backtracking:

- Subtract max profit from profit of the row you got max profit from. Assume its called X
- Look for the row that created X diagonally. Include that row
- Include rows that have unique values for X including the max profit row
	- Include => objectArr\[i\] = 1

Time & Space Efficiency:

- Time: Theta(nW)
- Space: Theta(nW)
- Optimal solution composition: O(n)

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
| **Complexity**            | O((V + E) * log(V))                          | O(E * log(V)) with running time of O(V + ElgE + ElgV)=O(ElgE) and E=O(V<sup>2</sup>)=>lgE=O(2lgV)=O(lgV)                       |
ngl this was just as confusing to me as it is to you. improve if you can and shoot me an email <!--or just shoot me that works just as well-->

# 15: dijkstra

**Shortest Path**

- Defined as a path U to V with the least weighted edges
	- infinite if no such path exists or negative-weight cycles exist
- Subpath created from shortest path will be the new shortest path
	- Follows the triangle inequality where the length of the new shortest path is less than or equal to the old shortest path
- Computing shortest paths using SSSP algos
	- Nonnegative edge weights: Dijsktra
	- General: Bellman ford
	- DAG (Directed acyclic graph): One pass of Bellman ford
## Time Complexity:
1. **Initialization:**
   - Initializing the tentative distances for each vertex: \(O(V)\) time.
2. **Priority Queue Operations:**
   - Extracting the minimum element from the priority queue (min-heap) is performed \(V\) times.
   - Inserting and updating elements in the priority queue is performed \(E\) times in total.
   - If a binary heap is used, each operation takes \(O(\log V)\) time.
   - If a Fibonacci heap is used, the total time complexity is \(O(E + V \log V)\).
3. **Relaxation:**
   - Each edge is relaxed once for each endpoint (vertex), resulting in \(O(E)\) relaxation operations.
4. **Overall Time Complexity:**
   - Using a binary heap: \(O((V + E) \log V)\).
   - Using a Fibonacci heap: \(O(E + V \log V)\).

## Space Complexity:
1. **Vertex Set and Priority Queue:**
   - Maintaining a set of unvisited vertices: \(O(V)\) space.
   - Storing tentative distances and predecessors: \(O(V)\) space.
   - Using a priority queue (min-heap): \(O(V)\) space.
2. **Edge List:**
   - Storing the edges in an adjacency list: \(O(E)\) space.
3. **Overall Space Complexity:**
   - \(O(V + E)\).
## Notes:
- The use of a priority queue, specifically a min-heap, is a significant factor in the time complexity. Implementations using Fibonacci heaps can be more efficient in practice, but they are more complex to implement.
- Dijkstra's algorithm is well-suited for sparse graphs where \(E\) is much smaller than \(V^2\).
- In the presence of negative weights or negative cycles, Dijkstra's algorithm is not applicable, and alternative algorithms like Bellman-Ford should be considered.

# 16: bellman ford

| Feature                              | Dijkstra's Algorithm                        | Bellman-Ford Algorithm                      |
| ------------------------------------ | --------------------------------------------| --------------------------------------------|
| **Algorithm Type**                   | Greedy                                     | Dynamic Programming                        |
| **Edge Weight Requirements**          | Non-negative weights                       | Can handle negative weights                |
| **Graph Type**                       | Directed or Undirected                     | Directed (can be adapted for undirected)   |
| **Negative Weight Handling**          | Cannot handle negative weights             | Can handle negative weights, but no cycles |
| **Cycles**                            | Does not work with negative cycles         | Can detect and handle negative cycles      |
| **Complexity (Time)**                | \(O((V + E) \log V)\) using a min-heap      | \(O(VE)\) (or \(O(V^2E)\) with optimized versions) |
| **Complexity (Space)**               | \(O(V + E)\) (with a min-heap)              | \(O(V)\)                                   |
| **Use Cases**                        | - Shortest paths with non-negative weights | - Shortest paths with or without negative weights |
| **Performance in Dense Graphs**      | Less efficient due to priority queue       | Potentially more efficient in dense graphs |

## Time Complexity:
1. **Initialization:**
   - Initializing the distances for each vertex: \(O(V)\) time.
2. **Relaxation:**
   - Relaxing each edge for each vertex: \(O(VE)\) time.
   - Each edge is relaxed \(V-1\) times in the worst case.
3. **Negative Cycle Detection:**
   - An additional pass to detect negative cycles: \(O(E)\) time.
4. **Overall Time Complexity:**
   - \(O(VE)\) for the standard implementation.
## Space Complexity:
1. **Vertex Set:**
   - Maintaining a set of vertices: \(O(V)\) space.
2. **Distances and Predecessors:**
   - Storing distances and predecessors: \(O(V)\) space.
3. **Overall Space Complexity:**
   - \(O(V)\).
## Notes:

- Bellman-Ford is less efficient than Dijkstra's algorithm for graphs with non-negative weights due to its higher time complexity.
- The algorithm can handle graphs with negative weights but not graphs with negative cycles.
- Bellman-Ford is a suitable choice when negative weights are present or when detecting negative cycles is required.
- In some cases, optimized versions of Bellman-Ford can reduce the time complexity to \(O(V^2)\) or even \(O(VE - V + 1)\) by avoiding unnecessary relaxation steps.
- Bellman-Ford can be used on both directed and undirected graphs.
# 9: naive string matching, rabin karp algo

**Terminology**

- ∑* = set of all finite-length strings from alphabet ∑
- ε = empty string (zero length string)
- |x| = length of string x
- xy = concatenation of strings x and y, length is |x|+|y|
- w is a prefix of x, w╘ x, if x=wy, where y Є ∑*
- w is a suffix of x, w ╛x, if x=yw, where y Є ∑*
- ε is both a suffix and a prefix of every string
	- ab ╘ abcca
	- cca ╛abcca
- We denote k-character prefix P[1..k] of the pattern P[1..m] by Pk.
- So Po = ε and Pm = P = P[1..m]
- Similarly, k-character prefix of text T as Tk
- String matching prob.: find all shifts in the range
	- 0 ≤ s ≤ n-m such that P ╛Ts+m

**Naive String Matching**

- Takes Big-O((n - m + 1)m) time
	- If M is 2x that of N then it takes Big-O(N<sup>2</sup>)
	- N is len of Test string
	- M is len of Pattern string
- Take string to match and its len
- inc and compare with original string till len. if char comp is true then increment
- otherwise shift once to right and start over from first char in string to match

Inefficiency

- Tests for each of N-M+1 possible values of S
- Info gained about text for one value of S is ignored considering other values of S i.e. it ignores the fact that X num of characters we just compared did not match and can be skipped

**Rabin-Karp String Matching**

- Adds in step of preprocessing as it is hash based. Convert strings to a hash value
- Use of number theoretic notation i.e. equiv of two numbers modulo a third number which is known as rolling hash
-
# 10: kmp string matching

| Algo                    | Preprocessing Time | Matching Time   |
| ----------------------- | ------------------ | --------------- |
| Naive                   | 0                  | O((n - m + 1)m) |
| Rabin-Karp              | Big-O(m)           | O((n - m + 1)m) |
| Finite Automaton        | O(m*(Sigma))       | Big-O(n)        |
| KMP(Knuth-Norris-Pratt) | Big-O(m)           | Big-O(n)        |

---

# 2: complexity analysis
- **Necessary features of an algo. (D.E.F.O/E.C.G.I) => Anagram to remember**
	- **Definiteness**: Steps must be precisely defined
	- **Effectiveness**: Individual steps are doable
	- **Finiteness**: No infinite loop for any input in specified domain
	- **Output**: Info/data that goes out
	- **Efficiency**: Takes little time/memory to run
	- **Correctness**: Outputs correctly relate to inputs
	- **Generality**: Works for many possible inputs
	- **Input**: Info/data that comes in
- **Platform Independence**
    - Ideal Algo
        - Each elementary operation takes 1 step of time
        - Each elementary instance occupies 1 unit of memory

**Analyzing an Algo statement**

- Order of O's. C3L-Q-PEF => anagram
    - Goes in order of **Best** to **Worst**
        - **Constant**: O(1)
        - **Logarithmic**: O(log(N))
        - **Linear**: O(N)
        - **Linearithmic**: O(n*log(n))
        - **Quadratic**: O(n<sup>2</sup>)
        - **Polynomial**: O(n<sup>m</sup>), where m is any number > 2
        - **Exponential**: O(2<sup>n</sup>)
        - **Factorial**: O(!n)
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
		//Statement that does stuff
	}


//However for factors i.e the iterator being
multiplied or divided the
time complexity is O(log(n))

	for(int i =0; i < n; i*n){
		//Statement that does stuff
	}


//For the iterator going up in order of
power i.e from i^2 to i^3 or from
i^2 to sqrt(i) the complexity is O(log(log(n)))

	for(int i =0; i < n; i=pow(i,c)){
		//Statement that does stuff
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
		//Statement that does stuff
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
		//Statement that does stuff
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
- Do not forget to use **log<sub>2</sub>** not **log<sub>10</sub>
- Highly likely the first change in growth wont be the only one, check for others if you find one point of intersection
- Equality Signs
    - Omega >=. Upper Bound
    - Theta == Tight Bound
    - Big-O <=. Lower Bound
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
# 4.1.1: recursion
- Divide Conquer & Combine
- Writing a recursive function requires determining the
	- Size factor
	- Base case(s)
	- General case(s)
	- integrity of the function via the three-question method

Recurrences can be solved via

- Iteration
- Substitution/Tree
- Relation
- Master
# 4.1.2: recursion tree

nothing to note as such, practiced from sessionals

# 4.2: recurrence relation

\nothing to note as such, practiced from sessionals

# 4.3: master method

Suppose you are given the following equation where a >=1 and b>1$$T(n) = aT\left(\frac{n}{b}\right)+f(n) $$ where $$f(n)=Θ(n^klog^pn)$$

- Note that you're supposed to do a reverse thingy and find powers of K and P yourself
- Structure of Values to note down
	- A, B, K, P

**Cases**

- **Case 1** log<sub>b</sub><sup>a</sup> > k
	- Then just n^the greater value
		- Θ(n<sup>log<sub>b</sub>a</sup>)
- **Case 2**: log<sub>b</sub><sup>a</sup> = k
	- Sub-cases
		- p > -1 == f(n) but p+1
			- Θ(n<sup>k</sup>log<sup>p+1</sup>n)
		- p = -1
			- Θ(n<sup>k</sup>loglog(n))
		- p < -1
			- Θ(n<sup>k</sup>)
- **Case 3**: log<sub>b</sub><sup>a</sup> < k
	- Sub-cases
		- p >= 0 == f(n)
			- $$Θ(n^klog^pn)$$
		- p < 0 but only n^k
			- $$Θ(n^k)$$
# 3: insertion sort
- Good for sorting almost sorted lists

**Procedure**

- Compare nth element with n+1th element
	- Swap if not in order until it is in order. (L.H.S of the array is generally sorted as the algo progresses)
	- Else shift to n+1th element and repeat

**Time Complexity**

- Best: O(n) - List is already sorted
- Average: O(n<sup>2</sup>)
- Worst: O(n<sup>2</sup>) - List is sorted in reverse order

# 5: merge sort

**Procedure**

- Split array into halves until len of sub array is 1
- rearrange back up and do so in order
- tada! sorted array =)

**TODO:: Recurrence relation stuff here**

**Time Complexity**

- Best, Average, Worst: O(n logn)
- Beats insertion sort for n >= 3
# 6: quick sort
- Better space complexity than merge sort
**TODO:: Prep questions in slides**

**Time Complexity**

- Best: O(n logn)
- Average: O(n logn)
- Worst: O(n<sup>2</sup>) - Poor pivot selection
# 7: heap sort

**Time Complexity**

- Best, Average, Worst: O(n logn)

# 8: linear sorts

**Decision Tree**

- Helps model execution of any comparison sort
- Split tree when algo compares two elements
	- Must contain greater than N leaves
	- Height will be Omega(n lg n)
- Running time == Length of path taken
- Worst case == Height of tree

**Linear sorts**

- Assumes that each element is an integer in the range 0 to k
- Uses auxiliary storage
-