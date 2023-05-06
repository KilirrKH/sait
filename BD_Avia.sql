DROP TABLE A_Cities CASCADE CONSTRAINTS;
DROP TABLE A_Airports CASCADE CONSTRAINTS;
DROP TABLE A_Airlines CASCADE CONSTRAINTS;
DROP TABLE A_Crews CASCADE CONSTRAINTS;
DROP TABLE A_Employees CASCADE CONSTRAINTS;
DROP TABLE A_AircraftTypes CASCADE CONSTRAINTS;
DROP TABLE A_Aircrafts CASCADE CONSTRAINTS;
DROP TABLE A_RouteTypes CASCADE CONSTRAINTS;
DROP TABLE A_Routes CASCADE CONSTRAINTS;
DROP TABLE A_Flights CASCADE CONSTRAINTS;

DROP SEQUENCE A_Cities;
DROP SEQUENCE A_Airports;
DROP SEQUENCE A_Airlines;
DROP SEQUENCE A_Crews;
DROP SEQUENCE A_Employees;
DROP SEQUENCE A_AircraftTypes;
DROP SEQUENCE A_Aircrafts;
DROP SEQUENCE A_RouteTypes;
DROP SEQUENCE A_Routes;
DROP SEQUENCE A_Flights;

CREATE SEQUENCE Cities;
CREATE SEQUENCE Airports;
CREATE SEQUENCE Airlines;
CREATE SEQUENCE Crews;
CREATE SEQUENCE Employees;
CREATE SEQUENCE AircraftTypes;
CREATE SEQUENCE Aircrafts;
CREATE SEQUENCE RouteTypes;
CREATE SEQUENCE Routes;
CREATE SEQUENCE Flights;

CREATE TABLE A_Cities(
City_id INTEGER,
Country VARCHAR(30) DEFAULT 'Россия',
City VARCHAR(40),
GMT INTEGER
);

ALTER TABLE A_Cities
ADD CONSTRAINT A_Cities_PK PRIMARY KEY(City_id);

CREATE TABLE A_Airports(
Airport_id INTEGER,
Code CHAR(3),
FullName VARCHAR(60),
City_id INTEGER
);

ALTER TABLE A_Airports
ADD CONSTRAINT A_Airports_PK PRIMARY KEY(Airport_id);

CREATE TABLE A_Airlines(
Airline_id INTEGER,
N_Name VARCHAR(60),
HQ_City_id INTEGER
);

ALTER TABLE A_Airlines
ADD CONSTRAINT A_Airlines_PK PRIMARY KEY(Airline_id);

CREATE TABLE A_Crews(
Crew_id INTEGER,
Crew_number VARCHAR(10),
Reserve_crew_id INTEGER
);

ALTER TABLE A_Crews
ADD CONSTRAINT A_Crews_PK PRIMARY KEY(Crew_id);

CREATE TABLE A_Employees(
Emp_id INTEGER,
N_Name VARCHAR(70),
Age INTEGER,
Gender CHAR(1),
Position VARCHAR(40),
HireDate DATE,
Airline_id INTEGER,
Crew_id INTEGER
);

ALTER TABLE A_Employees
ADD CONSTRAINT A_Employees_PK PRIMARY KEY(Emp_id);

ALTER TABLE A_Employees
ADD CONSTRAINT A_Employees_Gender_CHK
CHECK (Gender in ('M', 'F'));

CREATE TABLE A_AircraftTypes(
Type_id INTEGER,
Producer VARCHAR(20),
Model VARCHAR(20),
Capacity INTEGER,
StartUpYear CHAR(4)
);

ALTER TABLE A_AircraftTypes
ADD CONSTRAINT A_AircraftTypes_PK PRIMARY KEY(Type_id);

CREATE TABLE A_Aircrafts(
Airline_id INTEGER,
AircraftType_id INTEGER,
StartUsingDate DATE,
Quantity INTEGER
);

ALTER TABLE A_Aircrafts
ADD CONSTRAINT A_Aircrafts_PK PRIMARY KEY(Airline_id, AircraftType_id);

CREATE TABLE A_RouteTypes(
Type_id INTEGER,
N_Name CHAR(1)
);

ALTER TABLE A_RouteTypes
ADD CONSTRAINT A_RouteTypes_PK PRIMARY KEY(Type_id);

CREATE TABLE A_Routes(
Route_id INTEGER,
AirportFrom_id INTEGER,
AirportTo_id INTEGER,
Duration INTEGER,
Distance INTEGER,
TimeFrom DATE,
EconomicPrice INTEGER,
BusinessPrice INTEGER,
C_Changes INTEGER,
RouteType_id INTEGER,
Airline_id INTEGER,
AircraftType_id INTEGER
);

