USE master;
GO
DROP DATABASE IF EXISTS GraphBank;
GO
CREATE DATABASE GraphBank;
GO
USE GraphBank;
GO

CREATE TABLE [Client] (
	ClientID int IDENTITY(1,1) NOT NULL,
	Name nvarchar(30) NOT NULL,
	Patronymic nvarchar(30),
	Surname nvarchar(30) NOT NULL,
	Telephone nvarchar(20) NOT NULL UNIQUE,
	Address nvarchar(50) NOT NULL,
	Salary money NOT NULL,
	NameOwnership nvarchar(50) NOT NULL,
	OwnershipType nvarchar(50) NOT NULL,
	ContactPerson nvarchar(30) NOT NULL,
  CONSTRAINT [PK_CLIENT] PRIMARY KEY CLUSTERED
  (
  [ClientID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO
CREATE TABLE [Employee] (
	EmployeeID int IDENTITY(1,1) NOT NULL,
	Name nvarchar(30) NOT NULL,
	Patronymic nvarchar(30),
	Surname nvarchar(30) NOT NULL,
	Post nvarchar(50) NOT NULL,
  CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED
  (
  [EmployeeID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO
CREATE TABLE [Loan] (
	LoanID int IDENTITY(1,1) NOT NULL,
	LoanType nvarchar(50) NOT NULL,
	LoanCondition nvarchar(50) NOT NULL,
	LoanRate float NOT NULL,
	ReturnPeriod nvarchar(30) NOT NULL,
  CONSTRAINT [PK_LOAN] PRIMARY KEY CLUSTERED
  (
  [LoanID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO
CREATE TABLE [Bank] (
	BankID int IDENTITY(1,1) NOT NULL,
	BankName nvarchar(50) NOT NULL,
	City nvarchar(50) NOT NULL,
	DateOfFounded date NOT NULL,
  CONSTRAINT [PK_BANK] PRIMARY KEY CLUSTERED
  (
  [BankID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO
CREATE TABLE [City] (
	CityID int IDENTITY(1,1) NOT NULL,
	CityName nvarchar(50) NOT NULL,
	Region nvarchar(50) NOT NULL,
	NumberOfInhabitants int NOT NULL,
  CONSTRAINT [PK_CITY] PRIMARY KEY CLUSTERED
  (
  [CityID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

) AS Node
GO

CREATE TABLE LivesIn AS EDGE;

CREATE TABLE WorkIn AS EDGE;

CREATE TABLE Signs AS EDGE;

CREATE TABLE Formalize AS EDGE;

CREATE TABLE Сooperates AS EDGE;

ALTER TABLE LivesIn
ADD CONSTRAINT EC_LivesIn CONNECTION (Client TO City)

ALTER TABLE WorkIn
ADD CONSTRAINT EC_WorkIn CONNECTION (Employee TO Bank)

ALTER TABLE Signs
ADD CONSTRAINT EC_Signs CONNECTION (Client TO Loan)

ALTER TABLE Formalize
ADD CONSTRAINT EC_Formalize CONNECTION (Employee TO Loan)

ALTER TABLE Сooperates
ADD CONSTRAINT EC_Сooperates CONNECTION (Bank TO Bank)

Insert into Client(Name,Patronymic, Surname, Telephone, Address, Salary, NameOwnership,OwnershipType, ContactPerson)
Values ('Полина', 'Ильинична', 'Горшкова','+375(44)245-27-87', 'Пушкинский Пр., дом 38, кв. 48', 1450, 'Ресторан "Четыре сезона"','Коммерческая недвижимость', 'Широкова К.К.'),
( 'Елизавета', 'Михайловна', 'Гришина','+375(33)220-95-58', 'Пономарева Ул., дом 3, кв. 63', 1000, 'Фабрика "Текстиль"','Производственная собственность', 'Емельянов А.Б.' ),
('Виктор', 'Александрович', 'Родионов','+375(29)555-93-03', 'Лесной Пос., дом 6, кв. 64', 2450, 'Школа искусств "Мастерская"','Коммерческая недвижимость', 'Широкова Д.Ф.' ),
('Арина', 'Леонидовна', 'Широкова','+375(44)131-07-88', 'Королева Ул., дом 33, кв. 75', 600, 'Кофейня "Espresso"','Коммерческая недвижимость', 'Гришина В.П.' ),
('Сергей', 'Арсеньевич', 'Новиков','+375(29)342-96-96', 'Фроленкова Ул., дом 54, кв. 51', 567, 'Книжный магазин "Книги"','Коммерческая недвижимость', 'Емельянов И.Н.' ),
('Мирон', 'Сергеевич', 'Русанов','+375(44)163-46-48', 'Козлова Ул., дом 31, кв. 153', 5000, 'Музыкальный лейбл "Мелодия"','Коммерческая недвижимость', 'Ширяев Е.Н.' ),
('Лев', 'Андреевич', 'Козырев','+375(29)220-00-79', 'Нежнова Ул., дом 6, кв. 109', 666, 'Театр "Драма"','Коммерческая недвижимость', 'Гришина Н.А.' ),
('Станислав', 'Даниилович', 'Волков','+375(29)563-37-06', 'Нежнова Ул., дом 6, кв. 107', 1340, 'Завод "Прогресс"','Коммерческая недвижимость', 'Ширяева Е.У.' ),
('Виктория','Александровна', 'Быкова','+375(44)258-60-01', 'Кошевого Ул., дом 101', 1486, 'Квартира','Недвижимость', 'Емельянов Е.М.' ),
('Валерия', 'Алиевна', 'Антонова','+375(33)201-60-75 ', 'Кошевого Ул., дом 72', 900, 'Торговый центр "Мегаполис"','Коммерческая недвижимость', 'Ширяев Е.Н.' ),
('Кирилл', 'Платонович', 'Емельянов','+375(29)274-44-70', 'Ульяновская Ул., дом 49, кв. 52', 2020, 'Заводское оборудование "СТАН"','Производственное имущество', 'Гришина Е.М.' ),
('Александра', 'Ивановна', 'Горюнова','+375(33)252-73-70', 'Ульяновская Ул., дом 49, кв. 71', 456, 'Земельный участок под строительство','Коммерческая недвижимость', 'Мороз У.К.' ),
('Милана', 'Львович', 'Попова','+375(44)223-15-20', 'Шмидта Пр., дом 48, кв. 46', 1111, 'Спортивный комплекс "Олимп"','Коммерческая недвижимость', 'Морозова Е.М.' ),
('Леонид', 'Артёмович', 'Ширяев','+375(44)552-44-82', 'Орловского Ул., дом 14, кв. 88', 2340, 'Ресторан "Итальянское настроение"','Коммерческая собственность', 'Васильев А.А.' ),
('Дмитрий', 'Маркович', 'Федотов','+375(44)333-36-75', 'Орловского Ул., дом 14, кв. 76', 2569, 'Супермаркет "Магнит"','Коммерческая собственность', 'Морозов У.В.' ),
('Варвара', 'Константиновна', 'Морозова','+375(29)173-16-05', 'Зыгина Ул., дом 2/А', 3000, 'Лесной массив "Березовая роща"','Коммерческая недвижимость', 'Васильев К.И.' ),
('Илья', 'Артёмович', 'Васильев','+375(33)228-97-33', 'Народная Ул., дом 14, кв. 75', 2395, 'Теннисный клуб "Спортмастер"','Коммерческая собственность', 'Морозова Е.К.' )

SELECT *
FROM Client

Insert into Employee(Name, Patronymic, Surname, Post)
values('Анастасия', 'Сергеевна', 'Степанова', 'Менеджер по работе с клиентами'),
('Сергей ', 'Даниилович', 'Павлов', 'Старший менеджер по кредитованию'),
('Артём', 'Семёнович', 'Филатов', 'Кредитный менеджер'),
('Константин', 'Львович', 'Вдовин', 'Старший менеджер по кредитованию'),
('Мирослава', 'Андреевна', 'Одинцова', 'Специалист по ипотечному кредитованию'),
('Вячеслав', 'Дмитриевич', 'Одинцов', 'Старший менеджер по кредитованию'),
('Мирослав', 'Петрович', 'Васильев', 'Кредитный менеджер'),
('Евгений', 'Александрович', 'Петров', 'Старший менеджер по кредитованию'),
('Михаил', 'Витальевич', 'Болда', 'Специалист по ипотечному кредитованию'),
('Екатерина', 'Витальевна', 'Заяц', 'Кредитный менеджер')

select*
from Employee

insert into Loan(LoanType, LoanCondition, LoanRate, ReturnPeriod)
values('Целевой','Стандартные', 18.55 , '7 лет'),
('Нецелевой','Стандартные', 12.3, '3 года'),
('Автокредит','Льготные', 16.31 , '5 лет'),
('Ипотечный','Льготные', 15.3 , '20 лет'),
('На строительство','Льготные', 17.25 , '14 лет'),
('Социальный','Стандартные', 12.45 , '11 лет'),
('На повседневные нужды','Стандартные', 13.32 , '3 года'),
('На развитие бизнеса','Стандартные', 17.32 , '4 года'),
('Долгосрочный','Льготные', 14.15 , '10 лет'),
('Краткосрочный','Стандартные', 12.32 , '3 года')

select*
from Loan

INSERT INTO City(CityName, Region, NumberOfInhabitants)
VALUES('Минск', 'Минская область', 1996553),
('Гомель', 'Гомельский область', 503984),
('Гродно', 'Гродненская область', 357493),
('Брест', 'Брестская область', 340753),
('Могилев', 'Могилёвская область', 355436),
('Витебск', 'Витебская область', 360419),
('Полоцк', 'Витебская область', 79896),
('Борисов', 'Минская область', 137703),
('Бобруйск', 'Могилёвская область', 209675),
('Солигорск', 'Минская область', 99622)

select*
from City

insert into Bank(BankName, City, DateOfFounded)
VALUES('"Приорбанк" ОАО', (SELECT CityName FROM City WHERE CityID = 1), '1988-11-21'),
('АСБ "Беларусбанк"', (SELECT CityName FROM City WHERE CityID = 2), '1922-10-20'),
('ОАО "Белагропромбанк"', (SELECT CityName FROM City WHERE CityID = 3), '1990-04-01'),
('ОАО "Белинвестбанк"', (SELECT CityName FROM City WHERE CityID = 4), '2001-09-03'),
('ОАО "Белорусский народный банк"', (SELECT CityName FROM City WHERE CityID = 5), '1991-09-01'),
('ЗАО "Минский транзитный банк"', (SELECT CityName FROM City WHERE CityID = 6), '1994-03-14'),
('ОАО "Паритетбанк"', (SELECT CityName FROM City WHERE CityID = 7), '1991-01-18'),
('ОАО "Технобанк"', (SELECT CityName FROM City WHERE CityID = 8), '1994-08-05'),
('ОАО "Белвнешэкономбанк"', (SELECT CityName FROM City WHERE CityID = 9), '1991-12-12'),
('ОАО "СберБанк"', (SELECT CityName FROM City WHERE CityID = 10), '1991-12-28')

SELECT*
FROM Bank

--Живёт в
INSERT INTO LivesIn($from_id, $to_id)
VALUES((SELECT $node_id FROM Client WHERE ClientID = 1), (SELECT $node_id FROM City WHERE CityID = 1)),--Полина и Минск
	  ((SELECT $node_id FROM Client WHERE ClientID = 2), (SELECT $node_id FROM City WHERE CityID = 1)),-- Елизавета и Минск
	  ((SELECT $node_id FROM Client WHERE ClientID = 3), (SELECT $node_id FROM City WHERE CityID = 2)),-- Виктор и Гомель
	  ((SELECT $node_id FROM Client WHERE ClientID = 4), (SELECT $node_id FROM City WHERE CityID = 2)),--Арина и Гомель
	  ((SELECT $node_id FROM Client WHERE ClientID = 5), (SELECT $node_id FROM City WHERE CityID = 3)),--Сергей и Гродно
	  ((SELECT $node_id FROM Client WHERE ClientID = 6), (SELECT $node_id FROM City WHERE CityID = 4)),--Мирон и Брест
	  ((SELECT $node_id FROM Client WHERE ClientID = 7), (SELECT $node_id FROM City WHERE CityID = 5)),--Лев и Могилёв
	  ((SELECT $node_id FROM Client WHERE ClientID = 8), (SELECT $node_id FROM City WHERE CityID = 5)),--Станислав и Могилёв
	  ((SELECT $node_id FROM Client WHERE ClientID = 9), (SELECT $node_id FROM City WHERE CityID = 6)),--Виктория и Витебск
	  ((SELECT $node_id FROM Client WHERE ClientID = 10), (SELECT $node_id FROM City WHERE CityID = 7)),--Валерия и Полоцк
	  ((SELECT $node_id FROM Client WHERE ClientID = 11), (SELECT $node_id FROM City WHERE CityID = 7)),--Кирилл и Полоцк
	  ((SELECT $node_id FROM Client WHERE ClientID = 12), (SELECT $node_id FROM City WHERE CityID = 8)),--Александра и Борисов
	  ((SELECT $node_id FROM Client WHERE ClientID = 13), (SELECT $node_id FROM City WHERE CityID = 8)),--Милана и Борисов
	  ((SELECT $node_id FROM Client WHERE ClientID = 14), (SELECT $node_id FROM City WHERE CityID = 9)),--Леонид и Бобруйск
	  ((SELECT $node_id FROM Client WHERE ClientID = 15), (SELECT $node_id FROM City WHERE CityID = 9)),--Дмитрий и Бобруйск
	  ((SELECT $node_id FROM Client WHERE ClientID = 16), (SELECT $node_id FROM City WHERE CityID = 10)),-- Варвара и Солигорск
	  ((SELECT $node_id FROM Client WHERE ClientID = 17), (SELECT $node_id FROM City WHERE CityID = 10))-- Илья и Солигорск

SELECT*
FROM LivesIn

--Работает в
INSERT INTO WorkIn($from_id, $to_id)
VALUES 
((SELECT $node_id FROM Employee WHERE EmployeeID = 1), (SELECT $node_id FROM Bank WHERE BankID = 1)),--Анастасия и Приорбанк
((SELECT $node_id FROM Employee WHERE EmployeeID = 2), (SELECT $node_id FROM Bank WHERE BankID = 2)),--Сергей и Беларусбанк
((SELECT $node_id FROM Employee WHERE EmployeeID = 3), (SELECT $node_id FROM Bank WHERE BankID = 3)),--Артём и Белагромпромбанк
((SELECT $node_id FROM Employee WHERE EmployeeID = 4), (SELECT $node_id FROM Bank WHERE BankID = 4)),--Константин и Белинвестбанк
((SELECT $node_id FROM Employee WHERE EmployeeID = 5), (SELECT $node_id FROM Bank WHERE BankID = 5)),--Мирослава и Белорусский народный банк
((SELECT $node_id FROM Employee WHERE EmployeeID = 6), (SELECT $node_id FROM Bank WHERE BankID = 6)),--Вячеслав и Минский транзитный банк
((SELECT $node_id FROM Employee WHERE EmployeeID = 7), (SELECT $node_id FROM Bank WHERE BankID = 7)),--Мирослав и Паритетбанк
((SELECT $node_id FROM Employee WHERE EmployeeID = 8), (SELECT $node_id FROM Bank WHERE BankID = 8)),--Евгений и Технобанк
((SELECT $node_id FROM Employee WHERE EmployeeID = 9), (SELECT $node_id FROM Bank WHERE BankID = 9)),--Михаил и Белвнешэкономбанк
((SELECT $node_id FROM Employee WHERE EmployeeID = 10), (SELECT $node_id FROM Bank WHERE BankID = 10))--Екатерина и СберБанк

SELECT*
FROM WorkIn

--Подписывает
INSERT INTO Signs($from_id, $to_id)
VALUES
((SELECT $node_id FROM Client WHERE ClientID = 1),(SELECT $node_id FROM Loan WHERE LoanID = 1)),--Полина и Целевой
((SELECT $node_id FROM Client WHERE ClientID = 2),(SELECT $node_id FROM Loan WHERE LoanID = 1)),--Елизавета и Целевой
((SELECT $node_id FROM Client WHERE ClientID = 3),(SELECT $node_id FROM Loan WHERE LoanID = 2)),--Виктор и Нецелевой
((SELECT $node_id FROM Client WHERE ClientID = 4),(SELECT $node_id FROM Loan WHERE LoanID = 2)),--Арина и Нецелевой
((SELECT $node_id FROM Client WHERE ClientID = 5),(SELECT $node_id FROM Loan WHERE LoanID = 3)),--Сергей и Автокредит
((SELECT $node_id FROM Client WHERE ClientID = 6),(SELECT $node_id FROM Loan WHERE LoanID = 3)),--Мирон и Автокредит
((SELECT $node_id FROM Client WHERE ClientID = 7),(SELECT $node_id FROM Loan WHERE LoanID = 4)),--Лев и Ипотечный
((SELECT $node_id FROM Client WHERE ClientID = 8),(SELECT $node_id FROM Loan WHERE LoanID = 4)),--Станислав и Ипотечный
((SELECT $node_id FROM Client WHERE ClientID = 9),(SELECT $node_id FROM Loan WHERE LoanID = 5)),--Виктория и На строительство
((SELECT $node_id FROM Client WHERE ClientID = 10),(SELECT $node_id FROM Loan WHERE LoanID = 5)),--Валерия и на строительство
((SELECT $node_id FROM Client WHERE ClientID = 11),(SELECT $node_id FROM Loan WHERE LoanID = 6)),--Кирилл и Социальный
((SELECT $node_id FROM Client WHERE ClientID = 12),(SELECT $node_id FROM Loan WHERE LoanID = 7)),--Александра и На повседневные нужды
((SELECT $node_id FROM Client WHERE ClientID = 13),(SELECT $node_id FROM Loan WHERE LoanID = 8)),--Милана и На развитие бизнеса
((SELECT $node_id FROM Client WHERE ClientID = 14),(SELECT $node_id FROM Loan WHERE LoanID = 9)),--Леонид и Долгосрочный
((SELECT $node_id FROM Client WHERE ClientID = 15),(SELECT $node_id FROM Loan WHERE LoanID = 9)),--Дмитрий и Долгосрочный
((SELECT $node_id FROM Client WHERE ClientID = 16),(SELECT $node_id FROM Loan WHERE LoanID = 10)),--Варвара и Краткострочный
((SELECT $node_id FROM Client WHERE ClientID = 17),(SELECT $node_id FROM Loan WHERE LoanID = 10))--Илья и Краткострочный 

SELECT*
FROM Signs

--Оформляет
INSERT INTO Formalize($from_id, $to_id)
VALUES
((SELECT $node_id FROM Employee WHERE EmployeeID = 1),(SELECT $node_id FROM Loan WHERE LoanID = 1)),--Анастасия и Целевой
((SELECT $node_id FROM Employee WHERE EmployeeID = 2),(SELECT $node_id FROM Loan WHERE LoanID = 2)),--Сергей и Нецелевой
((SELECT $node_id FROM Employee WHERE EmployeeID = 3),(SELECT $node_id FROM Loan WHERE LoanID = 3)),--Артём и Автокредит
((SELECT $node_id FROM Employee WHERE EmployeeID = 4),(SELECT $node_id FROM Loan WHERE LoanID = 4)),--Константин и Ипотечный
((SELECT $node_id FROM Employee WHERE EmployeeID = 5),(SELECT $node_id FROM Loan WHERE LoanID = 5)),--Мирослава и На строительство
((SELECT $node_id FROM Employee WHERE EmployeeID = 6),(SELECT $node_id FROM Loan WHERE LoanID = 6)),--Вячеслав и Социальный
((SELECT $node_id FROM Employee WHERE EmployeeID = 7),(SELECT $node_id FROM Loan WHERE LoanID = 7)),--Мирослав и На повседневные нужды
((SELECT $node_id FROM Employee WHERE EmployeeID = 8),(SELECT $node_id FROM Loan WHERE LoanID = 8)),--Евгений и На развитие бизнеса
((SELECT $node_id FROM Employee WHERE EmployeeID = 9),(SELECT $node_id FROM Loan WHERE LoanID = 9)),--Михаил и Долгосроный
((SELECT $node_id FROM Employee WHERE EmployeeID = 10),(SELECT $node_id FROM Loan WHERE LoanID = 10))--Екатерина и Краткосрочный

SELECT*
FROM Formalize

SELECT*
FROM Bank

INSERT INTO Сooperates($from_id, $to_id)
VALUES
((SELECT $node_id FROM Bank WHERE BankID = 1), (SELECT $node_id FROM Bank WHERE BankID = 2)),--"Приорбанк" ОАО и АСБ "Беларусбанк"
((SELECT $node_id FROM Bank WHERE BankID = 1), (SELECT $node_id FROM Bank WHERE BankID = 3)),--"Приорбанк" ОАО и ОАО "Белагропромбанк"
((SELECT $node_id FROM Bank WHERE BankID = 2), (SELECT $node_id FROM Bank WHERE BankID = 3)),--АСБ "Беларусбанк" и ОАО "Белагропромбанк"
((SELECT $node_id FROM Bank WHERE BankID = 3), (SELECT $node_id FROM Bank WHERE BankID = 5)),--ОАО "Белагропромбанк" и ОАО "Белорусский народный банк"
((SELECT $node_id FROM Bank WHERE BankID = 6), (SELECT $node_id FROM Bank WHERE BankID = 7)),--ЗАО "Минский транзитный банк" и ОАО "Паритетбанк"
((SELECT $node_id FROM Bank WHERE BankID = 5), (SELECT $node_id FROM Bank WHERE BankID = 1)),--ОАО "Белорусский народный банк" и "Приорбанк" ОАО
((SELECT $node_id FROM Bank WHERE BankID = 3), (SELECT $node_id FROM Bank WHERE BankID = 8)),--ОАО "Белагропромбанк" и ОАО "Технобанк"
((SELECT $node_id FROM Bank WHERE BankID = 7), (SELECT $node_id FROM Bank WHERE BankID = 9)),--ОАО "Паритетбанк" и ОАО "Белвнешэкономбанк"
((SELECT $node_id FROM Bank WHERE BankID = 10), (SELECT $node_id FROM Bank WHERE BankID = 2)),--ОАО "СберБанк" и АСБ "Беларусбанк"
((SELECT $node_id FROM Bank WHERE BankID = 10), (SELECT $node_id FROM Bank WHERE BankID = 6)),--ОАО "СберБанк" и ОАО "Белагропромбанк"
((SELECT $node_id FROM Bank WHERE BankID = 4), (SELECT $node_id FROM Bank WHERE BankID = 10)),--ОАО "Белинвестбанк" и 
((SELECT $node_id FROM Bank WHERE BankID = 9), (SELECT $node_id FROM Bank WHERE BankID = 6)),--ОАО "Белвнешэкономбанк" и ЗАО "Минский транзитный банк"
((SELECT $node_id FROM Bank WHERE BankID = 9), (SELECT $node_id FROM Bank WHERE BankID = 8))--ОАО "Белвнешэкономбанк" и ОАО "Технобанк"

SELECT*
FROM Сooperates

---------------------ЗАПРОСЫ MATCH-------------------
SELECT  Client.Name,
		City.CityName 
FROM	Client,
		LivesIn,
		City
WHERE MATCH(Client-(LivesIn)->City)
AND City.CityName = 'Минск'

SELECT Client.Name,
       Loan.LoanType
FROM Client,
	 Signs,
	 Loan
WHERE MATCH(Client-(Signs)->Loan)
AND Loan.LoanType = 'Автокредит'

SELECT Employee.Name,
       Loan.LoanType
FROM Employee,
	 Formalize,
	 Loan
WHERE MATCH(Employee-(Formalize)->Loan)
AND Loan.LoanType = 'Ипотечный'

SELECT Employee.Name,
       Bank.BankName
FROM Employee,
WorkIn,
Bank
WHERE MATCH(Employee-(WorkIn)->Bank)
AND Bank.BankName = 'ОАО "Паритетбанк"'

SELECT Bank1.BankName,
Bank2.BankName as CooperateBank
FROM Bank AS Bank1
, Сooperates
, Bank as Bank2
WHERE MATCH(Bank1-(Сooperates)->Bank2)
AND Bank1.BankName = 'ОАО "Паритетбанк"'

--String_agg - разделитель, чтобы красиво было
SELECT Bank1.BankName,
STRING_AGG(Bank2.BankName, '->') WITHIN GROUP (GRAPH PATH) AS Cooperates
FROM Bank as Bank1
, Сooperates FOR PATH AS co--FOR PATH всегда пишем, когда будет использоваться таблица
, Bank FOR PATH AS Bank2
WHERE MATCH(SHORTEST_PATH(Bank1(-(co)->Bank2){1,2}))-- {1,n} пишем когда нужно найти пути до 2 шагов
AND Bank1.BankName = 'ОАО "Паритетбанк"'
--Shortest_Path - указывает кратчайший путь между узлами

SELECT Bank1.BankName,
LAST_VALUE(Bank2.BankName) WITHIN GROUP (GRAPH PATH) AS LastNode,
COUNT(Bank2.BankName) WITHIN GROUP (GRAPH PATH) as Steps
FROM Bank as Bank1
, Сooperates FOR PATH AS co--FOR PATH всегда пишем, когда будет использоваться таблица
, Bank FOR PATH AS Bank2
WHERE MATCH(SHORTEST_PATH(Bank1(-(co)->Bank2)+))-- + пишем когда просто нужно найти все пути максимальной длины
AND Bank1.BankName = 'ОАО "Паритетбанк"'

SELECT @@SERVERNAME

-- Запрос для таблицы "LivesIn"
SELECT C.ClientID AS IdClient
    , CONCAT(C.Name, ' ', C.Surname) AS Client
    , CONCAT(N'Client',C.ClientID) AS [Client Image Name]
    , CT.CityID AS IdCity
    , CT.CityName AS City
    , CONCAT(N'City',CT.CityID) AS [City Image Name]
FROM Client AS C
    , LivesIn AS L
    , City AS CT
WHERE MATCH(C-(L)->CT)

-- Запрос для таблицы "WorkIn"
SELECT E.EmployeeID AS IdEmployee
    , CONCAT(E.Name, ' ', E.Surname) AS Employee
    , CONCAT(N'Employee',E.EmployeeID) AS [Employee Image Name]
    , B.BankID AS IdBank
    , B.BankName AS Bank
    , CONCAT(N'Bank',B.BankID) AS [Bank Image Name]
FROM Employee AS E
    , WorkIn AS W
    , Bank AS B
WHERE MATCH(E-(W)->B)

-- Запрос для таблицы "Signs"
SELECT C.ClientID AS IdClient
    , CONCAT(C.Name, ' ', C.Surname) AS Client
    , CONCAT(N'Client',C.ClientID) AS [Client Image Name]
    , L.LoanID AS IdLoan
    , L.LoanType AS Loan
    , CONCAT(N'Loan',L.LoanID) AS [Loan Image Name]
FROM Client AS C
    , Signs AS S
    , Loan AS L
WHERE MATCH(C-(S)->L)

-- Запрос для таблицы "Formalize"
SELECT E.EmployeeID AS IdEmployee
    , CONCAT(E.Name, ' ', E.Surname) AS Employee
    , CONCAT(N'Employee',E.EmployeeID) AS [Employee Image Name]
    , L.LoanID AS IdLoan
    , L.LoanType AS Loan
    , CONCAT(N'Loan',L.LoanID) AS [Loan Image Name]
FROM Employee AS E
    , Formalize AS F
    , Loan AS L
WHERE MATCH(E-(F)->L)

-- Запрос для таблицы "Сooperates"
SELECT B1.BankID AS IdFirst
    , B1.BankName AS First
    , CONCAT(N'Cooperates', B1.BankID) AS [First Image Name]
    , B2.BankID AS IdSecond
    , B2.BankName AS Second
    , CONCAT(N'Cooperates', B2.BankID) AS [Second Image Name]
FROM Bank AS B1
    , Сooperates AS C
    , Bank AS B2
WHERE MATCH(B1-(C)->B2)
