> [!NOTE]
>Well this is a lot

| Topic                            | Status                              |
| -------------------------------- | ----------------------------------- |
| Final topics                     | Did these first as i missed classes |
| NoSQL                            | :white_check_mark:                  |
| CAP Theorem                      | :white_check_mark:                                 |
| SQL Injection                    | :white_check_mark:                                 |
| Transaction Processing           | :x:                                 |
| Starting from the first lectures | ThanosMemeBalancedAsItShouldBe.jpg  |
| Data Modeling                    | :x:                                 |
| ERD/EERD                         | :x:                                 |
| Relational Models                | :x:                                 |
| SQL                              | :x:                                 |
| Assignment1                      | :x:                                 |
| Sessional 1 Past Paper           | :x:                                 |
| Assignment2                      | :x:                                 |
| Functional Dependencies          | :x:                                 |
| Normalization                    | :x:                                 |
| Relational Alegbra               | :x:                                 |
| Query Optimization               | :x:                                 |
| Sessional 2 Past Paper           | :x:                                 |
| Assignment3,4,5                  | :x:                                 |


<!--
:white_check_mark:
:x:
-->

---
# NOSQL

To understand NOSQL we need to understand RDBMS i.e. the database management software we are used to (MS SQL Server or SSMS)

A standard project with a database system involves:

- Endusers that can
	- Request data through an application. Think of webforms in db lab project
- A DBMS
- A Database structure
	- Metadata for the tables created
	- Enduser data i.e. the tables we create

NOSQL was tailored for big data

**Data is considered Big Data**:

- When capacity is >= 1TB
- Has the following charecteristics
	- Greater Variety, less structure
	- Arrives in growing volumes
	- Arrives in growing velocity
- An example is social media, S3 solutions, need of dynamically-typed data with frequent schema changes
	- Data from the internet is massive and sparse, generally unstructured or semi-structured at best
## RDBMS (Relational Database Management System)
- Manages and stores databases i.e multiple databases
- Consists of
	- Data utilities
	- Reporting
	- Access Control
		- Users
		- Policies
	- Storage Engine
		- Query Language with its own Query Processor
	- Monitoring
		- Logs
		- Performance
- Have ACID transactions
	- Atomic - All of the work in one transaction completes or none will
	- Consistent - Use of checks such as NULL or RANGE checks
	- Isolated - Results for changes are only shown when the transaction is committed i.e. completed
	- Durable - A system crash/other failure will not result in data loss of the transaction or at least the contents + context of the transaction.
		- Done by transaction logs that can recreate transactions from point of failture in time. Think of like snapshots in a VM
- **Shortcomings of RDBMS (Not suitable for big data)**:
	- These assume that data flowing in is
		- Largely uniform as in structured. The three types of data are:
			- Structured - Relational Data, tabulated
			- Semi-Structured - Loosely structured as in has a head and a body like html, xml, json, yaml, etc
			- Unstructured - Not completely unstructured but its just text explaining what the data is and/or images/audio
		- Scaling
			- RDBMS cant be distributed globally.
				- They were best designed to run on a single machine i.e. upgrades involve a lot of vertical scaling
			- Master-Slave Situation
				- All writes are written to the master
				- All reads are performed against the replicated slaves
				- Critical reads i.e. reads performed in real-time might be incorrect as it takes a while to propagate any recent writes
				- Large data sets take time to replicate
			- Sharding
				- A giant db is split into smaller db that each handles a subset of the original data. kind of like normalization but more abstract
				- Each shard operates independently as each shard has its own 'genre' of the data so that reads and writes only affect that specific shard
				- More relevant for NoSQL based servers

## NOSQL

NOSQL stands for:

- NOT relational
- NOT RDBMS
- NOT Only SQL (IK i didnt get this either)
- Any database/datastore that isnt an RDBMS can be classified as NOSQL if it follows these rules:
	- Collection of several varied but related concepts on data storage and manipulation
	- Often related to big data
	- Class of products i.e mongoDB has atlas, and a whole lot of stuff
