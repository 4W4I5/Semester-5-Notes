> [!NOTE]
> Lectures tagged with :warning: are essentially low-effort notes. Did not make them right before finals
>
> Lectures tagged with :white_check_mark: were made during finals
>
> Lectures tagged with :x: have not been made yet.
>
> Lectures tagged with :exclamation: will not be made.

| **Chapter** | **Topic**                                       | **Status**         | **Prep(Ignore this, its for personal use)** |
| ----------- | ----------------------------------------------- | ------------------ | --------------------------------------- |
| **7**       | Memory Management                               | :white_check_mark: |  :warning:                        |
| **8**       | Virtual Memory                                  | :white_check_mark: | :white_check_mark:               |
| **6**       | Concurrency: Deadlock & Starvation              | :white_check_mark:                | :white_check_mark:                                     |
| 5           | Concurrency: Mutual Exclusion & Synchronization | Incomplete :warning:          | :warning:                                     |
| 4           | Threads                                         | Incomplete :warning:                | :warning:                                     |
| 9           | Uniprocessor Scheduling                         | :warning:          | :white_check_mark:                                     |

<!--
:white_check_mark:
:warning:
:x:
-->
# 7. Memory Management
**Terminology**:
- **Frame**: Fixed length block of main memory
- **Page**: Fixed length block of virtual memory
- **Segment**: Variable length block of virtual memory. Entire segment in a frame is known as segmentation while divided segments in a frame is known as combined segmentation and paging
- **Logical Address**: reference to memory independent of physical location in memory. 16bit in length with 6 bits for PageNum and 10 bits for Offset.
	- PageNum is number of the process the page is referring to.
		- This is directly used in tandem with offset during paging
		- This is translated to a Base from the Process Segment table and OR'ed with the offset when used with segmentation
- **Relative Address**: Address represented by an offset of some point in memory
- **Physical/Absolute Address**: Actual location in main memory
- **Paging**: Divide a process into fixed size chunks, fill frame with various pages. List of free frames is maintained by OS. Shove pages into free frames wherever possible
- **Page Table**: Maintained for **each** process. Used to produce a physical address. Contains page number and offset
- **Segmentation**: Program division, varied length. Consists of SegmentNum + Offset. Similar to dynamic partitioning

**Memory Management Requirements**:
- Relocation
	- Cannot know where the program will be placed, need to allow for moving the program about due to swapping. Assign a virtual address to PCB. That virtual address is assigned to a physical address
	- Leads to addressing requirements
		- Structure: PCB. Program, Data & Stack Segments
		- As OS manages memory, it must also deal with references inside each segment
	- Virtual to Physical Address translation required
- Protection
	- Hardware capability to abort instructions that access logical addresses not in range of the program they are running in
	- Acquire perm to reference memory location for reading/writing
	- Goes hand in hand with relocation
- Sharing
	- Flexibility in protection to allow each process to access a portion of the original process memory instead of each having their own copies
- Logical Organization of memory
	- Physical/Logical memory is linear, one-dimensional
	- Programs however are constructed modularly, can have modifiable/unmodifiable code
		- Allows easier maintenance of code this way, more programmer friendly
		- Different protection levels are applied to different modules i.e. read/write access
		- Sharing modules across processes
	- Follows the ideology behind segmentation
- Physical Organization of memory
	- Physical Memory is volatile & fast, Logical memory is non-volatile & slow. Store active programs and data in memory while long term storage is for Logical memory
	- Individual Programmer Responsibility
		- The programmer must not assume the responsibility for managing main memory. This is due to the fact that the power to overlay should not be granted to them. Overlaying is where different modules share the same memory region. Hardware is optimized to handle this better than programmers might be able to in software + it is a security concern
		- Programmers also do not know how much space/memory will be available therefore it is not logical to let them manage it
		- System should be solely responsible for this

**Memory Partitioning**

| **Techniques**                  | **Description**                                                                                                                                           | **Strengths**                                                                        | **Weaknesses**                                                                                                   |
| ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- |
| **Fixed Partitioning**          | Divide memory into equal length chunks                                                                                                                    | Simple and small overhead                                                            | Internal fragmentation & Max Num of ActiveProcesses is fixed, Program needs to be designed with overlays in mind |
| **Unequal Size Partitioning**   | Divide memory into unequal length chunks of varied sizes. Still fixed but better use of fixed partitioning                                                | Same as before                                                                       | Same as before                                                                                                   |
| **Dynamic Partitioning**        | Create dynamic partitions that are of variable length and number                                                                                          | No internal fragmentation                                                            | Processor time needed to counter external fragmentation (Compaction)                                                          |
| **Simple Paging**               | Divide memory into equal length frames. Each process is divided into equal length pages. Process loaded by loading all pages into random frames of memory | No external fragmentation                                                            | Small internal fragmentation                                                                                     |
| **Simple Segmentation**         | Divide process into segments. Load process by loading all segments into dynamic partions                                                                  | No internal fragmentation, reduced overhead compared to dynamic partitioning         | External fragmentation                                                                                           |
| **Virtual Memory Paging**       | Same as Simple Paging but only load pages that are part of the resident set                                                                               | Large virtual address space, no external fragmentation                               | Complex memory management overhead needed                                                                        |
| **Virtual Memory Segmentation** | Same as Simple Segmentation but only load segments that are part of the resident set                                                                      | Large virtual address space, no internal fragmentation, protection & sharing support | Complex memory management overhead needed                                                                        |

**Memory Placement Algorithms**
- **Best-Fit**: Closest to requested size
- **First-Fit**: First block that is large enough from the beginning
- **Next-Fit**: Next available block that is large enough. Run after First-Fit

**Replacement Algorithms**
- Dynamic partitions with multiprogramming eventually has all the processes in a blocked state. No more memory left for active processes left.
- OS chooses a process to swap out for an active one instead of waiting for one to come back to ready state

**Buddy System**
- A version of Best Fit
- Comprised of Fixed & Dynamic partitioning schemes
- Space available is treated as a single block.
- Working
	- Divide according to best fit
	- Assume a tree structure. Left most nodes divide the structure when allocated

**Book Questions: **
- **What technical issues can relocation bring about in memory management**
	- Without compaction relocation is bound to increase fragmentation
- **What requirements is memory management intended to satisfy?**
	- Memory management is intended to satisfy the requirements of efficient utilization of memory, protection and isolation of processes, and providing a convenient abstraction for programmers.
- **What is relocation of a program?**
	- Relocation of a program refers to adjusting the addresses used in the program to be executed to reflect the actual location in memory where the program will be loaded.
- **What are the advantages of organizing programs and data into modules?**
	- Organizing programs and data into modules promotes modularity, making code more readable, maintainable, and reusable. It also helps in team collaboration as different modules can be developed independently.
- **What are some reasons to allow two or more processes to all have access to a particular region of memory?**
	- Processes may need to share memory for inter-process communication, data sharing, or coordination. This allows efficient collaboration between processes.
- **In a fixed partitioning scheme, what are the advantages of using unequal-size partitions?**
	- Unequal-size partitions can lead to better memory utilization as they can accommodate varying sizes of programs, reducing internal fragmentation compared to equal-size partitions.
- **What is the difference between internal and external fragmentation?**
	- Internal fragmentation occurs when memory is allocated but not fully utilized, leading to wasted space within a partition. External fragmentation occurs when free memory is scattered throughout the system, making it challenging to allocate contiguous blocks of memory.
- **What is address binding? State the different timings when address binding may occur.**
	- Address binding is the process of associating a program's symbolic addresses with physical memory addresses. It can occur at three different timings: compile time (static binding), load time (dynamic/static binding), and execution time (dynamic binding).
