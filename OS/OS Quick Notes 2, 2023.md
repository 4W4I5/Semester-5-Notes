# Chapter 9: Scheduling
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




---
# Chapter 5: Concurrency
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


##### **Mutex (Mutual Exclusion):**

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















  ```python
  Producer:
    while (true) {
      // Produce an item.
      item = produce_item();
      
      // Wait if the buffer is full.
      wait(empty);
      
      // Lock the buffer.
      lock(buffer_mutex);
      
      // Add the item to the buffer.
      add_item_to_buffer(item);
      
      // Unlock the buffer.
      unlock(buffer_mutex);
      
      // Signal that the buffer is no longer empty.
      signal(full);
    }
  ```





























  ```python
  Consumer:
    while (true) {
      // Wait if the buffer is empty.
      wait(full);
      
      // Lock the buffer.
      lock(buffer_mutex);
      
      // Remove an item from the buffer.
      item = remove_item_from_buffer();
      
      // Unlock the buffer.
      unlock(buffer_mutex);
      
      // Signal that an empty slot is available.
      signal(empty);
      
      // Consume the item.
      consume_item(item);
    }
  ```















  - The "wait" and "signal" operations, along with mutex locks, ensure that producers and consumers can work without violating mutual exclusion or buffer overflows/underflows.

This solution using semaphores and mutex locks is a common approach to the Producer/Consumer problem. It ensures that producers and consumers operate safely and efficiently. If you have more specific questions or need further clarification, please let me know.

## Message Passing
- **Synchronization:**
	- Message passing is a mechanism for inter-process communication (IPC) in which processes exchange data through messages.
	- Synchronization in message passing is achieved by sending and receiving messages between processes.
	- Message passing ensures that processes coordinate their actions and can be used for both cooperation and synchronization.
- **Addressing:**
	- In message passing, processes are identified by their process IDs (PIDs).
	- When a process sends a message, it specifies the target process by its PID.
	- This addressing mechanism ensures that the message reaches the intended recipient.
- **Message Format:**
	- Messages typically have a format that includes a header and a body.
	- The header contains control information, such as the sender's PID and the message type.
	- The body contains the actual data being transmitted.
- **Queueing Discipline:**
	- In message passing systems, messages are often placed in message queues.
	- The order in which messages are retrieved from the queue can follow different queueing disciplines.
	- Common queueing disciplines include first-come, first-served (FCFS), priority-based, and round-robin.
- **Mutual Exclusion:**
	- Message passing can be used to implement mutual exclusion.
	- For example, when multiple processes need to access a shared resource, they can coordinate through message passing to ensure only one process accesses the resource at a time.

**Example: Implementing Mutual Exclusion with Message Passing:**

Suppose we have two processes, Process A and Process B, which need to access a shared resource using message passing for mutual exclusion:

- **Process A:**














  ```python
  while (true) {
    // Request permission to access the shared resource from Process B.
    send_request_message(ProcessB_PID);
    
    // Wait for a response message from Process B.
    receive_response_message();
    
    // Access the shared resource.
    // ...

    // Release the shared resource.
    // ...
    
    // Notify Process B that it can access the resource.
    send_release_message(ProcessB_PID);
  }
  ```















- **Process B:**




  ```python
  while (true) {
    // Wait for a request message from Process A.
    receive_request_message();

    // Grant permission to access the shared resource to Process A.
    send_response_message(ProcessA_PID);
    
    // Wait for Process A to release the resource.
    receive_release_message();
  }
  ```


In this example, the two processes, A and B, coordinate their access to the shared resource through message passing. The request and response messages help achieve mutual exclusion, ensuring that only one process accesses the resource at a time.

---



# Chapter 4: Threads
## 4.1 Processes and threads

**Processes and Threads:**

- **Multithreading:**
  - Multithreading is a programming and execution model where a process contains multiple threads that can execute independently but share the same resources within the process.
  - Threads within the same process can communicate and coordinate more efficiently than separate processes because they share the same memory space.
  - Multithreading is commonly used for parallel execution, responsiveness, and efficient resource sharing.
