# Internals & Designs Principals

 If an OS doesn't exist, then the application would need to
- Schedule processes
- Manage I/o
- Have its hardware-specific drivers
- Resource management

#### Fetch-Decode-Execute Cycle

- Forgot about Decode section during the class mostly cause i am used to the two step process
- Steps
	- PC-> Has value of next instruction stored here (Not current)
		- MAR stores value of PC (NOTE:: MAR stores value of address to fetch from)
	- IR-> Loads instructions fetched by MAR value (Note some architectures skip loading the instruction into the MBR and loads directly to IR)
		- Instruction stored in IR is decoded into opcode + operand
	- PC increments

#### SISD, SIMD, MISD, MIMD
1. SISD (Single Instruction, Single Data):
    - One instruction processes one piece of data at a time.
    - Basic sequential processing.
2. SIMD (Single Instruction, Multiple Data):
    - One instruction processes multiple data elements simultaneously.
    - Used for parallel tasks like graphics and simulations.
3. MISD (Multiple Instruction, Single Data):
    - Multiple instructions operate on the same data at once.
    - Rare, mainly theoretical.
4. MIMD (Multiple Instruction, Multiple Data):
    - Multiple instructions process multiple data streams concurrently.
    - Most versatile, used in clusters and supercomputers.

#### SoC (System-On-a-Chip)

- Combines entire electronic systems on a single chip.
- Includes processor, memory, interfaces.
- Used in mobile devices, IoT, and more.
- Cuts size, cost, and power use.
- Used mostly in mobile and embedded devices

### Opcodes & Operands

- OpCode (Operation Code):
	- OpCode is a fundamental part of a machine language instruction.
	- It represents the specific operation or instruction to be executed by the CPU.
	- It guides the CPU on what operation to perform on the provided operands.
- Operands:
	- Operands are the data values or addresses on which the OpCode operates.
	- They are the inputs for the instruction's operation.
	- The number and type of operands depend on the OpCode.
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
	- **Sequential Execution**:
	    - Instructions are executed one after another in a linear sequence.
	    - The CPU fetches an instruction, decodes it, executes it, and then moves to the next instruction.
	    - No external events or requests can alter this sequence.
	- **Blocking Operations**:
	    - During operations like input/output or waiting for a resource, the CPU is idle.
	    - Other processes or tasks cannot proceed until the blocking operation completes.
	    - Inefficient use of CPU resources.
- Flow of Control With Interrupts
	- Look at [I/O Techniques](OS/OS%2029%20August,%202023.md) 
