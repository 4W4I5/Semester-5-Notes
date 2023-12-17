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
- Function of a firewall is to stop provable attack packets

### Book Questions
- **What is a pass/deny decision?**
	- A pass/deny decision refers to the firewall's determination of whether to allow or deny a packet based on its defined security rules. If the packet matches an allowed rule, it is passed; otherwise, it is denied.
- **What type of packet does a firewall drop and log?**
	- Firewalls typically drop and log packets that violate security policies, such as those originating from suspicious sources, containing malicious content, or attempting to exploit vulnerabilities.
- **What does the firewall do about packets that it suspects (but cannot prove) are attack packets?**
	- In cases where the firewall suspects but cannot conclusively prove that a packet is part of an attack, it may take predefined actions, such as dropping the packet, logging the event, or triggering additional security measures.
- **Why does the firewall log information about dropped packets?**
	- Logging information about dropped packets is crucial for cybersecurity analysis and incident response. It provides insights into potential threats, helps in identifying attack patterns, and aids in the investigation of security incidents.
- **Distinguish between border firewalls and internal firewalls.**
	- Border firewalls are positioned at the network perimeter, controlling traffic entering or leaving the organization. Internal firewalls, on the other hand, are deployed within the internal network to segregate and control traffic between different segments.
- **Distinguish between ingress and egress filtering.**
	- Ingress filtering involves examining and controlling incoming traffic entering a network, while egress filtering focuses on outgoing traffic leaving the network. Both are crucial for enforcing security policies and preventing unauthorized access or data exfiltration.
	- - **What does a firewall do if it cannot keep up with the traffic volume?**
	- If a firewall cannot keep up with the traffic volume, it may resort to actions such as dropping packets or slowing down the inspection process to manage the load.
- **Why is this action good?**
	- Slowing down the inspection process or dropping packets in the face of overwhelming traffic can prevent the firewall from becoming a bottleneck, ensuring that some level of network functionality is maintained during high-volume periods.
- **Why is this action bad?**
	- The downside of slowing down or dropping packets is that it may result in reduced security, as the firewall might miss or inadequately analyze certain packets, potentially allowing malicious content or attacks to pass through.
- **Why can a firewall keep up with traffic in general but fail to do so during a major attack?**
	- During a major attack, the volume of incoming traffic significantly increases, overwhelming the firewall's processing capabilities. The firewall may struggle to analyze each packet thoroughly, leading to potential performance degradation or failure.
- **As processing power increases in the future, what will this mean for firewall filtering?**
	- With increased processing power in the future, firewalls will likely be able to handle higher volumes of traffic more efficiently. This can lead to improved filtering capabilities, enhanced threat detection, and better overall network security.
- **What is unified threat management (UTM)?**
	- Unified Threat Management (UTM) refers to a comprehensive security solution that integrates multiple security features into a single platform. It typically includes functions such as firewall, antivirus, intrusion detection and prevention, VPN, content filtering, and more.
- **What does it mean that a firewall should operate at wire speed?**
	- Operating at wire speed means that the firewall can process and analyze network traffic at the same rate as the maximum data transfer speed of the network. This ensures minimal impact on network performance and allows the firewall to keep up with the data flow without introducing delays.
- **Is there only one firewall filtering mechanism; state the other methods?**
	- No, there are multiple firewall filtering mechanisms. Apart from stateful packet inspection (SPI), other methods include proxy-based filtering, application-layer filtering, packet filtering, and deep packet inspection (DPI).
- **What filtering mechanisms do almost all main border firewalls use?**
	- Almost all main border firewalls use a combination of filtering mechanisms to enhance security. This typically includes stateful packet inspection (SPI), packet filtering, and application-layer filtering. The specific combination may vary based on the firewall implementation and its capabilities.
- **Do SPI firewalls only do stateful packet inspection?**
	- No, while stateful packet inspection (SPI) is a fundamental feature of SPI firewalls, they may also incorporate additional filtering mechanisms. SPI firewalls often combine stateful inspection with other techniques to provide more robust protection, such as application-layer filtering and intrusion detection/prevention.
