# Chapter 9: Scheduling Cont.
#### Fair Share
- Used in multi-user systems
- Ensures each user gets it own fair share of system resources
	- Weighted Fair Queuing
	- Round Robin with Quotas
- `Fill in stuff about a pattern based on Group allocation for the CPU`

### UNIX SVR3 Scheduler 
- Provide good response time for interactive users and ensure low priority background tasks do not starve
- Multilevel Feedback using Round robin
- Formulas
	- $$CPU(i) = \frac{CPU_j(i-1)}{2}$$
	- $$P_{j(i)}=Base_{j} + \frac{CPU_j(i)}{2}+nice_j $$
	- Where 
		- CPUj(i) -> Processor util by process j thru interval i
		- Pj(i) -> Current Priority of process j at starting i
		- Basej -> Base priority of process j
		- nicej -> user-controlled adjustment factor