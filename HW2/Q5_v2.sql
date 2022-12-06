-- Database: livesql(Oracle)
-- Name: Ziyu Liu
-- USC NetID: zliu4183
-- CS 585 HW2
-- Fall 2022

-- Create a table with instructors' name and the subject they could teach
CREATE TABLE InstrSubject  
(Instructor CHAR(30) NOT NULL,   
Subject CHAR(50) NOT NULL   
);

-- Insert data to Table InstrSubject
INSERT INTO InstrSubject(Instructor, Subject) VALUES('Aleph', 'MIDI controllers');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Aleph', 'Sound mixing');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Aleph', 'Synthesis algorithms');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Bit', 'EDM synthesis');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Bit', 'Electronic Music Fundamentals');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Bit', 'Sound mixing');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('CRC', 'EDM synthesis');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('CRC', 'Electronic Music Fundamentals');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Dat', 'MIDI controllers');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Dat', 'EDM synthesis');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Dat', 'Electronic Music Fundamentals');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Emscr', 'MIDI controllers');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Emscr', 'Synthesis algorithms');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Emscr', 'Electronic Music Fundamentals');

INSERT INTO InstrSubject(Instructor, Subject) VALUES('Emscr', 'EDM synthesis');

-- Create a table with classes offered and we can change the classes offered by entering different data
CREATE TABLE Subject (  
Subject CHAR(50) NOT NULL    
);

-- Insert data into Table Subject
INSERT INTO Subject(Subject) VALUES('Electronic Music Fundamentals');

INSERT INTO Subject(Subject) VALUES('MIDI controllers');

INSERT INTO Subject(Subject) VALUES('EDM synthesis');

-- The part above is the same as Q5.
/*
   Pick out just the instructors who can teach every subject in the table
   (1) SELECT all instructors' name (not distinct) from table InstrSubject which their subject should
        also be in table Subject. (FROM + WHERE command)
   (2) At the same time, The total number of these data in the group divided by the instructor's name 
        needs to be larger or equal to the number of rows in the table Subject.
   (3) List data in ascending order.
*/
SELECT INS.Instructor
FROM InstrSubject INS
WHERE INS.Subject IN (SELECT S.Subject FROM Subject S)
GROUP BY INS.Instructor
HAVING COUNT(DISTINCT INS.Subject) >= (SELECT COUNT(*) FROM Subject) 
ORDER BY INS.Instructor ASC

