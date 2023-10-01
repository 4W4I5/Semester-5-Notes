## SQL Commands 
- DDL 
	- **Create:** Create new database objects like tables, indexes, or views.
		- **Constraint:** A rule or condition applied to a table column to maintain data integrity.
	- **Alter:** Modify the structure of existing database objects.
	- **Drop:** Delete or remove database objects like tables or indexes.
- DML
	- **Insert:** Add new records (rows) into a table.
		- A DBMS not supporting referential integrity will allow insertion even if the referential integrity constraint is violated.
			- If a NOT NULL is enforced then an insert command with a null attribute will be rejected
		- **Insert_Select:** Allows multiple rows to be copied from one or more tables to another
	- **Update:** Modify all existing records (rows) in a table unless WHERE is specified.
	- **Delete:** Remove records (rows) from a table.


### Select Statement
- Select definition
- Selectings rows/cols
- Sortign
- aggreating
- grouping
- + other stuff `fill in later`