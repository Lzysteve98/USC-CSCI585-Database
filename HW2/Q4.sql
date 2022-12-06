-- Database: livesql(Oracle)
-- Name: Ziyu Liu
-- USC NetID: zliu4183
-- CS 585 HW2
-- Fall 2022

/*
    Table InstrRate: The table of Instructor's name and their hourly rate
*/
CREATE TABLE InstrRate  
(Instructor CHAR(30) NOT NULL,  
HourlyRate Integer NOT NULL  
);

/*
    Table InstrClass: The table of Instructor's name, their subject and enrollment numbers
*/
CREATE TABLE InstrClass  
(Instructor CHAR(30) NOT NULL,  
Subject CHAR(50) NOT NULL,  
Enrollments Integer NOT NULL  
);

-- Input data
INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Aleph', 'MIDI controllers', 20);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Aleph', 'Sound mixing', 25);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Aleph', 'Synthesis algorithms', 15);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Bit', 'EDM synthesis', 18);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Bit', 'Electronic Music Fundamentals', 32);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Bit', 'Sound mixing', 23);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('CRC', 'EDM synthesis', 24);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('CRC', 'Electronic Music Fundamentals', 30);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Dat', 'MIDI controllers', 14);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Dat', 'EDM synthesis', 9);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Dat', 'Electronic Music Fundamentals', 38);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Emscr', 'MIDI controllers', 16);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Emscr', 'Synthesis algorithms', 13);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Emscr', 'Electronic Music Fundamentals', 25);

INSERT INTO InstrClass(Instructor, Subject, Enrollments) VALUES('Emscr', 'EDM synthesis', 22);

INSERT INTO InstrRate(Instructor, HourlyRate) VALUES('Aleph', 80);

INSERT INTO InstrRate(Instructor, HourlyRate) VALUES('Bit', 70);

INSERT INTO InstrRate(Instructor, HourlyRate) VALUES('CRC', 100);

INSERT INTO InstrRate(Instructor, HourlyRate) VALUES('Dat', 90);

INSERT INTO InstrRate(Instructor, HourlyRate) VALUES('Emscr', 75);

/*
    Table S1: The table of Instructor's name and their bonus(hourly_rate * sum_of_class_counts * 0.1)
    Select the highest bonus (Bonus in the SELECT sentence) from this table and that instructor's name.
    In the WHERE sentence, it sets the Bonus must be the bonus which is larger than any other's bonus.
    Result:
    INSTRUCTOR	BONUS
    Emscr         570
*/
SELECT S1.Instructor AS Instructor, S1.Bonus AS Bonus 
FROM (SELECT IR.Instructor AS Instructor, (IR.HourlyRate * S.SumofClass * 0.1) AS Bonus 
      FROM InstrRate IR, (SELECT Instructor, SUM(Enrollments) AS SumofClass 
                          FROM InstrClass 
                          GROUP BY Instructor) S 
      WHERE IR.Instructor = S.Instructor) S1 
WHERE Bonus >= (SELECT MAX(IR.HourlyRate * S.SumofClass * 0.1) AS maxBonus 
                FROM InstrRate IR, (SELECT Instructor, SUM(Enrollments) AS SumofClass 
                                    FROM InstrClass 
                                    GROUP BY Instructor) S 
                WHERE IR.Instructor = S.Instructor);

-- This command also works. (It uses Fetch command.)
SELECT S.Instructor AS Instructor, (SumofClass * IR.HourlyRate * 0.1) AS Bonus 
FROM ((SELECT Instructor, SUM(Enrollments) AS SumofClass 
       FROM InstrClass 
       GROUP BY Instructor) S JOIN
       InstrRate IR ON
       S.Instructor = IR.Instructor)
ORDER BY Bonus DESC
FETCH FIRST 1 ROW ONLY