## 6.2 Static Packet Filtering
### Book Questions
- **What are the two limitations of static packet filtering? Explain why each limitation is bad.**
	- **Limitation 1: Lack of State Awareness**
	  - *Explanation:* Static packet filtering lacks the ability to maintain awareness of the state of active connections. It evaluates each packet in isolation without considering the context of the entire communication session.
	  - *Why it's bad:* This limitation can lead to security vulnerabilities as it may allow packets that, when considered individually, seem harmless but are part of a malicious sequence or attack.
	- **Limitation 2: Limited Application-Layer Filtering**
	  - *Explanation:* Static packet filtering primarily operates at the network layer and lacks the ability to inspect and filter based on the content or characteristics of specific applications.
	  - *Why it's bad:* Modern threats often exploit application-layer vulnerabilities. The inability to inspect and filter at the application layer limits the firewall's effectiveness in detecting and preventing certain types of attacks.
- **For what two reasons do companies not use static packet filtering as the main filtering mechanism in border firewalls today?**
	- **Reason 1: Lack of Granularity**
	  - *Explanation:* Static packet filtering lacks the granularity needed for effective security. It relies on simple rules based on source and destination addresses, ports, and protocols, making it less capable of dealing with complex threats.
	  - *Reason:* Companies avoid relying solely on static packet filtering because of its inability to provide the granular control necessary to combat sophisticated and targeted attacks.
	- **Reason 2: Inadequate Protection Against Evolving Threats**
	  - *Explanation:* Static packet filtering struggles to keep up with the dynamic and evolving nature of modern cybersecurity threats. It may not adequately address advanced threats that use complex tactics.
	  - *Reason:* Given the constantly changing threat landscape, organizations prefer more advanced filtering mechanisms that can adapt to new attack methods and provide better protection.
- **In what two secondary ways do corporations sometimes use static packet filtering?**
	- **Secondary Use 1: Complementary Layer of Security**
	  - *Explanation:* Corporations may use static packet filtering as a complementary layer of security alongside more advanced filtering mechanisms. It can serve as an additional barrier to basic threats.
	  - *Use:* While not the primary filtering mechanism, static packet filtering can add an extra layer of protection, especially for known and straightforward threats.
	- **Secondary Use 2: Resource-Efficient Filtering for Certain Scenarios**
	  - *Explanation:* In situations where resource efficiency is critical, corporations may employ static packet filtering for its simplicity and minimal impact on performance.
	  - *Use:* In specific scenarios, such as resource-constrained environments or specific network segments, static packet filtering may be used for basic filtering without the overhead associated with more complex methods.

## 6.3 Stateful Packet Inspection
### Book Questions
- **What is a state?**
  - A state refers to the current condition or stage in the ongoing process of communication between devices. In the context of stateful packet inspection, it involves the tracking of the state of active connections to understand the context of network traffic.
- **Are most packets part of the connection-opening state or the ongoing communication state?**
  - Most packets are part of the ongoing communication state. Once a connection is established, the majority of packets exchanged between devices are part of the ongoing communication, rather than the connection-opening state.
- **Why is the answer to Question 5b important for stateful packet inspection’s efficiency?**
  - The answer to Question 5b is crucial for stateful packet inspection's efficiency because it helps the firewall focus its resources on monitoring and analyzing the ongoing communication state. By recognizing that most packets belong to the ongoing state, the firewall can optimize its processes for established connections, enhancing overall efficiency.
- **What is a connection?**
  - A connection refers to the established and maintained communication link between two network devices. It involves the exchange of data between these devices through a specific set of protocols and rules.
- **How is a connection between two programs on different computers represented?**
  - A connection between two programs on different computers is typically represented by a combination of source and destination IP addresses, port numbers, and the transport layer protocol (TCP or UDP). This combination forms a unique identifier for the connection, allowing devices to track and manage ongoing communication.
  - - **Give the simple stateful packet inspection firewall rule for packets that do not attempt to open connections.**
  - Simple stateful packet inspection firewall rule: Allow packets that are part of established connections and deny packets that do not match any established connection state.
