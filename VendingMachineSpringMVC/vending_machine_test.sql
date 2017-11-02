drop database if exists vending_machine_test;

create database vending_machine_test;
use vending_machine_test;

CREATE TABLE IF NOT EXISTS `items` (
 `item_id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(50) NOT NULL,
 `price` decimal(4,2) NOT NULL,
 `quantity` int NOT NULL,
 PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

insert into items (`name`, price, quantity) values 
	('Snickers', 1.25, 9),
    ('M & Ms', 1.50, 2),
    ('Pringles', 2.10, 5),
    ('Reese''s', 1.85, 4),
    ('Pretzels', 1.25, 9),
    ('Twinkies', 1.95, 9),
    ('Doritos', 1.75, 11),
    ('Almond Joy', 1.85, 1),
    ('Trident', 1.95, 6);

