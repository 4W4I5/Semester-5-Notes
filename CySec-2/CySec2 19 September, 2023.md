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
		- Static Packet Filtering
			- Limits
				- Examines packets one at time
				- Only looks at some network and transport headers i.e checks the port and IP
				- Does not stop many types of attack
		- Network Address Translation
		- Application Proxy Filtering
		- Intrusion Prevention System Filtering
		- Antivirus Filtering