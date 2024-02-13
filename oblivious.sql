--create Node table
CREATE TABLE Node(
	id SERIAL NOT NULL PRIMARY KEY,
	parent_id INT,
	label VARCHAR(20),
	value VARCHAR(255),
	FOREIGN KEY (parent_id) REFERENCES Node (id),
	CONSTRAINT CC1 CHECK(TYPE IN ("element", "attribute"))
)

--insert data from tree1.xml
INSERT INTO Node (parent_id, label, value)
VALUES 
	(NULL, 'family', NULL),
	(1, 'person', NULL),
	(2, 'ID', 373054),
	(2, 'FirstName', 'Jason'), 
	(2, 'LastName', 'Lee'), 
	(2, 'Age', 29)
	(2, 'DOB', '1995-02-03'), 
	(2, 'FatherName', 'Jacky Lee'), 
	(2, 'MotherName', 'Lisa Lee')
	 
--query for persons born between 1970 and 1980
SELECT * 
FROM Node
WHERE Age BETWEEN 1970 AND 1980
