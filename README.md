# plsql_window_fuction_-24803-_Sandrine
# Library Management System
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

    
);
