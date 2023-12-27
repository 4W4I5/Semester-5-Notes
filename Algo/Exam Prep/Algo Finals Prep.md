> [!NOTE]
> Lectures tagged with :warning: are essentially low-effort notes. Did not make them right before finals
>
> Lectures tagged with :white_check_mark: were made during finals
>
> Lectures tagged with :x: have not been made yet. Probs will not be if you see it the day after the exam =)


| Topic                                     | Status |
| ----------------------------------------- | ------ |
| 18: Memoization                           | :x:    |
| 18: Tabulation                            | :x:    |
| 21: LCS                                   | :x:    |
| 19: matrix multiplication                 | :x:    |
| 18: rod cutting                           | :x:    |
| 20: knapsack                              | :x:    |
| 12: graphs                                | :x:    |
| 12: dfs, cycle finding                    | :x:    |
| 12: bfs                                   | :x:    |
| 13: topological sorting                   | :x:    |
| 14:mst, prims,kruskal                     | :x:    |
| 15: dijkstra                              | :x:    |
| 16: bellman ford                          | :x:    |
| 10: kmp string matching                   | :x:    |
| 9: naive string matching, rabin karp algo | :x:    |
| 5: merge sort + recurrence relation       | :x:    |
| 6: quick sort                             | :x:    |
| 7: heap sort                              | :x:    |
| 8: linear sorts                           | :x:    |
| 4.1.1: recursion                          | :x:    |
| 4.1.2: recursion tree                     | :x:    |
| 4.2: recurrence relation                  | :x:    |
| 4.3: master method                        | :x:    |
| 3: insertion sort                         | :x:    |
| 2: complexity analysis                    | :x:    |


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
# 12: graphs
# 12: dfs, cycle finding
# 12: bfs
# 13: topological sorting
# 14:mst, prims,kruskal
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