ALTER TABLE A_Routes
ADD CONSTRAINT A_Routes_PK PRIMARY KEY(Route_id);

CREATE TABLE A_Flights(
Flight_id INTEGER,
DepartureDate DATE,
ArrivalDate DATE,
ActualBusiness INTEGER,
ActualEconomic INTEGER,
Route_id INTEGER,
Crew_id INTEGER
);

ALTER TABLE A_Flights
ADD CONSTRAINT A_Flights_PK PRIMARY KEY(Flight_id);

-------------------
-- Foreign  keys --
-------------------

ALTER TABLE A_Airports
ADD CONSTRAINT A_Airports_A_Cities_FK FOREIGN KEY(City_id)
REFERENCES A_Cities(City_id);

ALTER TABLE A_Airlines
ADD CONSTRAINT A_Airlines_A_Cities_FK FOREIGN KEY(HQ_City_id)
REFERENCES A_Cities(City_id);

ALTER TABLE A_Crews
ADD CONSTRAINT A_Crews_A_Crews_FK FOREIGN KEY(Reserve_crew_id)
REFERENCES A_Crews(Crew_id);

ALTER TABLE A_Employees
ADD CONSTRAINT A_Employees_A_Crews_FK FOREIGN KEY(Crew_id)
REFERENCES A_Crews(Crew_id);

ALTER TABLE A_Employees
ADD CONSTRAINT A_Employees_A_Airlines_FK FOREIGN KEY(Airline_id)
REFERENCES A_Airlines(Airline_id);

ALTER TABLE A_Aircrafts
ADD CONSTRAINT A_Aircrafts_A_AircraftTypes_FK FOREIGN KEY(AircraftType_id)
REFERENCES A_AircraftTypes(Type_id);

ALTER TABLE A_Aircrafts
ADD CONSTRAINT A_Aircrafts_A_Airlines_FK FOREIGN KEY(Airline_id)
REFERENCES A_Airlines(Airline_id);

ALTER TABLE A_Routes
ADD CONSTRAINT A_Routes_A_AirportsFrom_FK FOREIGN KEY(AirportFrom_id)
REFERENCES A_Airports(Airport_id);

ALTER TABLE A_Routes
ADD CONSTRAINT A_Routes_A_AirportsTo_FK FOREIGN KEY(AirportTo_id)
REFERENCES A_Airports(Airport_id);

ALTER TABLE A_Routes
ADD CONSTRAINT A_Routes_A_RouteTypes_FK FOREIGN KEY(RouteType_id)
REFERENCES A_RouteTypes(Type_id);

ALTER TABLE A_Routes
ADD CONSTRAINT A_Routes_A_Aircrafts_FK FOREIGN KEY(Airline_id, AircraftType_id)
REFERENCES A_Aircrafts(Airline_id, AircraftType_id);

ALTER TABLE A_Flights
ADD CONSTRAINT A_Flights_A_Routes_FK FOREIGN KEY(Route_id)
REFERENCES A_Routes(Route_id);

ALTER TABLE A_Flights
ADD CONSTRAINT A_Flights_A_Crews_FK FOREIGN KEY(Crew_id)
REFERENCES A_Crews(Crew_id);

------------
-- A_Cities --
------------

INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(1, 'Россия', 'Москва', 3);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(2,'Россия', 'Санкт-Петербург', 3);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(3,'Белоруссия', 'Минск', 2);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(4,'Россия', 'Владивосток', 10);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(5,'Россия', 'Екатеринбург', 6);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(6,'Турция', 'Анталия', 2);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(7,'США', 'Нью-Йорк', -5);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(8,'Франция', 'Париж', 2);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(9,'Нидерланды', 'Амстердам', 2);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(10,'Россия', 'Домодедово', 3);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(11,'Россия', 'Обь', 7);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(12,'Германия', 'Франкфурт-на-Майне', 1);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(13,'Италия', 'Рим', 1);
INSERT INTO A_Cities (City_id, Country, City, GMT) VALUES(14,'Испания', 'Барселона', 1);

--------------
-- A_Airports --

--------------


