CREATE TRIGGER trigger_laptop
ON LaptopRemove
AFTER DELETE
AS
INSERT INTO LaptopRemove(ID_release, title, Manufacturer,Size, OS)
SELECT ID_release, title, Manufacturer,Size, OS
FROM DELETED