- **Is SPI filtering for packets that are part of ongoing communications usually simple and inexpensive? Explain.**
  - Yes, SPI filtering for packets that are part of ongoing communications is generally simple and inexpensive. Once a connection is established, the firewall has already inspected and permitted the initial connection-opening packets. Subsequent packets in the ongoing communication are typically allowed based on the established state, making the process more straightforward and resource-efficient.
- **UDP is connectionless. How is it possible for an SPI firewall to handle UDP connections?**
  - While UDP is connectionless, stateful packet inspection (SPI) firewalls can handle UDP connections by tracking the state of active UDP sessions. The firewall monitors the UDP packets to identify those associated with existing connections based on source and destination IP addresses and port numbers. Although UDP doesn't have a formal connection establishment process, SPI firewalls maintain a table of active UDP sessions to allow for the inspection and filtering of UDP traffic based on established states.
  - - **For stateful packet inspection firewalls, what do ingress ACLs permit in general?**
  - In general, ingress ACLs in stateful packet inspection firewalls permit incoming packets that are part of established and allowed connections.
- **What do egress ACLs disallow in general in SPI firewalls?**
  - Egress ACLs in stateful packet inspection firewalls generally disallow outgoing packets that do not match any established connection state or violate security policies.
- **What do well-known port numbers designate?**
  - Well-known port numbers designate standardized port numbers for commonly used services. They are reserved and assigned to specific services to ensure consistency in communication.
- **Is Figure 6-10 an ACL for ingress filtering or egress filtering?**
  - Figure 6-10 appears to be an ACL for ingress filtering because it outlines rules for permitting or denying incoming connection-opening attempts.
- **Why is Rule 2 in Figure 6-10 safer than Rule 1?**
  - Rule 2 in Figure 6-10 is safer than Rule 1 because it explicitly allows only incoming connection-opening attempts for established connections. Rule 1, on the other hand, appears to permit all incoming connection-opening attempts, which may pose a security risk.
- **Which rule in the ACL in Figure 6-10 represents the default behavior of SPI firewalls for ingress connection-opening attempts?**
  - Rule 4 in the ACL in Figure 6-10 represents the default behavior of SPI firewalls for ingress connection-opening attempts. It denies incoming connection-opening attempts by default.
- **Given the ACL in Figure 6-10, what would the firewall do with an incoming ICMP echo message?**
  - Based on the ACL in Figure 6-10, the firewall would permit the incoming ICMP echo message. ICMP messages, including echo messages, are typically allowed by default for network troubleshooting and diagnostics.
- **Redo the ACL in Figure 6-10 to add rules for the following conditions. After Rule 1, create a rule that permits all connections to internal DNS servers. After the original Rule 2, create rules that permit connections to all Trivial File Transfer Protocol (TFTP) servers and that permit access to FTP Server 60.33.17.1. (Hint: Only allow an FTP supervisory connection; the SPI firewall will later open data connections automatically as needed.)**


  ```
  1. Permit all connections to internal DNS servers.
  2. Permit connections to all TFTP servers.
  3. Permit access to FTP Server 60.33.17.1 on FTP supervisory connection.
  4. Deny all other incoming connection-opening attempts.
  ```

- **In ingress and egress filtering, does an SPI firewall always consider its ACL rules when a new packet arrives that attempts to open a connection?**
  - Yes, in both ingress and egress filtering, an SPI firewall always considers its ACL rules when a new packet arrives that attempts to open a connection. The firewall evaluates the packet against its state table and ACL rules to determine whether to permit or deny the connection.
- **In ingress and egress filtering, does an SPI firewall always consider its ACL rules when a new packet arrives that does not attempt to open a connection? (The answer is not explicitly given in this section.)**
  - The information is not explicitly provided in this section. However, it is generally expected that an SPI firewall would consider its ACL rules for all incoming and outgoing packets, whether or not they attempt to open a connection.
- **Why are stateful packet inspection firewalls inexpensive?**
  - Stateful packet inspection firewalls are considered inexpensive because they operate efficiently by tracking the state of active connections, allowing them to make filtering decisions based on the context of the communication. This efficiency makes them cost-effective in terms of resource utilization.
