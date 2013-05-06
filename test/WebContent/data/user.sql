/*
Navicat MySQL Data Transfer

Source Server         : vmware
Source Server Version : 50162
Source Host           : localhost:10000
Source Database       : d8240767edeab4bf5a252e3658b3afa0f

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2013-05-02 11:17:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9999', 'admin', 'admin', '男', 'chenyunzhan08@126.com', null);
INSERT INTO `user` VALUES ('10000', 'test', 'test', '1', 'test', 'Thu Apr 18 03:41:57 UTC 2013');
INSERT INTO `user` VALUES ('10001', 'snow', '0987654321a', '1', 'chenyunzhan08@126.com', 'Thu Apr 18 05:36:44 UTC 2013');
