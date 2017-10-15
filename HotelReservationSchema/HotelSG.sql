drop database if exists HotelSG;

create database HotelSG;
use HotelSG;

create table Rates (
	RateId int primary key auto_increment,
    Season varchar(30) null,
    FromDate date not null,
    ToDate date not null,
    Price decimal not null
);
  



create table RoomType (
	RoomTypeId int primary key auto_increment,
    Descrption varchar(45) null,
    BaseRate decimal not null
);




create table Room (
	RoomId int primary key auto_increment,
    `Number` int(4) not null,
    Floor int not null,
    Occupancy int not null,
    RateId int null,
    RoomTypeId int not null,
    
    foreign key (RateId) references Rates(RateId),
    foreign key (RoomTypeId) references RoomType(RoomTypeId)
);




create table Customer (
	CustomerId int primary key auto_increment,
    FirstName varchar(45) not null,
    LastName varchar(45) not null,
    Phone varchar(45) not null,
    Email varchar(45) not null
);




create table Ammenities (
	AmmenitiesId int primary key auto_increment,
    Description varchar(255) not null
);




create table RoomAmmenities (
	RoomId int not null,
    AmmenitiesId int not null,
    
    foreign key (RoomId) references Room(RoomId),
    foreign key (AmmenitiesId) references Ammenities(AmmenitiesId)
);



create table if not exists AddOns (
	AddOnId int primary key auto_increment,
    Description varchar(255) not null,
    Price decimal not null
);




create table Reservation (
	ReservationId int primary key auto_increment,
    CustomerId int not null,
    FromDate date not null,
    ToDate date not null,
    
    foreign key (CustomerId) references Customer(CustomerID)
);



create table ReservationDetails (
	ReservationId int not null,
    RoomId int not null,
    
    foreign key (ReservationId) references Reservation(ReservationId),
    foreign key (RoomId) references Room(RoomId)
);



create table AddOnDetails (
	AddOnDetailsId int primary key auto_increment,
    AddOnId int null,
    
    foreign key (AddOnId) references AddOns(AddOnId)
);



create table PromotionCode (
	PromotionCode varchar(20) not null,
    FromDate date not null,
    ToDate date not null,
    DiscountPct decimal null,
    DollarDisc decimal null
);



create table TotalDiscounts (
	TotalDiscountsId int primary key auto_increment,
    PromotionCodeId varchar(20) not null,
    
    foreign key (PromotionCodeId) references PromotionCode(PromotionCode)
);




create table Billing (
	ReservationId int not null,
    AddOnDetailsId int null,
    TotalDiscountsId int null,
    Tax decimal not null,
    Total decimal not null,
    
    foreign key (ReservationId) references Reservation(ReservaionId),
    foreign key (AddOnDetailsId) references AddOnDetails(AddOnDetailsId),
    foreign key (TotalDiscountsId) references TotalDiscounts(TotalDiscountsId)
);