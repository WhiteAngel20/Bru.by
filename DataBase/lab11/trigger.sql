CREATE TRIGGER Zakaz_DEL
ON Zakaz
FOR DELETE
AS
INSERT INTO ZakazSecond (NumberZakaza, TabelNumber, NumberTovara, NumberUsluzi, DateZakaza, VidZakaza, ����_��������)
SELECT NumberZakaza, TabelNumber, NumberTovara, NumberUsluzi, DateZakaza, VidZakaza, getdate()
FROM DELETED
