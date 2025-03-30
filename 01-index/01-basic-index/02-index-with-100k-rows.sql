USE AdventureWorks2022
GO

CREATE TABLE Humanresources.emp
(
ID INT IDENTITY,
NAME NVARCHAR(40),
EMAIL NVARCHAR(40),
DEPARTMENT NVARCHAR(30)
);

--Insert 100000 rows using the while counter
SET NOCOUNT ON

Declare @counter int = 1
While(@counter <= 100000)
Begin
    Declare @Name nvarchar(40) = 'name' + RTRIM(@counter)
    Declare @Email nvarchar(40) = @Name + RTRIM(@counter) + '@domain.com'
    Declare @Dept nvarchar(30) = 'Dept' + RTRIM(@counter)

INSERT INTO HumanResources.emp values(@Name, @Email, @Dept)

set @counter += 1

End
GO

-- ----------------
-- CLUSTERED INDEX 
-- ----------------

SELECT * FROM Humanresources.emp WHERE ID=20493;

-- Create a PK on ID table
ALTER TABLE Humanresources.emp
ADD CONSTRAINT PK_EMP PRIMARY KEY(ID)

-- -------------------
-- NONCLUSTERED INDEX 
-- -------------------
SELECT * FROM Humanresources.emp WHERE NAME='name82488';

-- nonclustered index syntax
CREATE NONCLUSTERED INDEX NC_EMP_NAME
ON HUMANRESOURCES.EMP(NAME);
