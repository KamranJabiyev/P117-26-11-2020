CREATE FUNCTION GetStudentCount(@Mark int)
RETURNS int
AS
BEGIN
	DECLARE @Count int
	SELECT @Count=COUNT(*) FROM Students
	WHERE Mark>@Mark
	RETURN @Count
END

SELECT dbo.GetStudentCount(30)

INSERT INTO Students
values('Rufet1','Qarayev1','r1@gmail.com',100)

CREATE TRIGGER GetAllStudentAfterInsert
ON Students
AFTER INSERT,UPDATE
AS
BEGIN
	SELECT * FROM Students
END

UPDATE Students SET Name='Test'
WHERE Id=11

CREATE TABLE CopyProducts(
	Id int,
	Name nvarchar(100)
)

CREATE TRIGGER CopyProductDataInTable
ON Products
AFTER INSERT
AS
BEGIN
	DECLARE @Id int
	DECLARE @Name nvarchar(100)

	SELECT @Id=ProductsList.Id FROM INSERTED ProductsList
	SELECT @Name=ProductsList.Name FROM INSERTED ProductsList

	INSERT INTO CopyProducts VALUES(@Id,@Name)
END

INSERT INTO Products VALUES('Test Product')


