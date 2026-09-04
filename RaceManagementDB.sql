--creating a database--
create database RaceManagementDB;

--choosing which database to use--
use RaceManagementDB;
go

--creating tables--
create table Users (
    UserID int identity(1,1) primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    Email varchar(100) not null unique,
    Password varchar(100) not null,
    Role varchar(20) not null default 'Participant',
    CreatedAt datetime default getdate()
);
select* from Users;

-- Events table--
create table Events (
    EventID int identity(1,1) primary key,
    OrganiserID int not null,
    EventName varchar(100) not null,
    Description varchar(255),
    EventDate date not null,
    StartTime time not null,
    Venue varchar(150) not null,
    MaxParticipants int not null default 100,
    Status varchar(20) not null default 'Open',

    foreign key (OrganiserID) references Users(UserID)
);
select * from Events;

-- Categories table--
create table Categories (
    CategoryID int identity(1,1) primary key,
    CategoryName varchar(50) not null unique,
    Description varchar(255)
);
select * from Categories;

-- EventCategories table--
create table EventCategories (
    EventID int not null,
    CategoryID int not null,
    primary key (EventID, CategoryID),
    foreign key (EventID) references Events(EventID),
    foreign key (CategoryID) references Categories(CategoryID)
);
select * from EventCategories;

-- Enrolments table--
create table Enrolments (
    EnrolmentID int identity(1,1) primary key,
    EventID int not null,
    ParticipantID int not null,
    EnrolmentDate datetime default getdate(),
    Status varchar(20) not null default 'Registered',
    foreign key (EventID) references Events(EventID),
    foreign key (ParticipantID) references Users(UserID),
    unique (EventID, ParticipantID)
);
select * from Enrolments;

-- Results table--
create table Results (
    ResultID int identity(1,1) primary key,
    EnrolmentID int not null unique,
    Position int,
    FinishTime time,
    Score decimal(5,2),
    foreign key (EnrolmentID) references Enrolments(EnrolmentID)
);
select * from Results;

--sample data--
insert into Users
(FirstName, LastName, Email, Password, Role)
values
('Glory', 'Ramushu', 'glory12@gmail.com', '22345', 'Organiser'),
('Namari', 'Tubatse', 'namariww@gmail.com', '11345', 'Organiser'),
('Rele', 'Mofokeng', 'anele@gmail.com', '12335', 'Participant'),
('Kabelo', 'Maseko', 'kabelo@gmail.com', '12344', 'Participant'),
('Naledi', 'Mokoena', 'naledi@gmail.com', '50507', 'Participant'),
('Thato', 'Maredi', 'thatoo@gmail.com', '19875', 'Participant');

-- Categories--
insert into Categories
(CategoryName, Description)
values
('Otter trail run', 'A 5 kilometre running event'),
('Comrades Marathon', 'A 90 kilometre running event'),
('Fun Run', 'A fun running event for the community'),
('Charity Run', 'A running event supporting charity'),
('Soweto Marathon', 'A competitive road running event');

insert into Events
(OrganiserID, EventName, Description, EventDate, StartTime, Venue, MaxParticipants, Status)
values
(1,'Summer Time 10K','A 10 kilometre community road race','2026-09-20','07:00','Soweto Community Stadium',500,'Open'),
(2,'Johannesburg Charity Drive','A charity 5 kilometre running event', '2026-10-04','08:00','Zoo Lake Sports Grounds',300,'Open'),
(1,'Pimville Family Fun Run','A family friendly community running event','2026-10-18','09:00','Pimville Recreation Centre',250,'Open');

-- Categories for each event--
insert into EventCategories
(EventID, CategoryID)
values
(1, 2),
(1, 5),
(2, 1),
(2, 4),
(3, 1),
(3, 3);

-- Enrolments--
insert into Enrolments
(EventID, ParticipantID, Status)
values
(1, 3, 'Registered'),
(1, 4, 'Registered'),
(2, 3, 'Registered'),
(2, 5, 'Registered'),
(3, 4, 'Registered'),
(3, 6, 'Registered');


insert into Results
(EnrolmentID, Position, FinishTime, Score)
values
(1, 1, '00:42:18', 95.00),
(2, 2, '00:45:33', 91.50);
