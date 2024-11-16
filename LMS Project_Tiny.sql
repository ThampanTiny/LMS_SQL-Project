CREATE DATABASE Library_DB;

Use Library_DB;

#Table 1 : Branch
CREATE TABLE Branch(
B_no INT PRIMARY KEY,
Manager_ID INT,
B_Address VARCHAR(50),
Contact_No INT
);

#Table 2 : Employee
CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_Name VARCHAR(25),
Emp_Position VARCHAR(25),
Salary INT,
B_No INT,
FOREIGN KEY (B_No) REFERENCES Branch(B_No)
);

#Table 3 : Books
CREATE TABLE Books(
ISBN INT PRIMARY KEY,
Book_Title VARCHAR(50),
Category VARCHAR(50),
Rental_Price INT,
B_Status VARCHAR(5),
Author VARCHAR(50),
Publisher VARCHAR(50)
);

#Table 4 : Customer
CREATE TABLE Customer(
C_Id INT PRIMARY KEY,
C_Name VARCHAR(25),
C_Address VARCHAR(50),
Reg_Date DATE
);

#Table 5 : IssueStatus
CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_Cust INT,
Issued_Book_Name VARCHAR(50),
Issue_Date DATE,
ISBN_Book INT,
FOREIGN KEY(Issued_Cust) REFERENCES Customer(C_Id),
FOREIGN KEY(ISBN_Book) REFERENCES Books(ISBN)
);

#Table 6 : ReturnStatus
CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_Cust INT,
Return_Book_Name VARCHAR(50),
Return_Date DATE,
ISBN_Book2 INT,
FOREIGN KEY(Return_Cust) REFERENCES Customer(C_Id),
FOREIGN KEY(ISBN_Book2) REFERENCES Books(ISBN)
);

#Inserting records to all tables

#Table 1 : Branch
	INSERT INTO Branch VALUES (1001, 1210, 'Entri LMS, Vytila - 685254', 96385);
	INSERT INTO Branch VALUES (1002, 1336, 'LMS Entri, Kochi - 695478', 98742);

SELECT * FROM Branch;

#Table 2 : Employee
	INSERT INTO Employee VALUES (220, 'Anu Balan', 'Librarian', 65000, 1001);
	INSERT INTO Employee VALUES (221, 'Sunu Sanal', 'Asst. Librarian', 45000, 1001);
	INSERT INTO Employee VALUES (222, 'Merin Sunny', 'Manager', 95000, 1001);
	INSERT INTO Employee VALUES (223, 'Meenu Benny', 'Asst. Librarian', 45000, 1002);
	INSERT INTO Employee VALUES (224, 'Anjana Mathew', 'Librarian', 65000, 1002);
	INSERT INTO Employee VALUES (225, 'Serin Sunny', 'Manager', 95000, 1002);
	INSERT INTO Employee VALUES (226, 'Sanjay Sam', 'Asst. Librarian', 45000, 1002);
	INSERT INTO Employee VALUES (227, 'Taniya Tom', 'Manager', 95000, 1001);
	INSERT INTO Employee VALUES (228, 'Deltas Dominic', 'Asst. Librarian', 45000, 1001);
	INSERT INTO Employee VALUES (229, 'Serin Sunny', 'Libarian', 65000, 1002);
	INSERT INTO Employee VALUES (230, 'Ann Mary Eldho', 'Manager', 95000, 1002);

SELECT * FROM Employee;

#Table 3 : Books
	INSERT INTO Books VALUES 
		(98574, 'Introduction to SQL', 'Technology', 750.00, 'Yes', 'John Smith', 'TechBooks Inc'),
		(95126, 'Data Science 101', 'Education', 600.00, 'Yes', 'Jane Doe', 'EduPublishers'),
		(97452, 'Python for Beginners', 'Programming', 450.00, 'Yes', 'Emily Brown', 'CodeHouse'),
		(96321, 'Independence', 'History', 1000.00, 'Yes', 'Robert White', 'AIWorld'),
		(91245, 'Effective Communication', 'Soft Skills', 120.00, 'Yes', 'Laura Green', 'SoftSkill Press'),
		(99571, 'SQL Introduction', 'Technology', 365.00, 'Yes', 'John Smith', 'TechBooks Inc'),
		(92136, 'World War I', 'History', 950.00, 'Yes', 'Jane Doe', 'EduPublishers'),
		(94752, 'Public Speaking', 'Soft Skills', 350.00, 'Yes', 'Emily Brown', 'CodeHouse'),
		(92321, 'World War II', 'History', 650.00, 'Yes', 'Robert White', 'AIWorld'),
		(94345, 'Data Science Beginners', 'Education', 855.00, 'Yes', 'Laura Green', 'SoftSkill Press');

