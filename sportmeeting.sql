/*
 Navicat Premium Data Transfer

 Source Server         : sport
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-r9zo05hq.bj.tencentcdb.com:10191
 Source Schema         : sportmeeting

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 03/01/2020 23:50:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for athlete
-- ----------------------------
DROP TABLE IF EXISTS `athlete`;
CREATE TABLE `athlete`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `player_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运动员号码',
  `gender` tinyint(1) NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  `height` double NULL DEFAULT NULL,
  `nation_id` int(11) NULL DEFAULT NULL COMMENT '民族',
  `id_num` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '注册用户',
  `max` int(11) NULL DEFAULT 2 COMMENT '最多参加的项目数',
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_num`(`id_num`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `nation_id`(`nation_id`) USING BTREE,
  CONSTRAINT `athlete_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `athlete_ibfk_2` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of athlete
-- ----------------------------
INSERT INTO `athlete` VALUES (2, '小篮123456', '002', 0, 19, 60, 175, 1, '000000000000000002', 1, 2, 1);
INSERT INTO `athlete` VALUES (3, '小花', '003', 1, 18, 55, 165, 1, '000000000000000003', NULL, 2, 1);
INSERT INTO `athlete` VALUES (4, '小溪', '004', 1, 17, 55, 170, 1, '000000000000000004', NULL, 2, 1);
INSERT INTO `athlete` VALUES (6, '小郭', '005', 0, 21, 65, 175, 1, '000000000000000005', NULL, 2, 1);
INSERT INTO `athlete` VALUES (7, '小胡', '006', 0, 21, 55, 175, 1, '000000000000000006', NULL, 2, 1);
INSERT INTO `athlete` VALUES (8, '小明', '007', 0, 20, 70, 188, 3, '000000000000000007', 41, 2, 1);
INSERT INTO `athlete` VALUES (9, 'test', '008', 0, 20, 60, 180, 1, '0000000000', NULL, 2, 1);

-- ----------------------------
-- Table structure for athlete_team
-- ----------------------------
DROP TABLE IF EXISTS `athlete_team`;
CREATE TABLE `athlete_team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `athlete_id` int(11) NULL DEFAULT NULL,
  `team_id` int(11) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `athlete_id`(`athlete_id`) USING BTREE,
  INDEX `team_id`(`team_id`) USING BTREE,
  CONSTRAINT `athlete_team_ibfk_1` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `athlete_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of athlete_team
-- ----------------------------
INSERT INTO `athlete_team` VALUES (8, 6, 7, 1);
INSERT INTO `athlete_team` VALUES (9, 6, 4, 1);
INSERT INTO `athlete_team` VALUES (13, 2, 8, 1);
INSERT INTO `athlete_team` VALUES (14, 3, 8, 1);

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `place` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES (1, '篮球11111111', 40, 'A', '器材室1', '该篮球购自XXXXXXXXXXXX', 1);
INSERT INTO `equipment` VALUES (2, '篮球', 30, 'B', '器材室1', NULL, 1);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `athlete_id` int(11) NULL DEFAULT NULL,
  `score` double NULL DEFAULT 0,
  `rank` int(11) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `athlete_id`(`athlete_id`) USING BTREE,
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (6, 50, 2, 10, 1, 1);
INSERT INTO `grade` VALUES (7, 51, 2, 20, 1, 1);
INSERT INTO `grade` VALUES (8, 52, 2, 0, 1, 1);
INSERT INTO `grade` VALUES (13, 50, 6, 5, 2, 1);
INSERT INTO `grade` VALUES (14, 50, 7, 1, 3, 1);
INSERT INTO `grade` VALUES (15, 50, 8, 0, 4, 1);

-- ----------------------------
-- Table structure for lend_details
-- ----------------------------
DROP TABLE IF EXISTS `lend_details`;
CREATE TABLE `lend_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrow_num` int(11) NULL DEFAULT NULL,
  `borrower` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `borrower_tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `borrow_time` datetime(0) NULL DEFAULT NULL,
  `return_time` datetime(0) NULL DEFAULT NULL,
  `returner` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `equipment_id` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_return` tinyint(1) NULL DEFAULT 0,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `equipment_id`(`equipment_id`) USING BTREE,
  CONSTRAINT `lend_details_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lend_details
-- ----------------------------
INSERT INTO `lend_details` VALUES (2, 10, 'hf', '13777777777', '2019-10-04 13:45:02', '2019-10-04 15:37:46', 'hf', 1, NULL, 1, 1);
INSERT INTO `lend_details` VALUES (21, 3, '郭嘉鹏', '13777777777', '2019-10-05 14:07:01', '2019-10-05 15:46:49', '郭嘉鹏', 1, '', 1, 1);
INSERT INTO `lend_details` VALUES (22, 47, '郭嘉鹏', '13777777777', '2019-10-05 14:17:14', '2019-10-05 15:47:07', '郭嘉鹏', 1, '', 1, 1);
INSERT INTO `lend_details` VALUES (23, 9, '郭嘉鹏', '13777777777', '2019-10-05 15:47:21', '2019-10-05 15:47:32', '郭嘉鹏', 1, '', 1, 1);
INSERT INTO `lend_details` VALUES (24, 10, '郭嘉鹏', '13777777777', '2019-10-05 15:48:52', '2019-10-05 15:49:40', '郭嘉鹏', 1, '111', 1, 1);
INSERT INTO `lend_details` VALUES (26, 26, '郭嘉鹏', '13777777777', '2019-10-05 15:49:13', '2019-10-05 15:49:35', '郭嘉鹏', 1, '', 1, 1);
INSERT INTO `lend_details` VALUES (27, 3, '郭嘉鹏', '13777777777', '2019-10-05 15:49:25', '2019-10-05 15:49:32', '郭嘉鹏', 1, '', 1, 1);
INSERT INTO `lend_details` VALUES (28, 10, '郭嘉鹏', '13777777777', '2019-10-05 15:50:15', '2019-10-05 15:50:22', '郭嘉鹏', 2, '', 1, 1);
INSERT INTO `lend_details` VALUES (32, 10, '郭嘉鹏', '13777777777', '2019-10-06 12:11:26', '2019-10-06 12:11:31', '郭嘉鹏', 1, '', 1, 1);
INSERT INTO `lend_details` VALUES (33, 10, '郭嘉鹏', '13777777777', '2019-10-06 12:46:42', '2019-10-11 13:44:09', '郭嘉鹏', 1, '111', 1, 1);
INSERT INTO `lend_details` VALUES (34, 20, '111', '13777777777', '2019-10-11 13:44:30', NULL, NULL, 2, '123', 0, 1);

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES (1, '汉族', 1);
INSERT INTO `nation` VALUES (2, '壮族', 1);
INSERT INTO `nation` VALUES (3, '回族', 1);
INSERT INTO `nation` VALUES (4, '满族', 1);
INSERT INTO `nation` VALUES (5, '维吾尔族', 1);
INSERT INTO `nation` VALUES (6, '苗族', 1);
INSERT INTO `nation` VALUES (7, '彝族', 1);
INSERT INTO `nation` VALUES (8, '土家族', 1);
INSERT INTO `nation` VALUES (9, '藏族', 1);
INSERT INTO `nation` VALUES (10, '蒙古族', 1);
INSERT INTO `nation` VALUES (11, '侗族', 1);
INSERT INTO `nation` VALUES (12, '布依族', 1);
INSERT INTO `nation` VALUES (13, '瑶族', 1);
INSERT INTO `nation` VALUES (14, '白族', 1);
INSERT INTO `nation` VALUES (15, '朝鲜族', 1);
INSERT INTO `nation` VALUES (16, '哈尼族', 1);
INSERT INTO `nation` VALUES (17, '黎族', 1);
INSERT INTO `nation` VALUES (18, '哈萨克族', 1);
INSERT INTO `nation` VALUES (19, '傣族', 1);
INSERT INTO `nation` VALUES (20, '畲族', 1);
INSERT INTO `nation` VALUES (21, '傈僳族', 1);
INSERT INTO `nation` VALUES (22, '东乡族', 1);
INSERT INTO `nation` VALUES (23, '仡佬族', 1);
INSERT INTO `nation` VALUES (24, '拉祜族', 1);
INSERT INTO `nation` VALUES (25, '佤族', 1);
INSERT INTO `nation` VALUES (26, '水族', 1);
INSERT INTO `nation` VALUES (27, '纳西族', 1);
INSERT INTO `nation` VALUES (28, '羌族', 1);
INSERT INTO `nation` VALUES (29, '土族', 1);
INSERT INTO `nation` VALUES (30, '仫佬族', 1);
INSERT INTO `nation` VALUES (31, '锡伯族', 1);
INSERT INTO `nation` VALUES (32, '柯尔克孜族', 1);
INSERT INTO `nation` VALUES (33, '景颇族', 1);
INSERT INTO `nation` VALUES (34, '达斡尔族', 1);
INSERT INTO `nation` VALUES (35, '撒拉族', 1);
INSERT INTO `nation` VALUES (36, '布朗族', 1);
INSERT INTO `nation` VALUES (37, '毛南族', 1);
INSERT INTO `nation` VALUES (38, '塔吉克族', 1);
INSERT INTO `nation` VALUES (39, '普米族', 1);
INSERT INTO `nation` VALUES (40, '阿昌族', 1);
INSERT INTO `nation` VALUES (41, '怒族', 1);
INSERT INTO `nation` VALUES (42, '鄂温克族', 1);
INSERT INTO `nation` VALUES (43, '京族', 1);
INSERT INTO `nation` VALUES (44, '基诺族', 1);
INSERT INTO `nation` VALUES (45, '德昂族', 1);
INSERT INTO `nation` VALUES (46, '保安族', 1);
INSERT INTO `nation` VALUES (47, '俄罗斯族', 1);
INSERT INTO `nation` VALUES (48, '裕固族', 1);
INSERT INTO `nation` VALUES (49, '乌孜别克族', 1);
INSERT INTO `nation` VALUES (50, '门巴族', 1);
INSERT INTO `nation` VALUES (51, '鄂伦春族', 1);
INSERT INTO `nation` VALUES (52, '独龙族', 1);
INSERT INTO `nation` VALUES (53, '赫哲族', 1);
INSERT INTO `nation` VALUES (54, '高山族', 1);
INSERT INTO `nation` VALUES (55, '珞巴族', 1);
INSERT INTO `nation` VALUES (56, '塔塔尔族', 1);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` tinyint(1) NULL DEFAULT NULL COMMENT '单位',
  `sort` tinyint(1) NULL DEFAULT NULL COMMENT '排序 0正序 1倒序',
  `gender` tinyint(1) NULL DEFAULT NULL,
  `place` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '0 个人比赛 1团体比赛',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (50, '男子100m短跑', 0, 0, 0, '体育场', '2019-09-25 19:16:00', '2019-09-25 19:16:00', 30, 0, '这是一场很牛皮的比赛', 1);
INSERT INTO `project` VALUES (51, '男子200m短跑111', 0, 1, 0, '体育场', '2019-09-25 19:20:00', '2019-09-25 19:20:00', 30, 0, '男子200m短跑', 1);
INSERT INTO `project` VALUES (52, '男子400m短跑', 0, 1, 0, '体育场', '2019-09-25 19:21:08', '2019-09-25 19:21:08', 30, 0, '男子400m短跑', 1);
INSERT INTO `project` VALUES (53, '男子800m跑', 0, 1, 0, '体育场', '2019-09-25 19:21:29', '2019-09-25 19:21:29', 30, 0, '男子800m跑', 1);
INSERT INTO `project` VALUES (54, '男子3000m跑', 0, 1, 0, '体育场', '2019-09-25 19:21:47', '2019-09-25 19:21:47', 30, 0, '男子3000m跑', 1);
INSERT INTO `project` VALUES (55, '男子100m跨栏', 0, 1, 0, '体育场', '2019-09-25 19:22:30', '2019-09-25 19:22:30', 30, 0, '男子100m跨栏', 1);
INSERT INTO `project` VALUES (56, '女子100m跨栏', 0, 1, 1, '体育场', '2019-09-25 19:23:01', '2019-09-25 19:23:01', 30, 0, '女子100m跨栏', 1);
INSERT INTO `project` VALUES (57, '男子4x100接力', 0, 1, 0, '体育场', '2019-09-25 19:23:46', '2019-09-25 19:23:46', 30, 1, '男子4x100接力', 1);
INSERT INTO `project` VALUES (58, '女子4x100接力', 0, 1, 1, '体育场', '2019-09-25 19:24:05', '2019-09-25 19:24:05', 30, 1, '女子4x100接力', 1);
INSERT INTO `project` VALUES (59, '女子跳高', 1, 0, 1, '体育场', '2019-09-25 19:24:55', '2019-09-25 19:24:55', 30, 0, '女子跳高', 1);
INSERT INTO `project` VALUES (62, '男子跳远', 1, 0, 0, '体育场', '2019-10-02 12:24:00', '2019-10-02 12:25:00', NULL, 0, '男子跳远', 1);
INSERT INTO `project` VALUES (67, '女子跳远', 0, 0, 1, '体育场', '2019-10-02 18:14:00', '2019-10-02 18:14:00', NULL, 0, '女子跳远', 1);
INSERT INTO `project` VALUES (71, '团体比赛1', 0, 0, 0, '体育场', '2019-10-17 14:24:00', '2019-10-20 14:20:00', NULL, 1, '哈哈哈哈哈', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ADMIN', '管理员', 1);
INSERT INTO `role` VALUES (3, 'USER', '用户', 1);
INSERT INTO `role` VALUES (4, 'ATHLETE', '运动员', 1);

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `team_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '团队编号',
  `project_id` int(11) NULL DEFAULT NULL,
  `score` double NULL DEFAULT 0,
  `rank` int(11) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `team_num`(`team_num`) USING BTREE,
  UNIQUE INDEX `team_num_2`(`team_num`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `team_num_3`(`team_num`) USING BTREE,
  UNIQUE INDEX `name_2`(`name`) USING BTREE,
  UNIQUE INDEX `team_num_4`(`team_num`) USING BTREE,
  UNIQUE INDEX `name_3`(`name`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (4, 'A团队111', '123111', 57, 0, 2, 1);
INSERT INTO `team` VALUES (5, 'B团队', '345', 58, 10.22, 2, 1);
INSERT INTO `team` VALUES (7, 'C团队', '111', 58, 22.1, 3, 1);
INSERT INTO `team` VALUES (8, 'D团队', '222', 58, 5.25, 1, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$B/MGao9ZHWZyU9DA9zhHJun4v50BtY5d340I7kzKRNK/QsoiezWL2', 0, 21, '13777777777', '123@qq.com', 1);
INSERT INTO `user` VALUES (39, '111', '$2a$10$z7Eek7iFYtosO2sWumJse.EzL1DNUTkIDkEhVCit9C7GyrkWZXUl6', 0, 99, '13777777777', '123456@163.com', 1);
INSERT INTO `user` VALUES (41, '222', '$2a$10$eenACG4a5wtxiYup5eDJ7ePMpN/goCxP1ZtZPi5DQ9JE2.NIgl7n6', 0, 11, '13777777777', '1234567@163.com', 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (28, 41, 3, 1);
INSERT INTO `user_role` VALUES (29, 41, 4, 1);
INSERT INTO `user_role` VALUES (33, 39, 3, 1);
INSERT INTO `user_role` VALUES (34, 39, 4, 1);
INSERT INTO `user_role` VALUES (35, 1, 1, 1);
INSERT INTO `user_role` VALUES (36, 1, 3, 1);
INSERT INTO `user_role` VALUES (37, 1, 4, 1);

SET FOREIGN_KEY_CHECKS = 1;
