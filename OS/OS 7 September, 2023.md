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