> [!NOTE]
> Lectures tagged with :warning: are essentially low-effort notes. Did not make them right before finals
>
> Lectures tagged with :white_check_mark: were made during finals
>
> Lectures tagged with :x: have not been made yet. Probs will not be if you see it the day after the exam =)

| **Chapter** | **Topic**                                       | **Status**         | **Prep(Ignore this, its for personal use)** |
| ----------- | ----------------------------------------------- | ------------------ | --------------------------------------- |
| **7**       | Memory Management                               | :white_check_mark: | Revise :warning:                        |
| **8**       | Virtual Memory                                  | :white_check_mark: | Revise :white_check_mark:               |
| **6**       | Concurrency: Deadlock & Starvation              | :x:                | :x:                                     |
| 5           | Concurrency: Mutual Exclusion & Synchronization | :warning:          | :x:                                     |
| 4           | Threads                                         | :x:                | :x:                                     |
| 9           | Uniprocessor Scheduling                         | :warning:          | :x:                                     |

<!--
:white_check_mark:
:warning:
:x:
-->
# 7. Memory Management
**Terminology:**
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

**Memory Management Requirements:**
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
- **Difference between Simple and Virtual Memory Paging:**
    - **Simple Memory Paging:** In simple memory paging, the entire program is loaded into the main memory at once. It doesn't involve the concept of virtual memory, and the execution occurs directly from the physical memory.
    - **Virtual Memory Paging:** Virtual memory paging involves the use of a combination of physical and secondary storage (like a hard disk). Only the necessary portions of a program are loaded into the main memory, allowing for efficient use of resources.
- **Thrashing:**
    - Thrashing occurs when a computer's virtual memory system is excessively busy swapping data between the RAM and the disk, instead of executing instructions. It leads to a decrease in overall system performance as valuable CPU time is spent on managing the swapping process rather than actual computation.
- **Principal of Locality in Virtual Memory:**
    - The principle of locality suggests that programs tend to access a relatively small portion of their address space at any given time. Virtual memory systems leverage this principle by keeping frequently used pages in the faster RAM, while less frequently used pages are stored in slower secondary storage. This optimizes performance by reducing the need for constant disk access.
- **Elements in a Page Table Entry (PTE):**
    - **Page Frame Number (PFN):** Represents the physical frame where the corresponding page is stored.
    - **Valid/Invalid Bit:** Indicates whether the page in the frame is currently in use (valid) or not (invalid).
    - **Protection Bits:** Control the access rights to the page, specifying whether it's read-only, read-write, etc.
    - **Dirty Bit:** Indicates whether the page has been modified since it was loaded into memory.
- **Purpose of Translation Lookaside Buffer (TLB):**
    - TLB is a cache of recently used page table entries, speeding up the virtual-to-physical address translation process. It stores mappings of virtual page numbers to physical frame numbers, reducing the need to access the full page table in slower memory.
- **Alternative Page Fetch Policies:**
    - **Demand Paging:** Pages are brought into memory only when they are explicitly referenced.
    - **Prepaging:** Multiple pages are brought into memory at once, anticipating future references.
- **Virtual Address Translation into Physical Main Memory Address:**
    - The CPU generates a virtual address, which consists of a page number and an offset within that page.
    - The page number is used to index the page table, retrieving the corresponding page frame number.
    - The offset is combined with the page frame number to generate the final physical memory address.
# 6. Concurrency: Deadlock & Starvation
>[!WARNING]
>Ask sir to explain how to determine a safe state and unsafe state for avoidance and detection algo


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
					- How to determine a safe state
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
- **Semaphores**: No other process may use the semaphore until all operations have completed. Semaphore{SemID, lastPID, NumOfProcWaiting>CurValue, isNumOfProcWaitingZero}
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
- **Semaphores**
- **Barriers**
**Solaris Thread Synchronization Primitives**
- **Data Structures**
- **Mutex locks**
- **Semaphores**
- **Multiple readers, single writer locks**
- **Condition variables**
**Windows 7 Concurrency Mechanisms**
- **Wait functions**
- **Windows Synchronization Objects**
- **Critical Sections**
- **Slim Read-Writer Locks**
- **Condition Variables**
- **Lock-Free Synchronization**
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