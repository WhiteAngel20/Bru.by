CREATE TRIGGER trigger_car
ON CarRemove
AFTER DELETE
AS
INSERT INTO CarRemove(ID_release, title, Manufacturer,Size, Seat_num, Speed, wieght)
SELECT ID_release, title, Manufacturer,Size, Seat_num, Speed, wieght
FROM DELETED


