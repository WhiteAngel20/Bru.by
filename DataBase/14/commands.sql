USE [Observatory]
GO

INSERT INTO [Observatory].[dbo].[Космические_объекты]
VALUES (18, 99652631, 78, 'add')
INSERT INTO [Observatory].[dbo].[Клиенты]
VALUES (18, 'Втавленный Н.Л', '17892375', 14, 13, 7)
INSERT INTO [Observatory].[dbo].[Отчёты]
VALUES (18, CONVERT(datetime, '09-06-20'))

UPDATE  [Observatory].[dbo].[Сост_оборуд]
	SET Описание_состояния='Изменено' 
	WHERE Сост_оборуд_id=17

UPDATE  [Observatory].[dbo].[Списанное_оборуд]
	SET Причина_списания='Трещина в корпусе' 
	WHERE Списанное_оборуд_id=17

UPDATE  [Observatory].[dbo].[Сувениры]
	SET Цена=135
	WHERE Цена=1

DELETE 
	FROM [Observatory].[dbo].[Услуга] 
	WHERE Стоимость = 889

DELETE 
	FROM [Observatory].[dbo].[Списанное_оборуд] 
	WHERE Списанное_оборуд_id=10

DELETE 
	FROM [Observatory].[dbo].[Клиенты]
	WHERE Услуга_id = 15
