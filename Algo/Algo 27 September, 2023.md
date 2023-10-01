Suppose you are given the following equation where a >=1 and b>1$$T(n) = aT\left(\frac{n}{b}\right)+f(n) $$ where $$f(n)=Θ(n^klog^pn)$$
- Note that you're supposed to do a reverse thingy and find powers of K and P yourself
- Structure of Values to note down
	- A, B, K, P

## Cases
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
---