- **Thread Functionality:**
  - Threads in a process can have various functionalities, including:
    - **Independent Execution:** Threads can perform tasks concurrently within the same process.
    - **Shared Memory:** Threads within the same process can access and modify shared data and variables, simplifying communication.
    - **Resource Sharing:** Threads can share resources like file handles, network connections, and memory space.
    - **Synchronization:** Threads can synchronize their actions using synchronization primitives (e.g., mutexes and semaphores) to avoid data corruption or race conditions.
    - **Efficient Context Switching:** Threads can switch context within the same process more efficiently than switching between different processes.

## 4.2 Types of threads

**Types of Threads:**

- **User-Level and Kernel-Level Threads:**
  - **User-Level Threads (ULTs):**
    - ULTs are managed entirely by the application or user-level libraries.
    - The operating system is unaware of ULTs and doesn't schedule them.
    - ULTs are lightweight and fast to create and switch between.
    - However, they can't take advantage of multiprocessor systems efficiently.
  - **Kernel-Level Threads (KLTs):**
    - KLTs are managed by the operating system kernel.
    - They can be scheduled independently by the operating system, taking full advantage of multiprocessor systems.
    - KLTs provide better concurrency but may be slower to create and switch between due to kernel involvement.

**Other Arrangements:**

- **Many-to-One Model:**
  - Multiple user-level threads are mapped to a single kernel-level thread.
  - Efficiency is gained in user-space but not in the kernel.
  - If one ULT blocks, it blocks the entire process.
- **One-to-One Model:**
  - Each user-level thread corresponds to a single kernel-level thread.
  - Provides concurrency benefits of KLTs.
  - More overhead due to the creation and management of kernel threads.
- **Many-to-Many Model:**
  - Multiple user-level threads are mapped to a smaller or equal number of kernel-level threads.
  - Provides a balance between ULTs' efficiency and KLTs' concurrency.
  - Kernel and user-level threads can be scheduled independently.

## 4.3 Multicore and Multithreading

**Multicore and Multithreading:**

- **Performance of Software on Multicore:**
  - Multicore processors have become prevalent, offering multiple processing cores on a single chip.
  - The performance of software can be significantly improved by leveraging multicore processors through multithreading.
- **Benefits of Multithreading on Multicore:**
  - Utilizing multiple cores with multithreading can lead to several benefits:
    - **Parallel Execution:** Multithreaded applications can perform multiple tasks simultaneously on different cores, improving throughput.
    - **Responsiveness:** Multithreading can keep the system responsive, ensuring that one core is dedicated to handling user interactions while others perform background tasks.
    - **Efficiency:** Multithreading can reduce overall execution time by distributing tasks across multiple cores, allowing faster completion.

**Application Example: Valve Game Software (Source Engine):**

- **Source Engine and Multithreading:**
  - Valve's Source Engine is used in popular games like Half-Life 2, Counter-Strike, and Portal.
  - The Source Engine is known for its effective use of multithreading for better performance.
- **Multithreading in Source Engine:**
  - Source Engine employs multithreading for tasks like rendering, physics simulations, and audio processing.
  - For example, the rendering pipeline can be split into multiple threads to improve graphics performance.
  - Physics calculations for objects, particles, and player movements can be offloaded to separate threads.
- **Benefits in Gaming:**
  - Multithreading in game engines like Source allows for more detailed and dynamic environments, realistic physics simulations, and improved responsiveness.
  - Games can make efficient use of multicore processors, providing smoother gameplay and enhanced graphics without overloading a single core.
- **Example: Physics Simulation in Source Engine:**
  - In the Source Engine, physics simulation can be distributed across multiple threads, with each thread responsible for a different aspect of the physics world.
  - For example, one thread might handle rigid body simulations, another for fluid dynamics, and another for soft body physics.
  - These threads work in parallel, taking advantage of multicore processors to provide realistic and responsive in-game physics.

## 4.4 Windows 7 Thread and SMP management

**Windows 7 Thread and SMP Management:**

- **Process and Thread Objects:**
    - In Windows 7, processes and threads are represented by objects.
    - A process is an independent program execution unit, and a thread is the basic unit of CPU utilization within a process.
    - Windows provides extensive control and management through these objects.
- **Multithreading:**
    - Windows 7 fully supports multithreading, allowing processes to create and manage multiple threads.
    - Multithreading is essential for taking advantage of multicore processors.
