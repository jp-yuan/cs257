--create Node table
CREATE TABLE Node(
	id SERIAL NOT NULL PRIMARY KEY,
	parent_id INT,
	label VARCHAR(20),
	value VARCHAR(255),
	FOREIGN KEY (parent_id) REFERENCES Node (id)
);

--insert data from tree1.xml
INSERT INTO Node (parent_id, label, value)
VALUES 
	(NULL, 'family', NULL),
	(1, 'person', NULL),
	(2, 'FirstName', 'Jason'), 
	(2, 'LastName', 'Lee'), 
	(2, 'Age', 29),
	(2, 'DOB', '1995-02-03'), 
	(2, 'FatherName', 'Jacky Lee'), 
	(2, 'MotherName', 'Lisa Lee');
	 
--query for persons born between 1970 and 1980
SELECT N2.VALUE, N3.VALUE
FROM Node N1, Node N2, Node N3
WHERE N1.LABEL= 'DOB' AND N2.LABEL= 'FirstName' AND N3.LABEL= 'LastName'
AND FORMAT(N1.VALUE, '%Y-%m-%d') BETWEEN '1970-01-01' AND '1980-12-31'
AND N1.parent_id = N2.parent_id
AND N1.parent_id = N3.parent_id
