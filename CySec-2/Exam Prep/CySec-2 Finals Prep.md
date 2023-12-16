>!NOTE
>Following topics are mostly covered from the book first and then the slides
>Status: 3.10 is wip
>

| Chapter                                      | Status             |
| -------------------------------------------- | ------------------ |
| [CH3.9: VPN](#CH3-9-VPN)                     | :white_check_mark: |
| [CH3.10: SSL/TLS](#CH3.10-SSL-TLS)           | :x:                |
| [CH3.11: IPSEC](#CH3.11-IPSEC)               | :x:                |
| [CH4: Secure Networks](#CH4-Secure-Networks) | :x:                |
| [CH6: Firewalls](#CH6-Firewalls)             | :x:                |
| [Extra CH10.3: IDS](#Extra-CH10.3-IDS)       | :x:                |
| CH_UNKNOWN: Threat Intelligence              | :x:                |

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
## SSL (Secure Socket Layer)

## HTTPS (HyperText Transfer Protocol Secure)
aka HTTP over SSL

## Transport Layer Security

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

# Ch3.11: IPSEC

# Ch4: Secure Networks
# Ch6: Firewalls
# Ch10.3: IDS
# Unknown: Threat Intelligence