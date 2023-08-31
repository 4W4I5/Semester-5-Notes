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

---

# Review Questions

`Taken from the book `

- ### 1.1 List and briefly define the 4 main elements of a computer
	- Processor
		- ALU
		- CU
		- Registers (General purpose & special purpose)
	- I/O
	- Memory
	- System Bus

- ### 1.2 Define the 2 main categories of processor registers
	- General Purpose & Special Purpose

- ### 1.3 In general, what are the 4 distinct actions that machine instruction can specify
	- Processor-Memory
		- Data transfer from processor to memory and vice-versa
	- Processor-I/O
		- Data transfer from processor to I/O and vice-versa
	- Data Processing
		- Processor perform some arithmetic or logic operation on data
	- Control
		- Instruction that specifies that the sequence of execution to be altered

- ### 1.4 What is an interrupt
	- Improves processor utilization
	- It is a mechanism through which I/O and Memory may interrupt normal sequencing of the processor

- ### 1.5 How are multiple interrupts dealt with
		- Priority
			- Higher priority takes over first, if an interrupt is already in progress then the higher priority one takes over 
	- Blocking
		- Block other interrupts from being processed while one is in process
- ### 1.6 What characteristics are observed while going up the memory hierarchy
	- More frequent Accesses, Higher speed but low capacity near the processor
	- Less frequent Accesses, Lower speed but higher capacity the further we are from the processor
- ### 1.7 What are the trade-off that determine the size of the cache memory
- ### 1.8 What is the difference b/w a multiprocessor & a multicore system
