-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for shoe
CREATE DATABASE IF NOT EXISTS `shoe` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `shoe`;

-- Dumping structure for table shoe.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `brand_name` varchar(100) NOT NULL,
  `release_date` date NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`brand_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table shoe.brand: ~0 rows (approximately)
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`brand_name`, `release_date`, `price`) VALUES
	('Addidas', '2020-06-23', 1000),
	('paragon', '2018-05-12', 1000),
	('PUMA', '2021-02-12', 1000);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

-- Dumping structure for table shoe.shoe_details
CREATE TABLE IF NOT EXISTS `shoe_details` (
  `shoe_type` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  PRIMARY KEY (`shoe_type`),
  KEY `shoe_details_brand` (`brand_name`),
  CONSTRAINT `shoe_details_brand` FOREIGN KEY (`brand_name`) REFERENCES `brand` (`brand_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table shoe.shoe_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `shoe_details` DISABLE KEYS */;
INSERT INTO `shoe_details` (`shoe_type`, `size`, `price`, `brand_name`) VALUES
	('Jazz shoe', '8', 1000, 'puma'),
	('Kitten heel', '4', 2000, 'addidas'),
	('Tennis Shoes', '6', 500, 'paragon');
/*!40000 ALTER TABLE `shoe_details` ENABLE KEYS */;

-- Dumping structure for table shoe.shop_details
CREATE TABLE IF NOT EXISTS `shop_details` (
  `shop_id` varchar(100) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `stock_id` varchar(100) NOT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `shop_details_stock` (`stock_id`),
  CONSTRAINT `shop_details_stock` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table shoe.shop_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `shop_details` DISABLE KEYS */;
INSERT INTO `shop_details` (`shop_id`, `shop_name`, `location`, `stock_id`) VALUES
	('s1', 'shoes store', 'london', 'stk1'),
	('s2', 'shoes here', 'london', 'stk2'),
	('s3', 'shoes world', 'london', 'stk3');
/*!40000 ALTER TABLE `shop_details` ENABLE KEYS */;

-- Dumping structure for table shoe.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `stock_id` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `sold_item` int(11) NOT NULL,
  `availabe_item` int(11) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table shoe.stock: ~0 rows (approximately)
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`stock_id`, `total`, `sold_item`, `availabe_item`) VALUES
	('stk1', 50, 25, 25),
	('stk2', 20, 5, 15),
	('stk3', 10, 2, 8),
	('stk4', 43, 13, 30);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;

-- Dumping structure for table shoe.stuff_details
CREATE TABLE IF NOT EXISTS `stuff_details` (
  `stuff_id` varchar(100) NOT NULL,
  `stuff_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `shop_id` varchar(100) NOT NULL,
  PRIMARY KEY (`stuff_id`),
  KEY `stuff_details_shop_details` (`shop_id`),
  CONSTRAINT `stuff_details_shop_details` FOREIGN KEY (`shop_id`) REFERENCES `shop_details` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table shoe.stuff_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `stuff_details` DISABLE KEYS */;
INSERT INTO `stuff_details` (`stuff_id`, `stuff_name`, `location`, `role`, `shop_id`) VALUES
	('stuff1', 'riki', 'london', 'manager', 's1'),
	('stuff2', 'john', 'london', 'stuff boys', 's2'),
	('stuff3', 'tom', 'london', 'guard', 's3');
/*!40000 ALTER TABLE `stuff_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
