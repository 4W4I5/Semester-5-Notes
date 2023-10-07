# FreeIPA (OpenSource)

### RedHat IAM

# Microsoft AD
- Used for SSO and Centralized user management
- Components
	- Domain Controller
	- AD DS
	- AD CS
	- AD FS

---
# IAM Protocols
IAM itself is a framework to manage identities and controls access to resources
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

### LDAP (Protocol to use w a Directory service like AD)
- Authentication method
	- SASL (Simple authentication and Security Layer)

### SAML (Security Assertion Markup Language)
- XML-based protocol for exchanging authentication and authorization data used in web-based SSO.
- SAML enables a user to log in once and access multiple services without needing to log in separately to each one.
	- It enhances security by reducing the need for multiple passwords and simplifying user management.
- It consists of two main components: 
	- Identity Provider (IdP) 
		- The IdP is responsible for authenticating users and generating SAML assertions.
		- SAML assertions are digitally signed XML documents containing user identity information.
	- Service Provider (SP).
		- The SP trusts the IdP and relies on SAML assertions to grant access to users.
- SAML uses various bindings and profiles for different use cases, such as Web Browser SSO and Single Logout.

### OAuth

### OpenID Connect