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

1. **Understanding TCP/IP Sessions**:
    - To grasp Mitnick's attack, it's important to understand how TCP/IP sessions work. TCP (Transmission Control Protocol) is a communication protocol that ensures reliable data transmission over a network. It establishes sessions between devices using a three-way handshake: SYN (synchronize), SYN-ACK (synchronize acknowledgment), and ACK (acknowledgment).
2. **Initial Observation**:
    - Mitnick would first monitor network traffic to identify an ongoing TCP/IP session between two parties. This could be a legitimate communication between a user and a server, such as a login session or data transfer.
3. **Session Hijack**:
    - Once Mitnick identified a target session, he would attempt to hijack it. He did this by predicting or guessing the sequence numbers used in the TCP session.
4. **TCP Sequence Number Prediction**:
    - TCP uses sequence numbers to keep track of the order of transmitted packets. By predicting the next sequence number, Mitnick could effectively "spoof" one of the communicating parties, making the other party believe that he was the legitimate sender.
5. **Packet Injection**:
    - After successfully predicting the sequence numbers, Mitnick injected his own malicious packets into the session. These packets could contain various payloads, such as commands, data, or malware.
6. **Data Interception or Manipulation**:
    - Mitnick's injected packets could be used to intercept data exchanged between the legitimate parties. This allowed him to eavesdrop on sensitive information or manipulate the data being transmitted.
7. **Continuing the Hijack**:
    - Mitnick would continue to inject packets to maintain control over the session. This ensured that he could intercept and manipulate data for as long as the session remained active.
8. **Evasion and Covering Tracks**:
    - To avoid detection, Mitnick would take measures to cover his tracks, such as altering packet headers or using encryption to obfuscate his activities.
9. **Session Termination**:
    - When he had achieved his objectives or wanted to exit the session without raising suspicion, Mitnick could terminate the hijacked session.

---
- Attack Name: TCP Session Hijacking
- Attack Method: 
	- Create a TCP Connection between hosts A and B on their behalf and naturally hijack it
		- Step1: Predict Sequence Number by initiating half-open connections and figuring out the pattern
		- Step2: Take down hostB via a SYN Flood as any attempt to SYN on hostA's behalf would end up sending the SYN-ACK to hostA and not Mitnick's PC therefore sending a RST Packet to terminate the connection
		- Step3: With the original hostB down, an ACK to the SYN-ACK cannot be sent and so the ACK was also guessed from the spoofing done in step1 and therefore the session was hijacked fully allowing Mitnick to use the connection b/w hostA and hostB to access X-Terminal
## Legacy
- The Mitnick case remains a landmark in the history of cybersecurity, highlighting the importance of securing computer systems against hackers.
- It serves as a cautionary tale about the consequences of engaging in illegal hacking activities.
