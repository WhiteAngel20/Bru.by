USE [Observatory]
GO

INSERT INTO [Observatory].[dbo].[�����������_�������]
VALUES (18, 99652631, 78, 'add')
INSERT INTO [Observatory].[dbo].[�������]
VALUES (18, '���������� �.�', '17892375', 14, 13, 7)
INSERT INTO [Observatory].[dbo].[������]
VALUES (18, CONVERT(datetime, '09-06-20'))

UPDATE  [Observatory].[dbo].[����_������]
	SET ��������_���������='��������' 
	WHERE ����_������_id=17

UPDATE  [Observatory].[dbo].[���������_������]
	SET �������_��������='������� � �������' 
	WHERE ���������_������_id=17

UPDATE  [Observatory].[dbo].[��������]
	SET ����=135
	WHERE ����=1

DELETE 
	FROM [Observatory].[dbo].[������] 
	WHERE ��������� = 889

DELETE 
	FROM [Observatory].[dbo].[���������_������] 
	WHERE ���������_������_id=10

DELETE 
	FROM [Observatory].[dbo].[�������]
	WHERE ������_id = 15
