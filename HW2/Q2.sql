-- Database: livesql(Oracle)
-- Name: Ziyu Liu
-- USC NetID: zliu4183
-- CS 585 HW2
-- Fall 2022

CREATE TABLE StudentClass   
(SID CHAR(5) NOT NULL,   
ClassName CHAR(50) NOT NULL,   
Grade CHAR(5) NOT NULL);

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('123', 'Synthesis algorithms', 'A');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('123', 'EDM synthesis', 'B');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('123', 'MIDI controllers', 'B');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('662', 'Sound mixing', 'B');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('662', 'EDM synthesis', 'A');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('662', 'Electronic Music Fundamentals', 'A');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('662', 'MIDI controllers', 'B');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('345', 'MIDI controllers', 'A');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('345', 'Electronic Music Fundamentals', 'B');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('345', 'EDM synthesis', 'A');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('555', 'EDM synthesis', 'B');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('555', 'Electronic Music Fundamentals', 'B');

INSERT INTO StudentClass(SID, ClassName, Grade) VALUES('213', 'Electronic Music Fundamentals', 'A');

SELECT ClassName, COUNT(*) AS Total  
FROM StudentClass  
GROUP BY ClassName  
ORDER BY Total DESC;

