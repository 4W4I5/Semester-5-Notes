> [!NOTE]
> Lectures tagged with :warning: are essentially low-effort notes. Did not make them right before finals
>
> Lectures tagged with :white_check_mark: were made during finals
>
> Lectures tagged with :x: have not been made yet. Probs will not be if you see it the day after the exam =)

| Chapter | Topic                                           | Status    | Prep(Ignore this, its for personal use) |
| ------- | ----------------------------------------------- | --------- | --------------------------------------- |
| **7**   | Memory Management                               | :x:       | :x:                                     |
| **8**   | Virtual Memory                                  | :x:       | :x:                                     |
| **6**   | Concurrency: Deadlock & Starvation              | :x:       | :x:                                     |
| 5       | Concurrency: Mutual Exclusion & Synchronization | :warning: | :x:                                     |
| 4       | Threads                                         | :x:       | :x:                                     |
| 9       | Uniprocessor Scheduling                         | :warning: | :x:                                     |
| 3       | Process Description & Control                   | :warning: | :x:                                     |


<!--
:white_check_mark:
:warning:
:x:
-->
# 7. Memory Management
**Terminology:**
- Frame
- Page
- Segment

**Memory Management Requirements:**
- Relocation
- Protection
- Sharing
- Logical Organization
- Physical Organization
# 8. Virtual Memory
NOTE:: Till slide 29 only

**Terminology:**
- Virtual Memory:
	- Logical addresses assigned for memory on disk.
	- Allows for relative addressing based off of the base pointer.
	- Size is limited by addressing scheme and amount of secondary storage available, not by actual number of main storage locations
- Virtual Address: Address in virtual memory
- Virtual Address Space: Virtual storage assigned to a process
- Address Space: Range of memory addresses available to a process
- Real Address: Address of a storage location in main memory

**Hardware & Control Structure Characteristics**
- All logical addresses (memory used by program) are dynamically translated into physical addresses real time
- Process can be broken into a number of pieces, these pieces do not have to be sequentially located in memory during execution

> [!WARNING]
> Small part that i dont get here

**Execution of a process**
- OS loads a portion of the process into memory. Known as Resident set
	- If a portion is not in memory and accessed an interrupt is generated to fetch that section.
	- The process is blocked during this stage
- Example
	- Portion of process that has the logical address brought into main memory
	- OS has to issue a disk I/O Read Request
		- Current process is blocked until read is completed
		- Another process dispatched to run while the read occurs
	- TODO:: COMPLETE THIS EXAMPLE THERE IS SOME SORT OF CONFUSION HERE
- Implications
	- Can imply that more processes might be maintained in main memory
	- each only has a portion loaded in with each in ready state
	- a process can be larger than the main memory capacity


**Paging vs Segmentation**

| **Attributes**               | **Simple/Virtual Memory Paging**                                                                                                                          | **Simple/Virtual Memory Segmentation**                                                                                                                             |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Partitioning**             | Main memory partitioned into frames (fixed size)                                                                                                          | Not Partitioned                                                                                                                                                    |
| **Program breakage**         | Broken into pages by compiler/memory management system                                                                                                    | Decision made by programmer                                                                                                                                        |
| **Internal Fragmentation**   | Within frames                                                                                                                                             | None                                                                                                                                                               |
| **External Fragmentation**   | None                                                                                                                                                      | Yes                                                                                                                                                                |
| **Table**                    | OS Maintains a page table, each process shows which frame each page occupies                                                                              | OS Maintains a segment table, each process shows load address and length of each segment                                                                           |
| **What list is maintained**  | Free frame list maintained                                                                                                                                | List of free holes in main memory is maintained                                                                                                                    |
| **Real address calculation** | Uses page number & offset                                                                                                                                 | Uses segment number & offset                                                                                                                                       |
| **What should be in memory** | Simple paging requires all pages required to be in memory unless overlays are used. Virtual paging reads in pages as needed by writing a page out to disk | Simple segmentation requires all segments required to be in memory. Virtual Segmentation reads in segments as needed by writing a one or more segments out to disk |

**Principle of Locality**
- Possible to guess which portions of a process are needed in the future
	- Program/Data references tend to cluster up
	- Only a few portions are needed in a short time
- Avoids thrashing
	- State where system spends most of its time swapping portions rather than executing instructions

**Support needed for Virtual Memory**
- What must be available in a system for virtual memory to be practical and effective
	- Hardware must support paging & segmentation
	- OS must include software for managing the movement of pages and/or segments to/from main and secondary memory

**Paging**
- First used on the atlas computer
- Each process has its own page table where each Page Table Entry(PTE) contains the frame number of the corresponding page in main memory

