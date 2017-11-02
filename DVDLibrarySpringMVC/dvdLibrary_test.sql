drop database if exists dvdlibrary_test;

create database dvdlibrary_test;
use dvdlibrary_test;

CREATE TABLE IF NOT EXISTS `dvds` (
dvdId int primary key auto_increment,
title varchar(50) not null,
releaseYear int(4) not null,
director varchar(50) null,
rating varchar(10) null,
notes varchar(255) null
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;