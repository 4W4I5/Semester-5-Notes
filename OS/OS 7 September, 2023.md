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

# Chapter 3: Process Description and Control
- Process is an instance of a program or a program in execution
- Process elements
	- Program code
	- Process data
	- Process State PSW
- Process control block
	- Contains the process elements
	- Created and managed by the OS
	- Key tool that allowed for support for multiple process
	- When a process is removed from the running state to allow another process to run values important to correct execution of the process must be saved. The PCB is where such information is saved
	- PCB lifetime is only for the duration of the process
- Reasons for process creation
	- New batch job
	- Interactive logon
	- Created by OS to provide a service
	- Spawned by the existing process
- Process Creation
- Process Termination
	- Reasons for process termination
- Process States
	- Trace
		- The code of the process
	- Dispatcher
		- A process itself responsible for 