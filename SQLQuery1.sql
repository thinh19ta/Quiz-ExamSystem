Create Database System
Drop Database System
Use System

Create Table Account(
	AccountID Int IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
	UserName VARCHAR(50),
	Password VARCHAR(50),
	Phone VARCHAR(20),
	Email VARCHAR(50),
	DOB VARCHAR(50),
	Role Int
)

Create Table Collection(
	CollectionID Int IDENTITY(1,1) PRIMARY KEY,
	AccountID Int References Account(AccountID),
	Name NVARCHAR(50),
	NumberOfQuestion Int	
)

Create Table Exam(
	ExamID Int IDENTITY(1,1) PRIMARY KEY,
	Name NVarchar(50),
	TimeLimit int,
	Date Varchar(50),
	NumberOfQuestion Int,
	AccountID Int References Account(AccountID),
	CollectionID Int References Collection(CollectionID)
)


Create Table Enrollment(
	EnrollmentId Int IDENTITY(1,1) PRIMARY KEY,
	AccountID Int References Account(AccountID),
	ExamID Int References Exam(ExamID)
)

Create Table Result(
	ResultId Int IDENTITY(1,1) PRIMARY KEY,
	AccountID Int References Account(AccountID),
	ExamID Int References Exam(ExamID),
	Score Int,
	[Rank] NVarchar(50) 
)

Create Table Question(
	QuestionID Int IDENTITY(1,1) PRIMARY KEY,
	Detail NVarchar(Max),
	AnswerA NVarchar(Max),
	AnswerB NVarchar(Max),
	AnswerC NVarchar(Max),
	AnswerD NVarchar(Max),
	TrueAnswer Varchar(10),
	CollectionID Int References Collection(CollectionID)
)





---------------------------------------------------------------------------------------------
									-- Table: Account


									-- Role 0 As Admin
INSERT INTO Account (FirstName, LastName, UserName, Password, Phone, Email, DOB, Role)
VALUES ('Thinh', 'Ta', 'thinhta', '199202', '1234567890', 'qtatquoc@gmail.com', '2002-09-19', 0);
									-- Role 1 As Teacher
INSERT INTO Account (FirstName, LastName, UserName, Password, Phone, Email, DOB, Role)
VALUES ('Jane', 'Smith', 'janesmith', 'pass456', '9876543210', 'janesmith@example.com', '1985-05-15', 1);

INSERT INTO Account (FirstName, LastName, UserName, Password, Phone, Email, DOB, Role)
VALUES ('Mike', 'Johnson', 'mikejohn', 'pass789', '5678901234', 'mikejohn@example.com', '1995-09-10', 1);
									-- Role 1 As Student
INSERT INTO Account (FirstName, LastName, UserName, Password, Phone, Email, DOB, Role)
VALUES ('Emily', 'Brown', 'emilyb', 'pass1234', '6789012345', 'emilybrown@example.com', '1992-07-20', 2);

INSERT INTO Account (FirstName, LastName, UserName, Password, Phone, Email, DOB, Role)
VALUES ('David', 'Wilson', 'davidw', 'pass5678', '7890123456', 'davidwilson@example.com', '1988-03-05', 2);

									-- Table: Collection
INSERT INTO Collection (AccountID, Name, NumberOfQuestion)
VALUES (2, 'History', 20);

INSERT INTO Collection (AccountID, Name, NumberOfQuestion)
VALUES (2, 'Geography', 20);

INSERT INTO Collection (AccountID, Name, NumberOfQuestion)
VALUES (3, 'Software', 20);

INSERT INTO Collection (AccountID, Name, NumberOfQuestion)
VALUES (3, 'English', 20);

INSERT INTO Collection (AccountID, Name, NumberOfQuestion)
VALUES (3, 'Math', 20);


									-- Table: Exam
INSERT INTO Exam (Name, TimeLimit, Date, NumberOfQuestion, AccountID, CollectionID)
VALUES ('Midterm Exam', 120, '2023-06-15', 50, 2, 1);

INSERT INTO Exam (Name, TimeLimit, Date, NumberOfQuestion, AccountID, CollectionID)
VALUES ('Final Exam', 180, '2023-12-20', 100, 2, 2);

INSERT INTO Exam (Name, TimeLimit, Date, NumberOfQuestion, AccountID, CollectionID)
VALUES ('Practice Test', 90, '2023-09-30', 70, 3, 3);



									-- Table: Enrollment
INSERT INTO Enrollment (AccountID, ExamID)
VALUES (2, 1);

INSERT INTO Enrollment (AccountID, ExamID)
VALUES (3, 1);

INSERT INTO Enrollment (AccountID, ExamID)
VALUES (2, 2);

INSERT INTO Enrollment (AccountID, ExamID)
VALUES (3, 2);

INSERT INTO Enrollment (AccountID, ExamID)
VALUES (1, 3);


									-- Table: Result
INSERT INTO Result (AccountID, ExamID, Score, [Rank])
VALUES (1, 1, 85, 'A');

INSERT INTO Result (AccountID, ExamID, Score, [Rank])
VALUES (2, 2, 92, 'A+');

