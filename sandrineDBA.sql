-- Create the Books table
CREATE TABLE Books (
    Book_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(200),
    Author VARCHAR2(100),
    ISBN VARCHAR2(20),
    Available VARCHAR2(3) CHECK (Available IN ('Yes', 'No'))
);

-- Create the Borrowers table
CREATE TABLE Borrowers (
    Borrower_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Email VARCHAR2(100)
);

-- Create the Loans table with foreign keys to Books and Borrowers
CREATE TABLE Loans (
    Loan_ID NUMBER PRIMARY KEY,
    Borrower_ID NUMBER,
    Book_ID NUMBER,
    Loan_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Borrower_ID) REFERENCES Borrowers(Borrower_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- Insert data into Books table
INSERT INTO Books (Book_ID, Title, Author, ISBN, Available) 
VALUES (1, 'To Kill a Mockingbird', 'Harper Lee', '978-0061120084', 'Yes');

INSERT INTO Books (Book_ID, Title, Author, ISBN, Available) 
VALUES (2, '1984', 'George Orwell', '978-0451524935', 'Yes');

-- Insert data into Borrowers table
INSERT INTO Borrowers (Borrower_ID, Name, Email)
VALUES (1, 'Alice Walker', 'alice@example.com');

INSERT INTO Borrowers (Borrower_ID, Name, Email)
VALUES (2, 'Bob Marley', 'bob@example.com');

-- Insert data into Loans table (Alice borrowed 'To Kill a Mockingbird')
INSERT INTO Loans (Loan_ID, Borrower_ID, Book_ID, Loan_Date, Return_Date) 
VALUES (1001, 1, 1, TO_DATE('2024-10-01', 'YYYY-MM-DD'), NULL);

UPDATE Books
SET Available = 'No'
WHERE Book_ID = 1;

-- Delete a borrower from the Borrowers table
DELETE FROM Borrowers
WHERE Borrower_ID = 2;
-- Join Borrowers and Loans with Books to get loan details
-- Join Borrowers and Loans with Books to get loan details
SELECT b.Name, bk.Title, l.Loan_Date, l.Return_Date
FROM Borrowers b
JOIN Loans l ON b.Borrower_ID = l.Borrower_ID
JOIN Books bk ON l.Book_ID = bk.Book_ID;

-- Find borrowers who have not returned any books
SELECT Name 
FROM Borrowers
WHERE Borrower_ID IN (
    SELECT Borrower_ID 
    FROM Loans
    WHERE Return_Date IS NULL
);






-- Alter Books table to add Genre
ALTER TABLE Books
ADD Genre VARCHAR2(50);

-- Insert a new book into the Books table
INSERT INTO Books (Book_ID, Title, Author, ISBN, Available)
VALUES (3, 'The Great Gatsby', 'F. Scott Fitzgerald', '978-0743273565', 'Yes');

-- Create a new user
CREATE USER library_user IDENTIFIED BY password123;

-- Grant the necessary privileges for the user to log in and perform actions
GRANT CONNECT, RESOURCE TO library_user;

-- Commit the current transaction
COMMIT;

-- Rollback the current transaction
ROLLBACK;

-- Select all books in the library
SELECT * FROM Books;
-- Select all books in the library
SELECT * FROM Books;

-- Insert a new borrower into the Borrowers table
INSERT INTO Borrowers (Borrower_ID, Name, Email) 
VALUES (3, 'Charlie Brown', 'charlie@example.com');


-- Update the return date of a loan
UPDATE Loans
SET Return_Date = TO_DATE('2024-10-15', 'YYYY-MM-DD')
WHERE Loan_ID = 1001;

-- Delete a book from the Books table
DELETE FROM Books
WHERE Book_ID = 3;

-- Get all borrowers who have borrowed '1984'
SELECT b.Name, l.Loan_Date
FROM Borrowers b
JOIN Loans l ON b.Borrower_ID = l.Borrower_ID
JOIN Books bk ON l.Book_ID = bk.Book_ID
WHERE bk.Title = '1984';

-- Find books that have never been borrowed
SELECT Title 
FROM Books
WHERE Book_ID NOT IN (
    SELECT Book_ID
    FROM Loans
);