| **Memory Management formats**      | **Virtual Address**                   | **Page Table Entry(PTE)**                                  | **Segment Table Entry**                                             |
| ---------------------------------- | ------------------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------------- |
| **Paging Only**                    | Page Number + Offset                  | PresentBit + ModifiedBit + OtherControlBits + Frame Number | None                                                                |
| **Segmentation Only**              | Segment Number + Offset               | None                                                       | PresentBit + ModifiedBit + OtherControlBits + Length + Segment Base |
| **Combined Segmentation & Paging** | Segment Number + Page Number + Offset | PresentBit + ModifiedBit + OtherControlBits + Frame Number | ControlBits + Length + Segment Base                                 |

**How to translate a Virtual Address to Real Address via Paging**
- Virtual address: PageNum + Offset
	- PageNum is added with PageTablePtr to get FrameNum
	- Offset is the same for both Page and Frame
- Physical address: FrameNum + Offset
	- Offset starts from base of page frame in main memory

**How to translate a Virtual Address to Real Address via Two-Level Paging(Hierarchical)**
- Virtual address now has an extra parameter: RootPageNum + UserPageNum + Offset
	- Offset is the same as before
	- Only Root page has a pointer to be added with.
	- Value from adding RootPageNum + RootPageTablePtr is added with UserPageNum to get FrameNum

**Inverted Page Table**
- Drawback of page tables is that their size is proportional to that of virtual address space
- PageNum is mapped to a hash value which points to an inverted page table which contains the PTE. One PTE in the inverted table accounts for a real page frame in memory instead of virtual memory
	- Inverted cause PTE are indexed by FrameNum instead of VirtualPageNum
	- Hashed values can overflow and map into the same PTE a chaining technique is used which ensures the values are unique
- Contains
	- PageNum, ProcessIdentifier, ControlBits, ChainPointer(Points to next entry in the  chain)
- Fixed proportion of real memory is required regardless of the num of processes or virtual pages supported

**Translation Lookaside Buffer (TLB)**
- Two memory accesses are caused during a virtual memory address read
	- Fetching the PTE
	- Fetching the data referenced by the PTE
- Doubled memory access time due to this
	- Avoided by use of a special high speed cache aka Translation Lookaside Buffer(TLB)
		- Same as usual but a TLB is checked. Operates in the same way a cache does
- TLB Flow
	- CPU checks TLB
	- If Page Table in TLB, Generate Physical address
		- Otherwise, check Page table
			- Is Page table in main memory? Update TLB then generate Physical address
				- Otherwise, we have a Page fault. Handle it and recheck TLB
	- Page fault Routine
		- Read page from disk (OS tells CPU)
			- Disk Read Interrupt generated
		- Page transferred from disk to memory
			- If memory full a page is swapped out
		- Pages updated
- Indexing the TLB
	- Done via Associative Mapping
		- Performs a direct match against the stored PageNum + PTE in buffer instead of just the PageNum against the PTE as done in direct mapping

**TLB & Cache operation diagram**
> [!NOTE]
> Add fig 8.9 from slides here




**Page Size**
- Based on several factors
	- Intera


**Book questions**
- What is the difference b/w simple and virtual memory paging
- Explain thrashing
- Why is the principal of locality crucial to the use of virtual memory
- What elements are found in a PTE(Page Table Entry)? Briefly define each element
- What is the purpose of the translation lookaside buffer
- Briefly define the alternative page fetch policies
- Describe how the virtual address generated by the CPU is translated into a physical main memory address
# 6. Concurrency: Deadlock & Starvation
# 5. Concurrency: Mutual Exclusion & Synchronization
## Key terms related to concurrency
- **Atomic operation**
	- Function/operation implemented as a sequence of one or more instructions that appears to be indivisible
	- No other process can see the intermediate state or interrupt the operation
	- Guaranteed
		- Execute as a group
		- Not execute at all
		- No visible effect on system state
	- Isolation from concurrent processes
- **Critical Section**
	- Section of code that must not be executed while other processes are using the shared resources it has to use
- **Deadlock**
	- Two or more processes are unable to proceed as each is waiting on one of the other to do something
- **Livelock**
	- Two or more processes continuously change their states in response to each other without doing any useful work
- **Mutual exclusion**
	- Requirement, if a process accesses shared resources, no other process can use that shared resource i.e be in a critical section
- **Race Condition**
	- Situation, where multiple threads/processes read and write shared resources
- **Starvation**
	- Overlooked by scheduler, ready to run but never run
