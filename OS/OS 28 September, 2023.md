# Chapter 9: Scheduling Cont.
#### Fair Share
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
		- Wk -> Weight assigned to group k, constraint that 0 < Wk <= 1 and 
- `Fill in stuff about a pattern based on Group allocation for the CPU`

### UNIX SVR3 Scheduler 
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
		- 