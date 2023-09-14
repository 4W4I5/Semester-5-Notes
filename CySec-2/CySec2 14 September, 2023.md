Started lecture 3 slides

### TCP Sequence numbers

- Unreliable in terms of security `Dont add much info for this`

## TCP Bytestream service

- The applications do **NOT** see:
	- Packet boundaries
	- Retransmissions
- Sometimes packets are out of order
	- Buffer out of order packets
	- Wait for retransmitted first packet

### TCP Handshake

- Used for establishing connection
	- Client sends SYN
	- Server sends SYN-ACK
	- Client sends ACK
### TCP SEQ & ACK numbers

### TCP Flags

### TCP Attacks
- Syn flooding
	- sending too many SYN packets for the server to handle
	- Denial of service attack usually through sending SYN via multiple different IP
	- Prevention
		- Only create state after ACK is received 
		- SYN Cookies
			- 
	- Issue if spoofed ip is used
		- Person through which the spoofing is done, might delete their local state
			- A random ACK will trigger the RST flag to be sent in response`Pattern is wrong, check online`
		- 