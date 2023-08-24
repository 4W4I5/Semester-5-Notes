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
- 