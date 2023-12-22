> [!NOTE]
>Well this is a lot

| Topic                            | Status                              |
| -------------------------------- | ----------------------------------- |
| Final topics                     | Did these first as i missed classes |
| NoSQL                            | :white_check_mark:                  |
| CAP Theorem                      | :white_check_mark:                                 |
| SQL Injection                    | :white_check_mark:                                 |
| Transaction Processing           | :white_check_mark:                                 |
| Starting from the first lectures | ThanosMemeBalancedAsItShouldBe.jpg  |
| Data Modeling                    | :white_check_mark:                                 |
| ERD/EERD                         | :white_check_mark:                                 |
| Relational Models                | :white_check_mark:                                 |
| SQL                              | :warning:                                 |
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
:warning:
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
## Class Task: What is the CAP Theorem and how does it relate to databases

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


## Book Questions
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
- Durability - Once a transaction is committed its effects are permanent. Changes are stored to disk once committed

Transaction states:

- BEGIN_TRANSACTION: Start of transaction
- READ/WRITE: Two possible operations on data. Abort will trigger rollback
	- READ: reads value from db. It is a safe operation
	- WRITE: write to db. Potentially vulnerable operation as db is modified
		- Read-Write Conflict: 3 Problems due to multiple users using the DB at the same time
			- Lost Update:
				- Scenario:
					- Transaction A reads a value from a database.
					- Transaction B reads the same value.
					- Transaction A updates and writes the value back to the database.
					- Transaction B updates and writes the same value back to the database, overwriting the changes made by Transaction A.
				- Result:
					- The changes made by Transaction A are lost, and the final value in the database reflects only the changes made by Transaction B.
			- Temporary Inconsistency (Dirty Read):
				- Scenario:
					- Transaction A updates a value in the database but has not yet committed the changes.
					- Transaction B reads the updated value before Transaction A commits.
					- Transaction A decides to roll back its changes.
				- Result:
					- Transaction B has read a value that was temporarily inconsistent and was later rolled back. This can lead to inaccurate information being used by Transaction B.
			- Inconsistent Retrieval (Non-repeatable Read):
				- Scenario:
					- Transaction A reads a value from the database.
					- Transaction B updates and commits changes to the same value.
					- Transaction A reads the same value again.
				- Result:
					- The value read by Transaction A in the second read is different from the value it read in the first read. The inconsistency arises because the value was updated by Transaction B between the two reads.
- END_TRANSACTION: End of read/write operations. Verify data is modified as expected. Transactions are considered partially committed at this stage. Abort will trigger rollback
- COMMIT_TRANSACTION: Successful end of transaction
- ROLLBACK: Unsuccessful end of transaction. Revert changes
Example:
- User sends a query that transfers 400,000 from checking to savings
- Database sees it like this:
	- BEGIN_TRANSACTION
	- READ(Checking)
	- READ(Savings)
	- sub 400,000 from Checking
	- add 400,000 to Saving
	- WRITE(Checking)
	- WRITE(Savings)
	- END_TRANSACTION
	- COMMIT_TRANSACTION if successful, else ROLLBACK

DB ROLLBACK

- Logs are used to rollback in event of failure.
- Contains each list of transactions with each step performed. Restores DB to last point of consistency
	- Checkpoints are used to declare a point where dbms was consistent i.e. clear before performing a transaction in order to save log space in case of failure
	- Schedule is arranged to execute transactions in order. A schedule contains multiple transactions with the operations interleaved into one
		- Transaction T1: r1(X); w1(X); r1(Y); w1(Y); c1
		- Transaction T2: r2(X); w2(X); c2
		- A schedule S: r1(X); r2(X); w1(X); r1(Y); w2(X); w1(Y); c1; c2
- Two operations conflict if they satisfy ALL three conditions:
	- they belong to different transactions AND
	- they access the same item AND
	- at least one is a write_item()operation
	- Example:
		- S: r1(X); r2(X); w1(X); r1(Y); w2(X); w1(Y);

