CREATE TRIGGER Otdel_DEL
ON Otdel
AFTER DELETE
AS
INSERT INTO OtdelSecond (NumberOtdel, NameOtdel, SurnameNachalnikaOtdela, NumberNachalnikaOtdela)
SELECT NumberOtdel, NameOtdel, SurnameNachalnikaOtdela, NumberNachalnikaOtdela 
FROM DELETED
