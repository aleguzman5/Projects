drop database if exists HotelSG;

create database HotelSG;
use HotelSG;

create table RoomType (
	RoomTypeId int primary key auto_increment,
    Description varchar(45) null,
    BaseRate decimal not null
);
insert into RoomType(Description, BaseRate) values
	('Junior Suite', 110),
	('Master Suite', 130);


create table Rates (
	RateId int primary key auto_increment,
    RoomTypeId int not null,
    Season varchar(30) null,
    FromDate date not null,
    ToDate date not null,
    Price decimal not null,
    
    foreign key (RoomTypeId) references RoomType(RoomTypeId)
);
insert into Rates(RoomTypeId, Season, FromDate, ToDate, Price) values 
	(1,'Low Season', '2017/11/01', '2018/03/31', 90),
	(2,'Low Season', '2017/11/01', '2018/03/31', 120),
    (1,'High Season', '2018/06/01', '2018/10/01', 120),
    (2,'High Season', '2018/06/01', '2018/10/01', 160);


create table Room (
	RoomId int primary key auto_increment,
    RoomTypeId int not null,
    `Number` int(4) not null,
    Floor int not null,
    Occupancy int not null,

    foreign key (RoomTypeId) references RoomType(RoomTypeId)
);
insert into Room (RoomTypeId, `Number`, Floor, Occupancy) values 
	(1, 101, 1, 4),
    (2, 102, 1, 2),
    (1, 103, 1, 4),
    (2, 104, 1, 2),
    (1, 201, 2, 4),
    (2, 202, 2, 2),
    (1, 203, 2, 4),
    (2, 204, 2, 2),
    (1, 301, 3, 4),
    (2, 302, 3, 2),
    (1, 303, 3, 4),
    (2, 304, 3, 2);


create table Customer (
	CustomerId int primary key auto_increment,
    FirstName varchar(45) not null,
    LastName varchar(45) not null,
    Phone varchar(45) not null,
    Email varchar(45) not null
);
insert into Customer (FirstName, LastName, Phone, Email) values
	('John', 'Smith', '111-111-1111', 'john@smith.com'),
    ('Sally', 'Smith', '222-222-2222', 'sally@smith.com'),
    ('Sam', 'Smith', '333-333-3333', 'sam@smith.com'),
    ('Joe', 'Jones', '444-444-4444', 'joe@jones.com');


create table Ammenities (
	AmmenitiesId int primary key auto_increment,
    Description varchar(255) not null
);
insert into Ammenities(Description) values
	('32'' LCD Screen'),
    ('50'' LCD Screen'),
    ('Hot Tub'),
    ('Minibar'),
    ('Air conditioning'),
    ('In-room safe (laptop compatible)'),
    ('Phone'),
    ('Bathrobes'),
    ('Iron/ironing board'),
    ('Free toiletries'),
    ('Free newspaper'),
    ('WiFi'),
    ('Private bathroom'),
    ('King Size Bed'),
	('Two Double Beds');
    