## Book questions
- **What is meant by the concurrent execution of database transactions in a multiuser system? Discuss why concurrency control is needed, and give informal examples.**
  - _Concurrency in Database Transactions:_
    - Concurrent execution refers to multiple transactions being executed simultaneously in a multiuser database system.
    - _Why Concurrency Control is Needed:_
      - To ensure data consistency and avoid conflicts that can arise when multiple transactions access and modify the same data concurrently.
    - _Informal Examples:_
      - Example 1: Transaction A reads a value, and Transaction B updates the same value concurrently.
      - Example 2: Multiple users transferring money between accounts simultaneously.
- **Discuss the different types of failures. What is meant by catastrophic failure?**
  - _Types of Failures:_
    - **Transaction Failures:**
      - Occur when a transaction cannot be completed due to errors.
    - **System Failures:**
      - Result from faults in the hardware or software infrastructure.
    - **Media Failures:**
      - Data loss due to disk or storage failures.
  - _Catastrophic Failure:_
    - **Definition:**
      - A severe, system-wide failure that leads to a complete shutdown or loss of significant functionality.
    - **Example:**
      - A major hardware failure that disables an entire data center.
- **Discuss the actions taken by the read_item and write_item operations on a database.**
  - _read_item Operation:_
    - Retrieves the value of an item from the database without modifying it.
  - _write_item Operation:_
    - Modifies the value of an item in the database.
- **Draw a state diagram and discuss the typical states that a transaction goes through during execution.**
  - _State Diagram:_
    - _Typical States:_
      - **Active:** Transaction is actively executing.
      - **Partially Committed:** Transaction has completed its operations and awaits final commitment.
      - **Committed:** Changes made by the transaction are permanently saved.
      - **Aborted/Rolled Back:** Transaction is canceled, and any changes made are undone.
- **What is the system log used for? What are the typical kinds of records in a system log? What are transaction commit points, and why are they important?**
  - _System Log Purpose:_
    - Records transactions and system events to facilitate recovery and maintain database integrity.
  - _Typical Records:_
    - **Start Transaction, Write, Commit, Abort, Checkpoint, End Transaction.**
  - _Transaction Commit Points:_
    - **Definition:**
      - Points in a transaction where all changes made so far are guaranteed to be permanent.
    - **Importance:**
      - Critical for recovery; transactions can be reliably committed or rolled back from commit points.
- **Discuss the atomicity, durability, isolation, and consistency preservation properties of a database transaction.**
  - _Atomicity:_
    - Ensures that a transaction is treated as a single, indivisible unit of work.
  - _Durability:_
    - Guarantees that once a transaction is committed, its changes are permanent and survive system failures.
  - _Isolation:_
    - Ensures that each transaction appears to execute in isolation from others, preventing interference.
  - _Consistency Preservation:_
    - Maintains the consistency of the database, ensuring it transitions from one valid state to another.
- **What is a schedule (history)? Define the concepts of recoverable, cascadeless, and strict schedules, and compare them in terms of their recoverability.**
  - _Schedule (History):_
    - A chronological sequence of operations from multiple transactions.
  - _Recoverable Schedule:_
    - **Definition:**
      - Allows for the recovery of the database to a consistent state after a transaction failure.
    - **Property:**
      - The commit of a transaction is recorded in the log before any subsequent transactions read or write the same data.
  - _Cascadeless Schedule:_
    - **Definition:**
      - Ensures that a transaction cannot read data that has been written by a transaction that was later aborted.
    - **Property:**
      - Aborting a transaction does not affect other transactions.
  - _Strict Schedule:_
    - **Definition:**
      - Ensures that transactions cannot read or write data until the previous transaction's changes are committed.
    - **Property:**
      - Guarantees a high level of isolation but may limit concurrency.
- **What is the difference between the constrained write and the unconstrained write assumptions? Which is more realistic?**
  - _Constrained Write:_
    - **Definition:**
      - Assumes that a transaction can write a data item only if it has previously read the item.
    - **Realism:**
      - May be overly restrictive for certain scenarios.
  - _Unconstrained Write:_
    - **Definition:**
      - Assumes that a transaction can write a data item without having to read it first.
    - **Realism:**
      - More flexible but may lead to potential conflicts.
