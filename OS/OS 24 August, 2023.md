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