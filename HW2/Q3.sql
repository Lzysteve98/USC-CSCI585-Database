-- Database: livesql(Oracle)
-- Name: Ziyu Liu
-- USC NetID: zliu4183
-- CS 585 HW2
-- Fall 2022

CREATE TABLE ProjectStatus 
(PID CHAR(5) NOT NULL, 
Step CHAR(5) NOT NULL, 
Status CHAR(5) NOT NULL 
);

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P100', '0', 'C');

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P100', '1', 'W');

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P100', '2', 'W');

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P201', '0', 'C');

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P201', '1', 'C');

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P333', '0', 'W');

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P333', '1', 'W');

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P333', '2', 'W');

INSERT INTO ProjectStatus(PID, Step, Status) VALUES('P333', '3', 'W');

SELECT PID 
FROM ProjectStatus 
WHERE Step = '0' AND Status = 'C' AND PID IN 
      (SELECT PID  
       FROM ProjectStatus 
       WHERE Step = '1' AND Status = 'W');