INSERT INTO A_Airports (Airport_id, Code, FullName, City_id) VALUES(1, 'SVO', 'Шереметьево-1', 1) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id) VALUES(2, 'SVO', 'Шереметьево-2', 1) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id) VALUES(3, 'DME', 'Домодедово', 1) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id) VALUES(4, 'VKO', 'Внуково', 1) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id) VALUES(5, 'LED', 'Пулково-1', 2) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports  (Airport_id, Code, FullName, City_id) VALUES(6, 'LED', 'Пулково-2', 2) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(7, 'MSQ', 'Национальный аэропорт Минск', 3) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(8, 'VVO', 'Кневичи', 4) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(9, 'SVX', 'Кольцово', 5) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(10, 'AYT', 'Antalya Airport', 6)ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(11, 'JFK', 'John F. Kennedy International Airport', 7) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(12, 'LGA', 'LaGuardia Airport', 7) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(13, 'ORY', 'Paris-Orly Airport', 8) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(14, 'CDG', 'Charles de Gaulle International Airport', 8) ON CONFLICT DO NOTHING; 
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(15, 'AMS', 'Amsterdam Airport Schiphol', 9) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(16, 'FRA', 'Frankfurt International Airport', 12) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports  (Airport_id, Code, FullName, City_id) VALUES(17, 'FCO', 'Leonardo Da Vinci International Airport', 13) ON CONFLICT DO NOTHING;
INSERT INTO A_Airports (Airport_id, Code, FullName, City_id)  VALUES(18, 'BCN', 'Barcelona Airport', 14) ON CONFLICT DO NOTHING;



--------------
-- A_Airlines --
--------------

INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(1, 'Атлант-Союз', 1);
INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(2, 'Домодедовские авиалинии', 10);
INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(3, 'Аэрофлот', 1);
INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(4, 'Sky Express', 1);
INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(5, 'Сибирь', 11);
INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(6, 'Delta Air Lines', 7);
INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(7, 'Air France', 8);
INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(8, 'Lufthansa', 12);
INSERT INTO A_Airlines (Airline_id, N_Name, HQ_City_id) VALUES(9, 'Alitalia', 13);

-----------
-- A_Crews --
-----------

INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(1, 'A01', NULL);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(2, 'A02', 1);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(3, 'A03', NULL);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(4, 'A04', 3);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(5, 'A05', NULL);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(6, 'A06', 5);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(7, 'A07', 5);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(8, 'A08', NULL);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(9, 'R09', NULL);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(10, 'R10', 9);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(11, 'T11', NULL);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(12, 'T12', 11);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(13, 'G13', NULL);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(14, 'G14', 13);
INSERT INTO A_Crews (Crew_id, Crew_number, Reserve_crew_id) VALUES(15, 'G15', 13);

---------------
-- A_Employees --

---------------

-- Атлант-Союз (2 crews)
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(1, 'Кузнецов Андрей', 30, 'M', 'Командир корабля', CURRENT_DATE - INTERVAL '400 DAY', 1, 1);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(2, 'Кириллов Станислав', 28, 'M', 'Второй пилот', CURRENT_DATE - INTERVAL '300 DAY', 1, 1);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(3, 'Гречко Антон', 44, 'M', 'Штурман', CURRENT_DATE - INTERVAL '600 DAY', 1, 1);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(4, 'Бухтов Алексей', 38, 'M', 'Бортмеханик', CURRENT_DATE - INTERVAL '300 DAY', 1, 1);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(5, 'Жданова Ольга', 24, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '310 DAY', 1, 1);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(6, 'Ботников Кирилл', 28, 'M', 'Стюард', CURRENT_DATE - INTERVAL '300 DAY', 1, 1);

INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(7, 'Ваненков Игорь', NULL, 'M', 'Командир корабля', CURRENT_DATE - INTERVAL '410 DAY', 1, 2);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(8, 'Зизиков Павел', 28, 'M', 'Второй пилот', CURRENT_DATE - INTERVAL '100 DAY', 1, 2);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(9, 'Ухабов Андрей', 27, 'M', 'Штурман', CURRENT_DATE - INTERVAL '230 DAY', 1, 2);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(10, 'Персиков Петр', 38, 'M', 'Бортмеханик', CURRENT_DATE - INTERVAL '160 DAY', 1, 2);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(11, 'Зайцева Анна', 26, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '110 DAY', 1, 2);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(12, 'Курочкина Екатерина', 27, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '220 DAY', 1, 2);

