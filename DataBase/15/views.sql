USE Observatory

GO
CREATE VIEW AboutSourvenirService AS
SELECT  dbo.������.���������,
		dbo.������.��������_������,
		dbo.��������.������������,
		dbo.��������.����
FROM 
	dbo.������ INNER JOIN dbo.�������� 
	on dbo.������.������_id = dbo.��������.��������_id

GO
CREATE VIEW ListPositionEmployee AS
SELECT dbo.���������.������������
FROM 
	dbo.��������� INNER JOIN dbo.����������

	on dbo.����������.����������_����� != null

GO
CREATE VIEW ReportingSpaceObjects AS
SELECT dbo.�����������_�������.[������ ��],
		dbo.������.����_��������
FROM 
	dbo.�����������_�������, 
	dbo.������, 
	(SELECT COUNT(dbo.�������.�������_id) 
		FROM dbo.�������
		WHERE dbo.�������.�������_id > 6) 
	INNER JOIN dbo.������ 
	ON dbo.������.����_�������� > '2012-06-18 10:34:09.000'

GO
CREATE VIEW GetMaxPriceSourvenirs AS
SELECT dbo.��������.������������,
		dbo.��������.����
FROM dbo.�������� ORDER BY dbo.��������.���� ASC

GO
CREATE VIEW AboutEquipment AS
SELECT dbo.����_������.��������_���������,
	dbo.���������_������.�������_��������
FROM dbo.���������_������ INNER INTO dbo.����_������ 
ON dbo.���������_������.���������_������_id > 6

GO
CREATE VIEW SerachByPattern AS
SELECT dbo.���������.������������
FROM dbo.��������� WHERE dbo.���������.������������ LIKE '[�,�,�]%'

GO
CREATE VIEW OrderSourvenirByPrice AS
SELECT dbo.��������.������������,
		dbo.��������.����
FROM dbo.�������� 
	WHERE dbo.��������.���� > 
		((SELECT SUM(dbo.��������.����)) / (SELECT AVG(dbo.��������.����)))
	ORDER BY dbo.��������.���� DESC

GO
CREATE VIEW GetListClients AS
SELECT  dbo.�������.���,
		dbo.�������.����������_�����
FROM dbo.�������
	WHERE dbo.�������.�������_id >= 1

GO
CREATE VIEW InfoSpace AS
SELECT dbo.�����������_�������.��������,
		dbo.�����������_�������.[������ ��],
		dbo.�����������_�������.[����������_��_����� ��.���]
FROM dbo.�����������_������� FULL OUTER JOIN dbo.������
	ON dbo.������.������_id = dbo.�����������_�������.�����������_�������_id
	WHERE dbo.�����������_�������.[������ ��] > 100000000

GO 
CREATE VIEW AboutServis AS
SELECT *
		FROM dbo.������
		WHERE dbo.������.��������� NOT LIKE NULL

GO 
CREATE VIEW InfoReportNotNull AS
SELECT * 
		FROM dbo.������
		WHERE dbo.������.����_�������� IS NOT NULL
GO
CREATE VIEW InfoStatement AS
SELECT *
		FROM dbo.������������
		WHERE dbo.������������.�������� IS NOT NULL
GO
CREATE VIEW GetIDReporting AS
SELECT * 
		FROM dbo.������_�����������_�������
		WHERE dbo.������_�����������_�������.�����������_�������_id = dbo.������_�����������_�������.������_id

GO
CREATE VIEW GetAllManadgers AS
SELECT *
		FROM dbo.��������� FULL OUTER JOIN dbo.�������
		ON dbo.�������.����������_����� NOT LIKE NULL
GO
CREATE VIEW SearchPatternByEmployee AS
SELECT * 
		FROM dbo.���������
		WHERE dbo.���������.������������ LIKE '�������'