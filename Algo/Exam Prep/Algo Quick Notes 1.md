 - Def
	- Algo is a well-defined, finite and effective sequence of computation steps that takes some value, or a set of values to as input and gives the output either as some value or set of values
- Algo vs Program
	- Algo is the design of a concept in code
	- Program is the execution of the design
- Correctness of an algo
	- Algo is said to be correct if, for every input instance, it halts with the correct output
	- An incorrect algo
		- Might not halt at all for some inputs
		- Might halt with an answer other than desired one
- Problems solved by Algos
	- Practical Applications
		- Shortest path such as Dijkstra or A* algo
		- Matrices multiplication
- Why study algo/performance of algo
	- Helps understand scalability
	- Performance often draws the line b/w what is feasible and what is impossible
		- It is also the currency of computing
	- Algo maths = language for talking about a program's behavior
### Algo characteristics
- Definiteness
	- Steps must be precisely define
- Effectiveness
	- Individual steps are all do able
- Finiteness
	- It should not take forever to produce an output for any given input
- Output
	- Info/Data that goes out
- Other Important Feature
	- Input
		- Info/Data that comes in
	- Correctness
		- Output relates correctly to inputs
	- Generality
		- Works for many possible inputs
	- Efficiency
		- Takes less time & memory to run
## Complexity Analysis
- **Platform Independence**
	- Ideal Algo
		- Each elementary operation takes 1 step of time
		- Each elementary instance occupies 1 unit of memory

#### Analyzing an Algo statements
- Order of O's
	- Goes in order of **Best** to **Worst**
		- O(1)
		- O(log(N))
		- O(N)
		- O(n\*log(n))
		- O(n^m), where m is any number > 0
		- O(2^n)
		- O(!n)
- Simple Statement 
	- Order of O(1)
	- Basic step = 1, as long as number of statements are constant
	- Examples
		- Assignments: `int x = y;`
		- Arithmetic Operations: `x += i;`
		- Array Referencing: `A\[j\] = 5;`
		- Conditionals (Most): `if(x<12){};`
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
	- Pick the highest order `This went over my head`
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
#### Analyzing Loops
- Already covered above, however for practice check out Lecture 2 page 12+ slides that maam uploaded

#### Analyzing sequence of statements
- Generally observe the time complexity of each statement line-by-line and sum it all up. 
	- The sum is the final answer with the coefficients and low order factors discarded
- If-Statements
	- These statements themselves are always o(1)
	- However, Big-Oh assumes the worst case/Upper limit therefore we pick whatever higher order value for O() we can get
---

### Why are we not so exact with numbers?
- Constants/Coefficients do no matter
- This is due to **Asymptotic Complexity** as N gets large, concentrate on the highest order term
	- This is due to the fact that time is linear in N
	- We can approximate the complexity of an algorithm
		- This is due to the fact that a lot of operations take varying amounts of time and are hardware-dependent
	- 
- Time complexity is shown as 
	- Big O (Upper bound)
	- Theta (Tighter bound)
	- Omega (Lower bound)


## Asymptotic Analysis
- `Fill in from slides`


### Big-O
- If f(n) is of degree d, then f(n) is O(n^d)
	- This means
		- Drop lower-order terms
		- Drop constant factors
- Use the smallest possible class of functions
	- 
- Use the simplest expression of the class
`Fill in from slides`



---
look at chapter 3 book se
## Asymptotic Notation 3.2
- 

---

### Little-O and Little-Omega

# New lecture


---


## Divide & Conquer

- Divide the problem into a number of sub problems that smaller instances of the same problem
- Conquer the subproblems by solving them recursively. if the subproblem size is
- Combine the subproblem solutions to form a solution to the original problem

### Recurrences

- Describes a function in terms of its value on smaller arguments (usually)
	- Mathematical way to divide and conquer
- If a recurrence is stated without a base case, assume its algorithmic. To check if its recursive check for
	- Base/Termination Case
	- General Case
	- Smallest Case

### Solving recursive recurrences

**Recursive Tree Method**:
Visualize the recursion as a tree, calculate work at each level, and analyze the tree structure.
1. Create a recursion tree diagram.
    - For each recursive call, draw a node.
    - Connect parent nodes to child nodes representing subproblems.
    - Continue until you reach the base case(s).
2. Calculate the work done at each level of the tree.
    - Assign a cost to each node based on the amount of work done.
3. Sum up the work at each level to find the total work done.
4. Analyze the tree's structure:
    - If the tree is balanced, it typically has a height of log(n).
    - If the tree is unbalanced, it might have a height of n.

**Master Method**:
Use a formula to determine the time complexity based on the recurrence relation's form.
1. Determine the form of the recurrence relation: T(n) = aT(n/b) + f(n).
    - a is the number of subproblems.
    - b is the factor by which the problem size is reduced.
    - f(n) is the work done outside the recursive calls.
2. Compare f(n) with n^log_b(a):
    - If f(n) is asymptotically smaller, then the solution is T(n) = Θ(n^log_b(a)).
    - If f(n) is asymptotically larger, then the solution is T(n) = Θ(f(n)).
    - If f(n) is the same, then the solution is T(n) = Θ(n^log_b(a) * log^k(n)), where k is determined by comparing f(n) with n^log_b(a).
3. Determine the complexity based on the comparison from step 2.

**Iteration Method**:
Use a formula to determine the time complexity based on the recurrence relation's form.

1. **Start with the Recurrence Relation**: You begin with the given recurrence relation. This relation represents the time complexity of an algorithm or function in terms of itself with smaller inputs. It typically looks like this: $$T(n) = aT(n/b) + f(n)$$.
2. **Expand the Recurrence Iteratively**:
    - You replace T(n) with its recursive form, $$aT(n/b) + f(n)$$.
    - Continue to expand T(n) until you reach the base case(s).
3. **Express T(n) as a Summation**:
    - As you expand the recurrence relation, you'll have terms representing the work done at different levels of recursion. Express T(n) as a summation of these terms.
4. **Analyze and Simplify the Summation**:
    - Once you have the summation, analyze it to simplify it into a more manageable form.
    - Often, you'll need to manipulate the summation using mathematical techniques to make it easier to work with.
5. **Obtain the Final Time Complexity**:
    - After simplifying the summation, you'll have an expression that represents the time complexity of the algorithm in terms of n (the problem size).
    - This expression is typically in the form of a function of n, such as $$T(n) = O(f(n))$$, where f(n) is the final time complexity.

**Example**:
Let's say you have the recurrence relation T(n) = 2T(n/2) + n. You would expand this iteratively:

$$T(n) = 2[T(n/2) + (n/2)] + n$$
$$T(n) = 2[2[T(n/4) + (n/4)] + (n/2)] + n$$

Continue this process until you reach the base case(s). In this case, you'll reach the base case when T(1) is defined.

After expanding and simplifying the summation, you might find that T(n) = O(n log n).