- **In practice, are they fairly safe?**
  - In practice, stateful packet inspection firewalls are considered fairly safe when configured properly. They provide effective protection against many common threats by monitoring the state of connections and enforcing security policies. However, like any security measure, their effectiveness depends on proper configuration, regular updates, and adherence to security best practices.
- **Are SPI firewalls limited to SPI filtering?**
  - No, SPI firewalls are not limited to SPI filtering alone. While stateful packet inspection is a key feature, modern SPI firewalls often incorporate additional filtering mechanisms, such as application-layer filtering, intrusion detection/prevention, and content filtering, to enhance overall security.
- **What firewall inspection mechanism do nearly all main border firewalls today use?**
  - Nearly all main border firewalls today use deep packet inspection (DPI) as a firewall inspection mechanism. DPI involves analyzing the content of packets at a deep level, allowing for more detailed examination of network traffic and improved threat detection.
## 6.4 Network Address Translation
### Book Questions
- **When NAT is used, why can sniffers not learn anything about the internal IP addresses of internal hosts?**
  - When NAT (Network Address Translation) is used, sniffers cannot learn anything about the internal IP addresses of internal hosts because NAT modifies the source IP addresses of outgoing packets to the external IP address of the NAT device. Internal hosts are hidden behind the NAT device, and their actual IP addresses are not exposed in the packets that traverse the network.
- **Why does NAT stop scanning probes?**
  - NAT stops scanning probes because it changes the source IP addresses of outgoing packets. When scanning probes are sent from an external network, the NAT device modifies the source IP addresses, making it difficult for attackers to determine the real IP addresses of internal hosts. This obscures the internal network structure and adds a layer of security against scanning and reconnaissance attempts.
- **Why is NAT traversal necessary?**
  - NAT traversal is necessary because NAT introduces a challenge for certain communication scenarios, especially in peer-to-peer applications or when establishing connections from external networks to internal devices. NAT traversal techniques are required to facilitate communication when hosts are located behind NAT devices.
- **Is a NAT traversal method easy to select?**
  - The ease of selecting a NAT traversal method depends on the specific use case and the network environment. In some scenarios, selecting a NAT traversal method can be relatively straightforward, while in others, it may require careful consideration of factors such as the type of NAT deployed, the applications involved, and security requirements. The complexity can vary, and the choice of a suitable method may involve evaluating different options based on the specific network architecture and communication needs.

## 6.5 Application Proxy Firewalls
### Book Questions
- **What distinguishes an application proxy firewall from static packet filtering firewalls and SPI firewalls?**
  - An application proxy firewall operates at the application layer, understands specific application protocols, and mediates communication between internal and external networks. It offers more granular control and security features compared to static packet filtering and SPI firewalls.
- **Distinguish between proxy programs and application proxy firewalls.**
  - Proxy programs act as intermediaries for network communication, while application proxy firewalls are security solutions that use proxy technology to inspect, filter, and control application-layer traffic. The firewall adds a security layer beyond simple proxying.
- **If you will proxy four different applications, how many proxy programs will you need?**
  - If proxying four different applications, you will need at least four proxy programs, each specialized for a specific application's protocol.
- **How many application proxy firewalls will you need at a minimum?**
  - You may need at least one application proxy firewall capable of handling multiple applications simultaneously, depending on the firewall's capabilities and the network's requirements.
- **Can nearly all applications be proxied?**
  - While many applications can be proxied, not all applications are easily proxied due to various factors like complex protocols or encryption. Some applications may require specific adaptations or may not be fully supported by proxy technology.
- **Why is application proxy firewall operation processing-intensive?**
  - Application proxy firewall operations are processing-intensive because they involve deep inspection and analysis of application-layer traffic. The firewall must understand and interpret the specific protocols used by applications, leading to increased computational demands.
- **Why do firms not use application proxy firewalls as main border firewalls?**
  - Firms may avoid using application proxy firewalls as main border firewalls due to their processing intensity, which can impact network performance. Additionally, they may opt for solutions that balance security and performance, such as SPI firewalls or a combination of technologies.
- **What are the two main roles of application proxy server firewalls today?**
  - The two main roles of application proxy server firewalls today are deep inspection of application-layer traffic to enforce security policies and mediating communication between internal and external networks to protect against application-layer attacks.
