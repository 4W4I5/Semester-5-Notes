## Information Security

- Task of securing info that is digital. 
	- Such as data that is: 
		- Transferred on a storage device
		- Transmitted over a network
	- Ensure that protective measures are properly implemented to ward off attack and prevent the total collapse of the system when a successful attack occurs
	- Protect data in transit is the aspect covered in this course

#### Difficulties in defending against attacks

- Universally connected devices
	- Expansion in IoT
	- Can connect to a network of devices and takeover
- Increased speed of attack
	- Improvements in processor technology
- Greater sophistication of attacks
	- High level tools are already available, a newbie can start by buying off tools off of the dark web
- Availability and simplicity of attack tools
	- A lot of the heavy work is handled by the tools themselves therefore aiding the complexity of the attacks

#### Next-Gen attacks

`Look at case study of DynDNS (Mirai malware). Write down a summary`
- Botnet? It is a prog hidden within the device and running in the background, provides resources to the attacker using other people's devices
	- Method of attack
		- Scan
			- Telnet scans
			- Look for IoT devices to find a route to target machine (end-user)
		- Infection
		- Control
		- Attack

#### Defining Information Security

- Types of information protection
	- Confidentiality
		- Only authorized ppl have access to the data
		- Breached confidentiality means unauthorized access
		- In Detail
			- `Add details from slides`
			- Can be breached intentionally and unintentionally i.e something done by you that opens up confidential data to unauthorized users
		- Enforced via encryption however encryption is meant for integrity as the sender is revealed through their private key decrypted via a signature (NOTE:: got confused at this)
		- Countermeasures
			- Encryption
				- Data at rest
					- Whole Disk, Database
				- Data in transit
					- IPSec, TSL, PPTP, SSH
			- Access control
				- Physical and Technical
	- Integrity
		- Ensuring the data is `Add a meaning to this`
		- Depends on confidentiality
		- Breach
			- Intentional
				- Deleting files
				- Invalid data
				- Altered configs
			- Unintentional
		- Countermeasure
			-
	- Availability
		- On-Time
		- DDOS is meant to take down the viability of data/network
		- Breach
		- Countermeasure

#### Identification and 3 A's

- Identify is given to a user but verifying them requires authentication
- Authorization gives access rights to the authenticated user
- Auditing/Accountability is monitoring and logging user activity and accounting is holding subjcets accountable for malicious activity
- Nonrepudition is essential part of accountability, made possible thru the 3 A;s