- **Define the violations caused by each of the following: dirty read, non-repeatable read, and phantoms.**
  - _Dirty Read:_
    - **Violation:**
      - Occurs when one transaction reads uncommitted changes made by another transaction.
  - _Non-repeatable Read:_
    - **Violation:**
      - Occurs when a transaction reads a data item multiple times, and the values differ due to concurrent updates by other transactions.
  - _Phantoms:_
    - **Violation:**
      - Occurs when a transaction reads a set of data items multiple times, and the set of items changes between reads due to other transactions.

   
---
# Data Modeling + ERD/EERD
## Basic stuff
- Data = Raw Facts
	- Volume, Velocity and Variety
	- Used to filter and extract valuable information
- Information = Precise Data
- Knowledge = Derived from information using intelligence
- Base = Center of operations
- Disadvantages of using files as a data management system
	- Lack of data integrity, consistency, no maintenance or recovery/backup, scalability and access issues, limited querying and response time
	- Data inconsistency which happens due to manual updating and hard to access
	- Data redundancy (storing same info repeatedly), happens because copying files and saving files with slight differences
	- Data isolation (scattered data, no data relationships between data points)
	- Atomicity problem: lack of transactional mechanisms and centralized control
- Stages of designing a database
	- Design - Define structure and type of data
	- Construct - Create structures and fill with data
	- Manipulation - Create, Write, Read, Update & Delete
	- Query - Request Data for manipulation
	- Create Reports - Presentation of data that conveys info
