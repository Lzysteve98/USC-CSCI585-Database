-- Database: livesql(Oracle)
-- Name: Ziyu Liu
-- USC NetID: zliu4183
-- CS 585 HW2
-- Fall 2022

CREATE TABLE ProjectRoomBookings 
(roomNum INTEGER NOT NULL UNIQUE, 
startTime INTEGER NOT NULL, 
endTime INTEGER NOT NULL, 
groupName CHAR(10) NOT NULL, 
PRIMARY KEY (roomNum, startTime), 
CHECK (startTime < endTime)，
CHECK (startTime >= 7 AND startTime <= 18)，
CHECK (endTime >= 7 AND endTime <= 18));

-- Table created.

INSERT INTO ProjectRoomBookings 
VALUES (1, 9, 8, 'Group5');

-- ORA-02290: check constraint (SQL_ZWMAPMDLFOLCBERONWDJGSXJF.SYS_C0097792849) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO ProjectRoomBookings 
VALUES (1, 9, 12, 'Group5');

-- 1 row(s) inserted.

INSERT INTO ProjectRoomBookings 
VALUES (1, 10, 13, 'Group4');

-- ORA-00001: unique constraint (SQL_ZWMAPMDLFOLCBERONWDJGSXJF.SYS_C0097792851) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO ProjectRoomBookings 
VALUES (2, 6, 9, 'Group3');

-- ORA-02290: check constraint (SQL_YWETUZSHIZHRXDKHKRWSQHLAO.SYS_C0097907475) violated ORA-06512: at "SYS.DBMS_SQL", line 1721

INSERT INTO ProjectRoomBookings 
VALUES (2, 15, 19, 'Group3');

-- ORA-02290: check constraint (SQL_YWETUZSHIZHRXDKHKRWSQHLAO.SYS_C0097907476) violated ORA-06512: at "SYS.DBMS_SQL", line 172
