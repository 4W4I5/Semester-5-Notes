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

#### Cryptographic systems. Ch3.9 to Ch3.11
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
- WANs are expensive to setup so just establish an encrypted tunnel over the untrusted internet to save costs. Also grants mobility through wireless hotspots although it becomes a question of security at that point
### Types of VPN
- 