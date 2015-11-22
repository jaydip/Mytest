/*
SQLyog Community v8.4 RC2
MySQL - 5.5.46-0ubuntu0.12.04.2 : Database - temp_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`temp_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `temp_db`;

/*Table structure for table `login_details` */

DROP TABLE IF EXISTS `login_details`;

CREATE TABLE `login_details` (
  `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_user_name` varchar(255) NOT NULL,
  `login_user_pass` varchar(255) NOT NULL,
  `login_created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `login_details` */

insert  into `login_details`(`login_id`,`login_user_name`,`login_user_pass`,`login_created_time`) values (1,'jaydip','1234','2015-11-22 13:44:25'),(2,'jaydwdggidp','12345sd','2015-11-22 13:44:33'),(3,'admin','admin','2015-11-22 18:04:00'),(4,'ramesh','ramesh','2015-11-22 18:29:42');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