- Characteristics
	- BASE used instead of ACID
		- Basically Available - Always Available
		- SoftState - State of the system changes over time
		- Eventual Consistency - Eventually the system becomes consistent i.e. all replicas eventually have the same data in the absence of new data
	- Consistency is traded in favor of Availability
	- High horizontal scalability
		- Designed to run on clusters/multi-node db solutions. Scaling is done via adding more machines to the cluster
		- Replication
	- Massive Parallel Processing
- Architectures
	- Column family
		- _Data Model:_ Organized in columns and rows.
			- Stored in column oriented way in column families
			- No space consumed for storing nulls
			- Row-Key are used to identify a unit of data
		- _Use Case:_ Suited for large-scale, read-heavy applications with sparse data.
		- _Examples:_ Google BigTable, Hbase
	- Key value
		- _Data Model:_ Simple, pairs of keys and associated values.
			- Schema-less
			- Hashmaps, associative arrays
			- Very efficient
		- _Use Case:_ Ideal for high-speed, simple data retrieval and storage.
		- _Examples:_ Redis, DynamoDB.
	- Document
		- _Data Model:_ Stores data as flexible, self-contained documents (e.g., JSON, BSON).
		- _Use Case:_ Well-suited for content management, cataloging, and applications with dynamic schemas.
		- _Examples:_ MongoDB, CouchDB.
	- Graph
		- _Data Model:_ Represents data as nodes, edges, and properties.
		- _Use Case:_ Best for applications involving complex relationships, such as social networks and network analysis.
		- _Examples:_ Neo4j, Amazon Neptune.

### NOSQL vs SQL

| Feature                | SQL                                       | NoSQL                                            |
|------------------------|-------------------------------------------|--------------------------------------------------|
| **Data Model**         | Structured, typically relational tables with predefined schema | Flexible, supports various data models (document, key-value, column-family, graph) allowing dynamic schema adaptation. |
| **Schema**             | Fixed schema, requires a defined structure for tables | Dynamic schema allows for changes in data structure without affecting the entire database. Ideal for evolving data requirements. |
| **Scalability**        | Vertical scaling (adding more resources to a single server) | Horizontal scaling, achieved by adding more servers, making it more adaptable to growing data and traffic demands. |
| **Query Language**     | SQL (Structured Query Language) for standardized queries | Varied query languages specific to each NoSQL database, tailored to the respective data model. Examples include MongoDB Query Language, Cassandra Query Language (CQL). |
| **Transactions**       | ACID properties (Atomicity, Consistency, Isolation, Durability) ensure data integrity and consistency | Eventual consistency is common, providing high availability and partition tolerance, sacrificing strict consistency for performance gains. |
| **Use Cases**          | Suitable for applications with complex queries, transactions, and well-defined relationships | Ideal for scenarios with large volumes of unstructured or semi-structured data, high read and write throughput, and where flexibility in data modeling is crucial. Common in web applications, real-time analytics. |
| **Examples**           | MySQL, PostgreSQL, Oracle                  | MongoDB (document), Cassandra (column-family), Redis (key-value), Neo4j (graph), each tailored to specific use cases and data models. |

# CAP Theorem
###### Class Task: What is the CAP Theorem and how does it relate to databases
CAP triangle out which only three can be picked out at a time

- **Consistency**
	- Sync delay b/w replicas
- **Availability**
	- Response time of replicas
- **Partition Tolerance**
	- Ability to operate despite failures in networked partitions or comms in b/w nodes
	- Should be functional even if some nodes are unreachable

This breaks out into the following properties being prioritized

- **CA (Consistency and Availability):**
    - Provides Consistency and Availability when there are no network partitions.
    - All nodes have the most recent data, and the system is available for read and write requests.
