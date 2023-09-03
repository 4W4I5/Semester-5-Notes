# I/O Techniques

- When an I/O Instruction is executed, a command is issued to the appropriate I/O Module
	- #### Programmed I/O
		- **Polling:** 
			- CPU checks whenever Status/Flag of an I/O device is ready
		- **Simple and straightforward:** 
			- Programmed I/O is easy to implement and understand. 
			- However, it can be inefficient as it ties up the CPU while waiting for I/O operations to complete.
		- **CPU-intensive:** 
			- CPU is actively involved in managing I/O, it can become a bottleneck when multiple I/O devices are present.
	- #### Interrupt-Driven I/O
		- **Interrupts:** 
			- When an I/O device is ready, it sends an interrupt signal to the CPU
			- This temporarily stops its current operation. The CPU then transfers data between the device and memory.
			- `What is the priority level though?`
		- **Efficiency:** 
			- This approach allows the CPU to perform other tasks while waiting for I/O operations to complete.
			- Compared to Programmed I/O, the CPU usage with this technique is reduced
		- **Complexity:** 
			- Implementing interrupt-driven I/O requires more complex hardware and software coordination to handle interrupts and context switching.
			- Increases chances of missing an interrupt if the processor is busy with a higher level interrupt
	- #### Direct Memory Access (DMA)
		- Uses a DMA Controller
		- **Reduced CPU involvement:** 
			- The DMA controller takes over, allowing the CPU to focus on other tasks. 
			- It directly transfers data to memory without involving the CPU
			- However the CPU cannot access the memory bus at the same time as a DMA is fetching or writing data
		- **High-speed data transfer:** 
			- DMA is particularly useful for high-speed data transfers, such as large file copying or video streaming.
		- **Complex setup:** 
			- Setting up DMA requires careful configuration and coordination to ensure data integrity and prevent conflicts.

## Symmetric Multiprocessor (SMP)
- A system with 2+ processors
	- Share the same memory, system bus and I/O
- Increased throughput, more reliable as failure of one processor will not ruin others
- Coordinating processors is complex, large memory pool is required as all processors share the same memory
## MultiCore Computer (MCC)
- Definition
	- Also known as chip multiprocessor
	- Combines multiple cores on a single piece of silicon(die)
	- L3 Cache seems shared between cores
- Advantages
	- Higher Clock speeds, Greater efficiency and less traffic. In comparison to a uni-core, multicore can tolerate more faults

## Chapter 2: Operating System 
### Operating Systems;
- Interface b/w application & hardware
- **Resource Management**
	- Responsible for Controlling the Use of 
		- CPU
		- Processor Execution time
		- I/O 
			- Managed by the I/O controller linked to the OS
		- Main Memory
			- Holds the loaded OS and system software alongside loaded programs and data
		- Secondary Memory
			- Stores the OS, Programs and Data
- **Instruction Set Architecture**
	- Interface of OS and execution hardware
	- Defines the set of instructions a computer's CPU can execute, enabled program execution on the CPU
- **Application Binary Interface**
	- Interface b/w OS and libraries
- **Application Programming Interface**
	- Interface b/w Application and libraries
#### Stages/Level of evolution of OS
- **Serial Processing**
- **Simple Batch Processing**
- **Multi-programmed Systems**
- **Time Sharing Systems**

#### Modes of Operation
- Kernel
- User

#### CTSS
#### Time Sharing