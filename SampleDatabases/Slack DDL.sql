drop database if exists Slack;

create database Slack;
use Slack;

create table Channels (
	ChannelId int primary key auto_increment,
    `Name` varchar(255) not null
);

insert into Channels (`Name`) values ('Mpls Java');
insert into Channels (`Name`) values ('Random');

create table Users (
	UserId int primary key auto_increment,
    FirstName varchar(255) not null,
    LastName varchar(255) not null,
    Email varchar(255) null
);

insert into Users (FirstName, LastName) values ('Jeff', 'Stuart');
insert into Users (FirstName, LastName) values ('Rithee', 'Nhep');


update Users set
	email = 'jeff@sg.com'
	where UserId = 1;
    
update Users set
	email = 'rithee@sg.com'
    where UserId = 2;

create table Messages (
	MessageId int primary key auto_increment,
    Message varchar(255) not null,
    ChannelId int not null,
    UserId int not null,
    foreign key (ChannelId) references Channels(ChannelId),
    foreign key (UserId) references Users(UserId)
);

create table UsersAndChannels (
	UserId int not null,
    ChannelId int not null,
    foreign key (ChannelId) references Channels(ChannelId),
    foreign key (UserId) references Users(UserId)
);

insert into UsersAndChannels (UserId, ChannelId) values (1, 1);
insert into UsersAndChannels (UserId, ChannelId) values (1, 2);
insert into UsersAndChannels (UserId, ChannelId) values (2, 2);


insert into Messages (Message, UserId, ChannelId) values ('Hola Amigo!', 1, 2);
insert into Messages (Message, UserId, ChannelId) values ('How did you deal with the Vending Machine Exception?', 1, 2);
insert into Messages (Message, UserId, ChannelId) values ('I haven''t done that yet', 2, 2);