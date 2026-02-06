# plsql_window_fuction_-24803-_Sandrine
# Library Management System
This project is a simple Library Management System built using Oracle SQL. It handles the basic operations of a library, such as tracking books, borrowers, and loan transactions.

- Create the Books table
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
<img width="1335" height="634" alt="2" src="https://github.com/user-attachments/assets/1f619c49-2926-4afd-80b2-301adb05279c" />
2. RELATIONSHIP
<img width="943" height="370" alt="1" src="https://github.com/user-attachments/assets/62cd07ce-9603-4b77-880e-e8f0ba8650bf" />
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

<img width="1323" height="629" alt="3" src="https://github.com/user-attachments/assets/78795f69-2b5d-4efd-855f-8edf307f984a" />
-- Update the availability of a book when it is loaned out
UPDATE Books
SET Available = 'No'
WHERE Book_ID = 1;
<img width="1310" height="614" alt="4" src="https://github.com/user-attachments/assets/89fa8e2e-a4de-4af7-8c82-2c40a1405dc9" />
-- Delete a borrower from the Borrowers table.
DELETE FROM Borrowers
WHERE Borrower_ID = 2;

<img width="1301" height="583" alt="5" src="https://github.com/user-attachments/assets/0e3a0f00-3cae-43ef-8e98-83aed20a5a8f" />
JOIN.
-- Join Borrowers and Loans with Books to get loan details
SELECT b.Name, bk.Title, l.Loan_Date, l.Return_Date
FROM Borrowers b
JOIN Loans l ON b.Borrower_ID = l.Borrower_ID
JOIN Books bk ON l.Book_ID = bk.Book_ID;
<img width="1296" height="634" alt="6" src="https://github.com/user-attachments/assets/2841ea26-201a-4b4e-b29b-b63a51828089" />




    
);