- **CP (Consistency and Partition Tolerance):**
    - Prioritizes Consistency over Availability during network partitions.
    - Ensures that all nodes have the same data but may temporarily sacrifice availability.
- **AP (Availability and Partition Tolerance):**
    - Prioritizes Availability over Consistency during network partitions.
    - Continues to respond to read and write requests, even if it means providing slightly outdated or inconsistent data.



# Book Questions

- **For which types of applications were NoSQL systems developed?**
  NoSQL systems were developed for applications that require flexible data models, scalability, and the ability to handle large volumes of unstructured or semi-structured data. Common applications include web applications, real-time big data processing, and scenarios with dynamic and evolving data structures.

- **What are the main categories of NoSQL systems? List a few of the NoSQL systems in each category.**
  - **Document-oriented:** MongoDB, CouchDB
  - **Key-Value Stores:** Redis, DynamoDB
  - **Column-family Stores:** Apache Cassandra, HBase
  - **Graph Databases:** Neo4j, Amazon Neptune
- **What are the main characteristics of NoSQL systems in the areas related to data models and query languages?**
  NoSQL systems often have flexible or schema-less data models, allowing for variations in the structure of each record. They support different data models, including document-oriented, key-value pairs, column-family stores, and graph databases. Query languages are tailored to the specific data model used.

- **What are the main characteristics of NoSQL systems in the areas related to distributed systems and distributed databases?**
  NoSQL systems are designed for horizontal scalability, allowing them to handle large amounts of data by distributing it across multiple servers. They often prioritize performance and availability over strong consistency, making trade-offs based on the CAP theorem.

- **What is the CAP theorem? Which of the three properties (consistency, availability, partition tolerance) are most important in NoSQL systems?**
  The CAP theorem states that in a distributed system, it's impossible to simultaneously provide all three guarantees (consistency, availability, partition tolerance). NoSQL systems often prioritize availability and partition tolerance over strict consistency.

- **What are the similarities and differences between using consistency in CAP versus using consistency in ACID?**
  In CAP, consistency is a trade-off with availability, meaning that strict consistency might be sacrificed for availability in distributed systems. In ACID, consistency ensures that a transaction brings the database from one valid state to another, with no intermediate states.

- **What are the data modeling concepts used in MongoDB? What are the main CRUD operations of MongoDB?**
  MongoDB uses a document-oriented data model. The main CRUD operations are Create, Read, Update, and Delete, corresponding to the insertion, retrieval, modification, and removal of documents in a MongoDB collection.

- **Discuss how replication and sharding are done in MongoDB.**
  Replication in MongoDB involves maintaining multiple copies of data across multiple servers to ensure availability and fault tolerance. Sharding involves horizontally partitioning data across multiple servers to improve scalability.

- **Discuss the data modeling concepts in DynamoDB.**
  DynamoDB, a key-value and document-oriented database, uses tables to store and organize data. Data modeling involves defining primary keys, secondary indexes, and specifying throughput capacity for tables.


# SQL Injection (SQLi)
When boundary b/w code and data blurs is when SQLi is most common.

Common injection techniques include;
- Premature string termination
	- Normal query: Select fname FROM student WHERE id='i212874';
	- SQLi query: Select fname FROM student WHERE id=';DROP Table student; --';
		- The ; at the start of the string terminated string processing and whatever follows next is parsed as a SQL command. The extra backtick is commented out
- Piggybacking
	- Same as premature but you chain commands with a semicolon
- EOL Comments
	- Same as premature but you bypass any other required fields
	- Normal Query: Select * FROM users WHERE username = 'username'
	- SQLi Query: Select * FROM users WHERE username = ' 'OR '1'='1' ;-- '
		- First backtick closes the string
		- 'OR '1'='1'' always evals to true therefore bypasses any checks
		- -- Comments out the rest of the line, ignoring the rest of the variables
		- This fully bypasses any password requirements and the TA can auth into any user
