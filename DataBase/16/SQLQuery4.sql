USE Observatory

GO
CREATE PROCEDURE EquipmentSmmary
AS
	SELECT Оборудование.Описание as descrition, Оборудование.Цена, Оборудование.Оборудование_id
	FROM Оборудование

GO
CREATE PROCEDURE get_souvenirs @get_price VARCHAR(50)
AS
SELECT *
FROM Сувениры ORDER BY
	CASE @get_price
		WHEN 'маленькая сумма'
		THEN
		(SELECT Сувениры.Сувениры_id, Сувениры.Наименование, SUM(Сувениры.Цена) as price
			FROM Сувениры
			INNER JOIN Клиенты ON Клиенты.Сувениры_id = Сувениры.Сувениры_id
			GROUP BY Сувениры.Цена
			HAVING SUM(Сувениры.Цена) < 14)
		WHEN 'средняя сумма'
		THEN
			(SELECT Сувениры.Сувениры_id, Сувениры.Наименование, SUM(Сувениры.Цена) as price
			FROM Сувениры
			INNER JOIN Клиенты ON Клиенты.Сувениры_id = Сувениры.Сувениры_id
			GROUP BY Сувениры.Цена
			HAVING SUM(Сувениры.Цена) > 14 and SUM(Сувениры.Цена) < 100)
		WHEN 'Большая сумма'
		THEN
			(SELECT Сувениры.Сувениры_id, Сувениры.Наименование, SUM(Сувениры.Цена) as price
			FROM Сувениры
			INNER JOIN Клиенты ON Клиенты.Сувениры_id = Сувениры.Сувениры_id
			GROUP BY Сувениры.Цена
			HAVING SUM(Сувениры.Цена) > 100)
	END

GO
CREATE PROCEDURE ContractClientByDate @d1 DATETIME, @d2 DATETIME
AS
BEGIN
	SELECT *
	FROM Договоры_с_клиентами
	WHERE Договоры_с_клиентами.Дата_заключения_договора BETWEEN @d1 and @d2
	GROUP BY Договоры_с_клиентами.Дата_заключения_договора;
END 

go
CREATE PROCEDURE ContractClientByServiseID @serviseID smallint
AS
	SELECT *
	FROM Договоры_с_клиентами 
	INNER JOIN Услуга
	ON Услуга.Услуга_id = @serviseID
	GROUP BY Договоры_с_клиентами.Услуга_id
GO;


CREATE PROCEDURE PositionSalary @salary smallint
AS
SELECT Должность.Должность_id, Должность.Зарплата, Должность.Наименование
FROM Должность
WHERE Должность.Зарплата > @salary
GO;

CREATE PROCEDURE FindPositionSalary @title VARCHAR(50)
AS
SELECT Должность.Должность_id, Должность.Зарплата, Должность.Наименование
FROM Должность
WHERE @title = Должность.Наименование
GO;

GO
CREATE PROCEDURE GetPlanetByDistance @distance int as
SELECT *
FROM Космические_объекты ORDER BY
	CASE @distance
		WHEN 10 
		THEN
			(SELECT Космические_объекты.[Расстояние_от_Земли св.лет] as length_,
			Космические_объекты.Описание as title
			FROM Космические_объекты
			GROUP BY Космические_объекты.[Расстояние_от_Земли св.лет]
			HAVING Космические_объекты.[Расстояние_от_Земли св.лет] < @distance)
		WHEN 50
		THEN
			(SELECT Космические_объекты.[Расстояние_от_Земли св.лет] as length_,
			Космические_объекты.Описание as title
			FROM Космические_объекты
			GROUP BY Космические_объекты.[Расстояние_от_Земли св.лет]
			HAVING Космические_объекты.[Расстояние_от_Земли св.лет] < @distance)
		WHEN 100
		THEN
			(SELECT Космические_объекты.[Расстояние_от_Земли св.лет] as length_,
			Космические_объекты.Описание as title
			FROM Космические_объекты
			GROUP BY Космические_объекты.[Расстояние_от_Земли св.лет]
			HAVING Космические_объекты.[Расстояние_от_Земли св.лет] < @distance)
		ELSE 'No planets'
	END

GO
CREATE PROCEDURE GetMinOrMaxPlanetSize @size int
AS 
	SELECT Космические_объекты.[Размер км], Космические_объекты.Описание
	FROM Космические_объекты ORDER BY
		CASE  @size
			WHEN (SELECT MIN(Космические_объекты.[Размер км]) FROM Космические_объекты)
			THEN 'Найдена минимальный размер планеты'
			WHEN (SELECT MAX(Космические_объекты.[Размер км]) FROM Космические_объекты)
			THEN 'Найдена максимальный размер планеты'
		END 