- **What is the difference between a page and a frame?**
	- In the context of memory management, a page is a fixed-length contiguous block in a virtual memory space, while a frame is a fixed-length block in physical memory. Pages and frames are used in paging systems to manage memory.
- **What is the difference between a page and a segment?**
	- In the context of memory management, a page is a fixed-size unit used in paging, while a segment is a variable-sized unit used in segmentation. Segmentation allows logical division of a program into different segments with variable sizes.
# 8. Virtual Memory
NOTE:: Till slide 29 only

**Terminology**:
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
![](https://github.com/4W4I5/Semester-5-Notes/blob/main/Pasted%20image%2020240101124738.png)

**Page Size**
- Based on several factors
	- Internal fragmentation
	- Fault tolerance:
	- Frames allocated
	- TLB size
- Smaller page size
	- Lessens the amount of internal fragmentation but increases the number of pages
	- Results in a double page fault if not in memory for large programs where the active processes are also stored in virtual memory
	- Not favored by virtual memory as it prefers a large block transfer instead of small chunks as they are rotational
- Larger page size
	- Increased fragmentation
	- Single page fault as normal
	- Favored by virtual memory but principal of locality is weakened i.e. recently used data now has links to data that is not in memory
		- Eliminated the closer the page size approaches the size required by the entire process
- TLB size helps with fixed page sizes as the more pages the TLB can cache the less page faults it is susceptible to


**Book questions**
- **Difference between Simple and Virtual Memory Paging**:
    - **Simple Memory Paging**: In simple memory paging, the entire program is loaded into the main memory at once. It doesn't involve the concept of virtual memory, and the execution occurs directly from the physical memory.
    - **Virtual Memory Paging**: Virtual memory paging involves the use of a combination of physical and secondary storage (like a hard disk). Only the necessary portions of a program are loaded into the main memory, allowing for efficient use of resources.
- **Thrashing**:
    - Thrashing occurs when a computer's virtual memory system is excessively busy swapping data between the RAM and the disk, instead of executing instructions. It leads to a decrease in overall system performance as valuable CPU time is spent on managing the swapping process rather than actual computation.
- **Principal of Locality in Virtual Memory**:
    - The principle of locality suggests that programs tend to access a relatively small portion of their address space at any given time. Virtual memory systems leverage this principle by keeping frequently used pages in the faster RAM, while less frequently used pages are stored in slower secondary storage. This optimizes performance by reducing the need for constant disk access.
- **Elements in a Page Table Entry (PTE)**:
    - **Page Frame Number (PFN)**: Represents the physical frame where the corresponding page is stored.
    - **Valid/Invalid Bit**: Indicates whether the page in the frame is currently in use (valid) or not (invalid).
    - **Protection Bits**: Control the access rights to the page, specifying whether it's read-only, read-write, etc.
    - **Dirty Bit**: Indicates whether the page has been modified since it was loaded into memory.
- **Purpose of Translation Lookaside Buffer (TLB)**:
    - TLB is a cache of recently used page table entries, speeding up the virtual-to-physical address translation process. It stores mappings of virtual page numbers to physical frame numbers, reducing the need to access the full page table in slower memory.
- **Alternative Page Fetch Policies**:
    - **Demand Paging**: Pages are brought into memory only when they are explicitly referenced.
    - **Prepaging**: Multiple pages are brought into memory at once, anticipating future references.
- **Virtual Address Translation into Physical Main Memory Address**:
    - The CPU generates a virtual address, which consists of a page number and an offset within that page.
    - The page number is used to index the page table, retrieving the corresponding page frame number.
    - The offset is combined with the page frame number to generate the final physical memory address.
# 6. Concurrency: Deadlock & Starvation
**Resource Categories**
- Reusable & Consumable
	- Reusable: Safely used by one process at a time. Not depleted after use.
		- Examples: Hardware resources and data structures such as files, databases and semaphores
	- Consumable: Created & Destroyed i.e Produced & Consumed.
		- Examples: Interrupts, signals, messages and information in I/O Buffers
- Reusable Resources Deadlock
	- same as the one in the JPD section above
- Consumable Resources Deadlock
	- Memory Request: P1{Get80KB, Get60KB} & P2{Get70KB, Get80KB}
		- After both processes run the first instruction they will be deadlocked if both progress to the next instruction
	- Receiving message: P1{ReceiveP2, SendP2M1} & P2{ReceiveP1, SendP1M2}
		- If the receive portion of the code is blocking. Both processes will be deadlocked waiting to receive the message from either process


**Deadlock**
- **Definition**: Permanent condition caused when each processes in a set of processes are awaiting an event that can only by triggered by another blocked process in the set
- **Potential Deadlock**
	- System has the necessary conditions for a deadlock but it has not yet occurred
	- **Conditions for Deadlock**
		- Mutual exclusion: One resource or more are held in a non-shareable mode
			- Can indirectly avoid this via OS support for mutual exclusion such as implementing the use of Semaphores or Allow multiple access for reads but only exclusive access for writes
		- Hold & Wait: Greedy process that has a resource on hold and is waiting to hold more resources
			- Can indirectly avoid this via ensuring that a process request all of its needed resources and then prevent the process from running until all resources are ready. Think of it as loading a game, cant play until the level loads up
		- No Preemption: Resources are only released voluntarily by a process
			- Can indirectly avoid this by forcing a process to release its resources if it cannot acquire the rest of its requested resources. May also preempt the second process, requiring it to release its resources. Only practical for processes that can easily have their states saved
		- Circular Wait: A set of processes each in wait of the other.
			- Can directly avoid this by defining a linear order of resource types i.e. give some sort of group as in if a resource of type R is used then only resources after type R can be used given a certain ordering.
- **Actual Deadlock**
	- Realized when the circular wait condition is fulfilled besides the other ones.
- **Joint progress diagram**
	- Defines sections where resources are required by both processes and the execution path which can provide alternatives to execution to avoid deadlock
		- General example case is with the following process examples. P{GetA, GetB, RelA, RelB} & Q{GetB, GetA, RelB, RelA}
		- Overlaps mean a state where one of the two processes are blocked until one is executed
	- No Deadlock Example
		- Change P to get and release at the same time
		- P{GetA, RelA, GetB, RelB}
- **Dealing with Deadlock**: Approaches for dealing with deadlock. ***Read the table below if revising***
	- Deadlock Prevention Strategy
		- Indirectly by blocking the first 3 conditions of deadlock. (Hold&Wait, No Preemption, Mutual Exclusion)
		- Directly by ensuring a circular wait can not happen
		- Deadlock Condition Prevention
	- Deadlock Avoidance
		- Resource Allocation Denial aka Banker's Algorithm
			- **Definition**: Do not grant an increment resource request to a process if it might lead to a deadlock
			- **State** of the system reflects the current allocation of resources to the process
				- **Safe State**: At least one sequence of resource allocation to process(es) that does not result in a deadlock
					- Claim matrix => Resources required
					- Allocation matrix => Resrouces provided
					- C-A => Need Matrix => Resources needed to finish execution
					- Resource vector => total num of available resources in the OS
					- Available Vector = > Allocation matrix(ColSum[i] - ResourceVector[i])
				- **Unsafe State**: Opposite of the above
					- How to determine an unsafe state
			- **Advantageous** as it is less restrictive than deadlock prevention and it is not necessary to preempt and rollback processes as done in deadlock detection
			- **Restrictive** as Max Resource Requirements must be specified in advance. Processes can not have any sync requirements and be fully independent. Fixed number of resources to allocate. No process can exit while holding resources
		- Process Initiation Denial
			- **Definition**: Do not start a process if its demands might lead to a deadlock
	- Deadlock Detection
		- **Definition**: Check for deadlock(circular wait) each time a resource is requested depending on how it is likely for a deadlock to occur.
		- **Detection Algorithm**
		- **Recovery Strategy**
			- Abort all deadlocked processes (Preempt)
			- Backup each deadlocked process to some previously defined checkpoint and restart all processes (RollBack & Restart)
			- Do strat 1 successively i.e. one by one until deadlock is gone, check for deadlock again
			- Do start 2 successively i.e. one by one until deadlock is gone, check for deadlock again
		- **Advantageous** as it leads to early detection, the algo is pretty simple
		- **Disadvantageous** as frequent checks can consume processor time

**Deadlock Detection, Prevention, Avoidance Summary**

| **Approach**   | **Resource Allocation Policy**                 | **Different Schemes**                                                     | **Advantages**                                                                                                                                                                                                                                                 | **Disadvantages**                                                                                                                                                                |
| -------------- | ---------------------------------------------- | ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Detection**  | Very liberal, resources granted where possible | Invoke periodically to test for deadlock                                  | Never Delays Process Initiation, Facilitates online handling                                                                                                                                                                                                   | Inherent Preemption losses                                                                                                                                                       |
| **Prevention** | Conservative, Undercommits resources           | 1) Requesting all resources at once. 2) Preemption. 3) Resource Ordering. | 1) No preemption necessary as it works well for processes that perform a single burst of activity. 2) Convenient for resources that can have their states saved/restored easily. 3) No run-time computation needed as checked are enforced during compile-time | 1) Future resource requirements must be known by **processes** which delays process initation. 2) Preempts more often than necessary. 3) Disallows incremental resource requests |
| **Avoidance**  | Midway of both Detection & Prevention          | Manipulate to find at least one safe path                                 | No preemption needed                                                                                                                                                                                                                                           | 1) Future resource requirements must be known by **OS**. Processes might be blocked for long periods.                                                                            |

