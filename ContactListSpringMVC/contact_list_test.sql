drop database if exists contact_list_test;

create database contact_list_test;
use contact_list_test;

CREATE TABLE IF NOT EXISTS `contacts` (
 `contact_id` int(11) NOT NULL AUTO_INCREMENT,
 `first_name` varchar(50) NOT NULL,
 `last_name` varchar(50) NOT NULL,
 `company` varchar(50) NOT NULL,
 `phone` varchar(10) DEFAULT NULL,
 `email` varchar(50) NOT NULL,
 PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;