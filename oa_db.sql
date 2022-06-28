/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : oa_db

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 28/06/2022 11:03:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_check
-- ----------------------------
DROP TABLE IF EXISTS `sys_check`;
CREATE TABLE `sys_check`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `check_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核编号',
  `work_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核人员工号',
  `check_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_work_id_in_sys_check`(`work_id`) USING BTREE,
  CONSTRAINT `fk_work_id_in_sys_check` FOREIGN KEY (`work_id`) REFERENCES `sys_employee` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_check
-- ----------------------------
INSERT INTO `sys_check` VALUES (9, '5053551853382735', '001', '回家小心', '2021-11-06 19:07:38', '2021-11-06 19:07:38');
INSERT INTO `sys_check` VALUES (10, '9272370904104360', '001', '同意', '2021-11-06 21:18:33', '2021-11-06 21:18:33');
INSERT INTO `sys_check` VALUES (11, '2787142316438501', '0044', 'tongyi', '2022-01-07 15:37:41', '2022-01-07 15:37:41');

-- ----------------------------
-- Table structure for sys_check_on
-- ----------------------------
DROP TABLE IF EXISTS `sys_check_on`;
CREATE TABLE `sys_check_on`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增索引',
  `check_on_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考勤编号',
  `check_on_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '考勤时间',
  `work_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `is_late` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否迟到',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_work_id_in_sys_check_on`(`work_id`) USING BTREE,
  CONSTRAINT `fk_work_id_in_sys_check_on` FOREIGN KEY (`work_id`) REFERENCES `sys_employee` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_check_on
-- ----------------------------
INSERT INTO `sys_check_on` VALUES (1, '00220211107195516', '2021-11-07 11:55:17', '002', '迟到', '2021-11-07 19:55:16', '2021-11-07 19:55:16');
INSERT INTO `sys_check_on` VALUES (2, '00220211107210024', '2021-11-07 13:00:25', '002', '迟到', '2021-11-07 21:00:24', '2021-11-07 21:00:24');
INSERT INTO `sys_check_on` VALUES (3, '00220211109132946', '2021-11-09 05:29:46', '002', '迟到', '2021-11-09 13:29:46', '2021-11-09 13:29:46');
INSERT INTO `sys_check_on` VALUES (4, '00720211118170519', '2021-11-18 09:05:19', '007', '迟到', '2021-11-18 17:05:19', '2021-11-18 17:05:19');
INSERT INTO `sys_check_on` VALUES (5, '005020211219082320', '2021-12-19 00:23:20', '0050', '迟到', '2021-12-19 08:23:21', '2021-12-19 08:23:21');
INSERT INTO `sys_check_on` VALUES (6, '00220220105174810', '2022-01-05 09:48:10', '002', '迟到', '2022-01-05 17:48:10', '2022-01-05 17:48:10');
INSERT INTO `sys_check_on` VALUES (7, '003320220107155140', '2022-01-07 07:51:41', '0033', '迟到', '2022-01-07 15:51:41', '2022-01-07 15:51:41');
INSERT INTO `sys_check_on` VALUES (8, '004420220107202100', '2022-01-07 12:21:00', '0044', '迟到', '2022-01-07 20:21:00', '2022-01-07 20:21:00');
INSERT INTO `sys_check_on` VALUES (9, '00220211008019238', '2021-10-08 08:31:50', '002', '准时', '2022-01-07 22:32:47', '2022-01-07 22:32:47');
INSERT INTO `sys_check_on` VALUES (10, '00220211009019239', '2021-10-09 08:33:27', '002', '准时', '2022-01-07 22:33:41', '2022-01-07 22:34:23');
INSERT INTO `sys_check_on` VALUES (11, '00220211010023891', '2021-10-10 08:00:00', '002', '准时', '2022-01-07 22:34:17', '2022-01-07 22:34:17');
INSERT INTO `sys_check_on` VALUES (12, '00220211011023345', '2021-10-11 09:10:00', '002', '准时', '2022-01-07 22:36:47', '2022-01-07 22:36:47');
INSERT INTO `sys_check_on` VALUES (13, '00220211012023456', '2021-10-12 08:32:10', '002', '准时', '2022-01-07 22:40:52', '2022-01-07 22:40:52');
INSERT INTO `sys_check_on` VALUES (14, '00220211013024785', '2021-10-13 08:00:00', '002', '准时', '2022-01-07 22:41:25', '2022-01-07 22:41:25');
INSERT INTO `sys_check_on` VALUES (15, '00220211014096532', '2021-10-14 09:05:00', '002', '准时', '2022-01-07 22:41:55', '2022-01-07 22:41:55');
INSERT INTO `sys_check_on` VALUES (16, '00220211015096532', '2021-10-15 08:23:35', '002', '准时', '2022-01-07 22:44:42', '2022-01-07 22:44:42');
INSERT INTO `sys_check_on` VALUES (17, '00220211016097234', '2021-10-16 08:00:00', '002', '准时', '2022-01-07 22:45:25', '2022-01-07 22:45:25');
INSERT INTO `sys_check_on` VALUES (18, '00220211017098732', '2021-10-17 08:00:00', '002', '准时', '2022-01-07 22:45:58', '2022-01-07 22:46:50');
INSERT INTO `sys_check_on` VALUES (19, '00220211018890456', '2021-10-18 09:32:17', '002', '准时', '2022-01-07 22:46:43', '2022-01-07 22:46:43');
INSERT INTO `sys_check_on` VALUES (20, '00220211019809023', '2021-10-19 09:00:00', '002', '准时', '2022-01-07 22:49:55', '2022-01-07 22:49:55');
INSERT INTO `sys_check_on` VALUES (21, '00220211020897865', '2021-10-20 08:23:32', '002', '准时', '2022-01-07 22:50:30', '2022-01-07 22:50:30');
INSERT INTO `sys_check_on` VALUES (22, '00220211021473826', '2021-10-21 09:30:32', '002', '准时', '2022-01-07 22:50:56', '2022-01-07 22:50:56');
INSERT INTO `sys_check_on` VALUES (23, '00220211022894378', '2021-10-22 08:35:00', '002', '准时', '2022-01-07 22:51:45', '2022-01-07 22:51:45');
INSERT INTO `sys_check_on` VALUES (24, '00220211023897856', '2021-10-23 09:00:00', '002', '准时', '2022-01-07 22:52:41', '2022-01-07 22:52:41');
INSERT INTO `sys_check_on` VALUES (25, '00220211024786756', '2021-10-24 08:56:50', '002', '准时', '2022-01-07 22:53:14', '2022-01-07 22:53:14');
INSERT INTO `sys_check_on` VALUES (26, '00220211025787832', '2021-10-25 08:00:00', '002', '准时', '2022-01-07 23:40:58', '2022-01-07 23:40:58');
INSERT INTO `sys_check_on` VALUES (27, '00220211026797423', '2021-10-26 09:00:00', '002', '准时', '2022-01-07 23:41:47', '2022-01-07 23:41:47');
INSERT INTO `sys_check_on` VALUES (28, '00220211027898989', '2021-10-27 09:20:00', '002', '准时', '2022-01-07 23:42:17', '2022-01-07 23:42:17');

