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

1. **Start with the Recurrence Relation**: You begin with the given recurrence relation. This relation represents the time complexity of an algorithm or function in terms of itself with smaller inputs. It typically looks like this: T(n) = aT(n/b) + f(n).
2. **Expand the Recurrence Iteratively**:
    - You replace T(n) with its recursive form, aT(n/b) + f(n).
    - Continue to expand T(n) until you reach the base case(s).
3. **Express T(n) as a Summation**:
    - As you expand the recurrence relation, you'll have terms representing the work done at different levels of recursion. Express T(n) as a summation of these terms.
4. **Analyze and Simplify the Summation**:
    - Once you have the summation, analyze it to simplify it into a more manageable form.
    - Often, you'll need to manipulate the summation using mathematical techniques to make it easier to work with.
5. **Obtain the Final Time Complexity**:
    - After simplifying the summation, you'll have an expression that represents the time complexity of the algorithm in terms of n (the problem size).
    - This expression is typically in the form of a function of n, such as T(n) = O(f(n)), where f(n) is the final time complexity.

**Example**:
Let's say you have the recurrence relation T(n) = 2T(n/2) + n. You would expand this iteratively:

$$T(n) = 2[T(n/2) + (n/2)] + n$$
$$T(n) = 2[2[T(n/4) + (n/4)] + (n/2)] + n$$

Continue this process until you reach the base case(s). In this case, you'll reach the base case when T(1) is defined.

After expanding and simplifying the summation, you might find that T(n) = O(n log n).