## Principles of Concurrency
- Operating System Concerns
	- Must be able to keep track of various processes
	- Allocate/Deallocate resources for each active processes
	- Protect the data and physical resources of each process against interference by other processes
	- Ensure that the processes and outputs are independent of the processing speed
## Mutual Exclusion

- **Requirements**
	- Enforced
	- Must halt without interfering with other processes
	- No Deadlock/Starvation
	- Must not be denied access to critical section when there is no other process using it
	- No assumptions are made about relative process speeds or number of processes
	- Remains in critical section for finite time only

**Interrupt Disabling:**

- **Interrupts and Mutual Exclusion:**
  - In a multitasking operating system, various processes or threads run concurrently.
  - Interrupts are essential mechanisms to handle events such as I/O, timer expiration, or hardware faults.
  - Achieving mutual exclusion in such an environment is critical to prevent data corruption and maintain the integrity of shared resources.

**Interrupt Disabling Approach:**

  - To ensure mutual exclusion, a process can disable interrupts before entering a critical section and re-enable them when leaving the section.
  - Disabling interrupts blocks the CPU from responding to incoming interrupt requests.
  - This approach guarantees that no interrupt will occur during the execution of the critical section.

**Advantages and Considerations:**

  - Interrupt disabling is a straightforward way to implement mutual exclusion.
  - It is generally efficient and guarantees mutual exclusion as long as all processes adhere to the same protocol.
  - However, it has some drawbacks:
    - Disabling interrupts globally may have a significant impact on system responsiveness.
    - It should be used with caution, especially in real-time systems or systems with strict timing requirements.

**Special Machine Instructions (Hardware Support):**

- **Atomic Instructions:**
	- Some modern CPUs provide atomic instructions that are executed in a single step without interruption.
		- These instructions are designed for mutual exclusion and work as follows:
			- **Test-And-Set:** This instruction reads a memory location and sets it to a particular value, all in one atomic step. It returns the previous value of the memory location.
			- **Swap:** This instruction swaps the content of a memory location with a specified value atomically.
- **Usage for Mutual Exclusion:**
	- Processes or threads can use these atomic instructions to protect their critical sections without disabling interrupts.
	- Here's an example of using "Test-And-Set":
		1. Process A reads a shared memory location using "Test-And-Set" and gets the previous value.
		2. If the previous value is 0 (indicating no other process is in the critical section), process A enters the critical section.
		3. If the previous value is 1, process A knows that another process is in the critical section and must wait.

- **Advantages and Limitations:**
	- Using atomic instructions is highly efficient and does not disable interrupts.
	- It is particularly useful in high-performance systems.
	- However, it may not be available on all hardware platforms, and its usage should be carefully designed to avoid race conditions.

## Semaphores


### **Mutex (Mutual Exclusion):**

- **Definition:**
	- A mutex, short for "mutual exclusion," is a synchronization primitive used to protect critical sections in multithreaded or multiprocess systems.
	- It ensures that only one thread or process can access a shared resource or critical section at a time.
- **Usage with Semaphores:**
	  - In the context of the Producer/Consumer problem and many other synchronization scenarios, mutex locks are used to protect access to shared data structures like buffers or queues.
	  - Mutexes ensure that while one thread or process is working in a critical section, no other thread or process can enter that section.
- **Implementation:**
	- Mutex locks typically provide two operations:
		- **Lock (or Acquire):** A thread or process attempts to acquire the lock. If the lock is already held by another thread or process, it will block until the lock becomes available.
		- **Unlock (or Release):** A thread or process releases the lock, allowing other threads or processes to acquire it.
- **Example in Producer/Consumer Problem:**
	- In the code examples I provided for the Producer and Consumer, the `buffer_mutex` is a mutex used to protect access to the shared buffer.
	- When a thread or process wants to access the buffer (either for adding an item or removing an item), it must first acquire the `buffer_mutex`. This ensures that only one thread can access the buffer at any given time.

Here's how mutex locks are used in the provided code:

```python
Producer:
  while (true) {
    // ...
    
    // Lock the buffer.
    lock(buffer_mutex);
    
    // Add the item to the buffer.
    add_item_to_buffer(item);
    
    // Unlock the buffer.
    unlock(buffer_mutex);
    
    // ...
  }
```

```python
Consumer:
  while (true) {
    // ...
    
    // Lock the buffer.
    lock(buffer_mutex);
    
    // Remove an item from the buffer.
    item = remove_item_from_buffer();
    
    // Unlock the buffer.
    unlock(buffer_mutex);
    
    // ...
  }
```

### **Semaphores (Duplicate notes):**

- **Mutual Exclusion:**
	- Semaphores are a synchronization mechanism that can be used to enforce mutual exclusion.
	- A semaphore is a non-negative integer variable that can be accessed by two standard operations: "wait" and "signal."