-- Домодедовские авиалинии (2 crews)
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(13, 'Григорьев Никита', 45, 'M', 'Командир корабля', CURRENT_DATE - INTERVAL '390 DAY', 2, 3);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(14, 'Жданов Олег', 44, 'M', 'Второй пилот', CURRENT_DATE - INTERVAL '150 DAY', 2, 3);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(15, 'Яблочкин Ярослав', 29, 'M', 'Штурман', CURRENT_DATE - INTERVAL '230 DAY', 2, 3);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(16, 'Протасов Сергей', 31, 'M', 'Бортмеханик', CURRENT_DATE - INTERVAL '340 DAY', 2, 3);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(17, 'Блохина Анна', 28, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '110 DAY', 2, 2);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(18, 'Булатова Елена', 31, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '341 DAY', 2, 3);

INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(19, 'Петров Петр', 35, 'M', 'Командир корабля', CURRENT_DATE - INTERVAL '700 DAY', 2, 4);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(20, 'Архипов Олег', 28, 'M', 'Второй пилот', CURRENT_DATE - INTERVAL '230 DAY', 2, 4);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(21, 'Жирков Андрей', NULL, 'M', 'Штурман', CURRENT_DATE - INTERVAL '830 DAY', 2, 4);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(22, 'Карпов Евгений', 38, 'M', 'Бортмеханик', CURRENT_DATE - INTERVAL '250 DAY', 2, 4);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(23, 'Куваева Алина', 26, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '430 DAY', 2, 4);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(24, 'Жильцова Екатерина', 27, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '210 DAY', 2, 4);

-- Аэрофлот (3 crews)
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(25, 'Абанин Виктор', 45, 'M', 'Командир корабля', CURRENT_DATE - INTERVAL '710 DAY', 3, 5);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(26, 'Богданов Владимир', 53, 'M', 'Второй пилот', CURRENT_DATE - INTERVAL '330 DAY', 3, 5);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(27, 'Борзых Дмитрий', 37, 'M', 'Штурман', CURRENT_DATE - INTERVAL '130 DAY', 3, 5);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(28, 'Савельев Владимир', 31, 'M', 'Бортмеханик', CURRENT_DATE - INTERVAL '550 DAY', 3, 5);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(29, 'Рязанова Галина', 32, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '410 DAY', 3, 5);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(30, 'Самохвалова Екатерина', 32, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '410 DAY', 3, 5);

INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(31, 'Савин Геннадий', 41, 'M', 'Командир корабля', CURRENT_DATE - INTERVAL '510 DAY', 3, 6);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(32, 'Рыжков Владимир', 29, 'M', 'Второй пилот', CURRENT_DATE - INTERVAL '233 DAY', 3, 6);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(33, 'Николаев Герман', 37, 'M', 'Штурман', CURRENT_DATE - INTERVAL '831 DAY', 3, 6);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(34, 'Неткачев Виктор', 31, 'M', 'Бортмеханик', CURRENT_DATE - INTERVAL '340 DAY', 3, 6);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(35, 'Окорочкова Валентина', 36, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '123 DAY', 3, 6);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(36, 'Фалкин Владимир', 27, 'M', 'Стюард', CURRENT_DATE - INTERVAL '554 DAY', 3, 6);

INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(37, 'Павлов Олег', 51, 'M', 'Командир корабля', CURRENT_DATE - INTERVAL '126 DAY', 3, 7);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(38, 'Пиганов Михаил', 34, 'M', 'Второй пилот', CURRENT_DATE - INTERVAL '654 DAY', 3, 7);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(39, 'Уваров Вячеслав', 31, 'M', 'Штурман', CURRENT_DATE - INTERVAL '672 DAY', 3, 7);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(40, 'Карповцев Николай', 43, 'M', 'Бортмеханик', CURRENT_DATE - INTERVAL '250 DAY', 3, 7);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(41, 'Суслова Анна', 31, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '410 DAY', 3, 7);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(42, 'Хохлова Валентина', 35, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '240 DAY', 3, 7);

-- Сибирь (1 crew)
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(43, 'Ткаченко Анатолий', 41, 'M', 'Командир корабля', CURRENT_DATE - INTERVAL '230 DAY', 5, 8);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(44, 'Фролов Владимир', 38, 'M', 'Второй пилот', CURRENT_DATE - INTERVAL '230 DAY', 5, 8);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(45, 'Устинов Дмитрий', 24, 'M', 'Штурман', CURRENT_DATE - INTERVAL '130 DAY', 5, 8);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(46, 'Цыганов Александр', 48, 'M', 'Бортмеханик', CURRENT_DATE - INTERVAL '350 DAY', 5, 8);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(47, 'Носова Екатерина', 33, 'F', 'Стюардесса', CURRENT_DATE - INTERVAL '440 DAY', 5, 8);

