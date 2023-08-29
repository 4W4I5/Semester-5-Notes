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

# Next-Gen attacks
[Case Study - Mirai Malware](CySec-2/Case%20Studies/Case%20Study%20-%20Mirai%20Malware.md)

## Defining Information Security

- Types of information protection
	- **Confidentiality** `How is this dependent on Integrity though`
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


