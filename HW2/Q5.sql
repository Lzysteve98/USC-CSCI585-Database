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

/*
   Pick out just the instructors who can teach every subject in the table
   (1) Find all data with subjects which will be offered this semeter and instructors' name. 
       (FROM + JOIN command)
   (2) Select those instructors who can teach as many classes as the Subject table offer. 
       Because we make sure that all courses selected by (1) are occured in the Subject table listed, 
       then the equal number means these professor can teach all classes listed.
   (3) List data in ascending order.
*/
SELECT INS.Instructor  
FROM InstrSubject INS JOIN  
     Subject S ON 
     INS.Subject = S.Subject 
GROUP BY INS.Instructor 
HAVING COUNT(*) = (SELECT COUNT(*) FROM Subject) 
ORDER BY INS.Instructor ASC;

