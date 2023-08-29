# Data modelling: Designing a Database

- ## Database model
	- ### Entities 
	- Always a singular noun: Student not students as the col header
		- Person, Place, Object, Event, Concept
		- Can be tangible/intangible
			- Examples
				- Tangible: Person, Place & Object
				- Intangible: Event(Verbs) & Concept(Account, Course, Patient's Health History, Budget)
			- Represented by a rectangle
	- ### Attributes
		- **Types of attributes**
			- **Simple Attribute:** A single, indivisible value that cannot be further divided. For example, the "Name" attribute of a customer entity.
			- **Composite Attribute:** An attribute composed of multiple sub-attributes with independent meanings. For instance, the "Address" attribute might have sub-attributes like "Street," "City," "State," and "Zip Code."
			- **Derived Attribute:** An attribute that can be derived or calculated from other attributes in the database. For example, the "Age" attribute can be derived from the "Date of Birth" attribute.
			- **Key Attribute:** An attribute that is part of the primary key of an entity, used to uniquely identify records within the entity.
			- **Multi-valued Attribute:** An attribute that can hold multiple values for a single entity. For example, the "Phone Numbers" attribute of a person entity could hold multiple phone numbers.
			- **Null Attribute:** An attribute that can have a null or missing value, indicating that the data is not applicable or unknown for that entity.
			-  **Complex Attribute:** An attribute that has both simple and composite attributes as components. This type of attribute can have its own set of attributes. For instance, an attribute "Education" might have sub-attributes like "Degree" and "University."
			- **Stored Attribute:** An attribute that is permanently stored in the database. This is in contrast to derived attributes, which are calculated when needed.
			- **Multivalued Dependency:** A type of dependency between attributes in which an attribute depends on another attribute through a third, multivalued attribute.
    
10. **Key Dependency:** An attribute that is functionally dependent on part of the primary key.
    
11. **Partial Dependency:** A situation in which an attribute depends on only part of a composite primary key.
    
12. **Transitive Dependency:** A dependency in which an attribute depends on another non-key attribute, which in turn depends on the primary key.
	- ### Constraints
		- **Primary Key Constraint:** 
			- Ensures that each row in a table is uniquely identifiable. Often corresponds to a unique identifier for an entity (e.g., Customer ID).
		- **Foreign Key Constraint:** 
			- Establishes relationships between tables by referencing the primary key of another table. Ensures referential integrity.
		- **Unique Constraint:** 
			- Ensures that the values in a specific column or set of columns are unique across the table.
		- **Not Null Constraint:** 
			- Ensures that a column cannot have a null (empty) value.
		- **Check Constraint:** 
			- Defines a condition that values must satisfy (e.g., age > 18) for insertion or update.
		- **Default Constraint:** 
			- Provides a default value for a column if no value is specified during insertion.
		- **Entity Integrity Constraint:** 
			- Requires that a primary key value is not null, ensuring the uniqueness and identification of records.
	- ### Relationships
		- **One-to-One Relationship:** One record in the first table is related to at most one record in the second table, and vice versa.
		- **One-to-Many Relationship:** One record in the first table is related to one or more records in the second table, but each record in the second table is related to only one record in the first table.
		- **Many-to-Many Relationship:** Multiple records in the first table are related to multiple records in the second table. This type of relationship requires a junction table.
		- **Self-Referential Relationship:** A relationship where entities in the same table are related to each other. For example, an employee may have a manager who is also an employee.