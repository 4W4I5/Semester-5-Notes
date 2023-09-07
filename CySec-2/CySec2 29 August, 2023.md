## Cyber APT Kill Chain
`Look into THM for more indepth info on killchain`
#### 1. **Reconnaissance**
- Probe for information about the target system: type of hardware or software used, harvest public information, conduct in-depth research, and search for weak points in a company’s network.
- **Activities:** 
	- Domain scanning
	- OSINT collection
	- Social engineering such as Email Harvesting.
		- theHarvester - capable of gathering names, subdomain IPs and URL besides email
		- Hunter.io - email hunting tool
		- OSINT Framework - collection of OSINT Tools

#### 2. **Weaponization**
- Attackers create a malicious payload(automated tool) and pair it with a delivery mechanism that disguises it as a legitimate software update or document.
- **Activities:** 
	- The attacker would create a payload, a malicious code that they would run on the system or use an exploit, a program/code that takes advantage of a vulnerability/flaw in the system
	- They would also choose C2 (Command & Control techniques)
	- They would also possibly implant a backdoor, a mechanism to achieve persistence should they lose access

#### 3. **Delivery**
- Attackers decide on the delivery method. There are plenty of options to choose from.
- **Activities:** 
	- Sending malicious emails
	- Exploiting vulnerabilities
	- Distributing Infected USB drives, 
	- Watering Hole Attack, an attack designed to compromise a group of users by infecting websites they typically visit and luring them to a malicious site

#### 4. **Exploitation**
- Attackers leverage vulnerabilities to execute the malicious code on the target system.
- **Activities:** 
	- Gaining unauthorized access, bad configs, privilege escalation, executing malicious code, Letting users click on a link that leads to website that downloads and executes said code.
	- Examples:
		- 0-Day
		- Drive-By Download
		- Phishing and Social Engineering
		- Software Vulnerabilities
		- Malicious Code Execution
		- SQL Injection
		- Remote Code Execution

#### 5. **Installation**
- Attackers install persistent mechanisms to maintain control over the compromised system.
- **Activities:** 
	- Installing backdoors, creating user accounts, establishing command and control channels.

#### 6. **Command and Control (C2)**
- Attackers establish a communication channel to control the compromised system.
- **Activities:** 
	- Setting up remote access, using encrypted communication, establishing communication protocols.

#### 7. **Execution**
- Attackers perform malicious actions on the compromised system.
- **Activities:** 
	- **Persistence**
		- Attackers ensure their access to the system remains even after reboots.
		- **Activities:** 
			- Modifying startup scripts, creating scheduled tasks, hiding in system components.
	- **Privilege Escalation**
		- Attackers increase their level of control and access within the target environment.
		- **Activities:** 
			- Exploiting misconfigurations, leveraging software vulnerabilities, manipulating access controls.
	- **Defense Evasion**
		- Attackers employ techniques to avoid detection by security measures.
		- **Activities:** 
			- Anti-virus evasion, using encrypted communication, disguising malicious files.
	- **Credential Theft**
		- Attackers gather authentication credentials to gain unauthorized access.
		- **Activities:** 
			- Keylogging, pass-the-hash attacks, brute-forcing passwords.
	- **Discovery**
		- Attackers explore the target environment to identify critical assets and data.
		- **Activities:** 
			- Network scanning, system enumeration, identifying valuable data repositories.
	- **Lateral Movement**
		- Attackers move laterally within the network to access different systems.
		- **Activities:** 
			- Exploiting trust relationships, using stolen credentials, leveraging lateral vulnerabilities.
	- **Data Exfiltration**
		- Attackers steal sensitive data from the target environment.
		- **Activities:** 
			- Transferring files, compressing data, disguising data within legitimate traffic.
	- **Impact**
		- Attackers execute their primary objectives, causing damage to the target organization.
		- **Activities:** 
			- Destroying data, disrupting services, deploying ransomware, causing financial losses.

[Case Study - Carbanak APT](Case%20Study%20-%20Carbanak%20APT.md)