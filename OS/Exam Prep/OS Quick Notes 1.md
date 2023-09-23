> [!WARNING]
> Keep in mind this is all content that was covered in class **BEFORE ** sessional 1, however the paper will have a more practical oriented approach

| Chapter                                                                                | Status                  |
| -------------------------------------------------------------------------------------- | ----------------------- |
| [Chapter 1 System Overview](#Chapter-1-System-Overview)                                | :white_check_mark: |
| [Chapter 2 OS Overview](#Chapter-2-Operating-System)                                  | :white_check_mark: |
| [Chapter 3 Process Description & Control](#Chapter-3-Process-Description-and-Control) | :x:                     |
| [Chapter 9 UniProcessor Scheduling](#Chapter-9-Uniprocessor-Scheduling)                | :x:                     |

# Chapter 1 System Overview

## Internals & Designs Principals

 If an OS doesn't exist, then the application would need to

- Schedule processes
- Manage I/o
- Have its hardware-specific drivers
- Resource management

### Fetch-Decode-Execute Cycle

- Steps
	- PC-> Has value of next instruction stored here (Not current)
		- MAR stores value of PC (NOTE:: MAR stores value of address to fetch from)
	- IR-> Loads instructions fetched by MAR value (Note some architectures skip loading the instruction into the MBR and loads directly to IR)
		- Instruction stored in IR is decoded into opcode + operand
	- PC increments

### SISD, SIMD, MISD, MIMD

1. SISD (Single Instruction, Single Data):
    - One instruction processes one piece of data at a time.
    - Basic sequential processing.
2. SIMD (Single Instruction, Multiple Data):
    - One instruction processes multiple data elements simultaneously.
    - Used for parallel tasks like graphics and simulations.
3. MISD (Multiple Instruction, Single Data):
    - Multiple instructions operate on the same data at once.
    - Rare, mainly theoretical.
4. MIMD (Multiple Instruction, Multiple Data):
    - Multiple instructions process multiple data streams concurrently.
    - Most versatile, used in clusters and supercomputers.

### SoC (System-On-a-Chip)

- Combines entire electronic systems on a single chip.
- Includes processor, memory, interfaces.
- Used in mobile devices, IoT, and more.
- Cuts size, cost, and power use.
- Used mostly in mobile and embedded devices

### Opcodes & Operands

- OpCode (Operation Code):
	- OpCode is a fundamental part of a machine language instruction.
	- It represents the specific operation or instruction to be executed by the CPU.
	- It guides the CPU on what operation to perform on the provided operands.
- Operands:
	- Operands are the data values or addresses on which the OpCode operates.
	- They are the inputs for the instruction's operation.
	- The number and type of operands depend on the OpCode.
- To load a instruction bigger than the buswidth, a opcode exists to decode one half and then fetch the next half of the instruction

## Interrupts

- #### **Inner working of an interrupt**
	- Device inits Interrupt
	- Processor completes current execution
		- ACK's interrupt to be processed
	- Saves PC and then the PSW (Program-Status-Word: Saves ACU(A register in 8086) and FlagsRegister)
	- Load in Interrupt init block into PC
	- F-D-E Cycle on the Interrupt
	- Restore PC & PSW
- #### **Interrupt reasons to halt**
	- I/O
		- Short I/O wait
			- Continues with I/O routine
		- Long I/O wait
			- After a set time limit, stops I/O routine and continues normal operation
- #### **Classes of interrupts**
	- Program
		- Caused by instruction execution
	- Timer
		- Time based
	- I/O
		- Memory polling
		- Peripherals
	- Hardware Failure
		- Unscheduled Disconnection or failure
- ### **Flow of Control without Interrupts**
	- **Sequential Execution**:
	    - Instructions are executed one after another in a linear sequence.
	    - The CPU fetches an instruction, decodes it, executes it, and then moves to the next instruction.
	    - No external events or requests can alter this sequence.
	- **Blocking Operations**:
	    - During operations like input/output or waiting for a resource, the CPU is idle.
	    - Other processes or tasks cannot proceed until the blocking operation completes.
	    - Inefficient use of CPU resources.
- ### Flow of Control With Interrupts
	- #### Multiple Interrupts
		- Check and do two things
			- Priority of the interrupt
				- If higher, save state of the interrupt and go to the new interrupt
				- If equal or lower, finish the current interrupt then start the new interrupt. Stack isn't used
			- Interrupt Blocking
				- Just block any and all new interrupts until the current interrupt is resolved
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
			- What is an interrupt priority?
				- A integer assigned, in UNIX 1 is highest
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

## Memory Hierarchy

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

## Symmetric Multiprocessor (SMP)

- Definition
	- A system with 2+ processors
		- Share the same memory, system bus and I/O
- Advantages
	- Increased throughput, more reliable as failure of one processor will not ruin others
	- Coordinating processors is complex, large memory pool is required as all processors share the same memory

## MultiCore Computer (MCC)

- Definition
	- Also known as chip multiprocessor
	- Combines multiple cores on a single piece of silicon(die)
	- L3 Cache seems shared between cores
- Advantages
	- Higher Clock speeds, Greater efficiency and less traffic. In comparison to a uni-core, multicore can tolerate more faults

# Review Questions Chapter 1

- ### 1.1 List and briefly define the 4 main elements of a computer
	- Processor
		- ALU
		- CU
		- Registers (General purpose & special purpose)
	- I/O
	- Memory
	- System Bus
- ### 1.2 Define the 2 main categories of processor registers
	- Address Registers and Buffer(Data) Registers
	- Also can be General Purpose & Special Purpose
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
	- More frequent Accesses, Higher speed but low capacity near the processor (Also higher cost per bit)
	- Less frequent Accesses, Lower speed but higher capacity the further we are from the processor (Also lower cost per bit)
- ### 1.7 What are the trade-off that determine the size of the cache memory
	- The main trade-offs for determining the cache size are speed and cost of cache
- ### 1.8 What is the difference b/w a multiprocessor & a multicore system
	- **MultiCore**
		- Special case of MultiProcessor, in which all of the processors are on a single chip
		- Higher Clock speeds, Greater efficiency and less traffic. In comparison to a unicore, multicore can tolerate more faults
	- **MultiProcessor**
		- A system with 2+ processors
			- Share the same memory, system bus and I/O
		- Increased throughput, more reliable as failure of one processor will not ruin others
		- Coordinating processors is complex, large memory pool is required as all processors share the same memory

---

# Chapter 2: Operating System

## Operating Systems

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

### Stages/Level of evolution of OS

- **Serial Processing**
	- **Definition:**
		- Execution of tasks or instructions one after the other, sequentially.
	- **Characteristics:**
	    - Only one task is processed at a time.
	    - Direct access to the CPU
	    - No parallelism or multitasking.
	    - Common in early computing.
	- **Problems:**
		- Scheduling
			- Hard copy of a sign-up sheet was used to reserve timeslots in multiples of half an hour where a 45 min job will waste 15 mins of system run time or the user might not have enough time to resolve errors and run out of time
		- Setup Time
			- Setup sequences were long and slow, costing valuable processing time where if an error were to occur the user was forced to start again
- **Simple Batch Processing**
	- **Definition:**
		- Execution of a batch of similar tasks or jobs in a sequence.
	- **Characteristics:**
	    - Jobs are collected, processed together, and results are obtained at the end.
	    - Fixed the wasted time cause by scheduling and job setup time
	    - Common in early mainframe systems.
	    - Limited interactivity.
	    - Used a Monitor (BatchOS)
		    - Which Managed
			    - Interrupt Processing
			    - Device Driver
			    - Job Sequencing
			    - Control language Interpretation
		    - A part of monitor was always stored in memory aka the Resident Monitor
			    - The RM would have a branching instruction that would branch out the processor execution to the given job and after job completion/error would branch back into the RM
	- **Problems:**
		- Job Control Language (JCL) in its early days allowed for access to the Batch OS's memory as well and therefore the concept of Memory Protection was introduced where the user program was executed in user mode and a kernel mode was also provided in which privileged instructions were executed
		- A certain job in the batch could use up all system resources therefore a timer was started at program startup after which its expiry would mean the control would be returned back to the Monitor
			- The time limit was a poll of 0.2s
		- Processor was often left idle if a program was waiting for I/O
			- This lead to the development of two multiprogram modes
				- Time Sharing aka MultiProgrammed systems
					- Each program was alloted a certain number of instructions to execute after which the monitor passed control onto the next program
				- Time Slicing
					- Each program was alloted a certain slice of the processors time to execute after which control was passed onto the next program
- **Multi-programmed Systems**
	- **Definition:**
		- A system that can manage and execute multiple programs concurrently.
	- **Characteristics:**
	    - Allows for better CPU utilization.
	    - Several programs can be in memory at once.
	    - Operating system handles program scheduling.
- **Time Sharing Systems**
	- **Definition:**
		- Multiple users or processes share a single computer's resources simultaneously.
	- **Characteristics:**
	    - Rapid switching between tasks (time slices).
	    - Supports interactive computing.
	    - Provides the illusion of dedicated resources for each user/process.

---
- What error can cause the OS to crash? `Fill in`
	- Improper Synchronization
	- Failed Mutual Exclusion
	- Nondeterminate Program Operation
	- Deadlocks
- Process consists of:
	- Executable
	- Associated data
	- Execution Context(Process State)
		- Register values
		- OS Process control data (pid is stored here, if halted)
		- Priority
		- I/O Status
- Process implementation (Not complete)
	- Some defs
		- Process registers
			- PC
				- Program counter
			- Base
				- Holds the address for the start of the program
			- Limit
				- Number of words occupied by the process
		- Process
			- Page
				- Context
					- Base points to the start of context
				- Data
				- Program
- Virtual Memory
	- Allows programs to work with virtual addresses that refer to the real addresses
		- Allows OS to just manage addresses logically and delegate the real placement of the pages up to the ram
	- All pages are maintained on disk
`Figure out smth to do w this`
<!--
	- Memory Management
	- Process Isolation
	- Automatic Allocation and Management
	- Support of modular programming
	- Protection and access control
	- Long-term storage
-->

---

# Differential Architecture

- ## Microkernel Architecture
	- A kernel usually has a few essential functions
		- Address Spaces
		- Inter Process communication
		- Basic Scheduling
	- Microkernel vs Monolithic Kernel
	- Allows
		- Simplifies implementation
		- Provides flexibility
		- Well suited to a distributed environment
	- `NOTE:: Filesystem types are deployed within the kernel`
	- `Add in differences from monolilthic kernel`
- ## Multithreading
	- A process is which executes an application is divided into threads that can run concurrently
	- Most beneficial to an SMP (Symmetric Multiprocessor)
	- Thread
		- Dispatchable unit of work
		- Includes a process context and its own data area to enable subroutine branching
		- Executes sequentially and is interruptible
	- Process
		- A collection of one or more thread and associated system resources
		- Consists of at least a single thread
		- Programmer has greater control over the modularity of the application and the timing of application related events
- ## OS Design
	- Distributed OS
		- Provides the illusion of
			- a single main/secondary memory space
			- a unified access facilities
		- State of the art for distributed OS lags that of uniprocessor and SMP OS.
	- Object-Oriented Design
		- Used for adding modular extensions to a small kernel
		- Enables programmers to customize an OS without disrupting system integrity
		- Eases the development of distributed tools and full-blown distributed operating systems
- ## Fault Tolerance
	- Refers to the ability of a system or component
	- Fundamental Concepts
		- Basic measures are
			- Reliability: R(t)
				- Probability of its correct operation up to time t given that the system was operating correctly at time=0
			- Mean time to failure (MTTF)
				- Time it takes to fail (Uptime)
			- Mean time to repair (MTTR)
				- Time it takes to get the system back up and running
				- The avg time it takes to repair/replace a faulty element
			- Availability
				- Classes
					- Continuous
						- `Fill in later`
					- Fault Tolerant
					- Fault Resilient
					- High Availability
					- Normal Availability
			- Fault Types
				- Permanent
				- Temporary
			- Fault Categories of redundancy
				- Physical(Spatial)
					- `Fil in later`
				- Temporal
				- Data
			- Operating System Mechanisms
				- Process isolation
				- Concurrency
				- Virtual Machines
				- Checkpoints and rollbacks
					- Saved state at a certain point in time to rollback to that state

## Multiprocessor OS Considerations

- Design Issues
	- Simultaneous concur`Fill in later`

## MultiCore OS Considerations

## Grand Central Dispatch

- Usually Dev specifies what pieces can or should be executed simultaneously or in
- GCD helps a dev by identifying a task that can be split off into a separate task
- Thread pool mechanism
- allows anon functions as a way of specifying tasks

## Virtual Machine Approach

## Windows Architecture

## Client/Server model

---

## Android

- Based on Linux
- Android Runtime
	- Every android application runs in its own process of the Dalvik Virtual Machine (DVM)
	- DVM executes in the .dvx format

### System Libraries

- Collection of useful system functions written in C/C++ and used by various parts of the andriod system
- Called from the application framework and applications through

### Power Management

- Alarms
- Wakelocks

---

# Chapter 3: Process Description and Control

- Process is an instance of a program or a program in execution
- Process elements
	- Program code
	- Process data
	- Process State Word (PSW)
- Process control block
	- Contains the process elements
		- Created and managed by the OS
		- Key tool that allowed for support for multiple process
		- When a process is removed from the running state to allow another process to run values important to correct execution of the process must be saved. The PCB is where such information is saved
		- PCB lifetime is only for the duration of the process
		- ###### **Contents**
			- **Process ID (PID)**: A unique identifier assigned to each process in the system, enabling the OS to distinguish between processes.
				- **Program Counter (PC)**:
					- Keeps track of the address of the next instruction to be executed by the process.
				- **CPU Registers**: '
					- Stores the values of CPU registers when the process is preempted or interrupted. This allows the process to resume execution seamlessly.
				- **Scheduling Information**:
					- Contains details about the process's scheduling priority, state (e.g., running, waiting, or ready), and other scheduling-related data.
				- **Memory Management Information**:
					- Includes information about the process's memory allocation, such as the base and limit registers, page tables, or segment descriptors.
				- **I/O Status Information**:
					- Keeps track of I/O devices the process is using or waiting on, such as open files, pending I/O requests, and their status.
				- **Accounting Information**:
					- Tracks resource usage statistics like CPU time, wall-clock time, and other resource-related data.
				- **Parent Process Pointer**:
					- Points to the PCB of the parent process if the process is created by another process (e.g., in fork() operations).
				- **Child Process Pointers**:
					- Contains pointers to PCBs of child processes if any exist.
				- **Inter-Process Communication (IPC) Information**:
					- Includes data related to message queues, semaphores, and shared memory segments used for IPC.
				- **Signal Handling Information**:
					- Records how the process handles signals or interrupts, such as signal handlers and signal masks.
				- **File Descriptors**:
					- Stores references to open files and their associated file control blocks.
				- **Priority and Scheduling Information**:
					- Contains information about the process's priority, scheduling algorithm, and any time-related data for scheduling.
				- **Security Information**:
					- May include information related to process permissions, access control, and security attributes.
				- **Exit Status**:
					- Records the exit status or exit code of the process when it terminates
- Reasons for process creation
	- **New batch job**:
		- Processes are created to execute a new batch job or task in batch processing systems, where multiple jobs are run sequentially.
	- **Interactive logon**:
		- When a user logs into a computer system, an interactive process is created to facilitate user interaction and run user-specific tasks.
	- **Created by OS to provide a service**:
		- The operating system creates processes to offer various services like printing, network services, or background tasks (daemons) that serve system-level functions.
	- **Spawned by the existing process**:
		- Existing processes can create child processes or spawn new processes to perform parallel or related tasks, enabling multitasking and efficient resource utilization.
- Process Creation
	- `Investigate why i left this open like this`
- Process Termination
	- **Normal Termination**:
	    - The process has completed its execution and exits gracefully.
	    - The program reaches the end of its main function.
	- **Abnormal Termination**:
	    - **Error**: The process encounters an unrecoverable error or exception.
	    - **Illegal Instruction**: Attempting to execute an invalid or privileged instruction.
	    - **Segmentation Fault**: Accessing memory that the process doesn't have permission to access.
	    - **Stack Overflow**: The process's call stack exceeds its allocated memory.
	    - **Arithmetic Error**: Dividing by zero or other illegal arithmetic operations.
	- **External Termination**:
	    - **Killed by User**: A user or administrator terminates the process manually.
	    - **Resource Exhaustion**: The system runs out of resources (e.g., memory) and terminates processes to free up resources.
	    - **Parent Termination**: If a parent process terminates, its child processes might also terminate.
	- **Interrupts and Signals**:
	    - Processes can be terminated due to receiving specific signals or interrupts from the operating system or other processes. For example:
	        - SIGTERM: Termination signal.
	        - SIGKILL: Unconditionally kill a process.
	- **System Shutdown**:
	    - When the entire system shuts down or restarts, all processes are terminated.
	- **Time Limits**:
	    - Some systems or batch processing environments may impose time limits on processes. When exceeded, the process is terminated.
	- **Resource Constraints**:
	    - Running out of allocated resources, such as file handles or network connections, can lead to termination.
	- **Security Policies**:
	    - Security mechanisms or policies may force termination if a process violates security rules or access controls.
	- **Deadlock Resolution**:
	    - In multi-process systems, processes might be terminated to resolve deadlocks where processes are waiting for resources indefinitely.
- Process States
	- Trace
		- The code of the process
	- Dispatcher
		- A process itself responsible for
- Process State Models
	- 2 State model
		- ![](Pasted%20image%2020230912151828.png)
		-
	- 5 State model
		- ![](Pasted%20image%2020230912151924.png)
		-
	- 6 State model
		- ![](Pasted%20image%2020230912152003.png)

<!--most of the rec is just revision-->

## Process - OS Interaction

- At any processor is executing instructions from application/OS
- CPU knows when to switch
	- Mode Switch
		- Switches execution from user mode and kernel mode
	- Process/Context switch
		- One process leaves the running state and the other enters the running state

## Mode Switching

## System Interrupt, Call, Trap

## Process Switching

## System Data Structures

process tables

memory tables

i/o tables

---

## UNIX SVR4 Process management 3.6

## Process states

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

### State Transitions

1. **Running (R):**
    - A process is actively executing on the CPU.
    - Can be Kernel Running/User Running
    - Transition to:
        - Blocked (B) when it needs to wait for an event, such as I/O, to complete.
        - Ready (S) when it's preempted by the scheduler or its time slice expires.
2. **Ready (S):**
    - The process is ready to run but waiting for CPU time.
    - It is also known as **Ready To Run, in Memory**
    - Transition to:
        - Running (R) when the scheduler selects it for execution.
3. **Blocked (B):**
    - The process cannot proceed and is waiting for an event.
    - It is also known as **Asleep in memory**
    - Transition to:
        - Ready (S) when the event it's waiting for occurs, and it's ready to run.
        - Running (R) when it's chosen by the scheduler if the event occurs and it becomes ready.
4. **Zombie (Z):**
    - A process that has terminated but its exit status is still needed by its parent.
    - Transition to:
        - Terminate (T) when the parent collects the exit status.
        - Zombie (Z) if the parent fails to collect the exit status.
5. **Terminate (T):**
    - The process has completed its execution, and its resources are being released.
    - Transition to:
        - Zombie (Z) if the parent hasn't collected the exit status.
        - Exit (E) when all resources are released, and the process is removed from the process table.
6. **Exit (E):**
    - The process has completed execution and is no longer in the system.
    - This is the final state of a process.
7. **New (N):**
    - The process is being created but has not yet started executing.
    - Transition to:
        - Ready (S) when it's ready to run.
        - Exit (E) if the creation fails or is aborted.
8. **Foreground (F):**
    - A process in the foreground of a terminal, receiving user input.
    - Transition to:
        - Background (BG) when suspended or moved to the background.
        - Running (R) when it regains control of the terminal.
9. **Background (BG):**
    - A process running in the background without access to the terminal.
    - Transition to:
        - Foreground (F) when brought to the foreground by the user.
        - Running (R) when it regains control of the terminal.

## UNIX Process Image

### **User-Level Context:**

- **Process Text:**
	- This refers to the code or program instructions of a running process.
- **Process Data:**
	- It includes the data and variables used by a process during its execution.
- **User Stack:**
	- The user stack is where a process stores function call information, such as return addresses and local variables.
- **Shared Memory:**
	- This is a segment of memory that multiple processes can access and share, allowing them to exchange data.

### **Register Context:**

- **Program Counter:**
	- It holds the memory address of the next instruction to be executed.
- **Processor Status Register:**
	- This register contains various flags and status information about the processor's state.
- **Stack Pointer:**
	- It points to the top of the stack, used for managing function calls and local variables.
- **General-Purpose Registers:**
	- These registers are used for various purposes, such as holding data and performing arithmetic operations.

### **System-Level Context:**

- **Process Table Entry:**
	- An entry in the process table that contains information about a specific process.
- **U (User) Area:**
	- A section of memory dedicated to storing user-specific data and information. Explained later on in the notes
- **Per Process Region Table:**
	- It keeps track of memory regions allocated to each process.
- **Kernel Stack:**
	- A separate stack used by the kernel for executing system calls and managing processes.
- **Process Status:**
	- Information about the current state of a process (e.g., running, waiting, terminated).
- **Pointers:**
	- These are references to various data structures used by the operating system to manage processes.
- **Process Size:**
	- The amount of memory allocated to a process.
- **User Identifiers:**
	- Unique identifiers associated with each user.
- **Process Identifiers:**
	- Unique identifiers assigned to each process.
- **Event Descriptor:**
	- Information about events that processes can wait for or signal to each other.
- **Priority:**
	- The priority level assigned to a process for scheduling.
- **Signal:** A mechanism for processes to communicate with each other or with the kernel.
- **Timers:**
	- Used for timing and scheduling purposes.
- **P_Link:**
	- A pointer to the next process in a linked list.
- **Memory Status:**
	- Information about the system's memory usage and availability.

## Unix U (User) Area. ignore this

## Process Control

## Process Creation

play w fork

---

# Chapter 9: Uniprocessor Scheduling

## Types of Scheduling

- Long-term Scheduling:
	- It selects processes from the job queue and loads them into the ready queue for execution.
	- These are processes that are ready to be executed and are waiting for the CPU.
	- A **New** Process is transitioned to **Ready** or **Ready/Suspend** here
- Medium-term Scheduling:
	- It involves swapping processes in and out of main memory (RAM) and secondary storage (like a hard disk).
	- This is often done to manage memory efficiently.
	- Transition from **Running/Suspend** or **Blocked/Suspend** to **Running/Blocked** is done by medium
- Short-term Scheduling:
	- Also known as CPU scheduling, it selects the next process from the ready queue and assigns the CPU to that process for a short time slice (time-sharing).
	- It determines which process gets CPU time.
	- Transitions a process from **Ready** to **Running**
		- **Blocked** does not count as it is just an I/O wait
- I/O Scheduling:
	- It manages the input/output requests from processes.
	- It decides the order in which I/O requests are serviced, optimizing disk and device utilization.
<!--Use rec-->

# Chapter 9: Uniprocessor Scheduling cont.

## Short term Scheduling Criteria

Main objective is to allocate processor time to optimize certain aspects of system behaviors

- User Oriented Criteria
    - Performance-Related
        - Turnaround time: The time it takes for a system to process a user's request and provide a response.
        - Response time: The time it takes for the system to react to a user's input or request.
        - Deadlines: Ensuring that the system meets user-set or system-imposed deadlines for tasks or processes.
    - Other
        - Predictability: The ability of the system to consistently perform within expected parameters, ensuring users can rely on its behavior.
- System Oriented Criteria
    - Performance-Related
        - Throughput: The rate at which a system can process and complete tasks or transactions.
        - Processor Utilization: Monitoring how efficiently the CPU is used, avoiding overloading or underutilization.
    - Other
        - Fairness: Ensuring that system resources are allocated fairly among users or processes.
        - Enforcing Priorities: Managing the priority of tasks or processes to ensure critical operations are completed first.
        - Balancing Resources: Distributing system resources effectively to prevent bottlenecks and maximize overall performance.

## Priorities

- Level assigned to an individual process/task running within a computer system
	- Determines the order in which processes are run within the system
- Unix and Windows handle priorities differently
	- Unix (Default used unless mentioned)
		- 1->N with 1 being the highest priority
	- Windows
		- N->1 with N being the highest priority

### Priority Queues

- Ready queues are now made in order of priority
	- Dispatcher goes up in order of highest priority to lower queues until all processes from current queue processes are running
- Limitation
	- Lower priority processes are starved of processor time as the higher priority processes will take it all up

#### Selection Functions

- Two Types
	- Preemptive
		- Can be interrupted
		- Time based uses Quantum(q)
			- Time quantum greater than typical interaction
			- Time quantum less than typical interaction
	- Non-Preemptive
		- C `Fill in from slides`

## Alternative Scheduling Policies

**FCFS (First-Come-First-Serve):**

- Selection Function:
	- Non-Preemptive
	- FCFS selects processes in the order they arrive in the ready queue. It uses a simple queuing mechanism.
- Decision Mode:
	- In FCFS, the decision mode is deterministic as it follows a fixed order of execution based on arrival time.
- Throughput:
	- FCFS has relatively low throughput because it may lead to process waiting times if a long process arrives first.
- Response Time:
	- Response time can be high for processes that arrive later as they have to wait for earlier processes to complete.
- Overhead:
	- FCFS has minimal overhead as it doesn't require complex decision-making or priority calculations.
- Effect on Processes:
	- FCFS can result in process waiting times, especially if a long process arrives first, potentially impacting overall efficiency.
- Starvation:
	- FCFS is susceptible to starvation, where a low-priority process might wait indefinitely behind high-priority processes.

**Round Robin (RR):**

- Selection Function:
	- Preemptive
	- Round Robin uses a circular queue and selects processes in a cyclical order, allocating a fixed time quantum to each.
- Decision Mode:
	- RR is time-sliced, and processes are scheduled based on time slices.
- Throughput:
	- RR offers better throughput compared to FCFS, as it ensures fairness and prevents long waiting times.
- Response Time:
	- Response time is generally good for short processes as they get frequent chances to execute.
- Overhead:
	- RR has a moderate overhead due to context switching when the time quantum expires.
- Effect on Processes:
	- RR is fair to all processes and prevents any process from monopolizing the CPU.
- Starvation:
	RR minimizes the risk of starvation as each process gets a turn.

**SPN (Shortest Process Next):**

- Selection Function:
	- Non-Preemptive
	- SPN selects the process with the shortest expected processing time next.
		- Guesses a process expected time and uses it later on as well, does so by computing via a method known as **Exponential averaging**
		- However a simpler way is to use this
		- `Add in equation 9.2 from book`
- Decision Mode:
	- It uses a non-preemptive approach and selects the process with the shortest expected runtime.
- Throughput:
	- SPN aims for high throughput by prioritizing short tasks first.
- Response Time:
	- Response time is good for short tasks, but longer tasks might wait a long time.
- Overhead:
	- SPN has a low overhead as it requires minimal context switching.
- Effect on Processes:
	- Short processes are favored, and long processes may experience significant waiting times.
- Starvation:
	- SPN can lead to starvation for longer processes if many short tasks keep arriving.

**SRT (Shortest Remaining Time):**

- Selection Function: SRT is a preemptive version of SPN, selecting the process with the shortest remaining time to complete.
	- Calculates on arrival however
- Decision Mode: It dynamically reevaluates and selects the process with the shortest remaining time whenever a new process arrives or a running process finishes.
- Throughput: SRT aims for high throughput by always choosing the shortest remaining task.
- Response Time: Response time is generally excellent, as the shortest remaining task is immediately given priority.
- Overhead: SRT has a higher overhead due to frequent context switches.
- Effect on Processes: Short tasks are favored, and long tasks may experience some waiting but less than SPN.
- Starvation: SRT can lead to starvation for longer processes if many short tasks keep arriving frequently.

**HRRN (Highest Response Ratio Next):**

- Selection Function: HRRN calculates the response ratio for each process and selects the one with the highest ratio.
- Decision Mode: It uses a non-preemptive approach based on response ratios.
- Throughput: HRRN aims for high throughput by considering both waiting time and estimated remaining time.
- Response Time: Response time is generally good, especially for processes with high response ratios.
- Overhead: HRRN has moderate overhead due to calculations involved in determining response ratios.
- Effect on Processes: Processes with higher response ratios get preference, balancing between short and long tasks.
- Starvation: HRRN minimizes the risk of starvation by considering waiting times.

**Feedback:**

- Selection Function: Feedback scheduling uses multiple queues with different priorities, and processes are selected based on their current priority level. Lower priority queues are checked before higher priority ones.
- Decision Mode: It employs a dynamic priority scheme where processes can move between different priority queues based on their behavior and execution history. Processes that haven't received CPU time for a while are promoted to higher-priority queues.
- Throughput: Feedback scheduling aims to balance both fairness and responsiveness. It ensures that processes waiting for a long time get a chance to execute, improving overall throughput.
- Response Time: Response time can vary depending on a process's priority and its movement between queues. Processes with higher priorities experience shorter response times.
- Overhead: The overhead in feedback scheduling is moderate due to the management of multiple priority queues and the need to promote or demote processes based on their behavior.
- Effect on Processes: Feedback scheduling promotes fairness by preventing any single process from monopolizing the CPU. It ensures that long-waiting processes eventually get a turn to execute.
- Starvation: Feedback scheduling minimizes the risk of starvation for low-priority processes by allowing them to move to higher-priority queues based on their wait time.

---
- Round robin
	- Configured for quantum >= 1
	- `Add in process for filling a timing diagram with round robin enabled`
