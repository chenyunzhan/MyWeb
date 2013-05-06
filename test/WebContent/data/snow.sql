/*
Navicat MySQL Data Transfer

Source Server         : vmware
Source Server Version : 50162
Source Host           : localhost:10000
Source Database       : d8240767edeab4bf5a252e3658b3afa0f

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2013-05-02 11:15:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `snow`
-- ----------------------------
DROP TABLE IF EXISTS `snow`;
CREATE TABLE `snow` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of snow
-- ----------------------------
INSERT INTO `snow` VALUES ('1', '1');
INSERT INTO `snow` VALUES ('2', '2');
INSERT INTO `snow` VALUES ('3', '3');