- **Do stateful packet inspection firewalls automatically do application content filtering? Explain.**
  - No, stateful packet inspection firewalls do not automatically perform application content filtering. While they track the state of connections, they typically focus on basic filtering based on network-layer information and do not deeply inspect application content.
- **Do they have the slow speed of relay operation?**
  - Stateful packet inspection firewalls generally have faster speeds compared to the slower relay operation associated with some proxy-based solutions. SPI firewalls focus on connection tracking and filtering without the need for full content inspection.
- **What three advantages do application proxy firewalls have in protection that SPI firewalls with content inspection do not have?**
  - Application proxy firewalls offer more granular control, better protection against application-layer threats, and the ability to understand and filter specific application protocols. They excel in enforcing security policies for diverse applications.
- **Why are SPI content filtering firewalls faster than application proxy firewalls?**
  - SPI content filtering firewalls are faster than application proxy firewalls because they focus on inspecting specific content within packets rather than performing the deep analysis required by application proxies. This makes SPI content filtering more efficient for high-speed network environments.
- **What filtering actions were listed to protect clients from malicious webservers?**
  - Filtering actions to protect clients from malicious webservers include blocking files with dangerous extensions, filtering URLs known to host malware, and blocking content with malicious signatures.
- **What filtering action was mentioned to prevent internal client misbehavior in HTTP?**
  - To prevent internal client misbehavior in HTTP, filtering actions include blocking specific HTTP methods that might be exploited for malicious activities.
- **What two filtering actions were mentioned for protecting webservers from malicious clients?**
  - Filtering actions for protecting webservers from malicious clients include blocking requests with known attack patterns and filtering out requests targeting vulnerabilities in web applications.
- **What three automatic protections do application proxy firewalls provide simply because of the way in which they operate?**
  - Application proxy firewalls provide automatic protections by isolating internal clients from direct communication with external servers, enforcing security policies for specific applications, and performing deep content inspection to detect and block malicious content.
## 6.6 Intrusion Detection Systems
### Book Questions
- **Distinguish between firewalls and IDSs.**
  - Firewalls primarily focus on preventing unauthorized access to or from a network, enforcing security policies based on rules. IDSs (Intrusion Detection Systems) monitor network or system activities, detect potential security incidents, and generate alerts without actively blocking traffic.
- **Why are IDS alarms often a problem?**
  - IDS alarms can be problematic because they may generate a high volume of alerts, including false positives, leading to alert fatigue and making it challenging for security personnel to distinguish between actual threats and noise.
- **What is a false positive?**
  - A false positive occurs when an IDS incorrectly identifies normal or benign activity as malicious. It is a type of alert that erroneously indicates a security threat where none exists.
- **What two types of filtering do IDSs use?**
  - IDSs use signature-based filtering, which matches patterns of known attacks, and anomaly-based filtering, which identifies deviations from normal behavior as potential threats.
- **Why is deep packet inspection important?**
  - Deep packet inspection allows IDSs to analyze the content of network packets at a granular level, enabling the detection of complex attacks and malicious content that may be hidden within the payload.
- **Why is deep packet inspection processing-intensive?**
  - Deep packet inspection is processing-intensive because it involves thorough analysis of packet content, requiring the IDS to inspect and interpret data beyond basic header information. This detailed examination demands more computational resources.
- **Why is packet stream analysis important?**
  - Packet stream analysis involves the examination of the entire sequence of packets exchanged during a communication. It helps IDSs understand the context of network activity, enabling more accurate detection of attacks that may span multiple packets.
- **Why does packet stream analysis place a heavy load on IDSs?**
  - Packet stream analysis places a heavy load on IDSs because it requires continuous monitoring and analysis of the entire communication flow. This involves tracking the state of connections and processing large volumes of data, making it resource-intensive.
- **Distinguish between IDSs and IPSs.**
  - IDSs (Intrusion Detection Systems) passively monitor and analyze network or system activities, generating alerts for potential threats. IPSs (Intrusion Prevention Systems) actively block or mitigate detected threats, providing a proactive defense mechanism.