**Dining Philosophers Problem**
- Solutions
	- Semaphores
		- First sol: Grab both forks and start eating. Invalid if all 5 of these idiotas sit at the table
		- Second sol: Make sure only 4 can sit at one time therefore at least one can have both forks and eat their full. Essentially using two sets of semaphores. One for forks and another for the room. If it is occupied by 4 people then the 5th one waits until they can have a seat
	- Monitor
		- Essentially a waiter who only lets people eat if the forks are available.
		- Getting and releasing forks is now done by requesting the waiter. who can say yes or no to their request
		- If one person cannot get both forks, they have to wait until both are free
		- They pick one side first before the other.




**UNIX Concurrency Mechanisms**
- **Pipes**: FIFO Queues, Circular, Named/Unnamed
- **Messages**: Block of Bytes. MSGSND/MSGRCV syscalls, functions like a mailbox for each process
- **Shared** **Memory**: IPC, common block of virtual memory, O_READ or O_RDWR only, Mutex must be provided by the processes using shared memory, not by the OS
- **Binary Semaphores**: No other process may use the semaphore until all operations have completed. Semaphore{SemID, lastPID, NumOfProcWaiting>CurValue, isNumOfProcWaitingZero}
- **Signals**: Non-priority software interrupt, delivered by updating field in process table. Process may respond by a default action, executing a handler function or ignoring the signal

| Signal | Name                  | Description                                |
|--------|-----------------------|--------------------------------------------|
|   1    | SIGHUP                | Hang Up - Terminal line hang-up or process group exit |
|   2    | SIGINT                | Interrupt - Interrupt from keyboard (Ctrl+C)           |
|   3    | SIGQUIT               | Quit - Quit from keyboard (Ctrl+\)                |
|   4    | SIGILL                | Illegal Instruction - Illegal instruction detected               |
|   5    | SIGTRAP               | Trace Trap - Trace/breakpoint trap                      |
|   6    | SIGIOT               | IOT Instruction                       |
|   7    | SIGEMT                | EMT Instruction      |
|   8    | SIGFPE                | Floating-Point Error - Erroneous arithmetic operation             |
|   9    | SIGKILL               | Kill - Forced termination                         |
|  10    | SIGBUS               | Bus error                      |
|  11    | SIGSEGV               | Segmentation Fault - Invalid memory reference                   |
|  12    | SIGSYS               | Bad arg to syscall                      |
|  13    | SIGPIPE               | Broken Pipe - Write to a pipe with no readers            |
|  14    | SIGALRM               | Alarm Clock - Timer expired                              |
|  15    | SIGTERM               | Termination - Termination request                        |
|  16    | SIGUSR1               | User defined signal 1       |
|  17    | SIGUSR2               | User defined signal 2                   |
|  18    | SIGCHILD               | Death of child                           |
|  19    | SIGPWR               | Power Failure                |


**LINUX Kernel Concurrency Mechanisms**
Adds onto UNIX concurrency
- **Atomic Operations**:
	- Execute without interruptions/interference.
	- Integer/Bitmap Operations.
	- Integers are used for counters, operate on integer variable. Bitmap operate on one sequence of bits indicated by a pointer variable.
	- IntegerFunctions{Read, Set, Add, Sub, Inc, Dec, Sub&Test, AddNeg, Dec&Test, Inc&Test}.
	- BitmapFunctions{Set, Clear, Change, Test&Set, Test&Clear, Test&Change, Test(Get)}
- **Spinlocks**:
	- Used in short wait time situations for threads. Only one at a time. Others keep trying until they get lock.
	- Built on an integer location in memory that each thread checks before entering a critical section
	- Locked-out threads continue to execute in busy-waiting mode
- **Kernel Semaphores**
	- Binary, Counting & Reader-Writer kernel Semaphores
	- Implemented as functions in kernel
	- Interface provided same as in UNIX SRV4
- **Barriers**
	- Enforce the order in which instructions are executed.
	- Enforces a group of threads to wait until all have completed their execution
- **Solaris Thread Synchronization Primitives**
- **Mutex locks**
	- Thread locks a resource, must be the one to unlock it too
	- Goes hand in hand with spin locks
	- Interrupt based mechanisms are optional
- **Counting Semaphores**
	- sema_p() => Decrement + Block
	- sema_v() => Increment + Unblock
	- sema_tryp() => Decrement if blocking not required
- **Multiple readers, single writer locks**
	- Lock protected objects can be read from simultaneously
	- Acquire Write Lock to write to object. Spinlock until lock acquired
- **Condition variables**
	- Used in conjunction with mutexes, wait until condition is true to execute

| Concurrency Method | Data Structure in octets    |
| ------------------ | --- |
| MUTEX              | Owner(3), Lock(1), Waiters(2), TypeSpecificInfo(4)    |
| Semaphore          | Type(1), WLock(1), Waiters(2), Count(4)    |
| Reader/Writer Lock | Type(1), WLock(1), Waiters(2), Union(4), Thread Owner(4)    |
| Condition Variable | Waiters(2)    |

**Windows 7 Concurrency Mechanisms**
- **Wait functions**
	- Allow thread to block its own execution
	- Do not return until the specified criteria has been met
		- Type of wait function determines the set of criteria used
- **Critical Sections**
	- For uniprocessors, only threads from a single process can use the CS
	- For multiprocessors, a spinlock is accquired. If not available a dispatcher is used to block the thread until another thread is dispatched by the kernel (Switching modes i believe)
- **Slim Read-Writer Locks** (SRW Locks)
	- Enters kernel to block only after spinlock fails
	- Only requires allocation of a single pointer
- **Condition Variables**
	- Init a CONDITION_VAIRABLE
	- Used in Critical Sections or SRW locks
		- Acquire exclusive lock
		- while(condition is false) run
