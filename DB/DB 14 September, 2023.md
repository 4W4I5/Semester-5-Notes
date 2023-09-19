To show the ER-relations in RM notation form
- Make lots of tables instead of pretty drawings


Entity with MVA
- Represent with 2 relations
	- One will be keyed to the other relation table which shows the simple attributes (Does not fix the duplication problem however)
- Example: EMP -> **eID**, eName, city
	- EMP entry
		- key of 
			- table 1
				- eID, eName
				- eID, eCity

1-M
- suppose A is one to many of B
	- A(a1,a2)
	- B(b1,b2,a1)
	- Cardinality
		- B will hold a part of A
		- A = Dept, B = Employee then B will also have the DeptID of where the employee is working
	- Participation
		- just write a phrase ez
	- Entity-Entitty
		- A weak entity will always be fully dependent on the strong entity
	- Therefore RM Notation will be
		- DEPT(**dID**, dName)
		- EMP(**empID**, empName, *dID*)
M-N
- Same as 1-M but create a table for the relation R as well, R(r1, a1, b1)
	- Example
		- Author(AName, AID)
		- Book(BID, BName)
		- Writes(CompletionDate, AID, BID) where AID + BID is the primary key
1-1
- `Fill in later`