- **Semaphore Operations:**
	- **Wait (P) Operation:**
		- If the semaphore value is greater than 0, it decrements the value and allows the process to continue.
		- If the semaphore value is 0, it blocks the process until another process signals (increments) the semaphore.
	- **Signal (V) Operation:**
		- Increments the semaphore value, possibly waking up a waiting process if the value was 0.

**The Producer/Consumer Problem:**

- **Scenario:**
	- The Producer/Consumer problem is a classic synchronization problem involving two types of processes: producers and consumers.
	- Producers produce items and place them in a shared buffer, while consumers remove items from the buffer.
	- The challenge is to ensure that producers don't add items to a full buffer and consumers don't remove items from an empty buffer, all while maintaining mutual exclusion.
- **Using Semaphores:**
	- Semaphores can be used to solve the Producer/Consumer problem.
	- Two semaphores, "empty" and "full," are used:
		- "empty" counts the number of empty slots in the buffer.
	        - "full" counts the number of filled slots in the buffer.
	- Additional semaphores or mutex locks are used to protect access to the shared buffer.
- **Implementation Example:**
	- Let's assume we have a shared buffer with a maximum size of 10.
	- We define semaphores:
		- `empty` initialized to 10 (representing empty slots).
		- `full` initialized to 0 (initially, no items in the buffer).
	- We also use mutex locks to protect the buffer.

# 4. Threads
# 9. Uniprocessor Scheduling
## Example:
- ![](/Pasted%20image%2020230926023241.png)
- ![](/Pasted%20image%2020230926023256.png)

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
- Determines next process to execute based on
	- w -> time spent waiting
	- e -> time spent in execution
	- s -> total service time
- Two Types
	- Preemptive
		- Can be interrupted
		- Time based uses Quantum(q)
			- Time quantum greater than typical interaction
			- Time quantum less than typical interaction
	- Non-Preemptive
		- Cannot be interrupted, will continue until it terminates or blocks itself for I/O

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
	- RR minimizes the risk of starvation as each process gets a turn.

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

- Selection Function: HRRN calculates the response ratio for each process and selects the one with the highest ratio. $$Ratio=\frac{timeWaiting+ expectedServiceTime}{expectedServiceTime}$$
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
- Round robin
	- Configured for quantum >= 1
	- `Add in process for filling a timing diagram with round robin enabled`

## Performance Comparison
- Done by a formula $$\frac{T_r}{T_s}=\frac{1}{1-p}$$
- Where
	- Tr = Turnaround time
	- Ts = Service Time(spent in running state)
	- P = processor utilization
	![](/Pasted%20image%2020230926022710.png)
## Fair Share
- Used in multi-user systems
- Ensures each user gets it own fair share of system resources
	- Weighted Fair Queuing
	- Round Robin with Quotas
- Formulas
	- $$CPU_j(i) = \frac{CPU_j(i-1)}{2}$$
	- $$GCPU_k(i) = \frac{GCPU_k(i-1)}{2}$$
	- $$P_j(i)=Base_j+\frac{CPU_j(i)}{2}+\frac{GCPU_k(i)}{4W_k}$$
	- Where
		- CPUj(i) -> Processor util by process j thru interval i (CPU Count)
		- GCPUj(i) -> Processor util by group k thru interval i (GCPU Count)
		- Pj(i) -> Current Priority of process j at starting i
		- Basej -> Base priority of process j
		- Wk -> Weight assigned to group k, constraint that 0 < Wk <= 1 and sum of all Wk = Total weight which is 1
- Patterns
	- Grouping decides the 2^n order of execution
		- If Group A and Group B have 50% share of the processor then Group A will run for one and Group B will run for the regardless of the processes contained within a group
			- Processes within a group will take turns executing when given the chance

## UNIX SVR3 Scheduler
- Provide good response time for interactive users and ensure low priority background tasks do not starve
- Multilevel Feedback using Round robin
- Priority is recomputed once per second
- Base priority is used to lock a process to that particular priority
	- Order
		- Swapper
		- Block I/O
		- File Manipulation
		- Charecter I/O
		- User Process
- Formulas
	- $$CPU_j(i) = \frac{CPU_j(i-1)}{2}$$
	- $$P_{j(i)}=Base_{j} + \frac{CPU_j(i)}{2}+nice_j $$
	- Where
		- CPUj(i) -> Processor util by process j thru interval i (CPU Count)
		- Pj(i) -> Current Priority of process j at starting i
		- Basej -> Base priority of process j
		- nicej -> user-controlled adjustment factor
	- Pattern
		- Found that if the processes have the same base priority and CPU count, the timeline for process A is offset by + 1 of the previous process
