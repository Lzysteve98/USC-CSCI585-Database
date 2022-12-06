CREATE TABLE InstrSubject   
(Instructor CHAR(30) NOT NULL,    
Subject CHAR(50) NOT NULL    
);

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

CREATE TABLE Subject (   
Subject CHAR(50) NOT NULL     
);

INSERT INTO Subject(Subject) VALUES('Electronic Music Fundamentals');

INSERT INTO Subject(Subject) VALUES('MIDI controllers');

INSERT INTO Subject(Subject) VALUES('EDM synthesis');

SELECT Instructor  
FROM InstrSubject INS 
GROUP BY INS.Instructor 
HAVING (SELECT COUNT(DISTINCT S.Subject) FROM Subject S) =  
	    SUM(CASE  
	            WHEN INS.Subject IN (SELECT S.Subject FROM Subject S) THEN 1 
                ELSE 0 
            END) 
ORDER BY INS.Instructor ASC;