- **Why is the attack identification confidence spectrum important in deciding whether to allow IPSs to stop specific attacks?**
  - The attack identification confidence spectrum helps assess the reliability of IDS/IPS alerts. It's important to balance preventing false positives (blocking legitimate traffic) and avoiding false negatives (missing actual threats). The spectrum aids in making informed decisions about allowing IPSs to take action based on the confidence in attack identification.
- **What two actions can IPSs take when they identify an attack?**
  - IPSs can either block the identified attack by dropping or modifying packets (active prevention) or generate alerts to notify security personnel without actively blocking traffic (passive detection).
- **Which can be the most effective?**
  - Active prevention (blocking) can be the most effective in immediately thwarting identified attacks, preventing potential harm. However, it requires careful tuning to avoid false positives that may disrupt legitimate traffic.
- **Which can do the most damage?**
  - Active prevention, if misconfigured or prone to false positives, has the potential to do the most damage by blocking legitimate traffic or services. Careful configuration and continuous monitoring are essential to mitigate this risk.
## 6.7 Antivirus Filtering and Unified Threat Management
### Book Questions
- **How do firewalls and antivirus servers work together?**
  - Firewalls and antivirus servers work together by complementing each other's functions. Firewalls primarily focus on controlling access to and from networks based on predefined rules, while antivirus servers specialize in detecting and blocking malicious software. When used together, firewalls control network traffic, and antivirus servers scan content for known malware, enhancing overall security.
- **Are antivirus servers limited to looking for viruses? Explain.**
  - Antivirus servers are not strictly limited to looking for viruses. While they are designed to detect and prevent viruses, they also identify and block various types of malicious software, including worms, Trojans, spyware, and other forms of malware. Modern antivirus solutions often provide comprehensive protection against a range of threats.
- **What might the antivirus server do after it performs filtering?**
  - After performing filtering, the antivirus server may take actions such as quarantining or deleting detected malware, generating alerts for security personnel, and updating its signature databases to enhance its ability to identify new threats. It plays a proactive role in preventing the spread of malicious content.
- **What type of firewall does both traditional firewall filtering and antivirus filtering?**
  - A Unified Threat Management (UTM) firewall incorporates both traditional firewall filtering and antivirus filtering capabilities. It serves as an all-in-one security solution that integrates multiple security features, including firewall rules, intrusion detection and prevention, and antivirus filtering, into a single platform.
## 6.8 Firewall Architectures
### Book Questions
- **Why are screening routers used in a firewall architecture?**
  - Screening routers are used in a firewall architecture to provide an additional layer of defense by filtering and controlling incoming and outgoing traffic. They act as the first line of defense, preventing certain types of traffic from reaching the internal network.
- **Why are internal firewalls desirable?**
  - Internal firewalls are desirable to segment and protect different segments of an internal network. They help control and monitor traffic between internal network zones, adding an extra layer of security to prevent lateral movement of threats.
- **Why is it easier to create appropriate ACL rules for server host firewalls than for border firewalls?**
  - It is easier to create appropriate ACL rules for server host firewalls because server hosts typically have specific and well-defined communication requirements. The rules can be tailored to allow only necessary traffic, reducing the complexity compared to border firewalls that need to handle diverse traffic from external sources.
- **How does the use of border, internal, and host firewalls provide defense in depth?**
  - The use of border, internal, and host firewalls provides defense in depth by implementing multiple layers of security. Border firewalls protect against external threats, internal firewalls control traffic within the network, and host firewalls add protection at the individual device level. This layered approach enhances overall security, making it more challenging for attackers to penetrate the network.
- **What is a multihomed router?**
  - A multihomed router is a router with multiple network interfaces, connecting to multiple network segments. It serves as a point of control and separation between different parts of a network, helping to manage and direct traffic between them.
- **What is a DMZ?**
  - A DMZ (Demilitarized Zone) is a network segment that is isolated from both the internal and external networks. It is often used to host servers and services that need to be accessible from the internet while providing an additional layer of security.
