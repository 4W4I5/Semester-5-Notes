## Firewall Architecture
- ### DMZ (Demilitarized Zone)
	- Uses a multi-homed main firewall
		- One subnet to the border router
		- One subnet available to the DMZ (Accessible to the outside world)
		- One subnet to the internal network
			- Access from the internal subnet to the internet is nonexistent/minimal
			- Access from the internal subnet to the DMZ is also strongly controlled