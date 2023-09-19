TCP attacks continued


### Injection Attacks
- AKA Mitnick Attack
	-  `Fill in Case Study: MITNICK Attack `
	- Included in exam

---
# Chapter 6: Firewall
### Firewall Basics
- Runs a Policy based on a ruleset that passes/denies provable attack packets
- Policy
	- Group of rules that are bonded together i.e they can be updated together
- Rules
	- Allows/Blocks traffic In/Out of a specified single/range of ports
- Provable attack packets
	- Packet that met a firewall rule and got dropped after logging


## Firewall Characteristics
- ##### Traffic Overload
	- If a firewall is unable to examine and filter a packet, it is dropped i.e Firewall is being worked over its traffic capacity
		- Can be caused by complex rules that take up more processing time per packet
	- This is good for security however this results in a self-inflicted DOS
	- Filtering Mechanisms
		- Stateful Packet inspection filtering
			- `Fill in later from book`
		- Static Packet Filtering
			- Limits
				- Examines packets one at time
				- Only looks at some network and transport headers i.e checks the port and IP
				- Does not stop many types of attack
					- An isolated SYN/ACK packet which might be a part of a SYN/ACK flood attack will be let through
			- Benefits
				- Incoming ICMP echo packets and other scanning probe packets 
				- Outgoing responses to scanning probe packets 
				- Packets with spoofed IP addresses (e.g., incoming packets with the source IP addresses of hosts inside the firm) 
				- Packets that have nonsensical field settings—such as a TCP segment with both the SYN and FIN bits set
		- Network Address Translation - Next note
		- Application Proxy Filtering - Next note
		- Intrusion Prevention System Filtering - Next note
		- Antivirus Filtering - Next note