- Displaying database schema
	- Inject the following
		- '; UNION SELECT * FROM information_schema.tables; --
		- INFORMATION_SCHEMA provides access to db metadata this particular example is for MySQL
		- Other terms are DATA_DICTIONARY and SYSTEM_CATALOG
- Blind Injections
	- Conditional Responses
	- SQL Errors
	- Time Delays
- Second Order SQLi


Finding a target that is vulnerable to SQLi
- Insert a single ' to the end of a string. If a syntax error is returned that means SQLi is possible
- Can be done via google dorking
	- search for 'index.php?id='
		- append a 1 and a '. If an error is returned then the site is vulnerable to SQLi

SQLi Countermeasures
- **Blacklisting:**
    - Utilizes a list of known malicious SQL injection patterns to block or sanitize input matching these patterns, preventing unauthorized SQL code execution.
- **Escape Characters:**
    - Involves using escape characters (e.g., `\` in MySQL) to treat special characters within user input as literal characters, preventing them from being interpreted as SQL code.
- **Whitelisting:**
    - Defines an allowed set of characters or patterns, permitting only input that matches the predefined whitelist and rejecting any input that deviates from it.
- **HexEncoding:**
    - Encodes special characters in hexadecimal format before including them in SQL queries, making it more challenging for attackers to inject malicious code.
- **Limit Privileges:**
    - Ensures that database accounts used by applications have the least privilege necessary to perform their tasks, minimizing the potential impact of a successful SQL injection attack.
- **Encrypt Sensitive Data:**
    - Implements encryption for sensitive data at rest and in transit, safeguarding it from unauthorized access, even if a SQL injection vulnerability is exploited. Encryption adds an additional layer of security to protect data confidentiality.


Why SQLi Works
- **Concatenation of SQL Queries:**
	- Many applications dynamically construct SQL queries by concatenating strings with user-provided input. If the input is not properly validated or sanitized, an attacker can inject malicious SQL code into the query.
- **Lack of Parameterization:**
	- Failure to use parameterized queries or prepared statements can expose applications to SQL injection. Parameterized queries separate user input from SQL code, making it difficult for attackers to inject malicious content.
- **Insufficient Input Validation:**
	- If an application does not validate user input rigorously, it becomes susceptible to SQL injection. Inadequate validation allows attackers to provide unexpected input, including specially crafted SQL statements.
- **Inadequate Sanitization:**
	- Improperly sanitized input allows malicious characters to be included in SQL queries. Sanitization processes should neutralize or escape special characters to ensure they are treated as literal values, not executable code.
- **Trust in User Input:**
	- Trusting user input without verification is a fundamental flaw. Applications should treat all user-provided data as untrusted and apply appropriate validation and sanitization measures.
- **Failure to Apply Principle of Least Privilege:**
	- If database accounts used by applications have excessive privileges, an attacker exploiting a SQL injection vulnerability gains more control over the database. The principle of least privilege recommends using accounts with minimal necessary permissions.
- **Lack of Security Controls
	- Absence or inadequacy of security controls, such as web application firewalls (WAFs) or intrusion detection systems, can result in missed opportunities to detect and prevent SQL injection attacks.
- **Incomplete Error Handling:**
	- Revealing detailed error messages to users can provide attackers with valuable information about the database structure. Applications should handle errors gracefully without disclosing sensitive details.


#### Book Questions
- **What are the different types of SQL injection attacks?**
	- **Classic SQL Injection:**
		- Injecting malicious SQL code directly into user input fields.
	- **Union-Based SQL Injection:**
		- Exploiting the `UNION` SQL operator to combine results from injected queries with the original query.
	- **Time-Based Blind SQL Injection:**
		- Exploiting time delays in database responses to infer information about the database.
	- **Error-Based SQL Injection:**
		- Exploiting error messages generated by the database to gather information about the database structure.
	- **Boolean-Based Blind SQL Injection:**
		- Injecting SQL code that evaluates to either true or false, based on which the application's behavior can be manipulated.
	- **Out-of-Band SQL Injection:**
		- Sending data out of the database using different channels (e.g., DNS requests) to exfiltrate information.
	- **Second-Order SQL Injection:**
		- Injecting malicious code that does not directly affect the application but is stored and executed later.
	- **Content-Based Blind SQL Injection:**
		- Exploiting different responses from the application based on true or false conditions.
	- **Function-Based SQL Injection:**
		- Injecting malicious SQL code into database functions, such as `SLEEP` or `WAITFOR DELAY`.
- **What risks are associated with SQL injection attacks?**
	- **Unauthorized Access**:
		- Attackers can bypass authentication and gain unauthorized access to sensitive data.
	- **Data Manipulation**:
		- Attackers can modify, delete, or insert data into the database, causing integrity issues.
	- **Information Leakage**:
		- SQL injection can reveal sensitive information, such as database schema or error messages, aiding further attacks.
	- **Denial of Service**:
		- By injecting resource-intensive queries, attackers can cause the database to become slow or unresponsive.
	- **Application Defacement**:
		- Attackers may manipulate queries to alter the appearance or functionality of the application.
- **What preventive measures are possible against SQL injection attacks?**
	- **Input Validation:**
		- Validate and sanitize user input to ensure it adheres to expected formats and ranges.
	- **Parameterized Queries:**
		- Use prepared statements or parameterized queries to separate user input from SQL code.
	- **Stored Procedures:**
		- Use stored procedures to encapsulate SQL logic and reduce the risk of injection.
	- **Least Privilege Principle:**
		- Assign minimal necessary database privileges to application accounts.
	- **Web Application Firewall (WAF):**
		- Implement WAFs to filter and block malicious SQL injection attempts.
	- **Regular Security Audits:**
		- Conduct regular security audits and code reviews to identify and address vulnerabilities.
	- **Error Handling:**
		- Implement custom error handling to avoid revealing sensitive information to attackers.
	- **Security Training:**
		- Train developers and administrators on secure coding practices and the risks associated with SQL injection.
	- **Database Encryption:**
		- Encrypt sensitive data at rest and in transit to protect it from unauthorized access.
	- **Patch and Update:**
		- Keep database systems and application frameworks up-to-date to patch known vulnerabilities.

# Transaction Processing
Transaction is an atomic unit of work that consists of a series of DB operations. Due to its atomicity Transactions adhere to the ACID properties
- Atomicity - Each transaction is treated as a single, indivisible unit of work. All of the changes in the transaction are committed or not at all
- Consistency - Each transaction brings the database from one valid state to another. Must satisfy set of integrity constraints before and after a transaction.
- Isolation - Each transaction is not aware of other transactions until commit. Ensures the result is such that of if the transactions had be executed serially instead of in parallel
- Durability - 
Example:
- User sends a query that transfers 400,000 from checking to savings
- Database sees it like this:
	- read(Checking)
	- read(Savings)
	- sub 400,000 from Checking
	- add 400,000 to Saving
	- write(Checking)
	- write(Savings)

Transaction states:
- BEGIN_TRANSACTION: Start of transaction
- READ/WRITE: Two possible operations on data
- END_TRANSACTION: End of read/write operations. Verify data is modified as expected
- COMMIT_TRANSACTION: Successful end of transaction
- ROLLBACK: Unsuccessful end of transaction. Revert changes



---
# Data Modeling
# ERD/EERD

(NOTE:: Do Lab tasks as well yaad se)

# Relational Models
# SQL
###### Graded Class Activity (SQL Practice) | Mark as done here
# A1
# S1 Past Paper
---
# A2
# Functional Dependencies
# Normalization
# Relational Alegbra
# Query Optimization
# S2 Past Paper
# A3, A4, A5
---