-- Delta Air Lines (2 crews)
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(48, 'George Brawn', 50, 'M', 'Captain', CURRENT_DATE - INTERVAL '300 DAY', 6, 9);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(49, 'Peter White', 38, 'M', 'Co-pilot', CURRENT_DATE - INTERVAL '240 DAY', 6, 9);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(50, 'Michele Hunter', 43, 'M', 'Navigator', CURRENT_DATE - INTERVAL '812 DAY', 6, 9);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(51, 'John Gilbert', 22, 'M', 'Flight engineer', CURRENT_DATE - INTERVAL '320 DAY', 6, 9);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(52, 'Stefany Mayer', 29, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '760 DAY', 6, 9);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(53, 'Helen Stewart', 25, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '290 DAY', 6, 9);

INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(54, 'Robert Hunt', 45, 'M', 'Captain', CURRENT_DATE - INTERVAL '320 DAY', 6, 10);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(55, 'Jille Kolbert', 46, 'M', 'Co-pilot', CURRENT_DATE - INTERVAL '130 DAY', 6, 10);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(56, 'Ivan Red', 47, 'M', 'Navigator', CURRENT_DATE - INTERVAL '321 DAY', 6, 10);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(57, 'Kollen Ball', 38, 'M', 'Flight engineer', CURRENT_DATE - INTERVAL '241 DAY', 6, 10);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(58, 'Nicole Downy', NULL, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '410 DAY', 6, 10);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(59, 'Bill Sanderland', 34, 'M', 'Steward', CURRENT_DATE - INTERVAL '310 DAY', 6, 10);

-- Air France (2 crews)
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(60, 'Frederic Olivera', 43, 'M', 'Captain', CURRENT_DATE - INTERVAL '410 DAY', 7, 11);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(61, 'Thomas Rupport', 38, 'M', 'Co-pilot', CURRENT_DATE - INTERVAL '260 DAY', 7, 11);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(62, 'Bernard Edisson', 37, 'M', 'Navigator', CURRENT_DATE - INTERVAL '830 DAY', 7, 11);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(63, 'Martin Show', 28, 'M', 'Flight engineer', CURRENT_DATE - INTERVAL '453 DAY', 7, 11);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(64, 'Fiona Rusvelt', 26, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '241 DAY', 7, 11);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(65, 'Susan Night', 29, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '321 DAY', 7, 11);

INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(66, 'David Jibrille', 41, 'M', 'Captain', CURRENT_DATE - INTERVAL '1200 DAY', 7, 12);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(67, 'Girard Kallen', 41, 'M', 'Co-pilot', CURRENT_DATE - INTERVAL '442 DAY', 7, 12);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(68, 'Andre Morisson', 22, 'M', 'Navigator', CURRENT_DATE - INTERVAL '243 DAY', 7, 12);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(69, 'Leroy James', 25, 'M', 'Flight engineer', CURRENT_DATE - INTERVAL '998 DAY', 7, 12);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(70, 'Katrin Bouchet', 28, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '1231 DAY', 7, 12);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(71, 'Paulin Dare', 22, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '780 DAY', 7, 12);

-- Lufthansa (3 crews)
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(72, 'Kiefer Wilson', 51, 'M', 'Captain', CURRENT_DATE - INTERVAL '1000 DAY', 8, 13);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(73, 'Liam Smith', 31, 'M', 'Co-pilot', CURRENT_DATE - INTERVAL '120 DAY', 8, 13);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(74, 'William Baker', 33, 'M', 'Navigator', CURRENT_DATE - INTERVAL '810 DAY', 8, 13);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(75, 'Jacob Grant', 54, 'M', 'Flight engineer', CURRENT_DATE - INTERVAL '230 DAY', 8, 13);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(76, 'Melanie Dixon', 34, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '410 DAY', 8, 13);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(77, 'Michael Pearson', 25, 'M', 'Steward', CURRENT_DATE - INTERVAL '810 DAY', 8, 13);

INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(78, 'Matthew Harper', 43, 'M', 'Captain', CURRENT_DATE - INTERVAL '720 DAY', 8, 14);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(79, 'Andrew Gordon', 28, 'M', 'Co-pilot', CURRENT_DATE - INTERVAL '130 DAY', 8, 14);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(80, 'Daniel Harvey', 37, 'M', 'Navigator', CURRENT_DATE - INTERVAL '876 DAY', 8, 14);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(81, 'Kevin Dean', 33, 'M', 'Flight engineer', CURRENT_DATE - INTERVAL '123 DAY', 8, 14);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(82, 'Emma Pearce', 34, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '431 DAY', 8, 14);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(83, 'Raine Cole', 26, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '331 DAY', 8, 14);

INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(84, 'Luke Reid', 45, 'M', 'Captain', CURRENT_DATE - INTERVAL '676 DAY', 8, 15);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(85, 'Diego Lopez', 38, 'M', 'Co-pilot', CURRENT_DATE - INTERVAL '223 DAY', 8, 15);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(86, 'Sebastian Murray', 31, 'M', 'Navigator', CURRENT_DATE - INTERVAL '231 DAY', 8, 15);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(87, 'Alejandro Dominges', 28, 'M', 'Flight engineer', CURRENT_DATE - INTERVAL '334 DAY', 8, 15);
INSERT INTO A_Employees (Emp_id, N_Name, Age, Gender, Position, HireDate, Airline_id, Crew_id) VALUES(88, 'Heidi Graham', 29, 'F', 'Stewardess', CURRENT_DATE - INTERVAL '341 DAY', 8, 15);

-------------------
-- A_AircraftTypes --
-------------------

INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(1, 'ОКБ С.В. Ильюшина', 'Ил-86', 350, '1980');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(2, 'The Boeing Company', 'Boeing-747', 250, '1969');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(3, 'The Boeing Company', 'Boeing-767', 325, '1982');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(4, 'The Boeing Company', 'Boeing-777', 550, '1995');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(5, 'ОКБ им. Туполева', 'Ту-154М', 180, '1984');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(6, 'McDonnell Douglas', 'DC-10', 380, '1968');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(7, 'McDonnell Douglas', 'MD-11', 287, '1988');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(8, 'Fokker', '70', 75, '1994');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(9, 'Airbus S.A.S', 'А320', 180, '1988');
INSERT INTO A_AircraftTypes (Type_id, Producer, Model, Capacity, StartUpYear) VALUES(10, 'Airbus S.A.S', 'А340', 261, '1993');

---------------
-- A_Aircrafts --
---------------

-- Атлант-Союз
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(1, 1, to_date('31.03.1992', 'dd.mm.yyyy'), 7);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(1, 3, to_date('01.10.1995', 'dd.mm.yyyy'), 3);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(1, 4, to_date('14.02.1998', 'dd.mm.yyyy'), 2);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(1, 5, to_date('04.03.1988', 'dd.mm.yyyy'), 3);

-- Домодедовские авиалинии
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(2, 1, to_date('02.04.1992', 'dd.mm.yyyy'), 2);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(2, 5, to_date('08.08.1988', 'dd.mm.yyyy'), 6);

-- Аэрофлот
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(3, 1, to_date('17.01.1982', 'dd.mm.yyyy'), 10);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(3, 5, to_date('12.12.1985', 'dd.mm.yyyy'), 5);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(3, 2, to_date('04.03.1970', 'dd.mm.yyyy'), 3);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(3, 4, to_date('14.01.1996', 'dd.mm.yyyy'), 5);

-- Sky Express
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(4, 5, to_date('30.04.2000', 'dd.mm.yyyy'), 2);

-- Delta Air Lines
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(6, 6, to_date('10.05.1969', 'dd.mm.yyyy'), 5);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(6, 7, to_date('15.09.1989', 'dd.mm.yyyy'), 10);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(6, 2, to_date('14.07.1971', 'dd.mm.yyyy'), 2);

-- Lufthansa
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(8, 3, to_date('01.05.1996', 'dd.mm.yyyy'), 5);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(8, 8, to_date('20.02.1995', 'dd.mm.yyyy'), 7);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(8, 9, to_date('22.03.1989', 'dd.mm.yyyy'), 4);

-- Alitalia
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(9, 4, to_date('04.09.1996', 'dd.mm.yyyy'), 3);
INSERT INTO A_Aircrafts (Airline_id, AircraftType_id, StartUsingDate, Quantity) VALUES(9, 10, to_date('08.10.1994', 'dd.mm.yyyy'), 5);

-- A_RouteTypes
INSERT INTO A_RouteTypes (Type_id, N_Name) VALUES(1, 'I');
INSERT INTO A_RouteTypes (Type_id, N_Name) VALUES(2, 'N');
INSERT INTO A_RouteTypes (Type_id, N_Name) VALUES(3, 'R');

------------
-- A_Routes --
------------

-- Атлант-Союз
-- Москва-Нью Йорк
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(1, 2, 11, 8.5, 7500, to_date('23:00', 'hh24:mi'), 22500, 32000, 2, 1, 1, 1);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(2, 11, 2, 8.5, 7500, to_date('15:20', 'hh24:mi'), 22600, 32100, 2, 1, 1, 1);

