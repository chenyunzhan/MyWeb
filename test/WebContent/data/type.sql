/*
Navicat MySQL Data Transfer

Source Server         : vmware
Source Server Version : 50162
Source Host           : localhost:10000
Source Database       : d8240767edeab4bf5a252e3658b3afa0f

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2013-05-02 11:16:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'jQuery', '0');
INSERT INTO `type` VALUES ('2', 'Arithmetic', '0');
INSERT INTO `type` VALUES ('3', 'Forum', '0');
INSERT INTO `type` VALUES ('4', 'Ruby', '0');
INSERT INTO `type` VALUES ('5', 'Website', '0');
INSERT INTO `type` VALUES ('6', 'idea', '0');
INSERT INTO `type` VALUES ('101', '常见排序算法效率比较', '2');
INSERT INTO `type` VALUES ('102', '常用文档链接', '5');
INSERT INTO `type` VALUES ('103', '问题解决链接', '5');
INSERT INTO `type` VALUES ('600', '生活感想', '6');
INSERT INTO `type` VALUES ('601', 'test', '6');