- **Lock-Free Synchronization**
	- Interlocked operations use hardware to guarantee that memory locations can be read/modified/written in a single atomic operation.
	- No software lock needed, thread never switched away from processor while holding lock

**Windows Synchronization Objects**

| Object Type | Definition | Set to signaled state when | Effect on Waiting Threads |
| ---- | ---- | ---- | ---- |
| **Notification Event** | System event occured | Thread sets event | All released |
| **Synchronization Event** | Same as above | Same as above | One thread released |
| **MUTEX** | Provides MUTEX, equiv to a binary semaphore | Owning thread releases mutex | Same as above |
| **Semaphore** | NumOfThreads counter that can use a resource | Semaphore count drops to 0 | All released |
| **Waitable Timer** | Time counter | Set time arrives or interval expires | Same as above |
| File | Instance of opened file/IODevice | I/O completes | Same as above |
| Process | Program invocation containing the address space + resources need to execute | Last thread terminates | Same as above |
| Thread | Executable entity within a process | Thread terminates | Same as above |

# 5. Concurrency: Mutual Exclusion & Synchronization
1. OS > manages processes and threads
	1. Multiprogramming
	2. Multiprocessing
	3. Distributed processing
2. Context of concurrency 
	1. Multiple applications >> allow processing time to be shared among active applications 
	2. Structured applications >> extension of modular design and structured programming 
	3. OS structure >> OS implement as set of process/threads 

3. Concurrency terms 
	1. Atomic operation >> function implemented as sequence of one or more instructions. Either all instructions are done or none, guarantees isolation
	2. Critical section >> code within process that requires access to shared resources and should not be executed if another process is in that section of code 
	3. Deadlock >>  two or more processes unable to proceed because each is waiting for one of other to do something
	4. Livelock >> two or more processes continuously change their states in response to change in other process/es without doing any work
	5. Mutual exclusion >> req. one process in critical section that accesses shared resources, no other process should access those shared resources 
	6. Race condition >> multiple threads/processes read/write shared data item and final result >> relative timing of execution
	7. Starvation >> runnable process is overlooked by scheduler, not chosen
4. Principle of concurrency 
5. Interleaving and overlapping
	1. Example of concurrent processing
	2. Presents same problems
6. Uniprocessor - relative speed of execution of processes cannot be predicted 
	1. Depends on activities of other processes
	2. OS handles interrupt 
	3. Scheduling policies of OS 
7. Difficulties of concurrency 
	1. Sharing of global resource
	2. Difficult for OS to manage >> allocation of resource
	3. Difficult to locate errors in programming >> results not deterministic and reproducible 
8. Race condition 
	1. Multiple processes or threads read/write data items 
	2. Final result >> order of execution
	3. Loser of race >> process that updates last and will determine final value of variable 
9. OS concerns for design of concurrency// OS MUST
	1. Keep track of processes
	2. Allocate and deallocate resources for each active process 
	3. Protect data and physical resources of each process / no interference 
	4. Processes and outputs are independent of processing speed 


