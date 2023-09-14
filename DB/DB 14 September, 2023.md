To show the relations in notation form

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
M-N
- Same as 1-M but create a table for the relation R as well, R(r1, a1, b1)
	- Example
		- Author(AName, AID)
		- Book(BID, BName)
		- Writes()