// Name: Ziyu Liu
// USC NetID: zliu4183
// CS 585 HW1
// Fall 2022

Table Details And Assumptions:

1. STUDENT
Identifier: STU_ID(student's ID)
Required Attribute: STU_FNAME(student's first name), STU_LNAME(student's last name)
Optional Attribute: STU_SCHED(student's schedule), STU_FEE(student's fees), DMG_CHARGE(part damage charge)

- Students must have their personal ID and their names. But before they sign up for classes, the other three 
  attributes can be null. At the end of this curriculum, the damage charge will be added to students' personal
  fees.

2. INSTRUCTOR
Identifier: INSTR_ID(instructor's ID)
Required Attribute: INSTR_FNAME(instructor's first name), INSTR_LNAME(instructor's last name)
Optional Attribute: SALARY(instructor's salary of this summer course), CLASS_HOUR(hours they teach classes), 
	            PROJ_HOUR(hours they supervise projects)

- Instructors must have their personal ID and their names. But they can get their total hours until they finishes 
all classes and projects, and salary is calculated by their working hours. So they are optional attributes.
can be null.

- Because all instructors are paid identical rates, so we don't need to list identical rates as attributes.
  It is a constant for all instructors.

3. CLASS
Identifier: CLASS_ID(class's ID)
Required Attribute: ROOM_NUM(foreign keys from Entity 'Room', room's number), CLASS_NAME(the name of this class)
		    CLASS_TIME(when students attend this class), CODE_LANG(coding languages), START_DATE(the 
                    starting date of this class), END_DATE(the ending date of this class), CLASS_SIZE(the maximum 
  		    for the number of students can attend this class)
Optional Attribute: STU_NUM (how many students have already signed up for this class)

- The coding language has its domain: PureData ('Pd'), Csound, SuperCollider.
- The number of signing up students is an optional attribute because it can be 'null' before the class begins.

4. PROJECT
Identifier: PROJ_ID(project's ID)
Required Attribute: ROOM_NUM(foreign keys from Entity 'Room', room's number), INSTR_ID(foreign keys from Entity 
                    'Room', instructor's ID of this project supervisor), PROJ_NAME(the name of this project),
		    PROJ_TIME(when students attend this project), PROJ_PART(specific parts for this project), 
  		    START_DATE(the starting date of project), END_DATE(the ending date of this project), 
	            PROJ_SIZE(the maximum for the number of students can attend this project)
Optional Attribute: STU_NUM (how many students have already signed up for this project)

- There should be only one professor overseeing this project.
- Every project finishes in one week. So the END_DATE can be calculated by using START_DATE.
- We don't need to have attributes like 'table numbers' or 'box numbers', because we can only calculated when we 
  end the class registration and calculate how many tables and boxes we need for this class.
- The number of signing up students is an optional attribute because it can be 'null' before the class begins.

5. ROOM

Identifier: ROOM_ID(room's ID)
Required Attribute: ADDRESS(detailed address of this room), CAPACITY(how many students can study or do projects 
		    in this room), ISLIBRARY(whether this room is library or not)
Optional Attribute: 

- Rooms are available for the classes, projects and libraries. And there is only one specific room for library. So
  we need an attribute 'ISLIBRARY' to check if it is a library and it cannot be null.

6. LIBRARY
Identifier: ROOM_ID(foreign key, a room ID belongs to this library)
Required Attribute: TOTALBOOKS(total number of books in library), CAPACITY(how many students are in this library) 
Optional Attribute: 

- TOTALBOOKS just shows the number of books belonging to this library, including those in this library and being 
  borrowed by students.
- The number of students who are in this library cannot be exceed by CAPACITY to avoid COVID-19 spreading.

7. BOOK
Identifier: BOOK_ID(book's ID)
Required Attribute: TITLE(the title of this book), BOOK_TYPE(which type the book belongs to), IS_CHECKOUT(whether
                    this book is checked out by students or not)
Optional Attribute: CHECKOUT_DATE(when this book is checked out by students)

- BOOK_TYPE is used for sorting in the library by students and staff. It has its own domain, such as electronic 
  music, coding, etc
- IS_CHECKOUT shows if this book is checked out by students. It cannot be 'null'.
- CHECKOUT_DATE can be 'null' when it is not borrowed by students. When this book is checked out by students, the
  CHECKOUT_DATE will be updated automatically by the library system.

8. TEXTBOOK
Identifier: PART_ID(part's ID)
Required Attribute: TITLE(the title of this book)
Optional Attribute: 

- BOOK_ID is used for sorting this book in the library by students and staff. It is a foreign key.

9.  PART
Identifier: BOOK_ID(foreign key, book's ID)
Required Attribute: PART_NAME(part's name), CATEGORY(which type the part belongs to), PRICE(the price of this part),
			    IS_DAMAGE(whether this part is damaged by students or not)
Optional Attribute: 

10. ONLINE SUPPLIER
Identifier: SUP_ID(supplier's ID)
Required Attribute: SUP_NAME(supplier's name)
Optional Attribute:  CATEGORY(which type part this online supplier sell)

- CATEGORY can be 'null' because an online supplier could sell different types of parts.

11. RATING
Identifier: STU_ID(foreign key, student's ID), TYPE(the type of rating)
Required Attribute: SCORE(rating score)
Optional Attribute: INSTR_ID(foreign key, instructor's ID), CLASS_ID(foreign key, class's ID), 
			    PROJ_ID(foreign key, project's ID)

- TYPE's domain has 'Instructor', 'Class', 'Project'. It decides which kind of rating students give. It is a required attribute.
- Three optional attributes can be 'null' because there is only one type for each rating. It is possible for all these attributes 
   to be 'null'.

12. CLASS_SIGNUP
Identifier: CLASS_ID(foreign key, class's ID), STU_ID(foreign key, student's ID)
Optional Attribute: GRADE(class grade)

- GRADE can be 'null' because students will get their grade until they finish this class.

13. PROJ_SIGNUP
Identifier: PROJ_ID(foreign key, project's ID), STU_ID(foreign key, student's ID)
Required Attribute: TABLE_NUM(table's number), BOX_NUM(toolbox's number)
Optional Attribute: GRADE(class grade)

- Table number and toolbox number will be given to students once they enroll in this project.
- GRADE can be 'null' because students will get their grade until they finish this class.

14. CLASS_TEACH
Identifier: CLASS_ID(foreign key, class's ID), INSTR_ID(foreign key, instructor's ID)

15. TEXTBOOK_USE
Identifier: CLASS_ID(foreign key, class's ID), INSTR_ID(foreign key, instructor's ID)

Relationship Details and Assumptions:

M:N Relationships
1. STUDENT and CLASS (M:N) : A student can sign up for many classes and a class can have many students.
2. STUDENT and PROJECT (M:N) : A student can sign up for many projects and a project can have many students.
3. INSTRUCTOR and CLASS (M:N) : An instructor can teach many classes and a class can be taught by multiple instructors.
4. TEXTBOOK and CLASS (M:N) : A textbook can be used in different classes and different instructors can specify multiple 
textbooks for a class.
5. STUDENT and CLASS (M:N), STUDENT and PROJECT (M:N), STUDENT and PROJECT (M:N):  A student can give rating to 
many classes, projects and instructors and they can get different student's rating.

- These 5 relationships use bridge tables to represent M:N relationships. 

1:M Relationships
1. CLASS and ROOM (1:M) : A class must be taught in one room but a room can be used for different classes. And a room
is not restricted to one class. 
2. PROJECT and ROOM (1:M) : A project must be taught in one room but a room can be used for different projects. And a 
room is not restricted to one project. 
3. INSTRUCTOR and PROJECT (1:M) : An instructor can oversee different projects but a project has only one instructor.
4. PROJECT and PART (1:M) : A project can have many parts but an specific part with its part ID can be used in 
  1 project.
5. ONLINE SUPPLIER and PART (1:M) : An online supplier can provide many parts but an specific part with its part ID 
can be bought from one supplier.
6. STUDENT and BOOK (1:M) : A student can borrow many books but a book can be borrowed by one student.
7. LIBRARY and BOOK (1:M) : A Library contains many books but a book is stored by this only one library.
8. TEXTBOOK and INSTRUCTOR (1:M) : A textbook can be specified by many instructors but an instructor specifies 1 textbook.

1:1 Relationships
1. LIBRARY AND ROOM(1:1)：A library is a specific room and there is only a room called library. Not all rooms must be the
librury so it is optional.