# 3. Processes Description & Control
- #### Process is an instance of a program or a program in execution
- #### Process elements
	- Program code
	- Process data
	- Process State Word (PSW)
- #### Process control block
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
- ### Process Creation Events
	- Allocate a slot in the process table for new processes
	- Assign a PID
	- Allocate space except for shared memory
	- Init PCB, if forked then increment any and all counters for the files owned by the parent and set child process to Ready state
	- Set appropriate linkages
	- Create/Expand other data structures
- #### Reasons for process creation
	- **New batch job**:
		- Processes are created to execute a new batch job or task in batch processing systems, where multiple jobs are run sequentially.
	- **Interactive logon**:
		- When a user logs into a computer system, an interactive process is created to facilitate user interaction and run user-specific tasks.
	- **Created by OS to provide a service**:
		- The operating system creates processes to offer various services like printing, network services, or background tasks (daemons) that serve system-level functions.
	- **Spawned by the existing process**:
		- Existing processes can create child processes or spawn new processes to perform parallel or related tasks, enabling multitasking and efficient resource utilization.
- #### Reasons for Process Suspended
	- **Swapping**
		- Moving part/all of process from main memory to disk
	- **Parent Process**
		- The parent process can request the child process to be stopped
	- **Interactive User Request**
		- User suspends the execution of a program i.e for debugging
	- **Timing**
		- Process may only execute periodically
- #### Reasons for Process Termination
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
- #### Process State Models
	- 2 State model
		- ![](/Pasted%20image%2020230912151828.png)
	- 5 State model
		- ![](/Pasted%20image%2020230912151924.png)
	- 6/7 State model
		- ![](/Pasted%20image%2020230912152003.png)

## Process - OS Interaction
- #### System Call, Interrupt, Trap
	- **Interrupt**
		- External to the execution of the current instruction
			- Caused by clock, I/O and memory fault
	- **System Call**
		- Request for OS Service
	- **Trap**
		- Error or exception generated within the currently running process
		- OS determines if condition is fatal
			- Moved to exit state and a process switch occurs
- #### Mode Switching
	- OS regains control of the Program Counter. Dependent on Interrupts
		- If none
			- Continue
		- If interrupt pending
			- Set PC to starting address of ISR
			- Switch from user to kernel mode to allow for privileged instructions
- #### Process Switching
	- OS identifies an event, proceses it and passes control to scheduler which then decides to keep it running, block and/or suspend it
		- Steps
			- Save context of the processor
			- Update PCB state to RUNNING
			- move PCB to appropriate queue
			- Select another process and repeat
			- Restore context after 2nd process is done or is blocked

## System Data Structures
- **Process tables:**
	- These tables store information about running processes, including their status, identifiers, and resource allocation.
	- Holds
		- User Data
		- User Program
		- Stack
		- PCB
		- Heap
	- AKA process image
- **Memory tables:**
	- Memory tables keep track of the allocation and usage of system memory, helping manage and optimize memory resources.
- **I/O tables:**
	- I/O tables maintain information about input and output operations, helping manage data transfers between devices and processes.
- **File tables:**
	- File tables store metadata and control information for files, facilitating file management and access control in the system.
## UNIX SVR4 Process management 3.6

![](/Pasted%20image%2020230926021341.png)

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
- ### **User-Level Context:**
	- **Process Text:**
		- This refers to the code or program instructions of a running process.
	- **Process Data:**
		- It includes the data and variables used by a process during its execution.
	- **User Stack:**
		- The user stack is where a process stores function call information, such as return addresses and local variables.
	- **Shared Memory:**
		- This is a segment of memory that multiple processes can access and share, allowing them to exchange data.
- ### **Register Context:**
	- **Program Counter:**
		- It holds the memory address of the next instruction to be executed.
	- **Processor Status Register:**
		- This register contains various flags and status information about the processor's state.
	- **Stack Pointer:**
		- It points to the top of the stack, used for managing function calls and local variables.
	- **General-Purpose Registers:**
		- These registers are used for various purposes, such as holding data and performing arithmetic operations.
- ### **System-Level Context:**
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
## Fork()

```
if(fork() || fork()){
	fork()
}
cout << "1"

Output will be 1 1 1 1 1
```

 Explanation:

 - ![](/Pasted%20image%2020230926021904.png)
### Some simple stuff to remember
- IF(Fork()) -> Refers to the parent process. Can be the parent in a child process as well
- IF(!Fork()) -> Refers to a child of the current parent process. Same as IF(Fork() == 0)
- A || B -> B will run if A is false