SELECT * FROM Books;

#Table 4 : Customer
	INSERT INTO Customer VALUES
		(10098, 'Alice Johnson', '123 Elm Street', '2024-01-30'),
		(10092, 'Bob Martin', '456 Oak Avenue', '2016-10-12'),
		(10093, 'Charlie Davis', '789 Pine Lane', '2020-03-15'),
		(10090, 'Diana Evans', '101 Maple Road', '2015-05-18'),
		(10085, 'Evan Lewis', '202 Birch Blvd', '2014-11-20');

SELECT * FROM Customer;

#Table 5 : IssueStatus
	INSERT INTO IssueStatus VALUES
		(101, 10085, 'Introduction to SQL', '2024-02-01', 98574),
		(102, 10092, 'Data Science 101', '2018-09-02', 95126),
		(103, 10090, 'Python for Beginners', '2023-06-30', 97452),
		(104, 10098, 'World War II', '2024-10-04', 92321),
		(105, 10085, 'Effective Communication', '2018-04-05', 91245),
		(106, 10092, 'Data Science 101', '2023-06-02', 95126);

SELECT * FROM IssueStatus;

#Table 6 : ReturnStatus
	INSERT INTO ReturnStatus VALUES
		(201, 10085, 'Introduction to SQL', '2024-03-01', 98574),
		(202, 10092, 'Data Science 101', '2018-10-02', 95126),
		(203, 10090, 'Python for Beginners', '2023-07-30', 97452),
		(204, 10098, 'World War II', '2024-11-04', 92321),
		(205, 10085, 'Effective Communication', '2018-05-05', 91245);

SELECT * FROM ReturnStatus;

#1. Retrieve the book titl=e, category, and rental price of all available books. 
	SELECT Book_Title, Category, Rental_Price FROM Books Where B_Status = 'YES';

#2. List the employee names and their respective salaries in descending order of salary. 
	SELECT Emp_Name, Salary FROM Employee ORDER BY Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books.
	SELECT ISBN, Book_Title FROM Books;
    SELECT C_ID, C_Name FROM Customer;
    
    SELECT B.Book_Title, C.C_Name FROM IssueStatus
	JOIN Books B ON IssueStatus.ISBN_Book = B.ISBN
	JOIN Customer C ON IssueStatus.Issued_cust = C.C_Id;

#4. Display the total count of books in each category. 
	SELECT Category, COUNT(*) AS No_of_Books FROM Books GROUP BY Category;
    
#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
	SELECT Emp_Name, Emp_Position, Salary FROM Employee WHERE Salary > 50000;
    
#6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
	SELECT C_Id, C_Name, Reg_Date FROM Customer;
    SELECT Issued_Cust FROM IssueStatus;
	
    SELECT C_Name FROM Customer WHERE Reg_Date < '2022-01-01' 
	AND C_Id NOT IN (SELECT Issued_Cust FROM IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch. 
	SELECT * FROM Employee;
    
    SELECT B_No, COUNT(*) AS Employee_Count FROM Employee GROUP BY B_No;

#8. Display the names of customers who have issued books in the month of June 2023. 
	SELECT Issued_Cust, Issued_Book_Name, Issue_Date FROM IssueStatus
    WHERE Issue_Date BETWEEN '2023-06-01' AND '2023-06-30';
    
    SELECT C_Id, C_Name FROM Customer;
    
	SELECT C.C_Name, I.Issued_Book_Name FROM IssueStatus I
	JOIN Customer C ON I.Issued_Cust = C.C_Id
	WHERE Issue_Date BETWEEN '2023-06-01' AND '2023-06-30';

#9. Retrieve book_title from book table containing history. 
	SELECT Book_Title, Category FROM Books WHERE Category LIKE 'history';

#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
	SELECT B_No, COUNT(*) AS No_of_Employees FROM Employee
	GROUP BY B_No HAVING COUNT(*) > 5;

#11. Retrieve the names of employees who manage branches and their respective branch addresses. 
	SELECT E.Emp_Name, E.Emp_position, B.B_Address FROM Branch B
	JOIN Employee E ON E.B_No = B.B_No
    WHERE Emp_Position = 'Manager';

#12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
	SELECT ISBN, Rental_price FROM Books;
    SELECT C_ID, C_Name FROM Customer;
    
    SELECT C.C_Name, B.Rental_Price FROM IssueStatus I
	JOIN Books B ON I.ISBN_Book = B.ISBN
	JOIN Customer C ON I.Issued_Cust = C.C_Id
	WHERE B.Rental_Price > 250;
