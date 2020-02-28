DROP TABLE client;
DROP TABLE countries_location;
DROP TABLE country;
DROP TABLE location;
DROP TABLE passport;
DROP TABLE passport_type;
DROP TABLE visa;
DROP TABLE visa_type;

CREATE TABLE client (
    client_id NUMBER(6) NOT NULL
);

ALTER TABLE client ADD CONSTRAINT clt_id_pk PRIMARY KEY ( client_id );

CREATE TABLE countries_location (
    location_id  NUMBER(3) NOT NULL,
    country_id   NUMBER(3) NOT NULL
);

ALTER TABLE countries_location ADD CONSTRAINT countries_location_pk PRIMARY KEY ( location_id,
                                                                                  country_id );

CREATE TABLE country (
    country_id    NUMBER(3) NOT NULL,
    country_name  VARCHAR2(50) NOT NULL
);

ALTER TABLE country ADD CONSTRAINT country_id_pk PRIMARY KEY ( country_id );

CREATE TABLE location (
    location_id    NUMBER(3) NOT NULL,
    location_name  VARCHAR2(50) NOT NULL
);

ALTER TABLE location ADD CONSTRAINT loc_id_pk PRIMARY KEY ( location_id );

CREATE TABLE passport (
    passport_id       NUMBER(10) NOT NULL,
    client_id         NUMBER(6) NOT NULL,
    passport_type_id  NUMBER(2) NOT NULL,
    issue_date        DATE NOT NULL,
    expiry_date       DATE NOT NULL,
    first_name        VARCHAR2(25) NOT NULL,
    last_name         VARCHAR2(25) NOT NULL,
    patronymic        VARCHAR2(25),
    gender            VARCHAR2(1) NOT NULL,
    birth_date        DATE NOT NULL,
    birth_place       VARCHAR2(50) NOT NULL,
    authority         VARCHAR2(50) NOT NULL
);

ALTER TABLE passport ADD CONSTRAINT ppt_id_pk PRIMARY KEY ( passport_id );

CREATE TABLE passport_type (
    passport_type_id    NUMBER(2) NOT NULL,
    passport_type_name  VARCHAR2(50) NOT NULL
);

ALTER TABLE passport_type ADD CONSTRAINT ppt_type_id_pk PRIMARY KEY ( passport_type_id );

CREATE TABLE visa (
    visa_id       NUMBER(8) NOT NULL,
    passport_id   NUMBER(10) NOT NULL,
    visa_type_id  NUMBER(2) NOT NULL,
    location_id   NUMBER(3) NOT NULL,
    issue_date    DATE NOT NULL,
    expiry_date   DATE NOT NULL
);

ALTER TABLE visa ADD CONSTRAINT visa_id_pk PRIMARY KEY ( visa_id );

CREATE TABLE visa_type (
    visa_type_id    NUMBER(2) NOT NULL,
    visa_type_name  VARCHAR2(50) NOT NULL,
    immigration     NUMBER NOT NULL
);

ALTER TABLE visa_type ADD CONSTRAINT visa_type_id_pk PRIMARY KEY ( visa_type_id );

ALTER TABLE countries_location
    ADD CONSTRAINT countries_loc_country_fk FOREIGN KEY ( country_id )
        REFERENCES country ( country_id );

ALTER TABLE countries_location
    ADD CONSTRAINT countries_loc_loc_fk FOREIGN KEY ( location_id )
        REFERENCES location ( location_id );

ALTER TABLE passport
    ADD CONSTRAINT ppt_clt_id_fk FOREIGN KEY ( client_id )
        REFERENCES client ( client_id );

ALTER TABLE passport
    ADD CONSTRAINT ppt_ppt_type_id_fk FOREIGN KEY ( passport_type_id )
        REFERENCES passport_type ( passport_type_id );

ALTER TABLE visa
    ADD CONSTRAINT visa_loc_id_fk FOREIGN KEY ( location_id )
        REFERENCES location ( location_id );

ALTER TABLE visa
    ADD CONSTRAINT visa_ppt_id_fk FOREIGN KEY ( passport_id )
        REFERENCES passport ( passport_id );

ALTER TABLE visa
    ADD CONSTRAINT visa_visa_type_id_fk FOREIGN KEY ( visa_type_id )
        REFERENCES visa_type ( visa_type_id );

--Populate country table
INSERT INTO country(country_id,country_name)
VALUES(1,'Турция');
INSERT INTO country(country_id,country_name)
VALUES(2,'Германия');
INSERT INTO country(country_id,country_name)
VALUES(3,'Финландия');
INSERT INTO country(country_id,country_name)
VALUES(4,'Молдова');
INSERT INTO country(country_id,country_name)
VALUES(5,'Сербия');
INSERT INTO country(country_id,country_name)
VALUES(6,'Канада');
INSERT INTO country(country_id,country_name)
VALUES(7,'Египет');

--Populate passport_type table
INSERT INTO passport_type(passport_type_id, passport_type_name)
VALUES(1,'Внутренний');
INSERT INTO passport_type(passport_type_id, passport_type_name)
VALUES(2,'Заграничный');
INSERT INTO passport_type(passport_type_id, passport_type_name)
VALUES(3,'Дипломатический');

--Populate visa type table
INSERT INTO visa_type(visa_type_id, visa_type_name,immigration)
VALUES(1,'Туристическая',0);
INSERT INTO visa_type(visa_type_id, visa_type_name,immigration)
VALUES(2,'Рабочая',0);
INSERT INTO visa_type(visa_type_id, visa_type_name,immigration)
VALUES(3,'Учебная',0);
INSERT INTO visa_type(visa_type_id, visa_type_name,immigration)
VALUES(4,'Дипломатическая',0);
INSERT INTO visa_type(visa_type_id, visa_type_name,immigration)
VALUES(5,'Транзитная',0);
INSERT INTO visa_type(visa_type_id, visa_type_name,immigration)
VALUES(6,'Семейная',0);

DROP SEQUENCE client_seq;
DROP SEQUENCE country_seq;
DROP SEQUENCE location_seq;
DROP SEQUENCE passport_type;
DROP SEQUENCE visa_type;

CREATE SEQUENCE client_seq
	MINVALUE 1 
	MAXVALUE 999999
	INCREMENT BY 1
	START WITH 1 
	NOCACHE  NOORDER  NOCYCLE;

CREATE SEQUENCE country_seq
	MINVALUE 1 
	MAXVALUE 999
	INCREMENT BY 1
	START WITH 1 
	NOCACHE  NOORDER  NOCYCLE;

CREATE SEQUENCE location_seq
	MINVALUE 1 
	MAXVALUE 999
	INCREMENT BY 1
	START WITH 1 
	NOCACHE  NOORDER  NOCYCLE;

CREATE SEQUENCE passport_type
	MINVALUE 1 
	MAXVALUE 99
	INCREMENT BY 1
	START WITH 1 
	NOCACHE  NOORDER  NOCYCLE;

CREATE SEQUENCE visa_type
	MINVALUE 1 
	MAXVALUE 99
	INCREMENT BY 1
	START WITH 1 
	NOCACHE  NOORDER  NOCYCLE;




