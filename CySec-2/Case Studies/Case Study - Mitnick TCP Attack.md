# Kevin Mitnick Case Study

`A better read is to check out the Mitnick Attack Lab on SEEDLabs (https://seedsecuritylabs.org/Labs_16.04/PDF/Mitnick_Attack.pdf)`

## Background
- Kevin Mitnick, born in 1963, is a renowned computer hacker and social engineer.
- He gained notoriety in the 1980s and 1990s for his cybercrimes and hacking exploits.

## Hacking Exploits
- Mitnick's hacking career began with phone phreaking, manipulating the phone system to make free calls.
- He progressed to computer hacking, targeting various systems, including IBM and DEC.
- Mitnick's hacking skills allowed him to gain unauthorized access to sensitive data.

## TCP/IP Spoofing and Attacks:

- Attack Name: TCP Session Hijacking
- Attack Motive:
	- Create a TCP Connection between hosts A and B on their behalf and naturally hijack it
- Attack Method: 
	- Step1: Predict Sequence Number by initiating half-open connections and figuring out the pattern
	- Step2: Take down hostB via a SYN Flood as any attempt to SYN on hostA's behalf would end up sending the SYN-ACK to hostA and not Mitnick's PC therefore sending a RST Packet to terminate the connection
	- Step3: With the original hostB down, an ACK to the SYN-ACK cannot be sent and so the ACK was also guessed from the spoofing done in step1 and therefore the session was hijacked fully allowing Mitnick to use the connection b/w hostA and hostB to access X-Terminal
## Legacy
- The Mitnick case remains a landmark in the history of cybersecurity, highlighting the importance of securing computer systems against hackers.
- It serves as a cautionary tale about the consequences of engaging in illegal hacking activities.
