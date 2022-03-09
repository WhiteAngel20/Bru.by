ALTER TABLE Laptop
	ADD car_id bigint UNIQUE,
	FOREIGN KEY (car_id) REFERENCES Car(ID_release);
	
ALTER TABLE Laptop
	ADD ph_id BIGINT UNIQUE,
	FOREIGN KEY (ph_id) REFERENCES Phone(ID_release)