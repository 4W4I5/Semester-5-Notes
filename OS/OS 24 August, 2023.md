Recap:
- Interrupt reasons to halt
	- I/O
		- Short I/O wait
			- Continues with I/O routine
		- Long I/O wait
			- After a set time limit, stops I/O routine and continues normal operation

#### Inner working of an interrupt

- Device inits Interrupt
- Processor completes current execution
	- ACK's interrupt to be processed
- Saves PC and then the PSW (Program-Status-Word: Saves ACU(A register in 8086) and FlagsRegister)
- Load in Interrupt init block into PC
- F-D-E Cycle on the Interrupt
- Restore PC & PSW

#### Multiple Interrupt

- Check and do two things
	- Priority of the interrupt
		- If higher, save state of the interrupt and go to the new interrupt
		- If equal or lower, finish the current interrupt then start the new interrupt. Stack isn't used
	- Interrupt Blocking
		- Just block any and all new interrupts until the current interrupt is resolved

#### Memory Hierarchy

- Constraints
	- Capacity
	- Access times
	- Cost
- Cache, Memory, Storage
	- In order
		- Processor: L1, L2 and L3 (Not managed by the OS)
		- Memory (Managed by the OS)
		- Storage (Managed by the OS)
	- As we go down the hierarchy, access times and storage times increase however the capacity increases. Known as the principle of locality as processors are forced to use lower level memory more efficiently

# Review Questions
<!-- Taken from the book -->
### 1.1 List and briefly define the 4 main elements of a computer
### 1.2 Define the 2 main categories of processor registers
### 1.3 In general, what are the 4 distinct actions that machine instruction can specify
### 1.4 What is an interrupt
### 1.5 
### 1.6
### 1.7
### 1.8
### 1.9
### 1.10
