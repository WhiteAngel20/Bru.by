ALTER TABLE Car
ADD CarRelation bigint UNIQUE,
Foreign key (CarRelation) REFERENCES Car (ID_release);
ALTER TABLE Phone
ADD PhoneRelation bigint UNIQUE,
Foreign key (PhoneRelation) REFERENCES TestTable3 (Id);