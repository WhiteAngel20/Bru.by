USE Observatory

GO
CREATE PROCEDURE EquipmentSmmary
AS
	SELECT ������������.�������� as descrition, ������������.����, ������������.������������_id
	FROM ������������

GO
CREATE PROCEDURE get_souvenirs @get_price VARCHAR(50)
AS
SELECT *
FROM �������� ORDER BY
	CASE @get_price
		WHEN '��������� �����'
		THEN
		(SELECT ��������.��������_id, ��������.������������, SUM(��������.����) as price
			FROM ��������
			INNER JOIN ������� ON �������.��������_id = ��������.��������_id
			GROUP BY ��������.����
			HAVING SUM(��������.����) < 14)
		WHEN '������� �����'
		THEN
			(SELECT ��������.��������_id, ��������.������������, SUM(��������.����) as price
			FROM ��������
			INNER JOIN ������� ON �������.��������_id = ��������.��������_id
			GROUP BY ��������.����
			HAVING SUM(��������.����) > 14 and SUM(��������.����) < 100)
		WHEN '������� �����'
		THEN
			(SELECT ��������.��������_id, ��������.������������, SUM(��������.����) as price
			FROM ��������
			INNER JOIN ������� ON �������.��������_id = ��������.��������_id
			GROUP BY ��������.����
			HAVING SUM(��������.����) > 100)
	END

GO
CREATE PROCEDURE ContractClientByDate @d1 DATETIME, @d2 DATETIME
AS
BEGIN
	SELECT *
	FROM ��������_�_���������
	WHERE ��������_�_���������.����_����������_�������� BETWEEN @d1 and @d2
	GROUP BY ��������_�_���������.����_����������_��������;
END 

go
CREATE PROCEDURE ContractClientByServiseID @serviseID smallint
AS
	SELECT *
	FROM ��������_�_��������� 
	INNER JOIN ������
	ON ������.������_id = @serviseID
	GROUP BY ��������_�_���������.������_id
GO;


CREATE PROCEDURE PositionSalary @salary smallint
AS
SELECT ���������.���������_id, ���������.��������, ���������.������������
FROM ���������
WHERE ���������.�������� > @salary
GO;

CREATE PROCEDURE FindPositionSalary @title VARCHAR(50)
AS
SELECT ���������.���������_id, ���������.��������, ���������.������������
FROM ���������
WHERE @title = ���������.������������
GO;

GO
CREATE PROCEDURE GetPlanetByDistance @distance int as
SELECT *
FROM �����������_������� ORDER BY
	CASE @distance
		WHEN 10 
		THEN
			(SELECT �����������_�������.[����������_��_����� ��.���] as length_,
			�����������_�������.�������� as title
			FROM �����������_�������
			GROUP BY �����������_�������.[����������_��_����� ��.���]
			HAVING �����������_�������.[����������_��_����� ��.���] < @distance)
		WHEN 50
		THEN
			(SELECT �����������_�������.[����������_��_����� ��.���] as length_,
			�����������_�������.�������� as title
			FROM �����������_�������
			GROUP BY �����������_�������.[����������_��_����� ��.���]
			HAVING �����������_�������.[����������_��_����� ��.���] < @distance)
		WHEN 100
		THEN
			(SELECT �����������_�������.[����������_��_����� ��.���] as length_,
			�����������_�������.�������� as title
			FROM �����������_�������
			GROUP BY �����������_�������.[����������_��_����� ��.���]
			HAVING �����������_�������.[����������_��_����� ��.���] < @distance)
		ELSE 'No planets'
	END

GO
CREATE PROCEDURE GetMinOrMaxPlanetSize @size int
AS 
	SELECT �����������_�������.[������ ��], �����������_�������.��������
	FROM �����������_������� ORDER BY
		CASE  @size
			WHEN (SELECT MIN(�����������_�������.[������ ��]) FROM �����������_�������)
			THEN '������� ����������� ������ �������'
			WHEN (SELECT MAX(�����������_�������.[������ ��]) FROM �����������_�������)
			THEN '������� ������������ ������ �������'
		END 

