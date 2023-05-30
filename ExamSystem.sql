Create Database ExamSystem
Drop Table ExamSystem
Use ExamSystem

Create Table Account(
	AccountID Int IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
	UserName VARCHAR(50),
	[Password] VARCHAR(50),
	Phone VARCHAR(20),
	Email VARCHAR(50),
	DOB VARCHAR(50),
	[Role] Int
)

Create Table CollectionDetail(
	CollectionDetailID Int IDENTITY(1,1) PRIMARY KEY,
	[Name] NVARCHAR(50),
	[Owner] Int References Account(AccountID)
)

Create Table Question(
	QuestionID Int IDENTITY(1,1) PRIMARY KEY,
	Detail NVarchar(Max),
	AnswerA NVarchar(Max),
	AnswerB NVarchar(Max),
	AnswerC NVarchar(Max),
	AnswerD NVarchar(Max),
	TrueAnswer Varchar(10)
)

Create Table [Collection](	
	CollectionDetailID Int References CollectionDetail(CollectionDetailID),
	QuestionID Int References Question(QuestionID),	
	Primary Key (CollectionDetailID, QuestionID)
)

Create Table Exam(
	ExamID Int IDENTITY(1,1) PRIMARY KEY,
	[Name] NVarchar(50),
	TimeLimit int,
	[Date] Varchar(50),	
	[Owner] Int References Account(AccountID),
	CollectionDetailID Int References CollectionDetail(CollectionDetailID)
)


Create Table Enrollment(	
	AccountID Int References Account(AccountID),
	ExamID Int References Exam(ExamID),
	Primary Key(AccountID, ExamID)
)

Create Table Result(
	ResultId Int IDENTITY(1,1) PRIMARY KEY,
	AccountID Int References Account(AccountID),
	ExamID Int References Exam(ExamID),
	Score Int,
	[Rank] NVarchar(50) 
)







---------------------------------------------------------------------------------------------
									-- Table: Account
INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])
VALUES ('Thinh', 'Quoc', 'thinhquoc', '123456789', '1234567890', 'quocthinh1992002@gmail.com', '2002-09-19', 0);

INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])
VALUES ('Michael', 'Johnson', 'mjohnson', 'mikepass', '5551234567', 'mjohnson@example.com', '1992-09-21', 1);

INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])
VALUES ('Emily', 'Wilson', 'emwilson', 'emilypass', '1112223333', 'emwilson@example.com', '1998-07-07', 2);



INSERT INTO CollectionDetail ([Name], [Owner])
VALUES ('World history', 1);

INSERT INTO CollectionDetail ([Name], [Owner])
VALUES ('Animal quizz', 1);

INSERT INTO CollectionDetail ([Name], [Owner])
VALUES (N'Địa lý Việt Nam', 2);


INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Who is credited with discovering America?', 'Christopher Columbus', 'Marco Polo', 'Vasco da Gama', 'Amerigo Vespucci', 'a');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Which ancient civilization built the Great Wall of China?', 'Ancient Egyptians', 'Mayans', 'Romans', 'Chinese', 'd');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Which war was fought between the North and the South regions of the United States?', 'World War I', 'Civil War', 'World War II', 'Revolutionary War', 'b');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Who was the first President of the United States?', 'George Washington', 'Thomas Jefferson', 'Abraham Lincoln', 'John Adams', 'a');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Which European country colonized a significant part of Africa during the era of imperialism?', 'France', 'Germany', 'Spain', 'Italy', 'a');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Who was the leader of the Soviet Union during World War II?', 'Joseph Stalin', 'Vladimir Lenin', 'Nikita Khrushchev', 'Mikhail Gorbachev', 'a');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Which city was the capital of the Roman Empire?', 'Athens', 'Rome', 'Alexandria', 'Constantinople', 'b');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Who wrote the "I Have a Dream" speech?', 'Martin Luther King Jr.', 'Abraham Lincoln', 'Nelson Mandela', 'Winston Churchill', 'a');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Which document outlined the principles and grievances of the American colonists against British rule?', 'Declaration of Independence', 'Constitution', 'Bill of Rights', 'Articles of Confederation', 'a');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Which European explorer reached India by sea, establishing direct trade routes?', 'Vasco da Gama', 'Christopher Columbus', 'Ferdinand Magellan', 'James Cook', 'a');

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)
VALUES ('Who was the first woman to win a Nobel Prize and the only person to win Nobel Prizes in two different scientific fields?', 'Marie Curie', 'Rosalind Franklin', 'Ada Lovelace', 'Jane Goodall', 'a');
