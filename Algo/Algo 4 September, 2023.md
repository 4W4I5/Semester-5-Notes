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

- Simple Statement 
	- Order of O(1)
	- Basic step = 1, as long as number of statements are constant
	- Examples
		- Assignments: int x = y;
		- Arithmetic Operations: x += i;
		- Array Referencing: A\[j\] = 5;
		- Conditionals (Most): if(x<12){};
- Simple Loop
	- Basic step = N x 1
	- Quiz Note:: For a reminder on how a for loop works
		- int i = 0. This is the starting point for the loop
		- i < n. This is a condition thats checked at the end of every iteration
		- i++.  
```
for(int i =0; i < n; i++){
	s      //Statement that does stuff
}
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
- Constant Time Statements
	- O(1)
	- Assignment statements of simple data types
	- `Fill in with the rest`

#### Analyzing Loops

#### Analyzing sequence of statementsn
