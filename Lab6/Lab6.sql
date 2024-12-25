create database HRM
go
use HRM
go
create table Departments
(
    Id CHAR(3) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255) NULL,
    PRIMARY KEY(Id)
);
GO
create table Employees
(
    Id Varchar(20) not null,
    Password VARCHAR(50) not null,
    Fullname NVARCHAR(50) NOT NULL,
    Photo VARCHAR(50) not NULL,
    Gender BIT not null,
    Birthday date not null,
    Salary float not null,
    DepartmentID char(3) not null,
    PRIMARY KEY(id),
    FOREIGN KEY(DepartmentID) REFERENCES Departments(id)
    on delete cascade
    on UPDATE cascade
);
go
INSERT INTO Departments
    (Id, Name, Description)
VALUES
    ('D01', 'Human Resources', 'Responsible for recruitment and employee welfare'),
    ('D02', 'Finance', 'Handles financial transactions and budgeting'),
    ('D03', 'IT', 'Maintains IT infrastructure and development'),
    ('D04', 'Marketing', 'Focuses on market strategies and campaigns'),
    ('D05', 'Sales', 'Manages sales and customer relations'),
    ('D06', 'Operations', 'Oversees day-to-day operational activities'),
    ('D07', 'Legal', 'Handles legal matters and compliance'),
    ('D08', 'R&D', 'Research and development for new products'),
    ('D09', 'Customer Support', 'Assists customers with issues and inquiries'),
    ('D10', 'Admin', 'Manages administrative tasks and logistics');
GO
INSERT INTO Employees
    (Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentID)
VALUES
    ('E001', 'pass123', 'John Doe', 'john_doe.jpg', 1, '1985-03-15', 50000, 'D01'),
    ('E002', 'pass456', 'Jane Smith', 'jane_smith.jpg', 0, '1990-07-22', 52000, 'D02'),
    ('E003', 'pass789', 'Robert Brown', 'robert_brown.jpg', 1, '1982-11-02', 48000, 'D03'),
    ('E004', 'pass321', 'Emily White', 'emily_white.jpg', 0, '1995-05-30', 53000, 'D04'),
    ('E005', 'pass654', 'Michael Green', 'michael_green.jpg', 1, '1978-12-10', 55000, 'D05'),
    ('E006', 'pass987', 'Linda Black', 'linda_black.jpg', 0, '1983-06-19', 54000, 'D06'),
    ('E007', 'pass111', 'James Wilson', 'james_wilson.jpg', 1, '1992-09-25', 50000, 'D07'),
    ('E008', 'pass222', 'Patricia Harris', 'patricia_harris.jpg', 0, '1988-04-17', 51000, 'D08'),
    ('E009', 'pass333', 'Thomas Johnson', 'thomas_johnson.jpg', 1, '1986-01-05', 49500, 'D09'),
    ('E010', 'pass444', 'Sarah Lee', 'sarah_lee.jpg', 0, '1993-10-08', 52000, 'D10');
go
select *
from Departments
select *
from Employees

select *
from Departments
where id = 'D09'
select *
from Employees
where id = 'E009'

INSERT INTO Departments
    (Id, Name, Description)
VALUES
    ('D11', 'Human Resources1', 'Responsible for recruitment and employee welfare')
INSERT INTO Employees
    (Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentID)
VALUES
    ('E011', 'pass123', 'John Doe', 'john_doe.jpg', 1, '1985-03-15', 50000, 'D01')

UPDATE Departments SET name = '?', Description = '?' where id = 'D11'
UPDATE Employees SET Password = '?', Fullname = '?', Photo = '?', Gender = 0, Birthday = '1985-03-15', Salary = 50000,  DepartmentID = 'D02' where id = 'E011'

go
CREATE PROCEDURE spInsert(
    @Id VARCHAR(20),
    @Name NVARCHAR(50),
    @Description NVARCHAR(100)
)
AS
BEGIN
    INSERT INTO Departments
        (Id, Name, Description)
    VALUES(@Id, @Name, @Description)
END

go
CREATE PROCEDURE spUpdate(
    @Id VARCHAR(20),
    @Name NVARCHAR(50),
    @Description NVARCHAR(100)
)
AS
BEGIN
    UPDATE Departments 
SET Name=@Name, Description=@Description 
WHERE Id=@Id
END

GO
CREATE PROCEDURE spDeleteById(
    @Id VARCHAR(20)
)
AS
BEGIN
    DELETE FROM Departments WHERE Id=@Id
END

GO
CREATE PROCEDURE spSelectAll 
AS
BEGIN
    SELECT *
    FROM Departments
END

go
CREATE PROCEDURE spSelectById(
    @Id VARCHAR(20)
)
AS
BEGIN
    SELECT *
    FROM Departments
    WHERE Id=@Id
END