GO
CREATE PROCEDURE EquimentState @stateID smallint
AS
	SELECT Оборудование.Описание, Оборудование.Сост_оборуд_id, COUNT(Оборудование.Сост_оборуд_id)
	FROM Оборудование INNER JOIN Сост_оборуд ON Оборудование.Сост_оборуд_id = Сост_оборуд.Сост_оборуд_id
	GROUP BY Оборудование.Сост_оборуд_id
	HAVING COUNT(Оборудование.Сост_оборуд_id)>1


GO
CREATE PROCEDURE SortDescriptionEquimentByAlph @type_sort VARCHAR(15)
AS
	SELECT Оборудование.Описание
	FROM Оборудование ORDER BY
		CASE  @type_sort
			WHEN 'asc'
			THEN 
				(SELECT Оборудование.Описание FROM Оборудование ORDER BY Оборудование.Описание ASC)
			WHEN 'desc'
			THEN 
				(SELECT Оборудование.Описание FROM Оборудование ORDER BY Оборудование.Описание DESC)
		END

GO
CREATE PROCEDURE get_data_reporting @d1 DATETIME, @d2 DATETIME
AS
	SELECT *
	FROM Отчёты
	WHERE Отчёты.Дата_создания BETWEEN @d1 and @d2
	GROUP BY Отчёты.Дата_создания

GO
CREATE PROCEDURE CreateReport @id smallint, @dt_tm datetime
AS
	IF EXISTS (SELECT * FROM Отчёты
				WHERE Отчёты.Дата_создания = @dt_tm OR Отчёты.Отчёты_id = @id
				)
				RETURN 0
	INSERT dbo.Отчёты (Отчёты_id, Дата_создания)
	VALUES(@id, @dt_tm)


GO
CREATE PROCEDURE UpdateStateEquiment @id smallint, @decsrp varchar(200), @new_descrp VARCHAR(200)
AS
	if EXISTS (SELECT * FROM Сост_оборуд 
				WHERE Сост_оборуд.Сост_оборуд_id != @id
				)
				RETURN 0
	UPDATE dbo.Сост_оборуд
	SET Описание_состояния = @new_descrp
	WHERE Описание_состояния = @decsrp


GO
CREATE PROCEDURE DeleteStateEquiment  @id smallint
AS
	if EXISTS (SELECT * FROM Сост_оборуд 
				WHERE Сост_оборуд.Сост_оборуд_id != @id
				)
				RETURN 0
	DELETE FROM Сост_оборуд
	WHERE Сост_оборуд.Сост_оборуд_id = @id


GO
CREATE PROCEDURE EmployeeExperience @years int
AS
	IF EXISTS (SELECT Сотрудники.id, Сотрудники.ФИО, Сотрудники.Стаж
				FROM Сотрудники
				WHERE Сотрудники.Стаж != @years
	)
	RETURN 0
	SELECT  Сотрудники.Договор_id, Сотрудники.ФИО, 
			Сотрудники.Контактный_номер, Сотрудники.Должность_id,
			Сотрудники.Оборудование_id
	FROM Сотрудники
	INNER JOIN Должность ON Должность.Должность_id = Сотрудники.Должность_id
	INNER JOIN Оборудование ON Оборудование.Оборудование_id = Сотрудники.Оборудование_id
	GROUP BY Сотрудники.Договор_id

GO
CREATE PROCEDURE UpdateEmployeePhone @id smallint, @newphone VARCHAR(50)
AS
	IF EXISTS(SELECT * FROM Сотрудники WHERE Сотрудники.id = @id)
	RETURN 0
	UPDATE Сотрудники
	SET Контактный_номер = @newphone
	WHERE id = @id

GO
CREATE PROCEDURE GetUniqueBreakEquiment
AS
	SELECT DISTINCT Списанное_оборуд.Причина_списания, Списанное_оборуд.Списанное_оборуд_id
	FROM Списанное_оборуд


GO
CREATE PROCEDURE InsertBreakEquiment @id smallint, @reason VARCHAR(50)
AS
	IF EXISTS (SELECT * FROM Списанное_оборуд WHERE Списанное_оборуд.Списанное_оборуд_id = @id)
	RETURN 0
	
	INSERT INTO Списанное_оборуд(Списанное_оборуд_id, Причина_списания)
	VALUES (@id, @reason)

GO
CREATE PROCEDURE UpdateBreakEquiment @id smallint, @reason VARCHAR(100)
AS
	IF not EXISTS (SELECT * FROM Списанное_оборуд WHERE Списанное_оборуд.Списанное_оборуд_id = @id)
	RETURN 0
	UPDATE Списанное_оборуд
	SET Причина_списания = @reason
	WHERE Списанное_оборуд_id  = @id

GO
CREATE PROCEDURE UpdateSouvenir
@id smallint, @price VARCHAR(100)
AS
	IF not EXISTS (SELECT * FROM Сувениры WHERE Сувениры_id=@id)
	RETURN 0
	UPDATE Сувениры
	SET Цена = @price
	WHERE Сувениры_id  = @id
