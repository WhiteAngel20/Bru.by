USE lab10

CREATE TABLE table1 
(
	pr1 INT NOT NULL,
	pr2 INT NOT NULL,
	NameOtdel  VARCHAR(20) NOT NULL ,
	SurnameNachalnikaOtdela  VARCHAR(20) NOT NULL ,
	NumberNachalnikaOtdela  INT NOT NULL,
	PRIMARY KEY (pr1, pr2) 
)

CREATE TABLE table2
(
	NumberOtdel  INT  PRIMARY KEY IDENTITY(1,1),
	NameOtdel  VARCHAR(20) NOT NULL ,
	SurnameNachalnikaOtdela  VARCHAR(20) NOT NULL ,
	NumberNachalnikaOtdela  INT NOT NULL,
	Date_Deleted datetime,
	FK1 INT UNIQUE,
	FK2 INT UNIQUE,
	FOREIGN KEY (FK1,FK2) REFERENCES table1 (pr1,pr2)
	ON DELETE CASCADE
    ON UPDATE CASCADE
)