- **Why do companies use DMZs?**
  - Companies use DMZs to separate public-facing servers and services from the internal network. This helps protect the internal network from direct exposure to the internet and adds an extra layer of security for critical servers, such as web servers and email servers.
- **What three types of hosts are placed in the DMZ?**
  - Three types of hosts commonly placed in the DMZ are:
    1. Public-facing servers (e.g., web servers)
    2. Application proxy firewalls
    3. External DNS servers

- **Why do companies put public servers in the DMZ?**
  - Companies put public servers in the DMZ to isolate them from the internal network, minimizing the risk of a direct attack on internal resources. Placing public servers in the DMZ allows them to serve external users while maintaining a level of separation from sensitive internal systems.
- **Why do companies put application proxy firewalls in the DMZ?**
  - Companies put application proxy firewalls in the DMZ to inspect and control incoming traffic, especially for applications that require external access. The application proxy firewall adds a layer of security by analyzing and filtering application-layer traffic.
- **What host names does the external DNS server know?**
  - The external DNS server knows the host names of publicly accessible servers in the DMZ. These are the host names that users on the internet use to access services provided by the DMZ, such as web servers.
- **Why do all hosts in the DMZ have to be hardened stringently?**
  - All hosts in the DMZ need to be hardened stringently because they are directly exposed to the internet and potentially vulnerable to external threats. Stringent hardening ensures that these hosts have minimal attack surfaces and are more resilient against potential attacks originating from the internet.
## 6.9 Firewall Management
### Book Questions
- **Distinguish between firewall policies and ACL rules.**
  - Firewall policies represent a set of high-level guidelines that dictate how network traffic should be handled, including which types of traffic are allowed or denied. ACL (Access Control List) rules, on the other hand, are specific rules within a firewall policy that define the criteria for permitting or denying individual packets based on attributes like source IP, destination IP, and port numbers.
- **Why is creating firewall policies desirable compared to just creating a list of ACL rules?**
  - Creating firewall policies is desirable because it allows for a more comprehensive and organized approach to network security. Policies provide a strategic overview of the desired security posture, while ACL rules, although crucial, focus on the granular details of packet filtering. Policies make it easier to manage complex network security requirements and ensure consistency.
- **Create three firewall policies not listed in the text.**
  1. **Default Deny Policy:** Deny all incoming and outgoing traffic by default, allowing only explicitly permitted connections.
  2. **Application Whitelisting Policy:** Allow only approved applications and services to communicate across the network, blocking all others.
  3. **User-Based Access Control Policy:** Define policies based on user identities, restricting or allowing access based on user authentication and authorization.

- **Compare firewall hardening needs for firewall appliances, vendor-provided systems, and firewalls built on general-purpose computers.**
  - Firewall appliances are typically pre-configured for security but may require periodic updates. Vendor-provided systems may need hardening based on default settings, while firewalls on general-purpose computers require thorough hardening, including secure OS configurations, regular updates, and proper network segmentation.
- **List what centralized firewall management systems do.**
  - Centralized firewall management systems provide a unified platform to manage multiple firewalls. They offer features such as centralized policy management, configuration deployment, monitoring, and reporting across distributed firewall deployments.
- **What columns does the firewall policy database described in the text contain? Be able to describe each and what options it offers.**
  - The firewall policy database typically contains columns such as:
    1. **Rule Number:** Sequential number for each rule in the policy.
    2. **Action:** Specifies whether to allow or deny traffic.
    3. **Source Address:** Defines the source IP address or range.
    4. **Destination Address:** Specifies the destination IP address or range.
    5. **Service:** Identifies the service or protocol associated with the rule.
    6. **Schedule:** Defines when the rule is active (time-based).
    7. **Logging:** Indicates whether logging is enabled for the rule, with options for logging all or specific events.

- **Why is vulnerability testing necessary?**
  - Vulnerability testing is necessary to identify and assess potential weaknesses or security flaws in a system, including firewalls. It helps organizations proactively address vulnerabilities and enhance overall security.
- **Why should firewall policies govern both configuration and testing?**
  - Firewall policies should govern both configuration and testing to ensure consistency between the intended security posture (as defined in policies) and the actual implementation (configuration). Testing verifies that the firewall operates as intended, and policies guide the configuration to align with security objectives.
