CREATE TRIGGER trigger_phone
ON PhoneRemove
AFTER DELETE
AS
INSERT INTO PhoneRemove(ID_release, title, Manufacturer, Size, OS)
SELECT ID_release, title, Manufacturer, Size, OS
FROM DELETED