- **Thread States:**
    - Threads in Windows can be in various states, including:
        - **Running:** The thread is actively executing.
        - **Ready:** The thread is ready to run but waiting for its turn.
        - **Blocked:** The thread is waiting for some event or condition to be satisfied.
        - **Terminated:** The thread has completed its execution.
- **Support for OS Subsystems:**
    - Windows 7 provides support for different operating system subsystems, including the Windows API (Application Programming Interface), the POSIX subsystem, and the OS/2 subsystem.
    - Each subsystem has its own set of system calls and APIs that applications can use.
- **Symmetric Multiprocessing Support:**
    - Windows 7 supports symmetric multiprocessing (SMP), where multiple processors (or cores) are utilized efficiently.
    - SMP support allows Windows to distribute the execution of threads across multiple processors.
    - This results in better performance and responsiveness, especially for multithreaded applications.
## 4.5 Solaris Thread and SMP management
- **Multithreaded Architecture:**
    - Solaris is known for its multithreaded architecture, which allows multiple threads to exist within a single process.
    - Threads in Solaris are often referred to as lightweight processes (LWPs) and are created and managed efficiently.
- **Motivation:**
    - Solaris introduced multithreading to improve system performance and responsiveness.
    - Motivations include taking full advantage of SMP systems, better resource utilization, and more responsive applications.
- **Process Structure:**
    - In Solaris, each process consists of one or more LWPs (threads).
    - LWPs share the same address space, file descriptors, and other process-related resources.
    - Solaris allows processes to create LWPs as needed, which can be particularly useful for I/O-bound and parallel applications.
- **Thread Execution:**
    - Solaris threads execute in parallel on multiple processors in SMP systems.
    - Threads can run in user mode or kernel mode, and they can be scheduled by the Solaris kernel or by user-level thread libraries.
    - The goal is to efficiently distribute the workload across available processors.
- **Interrupts as Threads:**
    - Solaris treats interrupts as threads.
    - When an interrupt occurs, it is handled by a dedicated interrupt thread.
    - This approach allows Solaris to manage and prioritize interrupt handling, ensuring that interrupts do not disrupt the execution of user-level threads.

## 4.6 Linux Process and thread management

- **Linux Tasks:**
    - In Linux, processes and threads are represented as tasks.
    - A task can be either a process or a thread.
    - Each task has its own task structure and is identified by a unique task ID (PID).
- **Linux Threads:**
    - In Linux, threads are a type of task that share the same memory space, file descriptors, and other process-related resources.
    - Threads within the same process are created using the `clone` system call.
    - Each thread has its own stack, registers, and program counter, but they share memory resources, making communication and data sharing efficient.
## 4.7 MAC OSX GCD (Grand Central Dispatch)

- **Introduction:**
    - Grand Central Dispatch (GCD) is a powerful and efficient API provided by macOS and iOS for managing concurrent and parallel execution of tasks.
    - GCD simplifies the development of multithreaded applications by providing a high-level and easy-to-use interface for managing threads, queues, and synchronization.
- **Key Concepts:**
    - GCD introduces several key concepts:
        - **Dispatch Queues:** Queues are used to manage the execution of tasks. GCD offers two types of queues:
            - **Serial Queues:** Tasks are executed one at a time in the order they are added to the queue.
            - **Concurrent Queues:** Tasks are executed concurrently, allowing multiple tasks to run in parallel.
        - **Blocks:** GCD tasks are typically defined as blocks of code. These blocks are closures that encapsulate a unit of work.
        - **Dispatch Groups:** Dispatch groups are used to track the completion of multiple tasks and synchronize their results.
- **Main Benefits:**
	- GCD abstracts the complexities of thread management, making it easier to write concurrent code without worrying about low-level details.
	- It improves performance by efficiently utilizing available CPU cores, even on multi-core systems.
	- GCD automatically scales the number of threads based on the available CPU resources and workload.
- **Use Cases:**
	- GCD is commonly used for parallelizing tasks in macOS and iOS applications, such as:
		- Background tasks like file I/O and network operations.
		- Implementing responsive and concurrent user interfaces.
		- Multithreaded rendering and image processing.
- **Error Handling:**
	- GCD provides mechanisms for error handling and ensures that exceptions and crashes do not compromise the entire application.



---