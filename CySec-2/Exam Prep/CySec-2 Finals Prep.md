>!NOTE

>Following topics are mostly covered from the book first and then the slides

>Status:

| Chapter                         | Status |
| ------------------------------- | ------ |
| [CH3.9: VPN](#CH3-9-VPN)                      | :x:    |
| [CH3.10: SSL/TLS](#CH3.10-SSL-TLS)                 | :x:    |
| [CH3.11: IPSEC](#CH3.11-IPSEC)                   | :x:    |
| [CH4: Secure Networks](#CH4-Secure-Networks)            | :x:    |
| [CH6: Firewalls](#CH6-Firewalls)                  | :x:    |
| [Extra CH10.3: IDS](#Extra-CH10.3-IDS)               | :x:    |
| CH_UNKNOWN: Threat Intelligence | :x:       |

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
	- No cookie protection as there are two ssl sessions. One for the user to the vpn client and the other from the 
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
	-