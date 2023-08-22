# Internals & Designs Principals

 If an OS doesnt exist, then the application would need to
- Schedule processes
- Manage I/o
- Have its hardware-specific drivers
- Resource management


#### Fetch-Decode-Execute Cycle
- Forgot about Decode section during the class
- Steps
	- PC-> Has value of next instruction stored here (Not current)
		- MAR stores value of PC (NOTE:: MAR stores value of address to fetch from)
	- IR-> Loads instructions fetched by MAR value (Note some architectures skip loading the instruction into the MBR and loads directly to IR)
		- Instruction stored in IR is decoded into opcode + operand