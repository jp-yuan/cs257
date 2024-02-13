--create Node table
CREATE TABLE Node(
	ID INT NOT NULL PRIMARY KEY,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	Age INT CHECK (Age BETWEEN 0 AND 100),
	DOB DATE,
	FatherName VARCHAR(255),
	MotherName VARCHAR(255),
)

--insert data from tree1.xml
INSERT INTO Node (ID, FirstName, LastName, Age, DOB, FatherName, Mothername)
VALUES (373054, 'Jason', 'Lee', 29, '1995-02-03', 'Jacky Lee', 'Lisa Lee')

--query for persons born between 1970 and 1980
SELECT * 
FROM Node
WHERE Age BETWEEN 1970 AND 1980
