## SQL Commands 
- DDL 
	- **Create:** Create new database objects like tables and/or schemas
		- **Constraint:** A rule or condition applied to a table column to maintain data integrity.
			- **Not Null:** Column cannot contain NULL values, meaning it must always have a value.
			- **Unique:** All values in a column are unique across all rows in a table, preventing duplicate entries.
			- **Primary Key:** A combination of the "Unique" and "Not Null" constraints. It uniquely identifies each row in a table and does not allow NULL values.
			- **Foreign Key:** A constraint that establishes a link between two tables. It ensures that the values in a column of one table match the values in a column of another table, typically referring to a primary key.
			- **Check:** Imposes a condition or rule on the values that can be inserted or updated in a column, ensuring data consistency.
			- **Default:** Specifies a default value for a column when no value is provided during an insertion.
	- **Alter:** Modify the structure of existing database objects.
	- **Drop:** Delete or remove database objects like tables or indexes.
- DML
	- **Insert_Into:** Add new records (rows) into a table.
		- A DBMS not supporting referential integrity will allow insertion even if the referential integrity constraint is violated.
			- If a NOT NULL is enforced then an insert command with a null attribute will be rejected
		- **Insert_Into_Select:** Allows multiple rows to be copied from one or more tables to another
	- **Update:** Modify all existing records (rows) in a table unless WHERE is specified.
	- **Delete:** Remove all records (rows) from a table unless WHERE is specified.


### Select Statement
- Select definition
- Selectings rows/cols
- Sortign
- aggreating
- grouping
- + other stuff `fill in later`