# Introduction
## Data:
Known facts with specific meaning or interpolation while **information** is a precise, understandable and specific representation of data
- ### Terminology
	- Volume == amount
	- Velocity == speed
	- Variety == range of types and sources
- ### Types
	- #### **Unstructured**: No defined structure or organization
		- **Characteristics**: 
			- Varied, Complex and unorganized
			- Examples: txt files or media such as images, video and audio even social media posts
		- **Pros**
			- Enables capturing of diverse and rich information.
			- Well-suited for capturing human-generated content.
			- Can include valuable insights not captured by structured data.
		- **Cons:**
			- Difficult to process and analyze without preprocessing.
			- Challenging to search and query effectively.
			- Prone to inconsistency and lack of standardization.
	- #### **Semi-Structured**: Doesn't adhere to strict tabular structure but has some sense of organization
		- **Characteristics**: 
			- Flexible, Hierarchical and Tagged
			- Examples: JSON, XML, HTML or NoSQL
		- **Pros:**
			- Offers a balance between flexibility and organization.
			- Allows for easier storage and processing compared to unstructured data.
			- Well-suited for representing hierarchical and nested data.
			- Storing and exchanging data between systems with different protocols/schemes and webscraping
		- **Cons:**
			- Still requires some level of preprocessing for analysis.
			- Lack of strict schema can lead to data quality issues.
			- Querying might be more complex compared to structured data.
	- #### **Structured**: Tabulated data/High level of organization seen by rows & cols
		- **Characteristics**: 
			- Organized, Tabular and Standardized
			- Suited for SQL queries and Data analysis as it is stored in a relational model
		- **Pros:**
			- Easily organized in tabular format, suitable for databases.
			- Supports efficient querying using SQL or other structured query languages.
			- Highly suitable for quantitative analysis and reporting.
		- **Cons:**
			- May not capture the full complexity of real-world scenarios.
			- Limited in representing unstructured or loosely structured information.
			- Changes to the schema can be challenging and require careful migration.


## Filing system:
Still used as the traditional way to handle data generated through paperwork. Used only if a system to handle data in a precise way is still in use and transitioning to a digital means is hard
- ### Issues:
- `Note: These issues also translate over to an actual DBMS as well`
	- **Data Integrity**
		- Definition: Inaccurate/altered documents, issues with maintaining a file.
		- Causes limited querying and response time
	- **Data inconsistency**
		- Definition: Occurs when two or more copies of the same data have conflicting changes and were updated by two people without communication
		- Causes issues with tracking the latest file and also wastes space
	- **Data redundancy**
		- Definition: Duplicate instances of the same record within a system usually caused by saving copies of a file with small differences
		- Causes retrieval of files to be more difficult and also wastes space
	- **Data Isolation**
		- Definition: Same file, scattered between two points with no relationship. In a DMBS this would be due to two users being able to write to a file 
		- Causes confusion, loss of information and inefficiency 
	- **Data Atomicity**
		- Definition: Incomplete/Partial changes made to the data, a write fail can cause the database to 
		- Causes data inaccuracies and compromises reliability of the system

## Database Management System (DBMS)
A digitized system where data is collected and queried
- ### Stages of Creating a DB Model
	- **Design**: Define Structure and what type of data to take in 
		- Process: Create an ERD (Entity-Relationship-Diagram) to define the database's blueprint
	- **Construct**: Create Structure and ingest data
		- Process: Use SQL to create the database that will hold the data it is tailored to
	- **Manipulation of data**: Create, Read, Write, Update and Delete entries
	- **Query**: Request Data
	- **Create Reports**: Present queried Data in a table 
- ### Advantages of using a DBMS
	- **Controlling Redundancy**
	- **Controlled Access**
	- **Persistent Storage for programs**
	- **Efficient Query Processing**
	- **Backup and Recovery**
	- **Multiple User interfaces**
	- **Represent Complex Relationships among data**
	- **Enforce Integrity Constraints**