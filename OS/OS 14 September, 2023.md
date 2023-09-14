After CH3 move to CH9
## UNIX SVR4 Process management 3.6
### Process states
- User Running: 
	- The process is currently executing in user mode.
- Kernel Running: 
	- The process is currently executing in kernel mode.
- Ready to Run, in Memory: 
	- The process is loaded into memory and is waiting for the CPU to execute.
- Asleep in Memory: 
	- The process is in a sleep or wait state in memory, typically waiting for an event to occur.
- Ready to Run, Swapped: 
	- The process is ready to run but has been temporarily moved to disk (swapped out) due to limited memory resources.
- Preempted: 
	- The process has been temporarily stopped to allow another process to run.
- Created: 
	- The process has been created but has not yet started executing.
- Zombie:
	- A terminated process that still has an entry in the process table to allow its parent process to collect exit status.

### UNIX Process Image
- **User-Level Context**
	- Process Text
	- Process Data
	- User Stack
	- Shared Memory
- **Register Context**
	- Program Counter
	- Processor Status Register
	- Stack Pointer
	- General-Purpose Registers
- **System-Level Context**
	- Process table entry
	- U (User) area
	- Per Process Region Table
	- Kernel Stack
	- Process Status
	- Pointers
	- Process Size
	- User Identifiers
	- Process Identifiers
	- Event Descriptor
	- Priority
	- Signal
	- Timers
	- P_Link
	- Memory Status
