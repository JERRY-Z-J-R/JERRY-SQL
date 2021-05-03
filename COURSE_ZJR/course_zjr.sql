/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : course_zjr

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 03/05/2021 13:51:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `Cno` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Cname` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Cpno` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Ccredit` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Cno`) USING BTREE,
  INDEX `Cpno`(`Cpno`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Cpno`) REFERENCES `course` (`Cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '数据库', '5', 4);
INSERT INTO `course` VALUES ('2', '数学', NULL, 2);
INSERT INTO `course` VALUES ('3', '信息系统', '1', 4);
INSERT INTO `course` VALUES ('4', '操作系统', '6', 3);
INSERT INTO `course` VALUES ('5', '数据结构', '7', 4);
INSERT INTO `course` VALUES ('6', '数据处理', NULL, 2);
INSERT INTO `course` VALUES ('7', 'PASCAL语言', '6', 4);

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `Sno` char(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Cno` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Grade` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`, `Cno`) USING BTREE,
  INDEX `Cno`(`Cno`) USING BTREE,
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('201215121', '1', 92);
INSERT INTO `sc` VALUES ('201215121', '2', 85);
INSERT INTO `sc` VALUES ('201215121', '3', 88);
INSERT INTO `sc` VALUES ('201215122', '2', 90);
INSERT INTO `sc` VALUES ('201215122', '3', 80);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Sno` char(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Sname` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Ssex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Sage` smallint(6) NULL DEFAULT NULL,
  `Sdept` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Sno`) USING BTREE,
  UNIQUE INDEX `Sname`(`Sname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201215121', '李勇', '男', 20, 'CS');
INSERT INTO `student` VALUES ('201215122', '刘晨', '女', 19, 'CS');
INSERT INTO `student` VALUES ('201215123', '王敏', '女', 18, 'MA');
INSERT INTO `student` VALUES ('201215125', '张立', '男', 19, 'IS');

SET FOREIGN_KEY_CHECKS = 1;
