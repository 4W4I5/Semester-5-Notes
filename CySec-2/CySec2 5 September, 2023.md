`add in stuff about a pathway after setting  up a fresh dns server w no cahce loaded`
>NOTE:: Labwork took most of the time this is just extra info

1. **Basic Configuration**:
   - Configure the basic settings of your DNS server, including its hostname, IP address, and network settings. Ensure that the server is properly connected to the network.
2. **DNS Software Installation**:
   - Install and configure DNS server software. Popular choices include BIND (Berkeley Internet Name Domain), Microsoft DNS Server (for Windows Server), or other DNS server software based on your platform.
3. **Zone Configuration**:
   - Create DNS zones to define the domains and subdomains that your DNS server will be authoritative for. This may include setting up forward and reverse lookup zones.
4. **DNS Records**:
   - Add DNS records for the domains hosted on your server. Common record types include A (Address), CNAME (Canonical Name), MX (Mail Exchange), and NS (Name Server) records.
5. **Root Hints**:
   - Configure root hints or forwarders. Root hints provide a list of root DNS servers on the internet. Forwarders allow your DNS server to query external DNS servers for domains it cannot resolve locally.
6. **Security Configuration**:
   - Implement security measures such as DNSSEC (DNS Security Extensions) to protect against DNS spoofing and cache poisoning attacks.
7. **Firewall Rules**:
   - Configure firewall rules to allow DNS traffic to and from your DNS server, ensuring that it can communicate with other DNS servers and clients on the network.
8. **Testing**:
   - Test your DNS server's functionality by querying it for domain resolutions. Ensure that it can resolve local and external domain names correctly.
9. **Monitoring and Logging**:
   - Set up monitoring and logging tools to keep track of DNS server performance, potential issues, and security events.
10. **Backup and Recovery**:
    - Establish regular backup procedures for your DNS server's configuration and zone data. Create a plan for disaster recovery in case of server failures.
12. **Documentation**:
    - Document your DNS server configuration, including zone information, record details, and network settings. This documentation will be valuable for future reference and troubleshooting.
13. **Maintenance and Updates**:
    - Regularly update and maintain your DNS server software and configurations to ensure it remains secure and efficient.
14. **Client Configuration**:
    - Update DNS settings on client devices or on your network infrastructure to use your new DNS server as the primary or secondary DNS resolver.
15. **DNS Cache Management**:
    - If you wish to enable DNS caching on your server, configure cache settings to control how long DNS records are stored in the cache.
16. **Continual Monitoring**:
    - Continually monitor your DNS server's performance, resolve any issues that arise, and stay informed about security updates and best practices in DNS management.
x