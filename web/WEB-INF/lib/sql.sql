/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : LandDiscover

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/03/2019 18:05:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Account
-- ----------------------------
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(80) NOT NULL,
  `nickname` varchar(20) NOT NULL DEFAULT '隐姓埋名',
  `phone` int(11) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `Account_userId_uindex` (`userId`),
  UNIQUE KEY `Account_username_uindex` (`username`),
  UNIQUE KEY `Account_phone_uindex` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;



/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : LandDiscover

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/03/2019 18:05:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for infomation
-- ----------------------------
DROP TABLE IF EXISTS `infomation`;
CREATE TABLE `infomation` (
  `cityId` varchar(20) NOT NULL,
  `scenery` varchar(40) DEFAULT NULL,
  `hotel` varchar(30) DEFAULT NULL,
  `car` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cityId`),
  KEY `scenery` (`scenery`),
  KEY `hotel` (`hotel`),
  KEY `car` (`car`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;


/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : LandDiscover

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/03/2019 18:13:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `fromId` varchar(30) NOT NULL,
  `toId` varchar(30) NOT NULL,
  `scenery` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hotel` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `car` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` int(11) NOT NULL,
  `startDate` char(20) NOT NULL,
  `endDate` char(20) NOT NULL,
  `humans` int(11) NOT NULL,
  `money` float NOT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `order_orderId_uindex` (`orderId`),
  KEY `FK_info_order` (`fromId`),
  KEY `FK_info_order-2` (`toId`),
  KEY `FK_Acc_order` (`userId`),
  KEY `FK_info_order_3` (`scenery`),
  KEY `FK_info_order_4` (`hotel`),
  KEY `FK_info_order_5` (`car`),
  CONSTRAINT `FK_Acc_order` FOREIGN KEY (`userId`) REFERENCES `account` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_info_order` FOREIGN KEY (`fromId`) REFERENCES `infomation` (`cityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_info_order_3` FOREIGN KEY (`scenery`) REFERENCES `infomation` (`scenery`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_info_order_4` FOREIGN KEY (`hotel`) REFERENCES `infomation` (`hotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_info_order_5` FOREIGN KEY (`car`) REFERENCES `infomation` (`car`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
