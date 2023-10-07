# FreeIPA (OpenSource)

### RedHat IAM

# Microsoft AD
### LDAP (Protocol to use w a Directory service like AD)
- Authentication method
	- SASL (Simple authentication and Security Layer)
		- 

---
### Kerberos (SSO)
- Default Auth method used by Microsoft for AD (Active Directory) & Windows + Broadband providers.
- Widely used for network authentication.
- Kerberos operates on three main components or "heads":
    - Client/Principal: The user or entity requesting authentication.
    - Network Resource: The service or resource being accessed.
    - KDC (Key Distribution Centre): The central authority responsible for authentication.
        - Main trust provider for both the resource and the client/principal.
        - Maintains a database containing records of each client/principal.
        - Provides authentication services by granting tickets to client/principals.
- Weaknesses in Kerberos, Theyre mostly (MITM) attacks:
    - Pass-the-key: Attackers can impersonate authorized users by replaying their credentials.
    - Pass-the-ticket: Attackers intercept tickets sent to or from an authenticated user to impersonate them.
    - Golden ticket: Attackers can create a forged Windows domain controller ticket, granting credentials for unlimited access to application services.
    - Kerberoasting attack: This attack targets the encryption of service tickets.

---
### Kerberos vs LDAP vs 