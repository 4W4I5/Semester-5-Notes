# 6.5 APF (Application Proxy Firewall)
- Sits in b/w the client and the server
- Inspects application content in all traffic b/w the client and the server

- ##### Protections For internal clients against malicious webservers
	- URL Blacklist
	- Protection against some or all scripts
	- Disallowing of HTTP response messages with prohibited MIME type that indicate malware
- ##### Protections against misbehaving clients
	- Disallowing the HTTP Post method, which can be used to send out sensitive files
	- Indications of SQL Injections
- ##### Automatic Protections
	- Header Destruction
		- Data link, internet and transport headers are discarded along with any attacks they may have contained
	- Protocol fidelity
		- Communication with the firewall is broken if the protocol indicated port number is not followed