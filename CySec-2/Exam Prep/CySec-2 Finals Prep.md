>!NOTE
>Following topics are mostly covered from the book first and then the slides
>Status: Ch4 and Ch6 is wip

| Chapter                                      | Status             |
| -------------------------------------------- | ------------------ |
| [CH3.9: VPN](#CH3-9-VPN)                     | :white_check_mark: |
| [CH3.10: SSL/TLS](#CH3.10-SSL-TLS)           | :white_check_mark:                |
| [CH3.11: IPSEC](#CH3.11-IPSEC)               | :white_check_mark:                |
| [CH4: Secure Networks](#CH4-Secure-Networks) | :x:                |
| [CH6: Firewalls](#CH6-Firewalls)             | :x:                |
| CH_UNKNOWN: Threat Intelligence              | :white_check_mark:                |

<!--
:white_check_mark:
:x:
-->

# Cryptographic systems. Ch3.9 to Ch3.11
- Combines cryptographic protections which specialize in Confidentiality, Integrity and Availability.
	- Essentially its a standard/protocol that eliminiates the need for users to understand a specific cryptography.
- Establishing a Cryptographic system
	- Select a Cryptographic standard i.e. SSL/TLS or IPsec
	- Handshaking
		- Stage 1: Negotiation of security methods and options
		- Stage 2: Mutual Authentication (Doesn't have to be)
		- Stage 3: Keying, Secure delivering of keys + secrets
	- Communication stage
# CH3.9: VPN

- Virtual Private Network is created using a cryptographic system to secure comms over an untrusted network (internet, wlan, etc)
- **Advantages**:
	- WANs are expensive to setup so just establish an encrypted tunnel over the untrusted internet to save costs. Also grants mobility through wireless hotspots although it becomes a question of security at that point
		- Also provides secure access to your private network. The goal is to provide access to internal network from the outside i.e from internet to intranet
		- Secure browsing on public networks as your client is connected to a tunnel from within the local net
		- Spoofs regional content restrictions + Disguises your whereabouts
- **Disadvantages**:
	- Slower speed as traffic is routed over a longer route and bandwidth is dependent on the hardware seen on those routes.
	- QoS Challenges, there are no set standards for VPNs to gauge and report the performance of a service/network. As there is nothing of value to analyze you just have to trust the VPN provider to see what might be reliable
	- Most companies/private networks are beginning to block VPN IP addresses. However the VPN hosts also just change their IPs so its an ongoing battle at the moment
	- No cookie protection as that is managed by the browser. Application layer VPN's do support cookie management but it differs from provider-provider
## How does it work?

**Basic Terminology**:

- Client: The user
- Server: The resource user is attempting to access
- VPN Client: The user side of a VPN Tunnel
- VPN Server/Host: The server side of a VPN Tunnel

**Inner Workings**:

- Hides the client IP address by letting the network redirect it thru a specially configured remote VPN server run by the VPN HOST. All comms from this point on are now seen as coming from the VPN Server only as it relays your data onwards with its own assigned IP
- Acts as a scrambler that scrambles all data sent through this VPN 'tunnel'

**Connection Steps**:

- VPN Client initiates a connection to the VPN Server via the internet
- VPN Server requests an authentication. Can be done using tokens, username/passwords, etc
- Upon successful authentication. A VPN Protocol such as OpenVPN, PPTP, L2TP or IPSec is used to setup an encrypted tunnel from VPN CLIENT to VPN SERVER. (NOTE:: NOT THE USER TO THE SERVER THEY ARE TRYING TO ACCESS.)
	- Tunnel: All data sent in the tunnel by either party is decrypted by the receiving party and then forwarded to its intended destination

## Implementations
- **Layer 7 (Better known as Application Layer VPN)**: Operate at application layer. Designed to provide secure access to specific applications or services. Examples include SSL VPN, OpenVPN and SSH VPN
- **Layer 3:** Operate at the network layer. Designed to connect individual devices or remote LANs to a larger network. Examples are IPSec and PPTP
- **Layer 2**: Operate at the datalink layer. Designed to connect two or more remote LANs together over a service provider networks. Examples are MPLS(Multiprotocol Label Switching) and EVPN(Ethernet VPN)

## Types of VPN

NOTE:: assume a Client-Server model.

- **Host to Host VPNs**: Just a single host to a single client over an untrusted network
- **Remote-Access VPN**: Connects a single host to a site network over an untrusted network
- **Site-To-Site VPN**: Protects traffic flowing to and fro a site to site over an untrusted network

### Test your understanding questions from the book

a. **What is a VPN?**

   A Virtual Private Network (VPN) is a technology enabling secure and private communication over a public network, such as the internet.

b. **Why do companies transmit over the Internet?**

   Companies transmit over the internet for cost efficiency, accessibility, and scalability, allowing global communication and data transfer.

c. **Why transmit over untrusted wireless networks?**

   Transmitting over untrusted wireless networks provides mobility, but it introduces security risks. Using a VPN encrypts data and enhances security in such scenarios.

d. **Distinguish between three types of VPNs.**

   - **Remote Access VPNs:** Enable individual users to securely connect to a private network remotely.
   - **Site-to-Site VPNs:** Establish secure connections between different offices or sites of an organization.
   - **Extranet VPNs:** Extend a private network to trusted partners or suppliers.

e. **What does a VPN gateway do for Remote Access VPN?**

   A VPN gateway for remote access VPNs authenticates and authorizes users, providing secure access to the corporate network from external locations.

f. **What does a VPN gateway do for Site-to-Site VPN?**

   In a site-to-site VPN, a VPN gateway at each site establishes and maintains a secure connection, facilitating the transfer of data between interconnected networks.

g. **Which types of VPNs use VPN gateways?**

   Both remote access VPNs and site-to-site VPNs use VPN gateways. Remote access VPNs use a gateway for individual user connections, while site-to-site VPNs use gateways at each participating site for network-to-network connections.

# Ch3.10: SSL/TLS (aka HTTPS from slides)

## Web Security Considerations

Basic stuff on why to use https and not http anymore

![](Pasted%20image%2020231216180329.png)

## SSL (Secure Socket Layer)
- Most widely used security service.
	- AKA TLS which is SSL's successor
	- Defines how 2 entities i.e. a client and a server communicate with each other securely.
- The layer it works at is a bit of a grey area as it is below the application layer but above the transport layer.
	- Some classify it as its own layer known as the socket layer. Others see it as merely working in a sublayer of the transport layer which is where it gets the name of TLS. But essentially the data from Applications is sent to a Socket which is opened using the Transport layer is what i've used to understand its locality relative to other layers
- **Advantages:**
	- As it works at the transport layer it can protect application layer messages via encapsulation however it only does so with applications that are SSL/TLS aware as this method of protection is not transparent
	- Inexpensive as all browsers now incorporate SSL/TLS
	- A Remote access vpn is configured by using a host-host approach using SSL/TLS Gateways
		- This allows all site traffic to be routed through a single SSL Endpoint effectively using the host-host vpn to provide remote access
### SSL Layers

SSL itself has 2 sublayers to consider

- ###### Handshake Layer(Protocol)
	- **Terminology:**
		- **Connection:** A live communication channel
		- **Session:** A set of cryptography parameters, can be reused in another connection or renewed without interrupting connection. Session state is defined by the record layer
			- Session state holds
					    - Session identifier, a random number
					    - Peer certificate, x509.v3 cert. can be null
					    - Compression method, algo used
					    - Cipher Spec, bulk data encryption and hashing algo used
					    - Master Secret, 48byte shared b/w client and server
					    - IsResumeable, flag that indicates whether session can be used to initiate new connections
	- **Functionality:**
		- Manages the authentication, key exchange, and negotiation of cryptographic parameters between the client and server.
		- Establishes a secure communication channel before data exchange begins.
	- **Protocols used: **
		- Handshake protocol, 1 byte for type, 3 bytes for length and content is optional
		- Change cipher spec, 1 byte for type
		- Alert, 1 byte for level, 1 byte for alert
	- **Steps in the Handshake:**
		1. **Name Resolution:** The client resolves the domain name of the server to obtain its IP address.
		2. **Initiating a TCP Connection (1st Step of 3-Way Handshake):** The client initiates a TCP connection with the server by sending a TCP SYN (synchronize) packet.
		3. **Server Response (2nd Step of 3-Way Handshake):** The server responds to the client's SYN with a SYN-ACK (synchronize-acknowledge) packet, indicating its willingness to establish a connection.
		4. **Client Acknowledgment (3rd Step of 3-Way Handshake):** The client acknowledges the server's response by sending an ACK (acknowledge) packet, completing the three-way handshake. At this point, a TCP connection is established between the client and the server.
		5. **ClientHello Message:** The client sends a "ClientHello" message to the server, indicating the start of the SSL handshake process. This message includes information about the SSL/TLS versions supported by the client, sessionID, and a list of supported cryptographic algorithms(Cipher).
		6. **ServerHello Message:** The server responds with a "ServerHello" message, selecting the highest SSL/TLS version that both the client and server support. The server also sends the selected Cipher along with its own sessionID and chooses the cryptographic algorithms for the session.
		7. **Certificate Verification (if required):** If the server requests client authentication or if the client requires the server's identity, the server sends its digital certificate to the client. The certificate includes the server's public key.
		8. **Key Exchange:**  The server and client exchange key information, typically using asymmetric key exchange mechanisms like RSA or Diffie-Hellman.  The key information exchanged will be used to derive the symmetric session key for data encryption.
		9. **Finished Messages:** Both the client and server send "Finished" messages to confirm that the handshake process is complete. The messages are encrypted using the negotiated parameters, providing assurance that the handshake was not tampered with during transmission.
		10. **Establishment of Encrypted Session:** The SSL/TLS connection is established, and subsequent data exchanged between the client and server is encrypted using the derived session key.
			- **Key Material Generation:**  Generates key material for subsequent data encryption using negotiated algorithms.
			- **Secure Session Establishment:** Completes with the establishment of a secure session, allowing encrypted data exchange.
- ###### Record Layer(Protocol)
	- **Terminology:**
		- **Functionality:**
		    - Responsible for the fragmentation, compression (optional), and encryption of data.
			    - Provides Confidentiality and Message Integrity
				    - Confidentiality by defined a shared secret key that is used for conventional encryption of SSL payloads
				    - Integrity is done through the handshake protocol that also defines a shared key that is used to form a message authentication code (MAC)
		    - Operates at the transport layer of the OSI model.
		    - Divides the data into manageable blocks, adds headers, and then encrypts the resulting SSL record.
		- **Encryption:**
		    - Utilizes symmetric key cryptography (e.g., using the negotiated session key) for data encryption.
		    - Ensures confidentiality and integrity of the transmitted data.
		- **Fragmentation:**
		    - Splits larger messages into smaller fragments to fit within the constraints of the underlying transport layer protocol (e.g., TCP).
		    - Usually into fragments smaller than 16kb
		- **Compression (Optional):**
		    - SSL allows for optional data compression to optimize bandwidth usage, though this is not always used due to vulnerabilities associated with certain compression methods.
		    - Not used in SSLv3.0
		- **Hashing:**
		    - Calculate a MAC by using a hashfunction with the secret key, primary data, padding, sequence number as args
		    - Can be calculated by either client/server
		    - Integrity is checked here as a hash mismatch would mean that the message has been modified
		    - Hash functions used
			    - NULL. Message is not authenticated/verified for integrity
			    - MD5. 125 bit
			    - SHA1. 160 bit
		- **Header Format:**
		    - Includes information like content type, version, length, and a MAC (Message Authentication Code) for integrity.
		    - MAC can be 0, 16 or 20 bytes
	- **Operation:**
		- Payload from upper protocol i.e. application layer
		- Fragment the payload
		- Compress (Optional)
		- Hashing with a constant value + authkey is used to generate a MAC (Message Authentication Code)
		- Encryption using the encryption key
		- Encrypted fragment generated from encryption is the SSL payload that is sent after being attached with the SSL Header
- ###### Change Cipher Spec Protocol
	- Consists of a single message in the SSL Header that the peer wants to renew the session
- ###### Alert Protocol
	- Used to notify a change of status or an error condition to the peer(sender)
	- Most common types are:

| Value | Description            | Meaning                                 |
| ----- | ---------------------- | --------------------------------------- |
| 0     | CloseNotify            | Sender will not send any more messages  |
| 10    | UnexpectedMessage      | Inappropiate message recived            |
| 20    | BadRecordMAC           | Incorrect MAC recieved                  |
| 30    | DecompressionFailure   | Unable to decompress appropiately       |
| 40    | HandshakeFailure       | Sender Unable to finalize the handshake |
| 41    | NoCertificate          | Client has no cert to send              |
| 42    | BadCertificate         | Recieved Certificate was corrupted      |
| 43    | UnsupportedCertificate | Type of recieved cert is not supported  |
| 44    | CertificateRevoked     | Singer has revoked the cert             |
| 45    | CertificateExpired     | Cert has expired                        |
| 46    | CertificateUnknown     | Unknown cert was recieved               |
| 47    | IllegalParameter       | Out of range or inconsistent field                                        |

## HTTPS (Hypertext Transfer Protocol Secure)

HTTP over SSL

- Known when in use if the URL starts with HTTPS:// instead of HTTP://
- Following elements are encrypted
	- URL of the requested document
	- Contents of the document
	- Contents of browser forms
	- Cookies sent to and from the server and browser
	- Contents of HTTP header
- Connection Closure
	- An unannounced TLS Closure will signify some sort of attack prompting the https client to issue a security warning
	- TLS Implementations must init an exchange of closure alerts before closing a connection
		- An incomplete close can work as well where after sending the alerts, the connection is immediately closed
	- Closure of an HTTPS connection requires TLS to first close the connection with the peer's TLS entity. This involves closing the underlying TCP connection i.e starting the 4 way FIN handshake

### Test your understanding questions from the book

**a. At what layer does SSL/TLS operate?**

- SSL/TLS operates at the **Transport Layer**.

**b. What types of applications can SSL/TLS protect?**

- SSL/TLS can protect various applications, including web browsers, email clients, and other **network-based applications**.

**c. What are the two commonly used SSL/TLS-aware applications?**

- Two commonly used SSL/TLS-aware applications are **web browsers and email clients**.

**d. Why is SSL/TLS popular?**

- SSL/TLS is popular due to its ability to provide **secure communication over the Internet** by encrypting data and ensuring the integrity of transmitted information.

**e. Distinguish b/w SSL/TLS**

1. **SSL (Secure Sockets Layer):**

    - SSL was the original cryptographic protocol developed by Netscape to secure communication over the internet.
    - SSL versions include SSL 1.0, SSL 2.0, and SSL 3.0 (which had vulnerabilities leading to discontinuation).
2. **TLS (Transport Layer Security):**

    - TLS is the successor to SSL and was introduced to address the vulnerabilities found in SSL 3.0.
    - TLS versions include TLS 1.0, TLS 1.1, TLS 1.2, TLS 1.3 (latest version as of my last knowledge update).

**Key distinctions:**

- TLS is considered the more secure and modern version.
- While SSL and TLS share similarities, they are not directly interoperable due to differences in their cryptographic algorithms and protocols.
- TLS is backward-compatible with SSL, but it's recommended to use the latest versions for security reasons.

**f. For what type of VPN was SSL/TLS developed?**

- SSL/TLS was initially developed to provide secure communication over the internet for web browsers and servers. It was designed to secure HTTP connections, leading to the "https://" protocol widely used for secure browsing.

**g. For what type of VPN is SSL/TLS being increasingly used?**

- SSL/TLS is increasingly being used in SSL VPNs (Secure Sockets Layer Virtual Private Networks).
- SSL VPNs provide a secure way for users to connect to a private network over the internet using a web browser. They often operate at the application layer and allow secure access to specific applications, services, or resources.
- SSL/TLS, being the underlying protocol for secure web communication, is well-suited for SSL VPNs. This approach provides a user-friendly and versatile way for remote users to access corporate resources securely without the need for specialized client software.
---
#### More questions

**a. SSL/TLS was created for host-to-host (browser–webserver) communication. What device can turn SSL/TLS into a remote access VPN?**

SSL/TLS can be turned into a remote access VPN through the use of SSL/TLS VPN concentrators or gateways.

**b. In SSL/TLS remote access VPNs, to what device does the client authenticate itself?**

In SSL/TLS remote access VPNs, the client authenticates itself to the SSL/TLS VPN gateway.

**c. When a remote client transmits in an SSL/TLS VPN, how far does confidential transmission definitely extend?**

Confidential transmission in an SSL/TLS VPN definitely extends up to the SSL/TLS VPN gateway.

**d. What three services do SSL/TLS gateways commonly provide?**

SSL/TLS gateways commonly provide encryption, authentication, and integrity services.

**e. What is webification?**

Webification refers to the process of adapting applications or services to be accessible and usable through a web interface.

**f. What software does the client need for basic SSL/TLS VPN operation?**

For basic SSL/TLS VPN operation, the client needs a web browser.

**g. For what purposes may the client need additional downloaded software?**

The client may need additional downloaded software for purposes such as enhanced security features, client customization, or additional functionality beyond basic SSL/TLS VPN capabilities.

**h. Why installing the additional downloaded software on the browser may be problematic?**

Installing additional downloaded software on the browser may be problematic due to compatibility issues, security concerns, and potential conflicts with existing browser extensions or settings.

**i. Why is SSL/TLS attractive as a remote access VPN technology?**

SSL/TLS is attractive as a remote access VPN technology due to its widespread support, ease of use, and the ability to establish secure connections without requiring specialized client software.

**j. What problems do companies face if they use it as a remote access VPN technology?**

Companies using SSL/TLS as a remote access VPN technology may face challenges related to limited control over endpoint security, potential vulnerabilities in the SSL/TLS protocol, and the need for continuous monitoring of evolving security threats.

**k. Which of the three types of VPNs can SSL/TLS support?**

SSL/TLS can support remote access VPNs.

# Ch3.11: IPSEC
## VPN vs IPSEC

| VPN                                                                         | IPSEC                                                                                                           |
| --------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Create a private network over a public network                              | Provide Security for IP traffic using a suite of protocols that manage authentication, encrypiton and integrity |
| Uses Encryption + Tunneling to create a secure connection b/w two endpoints | Uses multiple protocols                                                                                         |
| Provide remote access to a network / Connect multiple networks together     | Secure individual network connections i.e. b/w two routers or a router to a remote user                         |
| Uses IPSEC, SSL/TLS, or PPTP etc                                            | Used for IP, TCP/UDP and ICMP                                                                                   |
| Can be site-site, host-host or remote access                                | Can be used in transport/tunnel mode                                                                            |
| Operates at application(OPENVPN), network(IPSEC) or data link layer(MPLS)   | Operates at the network layer and is transparent                                                                                  |

### Modes of operation
- ###### Transport Mode
	- Simply encrypt the payload but not the headers
	- Provides protection for upper layer protocols
	- Used for end to end communication b/w two hosts
	- IP Header remains untouched, just a IPSec header is attached alongside it
	- Preserves Original Src/Dest IP addresses
	- Used for host to host or host to gateway scenarios
	- Lower overhead as original IP header is modified
- ###### Tunnel Mode
	- Encrypt the payload and the headers
	- Provides protection for the entire IP packet. Additional headers known as the IPSEC Header and the new IP Header is attached alongside the encrypted contents
	- Used for site to site comms, securing comms b/w gateways
	- Src/Dest IP addresses maybe changed using this mode
	- Higher IP overhead as a new IP header is added
	- Number of hosts behind firewalls can use secure comms without implementing IPSec?

### Protocols used

Both have different behaviors when used in Transport/Tunnel Modes

- ###### Authentication Header (AH)
	- **Transport Mode:** Will authenticate IP, TCP, IP Payload and AH Header
	- **Tunnel Mode**: Will authenticate IP, TCP, IP Payload, AH Header and the new IP header
- ###### Encapsulating Security Payload (ESP)
	- **Transport Mode:** Encrypts TCP, IP Payload, ESP Trailer + Authenticates ESP Header + Appends ESP Auth (Optional). IP header is not encrypted
	- **Tunnel Mode**: Encrypts IP, TCP, IP Payload, ESP Trailer + Authenticates ESP Header + Appends ESP Auth (Optional).

#### Practice questions
##### a. Distinguishing between Transport and Tunnel Modes in IPsec for Packet Protection:

**Transport Mode:**

- **Scope:** Protects communication between individual hosts.
- **Header Modification:** Only the payload is encrypted and/or authenticated.
- **Header Overhead:** Lower overhead as only the original IP header is modified.
- **Address Translation:** Source and destination IP addresses are preserved.
- **Encapsulation:** Only the payload is encapsulated and encrypted.

**Tunnel Mode:**

- **Scope:** Designed for securing communication between networks or subnets.
- **Header Modification:** Both the entire original IP packet (including header) and payload are encrypted and/or authenticated.
- **Header Overhead:** Higher overhead as a new IP header is added.
- **Address Translation:** Source and/or destination IP addresses may be changed.
- **Encapsulation:** Both the original IP packet and payload are encapsulated and encrypted.

##### b. Attractions of Each Mode:

**Transport Mode:**

- Efficient for securing communication between individual devices.
- Lower overhead, making it suitable for scenarios where minimizing packet size is crucial.
- Preserves original source and destination IP addresses.

**Tunnel Mode:**

- Ideal for creating secure connections between entire networks or subnets.
- Comprehensive protection by encrypting the entire original IP packet.
- Allows for address translation, facilitating secure communication between networks with different address spaces.

##### c. Problematic Issues of Each Mode:

**Transport Mode:**

- Limited to securing communication between hosts, may not be suitable for network-level protection.
- May face challenges when dealing with address translation requirements for network scenarios.

**Tunnel Mode:**

- Higher overhead due to the addition of a new IP header, which can impact performance in certain situations.
- Address translation complexities, especially when dealing with different addressing schemes between connected networks.
---
# Ch4: Secure Networks

Cryptography provides C.I.A.

- Modern networks have additional vulns
- Delivering messages can be slowed/stopped/altered
- Route the messages take can be altered i.e be redirected to false recipients
- Attackers could gain access to comms channels that were previously considered closed and confidential

Goals of creating secure networks

- Ensuring availability means that authorized users have access to info, services and resources. DOS attack is most common against this
- Ensuring confidentiality means preventing unauthorized users from gaining information about the networks' structure, the data flowing in and out of the network etcetc
- Ensuring functionality
## 4.1 Network Models

- **Castle**
- **City**
## 4.2 DOS Attacks
## 4.3 ARP Poisoning
## 4.4 Access Control for Networks
## 4.5 Ethernet Security
## 4.6 Wireless Security
---
# Ch6: Firewalls
## 6.1 Introduction
## 6.2 Static Packet Filtering
## 6.3 Stateful Packet Inspection
## 6.4 Network Address Translation
## 6.5 Application Proxy Firewalls
## 6.6 Intrusion Detection Systems
## 6.7 Antivirus Filtering and Unified Threat Management
## 6.8 Firewall Architectures
## 6.9 Firewall Management
## 6.10 Firewall Filtering Problems

---
# Unknown: Threat Intelligence
- Any data that helps us better understand threats and adversaries
- A TIP is a platform that gathers, aggregates and organizes threat intelligence data from multiple sources and formats

## TTP (Tactics, Techniques and Procedures)
- MITRE came up w this
	- **Tactic:**  Adversary's tactical goal i.e. the reason for performing the attack
	- **Technique**: These are specific methods or actions used by Threat Actors(TA) to achieve the objectives defined under each tactic i.e. the name of the attack
	- **Procedure**: Detailed procedures/Instructions to execute the technique. Carrier method used to execute the payload
		- Example: Phishing someone would entail a Tactic to gain initial access to a network to perform the Phishing Technique using a procedure of Sending an email
## Threat intelligence platforms
### Establishing a Threat Intelligence Platform (TIP):

1. **Define Objectives:**
    - Clearly define the objectives of your Threat Intelligence Platform. Understand the specific needs of your organization, such as the types of threats you want to monitor and the level of integration with existing security infrastructure.
2. **Select Appropriate Technology:**
    - Choose a TIP solution that aligns with your organization's goals. Consider factors such as scalability, ease of integration, support for standard threat intelligence formats (STIX/TAXI), and the ability to aggregate, correlate, and analyze threat data.
3. **Data Sources Integration:**
    - Integrate various data sources into the TIP. This can include open-source feeds, commercial threat intelligence feeds, information from government agencies, and internal sources. Ensure that the TIP can handle both structured and unstructured threat data.
4. **Automated Data Ingestion:**
    - Implement mechanisms for automated data ingestion. A well-designed TIP should be able to ingest data in real-time or near real-time, allowing for timely analysis and response to emerging threats.
5. **Normalization and Enrichment:**
    - Normalize and enrich incoming threat data to ensure consistency and completeness. This involves standardizing data formats and enhancing information with additional context, such as geolocation, threat actor details, or historical data.
6. **Data Analysis and Correlation:**
    - Implement analytics and correlation capabilities to identify patterns, trends, and potential threats. This involves analyzing relationships between different indicators of compromise (IOCs) and understanding the tactics, techniques, and procedures (TTPs) of threat actors.
7. **Integration with Security Infrastructure:**
    - Integrate the TIP with existing security infrastructure, including Security Information and Event Management (SIEM) systems, firewalls, endpoint protection, and incident response tools. This facilitates automated responses to detected threats.
8. **User Interface and Reporting:**
    - Develop a user-friendly interface for security analysts to interact with the TIP. Provide reporting and visualization tools to help analysts understand and communicate threat intelligence effectively.
9. **Training and Documentation:**
    - Train security personnel on using the TIP effectively. Provide comprehensive documentation to ensure proper usage, maintenance, and troubleshooting.
10. **Continuous Improvement:**
    - Establish processes for continuous improvement. Regularly update the TIP with the latest threat intelligence feeds, refine correlation rules, and adapt to evolving threat landscapes.
### Differences from Other Security Solutions + what to look for:
- **Automation**:
	- A TIP can spare analysts from alert fatigue and give security teams time and info necessary to make advanced judgement calls on CT
	- Laborious or repetitive processes that involve massive amounts of data are fully automated i.e removing duplicates, enrichment, consolidating data into a single format.
	- Workflows are also automated and scalable to meet demands against unknown threats
- **Focus on Threat Intelligence:**
    - TIPs are specifically designed to aggregate, analyze, and disseminate threat intelligence. They focus on understanding the tactics, techniques, and procedures (TTPs) of adversaries.
- **Aggregation of External Data:**
    - TIPs heavily rely on external threat data sources, including open-source feeds, commercial feeds, and information shared by the global security community.
	    - Sources include open source, 3rd party paid, government, Trusted Sharing Communities ISACs and Internal sources
- **Normalization and Enrichment of Data**:
	- Processing includes several steps but the general workflow is to;
		- Normalize: Consolidate data across different formats
		- De-Duplicate: Remove duplicate information
		- Enrichment: Remove false positives, scoring of indicators and addition of context such as geolocation of an IOC that has a IP address associated with it
- **Integration with Security Infrastructure:**
    - TIPs integrate with existing security infrastructure to enhance detection and response capabilities. They provide actionable intelligence to other security solutions.
	    - Possible integrations are
		    - SIEM
		    - Endpoint
		    - Firewall
		    - IPS
- **Analytical Capabilities:**
    - TIPs offer advanced analytics and correlation features to identify patterns and relationships within threat data. They go beyond basic event correlation provided by typical SIEM solutions.
- **Community Collaboration:**
    - TIPs often support collaboration with external threat intelligence communities, allowing organizations to share and receive intelligence with trusted partners.
    - TIPs adhere to standard threat intelligence formats (STIX/TAXI) to facilitate interoperability and sharing of threat data across organizations.
	    - STIX(Structured Threat Information eXpression) - Standardized language by MITRE and OASIS CTI to describe CTI
	    - TAXII(Trusted Automated eXchange of Intelligence Information) - Framework that defines how CTI in STIX format can be shared via services/message exchanges
		    - Defines three principal models
			    - Hub and Spoke: One repo of information
			    - Source/Subscriber: One single source of information
			    - Peer-to-Peer: Multiple groups sharing information with each other
		    - Uses four services
			    - Discovery: Learn what services an entity supports and how to interact with them
			    - Collection Management: Learn about and request subscriptions to collect data
			    - Inbox: Receive Content
			    - Poll: Request Content
### Understanding observables:
- Observables are measurable raw data that can point to be an IOA or an IOC upon further analysis
- Indicators of Compromise (IOC): They are known observables left behind after an attack. These can be signs of ports/Network addresses being enumerated
	- These help to detect and respond to security incidents by identifying known malicious indicators
	- Some more examples can be the following:
		- Unusual traffic to and from the network
		- Unknown files, applications, processes in the system
		- IP addresses and domains that are flagged as botnet or malware C2 servers within the network
		- Significant number of accesses to one file
		- Data transfer over rarely used ports
		- Attack signature or file hash that belongs to a known piece of hardware
- Indicators of Attack (IOA): They are known observables that are picked up during the attack. This can be files downloaded that have a hash value that is not saved in the CTI database or one that has a malicious match with a stored hash
	- These focus more on the methods and tactics employed by attackers rather than specific IOC's


# CTI VS SIEM

|Feature|Cyber Threat Intelligence (CTI)|Security Information and Event Management (SIEM)|
|---|---|---|
|**Primary Function**|Provides in-depth insights into cyber threats, including the motives, methods, and indicators of malicious activities.|Centralizes the collection, analysis, and correlation of security events and log data from various sources.|
|**Focus**|Emphasizes understanding and proactively addressing threats through intelligence gathering and analysis.|Focuses on real-time monitoring, detection, and response to security events and incidents.|
|**Data Sources**|Gathers data from various external and internal sources, including open-source intelligence, threat feeds, and incident reports.|Collects and analyzes data from logs, network traffic, and other security-related events generated by systems and applications.|
|**Contextual Analysis**|Provides context around threats, including attribution, tactics, techniques, and procedures (TTPs) used by threat actors.|Correlates data from diverse sources to identify patterns and anomalies, offering a broader view of the security landscape.|
|**Use Cases**|Helps organizations understand potential threats, vulnerabilities, and risks to enhance overall cybersecurity posture.|Enables real-time monitoring, incident detection, investigation, and response to security incidents.|
|**Integration with Tools**|Integrates with various security tools and platforms to consume, analyze, and disseminate threat intelligence effectively.|Integrates with a wide range of security technologies, including firewalls, antivirus solutions, and endpoint protection tools.|
|**Proactive vs Reactive**|Primarily proactive, aiding in the anticipation and prevention of cyber threats based on intelligence and analysis.|Reactive, focusing on detecting and responding to security incidents as they occur.|
|**Time Horizon**|Involves strategic planning and long-term analysis to anticipate future threats and trends.|Emphasizes real-time or near-real-time analysis for immediate threat detection and response.|
|**Operational Impact**|Influences strategic decision-making and enhances overall security posture.|Provides real-time visibility into security events, aiding in the rapid response to incidents and minimizing impact.|
|**Maturity Level**|Typically associated with advanced cybersecurity programs, requiring a mature security infrastructure.|Integral to security operations, applicable to organizations of varying maturity levels.|
|**Continuous Improvement**|Requires ongoing updates and adjustments based on evolving threat landscapes and intelligence sources.|Involves continuous refinement of correlation rules, incident response processes, and log sources for optimal performance.|

## Threat data sources at a glance

|Feature|MISP (Malware Information Sharing Platform & Threat Sharing)|MITRE ATT&CK|AlienVault OTX|Social Media|Third-Party Premium Feeds|Threat Sharing Groups|Open Source Analysis Platforms|Community Knowledge Bases|
|---|---|---|---|---|---|---|---|---|
|**Type**|Threat intelligence platform for sharing structured threat information.|Knowledge base of adversary tactics, techniques, and procedures.|Open Threat Intelligence platform for sharing threat data.|Information shared on social media platforms.|Commercial feeds providing premium threat intelligence.|Platforms facilitating the sharing of threat information among organizations.|Platforms for analyzing and visualizing threat data.|Collaborative databases created and maintained by the security community.|
|**Data Shared**|Structured threat information, including indicators of compromise (IOCs), attributes, and relationships.|Adversary techniques, tactics, and procedures (TTPs) mapped to the cybersecurity kill chain.|Indicators of compromise (IOCs) shared by the community.|Unstructured information, discussions, and indicators shared by users.|Premium, curated threat intelligence feeds often with indicators, signatures, and contextual information.|IOCs, TTPs, and contextual information shared among trusted groups.|Tools for analyzing and visualizing threat data, facilitating investigations.|Collective knowledge, including insights into threats, vulnerabilities, and mitigation strategies.|
|**Focus**|Collaborative sharing and analysis of structured threat data.|Understanding and mapping adversary behavior for defense strategies.|Crowdsourced threat intelligence sharing platform.|Informal discussions, trends, and potential threats on social platforms.|High-quality, curated intelligence often covering a broad range of threats.|Collaborative sharing of threat information among trusted peers.|Analyzing and visualizing threat data to extract insights.|Collective expertise to improve overall cybersecurity awareness.|
|**Use Cases**|Enhancing threat intelligence capabilities through collaborative analysis.|Informing defense strategies based on known adversary tactics and techniques.|Accessing and contributing threat data in a collaborative environment.|Monitoring informal discussions and identifying potential threats.|Augmenting security defenses with high-quality, timely intelligence.|Leveraging shared threat data for improved situational awareness.|Analyzing and visualizing data for investigations and decision-making.|Gaining insights into threats and vulnerabilities from a diverse community.|
|**Integration with Tools**|Integrates with various security tools and platforms for automated information sharing.|Provides a framework for mapping and integrating with security tools and platforms.|Integrates with security solutions through APIs and direct integrations.|Requires manual monitoring or integration with social media monitoring tools.|Integrated into security solutions such as SIEMs and threat intelligence platforms.|May integrate with security tools for automated sharing and analysis.|Offers APIs and integrations with security tools for data analysis.|Integration with security tools and platforms for improved defense.|
|**Community Involvement**|Global community involvement in sharing and analyzing threat data.|Active engagement from the cybersecurity community in contributing and using the framework.|Community-driven contributions to threat data with a global user base.|Varied participation levels, including security professionals, researchers, and enthusiasts.|Typically subscription-based services with contributions from security experts.|Participation from organizations and individuals in sharing threat information.|Collaboration among security professionals and analysts in analyzing threat data.|Open collaboration with contributions from security experts worldwide.|