drop database if exists OMDB;

create database OMDB;
use OMDB;

create table Movie (
	MovieId int primary key auto_increment,
    Title varchar(255) not null,
    Studio varchar(255) null,
    ReleaseDate date null
);

create table Person (
	PersonId int primary key auto_increment,
    FirstName varchar(255) not null,
    LastName varchar(255) null
);

create table Role (
	RoleId int primary key auto_increment,
    `Name` varchar(255) not null
);

create table MoviePersonRole (
	MovieId int not null,
    PersonId int not null,
    RoleId int not null,
    foreign key (MovieId) references Movie(MovieId),
    foreign key (PersonId) references Person(PersonId),
    foreign key (RoleId) references Role(RoleId),
    primary key (MovieId, PersonId, RoleId)
);

insert into Role (`Name`) values ('Actor');
insert into Role (`Name`) values ('Director');
insert into Role (`Name`) values ('Producer');
insert into Role (`Name`) values ('Executive Producer');
insert into Role (`Name`) values ('Writer');

insert into Person (FirstName) values ('Cher');
insert into Person (FirstName, LastName) values ('Carrie', 'Fisher');
insert into Person (FirstName, LastName) values ('Jeff', 'SSSS');

insert into Movie (Title) values ('Jurassic Park');
insert into Movie (Title, Studio) values ('Return of Jedi', 'Lucas Films');