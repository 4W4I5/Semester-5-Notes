# I/O Techniques

- When an I/O Instruction is executed, a command is issued to the appropriate I/O Module
	- #### Programmed I/O
		- **Polling:** 
		- `Refactor`
			- The CPU continually checks the status or flag of the I/O device to determine if it is ready for data transfer. Once the device is ready, the CPU transfers data between the device and memory.
		- **Simple and straightforward:** 
			- Programmed I/O is easy to implement and understand. However, it can be inefficient as it ties up the CPU while waiting for I/O operations to complete.
		- **CPU-intensive:** 
			- Since the CPU is actively involved in managing I/O, it can become a bottleneck when multiple I/O devices are present.
	- #### Interrupt-Driven I/O
		- **Interrupts:** 
		- `Refactor`
			- When an I/O device is ready, it sends an interrupt signal to the CPU, which temporarily stops its current operation and services the interrupt. The CPU then transfers data between the device and memory.
			- `What is the priority level though?`
		- **Efficiency:** 
			- This approach allows the CPU to perform other tasks while waiting for I/O operations to complete. Compared to Programmed I/O, the CPU usage with this technique is reduced
		- **Complexity:** 
			- Implementing interrupt-driven I/O requires more complex hardware and software coordination to handle interrupts and context switching.
			- Interrupt I/O requires more complex hardware and predefined software to handle interrupts and context switching. This increases chances of missing an interrupt if the processor is busy with a higher level interrupt
	- #### Direct Memory Access (DMA)
		- Uses a DMA Controller
		- **Reduced CPU involvement:** 
			- The DMA controller takes over, allowing the CPU to focus on other tasks.
		- **High-speed data transfer:** 
			- DMA is particularly useful for high-speed data transfers, such as large file copying or video streaming.
		- **Complex setup:** 
			- Setting up DMA requires careful configuration and coordination to ensure data integrity and prevent conflicts.

## Symmetric Multiprocessor (SMP)
`Add later`
## MultiCore Computer (MCC)
- Definition
	- Also known as chip multiprocessor
	- Combines multiple cores on a single piece of silicion(die)
	- L3 Cache seems shared `Confirm this`
- Advantages

## Chapter 2: Operating System 