GO
CREATE PROCEDURE EquimentState @stateID smallint
AS
	SELECT ������������.��������, ������������.����_������_id, COUNT(������������.����_������_id)
	FROM ������������ INNER JOIN ����_������ ON ������������.����_������_id = ����_������.����_������_id
	GROUP BY ������������.����_������_id
	HAVING COUNT(������������.����_������_id)>1


GO
CREATE PROCEDURE SortDescriptionEquimentByAlph @type_sort VARCHAR(15)
AS
	SELECT ������������.��������
	FROM ������������ ORDER BY
		CASE  @type_sort
			WHEN 'asc'
			THEN 
				(SELECT ������������.�������� FROM ������������ ORDER BY ������������.�������� ASC)
			WHEN 'desc'
			THEN 
				(SELECT ������������.�������� FROM ������������ ORDER BY ������������.�������� DESC)
		END

GO
CREATE PROCEDURE get_data_reporting @d1 DATETIME, @d2 DATETIME
AS
	SELECT *
	FROM ������
	WHERE ������.����_�������� BETWEEN @d1 and @d2
	GROUP BY ������.����_��������

GO
CREATE PROCEDURE CreateReport @id smallint, @dt_tm datetime
AS
	IF EXISTS (SELECT * FROM ������
				WHERE ������.����_�������� = @dt_tm OR ������.������_id = @id
				)
				RETURN 0
	INSERT dbo.������ (������_id, ����_��������)
	VALUES(@id, @dt_tm)


GO
CREATE PROCEDURE UpdateStateEquiment @id smallint, @decsrp varchar(200), @new_descrp VARCHAR(200)
AS
	if EXISTS (SELECT * FROM ����_������ 
				WHERE ����_������.����_������_id != @id
				)
				RETURN 0
	UPDATE dbo.����_������
	SET ��������_��������� = @new_descrp
	WHERE ��������_��������� = @decsrp


GO
CREATE PROCEDURE DeleteStateEquiment  @id smallint
AS
	if EXISTS (SELECT * FROM ����_������ 
				WHERE ����_������.����_������_id != @id
				)
				RETURN 0
	DELETE FROM ����_������
	WHERE ����_������.����_������_id = @id


GO
CREATE PROCEDURE EmployeeExperience @years int
AS
	IF EXISTS (SELECT ����������.id, ����������.���, ����������.����
				FROM ����������
				WHERE ����������.���� != @years
	)
	RETURN 0
	SELECT  ����������.�������_id, ����������.���, 
			����������.����������_�����, ����������.���������_id,
			����������.������������_id
	FROM ����������
	INNER JOIN ��������� ON ���������.���������_id = ����������.���������_id
	INNER JOIN ������������ ON ������������.������������_id = ����������.������������_id
	GROUP BY ����������.�������_id

GO
CREATE PROCEDURE UpdateEmployeePhone @id smallint, @newphone VARCHAR(50)
AS
	IF EXISTS(SELECT * FROM ���������� WHERE ����������.id = @id)
	RETURN 0
	UPDATE ����������
	SET ����������_����� = @newphone
	WHERE id = @id

GO
CREATE PROCEDURE GetUniqueBreakEquiment
AS
	SELECT DISTINCT ���������_������.�������_��������, ���������_������.���������_������_id
	FROM ���������_������


GO
CREATE PROCEDURE InsertBreakEquiment @id smallint, @reason VARCHAR(50)
AS
	IF EXISTS (SELECT * FROM ���������_������ WHERE ���������_������.���������_������_id = @id)
	RETURN 0
	
	INSERT INTO ���������_������(���������_������_id, �������_��������)
	VALUES (@id, @reason)

GO
CREATE PROCEDURE UpdateBreakEquiment @id smallint, @reason VARCHAR(100)
AS
	IF not EXISTS (SELECT * FROM ���������_������ WHERE ���������_������.���������_������_id = @id)
	RETURN 0
	UPDATE ���������_������
	SET �������_�������� = @reason
	WHERE ���������_������_id  = @id

GO
CREATE PROCEDURE UpdateSouvenir
@id smallint, @price VARCHAR(100)
AS
	IF not EXISTS (SELECT * FROM �������� WHERE ��������_id=@id)
	RETURN 0
	UPDATE ��������
	SET ���� = @price
	WHERE ��������_id  = @id
