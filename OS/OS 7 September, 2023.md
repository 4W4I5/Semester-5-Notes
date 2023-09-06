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


> p = 0
> for(i=0; p<n; i++){
>    p = p+i
> }

- Dry runs
	- i =0
		- p = 0
	- i = 1
		- p = 0 + 1 = 1
	- i = 2
		- p = 1 + 2 = 3
	- i = 3
		- p = 3 + 3 = 6
	- i = 4 
		- p = 6 + 4 = 10
- Equiv equation can be (p(p+1))/2
- this should be greater or equal to N for the loop to stop
- therefore 