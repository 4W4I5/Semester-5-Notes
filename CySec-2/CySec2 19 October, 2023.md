## Firewall Architecture
- ### DMZ (Demilitarized Zone)
	- Uses a multi-homed main firewall
		- One subnet to the border router
		- One subnet available to the DMZ (Accessible to the outside world)
		- One subnet to the internal network
			- Access from the internal subnet to the internet is nonexistent/minimal
			- Access from the internal subnet to the DMZ is also strongly controlled
## Firewall Management
- ### Defining Firewall Policies
	- Policies are more comprehensible than actual firewall rules
	- Multiple ways of implementation, Defining policies allows more freedom in implementation
- ### Implementation
	- Firewall Hardening
	- Firewall policy database
	- Vulnerability testing after configuration
	- Change authorization and management
	- Reading firewall logs

`Fill in slides and also add in 6.10`