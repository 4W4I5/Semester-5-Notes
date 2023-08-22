# Internals & Designs Principals

 If an OS doesnt exist, then the application would need to
- Schedule processes
- Manage I/o
- Have its hardware-specific drivers
- Resource management


#### Fetch-Decode-Execute Cycle
- Forgot about Decode section during the class mostly cause im used to the two step process
- Steps
	- PC-> Has value of next instruction stored here (Not current)
		- MAR stores value of PC (NOTE:: MAR stores value of address to fetch from)
	- IR-> Loads instructions fetched by MAR value (Note some architectures skip loading the instruction into the MBR and loads directly to IR)
		- Instruction stored in IR is decoded into opcode + operand 
	- PC increments

#### SISD, SIMD, MISD, MIMD (FILL IN LATER)

#### SoC (System-On-a-Chip)
- Combines CPU, GPU, RAM onto a single chip
- Used mostly in mobile and embedded devices

### Opcodes & Operands
- To load a instruction bigger than the buswidth, a opcode exists to decode one half and then fetch the next half of the instruction 

#### Interrupts
- Classes of interrupts
	- Program
		- Caused by instruction execution
	- Timer
		- Time based
	- I/O
		- Memory polling
		- Peripherals
	- Hardware Failure
		- Unscheduled Disconnection or failure
- Flow of Control without Interrupts
	- Understood it but need to see the slides/book again to write down stuff here
- Flow of Control With Interrupts
	- Understood it but need to see the slides/book again to write down stuff here
- 