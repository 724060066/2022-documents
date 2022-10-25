/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1
 Source Database       : bookborrow

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 10/21/2022 09:56:32 AM
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书表主键',
  `firstMenuId` int(3) NOT NULL COMMENT '一级类目id',
  `secondMenuId` int(3) NOT NULL COMMENT '二级类目id',
  `bookNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图书编号',
  `bookName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '书名',
  `isbn` int(13) NOT NULL COMMENT 'ISBN',
  `press` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '出版社',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '作者',
  `price` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图书价格',
  `total` int(3) NOT NULL COMMENT '图书总数量',
  `remainder` int(3) NOT NULL COMMENT '图书剩余数量',
  `isDel` int(1) DEFAULT NULL COMMENT '是否删除 0:未删除; 1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图书信息表';

-- ----------------------------
--  Table structure for `borrow`
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅表主键',
  `studentId` int(11) NOT NULL COMMENT '学生表id',
  `bookId` int(11) NOT NULL COMMENT '图书表id',
  `startTime` datetime NOT NULL COMMENT '借书时间',
  `endTime` datetime NOT NULL COMMENT '还书时间',
  `status` int(1) NOT NULL COMMENT '图书借阅状态 1:未借阅; 2:借阅中',
  `isDel` int(1) NOT NULL COMMENT '是否删除 0:未删除; 1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借阅表';

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目表主键',
  `menuId` int(3) NOT NULL COMMENT '类目id',
  `parentId` int(3) NOT NULL COMMENT '父类目id',
  `menuName` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '类目名称',
  `isDel` int(1) NOT NULL COMMENT '是否删除 0:未删除; 1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图书分类表';

-- ----------------------------
--  Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生表主键',
  `userId` int(11) NOT NULL COMMENT '用户表主键',
  `studentCode` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学号',
  `studentName` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '学生姓名',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '性别  1:男; 2:女',
  `startTime` datetime NOT NULL COMMENT '入学时间',
  `endTime` datetime NOT NULL COMMENT '毕业时间',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '联系电话',
  `isDel` int(1) NOT NULL COMMENT '是否删除 0:未删除; 1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `userCode` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '登录的用户名',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `role` int(1) NOT NULL COMMENT '1：系统管理员\r\n2：图书管理员\r\n1：系统管理员; 2：图书管理员; 3:学生',
  `isDel` int(1) NOT NULL COMMENT '数据是否删除:默认;0; 0:未删除; 1:已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

SET FOREIGN_KEY_CHECKS = 1;