-- Москва-СПб
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(3, 1, 5, 1.5, 630, to_date('10:20', 'hh24:mi'), 12000, 15000, 0, 3, 1, 5);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(4, 5, 1, 1.5, 630, to_date('12:20', 'hh24:mi'), 11900, 14900, 0, 3, 1, 5);

-- Москва-Анталия
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(5, 2, 10, 2.7, 2160, to_date('00:20', 'hh24:mi'), 6200, 9500, 0, 1, 1, 3);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(6, 10, 2, 2.7, 2160, to_date('19:10', 'hh24:mi'), 6100, 9300, 0, 1, 1, 3);

-- Москва-Париж
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(7, 4, 13, 3.1, 2500, to_date('03:10', 'hh24:mi'), 8200, 12500, 1, 1, 1, 4);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(8, 13, 4, 3.1, 2500, to_date('16:30', 'hh24:mi'), 8200, 12500, 1, 1, 1, 4);

-- Москва-Екатеринбург
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(9, 4, 9, 1.7, 1420, to_date('09:41', 'hh24:mi'), 4200, 6500, 0, 2, 1, 5);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(10, 9, 4, 1.7, 1420, to_date('12:12', 'hh24:mi'), 4100, 6700, 0, 2, 1, 5);

-- Домодедовские авиалинии
-- Москва-Спб
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(11, 3, 5, 1.4, 630, to_date('11:21', 'hh24:mi'), 3200, 5500, 0, 3, 2, 5);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(12, 5, 3, 1.4, 630, to_date('22:30', 'hh24:mi'), 3200, 5500, 0, 3, 2, 5);
-- Москва-Минск
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(13, 3, 7, 1.6, 678, to_date('19:10', 'hh24:mi'), 7600, 11500, 0, 1, 2, 1);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(14, 7, 3, 1.6, 678, to_date('11:54', 'hh24:mi'), 7620, 12500, 0, 1, 2, 1);
-- Спб-Минск
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(15, 6, 7, 1.7, 691, to_date('03:12', 'hh24:mi'), 7500, 11400, 0, 1, 2, 1);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(16, 7, 6, 1.7, 691, to_date('17:52', 'hh24:mi'), 7520, 12400, 0, 1, 2, 1);

-- Аэрофлот
-- Москва-Нью Йорк
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(17, 2, 12, 9, 7500, to_date('06:13', 'hh24:mi'), 27500, 41100, 2, 1, 3, 4);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(18, 12, 2, 9.5, 7500, to_date('13:42', 'hh24:mi'), 27700, 41500, 2, 1, 3, 4);
-- Москва-Владивосток
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(19, 2, 8, 8.2, 6430, to_date('16:13', 'hh24:mi'), 17500, 21100, 1, 2, 3, 1);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(20, 8, 2, 8.3, 6430, to_date('23:42', 'hh24:mi'), 17500, 21100, 1, 2, 3, 1);
-- Москва-Франкфурт
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(21, 4, 16, 2.5, 2027, to_date('15:33', 'hh24:mi'), 12500, 15100, 0, 1, 3, 2);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(22, 16, 4, 2.5, 2027, to_date('13:22', 'hh24:mi'), 12100, 15200, 0, 1, 3, 2);
-- Москва-Рим
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(23, 4, 17, 2.7, 2382, to_date('05:31', 'hh24:mi'), 13500, 16100, 0, 1, 3, 1);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(24, 17, 4, 2.8, 2382, to_date('08:32', 'hh24:mi'), 13600, 16000, 0, 1, 3, 1);
-- Москва-Амстердам
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(25, 2, 15, 2.3, 2154, to_date('15:31', 'hh24:mi'), 12500, 15100, 0, 1, 3, 5);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(26, 15, 2, 2.4, 2154, to_date('18:32', 'hh24:mi'), 12500, 15100, 0, 1, 3, 5);
-- Москва-Барселона
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(27, 2, 18, 3.2, 3018, to_date('10:01', 'hh24:mi'), 16200, 19800, 0, 1, 3, 1);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(28, 18, 2, 3.1, 3018, to_date('18:02', 'hh24:mi'), 16100, 19900, 0, 1, 3, 1);
-- Москва-Париж ________________________________________________________
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(29, 4, 13, 2.8, 2500, to_date('03:21', 'hh24:mi'), 14300, 15600, 0, 1, 3, 4);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(30, 13, 4, 2.7, 2500, to_date('18:39', 'hh24:mi'), 14300, 15600, 0, 1, 3, 4);