create table RoomAmmenities (
	RoomId int not null,
    AmmenitiesId int not null,
    
    foreign key (RoomId) references Room(RoomId),
    foreign key (AmmenitiesId) references Ammenities(AmmenitiesId)
);
insert into RoomAmmenities(RoomId, AmmenitiesId) values 
	(1, 1), (1, 5), (1, 6), (1, 7), (1, 9), (1, 10), (1, 2), (1, 13), (1, 15),
    (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (2, 11), (2, 12), (2, 13), (2, 14),
    (3, 1), (3, 5), (3, 6), (3, 7), (3, 9), (3, 10), (3, 2), (3, 13), (3, 15), 
    (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12), (4, 13), (4, 14),
    (5, 1), (5, 5), (5, 6), (5, 7), (5, 9), (5, 10), (5, 2), (5, 13), (5, 15),
    (6, 2), (6, 3), (6, 4), (6, 5), (6, 6), (6, 7), (6, 8), (6, 9), (6, 10), (6, 11), (6, 12), (6, 13), (6, 14),
	(7, 1), (7, 5), (7, 6), (7, 7), (7, 9), (7, 10), (7, 2), (7, 13), (7, 15),
    (8, 2), (8, 3), (8, 4), (8, 5), (8, 6), (8, 7), (8, 8), (8, 9), (8, 10), (8, 11), (8, 12), (8, 13), (8, 14),
    (9, 1), (9, 5), (9, 6), (9, 7), (9, 9), (9, 10), (9, 2), (9, 13), (9, 15),
    (10, 2), (10, 3), (10, 4), (10, 5), (10, 6), (10, 7), (10, 8), (10, 9), (10, 10), (10, 11), (10, 12), (10, 13), (10, 14),
    (11, 1), (11, 5), (11, 6), (11, 7), (11, 9), (11, 10), (11, 2), (11, 13), (11, 15),
    (12, 2), (12, 3), (12, 4), (12, 5), (12, 6), (12, 7), (12, 8), (12, 9), (12, 10), (12, 11), (12, 12), (12, 13), (12, 14);


create table if not exists AddOns (
	AddOnId int primary key auto_increment,
    Description varchar(255) not null,
    Price decimal not null
);
insert into AddOns(Description, Price) values
	('Dry Cleaning', 2.00),
    ('Champagne', 75.00),
    ('Movie', 7.00),
    ('Beer', 4.00);


create table Reservation (
	ReservationId int primary key auto_increment,
    CustomerId int not null,
    FromDate date not null,
    ToDate date not null,
    
    foreign key (CustomerId) references Customer(CustomerID)
);
insert into Reservation(CustomerId, FromDate, ToDate) values
	(2, '2017/11/01', '2017/11/05'),
    (3, '2017/11/03', '2017/11/08'),
    (3, '2017/12/01', '2017/12/07'),
    (2, '2017/12/05', '2017/12/12'),
    (1, '2017/10/22', '2017/10/29'),
    (2, '2017/10/10', '2017/10/14'),
	(4, '2017/10/24', '2017/10/30');


create table ReservationDetails (
	ReservationId int not null,
    RoomId int not null,
    
    foreign key (ReservationId) references Reservation(ReservationId),
    foreign key (RoomId) references Room(RoomId)
);
insert into ReservationDetails(ReservationId, RoomId) values
	(1, 4),
    (1, 1),
	(2, 2),
    (3, 9),
    (4, 11),
    (5, 7),
    (6, 4);

create table AddOnDetails (
	AddOnDetailsId int primary key auto_increment,
    AddOnId int null,
    DateOfPurchase date not null,
    
    foreign key (AddOnId) references AddOns(AddOnId)
);
insert into AddOnDetails(AddOnId, DateOfPurchase) values
	(1, '2017/11/04'),
    (2, '2017/11/05'),
    (3, '2017/11/05'),
    (3, '2017/10/25'),
    (3, '2017/10/10'),
    (4, '2017/10/12'),
    (3, '2017/10/26');


create table PromotionCode (
	PromotionCodeId int primary key auto_increment,
	PromotionCode varchar(20) not null,
    FromDate date null,
    ToDate date null,
    DiscountPct decimal null,
    DollarDisc decimal null
);
insert into PromotionCode(PromotionCode, FromDate, ToDate, DiscountPct) values
	('GetCozy', '2017/11/15', '2017/11/30', 20),
	('SpringAhead', '2018/03/27', '2018/04/12', 20);
insert into PromotionCode(PromotionCode, DollarDisc) values
	('Veteran', 30),
	('SeniorCtzn', 15);
    

create table TotalDiscounts (
	TotalDiscountsId int primary key auto_increment,
    PromotionCodeId int not null,
    
    foreign key (PromotionCodeId) references PromotionCode(PromotionCodeId)
);


create table Billing (
	ReservationId int not null,
    AddOnDetailsId int null,
    TotalDiscountsId int null,
    Tax decimal not null,
    Total decimal not null,
    
    foreign key (ReservationId) references Reservation(ReservationId),
    foreign key (AddOnDetailsId) references AddOnDetails(AddOnDetailsId),
    foreign key (TotalDiscountsId) references TotalDiscounts(TotalDiscountsId)
);
#insert into Billing(ReservationId, AddOnDetailsId, Tax, Total) values
#	 (6, 6, 7.25, ),
#    (6, 5, 7.25, ); 