INSERT INTO Result (AccountID, ExamID, Score, [Rank])
VALUES (3, 3, 78, 'B');

INSERT INTO Result (AccountID, ExamID, Score, [Rank])
VALUES (4, 4, 90, 'A');

INSERT INTO Result (AccountID, ExamID, Score, [Rank])
VALUES (5, 5, 88, 'B+');


									-- Table: Question
INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Who was the first President of the United States?', N'George Washington', N'Abraham Lincoln', N'Thomas Jefferson', N'John Adams', 'A', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Which ancient civilization built the Great Wall of China?', N'Egyptians', N'Aztecs', N'Romans', N'Chinese', 'D', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Who is credited with discovering America?', N'Christopher Columbus', N'Marco Polo', N'Vasco da Gama', N'Ferdinand Magellan', 'A', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Which war started with the assassination of Archduke Franz Ferdinand?', N'World War I', N'World War II', N'Vietnam War', N'Korean War', 'A', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Who wrote the novel "Pride and Prejudice"?', N'Jane Austen', N'William Shakespeare', N'Emily Brontë', N'F. Scott Fitzgerald', 'A', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Which ancient civilization built the Pyramids of Giza?', N'Mayans', N'Aztecs', N'Incas', N'Egyptians', 'D', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Who was the first person to orbit the Earth?', N'Neil Armstrong', N'Yuri Gagarin', N'Buzz Aldrin', N'Alan Shepard', 'B', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What event marked the beginning of World War II?', N'Attack on Pearl Harbor', N'Atomic bombings of Hiroshima and Nagasaki', N'Invasion of Poland', N'Battle of Stalingrad', 'C', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Who painted the Mona Lisa?', N'Leonardo da Vinci', N'Michelangelo', N'Vincent van Gogh', N'Pablo Picasso', 'A', 1);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Which civilization is credited with inventing democracy?', N'Romans', N'Egyptians', N'Greeks', N'Mayans', 'C', 1);


INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Thủ đô của Việt Nam là thành phố nào?', N'Hà Nội', N'Hồ Chí Minh', N'Đà Nẵng', N'Huế', 'A', 2);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Dải hẹp đất liền bên bờ biển Việt Nam gọi là gì?', N'Đồng bằng', N'Rừng núi', N'Biển đảo', N'Đồng bộ', 'A', 2);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Núi cao nhất ở Việt Nam là núi nào?', N'Núi Bà Đen', N'Núi Hòn Bà', N'Núi Fansipan', N'Núi Lang Biang', 'C', 2);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Sông dài nhất Việt Nam là sông nào?', N'Sông Mê Kông', N'Sông Đồng Nai', N'Sông Sài Gòn', N'Sông Hồng', 'A', 2);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Vịnh Hạ Long thuộc tỉnh nào của Việt Nam?', N'Quảng Ninh', N'Thái Bình', N'Hải Phòng', N'Ninh Bình', 'A', 2);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Quốc gia nào nằm ở phía Tây Bắc của Việt Nam?', N'Lào', N'Campuchia', N'Trung Quốc', N'Thái Lan', 'A', 2);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Biển nào ở Việt Nam có diện tích lớn nhất?', N'Biển Đông', N'Biển Bắc Bộ', N'Biển Nam Trung Bộ', N'Biển Hồ Chí Minh', 'A', 2);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Hồ nước lợ là hồ nước có nguồn gốc từ đâu?', N'Sông', N'Mưa', N'Biển', N'Suối', 'B', 2);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'Thành phố nào được gọi là "Thủ đô cà phê" của Việt Nam?', N'Đà Lạt', N'Hội An', N'Buôn Ma Thuột', N'Hà Tỉnh', 'C', 2);


INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the most popular programming language?', N'Python', N'Java', N'C++', N'JavaScript', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the purpose of version control systems?', N'To manage and track changes in code', N'To compile and execute code', N'To design user interfaces', N'To analyze data', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What does API stand for?', N'Application Programming Interface', N'Advanced Programming Interface', N'Automated Programming Interface', N'Application Process Integration', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the purpose of an IDE?', N'To provide a development environment for writing code', N'To store and organize data', N'To connect to the internet', N'To secure networks', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the file extension for a Python script?', N'.py', N'.java', N'.cpp', N'.html', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the purpose of a database management system (DBMS)?', N'To store, manage, and retrieve data', N'To design user interfaces', N'To write code', N'To analyze data', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the term for a computer program that maliciously infects other software?', N'Virus', N'Spam', N'Malware', N'Spyware', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the purpose of a compiler?', N'To translate high-level code into machine code', N'To manage databases', N'To design user interfaces', N'To analyze data', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the term for a logical error in a program that causes it to behave incorrectly?', N'Bug', N'Glitch', N'Vulnerability', N'Crash', 'A', 3);

INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID)
VALUES (N'What is the purpose of object-oriented programming (OOP)?', N'To organize code into reusable objects', N'To perform complex mathematical calculations', N'To manage networks', N'To analyze data', 'A', 3);




