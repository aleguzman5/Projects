drop database if exists MovieCatalogue;

create database MovieCatalogue;
use MovieCatalogue;

create table Director (
	DirectorId int primary key auto_increment,
    FirstName varchar(30) not null,
    LastName varchar(30) not null,
    BirthDate date null
);

create table Rating (
	RatingId int primary key auto_increment,
    RatingName varchar(5)
);

create table Genre(
	GenreId int primary key auto_increment,
    GenreName varchar(30) not null
);

create table Movie (
	MovieId int primary key auto_increment,
    GenreId int not null,
    DirectorId int null,
    RatingId int null,
    Title varchar(128) not null,
    ReleaseDate date null,
    
    foreign key (GenreId) references Genre(GenreId),
    foreign key (DirectorId) references Director(DirectorId),
    foreign key (RatingId) references Rating(RatingId)
);

create table Actor (
	ActorId int primary key auto_increment,
    FirstName varchar (30)not null,
    LastName varchar(30) not null,
    BirthDate date null
);

create table CastMembers (
	CastMemberId int primary key auto_increment,
    ActorId int not null,
    MovieId int not null,
    Role varchar(50) not null,
    
    foreign key (ActorId) references Actor(ActorId),
    foreign key (MovieId) references Movie(MovieId)
);