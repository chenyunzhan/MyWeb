/*
Navicat MySQL Data Transfer

Source Server         : vmware
Source Server Version : 50162
Source Host           : localhost:10000
Source Database       : d8240767edeab4bf5a252e3658b3afa0f

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2013-05-02 11:14:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '101', '9999', '各位排序算法实际测试结果', 'OS: winxp, Compiler: vc8, CPU：Intel T7200,  Memory: 2G<br>\r\n不同数组长度下调用6种排序1000次所需时间(秒）<br>\r\n<br>\r\n<pre style=\"display:inline\">\r\nlength          shell           quick           merge           insert          select          bubble\r\n100             0.0141          0.359           1.875           0.204           0.313           0.421\r\n1000            0.218           0.578           2.204           1.672           2.265           4\r\n5000            1.484           3.25            14.14           41.392          63.656          101.703\r\n10000           3.1             7.8             23.5            253.1           165.6           415.7\r\n50000           21.8            40.6            121.9           411.88          6353.1          11648.5\r\n100000          53.1            89              228.1           16465.7         25381.2         44250\r\n</pre>\r\n<br>\r\n<br>\r\n结论：<br>\r\n数组长度不大的情况下不宜使用归并排序，其它排序差别不大。<br>\r\n数组长度很大的情况下Shell最快，Quick其次，冒泡最慢。<br>', '2013-04-17 13:39');
INSERT INTO `article` VALUES ('50', '102', '9999', 'java之javaee官方文档', 'http://docs.oracle.com/javaee/6/api/', '2013-04-17 13:15');
INSERT INTO `article` VALUES ('51', '102', '9999', 'java之javase官方文档', 'http://docs.oracle.com/javase/7/docs/api/index.html', '2013-04-18 02:38');
INSERT INTO `article` VALUES ('52', '102', '9999', 'jQuery UI Layout Plug-in', 'http://layout.jquery-dev.net/', '2013-04-18 02:53');
INSERT INTO `article` VALUES ('54', '102', '9999', 'jQuery Form Plugin', 'http://www.malsup.com/jquery/form/', '2013-04-18 02:06');
INSERT INTO `article` VALUES ('55', '102', '9999', 'jQuery官方文档', 'http://api.jquery.com/', '2013-04-18 02:17');
INSERT INTO `article` VALUES ('56', '102', '9999', 'jQuery之easyui官方文档', 'http://api.jqueryui.com/', '2013-04-18 02:30');
INSERT INTO `article` VALUES ('57', '102', '9999', 'Getting Started with Rails', 'http://guides.rubyonrails.org/getting_started.html', '2013-04-18 02:42');
INSERT INTO `article` VALUES ('58', '102', '9999', 'Getting Started with Cloud Foundry', 'http://docs.cloudfoundry.com/getting-started.html', '2013-04-18 02:52');
INSERT INTO `article` VALUES ('59', '101', '9999', '改变自己', '改变自己，从接触他人开始。加油！', '2013-04-18 02:58');
INSERT INTO `article` VALUES ('60', '102', '9999', 'CloudFoudry环境搭建', 'http://docs.cloudfoundry.com/getting-started.html', '2013-04-18 03:07');
INSERT INTO `article` VALUES ('61', '101', '9999', 'ubuntu 怎么打开一个shell', 'alt键+f2键调出运行程序对话框；\r\n输入gnome-terminal回车调出终端窗口；\r\n输入sudo apt-get install wine回车，等待从源下载安装wine程序，保证可以联网；\r\n建议对于linux命令不熟悉的用户通过“应用程序-ubuntu软件中心”安装应用程序，图形化操作，不需要命令，只要在搜索框里输入wine，然后从结果列表选择安装就行了。', '2013-04-18 03:20');
INSERT INTO `article` VALUES ('62', '103', '9999', '五八同城', 'iptsl_f1', '2013-04-18 03:31');
INSERT INTO `article` VALUES ('63', '102', '9999', 'Eclipse 4 RCP - Tutorial', 'http://www.vogella.com/articles/EclipseRCP/article.html', '2013-04-18 03:46');
INSERT INTO `article` VALUES ('64', '102', '9999', 'ExtJs大比拼jQuery：操作Dom', 'http://www.cnblogs.com/lipan/archive/2011/12/07/2269815.html', '2013-04-18 03:26');
INSERT INTO `article` VALUES ('65', '103', '9999', 'Acer 64 Win7 驱动', 'http://productbbs.it168.com/thread-34123-1-1.html', '2013-04-18 03:19');
INSERT INTO `article` VALUES ('66', '103', '9999', 'vim 如何设置不创建备份', 'set nobackup', '2013-04-18 03:11');
INSERT INTO `article` VALUES ('67', '103', '9999', 'tomcat启动指定项目', '<pre style=\"display:inline\">\r\n&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;\r\n&lt;Context path=\"/snow\" docBase=\"F:\\work\\code\\DFext3\\WebRoot\" debug=\"0\" privileged=\"true\"&gt;&lt;/Context&gt;\r\n</pre>', '2013-04-18 03:03');
INSERT INTO `article` VALUES ('68', '103', '9999', 'toggle单引号和多引号', '<pre style=\"display:inline\">\r\n    function hidediv(src, tar){\r\n	document.getElementById(tar).style.display=\'none\';//隐藏  \r\n	document.getElementById(src).innerHTML = \'&lt;div style=\\\"float: right;\\\"&gt;&lt;a href=\\\"#\\\" onclick=\\\"showdiv(\\\'\'+src+\'\\\',\\\'\'+tar+\'\\\')\"&gt;展开&lt;/a&gt;&lt;/div&gt;\';\r\n    }\r\n	\r\n    function showdiv(src, tar){\r\n	document.getElementById(tar).style.display=\'block\';//显示\r\n	document.getElementById(src).innerHTML = \'&lt;div style=\\\"float: right;\\\"&gt;&lt;a href=\\\"#\\\" onclick=\\\"hidediv(\\\'\'+src+\'\\\',\\\'\'+tar+\'\\\')\\\"&gt;收缩&lt;/a&gt;&lt;/div&gt;\';\r\n    }\r\n</pre>', '2013-04-18 03:42');
INSERT INTO `article` VALUES ('69', '103', '9999', '项目管理', '对于重要的文件一定要有说明，否则会带来极大的负面效果。（df.css）', '2013-04-18 03:33');
INSERT INTO `article` VALUES ('70', '102', '9999', 'Eclipse documentation-Eclipse Juno', 'http://help.eclipse.org/juno/index.jsp', '2013-04-18 03:43');
INSERT INTO `article` VALUES ('71', '103', '9999', 'vim 乱码解决方案', '<pre style=\"display:inline\">\r\n\"处理文本中显示乱码\r\nset encoding=utf-8\r\nset fileencodings=utf-8,chinese,latin-1\r\nif has(\"win32\")\r\nset fileencoding=chinese\r\nelse\r\nset fileencoding=utf-8\r\nendif\r\n    \r\n\"处理菜单及右键菜单乱码\r\nsource $VIMRUNTIME/delmenu.vim\r\nsource $VIMRUNTIME/menu.vim\r\n    \r\n\"处理consle输出乱码\r\nlanguage messages zh_CN.utf-8\r\n</pre>', '2013-04-18 03:56');
INSERT INTO `article` VALUES ('72', '102', '9999', 'GMF很好的一篇文章', 'http://www.ibm.com/developerworks/cn/opensource/os-cn-eclipse-gmfsamp/', '2013-04-18 03:09');
INSERT INTO `article` VALUES ('73', '102', '9999', 'GMF 官方文档', 'http://wiki.eclipse.org/Category:GMF', '2013-04-18 03:58');
INSERT INTO `article` VALUES ('74', '101', '10000', 'test', 'test', '2013-04-18 03:28');
INSERT INTO `article` VALUES ('76', '102', '10001', '酷盘帐号', 'https://www.kanbox.com/\n用户名：183180534@qq.com\n密码：默认', '2013-04-18 05:13');
INSERT INTO `article` VALUES ('77', '102', '10001', '金山T盘OR快盘帐号', 'http://www.kuaipan.cn/home.htm\n用户名：183180534@qq.com\n密码：默认', '2013-04-18 05:56');
INSERT INTO `article` VALUES ('79', '102', '9999', 'java面试基础知识', 'http://blog.csdn.net/zhangerqing/article/details/8731044', '2013-04-18 08:45');
INSERT INTO `article` VALUES ('80', '102', '10001', '百度帐号--陈展倩', 'http://www.baidu.com/\n用户名：chenyunzhan08@126.com\n密码：默认', '2013-04-19 10:54');
INSERT INTO `article` VALUES ('81', '600', '9999', '人生的感想之一', '别天天想着结婚了。先管好自己，照顾好自己的父母。', '2013-04-21 08:11');
INSERT INTO `article` VALUES ('82', '102', '10001', '人人网帐号', 'http://www.renren.com/\n用户名：chenyunzhan08@126.com\n密码：chenyunzhan21', '2013-04-28 05:11');