-- Sky Express
-- Екатеринбург-Владивосток
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(31, 9, 8, 6.3, 5079, to_date('07:18', 'hh24:mi'), 17200, 21300, 1, 2, 4, 5);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(32, 8, 9, 6.2, 5079, to_date('14:32', 'hh24:mi'), 17210, 21000, 1, 2, 4, 5);

-- Delta Air Lines
-- Франкфурт-Нью-Йорк
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(33, 16, 11, 7.7, 6216, to_date('17:58', 'hh24:mi'), 37200, 51300, 0, 1, 6, 7);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(34, 11, 16, 7.9, 6216, to_date('11:12', 'hh24:mi'), 37100, 51200, 0, 1, 6, 7);
-- Париж-Нью-Йорк
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(35, 13, 11, 7.2, 5850, to_date('15:38', 'hh24:mi'), 34200, 48100, 0, 1, 6, 6);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(36, 11, 13, 7.1, 5850, to_date('12:12', 'hh24:mi'), 34100, 48400, 0, 1, 6, 6);
-- Барселона-Нью-Йорк
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(37, 18, 11, 7.6, 6176, to_date('13:28', 'hh24:mi'), 35200, 41700, 0, 1, 6, 2);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(38, 11, 18, 7.5, 6176, to_date('19:12', 'hh24:mi'), 35100, 41800, 0, 1, 6, 2);

-- Lufthansa
-- Москва-Франкфурт
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(39, 2, 16, 2.6, 2026, to_date('11:48', 'hh24:mi'), 15200, 31700, 0, 1, 8, 8);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(40, 16, 2, 2.5, 2026, to_date('09:02', 'hh24:mi'), 15100, 31500, 0, 1, 8, 8);
-- Франкфурт-Рим
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(41, 16, 17, 1.6, 959, to_date('17:18', 'hh24:mi'), 11200, 22700, 0, 1, 8, 9);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(42, 17, 16, 1.5, 959, to_date('18:52', 'hh24:mi'), 11100, 22800, 0, 1, 8, 9);
-- Франкфурт-Барселона
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(43, 16, 18, 1.9, 1093, to_date('15:18', 'hh24:mi'), 10100, 15700, 0, 1, 8, 3);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(44, 18, 16, 1.8, 1093, to_date('09:15', 'hh24:mi'), 10200, 15600, 0, 1, 8, 3);
-- Франкфурт-Амстердам
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(45, 16, 15, 0.3, 364, to_date('11:28', 'hh24:mi'), 5200, 11700, 0, 1, 8, 8);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(46, 15, 16, 0.3, 364, to_date('11:12', 'hh24:mi'), 5200, 11700, 0, 1, 8, 8);
-- Франкфурт-Париж
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(47, 16, 13, 0.4, 479, to_date('03:18', 'hh24:mi'), 8500, 12700, 0, 1, 8, 9);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(48, 13, 16, 0.4, 479, to_date('07:12', 'hh24:mi'), 8500, 12700, 0, 1, 8, 9);

-- Alitalia
-- Москва-Рим
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(49, 2, 17, 2.9, 2382, to_date('08:28', 'hh24:mi'), 15700, 21200, 0, 1, 9, 4);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(50, 17, 2, 3, 2382, to_date('09:12', 'hh24:mi'), 15800, 21100, 0, 1, 9, 4);
-- Рим-Барселона
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(51, 17, 18, 1.3, 860, to_date('08:18', 'hh24:mi'), 17200, 21100, 0, 1, 9, 10);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(52, 18, 17, 1.2, 860, to_date('15:25', 'hh24:mi'), 17100, 21000, 0, 1, 9, 10);
-- Рим-Париж
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(53, 17, 14, 1.7, 1106, to_date('05:58', 'hh24:mi'), 22200, 31500, 0, 1, 9, 10);
INSERT INTO A_Routes (Route_id, AirportFrom_id, AirportTo_id, Duration, Distance, TimeFrom, EconomicPrice, BusinessPrice, C_Changes, RouteType_id, Airline_id, AircraftType_id) VALUES(54, 14, 17, 1.6, 1106, to_date('09:24', 'hh24:mi'), 22100, 31000, 0, 1, 9, 10);


Flight_id INTEGER,
DepartureDate DATE,
ArrivalDate DATE,
ActualBusiness INTEGER,
ActualEconomic INTEGER,
Route_id INTEGER,
Crew_id INTEGER

INSERT INTO A_Flights (Flight_id, DepartureDate, ArrivalDate, ActualBusiness, ActualEconomic, Route_id, Crew_id) VALUES();