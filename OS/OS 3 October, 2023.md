# Chapter 4: Threads
Resource ownership
- Process includes a virtual address space
`Fill in from the slides`
`Process can have multiple lines of execution`
## Processes & Threads
#### Process
- Main unit of resource allocation and a unit of protection
- Associated with processes
	- Virtual address space
	- Protected access to
		- Processors
		- other processes
		- Files
		- i/o
#### Thread
- Each thread has 
	- a execution state i.e ready, running, etc
	- Saved thread context when not running 
	- execution stack
	- some per thread static storage for local variables
	- access to the memory and resources of its processes, shared with all other threads in that process
	- Thread control Block
- Benefits of threads
	- Takes less time to create a new thread than a process
	- Less time to termina a thread than a process
	- `Fill in later`

#### Thread execution states

#### Remote Procedure Call (RPC) using threads




- Unit of dispatch aka thread or a lightweight process
- Unit of resource ownership aka process or task
- Multithreading
	- Ability of an OS to support multiple, concurrent paths of execution within a single process
- Thread Functionality
-  
