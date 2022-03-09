USE lab10

CREATE TABLE Otdel 
(
	NumberOtdel  INT  NOT NULL ,
	NameOtdel  VARCHAR(20) ,
	SurnameNachalnikaOtdela  VARCHAR(20) ,
	NumberNachalnikaOtdela  INT
)

USE lab10

CREATE TABLE Tovar 
(
	NumberTovara  INT  NOT NULL ,
	Cost  MONEY ,
	Size  VARCHAR(20) ,
	Kolichestvo  INT ,
	NumberOtdel INT
)

USE lab10

CREATE TABLE Zakaz 
(
	NumberZakaza  INT  NOT NULL ,
	TabelNumber  INT ,
	NumberTovara  INT ,
	NumberUsluzi  INT ,
	DateZakaza DATE ,
	VidZakaza VARCHAR(20)
)





USE lab10

CREATE TABLE OtdelSecond 
(
	NumberOtdel  INT  NOT NULL ,
	NameOtdel  VARCHAR(20) ,
	SurnameNachalnikaOtdela  VARCHAR(20) ,
	NumberNachalnikaOtdela  INT
)

USE lab10

CREATE TABLE TovarSecond 
(
	NumberTovara  INT  NOT NULL ,
	Cost  MONEY ,
	Size  VARCHAR(20) ,
	Kolichestvo  INT ,
	NumberOtdel INT
)

USE lab10

CREATE TABLE ZakazSecond 
(
	NumberZakaza  INT  NOT NULL ,
	TabelNumber  INT ,
	NumberTovara  INT ,
	NumberUsluzi  INT ,
	DateZakaza DATE ,
	VidZakaza VARCHAR(20)
)