-- ----------------------------
-- Table structure for sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee`;
CREATE TABLE `sys_employee`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增索引',
  `work_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `fullname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `telephone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `no_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '在职' COMMENT '在职状态',
  `money` double NULL DEFAULT NULL COMMENT '薪资',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `work_id`(`work_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_employee
-- ----------------------------
INSERT INTO `sys_employee` VALUES (1, '001', '苏庆珍', '女', '汉', '13097746782', '450106196911291027', '广西南宁市西乡塘区华东路40号', '在职', 20000, '2021-10-22 14:13:05', '2021-11-09 14:31:02');
INSERT INTO `sys_employee` VALUES (2, '002', '李想', '男', '汉', '13457737872', '450106199910231019', '广西南宁市兴宁区民乐路30号', '在职', 8000, '2021-10-22 14:14:15', '2021-11-18 16:55:01');
INSERT INTO `sys_employee` VALUES (16, '003', '李浩', '男', '汉', '18172374801', '450106199710231019', '广西南宁市西乡塘区华强路82号', '在职', 12344, '2021-10-26 13:41:18', '2021-11-18 17:03:38');
INSERT INTO `sys_employee` VALUES (19, '0038', '河洛', '男', '汉', '18172374801', '450103199010201053', '广西南宁市西乡塘区华强路95号', '在职', 5500, '2021-10-26 17:07:39', '2021-11-09 14:31:27');
INSERT INTO `sys_employee` VALUES (20, '0039', '何进', '男', '满', '13097746782', '450103198810271019', '南宁', '在职', 4000, '2021-10-26 17:18:48', '2021-11-09 14:31:30');
INSERT INTO `sys_employee` VALUES (21, '007', '王五郎', '男', '满', '13097746782', '451018198011231019', '北京市海淀区中关村30号', '在职', 3000, '2021-11-16 13:40:36', '2022-01-07 20:10:47');
INSERT INTO `sys_employee` VALUES (22, '0050', '王祥二', '男', '汉', '13097746782', '460100198910111023', '广西梧州市万秀区富民1路', '在职', 4000, '2021-12-19 08:22:51', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (23, '0040', '张新方', '男', '汉', '13605432213', '450106199805201013', '海南海口市美兰区85号', '在职', 3500, '2022-01-06 16:04:45', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (24, '0052', '毛鑫', '女', '朝鲜', '14005422212', '450127199012210227', '吉林省通化', '在职', 4500, '2022-01-06 16:11:15', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (25, '0123', '吴俊杰', '男', '汉', '13378602235', '450106198406011033', '南宁市兴宁区民乐路85号', '在职', 6500, '2022-01-06 16:17:13', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (26, '6513', '史俊芳', '女', '苗', '13978522356', '451240198510241021', '南宁市青秀区中泰路80号', '在职', 2000, '2022-01-06 16:21:46', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (27, '0099', '方孝宏', '男', '汉', '13878422621', '450103198511261113', '湖南长沙市天心区河岸路40号', '在职', 4000, '2022-01-06 20:49:10', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (28, '0044', '崔潇湘', '女', '满', '13765321278', '450423198908231227', '内蒙古呼和浩特市正黄旗大道1号', '在职', 2000, '2022-01-06 20:56:10', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (29, '0109', '李浩然', '男', '汉', '13765327672', '450103199210241011', '北京昌平区延庆路202号', '在职', 5000, '2022-01-06 21:03:37', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (30, '0100', '刘宇飞', '男', '壮', '18092416782', '452327199011011335', '广西南宁市武鸣区那考村', '在职', 4923, '2022-01-06 22:17:44', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (31, '0070', '王孝杰', '男', '汉', '15274927002', '454011199510221017', '广东广州市天河区天河大道90号', '在职', 4520, '2022-01-06 22:27:32', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (32, '0029', '张鑫悦', '女', '白', '16331227983', '421300199910231045', '四川省成都市天府区衡阳路90号', '在职', 3070, '2022-01-06 22:29:52', '2022-01-07 20:10:48');
INSERT INTO `sys_employee` VALUES (33, '0033', '测试账号', '男', '汉', '18172374801', '450106199910251019', '广西梧州市富民路', '在职', 7100, '2022-01-06 22:31:39', '2022-01-07 20:29:38');

-- ----------------------------
-- Table structure for sys_increasing_money
-- ----------------------------
DROP TABLE IF EXISTS `sys_increasing_money`;
CREATE TABLE `sys_increasing_money`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增索引',
  `increasing_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '涨薪申请编号',
  `work_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工工号',
  `office` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请时间',
  `increasing_money` double NULL DEFAULT NULL COMMENT '申请涨薪大小',
  `apply_status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未审核' COMMENT '上级审批情况',
  `money_office_status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未审核' COMMENT '财务部门审批情况',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_work_id_in_sys_increasing_money`(`work_id`) USING BTREE,
  INDEX `fk_office_in_sys_increasing`(`office`) USING BTREE,
  CONSTRAINT `fk_office_in_sys_increasing` FOREIGN KEY (`office`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_id_in_sys_increasing_money` FOREIGN KEY (`work_id`) REFERENCES `sys_employee` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_increasing_money
-- ----------------------------
INSERT INTO `sys_increasing_money` VALUES (1, '202111131341002119', '002', '001', '2021-11-13', 8000, '通过', '通过', '2021-11-13 13:43:28', '2021-11-18 16:55:01');
INSERT INTO `sys_increasing_money` VALUES (4, '202111131520003846', '003', '001', '2021-11-13', 12344, '通过', '未审核', '2021-11-13 15:20:47', '2021-12-25 21:46:28');
INSERT INTO `sys_increasing_money` VALUES (5, '2022010700000033110', '0033', '006', '2022-01-06', 7100, '通过', '通过', '2022-01-07 20:11:20', '2022-01-07 20:29:38');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `url` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'url路径',
  `path` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能名',
  `menu_icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能图标',
  `menu_father` bigint(0) NULL DEFAULT NULL COMMENT '父级功能编号',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_menu_father_in_sys_menu`(`menu_father`) USING BTREE,
  CONSTRAINT `fk_menu_father_in_sys_menu` FOREIGN KEY (`menu_father`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, '/home', '/home', 'Home', '个人信息', 'el-icon-user', NULL, '2021-10-18 13:55:39', '2021-10-19 17:01:15');
INSERT INTO `sys_menu` VALUES (3, '/dashboard', '/dashboard', 'Dashboard', '自述文件', 'el-icon-user', 2, '2021-10-19 15:21:56', '2021-10-19 15:21:56');
INSERT INTO `sys_menu` VALUES (4, '/infoList', '/home', 'Home', '员工管理', 'el-icon-document', NULL, '2021-10-19 16:27:30', '2021-10-19 20:13:09');
INSERT INTO `sys_menu` VALUES (6, '/infoList', '/infoList', 'infoList', '员工列表', 'el-icon-document', 4, '2021-10-19 20:16:15', '2021-10-19 20:18:53');
INSERT INTO `sys_menu` VALUES (7, '/bussinessList', '/home', 'Home', '业务办理', 'el-icon-s-order', NULL, '2021-10-26 15:10:31', '2021-10-26 15:21:09');
INSERT INTO `sys_menu` VALUES (8, '/bussinessList', '/resignApply', 'resignApply', '离职申请', 'el-icon-circle-close', 7, '2021-10-26 15:23:51', '2021-10-26 15:23:51');
INSERT INTO `sys_menu` VALUES (9, '/infoList', '/resignCheck', 'resignCheck', '离职审批', 'el-icon-document', 4, '2021-10-26 17:21:31', '2021-10-26 17:21:31');
INSERT INTO `sys_menu` VALUES (10, '/businessList', '/vacationApply', 'vacationApply', '请假申请', 'el-icon-s-order', 7, '2021-11-02 15:21:17', '2022-01-07 19:26:58');
INSERT INTO `sys_menu` VALUES (11, '/infoList', '/vacationCheck', 'vacationCheck', '请假审批', 'el-icon-document', 4, '2021-11-02 15:24:00', '2022-01-07 19:29:21');
INSERT INTO `sys_menu` VALUES (12, '/home', '/home', 'Home', '请假信息详情', 'el-icon-time', NULL, '2021-11-03 19:50:35', '2022-01-07 19:35:45');
INSERT INTO `sys_menu` VALUES (13, '/vacationList', '/vacationList', 'vacationList', '请假列表', 'el-icon-time', 12, '2021-11-03 19:53:14', '2022-01-07 19:35:45');
INSERT INTO `sys_menu` VALUES (14, '/home', '/home', 'Home', '日常考勤', 'el-icon-s-ticket', NULL, '2021-11-06 21:57:31', '2022-01-07 19:33:51');
INSERT INTO `sys_menu` VALUES (15, '/checkOnList', '/checkOn', 'checkOn', '在线考勤', 'el-icon-s-ticket', 14, '2021-11-06 22:00:56', '2022-01-07 19:33:51');
INSERT INTO `sys_menu` VALUES (17, '/businessList', '/increasingList', 'increasingList', '涨薪申请', 'el-icon-s-order', 7, '2021-11-09 12:51:47', '2022-01-07 19:26:58');
INSERT INTO `sys_menu` VALUES (18, '/increasingList', '/increasingCheck', 'increasingCheck', '涨薪审批', 'el-icon-document', 4, '2021-11-13 15:45:55', '2022-01-07 19:29:20');
INSERT INTO `sys_menu` VALUES (19, '/home', 'home', 'Home', '薪资管理', 'el-icon-s-finance', NULL, '2021-11-16 13:37:45', '2022-01-07 19:33:51');
INSERT INTO `sys_menu` VALUES (20, '/increasingList', '/increasingMoneyOfficeCheck', 'increasingMoneyOfficeCheck', '财务部门审批', 'el-icon-s-finance', 19, '2021-11-16 13:46:22', '2022-01-07 19:33:51');
INSERT INTO `sys_menu` VALUES (21, '/performanceList', '/home', 'Home', '绩效管理', 'el-icon-s-check', NULL, '2021-11-25 13:20:27', '2022-01-07 19:35:45');
INSERT INTO `sys_menu` VALUES (22, '/performanceList', '/perormanceList', 'performanceList', '个人绩效查看', 'el-icon-s-check', 21, '2021-11-25 13:20:38', '2022-01-07 19:35:45');
INSERT INTO `sys_menu` VALUES (23, '/performanceList', '/performanceReCheck', 'performanceReCheck', '个人绩效复核', 'el-icon-s-check', 21, '2021-11-25 13:25:01', '2022-01-07 19:35:45');

-- ----------------------------
-- Table structure for sys_performance
-- ----------------------------
DROP TABLE IF EXISTS `sys_performance`;
CREATE TABLE `sys_performance`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `performance_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '绩效考核编号',
  `work_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工工号',
  `office` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `apply_date` date NULL DEFAULT NULL COMMENT '申请日期',
  `check_on_day` int(0) NULL DEFAULT NULL COMMENT '考勤天数总计',
  `check_on_percent` double NULL DEFAULT NULL COMMENT '考勤天数占总月分百分比',
  `performance_status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通过考核',
  `is_re_check` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否申请复核',
  `re_check_status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未审核' COMMENT '复核状态',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_work_id_in_sys_performance`(`work_id`) USING BTREE,
  INDEX `fk_office_in_sys_performance`(`office`) USING BTREE,
  CONSTRAINT `fk_office_in_sys_performance` FOREIGN KEY (`office`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_id_in_sys_performance` FOREIGN KEY (`work_id`) REFERENCES `sys_employee` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_performance
-- ----------------------------
INSERT INTO `sys_performance` VALUES (1, '202111251825002', '002', '001', '2021-09-01', 20, 0.66, '通过', NULL, '未审核', '2021-11-25 18:26:29', '2022-01-07 23:08:09');
INSERT INTO `sys_performance` VALUES (5, '20211127153547002', '002', '001', '2021-11-30', 10, 0.33, '未通过', '是', '未审核', '2021-11-27 15:35:48', '2022-01-07 23:08:15');
INSERT INTO `sys_performance` VALUES (15, '20220107234244002', '002', '001', '2021-10-31', 20, 0.64, '通过', NULL, '未审核', '2022-01-07 23:42:44', '2022-01-07 23:43:16');

-- ----------------------------
-- Table structure for sys_report
-- ----------------------------
DROP TABLE IF EXISTS `sys_report`;
CREATE TABLE `sys_report`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `vacation_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '假单编号',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '放假中' COMMENT '销假状态',
  `report_time` datetime(0) NULL DEFAULT NULL COMMENT '销假时间',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_vacation_id_in_sys_report`(`vacation_id`) USING BTREE,
  CONSTRAINT `fk_vacation_id_in_sys_report` FOREIGN KEY (`vacation_id`) REFERENCES `sys_vacation` (`vacation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_report
-- ----------------------------
INSERT INTO `sys_report` VALUES (2, '00220211102163740375', '销假', '2021-11-06 12:45:58', '2021-11-06 19:07:38', '2021-11-06 20:45:58');
INSERT INTO `sys_report` VALUES (3, '00220211106211752367', '销假', '2021-11-06 13:31:20', '2021-11-06 21:18:33', '2021-11-06 21:31:19');
INSERT INTO `sys_report` VALUES (4, '003320220107133847641', '销假', '2022-01-07 10:51:53', '2022-01-07 15:37:42', '2022-01-07 18:51:53');

-- ----------------------------
-- Table structure for sys_resign
-- ----------------------------
DROP TABLE IF EXISTS `sys_resign`;
CREATE TABLE `sys_resign`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增索引',
  `resign_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请编号',
  `work_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工工号',
  `office` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '离职原因',
  `apply_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '申请时间',
  `apply_doc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请附件',
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未审核' COMMENT '审核状态',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_work_id_in_sys_employee`(`work_id`) USING BTREE,
  INDEX `fk_office_in_sys_resign`(`office`) USING BTREE,
  CONSTRAINT `fk_office_in_sys_resign` FOREIGN KEY (`office`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_id_in_sys_employee` FOREIGN KEY (`work_id`) REFERENCES `sys_employee` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resign
-- ----------------------------
INSERT INTO `sys_resign` VALUES (1, '00220211101165236', '002', '001', '回家', '2021-11-01 08:49:29', NULL, '未审核', '2021-11-02 13:57:08', '2021-11-02 13:57:08');
INSERT INTO `sys_resign` VALUES (2, '003820211102135648', '0038', '002', '', '2021-11-02 05:55:59', NULL, '未审核', '2021-11-02 13:56:49', '2021-11-02 13:56:49');
INSERT INTO `sys_resign` VALUES (9, '003920211203153402', '0039', '002', '', '2020-11-01 16:03:15', 'Screenshot_2021-10-04-19-26-39-638_com.tencent.mm.jpg,Screenshot_2021-10-04-19-27-18-256_com.tencent.mm.jpg', '未审核', '2021-12-03 15:34:02', '2021-12-03 15:34:02');
INSERT INTO `sys_resign` VALUES (10, '005020211225212800', '0050', '002', '家中父母需要照顾，因此辞职回老家找工作', '2020-10-31 16:01:10', 'share_auto_2021_10_9_15_16_38.png', '未审核', '2021-12-25 21:28:00', '2021-12-25 21:28:00');
INSERT INTO `sys_resign` VALUES (11, '003320220107203131', '0033', '006', '生病', '2021-11-30 16:07:20', 'illust_75020758_20190609_231300.png', '未审核', '2022-01-07 20:31:31', '2022-01-07 20:31:31');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增索引',
  `role_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `father_role` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级角色',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `fk_role_id_in_sys_role`(`father_role`) USING BTREE,
  CONSTRAINT `fk_role_id_in_sys_role` FOREIGN KEY (`father_role`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '001', '经理', NULL, '2021-10-11 20:24:42', '2021-10-26 14:48:44');
INSERT INTO `sys_role` VALUES (2, '002', '人事部门主管', '001', '2021-10-11 20:25:11', '2021-10-26 15:38:10');
INSERT INTO `sys_role` VALUES (3, '003', '销售部门主管', '001', '2021-10-26 14:49:00', '2021-10-26 15:38:13');
INSERT INTO `sys_role` VALUES (4, '004', '财务部门主管', '001', '2021-10-26 14:49:15', '2021-10-26 15:38:15');
INSERT INTO `sys_role` VALUES (5, '005', '美术部门主管', '001', '2021-10-26 14:49:26', '2021-10-26 15:38:18');
INSERT INTO `sys_role` VALUES (6, '006', '策划部门主管', '001', '2021-10-26 14:50:30', '2021-10-26 15:38:20');
INSERT INTO `sys_role` VALUES (7, '007', '人事部门员工', '002', '2021-10-26 14:51:37', '2021-10-26 15:38:27');
INSERT INTO `sys_role` VALUES (8, '008', '销售部门员工', '003', '2021-10-26 14:51:49', '2021-10-26 15:38:30');
INSERT INTO `sys_role` VALUES (9, '009', '财务部门员工', '004', '2021-10-26 14:52:07', '2021-10-26 15:38:33');
INSERT INTO `sys_role` VALUES (10, '010', '美术部门员工', '005', '2021-10-26 14:52:18', '2021-10-26 15:38:37');
INSERT INTO `sys_role` VALUES (11, '011', '策划部门员工', '006', '2021-10-26 14:52:28', '2021-10-26 15:38:44');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `role_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `menu_id` bigint(0) NOT NULL COMMENT '功能编号',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_menu_id_in_sys_role_men`(`menu_id`) USING BTREE,
  INDEX `fk_role_id_in_sys_role_menu`(`role_id`) USING BTREE,
  CONSTRAINT `fk_menu_id_in_sys_role_men` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_id_in_sys_role_menu` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 175 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (8, '001', 2, '2021-10-18 13:56:38', '2021-10-18 13:56:38');
INSERT INTO `sys_role_menu` VALUES (9, '002', 2, '2021-10-18 13:56:46', '2021-10-18 13:56:46');
INSERT INTO `sys_role_menu` VALUES (10, '001', 3, '2021-10-19 15:22:08', '2021-10-19 15:22:08');
INSERT INTO `sys_role_menu` VALUES (11, '002', 3, '2021-10-19 15:22:17', '2021-10-19 15:22:17');
INSERT INTO `sys_role_menu` VALUES (12, '001', 4, '2021-10-19 16:34:46', '2021-10-19 16:35:01');
INSERT INTO `sys_role_menu` VALUES (13, '002', 4, '2021-10-19 17:10:55', '2021-10-19 17:10:55');
INSERT INTO `sys_role_menu` VALUES (15, '001', 6, '2021-10-19 20:16:38', '2021-10-19 20:16:38');
INSERT INTO `sys_role_menu` VALUES (16, '003', 2, '2021-10-26 14:54:51', '2021-10-26 14:54:51');
INSERT INTO `sys_role_menu` VALUES (17, '004', 2, '2021-10-26 14:55:00', '2021-10-26 14:55:00');
INSERT INTO `sys_role_menu` VALUES (18, '005', 2, '2021-10-26 14:55:08', '2021-10-26 14:55:08');
INSERT INTO `sys_role_menu` VALUES (19, '006', 2, '2021-10-26 14:55:15', '2021-10-26 14:55:15');
INSERT INTO `sys_role_menu` VALUES (20, '007', 2, '2021-10-26 14:55:21', '2021-10-26 14:55:21');
INSERT INTO `sys_role_menu` VALUES (21, '008', 2, '2021-10-26 14:55:29', '2021-10-26 14:55:29');
INSERT INTO `sys_role_menu` VALUES (22, '009', 2, '2021-10-26 14:55:38', '2021-10-26 14:55:38');
INSERT INTO `sys_role_menu` VALUES (23, '003', 3, '2021-10-26 15:04:49', '2021-10-26 15:04:49');
INSERT INTO `sys_role_menu` VALUES (24, '004', 3, '2021-10-26 15:04:52', '2021-10-26 15:04:52');
INSERT INTO `sys_role_menu` VALUES (25, '005', 3, '2021-10-26 15:04:55', '2021-10-26 15:04:55');
INSERT INTO `sys_role_menu` VALUES (26, '006', 3, '2021-10-26 15:04:59', '2021-10-26 15:04:59');
INSERT INTO `sys_role_menu` VALUES (27, '007', 3, '2021-10-26 15:05:02', '2021-10-26 15:05:02');
INSERT INTO `sys_role_menu` VALUES (28, '008', 3, '2021-10-26 15:05:06', '2021-10-26 15:05:06');
INSERT INTO `sys_role_menu` VALUES (29, '009', 3, '2021-10-26 15:05:13', '2021-10-26 15:05:13');
INSERT INTO `sys_role_menu` VALUES (30, '002', 7, '2021-10-26 15:10:58', '2021-10-26 15:10:58');
INSERT INTO `sys_role_menu` VALUES (31, '003', 7, '2021-10-26 15:11:01', '2021-10-26 15:11:01');
INSERT INTO `sys_role_menu` VALUES (32, '004', 7, '2021-10-26 15:11:04', '2021-10-26 15:11:04');
INSERT INTO `sys_role_menu` VALUES (33, '005', 7, '2021-10-26 15:11:08', '2021-10-26 15:11:08');
INSERT INTO `sys_role_menu` VALUES (34, '006', 7, '2021-10-26 15:11:10', '2021-10-26 15:11:10');
INSERT INTO `sys_role_menu` VALUES (35, '008', 7, '2021-10-26 15:11:14', '2021-10-26 15:11:14');
INSERT INTO `sys_role_menu` VALUES (36, '009', 7, '2021-10-26 15:11:21', '2021-10-26 15:11:21');
INSERT INTO `sys_role_menu` VALUES (37, '002', 8, '2021-10-26 15:24:10', '2021-10-26 15:24:10');
INSERT INTO `sys_role_menu` VALUES (38, '003', 8, '2021-10-26 15:24:14', '2021-10-26 15:24:14');
INSERT INTO `sys_role_menu` VALUES (39, '004', 8, '2021-10-26 15:24:23', '2021-10-26 15:24:23');
INSERT INTO `sys_role_menu` VALUES (40, '005', 8, '2021-10-26 15:24:27', '2021-10-26 15:24:27');
INSERT INTO `sys_role_menu` VALUES (41, '006', 8, '2021-10-26 15:24:31', '2021-10-26 15:24:31');
INSERT INTO `sys_role_menu` VALUES (42, '007', 8, '2021-10-26 15:24:41', '2021-10-26 15:24:41');
INSERT INTO `sys_role_menu` VALUES (43, '009', 8, '2021-10-26 15:24:44', '2021-10-26 15:24:44');
INSERT INTO `sys_role_menu` VALUES (44, '002', 6, '2021-10-26 15:31:14', '2021-10-26 15:31:14');
INSERT INTO `sys_role_menu` VALUES (45, '001', 9, '2021-10-26 17:21:55', '2021-10-26 17:21:55');
INSERT INTO `sys_role_menu` VALUES (46, '002', 9, '2021-10-26 17:21:59', '2021-10-26 17:21:59');
INSERT INTO `sys_role_menu` VALUES (47, '003', 9, '2021-10-26 17:22:02', '2021-10-26 17:22:02');
INSERT INTO `sys_role_menu` VALUES (48, '004', 9, '2021-10-26 17:22:11', '2021-10-26 17:22:11');
INSERT INTO `sys_role_menu` VALUES (49, '005', 9, '2021-10-26 17:22:15', '2021-10-26 17:22:15');
INSERT INTO `sys_role_menu` VALUES (50, '006', 9, '2021-10-26 17:22:18', '2021-10-26 17:22:18');
INSERT INTO `sys_role_menu` VALUES (51, '002', 10, '2021-11-02 15:21:54', '2021-11-02 15:21:54');
INSERT INTO `sys_role_menu` VALUES (52, '003', 10, '2021-11-02 15:21:59', '2021-11-02 15:21:59');
INSERT INTO `sys_role_menu` VALUES (53, '004', 10, '2021-11-02 15:22:03', '2021-11-02 15:22:03');
INSERT INTO `sys_role_menu` VALUES (54, '005', 10, '2021-11-02 15:22:05', '2021-11-02 15:22:05');
INSERT INTO `sys_role_menu` VALUES (55, '006', 10, '2021-11-02 15:22:08', '2021-11-02 15:22:08');
INSERT INTO `sys_role_menu` VALUES (56, '007', 10, '2021-11-02 15:22:11', '2021-11-02 15:22:11');
INSERT INTO `sys_role_menu` VALUES (57, '008', 10, '2021-11-02 15:22:14', '2021-11-02 15:22:14');
INSERT INTO `sys_role_menu` VALUES (58, '009', 10, '2021-11-02 15:22:17', '2021-11-02 15:22:17');
INSERT INTO `sys_role_menu` VALUES (59, '010', 10, '2021-11-02 15:22:25', '2021-11-02 15:22:25');
INSERT INTO `sys_role_menu` VALUES (60, '011', 10, '2021-11-02 15:22:30', '2021-11-02 15:22:30');
INSERT INTO `sys_role_menu` VALUES (61, '001', 11, '2021-11-02 15:24:12', '2021-11-02 15:24:12');
INSERT INTO `sys_role_menu` VALUES (62, '002', 11, '2021-11-02 15:24:15', '2021-11-02 15:24:15');
INSERT INTO `sys_role_menu` VALUES (63, '003', 11, '2021-11-02 15:24:17', '2021-11-02 15:24:17');
INSERT INTO `sys_role_menu` VALUES (64, '004', 11, '2021-11-02 15:24:20', '2021-11-02 15:24:20');
INSERT INTO `sys_role_menu` VALUES (65, '005', 11, '2021-11-02 15:24:22', '2021-11-02 15:24:22');
INSERT INTO `sys_role_menu` VALUES (66, '006', 11, '2021-11-02 15:24:26', '2021-11-02 15:24:26');
INSERT INTO `sys_role_menu` VALUES (67, '002', 12, '2021-11-03 19:50:55', '2021-11-03 19:50:55');
INSERT INTO `sys_role_menu` VALUES (68, '003', 12, '2021-11-03 19:50:58', '2021-11-03 19:50:58');
INSERT INTO `sys_role_menu` VALUES (69, '004', 12, '2021-11-03 19:51:02', '2021-11-03 19:51:02');
INSERT INTO `sys_role_menu` VALUES (70, '005', 12, '2021-11-03 19:51:06', '2021-11-03 19:51:06');
INSERT INTO `sys_role_menu` VALUES (71, '006', 12, '2021-11-03 19:51:10', '2021-11-03 19:51:10');
INSERT INTO `sys_role_menu` VALUES (72, '007', 12, '2021-11-03 19:51:14', '2021-11-03 19:51:14');
INSERT INTO `sys_role_menu` VALUES (73, '008', 12, '2021-11-03 19:51:17', '2021-11-03 19:51:17');
INSERT INTO `sys_role_menu` VALUES (74, '009', 12, '2021-11-03 19:51:20', '2021-11-03 19:51:20');
INSERT INTO `sys_role_menu` VALUES (75, '010', 12, '2021-11-03 19:51:24', '2021-11-03 19:51:24');
INSERT INTO `sys_role_menu` VALUES (76, '011', 12, '2021-11-03 19:51:27', '2021-11-03 19:51:27');
INSERT INTO `sys_role_menu` VALUES (77, '002', 13, '2021-11-03 19:53:22', '2021-11-03 19:53:22');
INSERT INTO `sys_role_menu` VALUES (78, '003', 13, '2021-11-03 19:53:25', '2021-11-03 19:53:25');
INSERT INTO `sys_role_menu` VALUES (79, '004', 13, '2021-11-03 19:53:28', '2021-11-03 19:53:28');
INSERT INTO `sys_role_menu` VALUES (80, '005', 13, '2021-11-03 19:53:31', '2021-11-03 19:53:31');
INSERT INTO `sys_role_menu` VALUES (81, '006', 13, '2021-11-03 19:53:33', '2021-11-03 19:53:33');
INSERT INTO `sys_role_menu` VALUES (82, '007', 13, '2021-11-03 19:53:37', '2021-11-03 19:53:37');
INSERT INTO `sys_role_menu` VALUES (83, '008', 13, '2021-11-03 19:53:40', '2021-11-03 19:53:40');
INSERT INTO `sys_role_menu` VALUES (84, '009', 13, '2021-11-03 19:53:43', '2021-11-03 19:53:43');
INSERT INTO `sys_role_menu` VALUES (85, '010', 13, '2021-11-03 19:53:46', '2021-11-03 19:53:46');
INSERT INTO `sys_role_menu` VALUES (86, '011', 13, '2021-11-03 19:53:52', '2021-11-03 19:53:52');
INSERT INTO `sys_role_menu` VALUES (87, '001', 14, '2021-11-06 21:57:55', '2021-11-06 21:57:55');
INSERT INTO `sys_role_menu` VALUES (88, '002', 14, '2021-11-06 21:58:01', '2021-11-06 21:58:01');
INSERT INTO `sys_role_menu` VALUES (89, '003', 14, '2021-11-06 21:58:04', '2021-11-06 21:58:04');
INSERT INTO `sys_role_menu` VALUES (90, '004', 14, '2021-11-06 21:58:10', '2021-11-06 21:58:10');
INSERT INTO `sys_role_menu` VALUES (91, '005', 14, '2021-11-06 21:58:13', '2021-11-06 21:58:13');
INSERT INTO `sys_role_menu` VALUES (92, '006', 14, '2021-11-06 21:58:16', '2021-11-06 21:58:16');
INSERT INTO `sys_role_menu` VALUES (93, '007', 14, '2021-11-06 21:58:19', '2021-11-06 21:58:19');
INSERT INTO `sys_role_menu` VALUES (94, '008', 14, '2021-11-06 21:58:21', '2021-11-06 21:58:21');
INSERT INTO `sys_role_menu` VALUES (95, '009', 14, '2021-11-06 21:58:25', '2021-11-06 21:58:25');
INSERT INTO `sys_role_menu` VALUES (96, '010', 14, '2021-11-06 21:58:27', '2021-11-06 21:58:27');
INSERT INTO `sys_role_menu` VALUES (97, '011', 14, '2021-11-06 21:58:32', '2021-11-06 21:58:32');
INSERT INTO `sys_role_menu` VALUES (98, '002', 15, '2021-11-06 22:01:14', '2021-11-06 22:01:14');
INSERT INTO `sys_role_menu` VALUES (99, '003', 15, '2021-11-06 22:01:16', '2021-11-06 22:01:16');
INSERT INTO `sys_role_menu` VALUES (100, '004', 15, '2021-11-06 22:01:19', '2021-11-06 22:01:19');
INSERT INTO `sys_role_menu` VALUES (101, '005', 15, '2021-11-06 22:01:22', '2021-11-06 22:01:22');
INSERT INTO `sys_role_menu` VALUES (102, '006', 15, '2021-11-06 22:01:25', '2021-11-06 22:01:25');
INSERT INTO `sys_role_menu` VALUES (103, '007', 15, '2021-11-06 22:01:27', '2021-11-06 22:01:27');
INSERT INTO `sys_role_menu` VALUES (104, '008', 15, '2021-11-06 22:01:30', '2021-11-06 22:01:30');
INSERT INTO `sys_role_menu` VALUES (105, '009', 15, '2021-11-06 22:01:33', '2021-11-06 22:01:33');
INSERT INTO `sys_role_menu` VALUES (106, '010', 15, '2021-11-06 22:01:36', '2021-11-06 22:01:36');
INSERT INTO `sys_role_menu` VALUES (107, '011', 15, '2021-11-06 22:01:40', '2021-11-06 22:01:40');
INSERT INTO `sys_role_menu` VALUES (117, '002', 17, '2021-11-09 12:52:09', '2021-11-09 12:52:09');
INSERT INTO `sys_role_menu` VALUES (118, '003', 17, '2021-11-09 12:52:14', '2021-11-09 12:52:14');
INSERT INTO `sys_role_menu` VALUES (119, '004', 17, '2021-11-09 12:52:45', '2021-11-09 12:52:45');
INSERT INTO `sys_role_menu` VALUES (120, '005', 17, '2021-11-09 12:52:48', '2021-11-09 12:52:48');
INSERT INTO `sys_role_menu` VALUES (121, '006', 17, '2021-11-09 12:52:51', '2021-11-09 12:52:51');
INSERT INTO `sys_role_menu` VALUES (122, '008', 17, '2021-11-09 12:52:54', '2021-11-09 12:52:54');
INSERT INTO `sys_role_menu` VALUES (123, '009', 17, '2021-11-09 12:53:01', '2021-11-09 12:53:01');
INSERT INTO `sys_role_menu` VALUES (124, '010', 17, '2021-11-09 12:53:05', '2021-11-09 12:53:05');
INSERT INTO `sys_role_menu` VALUES (125, '011', 17, '2021-11-09 12:53:09', '2021-11-09 12:53:09');
INSERT INTO `sys_role_menu` VALUES (126, '001', 18, '2021-11-13 15:56:23', '2021-11-13 15:56:23');
INSERT INTO `sys_role_menu` VALUES (127, '002', 18, '2021-11-13 15:56:26', '2021-11-13 15:56:26');
INSERT INTO `sys_role_menu` VALUES (128, '003', 18, '2021-11-13 15:56:29', '2021-11-13 15:56:29');
INSERT INTO `sys_role_menu` VALUES (129, '004', 18, '2021-11-13 15:56:31', '2021-11-13 15:56:31');
INSERT INTO `sys_role_menu` VALUES (130, '005', 18, '2021-11-13 15:56:34', '2021-11-13 15:56:34');
INSERT INTO `sys_role_menu` VALUES (131, '006', 18, '2021-11-13 15:56:37', '2021-11-13 15:56:37');
INSERT INTO `sys_role_menu` VALUES (133, '004', 19, '2021-11-16 13:37:49', '2021-11-16 13:37:49');
INSERT INTO `sys_role_menu` VALUES (134, '009', 19, '2021-11-16 13:38:00', '2021-11-16 13:38:00');
INSERT INTO `sys_role_menu` VALUES (135, '004', 20, '2021-11-16 13:46:39', '2021-11-16 13:46:39');
INSERT INTO `sys_role_menu` VALUES (136, '009', 20, '2021-11-16 13:46:45', '2021-11-16 13:46:45');
INSERT INTO `sys_role_menu` VALUES (137, '001', 21, '2021-11-25 13:25:42', '2021-11-25 13:25:42');
INSERT INTO `sys_role_menu` VALUES (138, '002', 21, '2021-11-25 13:25:45', '2021-11-25 13:25:49');
INSERT INTO `sys_role_menu` VALUES (139, '003', 21, '2021-11-25 13:25:53', '2021-11-25 13:25:53');
INSERT INTO `sys_role_menu` VALUES (140, '004', 21, '2021-11-25 13:25:55', '2021-11-25 13:25:55');
INSERT INTO `sys_role_menu` VALUES (141, '005', 21, '2021-11-25 13:25:57', '2021-11-25 13:25:57');
INSERT INTO `sys_role_menu` VALUES (142, '006', 21, '2021-11-25 13:26:00', '2021-11-25 13:26:00');
INSERT INTO `sys_role_menu` VALUES (143, '007', 21, '2021-11-25 13:26:02', '2021-11-25 13:26:02');
INSERT INTO `sys_role_menu` VALUES (144, '008', 21, '2021-11-25 13:26:05', '2021-11-25 13:26:05');
INSERT INTO `sys_role_menu` VALUES (145, '009', 21, '2021-11-25 13:26:08', '2021-11-25 13:26:08');
INSERT INTO `sys_role_menu` VALUES (146, '010', 21, '2021-11-25 13:26:17', '2021-11-25 13:26:17');
INSERT INTO `sys_role_menu` VALUES (147, '011', 21, '2021-11-25 13:26:19', '2021-11-25 13:26:19');
INSERT INTO `sys_role_menu` VALUES (148, '002', 22, '2021-11-25 13:26:31', '2021-11-25 13:26:31');
INSERT INTO `sys_role_menu` VALUES (149, '003', 22, '2021-11-25 13:26:33', '2021-11-25 13:26:33');
INSERT INTO `sys_role_menu` VALUES (150, '004', 22, '2021-11-25 13:26:38', '2021-11-25 13:26:38');
INSERT INTO `sys_role_menu` VALUES (151, '005', 22, '2021-11-25 13:26:41', '2021-11-25 13:26:41');
INSERT INTO `sys_role_menu` VALUES (152, '006', 22, '2021-11-25 13:26:43', '2021-11-25 13:26:43');
INSERT INTO `sys_role_menu` VALUES (153, '007', 22, '2021-11-25 13:26:46', '2021-11-25 13:26:46');
INSERT INTO `sys_role_menu` VALUES (154, '008', 22, '2021-11-25 13:26:48', '2021-11-25 13:26:48');
INSERT INTO `sys_role_menu` VALUES (155, '009', 22, '2021-11-25 13:26:53', '2021-11-25 13:26:53');
INSERT INTO `sys_role_menu` VALUES (156, '010', 22, '2021-11-25 13:26:56', '2021-11-25 13:26:56');
INSERT INTO `sys_role_menu` VALUES (157, '011', 22, '2021-11-25 13:26:58', '2021-11-25 13:26:58');
INSERT INTO `sys_role_menu` VALUES (158, '002', 23, '2021-11-25 13:27:04', '2021-11-25 13:27:04');
INSERT INTO `sys_role_menu` VALUES (159, '003', 23, '2021-11-25 13:27:08', '2021-11-25 13:27:08');
INSERT INTO `sys_role_menu` VALUES (160, '004', 23, '2021-11-25 13:27:11', '2021-11-25 13:27:11');
INSERT INTO `sys_role_menu` VALUES (161, '005', 23, '2021-11-25 13:27:15', '2021-11-25 13:27:15');
INSERT INTO `sys_role_menu` VALUES (162, '006', 23, '2021-11-25 13:27:17', '2021-11-25 13:27:17');
INSERT INTO `sys_role_menu` VALUES (163, '007', 23, '2021-11-25 13:27:20', '2021-11-25 13:27:20');
INSERT INTO `sys_role_menu` VALUES (164, '008', 23, '2021-11-25 13:27:23', '2021-11-25 13:27:23');
INSERT INTO `sys_role_menu` VALUES (165, '009', 23, '2021-11-25 13:27:25', '2021-11-25 13:27:25');
INSERT INTO `sys_role_menu` VALUES (166, '010', 23, '2021-11-25 13:27:29', '2021-11-25 13:27:29');
INSERT INTO `sys_role_menu` VALUES (167, '011', 23, '2021-11-25 13:27:31', '2021-11-25 13:27:31');
INSERT INTO `sys_role_menu` VALUES (168, '001', 23, '2021-11-30 12:39:18', '2021-11-30 12:39:18');
INSERT INTO `sys_role_menu` VALUES (169, '010', 2, '2022-01-06 22:37:21', '2022-01-06 22:37:21');
INSERT INTO `sys_role_menu` VALUES (170, '010', 2, '2022-01-06 22:37:21', '2022-01-06 22:37:21');
INSERT INTO `sys_role_menu` VALUES (171, '011', 2, '2022-01-06 22:37:31', '2022-01-06 22:37:31');
INSERT INTO `sys_role_menu` VALUES (172, '010', 3, '2022-01-06 22:37:35', '2022-01-06 22:37:35');
INSERT INTO `sys_role_menu` VALUES (173, '011', 3, '2022-01-06 22:37:40', '2022-01-06 22:37:40');
INSERT INTO `sys_role_menu` VALUES (174, '010', 8, '2022-01-07 19:25:29', '2022-01-07 19:25:29');
INSERT INTO `sys_role_menu` VALUES (175, '011', 8, '2022-01-07 19:25:29', '2022-01-07 19:25:29');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `work_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `fullname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真名',
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未注销' COMMENT '账号状态',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `fk_work_id_in_sys_user`(`work_id`) USING BTREE,
  CONSTRAINT `fk_work_id_in_sys_user` FOREIGN KEY (`work_id`) REFERENCES `sys_employee` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'a001', '12345', '001', '苏庆珍', '未注销', '2021-09-15 16:19:15', '2022-01-06 15:25:02');
INSERT INTO `sys_user` VALUES (2, 'li0034', '123456', '002', '李想', '未注销', '2021-10-11 20:24:28', '2021-11-02 13:45:06');
INSERT INTO `sys_user` VALUES (35, 'li3736', '123456', '003', '李浩', '未注销', '2021-10-26 13:41:18', '2021-10-26 13:41:18');
INSERT INTO `sys_user` VALUES (38, 'he0038', '123456', '0038', '河洛', '未注销', '2021-10-26 17:07:39', '2021-10-26 17:07:39');
INSERT INTO `sys_user` VALUES (39, 'he0039', '123456', '0039', '何进', '未注销', '2021-10-26 17:18:48', '2021-10-26 17:18:48');
INSERT INTO `sys_user` VALUES (40, 'wang0039', '123456', '007', '王五郎', '未注销', '2021-11-16 13:40:36', '2021-11-16 13:40:36');
INSERT INTO `sys_user` VALUES (41, 'li0040', '123456', '0050', '王祥二', '未注销', '2021-12-19 08:22:52', '2021-12-19 08:22:52');
INSERT INTO `sys_user` VALUES (42, 'zhang3347', 'lj19991025', '0040', '张新方', '未注销', '2022-01-06 16:04:45', '2022-01-06 16:04:45');
INSERT INTO `sys_user` VALUES (43, 'mao9958', 'mn9024@', '0052', '毛鑫', '未注销', '2022-01-06 16:11:15', '2022-01-06 16:11:15');
INSERT INTO `sys_user` VALUES (44, 'wu3321', 'wujunjie4396', '0123', '吴俊杰', '未注销', '2022-01-06 16:17:13', '2022-01-06 16:17:13');
INSERT INTO `sys_user` VALUES (45, 'shi6521', 'shihongru666', '6513', '史俊芳', '未注销', '2022-01-06 16:21:46', '2022-01-06 16:21:46');
INSERT INTO `sys_user` VALUES (46, 'fang0038', 'fxh4742', '0099', '方孝宏', '未注销', '2022-01-06 20:49:10', '2022-01-06 20:49:10');
INSERT INTO `sys_user` VALUES (47, 'cui0038', 'cxx4396', '0044', '崔潇湘', '未注销', '2022-01-06 20:56:10', '2022-01-06 20:56:10');
INSERT INTO `sys_user` VALUES (48, 'li0109', 'lhr88482410', '0109', '李浩然', '未注销', '2022-01-06 21:03:37', '2022-01-06 21:03:37');
INSERT INTO `sys_user` VALUES (49, 'liu3306', 'liuhaoranshitian', '0100', '刘宇飞', '未注销', '2022-01-06 22:17:45', '2022-01-06 22:17:45');
INSERT INTO `sys_user` VALUES (50, 'wang0070', 'mrwang0070', '0070', '王孝杰', '未注销', '2022-01-06 22:27:32', '2022-01-06 22:27:32');
INSERT INTO `sys_user` VALUES (51, 'zhang7742', 'zxy5453', '0029', '张鑫悦', '未注销', '2022-01-06 22:29:52', '2022-01-06 22:29:52');
INSERT INTO `sys_user` VALUES (52, 'test007', '123456', '0033', '测试账号', '未注销', '2022-01-06 22:31:39', '2022-01-06 22:31:39');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `role_id` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编号',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_username_in_sys_user_role`(`username`) USING BTREE,
  INDEX `fk_role_id_in_sys_user_role`(`role_id`) USING BTREE,
  CONSTRAINT `fk_role_id_in_sys_user_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_username_in_sys_user_role` FOREIGN KEY (`username`) REFERENCES `sys_user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, '001', 'a001', '2021-10-12 16:58:39', '2021-10-12 16:58:39');
INSERT INTO `sys_user_role` VALUES (2, '002', 'li0034', '2021-10-12 16:58:50', '2021-10-12 16:58:50');
INSERT INTO `sys_user_role` VALUES (3, '003', 'li3736', '2021-10-26 15:14:55', '2021-10-26 15:14:55');
INSERT INTO `sys_user_role` VALUES (4, '007', 'he0038', '2021-10-26 17:07:39', '2021-10-26 17:09:22');
INSERT INTO `sys_user_role` VALUES (5, '007', 'he0039', '2021-10-26 17:18:48', '2021-10-26 17:18:48');
INSERT INTO `sys_user_role` VALUES (6, '004', 'wang0039', '2021-11-16 13:40:36', '2021-11-16 13:40:36');
INSERT INTO `sys_user_role` VALUES (7, '007', 'li0040', '2021-12-19 08:22:52', '2021-12-19 08:22:52');
INSERT INTO `sys_user_role` VALUES (8, '011', 'zhang3347', '2022-01-06 16:04:45', '2022-01-06 16:04:45');
INSERT INTO `sys_user_role` VALUES (9, '008', 'mao9958', '2022-01-06 16:11:15', '2022-01-06 16:11:15');
INSERT INTO `sys_user_role` VALUES (10, '003', 'wu3321', '2022-01-06 16:17:13', '2022-01-06 16:17:13');
INSERT INTO `sys_user_role` VALUES (11, '008', 'shi6521', '2022-01-06 16:21:46', '2022-01-06 16:21:46');
INSERT INTO `sys_user_role` VALUES (12, '005', 'fang0038', '2022-01-06 20:49:10', '2022-01-06 20:49:10');
INSERT INTO `sys_user_role` VALUES (13, '006', 'cui0038', '2022-01-06 20:56:10', '2022-01-06 20:56:10');
INSERT INTO `sys_user_role` VALUES (14, '009', 'li0109', '2022-01-06 21:03:37', '2022-01-06 21:03:37');
INSERT INTO `sys_user_role` VALUES (15, '010', 'liu3306', '2022-01-06 22:17:45', '2022-01-06 22:17:45');
INSERT INTO `sys_user_role` VALUES (16, '010', 'wang0070', '2022-01-06 22:27:32', '2022-01-06 22:27:32');
INSERT INTO `sys_user_role` VALUES (17, '011', 'zhang7742', '2022-01-06 22:29:52', '2022-01-06 22:29:52');
INSERT INTO `sys_user_role` VALUES (18, '011', 'test007', '2022-01-06 22:31:39', '2022-01-06 22:31:39');

-- ----------------------------
-- Table structure for sys_vacation
-- ----------------------------
DROP TABLE IF EXISTS `sys_vacation`;
CREATE TABLE `sys_vacation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增索引',
  `vacation_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '假单编号',
  `work_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `office` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门岗位',
  `vacation_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '假期类型',
  `start_time` date NULL DEFAULT NULL COMMENT '起始时间',
  `end_time` date NULL DEFAULT NULL COMMENT '结束时间',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请假原因',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未审核' COMMENT '申请状态',
  `check_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见编号',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_office_in_sys_vacation`(`office`) USING BTREE,
  INDEX `fk_work_id_in_sys_vacation`(`work_id`) USING BTREE,
  INDEX `vacation_id`(`vacation_id`) USING BTREE,
  CONSTRAINT `fk_office_in_sys_vacation` FOREIGN KEY (`office`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_work_id_in_sys_vacation` FOREIGN KEY (`work_id`) REFERENCES `sys_employee` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_vacation
-- ----------------------------
INSERT INTO `sys_vacation` VALUES (10, '00220211102163740375', '002', '001', '病假', '2021-11-04', '2020-11-20', '生病了', '通过', '5053551853382735', '2021-11-02 16:37:41', '2022-01-07 15:19:31');
INSERT INTO `sys_vacation` VALUES (14, '00220211106211752367', '002', '001', '病假', '2021-11-04', '2021-01-07', '腹膜炎', '通过', '9272370904104360', '2021-11-06 21:17:52', '2022-01-07 15:19:31');
INSERT INTO `sys_vacation` VALUES (15, '00220211107191508800', '002', '001', '年假', '2021-12-10', '2021-12-31', '', '未审核', NULL, '2021-11-07 19:15:08', '2022-01-07 15:19:31');
INSERT INTO `sys_vacation` VALUES (16, '003320220107133847641', '0033', '006', '婚假', '2022-01-07', '2022-01-28', '结婚', '通过', '2787142316438501', '2022-01-07 13:38:48', '2022-01-07 15:37:42');

SET FOREIGN_KEY_CHECKS = 1;
