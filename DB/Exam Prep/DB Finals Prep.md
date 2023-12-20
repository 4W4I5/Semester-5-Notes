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
To understand NOSQL or NRDBMS we need to understand RDBMS i.e. the database management software we are used to (MS SQL Server or SSMS)

A standard project with a database system involves:
- Endusers that can
	- Request data through an application. Think of webforms in db lab project
- A DBMS
- A Database structure
	- Metadata for the tables created
	- Enduser data i.e. the tables we create

NOSQL was tailored for big data
**Data is considered Big Data**:
- When
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
# SQL Injection
# Transaction Processing
# CAP Theorem
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