![](https://lh7-us.googleusercontent.com/cBOxeIkYItPtjM-e-cDkDMuULQauXQfwiVqXuejeJD4k4-1z02xbhTO--DthetkQsgeIYKdcR1wcG8voH5u2SpBfQEYUwWnjXown6r-o39pUAh8KiLhQUz53Q3VH7zlbNgKR-sJ5MtPQKfXf)

8. Resource competition >> concurrent process come in conflict when competing for same resource for example I/O device, memory, processor time, clock etc
9. Can cause deadlock, starvation, need for mutual exclusion

Mutual Exclusion

![](https://lh7-us.googleusercontent.com/Jyc7tVfRhZ9m1LlpP7NRlBNyS0gMbUaOax-ZljJdV_rJreNb2tMJ_uc4pMiSpRm08zsYfM9QEbiSppubI8_0sz_3gsBtMM0Q1EdbgJN5fH7_0eHldFIhc4E6PCaNS29eOcPx8lGfbC_RIhKQ)

1. Requirements of mutual exclusion 
	1. Enforced 
	2. Process that halts must do so w/o interfering w other process
	3. No deadlock or starvation 
	4. Process >> no denied access to critical section when no other process is using it 
	5. No assumptions made about relative process speeds or number of processes 
	6. Process remains inside critical section for finite time only 


1. Interrupt disabling
	1. Uniprocessor system
	2. Disabling interrupts guarantees mutual exclusion 
2. Disadvantages 
	1. Efficiency of execution could be degraded 
	2. Will not work for multiprocessor 
3. Solution types
	1. Software based solutions
	2. Hardware based solutions 
	3. OS based solution 
4. Hardware support 
	1. Uniprocessor system >> concurrent process cannot overlap 
	2. Process execution >> process runs continuously until it invokes OS service or is interrupted 
	3. Temporary disabling interrupts during critical sections 
	4. Prevents interference from other processes 
	5. Special machine instruction >> atomic 
5. Compare and swap or compare and exchange instruction
	1. Compare b/w memory value and test value
	2. If values are same, swap
	3. Carried out atomically 


![](https://lh7-us.googleusercontent.com/3QeAaZ8S_r6QgNtA_iRwqujabtrf-tMx0VFVNogYnVJFtTJ2D53Okgtq-gooxwPwng7-p04i8vP34H4fBaTUqAEJP79zOT2_81LKT_FH7rWlCf7h7a1eIHFFOMSQUZHPgvQB5X9l46MmSVek)

![](https://lh7-us.googleusercontent.com/pJdwDS92dmp7A4CNDCbDCGjIo5UfvnNJVLeAGgjTGybdW6SaC1OSEqaSY1zcst4LgVhig5uFvTsVhjQVH8ebmib5yLUuc9jS_P-kHYY4yV6CNV9FcbrYONkr46K_zElrmmSJi6AGsc1RvuqS)

![](https://lh7-us.googleusercontent.com/8q6nLI0N9gMdv5QN6woylgjpJNb1rXhtdYGCcjVjmhXy5qcl2Ho-OYCpifHK3vmEu4VFxM4kErg0YjD00Nz8XBTGDF3-O7P0RGkj3U7JL98KR2FePJqhjqkjuA34I6PF3TBv-vzJl1qIOAMr)

![](https://lh7-us.googleusercontent.com/pF5-9Yxpf7AqUZsXmioJvq07e4C9lSZPUr_iotxolrdEH5CzPtL0q8OgNg-GZIs2w9wC5v0ukYESlzQl4bNY_zD-ELBOqF8ju5ezdI23Kzip6L-kMHUPFcQOVK3WmplW8oVREd4lKBY7-Oli)

![](https://lh7-us.googleusercontent.com/wgwyK6jaKJnHLJ6MNWuFXWX8bJjwzLrSDiRgn7ryOItWyp92xIjqb2f5_Oz840ep2vZc1achsChnqRnWM9xLamUKp9XXjgOnvDNgXSSFviOi6pbf9-siKF6QngM_wYKimq3ptjQhn3_NJIil)

5. Advantages 
	1. Applicable to any number of processes on single or multiple processors sharing main memory
	2. Simple and easy to verify
	3. Supports multiple critical sections, each is defined by own variable 
6. Disadvantages
	1. Busy-waiting is employed, takes processor time even if its waiting to access critical section
	2. Starvation is possible when process leaves critical section and more than 1 process is waiting
	3. Deadlock is possible 


![](https://lh7-us.googleusercontent.com/qfYa7e-VMIMB3i77AjLasyaEor8qfBnKZTC0WC2u5Dq2zDH-L4NwsMtX0ZOKCpMY1bhfGGljwdoclyau8yjX3IIGnWalpMTEOXECmFmhiYxDivq-523duyBphNi-_7gG5EIrxFpSopx0RIQa)

Semaphore 
1. Variable that has integer value, three operations defined 
2. Cannot manipulate/inspect semaphores 

1. May be initialized to non negative int value
	2. Semwait operations decrements value 
	3. Semsignal operations increments value

3. Consequences 
	1. No way to know beforehand if process decrements semaphore will it block or no
	2. No way to know beforehand which process will continue on uniprocessor system when two system are running concurrently 
	3. Don't know if process is waiting so number of unblocked processes may be zero or one 


![](https://lh7-us.googleusercontent.com/p6ulm8ucsFop_XJ1i6rZCClBmayzl3Z1yveE6lSDL7KeUyyVMX5dT5CzxWK1qo_NrcPykdQsC9IfX8BKy4CoQc-AJtI32s6NRzmQegattfjuyvCTkaKNxM-GaMm-eede1ilcJH8EpYr2t2Et)

![](https://lh7-us.googleusercontent.com/yny4Hk1EN3cNXHy00ZWkgoMOhNNMQjBcMa-_dSTvAo3D3zr4lc61unSWFSn6xD5kxQX4YFqcPTGJRFNUXQMP2nv8j9_L9qnkxIBdxYzGUD60N783qbWs51TMjpkfPQy9FKBgM_ax-2FqlAKm)

4. Queue >> holds processes waiting on semaphore 
5. Strong semaphore >> process that's blocked the longest is released from queue first 
6. Weak semaphore >> order in which processes are removed from queue not specified 


![](https://lh7-us.googleusercontent.com/gFiOXYdJ_g2p5LBtgfH4XAiMH9rEsdvRpdaQ7WriVEqiy16sXjbBG7Tg1sMNIdtx_MhcwggDIL4E9kjkaEFI1-G1b4-dXoQsHs874J46DVPjFqieEnD53djkdVp9OyI3q4ZJ58XXQgw607ar)

![](https://lh7-us.googleusercontent.com/yOiGShLwDwbDYadCtDiFsZolVC4CWSMFDzjVoqXkaV0U-14ZURx-pK-Nykk1-aNgsGq9ZTp63yR2uz0-4IUW4yk2lwKL9KCYZk6P-EOpTa4Fisj1LCGG68aY8ppDmMwV4lG3bqeDjT9LddvA)



![](https://lh7-us.googleusercontent.com/mOJeAfzud0lH14tcVJK1yDOtmfeenn9VQhpBdFyE2ylMfHlKq88lGm9P3HniYw5ujHlyxx25jqPA6PQ1w-LCmhRQNe_xbB_8orLTFAl8fL28kUUK5GySk1raVM6sPZZPOWNJ_R36OW2rcN1o)



### 7. Producer/Consumer Problem

1. **General Situation**
   - One or more producers generate data and place it in a buffer.
   - A single consumer takes items out of the buffer one at a time.
   - Only one producer or consumer may access the buffer at any given time.

2. **Problem**
   - Ensure that the producer cannot add data to a full buffer.
   - Ensure that the consumer cannot remove data from an empty buffer.



Incorrect solution 

![](https://lh7-us.googleusercontent.com/NdoVBiAB0LULEjMPMLzmkLbDcQP3B_wE3HGg23qUeN4MEfB6Snk3drNZQNj8vTJHwtry-XQBp6_QkRUQzuIKMtnHuVceKF_-ZHZ8RcMvxb-RL00CAmYRkJ3TwkESBMiTU9G11XkwvFCV_uBD) 

Possible solution

![](https://lh7-us.googleusercontent.com/Zl_VRghqDUO7hkOtSFy1LikqMSfGjOLs4pbUixz9RqkPl83VwGIQACrXV0TBwmMdvkleVfZvikU-OyNDJCoLpPeiatJiP5ntsuezRAQpe0dq5iJE7o7XEQzFgqJx8WzrslakoJ-uGr-R2bGA)

Correct solution

![](https://lh7-us.googleusercontent.com/isWeahLZ_49ETG5PHQAY7j9Xgdt6jtDYkKNxf07q0EHQSxU-WB7sdLH65QOIRSn_kZD07Wbk_-CjRxHEIvHvmvNbBsiEM1ulvvHVopVSUpOtV43VsDsMQRTrFBUbFhRmkUUQFBy8K1bMVmw_)

Solution using semaphore

![](https://lh7-us.googleusercontent.com/pq-8kftTgpFpa6xAtq7_wCRj_NgDer_ajNy2Yi2lqRMOG0LYlMU37v0VnNGBTbc9u3jelKxAXf_BcRJy1b-GjNjyb0a9cQWciqEYQVgNonS4MnZo3l8SdUBDaJbUl6D7SdpDzO6_dn1KCyPG)

![](https://lh7-us.googleusercontent.com/tbe3-KY9Rujx3Rt6QgJhHYh56wd6fAahBOWUTbNJ6RvGYUGznHv0tbyHnGNnS8omJt468__UmfpU2kWuyEHSgZw3hbCKxLS5TeEjxxg7hj5NRluPvjbnN4IQ5gkErg7kP2L2UFb1_qaWw0Iw)

![](https://lh7-us.googleusercontent.com/qOPAGGF_TXUbrBpRZiVe7CtYW2OXpz-jNAP-m46S82FB7_Cs8Gc6IS86QYF-tl3N9WVRVox-pGWBXIrPtHfjB67okXtgckovi_zHyxvPd0tgmb5zffPKDFVYUlITT-dwM-snUgwjbqduFBP0)

### 1. Implementation of Semaphores

1. **Semwait and Semsignal as Atomic Primitives**
   - Used for implementing semaphores.
   - These are fundamental operations that must be executed atomically.

2. **Implementation as Hardware or Firmware**
   - Semaphores can be implemented at the hardware or firmware level.
   - This involves utilizing low-level mechanisms provided by the underlying system.

3. **Dekker’s or Peterson’s Algorithms**
   - Common algorithms for achieving mutual exclusion.
   - These algorithms are designed to prevent multiple processes from entering a critical section simultaneously.

4. **Hardware-Supported Schemes for Mutual Exclusion**
   - Semaphores often leverage hardware-supported schemes to enhance efficiency.
   - These schemes contribute to achieving mutual exclusion effectively in a concurrent computing environment.


![](https://lh7-us.googleusercontent.com/OnUDg4f4_6zq3wTldWsD2Wwu31CvyOAqVzzf4af6Fro9oGsr6r6uls1bRhe-Vhfv76CpkV2jCpr0-X2gTDcx3bZofpY_dHEn96dfMdGYcOAl999FLO5QNKC17MoEiI8_XnVq-6eyP1jb53l_)
### 2. Message Passing

1. **Process Interaction Requirements**
   - Synchronization for mutual exclusion.
   - Communication for exchanging information.

2. **Approach Providing Both Functions**
   - Works with distributed systems, shared memory multiprocessors, and uniprocessor systems.

3. **Actual System Implementation**
   - Provided in the form of a pair of operations:
     1. `Send(destination, message)`
     2. `Receive(source, message)`

4. **How It Works**
   - A process sends information in the form of a message to another process designated by the destination.
   - A process receives information by executing the receive operation, indicating the source and the message.


![](https://lh7-us.googleusercontent.com/0GxXDz-PymvBbah5dy346-ilX2D04qz5p2Pm-MN6hXSI73QxJSz9Bdcs_zVm5O221ObwFTdNa2bzYvqZH61pEnpcL_c1Z8hCw4dod6VdlEa-YZ3j5v5pz7pEIGEeIHH-kV7tmBRFJ4gHtkwm)




### Synchronization
1. **Communication between two processes = synchronization**
   - Receiver cannot receive unless it's been sent by another process.
2. **Upon receive operation, two can happen**
   - No waiting message: Process is blocked until the message arrives, or process continues to execute, abandoning the attempt to receive.
   - If the message has previously been sent, the message is received, and execution continues.

### Blocking Send, Blocking Receive
1. **Sender and receiver blocked**
   - Message delivered until rendezvous.
   - Allows tight synchronization between processes.

### Non-blocking Send, Blocking Receive
1. **Sender continuous, but receiver is blocked until the required message arrives**
   - Useful combination.
   - Sends one or more messages to a variety of destinations as soon as possible.
   - Example: A service process that provides service or resources to other processes.

### Non-blocking Send, Non-blocking Receive
1. **Neither party will wait**

### Addressing
1. **Processes in send and receive operations have two types**
   - **Direct addressing**
     - Send operation: Identifier of the destination process.
     - Receive operation: Two ways
       - Process designates the sending process (concurrent processes).
       - Implicit addressing: The source parameter of the receive operation has a value returned when the receive operation is called.

   - **Indirect addressing**
     - Messages are sent to data structures (queues) that temporarily hold messages.
     - Queues: Mailboxes.
     - One process sends a message to the mailbox, and another process picks up the message from the mailbox.
     - Allows greater flexibility in the use of messages.

![](https://lh7-us.googleusercontent.com/P1nbD_PGNqjAN2mhUDEm6WonC4mznT2Akfxc2HK2PNn5pCmwiEcjb1CubXgitX7e3uEbciU_eDUbQFPwYdShCIS07uY0e07Tj83j9EzkL5IVrDkYpdsaVKNbsUIbj4FA9fFsBHp00iNpaIs_)

![](https://lh7-us.googleusercontent.com/yGccmQaXFJCUogKEMunB8Tyk9y8nexZKycL7nREXxPQH3akZ1klibk2hS3nlm-6ATBttey0MSXlPcSilpChCHTuCyq9xQP7iCgiyYJQJSLXl1RQgm5J_W81718YxYkCqehk-KPYJT1J4u5qH)

![](https://lh7-us.googleusercontent.com/ol102LeOdIqw0m1PJDUAEeDn1Cb_CRxY0rDKAIjDedlK0yGpnZgZyPlQLd3Q8cwi5bQH0K8PGxerSWCsFm22y7_2mG9G7f3dBhjjXAfHHlNmrDK8VyRevfrYaXWHDlLTTvfou0_tVPABamEI)

![](https://lh7-us.googleusercontent.com/b00B2ooE6LF-VIzP_v_EllB04CyUbb_Trn0nEzylK0ex1_V_w-mE4594Ozpo3NJBO5mxmJF85jyFp4DHwFkB6Wo8Xga-XVKNP-Y6QWwJ3R92KC1PdJDF9jIHp5D24fyNCAvJ2-d-f1VId_MQ)




# 4. Threads
**Processes and Threads**
Process includes a virtual address space to hold process image, follows an execution path that may be interleaved with other processes

Unit of dispatching is known as a thread or lightweight process
Uni of resource ownership is known as process or task


- Multithreading
	- Ability of the OS to support multiple, concurrent paths of execution within a single process
	- Various forms
		- Single process Single Thread
		- Single process Multiple Thread
		- Multiple process Single Thread
		- Multiple process Multi Thread
- Thread Functionality
	- Has the same PCB as process
	- Its own user address space, userstack and kernelstack
	- Benefits
		- Less time to create/terminate than a process
		- Less time to switch thread to thread.
		- Better communication b/w programs
	- Use in single user system
		- Fore/Background work
		- Async processing
		- Modular program structure
	- States
		- Running
		- Ready
		- Blocked
	- Operations
		- Spawn
		- Block/Unblock
		- Finish

**Types of Threads**

| Characteristic                | User-Level Threads (ULTs)                           | Kernel-Level Threads (KLTs)                            |
|-------------------------------|-----------------------------------------------------|--------------------------------------------------------|
| **Creation and Management**   | Managed entirely by user-level libraries or runtime | Managed by the operating system kernel                   |
| **Concurrency Model**         | Many-to-One: Multiple user-level threads mapped to a single kernel-level thread | One-to-One: Each user-level thread corresponds to a distinct kernel-level thread |
| **Overhead**                  | Lower overhead as thread operations are handled at the user level without kernel involvement | Higher overhead due to frequent interaction with the kernel for thread operations |
| **Scheduling Control**        | Application specific | Greater control over scheduling and execution policies due to kernel involvement |
| **Portability**               | More portable as they are implemented using user-level libraries, making them independent of the underlying kernel | Less portable, as differences in kernel implementations may affect thread behavior |
| **Scalability**               | Better scalability on systems with a large number of threads, as the system can optimize user-level threads without kernel intervention | Scalability depends on the efficiency of the kernel's thread management capabilities |
| **Blocking System Calls**     | A single blocking system call blocks all user-level threads, as they share the same kernel-level thread. Cannot take advantage of multiprocessing | One thread blocking does not affect other threads, as they have their own kernel-level threads |
| **Example Implementations**   | POSIX threads (pthread) library in user space        | Windows threads (Win32 threads) or pthreads with kernel-level threads |
| **Context Switching**         | Faster context switching  | Slower context switching  |

**Multicore and Multithreading**
- Performance of software on multicore

**Windows process/thread management**
- Management of background tasks and application lifecycles
- Windows processes
- Process/Thread Objects
- Multithreading
- Thread States
- Support for OS subsystems


![](/Pasted%20image%2020240103224745.png)
![](/Pasted%20image%2020240103224806.png)

**Solaris Thread & SMP Management**
- Multithreaded architecture
- Motivation
- Process Structure
- Thread Execution
- Interrupts as Threads

![](/Pasted%20image%2020240103224830.png)
![](/Pasted%20image%2020240103224849.png)

**Linux process/thread management**
- Tasks/Threads/Namespaces

![](/Pasted%20image%2020240103224911.png)

**Android process/thread management**
- Android applications
- Activities
- Process and threads


![](/Pasted%20image%2020240103224938.png)

**MAC OS Grand Central Dispatch**



---
# Duplicate Notes for CH4 Threads
1. Resource ownership >> process has virtual address space to hold process image


1. OS has function preventing interference b/w resource and process 


2. scheduling /execution 


1. Execution path, mixing with other processes 

2. States >> running, ready etc

3. Dispatching priority 


3. Unit of dispatching >> thread 

4. Unit of resource ownership >> process or task

5. Multithreading >> OS supports multiple concurrent paths of execution within a single process

6. Single threaded approach 


1. Single thread per process for example MS-DOS 


7. Multithreaded approach 


1. Multiple threads per process for example Java run-time environment 


8. Process


1. Commonly in multithreaded environment 

2. Unit of resource allocation and protection

3. Has virtual address space >> process image 

4. Protected access to


1. Processors

2. processes (inter communication) 

3. Files

4. I/O resources >> devices and channels


9. Thread components 


1. Each thread has


1. Execution state >> ready, running etc

2. Saved thread context (when not running)

3. Execution stack

4. Per-thread static storage for local variables 

5. Access to memory + resources of its process shared with all other threads in that process 


![](https://lh7-us.googleusercontent.com/imF8MEO0FwR4AnJxTAeyiV5o4ZXcTjVy0LrYy6ZmGyqbJ7ELzeXEIbmkS7b6cBw04PvTyhPBwZEp9KHAzAg8pjpDlhckKjA2x-Jl4wiy8n90WkyH7vMsm1gQNFJSy_0L7HoFxUKx8rCx0fALp0vJ-Cs)



10. Benefits of thread


1. Less time for thread than process in creation

2. Same with termination ^

3. Same with switching b/w threads

4. Enhance efficiency in communication b/w programs


11. Threads use >> single user system 


1. Multitasking

2. Faster execution 

3. Modular program structure for better code organization

4. Asynchronous processing >> different tasks operate independently















12. Thread states


1. OS with threads >> scheduling and dispatching 

2. Information of execution >> thread level data structures


1. Suspending process >> suspending all of its threads // temporary halt

2. Termination of process >> terminates all of its threads 


3. Key states of thread


1. Running

2. Ready

3. Blocked 


4. Thread operations with change in thread


1. Spawn

2. Block

3. Unblock

4. Finish 


![](https://lh7-us.googleusercontent.com/YaUwZhFJHWXAt-6ddZjO4ZEWxE8maRZwwm0F6ipQU-mqGqGTX_CK-I_DYFhBx4kSB5b7Ow0eFe-7QiH1WYkVrvIvyA9HHlFYPjOKv_Njxse6ObdmvqVYcfnYQSQZp7N_ifuEDmTy0MazVDis1_6YriU)

![](https://lh7-us.googleusercontent.com/694QPn60nMT8Elv9YysnL0yf5oqQoQ6FUIoZAvLukZZ_QqgAD2mRSLBqpxSZIjJmI6DwqslpMGbptz6aXqrGAXT_8XHX1mr3SnsYH3FhE0gIzChYRVruX2gGeEmimttx39JxpSiJVNfIXk5tcX1Q0zY)



13.  Thread synchronization


1. Synchronize activities in various threads 

2. All threads of process >> same virtual address space and resources

3. Alteration of resource by thread affects other threads 


14. Types of threads


1. User level thread (ULT)

2. Kernel level Thread (KLT)


15. User level thread (ULT)


1. Thread management >> application

2. Kernel not aware of existence of threads 

3. Advantages 


1. Thread switching != kernel mode privileges

2. Scheduling >> application specific

3. ULTs can run on any OS 


4. Disadvantages 


1. When ULT executes system call >> all of threads of that process are blocked


1. Jacketing >> converts a blocking system call to non blocking system call


2. Multithreaded applications can’t benefit from multiprocessing since kernel assigns one process to one processor thus 1 process = 1 thread 


1. Application has multiple processes rather than multiple threads but this eliminates main purpose of threads 




![](https://lh7-us.googleusercontent.com/t69QVKtA9yXcbNDIs2zQvt3mMcz9YvORFqX8Ct1bPQI7O7keN-KBvI-GRVgZcMHr-VTcg6TAc87Pqr_mRjxoM0yaxeK7dQ2JwVOVDfn_QeKVldglFfjN9tj46X43q0mkVgixefIkyCtruBpvX61ouAg)



16.  Kernel level threads (KLT)


1. Thread management >> kernel 

2. No thread management code in application 


1. Application programming interface (API) to kernel thread facility


3. Example: Windows 

4. Advantages 


1. Multiple threads >> same process >> multiple processors 

2. If one thread is blocked, kernel can schedule another thread of same process

3. Kernel routine itself can be multithreaded 


5. Disadvantages 


1. Transfer of control from 1 thread to another requires change of mode in kernel 


![](https://lh7-us.googleusercontent.com/Go05eCb82Nc_6hKNobK-D8EdcHxIqp2s2f03pL95s3VvqhJmEjwhOOqjSe9q7wpYUGHPZ_xvrsQI-ECkTnTbWAifbsGT-2gOCbNzjdmh8eEYOC0Y5_BM09SLhXLXx4jhblo6_GpyZRGv_8v-It42ZPQ)



17. ULT X KLT


1. Combined approach 

2. Thread creation + scheduling + synchronization of threads >> user by application 

3. For example: Solaris 


![](https://lh7-us.googleusercontent.com/h3Jn_zE5ycxJqDHSjEeK5ExU3PBodbusIT2MQYyOJsgV29LH8ZJgFVW9NURObYJmIW_oN6CUBxObCZPy_DSw8Q1DxB1H3HnT6sruOk3LapSDES2YPqPBomVgnRPrB1F-NyLY0OxzBNGoB13YSVhVWJE)

![](https://lh7-us.googleusercontent.com/r_xwkdPtk7z457sYdIVZdZmbswN-CTux4lqc-9Zqp9fHt3Ccd4nRZRZWCnsP4SryPwo1UvJjpGBs0M7x6_4ie7m86wG_noA0mA5F8tsjf6KrPHrt9tbE2Yl_4VOPMYUatsOXPH_qGieySY664g_AS7k)

18.  Number of processors and relative speedup in terms of speedup with overheads and sequential portions (multicore) >> more parallel, the better 






19. Applications that benefit


1. Multithreaded native application s>> small number of highly threaded processes

2. Multiprocess application >> many single threaded processes 

3. Java applications 

4. Multi-instance applications >> multiple instances of application in parallel 


20. Windows process and threat management 


1. Application >> one or more processes

2. Each process >> resources 

3. Thread >> entity within process that can be scheduled 

4. Job object >> group fo process to be managed as unit

5. Thread pool >> collection of worker threads that executive asynchronous callbacks on behalf of application, scheduled independently

6. Fiber >> unit of execution, manually scheduled by application 

7. User mode scheduling (UMS) >> lightweight >> applications use to schedule threads 


21. Management of background tasks and application lifecycle 


1. Windows 8 => windows 10; developers manage state of application

2. Old version >> user full control of lifetime process

3. New metro interface >> process lifecycle of application 


1. Limited number of applications can run with main app in metro UI 

2. Only one store application can run at one time


4. Live tiles >> appearance that applications constantly are running 


1. In reality, notifs are pushed and system’s resources are not used to display content


22. Metro interface 
1. Current active (foreground) application >> access to all processor, network and disk resources 
	1. Other apps are suspended and no access to resources
2. When app > suspended > event should be triggered to store the data of user’s info 
	1. Responsibility of application developer 
3. Windows may terminate bg app 
	1. App’s state should be saved to restore if it suspends 
	2. When app returns > foreground, an event should be triggered to obtain user state from memory 
4. Windows Process important characteristics 
	1. Implemented as objects
	2. Process can be created as new process or copy of existing process
	3. Executable process may have 1 or more threads
	4. Both process and thread objects > built in synchronization




Process and thread objects 

1. Windows make use of two types of process related object
	1. Processes >> entity doing user job or application that has resources
	2. Threads >> a sequential and interruptible unit of work 
2. Process object attributes
	1. Process id 
	2. Security descriptor >> access control 
	3. Base priority >> baseline execution priority 
	4. Default processor affinity >> default processors where process’ threads will run
	5. Quota limits >> max amount of
		1. Page and non paged memory
		2. Paging file space
		3. Processor time a user’s processes use 
	6. Execution time >> time where all threads have executed 
	7. I/O counters >> record number and type of virtual memory 
	8. Exception/debugging ports >> interprocess communication channels 
	9. Exit status 


![](https://lh7-us.googleusercontent.com/jvW_Y3PpwWetV30oAxGSmecWNQNoc8xPLbIjf9oVeNfFpLwwrkMyXDMK6QLZUZcx7tKhAi4wZU7UeCkRUx_RE67HvG1uYYe67w9S7IPQkIDNnoifT7GwFcozxAGFMMuXZ2JSXr0Oi0BKk4veT47uxdU)

3. Multithreading
	1. Concurrency without overhead
	2. Tasks happen simultaneously without overhead of using multiple processes 
	3. Intra process communication
	4. Threads with same process > share and access shared resources
	5. Interprocess communication
	6. Threads in different processes exchange info thru shared memory 


![](https://lh7-us.googleusercontent.com/Pg3gVV8K497oyPt9of48E4kyraUBBdrs_0VZZoPts6iYlpY3kh3lS4OQscvqv0CnbLwRLzYVh9jlarTwMpP1Q85h17EUJhV6YzcuzDgR1uQENmf4DqDullKStCDAyHvGZcocXfttEZNoDtlGjM61zOs)



Solaris Process 
1. Four thread related concepts
1. Process >> user’s address space, stack and PCB 
2. User level threads >> user created unit of execution within process 
3. Lightweight processes >> mapping between ULT + kernel threads
4. Kernel threads >> can be schualed and dispatched to run on one of the system processors 


![](https://lh7-us.googleusercontent.com/LtrYxt9aqSo0VBt7tbcOa7CmO1BagRVoblGN99ltIuF4j9AXbV3oymqL_tFQ1Leh3Q9zF-PlEzQVgAy7vE7cUouUjWdAHLam944TBw5f293NyI9ZORlCZ99cbhLYC0-cU1jYI8g79UX03yjh-omsVhk)

![](https://lh7-us.googleusercontent.com/55TK_VAbriFxRvqyasy8eOpftZZQ8wD5AkeFOBZtbDnCPPrJ158PxiGFYhdfgJo8PzxaT1bGYgHjaR3T7esnnuRGenUn_wxfJABNYTZpDWMGu1e_5pHpX3KjfVHowhhDVdZ1hT59OLSo8J4R7PlJ3pw)

2. LWP includes 
	1. LWP identifier 
	2. Priority of LWP >> kernel thread supports it
	3. Signal mask >> tells kernel which signal will be accepted 
	4. Saved values of user-level registers 
	5. Kernel stack for LWP >> includes system call arguments, results, error codes for each call level
	6. Resource usage and profiling data
	7. Pointer to corresponding kernel thread
	8. Pointer to process structure 


![](https://lh7-us.googleusercontent.com/VlT7oduxDFhrsalVMur_RllGS2NTMiNGxShiWEcfGjBXZtSM9xr34e8kVaX96PCPsm0e4NgGm4TEOS847xgSd_GMrh02ZvCymgVGQxpu9Sg2kpG65M6C1vQ2eHpVvD6nKEoNMNWotD3f8Inhg-_JH18)


3. Interrupts as threads 
1. OS activity >> processes(threads) and interrupts 
	1. Threads / processes
2. cooperates w each other
3. Manages use of shared data by primitive enforcing mutual exclusion and synchronize execution 
4. Interrupts 
5. Synchronized 
6. Prevents handling for period of time
7. Solaris unifies these two concepts > single model > kernel threads
8. Threads scheduled +executed >> transforms interrupt to kernel threads 
9. Solaris solution
	1. Set of kernel threads > handle interrupt 
	2. Interrupt bread has own identifier, priority, context and stack
	3. Kernel controls >> access to data structures and synchronizes int threads using mutual exclusion 
	4. Int threads given priority than other types of kernel 
10. Linux tasks
	1. Process or task in linux >> task_struct 
	2. Contains info in number of categories 


![](https://lh7-us.googleusercontent.com/Ex_SUXcJfLCBfM-0QOGWgExfssf-I_bA6y-cUYddcPiE8IIAHh21wW1K8qFTk-mshvN4eFyvzsdcB_2W-28Rpw8Lpp_XXlw5DNfeHeGN8VOSvD6Pp0gYzSDs5fkaVesbwJlRBOjwjmAOOcIKVZTMZuM)






Linux threads

1. Properties 
	1. No difference b/w threads and processes 
	2. User level >> kernel level processes 
	3. New process > linux copies attributes from existing process 
	4. Processes can be cloned, sharing resources 
	5. clone() >> ensures each process has its own stack space 
2. Namespaces >> process can see system in different pov than other processes, each having own associated namespace
	1. Six namespaces 
		1. Mnt
		2. Pid
		3. Net
		4. Ipc
		5. Uts
		6. User 
3. Android process and thread management 
	1. Android application >> software implementing an app
	2. One or more instance of one or more of 4 types of application components 
		1. Activities
		2. Services
		3. Content providers
		4. Broadcast receivers 
	3. Each component >> role in application behavior 
	4. Each component > activated independently within application even by other application 


![](https://lh7-us.googleusercontent.com/o_qbDCEfpa15-O8S46Gr3yuSKLOYf0ibZXrR7_PfwcI4v6cc9loohKRpOehK4wt5ZIx3wS7pP6UlocxKKwxrx4TE2458TyvfxVGK-JRFg-0L0F8FbujZ8OCJIEavZWNbk-2NlS7vbPHeBUjQuD45SlM)

4. Activities 
	1. Provides user interaction screen
	2. Each activity >> window to draw interface 
	3. Window fills the screen // can be smaller/ float on top of other windows
	4. Application can have >> multiple activities 
	5. When app runs >> one activity in foreground interacting with user 
	6. Activities >> last in first out stack based on order of opening
	7. If user switches to 2nd activity, created and pushed on top of stack with 1st one becoming second item in stack 


![](https://lh7-us.googleusercontent.com/PJYaUu41K8vB5SWO9rywHz6eezT6Y-T0n9WhGT6lHkzejB7DnYfhyz3rOVmJztZHejij5XRzdW9l77iUUQQh3r0KmdqJAlbFG_AYmW7hbDBLDpjRJAiPEDw1UoM9uVL7s0__KnF1asAcVZDtHVDV5_U)


5. Processes and threads
	1. Presence hierarchy >> which process to kill to reclaim resources 
	2. Processes killed >> lowest precedence first 
6. Descending order of precedence are:
	1. Foreground 
	2. Visible 
	3. Service
	4. Background
	5. Empty 
8. Mac OS x Grand Central Dispatch (GCD)
	1. Pool of available threads
	2. Designers >> portion of applications >> blocks 
	3. Run independently 
	4. Run concurrently >> based on number of cores available and thread capacity of system 
9. Block 
	1. Simple extension to a language 
	2. Defines self contained unit 
	3. Programmer >> encapsulate complex functions
	4. Scheduled and dispatched by queues 
	5. Dispatched >> first in first out basis
	6. Can be associated with event source like timer, network socket, file descriptor

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

**FCFS (First-Come-First-Serve)**:

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

**Round Robin (RR)**:

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

**SPN (Shortest Process Next)**:

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

**SRT (Shortest Remaining Time)**:

- Selection Function: SRT is a preemptive version of SPN, selecting the process with the shortest remaining time to complete.
	- Calculates on arrival however
- Decision Mode: It dynamically reevaluates and selects the process with the shortest remaining time whenever a new process arrives or a running process finishes.
- Throughput: SRT aims for high throughput by always choosing the shortest remaining task.
- Response Time: Response time is generally excellent, as the shortest remaining task is immediately given priority.
- Overhead: SRT has a higher overhead due to frequent context switches.
- Effect on Processes: Short tasks are favored, and long tasks may experience some waiting but less than SPN.
- Starvation: SRT can lead to starvation for longer processes if many short tasks keep arriving frequently.

**HRRN (Highest Response Ratio Next)**:

- Selection Function: HRRN calculates the response ratio for each process and selects the one with the highest ratio. $$Ratio=\frac{timeWaiting+ expectedServiceTime}{expectedServiceTime}$$
- Decision Mode: It uses a non-preemptive approach based on response ratios.
- Throughput: HRRN aims for high throughput by considering both waiting time and estimated remaining time.
- Response Time: Response time is generally good, especially for processes with high response ratios.
- Overhead: HRRN has moderate overhead due to calculations involved in determining response ratios.
- Effect on Processes: Processes with higher response ratios get preference, balancing between short and long tasks.
- Starvation: HRRN minimizes the risk of starvation by considering waiting times.

**Feedback**:

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
