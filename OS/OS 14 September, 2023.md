After CH3 move to CH9

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

#### **User-Level Context:**

- **Process Text:**
	- This refers to the code or program instructions of a running process.
- **Process Data:**
	- It includes the data and variables used by a process during its execution.
- **User Stack:**
	- The user stack is where a process stores function call information, such as return addresses and local variables.
- **Shared Memory:**
	- This is a segment of memory that multiple processes can access and share, allowing them to exchange data.

#### **Register Context:**

- **Program Counter:**
	- It holds the memory address of the next instruction to be executed.
- **Processor Status Register:**
	- This register contains various flags and status information about the processor's state.
- **Stack Pointer:**
	- It points to the top of the stack, used for managing function calls and local variables.
- **General-Purpose Registers:**
	- These registers are used for various purposes, such as holding data and performing arithmetic operations.

#### **System-Level Context:**

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
