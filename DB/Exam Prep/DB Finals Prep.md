> [!NOTE]
>Well this is a lot

| Topic                            | Status                              |
| -------------------------------- | ----------------------------------- |
| Final topics                     | Did these first as i missed classes |
| NoSQL                            | :x:                                 |
| SQL Injection                    | :x:                                 |
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
| Transaction Processing           | :x:                                 |
| CAP Theorem                      | :x:                                    |

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

NOSQL stands for:
- NOT relational
- NOT RDBMS
- NOT Only SQL (IK i didnt get this either)
- Any database/datastore that isnt an RDBMS can be classified as NOSQL if it follows these rules:
	- Collection of several varied but related concepts on data storage and manipulation
	- Often related to big data
	- Class of products i.e mongoDB has atlas, and a whole lot of stuff

NOSQL was tailored for big data
**Data is considered Big Data**:
- When capacity is >= 1TB
- Has the following charecteristics
	- Greater Variety, less structure
	- Arrives in growing volumes
	- Arrives in growing velocity
- An example is social media, S3 solutions, need of dynamically-typed data with frequent schema changes
	- Data from the internet is massive and sparse, generally unstructured or semi-structured at best
### RDBMS (Relational Database Management System)
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

#### Origins of NOSQL
-

### CAP Theorem

## Book Questions

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


# SQL Injection
# Transaction Processing

---
# Data Modeling
# ERD/EERD

(NOTE:: Do Lab tasks as well yaad se)

# Relational Models
# SQL
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