- Modelling data
	- Entities
		- Always a singular noun: Student not students as the col header
		    - Person, Place, Object, Event, Concept
		    - Can be tangible/intangible
		        - Examples
		            - Tangible: Person, Place & Object
		            - Intangible: Event(Verbs) & Concept(Account, Course, Patient's Health History, Budget)
		        - Represented by a rectangle
		        - Types
			        - Strong
				        - Key attribute, can be uniquely identified
			        - Weak
				        - Cannot be uniquely identified from its own attributes
				        - Contains partial keys
				        - Represented with double rectangles
				        - Can be changed to a strong entity through an identifying relationship i.e. 1-1 or 1-M relation with full participation of the weak entity
	- Attributes
	    - Types of attributes
	        - Simple Attribute:
	            - A single, indivisible value that cannot be further divided. For example, the "Name" attribute of a customer entity.
	        - Composite Attribute:
	            - An attribute composed of multiple sub-attributes with independent meanings. For instance, the "Address" attribute might have sub-attributes like "Street," "City," "State," and "Zip Code."
	            - Shown as an attribute that branches out in diagrams
	        - Derived Attribute:
	            - An attribute that can be derived or calculated from other attributes in the database. For example, the "Age" attribute can be derived from the "Date of Birth" attribute.
	            - Has a dashed line in diagrams
	        - Key Attribute:
	            - An attribute that is part of the primary key of an entity, used to uniquely identify records within the entity.
	            - Underlined label in diagram
	        - Multi-valued Attribute:
	            - An attribute that can hold multiple values for a single entity. For example, the "Phone Numbers" attribute of a person entity could hold multiple phone numbers.
	            - Secondary edge in diagram
	        - Null Attribute:
	            - An attribute that can have a null or missing value, indicating that the data is not applicable or unknown for that entity.
	        - Complex Attribute:
	            - An attribute that has both simple and composite attributes as components. This type of attribute can have its own set of attributes. For instance, an attribute "Education" might have sub-attributes like "Degree" and "University."
	        - Stored Attribute:
	            - An attribute that is permanently stored in the database. This is in contrast to derived attributes, which are calculated when needed.
	        - Multivalued Dependency:
	            - A type of dependency between attributes in which an attribute depends on another attribute through a third, multivalued attribute.
	        - Key Dependency:
	            - An attribute that is functionally dependent on part of the primary key.
	        - Partial Dependency:
	            - A situation in which an attribute depends on only part of a composite primary key.
	        - Transitive Dependency:
	            - A dependency in which an attribute depends on another non-key attribute, which in turn depends on the primary key.
	- Constraints
	    - Primary Key Constraint:
	        - Ensures that each row in a table is uniquely identifiable. Often corresponds to a unique identifier for an entity (e.g., Customer ID).
	    - Foreign Key Constraint:
	        - Establishes relationships between tables by referencing the primary key of another table. Ensures referential integrity.
	    - Unique Constraint:
	        - Ensures that the values in a specific column or set of columns are unique across the table.
	    - Not Null Constraint:
	        - Ensures that a column cannot have a null (empty) value.
	    - Check Constraint:
	        - Defines a condition that values must satisfy (e.g., age > 18) for insertion or update.
	    - Default Constraint:
	        - Provides a default value for a column if no value is specified during insertion.
	    - Entity Integrity Constraint:
	        - Requires that a primary key value is not null, ensuring the uniqueness and identification of records.
	- Relationships
		- Degrees
			- Unary
				- Recursive
				- Used for specialized entities from generic i.e. a manager is still an employee but they manage other employees
			- Binary
				- One entity works with another
			- Ternary
				- When two relationships are related they can be combined into one
					- Doctor prescribes medicine
					- Medicine is prescribed to the patient
					- This can be shown by Doctor prescribes medicine to the patient
		- Cardinality
			- One-to-One Relationship:
				- One record in the first table is related to at most one record in the second table, and vice versa.
			- One-to-Many Relationship:
				- One record in the first table is related to one or more records in the second table, but each record in the second table is related to only one record in the first table.
			- Many-to-Many Relationship:
				- Multiple records in the first table are related to multiple records in the second table. This type of relationship requires a junction table.
			- Self-Referential Relationship:
				- A relationship where entities in the same table are related to each other. For example, an employee may have a manager who is also an employee.
		- Participation
			- Shown by double line for full participation i.e. at least one of the object must exist or single line for partial where the object can exist independently of each other


## EERD
- Generalization approach –some attributes can be common or not. Consist of subclasses and superclass.
	- D -> disjoint i.e. a person cannot be all three entities at the same time
	- O -> overlapping i.e. a person can be all three entities at the same time. Person has total participation because a parent will at least have a parent (dead/alive)


## Book Questions for both ERD and Datamodelling
- **Discuss the role of a high-level data model in the database design process.**
  - A high-level data model provides an abstraction of the database, focusing on essential concepts and relationships. It helps in understanding and representing the organization's data requirements before diving into specific technical details. It aids communication between stakeholders, guides the design process, and serves as a blueprint for creating a detailed database schema.
- **List the various cases where use of a NULL value would be appropriate.**
  - - **Unknown Information:**
    - When the actual value is unknown or undefined.
  - **Not Applicable:**
    - When a value is not applicable in a certain context.
  - **Optional Information:**
    - For attributes that are optional or may not have a value.
- **Define the following terms: entity, attribute, attribute value, relationship instance, composite attribute, multivalued attribute, derived attribute, complex attribute, key attribute, and value set (domain).**
  - _(Definitions not provided due to the volume of terms.)_
- **What is an entity type? What is an entity set? Explain the differences among an entity, an entity type, and an entity set.**
  - - **Entity Type:**
    - A collection of entities that share common characteristics or properties.
  - **Entity Set:**
    - The actual set of entities belonging to an entity type.
  - **Entity:**
    - A unique instance of an entity type.
- **Explain the difference between an attribute and a value set.**
  - - **Attribute:**
    - A property or characteristic of an entity type.
  - **Value Set:**
    - The set of values that an attribute can take.
- **What is a relationship type? Explain the differences among a relationship instance, a relationship type, and a relationship set.**
  - - **Relationship Type:**
    - A collection of relationship instances sharing common characteristics.
  - **Relationship Instance:**
    - A specific occurrence of a relationship between entities.
  - **Relationship Set:**
    - The actual set of relationship instances belonging to a relationship type.
- **What is a participation role? When is it necessary to use role names in the description of relationship types?**
  - - **Participation Role:**
    - Describes the role that an entity plays in a relationship.
  - **Necessity of Role Names:**
    - Necessary when an entity participates more than once in a relationship type to distinguish roles.
- **Describe the two alternatives for specifying structural constraints on relationship types. What are the advantages and disadvantages of each?**
  - _(Descriptions not provided due to the volume of information.)_
- **Under what conditions can an attribute of a binary relationship type be migrated to become an attribute of one of the participating entity types?**
  - When the attribute is specific to one entity in the relationship and not shared by both.
- **When we think of relationships as attributes, what are the value sets of these attributes? What class of data models is based on this concept?**
  - - **Value Sets:**
    - The value sets are sets of relationship instances.
  - **Data Model:**
    - Based on the concept of relationships as attributes, this falls under the class of Semantic Data Models.
- **What is meant by a recursive relationship type? Give some examples of recursive relationship types.**
  - - **Recursive Relationship Type:**
    - A relationship type where an entity is related to itself.
  - **Example:**
    - Employee manages other employees within the same organization.
- **When is the concept of a weak entity used in data modeling? Define the terms owner entity type, weak entity type, identifying relationship type, and partial key.**
  - _(Definitions not provided due to the volume of information.)_
- **Can an identifying relationship of a weak entity type be of a degree greater than two? Give examples to illustrate your answer.**
  - - **Identifying Relationship Degree:**
    - No, it cannot be greater than two.
  - **Examples:**
    - Illustrations not provided due to the volume of information.
- **Discuss the conventions for displaying an ER schema as an ER diagram.**
  - _(Discussion not provided due to the volume of information.)_
- **Discuss the naming conventions used for ER schema diagrams.**
  - _(Discussion not provided due to the volume of information.)_

# Relational Models
## Keys
- Keys as a Determinant
    - Key is a combination of one or more attributes that is used to identify a record related to an entity
    - based on a concept known as determination, it determines what attributes a (forgot, fill in with slides)
        - ROLLNUM in STUDENT would enable lookup of other attributes in the same record
    - Types of keys
        - **Primary Key (PK)**:
            - Uniquely identifies each row in a table.
            - Ensures data integrity by preventing duplicate or null values.
            - ADV:
                - Ensures data integrity by enforcing uniqueness.
                - Speeds up data retrieval operations, as searching by the primary key is typically faster.
        - **Foreign Key (FK)**:
            - Links a column in one table to the primary key of another table.
            - Establishes relationships between tables in a relational database.
            - ADV:
                - Maintains data integrity by enforcing referential integrity constraints.
                - Facilitates relationships between tables, enabling data consistency.
        - **Super Key**:
            - A set of one or more attributes (columns) that can uniquely identify a row in a table.
            - It may include more attributes than necessary to be a minimal unique identifier.
            - ADV:
                - Provides a way to uniquely identify rows, ensuring data integrity.
                - Useful for defining constraints and relationships.
        - **Candidate Key**:
            - A minimal super key, meaning it has the minimum number of attributes required to uniquely identify a row.
            - Often chosen as the primary key for a table.
            - ADV:
                - Speeds up searches as they are indexed and enforce uniqueness.
                - Offers flexibility in choosing the best attribute(s) for primary keys.
        - **Alternate Key**:
            - Candidate keys that are not selected as the primary key.
            - They provide an alternative means of uniquely identifying rows in a table.
            - ADV:
                - Provides additional options for unique identification.
                - Useful for different search criteria or scenarios.
        - **Composite Key**:
            - A primary key composed of two or more attributes.
            - Used when a single attribute cannot uniquely identify rows, but a combination of attributes can.
            - ADV:
                - Allows for complex, multi-attribute unique identification.
                - Enhances data integrity when a single attribute cannot guarantee uniqueness.
        - **Natural Key**:
            - A key that is based on existing, inherent attributes of the data.
            - For example, using a person's Social Security Number as a key in an employee table.
            - ADV:
                - Simplifies data entry and retrieval when using real-world identifiers.
                - Can make the database more intuitive for users.
        - **Surrogate Key**:
            - An artificial key generated by the database system, often as an auto-incrementing integer.
            - Used when there is no suitable natural key or to improve performance.
            - ADV:
                - Improves performance by avoiding the use of complex natural keys.
                - Guarantees uniqueness, even when natural keys are not available or practical.
        - **Compound Key**:
            - A key that consists of two or more attributes, but it may not be minimal like a composite key.
            - It's used to enforce uniqueness based on a combination of attributes.
            - ADV:
                - Offers a way to ensure uniqueness based on a combination of attributes.
                - Useful for scenarios where no single attribute is sufficient for unique identification.
        - **Partial Key**:
            - An attribute that is part of a candidate key but not a super key by itself.
            - It contributes to the uniqueness of a row when combined with other attributes.
            - ADV:
                - Contributes to uniqueness when combined with other attributes.
                - Can be part of a candidate key to ensure data integrity.
## Mappings
### Regular Entity with Simple Attributes
- **Relational Notation:** EntityName(**Attribute1**, Attribute2, Attribute3)
- **Example Table:**

  | Attribute1 | Attribute2 | Attribute3 |
  |------------|------------|------------|
  | Value1     | Value2     | Value3     |

- **Note:** Each attribute represents a single, indivisible piece of data.

### Regular Entity with Composite Attributes
- **Relational Notation:** EntityName(**CompositeAttr1**, CompositeAttr2, Attribute3)
- **Example Table:**

  | CompositeAttr1 | CompositeAttr2 | Attribute3 |
  |----------------|----------------|------------|
  | (A, B)         | Value2         | Value3     |

- **Note:** Composite attributes are made up of multiple sub-attributes.

### Regular Entity with Multi-valued Attributes
- **Relational Notation:** EntityName(**Attribute1**, MultiValuedAttr, Attribute3)
- **Example Table:**

  | Attribute1 | MultiValuedAttr | Attribute3 |
  |------------|-----------------|------------|
  | Value1     | {A, B, C}       | Value3     |

- **Note:** Multi-valued attributes can have multiple values for a single entity.

### Regular Entity with Derived Attributes
- **Relational Notation:** EntityName(**Attribute1**, Attribute2, DerivedAttr)
- **Example Table:**

  | Attribute1 | Attribute2 | DerivedAttr |
  |------------|------------|-------------|
  | Value1     | Value2     | Calculated  |

- **Note:** Derived attributes are calculated from other attributes.

### Weak Entity
- **Relational Notation:** WeakEntity(**PartialKey**, Attribute2, Attribute3)
- **Example Table:**

  | PartialKey | Attribute2 | Attribute3 |
  |------------|------------|------------|
  | Value1     | Value2     | Value3     |

- **Note:** Weak entities depend on a strong entity for identification.

### Unary Relationships
- **Relational Notation:** EntityName(**Attribute1**, ... , **Foreign_Key_To_Self**)
- **Example Table:**

  | Attribute1 | ... | Foreign_Key_To_Self |
  |------------|-----|---------------------|
  | Value1     | ... | Value1              |

- **Note:** Unary relationships involve a foreign key referencing the same entity.

### Binary 1:m Relationship
- **Relational Notation:** Entity1(**Primary_Key**, Attribute2) | Entity2(**Foreign_Key_To_Entity1**, AttributeX)
- **Example Table:**

  | Primary_Key | Attribute2 |    | Foreign_Key_To_Entity1 | AttributeX |
  |-------------|------------|----|-------------------------|------------|
  | Value1      | Value2     |    | Value1                  | ValueX     |
  | Value1      | Value2     |    | Value1                  | ValueY     |

- **Note:** The 1:m relationship involves one entity having multiple related entities.

### Binary M:M Relationship
- **Relational Notation:** Entity1(**Primary_Key**, Attribute2) | JunctionTable(**Foreign_Key1**, **Foreign_Key2**, AttributeX)
- **Example Table:**

  | Primary_Key | Attribute2 |    | Foreign_Key1 | Foreign_Key2 | AttributeX |
  |-------------|------------|----|--------------|--------------|------------|
  | Value1      | Value2     |    | Value1       | ValueA       | ValueX     |
  | Value1      | Value2     |    | Value1       | ValueB       | ValueY     |

- **Note:** The M:M relationship requires a junction table to manage associations.

### Binary 1:1 Relationship with Partial Participation on Both Sides
- **Relational Notation:** Entity1(**Primary_Key**, Attribute2, Foreign_Key_To_Entity2) | Entity2(**Primary_Key**, AttributeX, Foreign_Key_To_Entity1)
- **Example Table:**

  | Primary_Key | Attribute2 | Foreign_Key_To_Entity2 |    | Primary_Key | AttributeX | Foreign_Key_To_Entity1 |
  |-------------|------------|-------------------------|----|-------------|------------|-------------------------|
  | Value1      | Value2     | ValueX                  |    | ValueX      | ValueA     | Value1                  |

- **Note:** In a 1:1 relationship, both sides have a foreign key to the other.

### Binary 1:1 Relationship with Total Participation on Both Sides
- **Relational Notation:** Entity1(**Primary_Key**, Attribute2) | Entity2(**Primary_Key**, AttributeX, Foreign_Key_To_Entity1)
- **Example Table:**

  | Primary_Key | Attribute2 |    | Primary_Key | AttributeX | Foreign_Key_To_Entity1 |
  |-------------|------------|----|-------------|------------|-------------------------|
  | Value1      | Value2     |    | ValueX      | ValueA     | Value1                  |

- **Note:** Total participation means every entity on both sides must be involved in the relationship.

### N-ary Number of Relations
- **Relational Notation:** Entity1(**Primary_Key**, Attribute2) | Entity2(**Primary_Key**, AttributeX, Foreign_Key_To_Entity1) | ... | EntityN(**Primary_Key**, AttributeN, Foreign_Key_To_Entity1, ... , Foreign_Key_To_EntityN-1)
- **Example Table:**
  | Primary_Key | Attribute2 |    | Primary_Key | AttributeX | Foreign_Key_To_Entity1 | ... | Primary_Key | AttributeN | Foreign_Key_To_Entity1 |

 ... | Foreign_Key_To_EntityN-1 |

  |-------------|------------|----|-------------|------------|-------------------------|---|-------------|------------|-------------------------|---|---------------------------|

  | Value1      | Value2     |    | ValueX      | ValueA     | Value1                  |   | ValueN      | ValueN-1   | Value1                  |   | ValueN-1                  |

- **Note:** N-ary relationships involve more than two entities in the relationship.




#### Book questions
- **Define the following terms as they apply to the relational model of data:**
  - - **Domain:**
    - The set of allowable values for an attribute.
  - **Attribute:**
    - A property or characteristic of an entity represented in a table.
  - **N-tuple:**
    - A row or record in a relation containing ordered values.
  - **Relation Schema:**
    - Describes the structure of a relation, including attributes and their domains.
  - **Relation State:**
    - The current set of tuples in a relation.
  - **Degree of a Relation:**
    - The number of attributes in a relation.
  - **Relational Database Schema:**
    - A collection of relation schemas defining the structure of a database.
  - **Relational Database State:**
    - The current set of relations in a database.
- **Why are tuples in a relation not ordered?**
  - Tuples represent unordered sets of values, and the relational model focuses on the existence of relationships rather than the order of elements within a tuple.
- **Why are duplicate tuples not allowed in a relation?**
  - Duplicate tuples would violate the uniqueness property of a relation, making it challenging to ensure consistency and causing ambiguity in data retrieval.
- **What is the difference between a key and a superkey?**
  - - **Key:**
    - A minimal set of attributes that uniquely identifies a tuple.
  - **Superkey:**
    - A set of attributes that uniquely identifies a tuple, possibly containing more attributes than necessary.
- **Why do we designate one of the candidate keys of a relation to be the primary key?**
  - Designating one candidate key as the primary key simplifies data retrieval, enforces uniqueness, and serves as a reference for foreign keys in other relations.
- **Discuss the characteristics of relations that make them different from ordinary tables and files.**
  - Relations are unordered sets of tuples, have no duplicate tuples, and follow a specific schema, ensuring data consistency and facilitating relational operations.
- **Discuss the various reasons that lead to the occurrence of NULL values in relations.**
  - NULL values may occur due to unknown or undefined information, optional attributes, or attributes with missing or inapplicable values.
- **Discuss the entity integrity and referential integrity constraints. Why is each considered important?**
  - - **Entity Integrity:**
    - Ensures that no primary key attribute in a relation has a NULL value, maintaining uniqueness.
  - **Referential Integrity:**
    - Ensures that foreign key values in a relation correspond to existing primary key values in another relation, preserving relationships.
  - **Importance:**
    - Both constraints maintain data integrity, preventing inconsistencies and ensuring accurate relationships between entities.
- **Define foreign key. What is this concept used for?**
  - - **Foreign Key:**
    - An attribute or set of attributes in one relation that refers to the primary key in another relation.
  - **Usage:**
    - Establishes relationships between tables, enforcing referential integrity.
- **What is a transaction? How does it differ from an Update operation?**
  - - **Transaction:**
    - A sequence of one or more database operations executed as a single unit.
  - **Difference:**
    - An update operation is a single action, while a transaction is a set of operations executed atomically to maintain consistency and integrity in the database.

# SQL
- DDL
    - **Create:** Create new database objects like tables and/or schemas
	 - **COMMAND**: CREATE DBNAME CASCADE | RESTRICT
		 - Restrict, schema must be empty i.e. unique table
		 - Cascade, dropping one table in schema drops the entire thing
        - **Constraint:** A rule or condition applied to a table column to maintain data integrity.
            - **Not Null:** Column cannot contain NULL values, meaning it must always have a value.
            - **Unique:** All values in a column are unique across all rows in a table, preventing duplicate entries.
            - **Primary Key:** A combination of the "Unique" and "Not Null" constraints. It uniquely identifies each row in a table and does not allow NULL values.
            - **Foreign Key:** A constraint that establishes a link between two tables. It ensures that the values in a column of one table match the values in a column of another table, typically referring to a primary key.
            - **Check:** Imposes a condition or rule on the values that can be inserted or updated in a column, ensuring data consistency.
            - **Default:** Specifies a default value for a column when no value is provided during an insertion.
    - **Alter:** Modify the structure of existing database objects.
	    - Clauses
		    - Add/Drop, Modify
		- **COMMAND**:
			- ALTER TABLE ADD/DROP/MODIFY TABLENAME DATA/CONSTRAINT
			- For adding a foreign key a reference is also required from the table you are referencing
    - **Drop:** Delete or remove database objects like tables or indexes.
- DML
    - **Insert_Into:** Add new records (rows) into a table.
        - A DBMS not supporting referential integrity will allow insertion even if the referential integrity constraint is violated.
            - If a NOT NULL is enforced then an insert command with a null attribute will be rejected
        - **Insert_Into_Select:** Allows multiple rows to be copied from one or more tables to another
    - **Update:** Modify all existing records (rows) in a table unless WHERE is specified.
    - **Delete:** Remove all records (rows) from a table unless WHERE is specified. if WHERE clause is not specified all records in the table will be deleted
- Select
	- Clauses
		- FROM - Required, Specifies table(s) to be used
		- WHERE - Filters rows. Condition can have
			- Comparison operators
			- Logical operators
			- Arithmetic operators
			- SubClauses
				- LIKE
				- IN
				- IS
		- GROUP BY - Form groups of rows with the same column value
		- HAVING - Filters groups formed by GROUP BY to some condition
		- ORDER BY - Specifies order of output to ASC or DESC
		- DISTINCT - Returns unique rows, removes duplicates. Affected by SUM/AVG but not MIN/MAX
	- Commands
		- Computing inline
			- SELECT empno, empname, sal\*12 FROM emp
		- Renaming inline after computation
			- SELECT empno, empname, sal\*12 salary FROM emp
		- Set Membership search
			- SELECT empno, empname, job, sal FROM emp WHERE job IN ('CLERK', 'MANAGER')
	- Pattern matching
		- Follows regex
			- % matches any N number of charecters
			- \_ Any single charecter
				- Example \%dd\% will match wherever it can find a string containing dd
			- Use LIKE clause for this

#### Joins
- 
## Graded Class Activity (SQL Practice) | Mark as done here
# A1
# S1 Past Paper
---
# A2
# Functional Dependencies
# Normalization
# Relational Algebra
# Query Optimization
# S2 Past Paper
# A3, A4, A5
---