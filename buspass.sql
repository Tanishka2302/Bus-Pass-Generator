-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema buspassgenerator
--

CREATE DATABASE IF NOT EXISTS buspassgenerator;
USE buspassgenerator;

--
-- Definition of table `passdetails`
--

DROP TABLE IF EXISTS `passdetails`;
CREATE TABLE `passdetails` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) NOT NULL,
  `scname` varchar(45) NOT NULL,
  `sname` varchar(45) NOT NULL,
  `std` varchar(45) NOT NULL,
  `div` varchar(45) NOT NULL,
  `rollno` varchar(45) NOT NULL,
  `source` varchar(45) NOT NULL,
  `destination` varchar(45) NOT NULL,
  `passamt` varchar(45) NOT NULL,
  `issuedate` datetime NOT NULL,
  `expdate` datetime NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passdetails`
--

/*!40000 ALTER TABLE `passdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `passdetails` ENABLE KEYS */;


--
-- Definition of table `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station` varchar(45) NOT NULL,
  `distance` varchar(45) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

/*!40000 ALTER TABLE `station` DISABLE KEYS */;
/*!40000 ALTER TABLE `station` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `enrollno` varchar(45) DEFAULT NULL,
  `address` longtext NOT NULL,
  `username` varchar(45) NOT NULL,
  `userpass` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`uid`,`role`,`name`,`mobile`,`email`,`enrollno`,`address`,`username`,`userpass`) VALUES 
 (1,1,'Balkrishnasamare','','balkrishnasamare@gmail.com','46090504','Sarvadnya 1st floor, maharudra colony a','bsamare','bala'),
 (2,1,'artinikam','','an456@gmail.com','4520621','akurdi, Pune','arti','arti1234'),
 (3,2,'reyanshsamare','9898773916','reyanshsamare@gmail.com','1212','','rsamare','rsamare');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
