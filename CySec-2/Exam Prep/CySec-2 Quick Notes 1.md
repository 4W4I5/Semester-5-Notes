| Chapter                                                                    | Status             |
| -------------------------------------------------------------------------- | ------------------ |
| [Lecture 1: Introduction To Security](#Lecture-1-Introduction-To-Security) | :white_check_mark:                |
| [Lecture 2: DNS Attacks](#Lecture-2-DNS-Attacks)                           | :x: DNS cache + cache posioning is missing               |
| [Lecture 3: TCP Attacks](#Lecture-3-TCP-Attacks)                           | :white_check_mark: |

<!--
:white_check_mark:
:x:
-->
---
# Lecture 1: Introduction To Security
## Information Security
- Task of securing info that is digital.
	- Such as data that is:
		- Transferred on a storage device
		- Transmitted over a network
	- Ensure that protective measures are properly implemented to ward off attack and prevent the total collapse of the system when a successful attack occurs
	- Protect data in transit is the aspect covered in this course

### Difficulties in defending against attacks
- Universally connected devices
	- Expansion in IoT
	- Can connect to a network of devices and takeover
- Increased speed of attack
	- Improvements in processor technology
- Greater sophistication of attacks
	- High level tools are already available, a newbie can start by buying off tools off of the dark web
- Availability and simplicity of attack tools
	- A lot of the heavy work is handled by the tools themselves therefore aiding the complexity of the attacks

### Next-Gen attacks
- The first case of a Next-Gen attack was the mirai botnet used to DDOS 
[Case Study - Mirai Malware](CySec-2/Case%20Studies/Case%20Study%20-%20Mirai%20Malware.md)

## Defining Information Security

- Types of information protection
	- **Confidentiality** `How is this dependent on Integrity though` <!--For data to be confidental it must be trustworthy, encrypted, be under ACL/IAM and be audited-->
		- Definition
			- Protect information from unauthorized access
		- Breaches
			- **Unauthorized Access:** Hackers or insiders gain unauthorized access to sensitive data.
			- **Data Leaks:** Sensitive information is disclosed to unauthorized parties.
			- **Unintentional Disclosure**: Can be done so by sending a print of confidential data and someone else reads it, not encrypting data in transit, falling pray to a SE attack.
		- Countermeasures
			- **Encryption:** Converts information into a coded format that can only be deciphered by authorized parties.
				- Data in transit using IPSec, TLS, PPTP, SSH
				- Data at rest using whole disk and/or database encryption
			- **Access Control:** Restricts access to information based on user roles and permissions.
			- **Data Classification:** Categorizes information based on sensitivity and applies different security controls accordingly.
	- **Integrity**
		- Definition
			- Ensure Data Accuracy & Prevent unauthorized access (Dependent on Confidentiality)
		- Breaches
			- **Data Tampering:** Unauthorized changes to data, which could result in misleading or incorrect information.
			- **Data Corruption:** Unintended alterations to data that render it unusable or inaccurate.
		- Countermeasures
			- **Data Validation:** Checks data inputs for accuracy and validity.
			- **Checksums and Hashing:** Generates checksums or hashes to verify data integrity.
			- **Version Control:** Tracks changes to data and maintains a history of modifications.
	- **Availability**
		- Definition
			- Ensure authorized access to resources without disruptions
		- Breaches
			- **Denial of Service (DoS) Attacks:** Overwhelms systems with traffic, rendering them inaccessible.
			- **Distributed DoS (DDoS) Attacks:** Coordinated DoS attacks from multiple sources, magnifying the impact.
		- Countermeasure
			- **Redundancy:** Duplication of critical systems and data to ensure availability even in the event of failures.
				- Example: RAID Array, Redundant data and power lines, software and data backups, Roll-Back/Failover.
			- **Load Balancing:** Distributes traffic across multiple servers to prevent overloading.
			- **Disaster Recovery Planning:** Establishes procedures and resources for restoring operations after a disruption.

## Protections to secure information
- ##### **Identification**
	- This involves uniquely recognizing users or entities accessing a system or resource.
- ##### **Authentication**
	- This verifies the identity of users or entities through credentials (like passwords, biometrics, tokens) before granting access.
- ##### **Authorization**
	- Once authenticated, users or entities are granted appropriate permissions to access specific resources or perform certain actions.
- ##### **Auditing**
	- The process of monitoring and recording activities on a system to detect and investigate security breaches or policy violations.
- ##### **Accounting**
	- This involves tracking and managing resource usage, often for billing, auditing, or security purposes.
	- **Non-Repudiation**
		- Ensure that the suspect of an event/activity cannot deny that the event occurred. It is essential to accounting and made possible through Identification, Authentication, Accountability, Authorization and Auditing
### Information Security Terminology
- Asset
	- Item of value
	- Asset Types
		- Information
		- Customized Business Software
		- System Software
		- Physical Items
		- Services
- Threat
	- Actions or events that have potential to cause harm
- Threat Agent
	- Person/Element with the power to carry out a threat
		- Can also be natural disasters
- Vulnerability
- Threat Likelihood
- Risk
	- Situation that involves exposure to any sort of danger
	- Dealing with Risk
		- Risk Avoidance: Identifying the risk and not engaging in the activity to create that particular risk
		- Acceptance: Risk is acknowledging the risk exists but no steps are taken to address it
		- Risk mitigation: Address the risks to reduce the severity of the risks
		- Deterrence: Understanding the attacker and then informing them of the consequences
		- Transference: Transfer the risk to a 3rd party
- ##### SSL Exploit and APT Spyware
[Case Study - HeartBleed Exploit](/CySec-2/Case%20Studies/Case%20Study%20-%20HeartBleed%20Exploit.md)
[Case Study - Pegasus Spyware](Case%20Study%20-%20Pegasus%20Spyware.md)

## Advanced Persistent Threats (APT)
APT's are built with the following goals in mind
- ##### Sophistication
	- **Advanced Techniques:** APTs utilize cutting-edge attack methods that are beyond typical cybercriminal capabilities. They might employ zero-day exploits, persistence, custom malware, and complex attack chains.
	- **Custom Malware:** Attackers create tailored malware specifically designed to evade detection by traditional security measures. This makes it difficult for antivirus software to identify and mitigate the threat.
	- **Precision Planning:** APTs are meticulously planned and executed. Attackers invest significant time in reconnaissance to gather intelligence about the target, its systems, and its vulnerabilities.
- ##### Persistence
	- **Continuous Access:** Once inside the target's network, APTs aim to maintain access over an extended period, often measured in months or even years. This allows them to gather valuable information and carry out their objectives over time.
	- **Backdoors and Implants:** APTs create hidden backdoors and implants within the compromised systems. These serve as entry points for the attackers even if the initial point of entry is discovered and closed.
- ##### Stealth
	- **Anti-Detection Techniques:** APTs employ various techniques to evade detection, such as using encryption to hide their communication, disguising their activities as legitimate traffic, and employing anti-analysis mechanisms to hinder security researchers.
	- **Avoiding Suspicion:** APTs aim to blend in with normal network activity, avoiding actions that might trigger alarms or raise suspicion.
- ##### Specific Targets
	- **High-Value Targets:** APTs often focus on high-value targets such as government agencies, military institutions, defense contractors, large corporations, and organizations with valuable intellectual property.
	- **Nation-State Involvement:** APTs are sometimes attributed to nation-states, indicating political or espionage motives. However, some APTs also have financial or criminal motivations.
- ##### Motivation
	- **State-Sponsored:** Some APTs are believed to be backed by nation-states, aiming to gather intelligence, carry out cyber espionage, disrupt adversaries, or support political agendas.
	- **Financial Gain:** Certain APT groups target financial institutions, critical infrastructure, and businesses to steal sensitive financial information, intellectual property, or engage in cybercrime for monetary gain.
	- **Hacktivism:** APTs with hacktivist motives target organizations aligned with their beliefs or political objectives, aiming to create social or political disruption.

## Cyber APT Kill Chain

> [!NOTE]
`Look into THM for more indepth info on killchain`
> 
> [Cyber Kill Chain TryHackMe. Reconnaissance | by Avataris12 | Medium](https://medium.com/@WriteupsTHM_HTB_CTF/cyber-kill-chain-tryhackme-7025c0662696)

RWDEIC2E -> Acronym to keep this memorized
### 1. **Reconnaissance**
- Probe for information about the target system: type of hardware or software used, harvest public information, conduct in-depth research, and search for weak points in a company’s network.
- **Activities:**
	- Domain scanning
	- OSINT collection
	- Social engineering such as Email Harvesting.
		- theHarvester - capable of gathering names, subdomain IPs and URL besides email
		- Hunter.io - email hunting tool
		- OSINT Framework - collection of OSINT Tools
### 2. **Weaponization**
- Attackers create a malicious payload(automated tool) and pair it with a delivery mechanism that disguises it as a legitimate software update or document.
- **Activities:**
	- The attacker would create a payload, a malicious code that they would run on the system or use an exploit, a program/code that takes advantage of a vulnerability/flaw in the system
	- They would also choose C2 (Command & Control techniques)
	- They would also possibly implant a backdoor, a mechanism to achieve persistence should they lose access
### 3. **Delivery**
- Attackers decide on the delivery method. There are plenty of options to choose from.
- **Activities:**
	- Sending malicious emails
	- Exploiting vulnerabilities
	- Distributing Infected USB drives,
	- Watering Hole Attack, an attack designed to compromise a group of users by infecting websites they typically visit and luring them to a malicious site
### 4. **Exploitation**
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
### 5. **Installation**
- Attackers install persistent mechanisms to maintain control over the compromised system.
- **Activities:**
	- Installing backdoors, creating user accounts, establishing command and control channels.
### 6. **Command and Control (C2)**
- Attackers establish a communication channel to control the compromised system.
- **Activities:**
	- Setting up remote access, using encrypted communication, establishing communication protocols.
### 7. **Execution**
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
#### Carbanak APT Case Study
- The Carbanak APT is one of the most notorious and impactful cybercrime campaigns in recent history. Active from around 2013 to 2016, the Carbanak group targeted financial institutions, stealing hundreds of millions of dollars worldwide.
	- [Case Study - Carbanak APT](/CySec-2/Case%20Studies/Case%20Study%20-%20Carbanak%20APT.md)

---
# Lecture 2: DNS Attacks
## Revising DNS & DHCP
- IP addresses allow internet connectivity
	- However tough to remember the IP for each website/server we need
- ## DHCP
	- ##### Use?
		- Provides Next-Hop router, DNS ,gateway and host IP addresses
	- ##### PORTS USED:
		- 67 for server
		- 68 for client
	- ##### DHCP Working (all are broadcasts)
		- **DHCP discover**
			- source IP = 0.0.0.0
			- destination IP = 255.255.255.255
		- **DHCP offer**
			- source IP = 1.1.1.254/24
			- destination IP = 255.255.255.255 (offer is also broadcast to all)
			- Server sends available IP addresses and options
		- **DHCP request**
			- Client requests offered IP from server after selecting from options
			- Basically check if the network has that IP already assigned by using the offered IP and ARP broadcasting
		- **DHCP ACK**
			- DHCP agrees final comms and ack the IP request
	- ##### VULN
		- **IP Configuration Manipulation**:
			- Attackers can manipulate DHCP to distribute incorrect or malicious IP configurations to clients, potentially disrupting network services and compromising security.
		- **Resource Exhaustion**:
			 - DHCP servers may run out of available IP addresses, causing connectivity issues, or face resource exhaustion due to DoS attacks.
		- **Network Traffic Interception**:
			 - DHCP can be exploited for man-in-the-middle attacks, enabling attackers to intercept and manipulate network traffic.
		- **Option Injection**:
			 - Attackers can inject malicious options into DHCP responses, leading to DNS hijacking and traffic redirection.
		- **DHCP Snooping Bypass**:
			 - Failure to secure switches against rogue DHCP servers can allow attackers to deploy unauthorized DHCP services.
	- ##### Best security practices
		- DHCP Trusted Switches
			- Untrusted DHCP requests/responses are dropped by the switch
		- DHCP Fingerprinting
			- Identify the software used and compare it with the list of known trusted servers
		- Network Monitoring
			- Look for patterns that signal a rouge DHCP server
<!--
==============OMITTED==============
## URL (Uniform Resource Locator)
 - ### **Definition**:
	 - A URI (Uniform Resource Identifier) is a string of characters that uniquely identifies a particular resource, either on the internet or in other contexts.
- ### **Types of URIs**:
    - #### **URL (Uniform Resource Locator)**:
	    - A specific type of URI that provides the means to locate a resource on the web. URLs include the protocol (e.g., http://), domain, and path.
	    - **Components**:
		    - **Protocol**: Specifies how the resource should be accessed, such as HTTP, HTTPS, FTP, etc.
		    - **Domain**: The web address of the server where the resource is hosted (e.g., [www.example.com](http://www.example.com/)).
		    - **Port**: Optional, specifies the port number to use for the connection (e.g., :80 for HTTP).
		    - **Path**: The specific location of the resource on the server's file system.
		    - **Query**: Optional, contains parameters for the resource (e.g., ?id=123).
		    - **Fragment**: Optional, specifies a specific section of the resource (e.g., '#section1').
	- **Example**: Here's a breakdown of a URL:
		- **URL**: [https://www.example.com:8080/path/to/resource?param=value#section](https://www.example.com:8080/path/to/resource?param=value#section)
		- **Protocol**: https
		- **Domain**: [www.example.com](http://www.example.com/)
		- **Port**: 8080
		- **Path**: /path/to/resource
		- **Query**: ?param=value
		- **Fragment**:  '#section'
	- **Purpose**:
		- URLs are used to uniquely identify and locate web resources, including web pages, images, documents, and more.
	- **Format Rules**:
	    - Should not contain spaces or special characters (use URL encoding).
	    - Use lowercase letters for protocol and domain (although it's case-insensitive).
	- **Encoding**:
		- Special characters in URLs are encoded using percent-encoding (e.g., space becomes %20).
	- **Security**:
		- URLs with "https" are secure, as they use SSL/TLS encryption for data transmission.
	- **Relative vs. Absolute URLs**:
		- Relative URLs are based on the current page's URL, while absolute URLs specify the full path.
    - #### **URN (Uniform Resource Name)**:
	    - Another type of URI that is used to identify resources by name in a particular namespace. URNs are intended to be persistent and location-independent.
- ### **Examples**:
    - **URL**: [https://www.example.com/resource/page.html](https://www.example.com/resource/page.html)
    - **URN**: urn:isbn:0451450523 (identifying a book by ISBN)
- ### **Purpose**:
	- URIs are used to uniquely identify and access resources, whether they are web pages, documents, or other entities.
- ### **Components**:
	- URIs typically consist of:
		- **Scheme**: Specifies the type of URI (e.g., http, urn).
		- **Authority**: Often includes domain or address information.
		- **Path**: Identifies the specific resource within the scheme's context.
- ### **URI vs. URL**:
	- While URIs are a broader concept that includes both URLs and URNs, URLs are a specific type of URI that provides both identification and location information.
 -->
- ## DNS
	- Mapping a memorable name to a routable IP Address
		- UDP Based, port 53
	- ### Resource Record
		- A
			- \www.example.com, 8.8.8.8, A, TTL
		- NS
			- \www.example.com, ns1.example.com, NS, TTL
		- CNAME
			- \www.example.com, cname.example.net, CNAME, TTL
	- ### Iterated VS Recursive DNS queries
		- Iterated
			- Exhaustively Iterates through all the DNS servers horizontally and then goes down a level
		- Recursive
			- Server that is queried then takes the responsibility to get a response for the query back to the sender
		
	- ### DNS Caching
		- Iterative Caching
			- Local Machine stores a cache on TLD servers and possible Auth servers
		- Recursive Caching
			- Local machine forwards queries the local nameserver 
	- ### DNS Attacks
	- #### Note that the resolver will accept any query received on the same port, IP and same queryID  
		- 3 Types
			- **Old School: Record Injection**
				- Provide additional info appended with our host IP through our own attacker nameserver
				- Original NS ends up caching this new evil IP
				- No longer works due to Bailiwick Checking
					- Only records related to the requested domain are accepted in responses, DNS servers are less trusting of additional information
			- **Somewhat Old School: Response Spoofing**
			- **New: Kaminsky Attack**
				- AKA DNS Cache Poisoning
				- We do not know the queryID however so we bruteforce the hell out of the server for it
					- Assuming we dont have a connection to the nameserver directly we can send a high volume of DNS queries to a DNS resolver
					- If it is timed well with and reaches before a legitimate DNS query is received by the server our poisoned record is added to the DNS server
				- Version 1
					- Send a query to the NS with the hostname to hijack
					- Flood the network with DNS reply packets 
						- The reply will hold the evilIP but be spoofed as a legit reply from the NS
				- Version 2
					- Run your own NS
					- Request for something unlikely in the cache of other NS
					- Same as V1 but instead of A record replies we give the NS records with glue records with our evilIP
			- Mitigations
				- Randomized query ports
				- Increase the range of the query ports and ID to 2^16

---
# Lecture 3: TCP Attacks
- ## TCP
	- Goal is to ensure reliability
		- Packets are delivered in order and unmodified
		- If packets are lost they are retransmitted
	- IP's are associated with devices and PORTs are associated with OS processes
	- Connection Identifier (16-bit for each)
		- srcIP
		- srcPORT
		- dstIP
		- dstPORT
## TCP Bytestream service
- The applications do **NOT** see:
	- Packet boundaries
	- Retransmissions
- Sometimes packets are out of order
	- Buffer out of order packets
	- Wait for retransmitted first packet

> [!NOTE]
> Skipped TCP handshake, seq and ack numbers as they're covered in TCP Flags
### TCP Flags

Small overview on what flag does what

- Each flag is 6 bits in the TCP Header
- SYN
	- Indicates start of a connection
	- Sender sends an Inital Service Number (ISN)
	- Reciever sends their ISN via a SYN-ACK
- ACK
	- Send to acknowledge the successful receipt of data
	- Also contains the next expected sequence number
- FIN
	- Signal end of connection from both sides
	- ACK to acknowledge the packet is recieved
	- FIN-ACK is sent back to init a conncetion closure from sender side too
	- This is also ACK'ed back and the connection is considered closed by both parties
- RST
	- Forcefully terminate a connection without the 4-way FIN handshake
	- Clears the state of the connection immediately
	- Could also mean an error with the connection
- Extra Flags (Not covered in the course but good to know)
	- URG
		- URGENTLY process the data pointed to by the urg pointer, used for real-time applications
	- PSH
		- PuSH to the application layer as soon as possible, used for real-time applications
## TCP Handshake and ISN Exploit
- #### TCP Handshake
	- ##### SYN Flood
		- **Excessive SYN Packets**: In a SYN flood attack, an attacker sends a massive number of SYN packets to the target server, typically from spoofed IP addresses.
		- **Resource Allocation**: The server, upon receiving each SYN packet, allocates resources and prepares to complete the three-way handshake by sending a SYN-ACK.
		- **Half-Open Connections**: However, the attacker doesn't respond with ACK packets to complete the handshake. Instead, they leave the connections in a half-open state, with the server waiting for acknowledgments that never arrive.
		- **Resource Exhaustion**: As the attacker continues to flood the server with SYN packets, it quickly exhausts its resources, including memory, CPU, and network bandwidth, to handle these half-open connections.
		- **Service Disruption**: Legitimate users attempting to establish connections with the server may experience significant delays or be unable to connect, as the server's resources are tied up dealing with the flood of half-open connections.
	- ##### SYN Cookie
		- **Initial SYN**: When a server receives an initial SYN packet from a client during the three-way handshake, it generates a SYN cookie.
		- **SYN-ACK with Cookie**: Instead of allocating resources and holding open a half-open connection, the server sends a SYN-ACK packet back to the client, but this SYN-ACK contains a SYN cookie.
		- **Client Acknowledgment**: The client, upon receiving the SYN-ACK with the SYN cookie, sends an ACK packet with the cookie back to the server.
		- **Cookie Verification**: The server uses the received cookie to verify the connection request. If the cookie is valid and corresponds to a legitimate request, the server establishes the connection without holding open any additional resources.
		- **Resource Conservation**: If the server determines that the SYN cookie is invalid or expired, it discards the connection attempt. This ensures that the server doesn't waste resources on malicious or incomplete connections.
- ##### Session Hijacking (Mitnick Edition)
	- Kevin Mitnick was able to predict ISNs and hijack a TCP connection between a trusted server and his target application
	- [Case Study - Mitnick TCP Attack](/CySec-2/Case%20Studies/Case%20Study%20-%20Mitnick%20TCP%20Attack.md)

---
