# Chapter 9: Uniprocessor Scheduling cont.

### Short term Scheduling Criteria
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