- **What are the steps in firewall change management?**
  - The steps in firewall change management typically include:
    1. **Request:** Submit a request for a firewall change.
    2. **Approval:** Obtain approval from relevant stakeholders.
    3. **Implementation:** Apply the approved changes to the firewall.
    4. **Testing:** Verify that the changes function as expected.
    5. **Documentation:** Update documentation to reflect the changes.
    6. **Review:** Conduct a post-implementation review to assess the impact of the changes.

- **Why is reading firewall logs important?**
  - Reading firewall logs is crucial for monitoring network activity, detecting security incidents, and gaining insights into potential threats. Logs provide a record of traffic patterns, rule violations, and potential security events, aiding in incident response and analysis.
- **What is the most time-consuming part of firewall management?**
  - The most time-consuming part of firewall management is often the ongoing monitoring and analysis of firewall logs. Analyzing logs requires time and attention to detail to identify security events, understand network activity, and respond to incidents effectively.
- **What packets are usually logged in log files?**
  - Log files typically include information about logged packets that match specific criteria, such as denied or allowed traffic based on firewall rules. Events related to connection attempts, rule violations, and security incidents are commonly logged.
- **Name the fields in the log file shown in Figure 6-25?**
  - The fields in the log file shown in Figure 6-25 may include:
    1. **Timestamp**
    2. **Source IP**
    3. **Destination IP**
    4. **Protocol**
    5. **Source Port**
    6. **Destination Port**
    7. **Action (Allow/Deny)**
## 6.10 Firewall Filtering Problems
### Book Questions
- **How can attackers avoid the border firewall?**
  - Attackers can employ various techniques to avoid the border firewall, such as using encrypted connections (HTTPS), exploiting vulnerabilities in network protocols, utilizing covert channels, or employing tactics like tunneling through legitimate protocols to mask malicious activities.
- **How has the perimeter extended outside the site?**
  - The perimeter has extended outside the site due to trends such as remote work, cloud computing, and the use of mobile devices. With employees accessing corporate resources from various locations and devices, the traditional network perimeter has become more fluid, requiring new security measures.
- **How can firms react to this decline in the effectiveness of border firewall filtering?**
  - Firms can react to the decline in the effectiveness of border firewall filtering by implementing a more holistic security approach. This includes adopting technologies like intrusion prevention systems (IPS), endpoint protection, and advanced threat detection. Additionally, focusing on user education, implementing strong access controls, and leveraging cloud security services can enhance overall security posture.
- **Distinguish between signature detection and anomaly detection.**
  - **Signature Detection:** Involves identifying known patterns or signatures of malicious activity. It relies on a database of predefined signatures to match against incoming traffic and detect known threats.
  - **Anomaly Detection:** Involves identifying deviations from normal behavior. It establishes a baseline of normal network or system activity and triggers alerts or actions when observed behavior deviates significantly from the baseline.
- **What is a zero-day attack?**
  - A zero-day attack refers to a cyberattack that exploits a previously unknown or unpatched vulnerability in software. The term "zero-day" indicates that attackers exploit the vulnerability on the same day it is discovered, with no prior knowledge by the software vendor or security community.
- **Why are zero-day attacks impossible to stop with attack signatures?**
  - Zero-day attacks are impossible to stop with attack signatures because there are no known patterns or signatures for these attacks. Since the vulnerabilities being exploited are unknown, traditional signature-based detection methods cannot identify and block zero-day attacks until security researchers develop and deploy signatures after the attack is discovered.
- **What is the promise of anomaly detection?**
  - The promise of anomaly detection lies in its ability to identify previously unseen threats or deviations from normal behavior. It offers a proactive approach to security by detecting novel attacks, including zero-day exploits, based on anomalies in network or system behavior.
- **Why is anomaly detection becoming critical for firewalls?**
  - Anomaly detection is becoming critical for firewalls because traditional signature-based approaches may not effectively address emerging threats, including zero-day attacks. By continuously monitoring and learning from normal network behavior, anomaly detection enhances the ability to detect and respond to novel and sophisticated threats that may evade traditional security measures.
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