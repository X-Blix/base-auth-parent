/*
 Navicat Premium Data Transfer

 Source Server         : hotel
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : base-kc

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 19/12/2024 10:58:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '上级部门id',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT ',' COMMENT '树结构',
  `level` tinyint NULL DEFAULT NULL COMMENT '层级',
  `sort_value` int NULL DEFAULT 1 COMMENT '排序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  `version` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织机构' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '蓝飞集团', '0', ',1,', 1, 1, '霍元甲', '13888888888', 1, '2023-04-21 00:40:35', '2023-09-19 01:32:10', 0, 0);
INSERT INTO `sys_dept` VALUES ('10', '株洲总部', '1', ',1,10,', 2, 1, '陈真', '13888888888', 1, '2023-04-21 00:40:38', '2023-04-21 00:40:38', 0, 0);
INSERT INTO `sys_dept` VALUES ('1010', '开发部', '10', ',1,10,1010,', 3, 1, '小花', '13543482480', 1, '2023-04-21 00:40:40', '2023-04-21 00:40:40', 0, 0);
INSERT INTO `sys_dept` VALUES ('1020', '运营部门', '10', ',1,10,1020,', 3, 1, '余姚北', '13888888888', 1, '2023-04-21 00:40:42', '2023-04-21 00:40:42', 0, 0);
INSERT INTO `sys_dept` VALUES ('1021', '.net6', '1010', ',1,10,1010,1021,', 4, 1, '如花', '13543482480', 1, '2023-04-21 00:40:44', '2023-04-21 00:40:44', 0, 0);
INSERT INTO `sys_dept` VALUES ('1022', 'python组', '1010', ',1,10,1010,1022,', 4, 1, '小红', '13543482480', 1, '2023-04-21 00:40:48', '2023-04-21 00:40:48', 0, 0);
INSERT INTO `sys_dept` VALUES ('1024', 'php组', '1010', ',1,10,1010,1024,', 4, 1, '小翠', '13543482480', 1, '2023-04-21 00:40:49', '2023-04-21 00:40:49', 0, 0);
INSERT INTO `sys_dept` VALUES ('1025', '客服', '1020', ',1,10,1020,1025,', 4, 1, '婷婷', '13543482480', 1, '2023-04-21 00:40:50', '2023-04-21 00:40:50', 0, 0);
INSERT INTO `sys_dept` VALUES ('1026', '网站推广', '1020', ',1,10,1020,1026,', 4, 1, '小霞', '13543482480', 1, '2023-04-21 00:40:51', '2023-04-21 00:40:51', 0, 0);
INSERT INTO `sys_dept` VALUES ('1027', '线下运营', '1020', ',1,10,1020,1027,', 4, 1, '小花', '13543482480', 1, '2023-04-21 00:40:52', '2023-04-21 00:40:52', 0, 0);
INSERT INTO `sys_dept` VALUES ('1028', '设计', '1020', ',1,10,1020,1028,', 4, 1, '小张', '13543482480', 1, '2023-04-21 00:40:53', '2023-04-21 00:40:53', 0, 0);
INSERT INTO `sys_dept` VALUES ('1867392734692122626', '测试部门', '0', '', -1, 1, '常山北', '18553265715', 1, '2024-12-13 10:14:57', NULL, 0, 0);
INSERT INTO `sys_dept` VALUES ('20', '上海分公司', '1', ',1,20,', 2, 1, '刘振生', '13888888888', 1, '2023-04-21 00:40:55', '2023-09-19 01:32:15', 0, 0);
INSERT INTO `sys_dept` VALUES ('2012', '开发部', '20', ',1,20,2012,', 3, 1, '周周', '13888888888', 1, '2023-04-21 00:40:57', '2023-04-21 00:40:57', 0, 0);
INSERT INTO `sys_dept` VALUES ('2013', '开发部', '30', ',1,30,2013,', 3, 1, '李艳红', '13888888888', 1, '2023-04-21 00:40:58', '2023-04-21 00:40:58', 0, 0);
INSERT INTO `sys_dept` VALUES ('2016', 'java组', '2012', ',1,20,2012,2016,', 4, 1, '张强', '13888888888', 1, '2023-04-21 00:41:01', '2023-04-21 01:52:14', 0, 0);
INSERT INTO `sys_dept` VALUES ('2017', '大数据组', '20', ',1,20,2017,', 3, 1, '李刚', '13888888888', 1, '2023-04-21 00:41:05', '2023-04-21 01:52:37', 0, 0);
INSERT INTO `sys_dept` VALUES ('2018', '测试部', '30', ',1,30,2018,', 3, 2, '史蒂夫', '13888888888', 1, '2023-04-21 00:41:08', '2023-04-21 00:41:08', 0, 0);
INSERT INTO `sys_dept` VALUES ('30', '深圳分公司', '1', ',1,30,', 2, 1, '陆大安', '13888888888', 1, '2023-04-21 00:41:10', '2023-04-21 00:41:10', 0, 0);

-- ----------------------------
-- Table structure for sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic`  (
  `id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '名称',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '编码',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_dic_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '字典分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES ('66c3d1990bcad9b7a89d11078b93feed', '状态', '3000', '2023-04-30 12:10:01', '2023-04-30 12:10:01', 0);
INSERT INTO `sys_dic` VALUES ('bf283aa16df1d22acf3e8a0ed2c8c818', '性别', '1000', '2023-04-13 11:31:07', '2023-05-01 22:06:33', 0);
INSERT INTO `sys_dic` VALUES ('f713c8089f9a5bfcc87a4ae257bdc09d', '兴趣', '2000', '2023-04-18 19:37:33', '2023-04-18 19:37:33', 0);

-- ----------------------------
-- Table structure for sys_dic_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic_item`;
CREATE TABLE `sys_dic_item`  (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dic_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '所属分类',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '名称',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_dic_item_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '字典选项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dic_item
-- ----------------------------
INSERT INTO `sys_dic_item` VALUES ('13e25998cf2d57c89243faac9d388e45', '2000', '2005', '下棋', '2023-04-18 19:40:06', '2023-04-18 19:40:06', 0);
INSERT INTO `sys_dic_item` VALUES ('19cdf0f88b40ce6e6a444a00a1060243', '2000', '2006', '打麻将', '2023-04-18 19:40:18', '2023-04-18 19:40:18', 0);
INSERT INTO `sys_dic_item` VALUES ('20e39ce411c855bf63660877269bf728', '2000', '2001', '打篮球', '2023-04-18 19:38:20', '2023-04-18 19:38:20', 0);
INSERT INTO `sys_dic_item` VALUES ('359736c26f958ed43656d290121d2a8d', '2000', '2004', '跳舞', '2023-04-18 19:39:45', '2023-04-18 19:39:45', 0);
INSERT INTO `sys_dic_item` VALUES ('3c5dd4c40c0f6a745140e3e9238e971b', '3000', '1', '正常', '2023-04-30 12:10:41', '2023-04-30 12:10:41', 0);
INSERT INTO `sys_dic_item` VALUES ('4a83c2c56ba4fac5fddb017c0a4f3dd7', '1000', '1001', '男', '2023-04-13 12:10:29', '2023-04-30 12:49:52', 0);
INSERT INTO `sys_dic_item` VALUES ('668c351bdc7b8cebf5be99f641cc2947', '2000', '2002', '看AV', '2023-04-18 19:38:35', '2023-04-18 19:38:35', 0);
INSERT INTO `sys_dic_item` VALUES ('6d59fb189ac883e2f2475a778eececbd', '3000', '0', '停用', '2023-04-30 12:10:57', '2023-05-01 16:21:12', 0);
INSERT INTO `sys_dic_item` VALUES ('d44689012199471a8612a67eb41b7a59', '1000', '1002', '女', '2023-04-13 12:10:40', '2023-04-30 12:49:57', 0);
INSERT INTO `sys_dic_item` VALUES ('f6ae3007b19c95f3fc70e04dc8d431ed', '2000', '2003', '逛街', '2023-04-18 19:39:27', '2023-04-18 19:39:27', 0);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '访问ID',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('1869259224391467010', 'admin', '127.0.0.1', 0, '登录成功', NULL, '2024-12-18 13:51:42', NULL, 0);
INSERT INTO `sys_login_log` VALUES ('1869262740463927298', 'admin', '127.0.0.1', 0, '登录成功', NULL, '2024-12-18 14:05:41', NULL, 0);
INSERT INTO `sys_login_log` VALUES ('1869574357697257473', 'admin', '127.0.0.1', 0, '登录成功', NULL, '2024-12-19 10:43:56', NULL, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_value` int NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('10', '4', '查看', 2, NULL, NULL, 'bnt.sysRole.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('11', '4', '添加', 2, NULL, NULL, 'bnt.sysRole.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('12', '4', '修改', 2, NULL, NULL, 'bnt.sysRole.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('13', '4', '删除', 2, NULL, NULL, 'bnt.sysRole.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('14', '5', '查看', 2, NULL, NULL, 'bnt.sysMenu.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('15', '5', '添加', 2, NULL, NULL, 'bnt.sysMenu.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('16', '5', '修改', 2, NULL, NULL, 'bnt.sysMenu.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('17', '5', '删除', 2, NULL, NULL, 'bnt.sysMenu.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('1703065546304581634', '1688123841486368769', '获取部门', 2, '', '', 'bnt.sysDept.list', '', 1, 1, '2023-09-16 23:17:22', '2023-09-16 23:21:29', 1);
INSERT INTO `sys_menu` VALUES ('1703065617737773057', '1688157462419030018', '获取部门', 2, '', '', 'bnt.sysDept.list', '', 1, 1, '2023-09-16 23:17:39', '2023-09-16 23:21:42', 1);
INSERT INTO `sys_menu` VALUES ('1703086068258107393', '1688123213473230850', '统计分析', 0, '', 'ParentView', '', 'iconfont icon-tongji', 5, 1, '2023-09-17 00:38:55', '2023-09-17 01:12:14', 0);
INSERT INTO `sys_menu` VALUES ('1703104946904297473', '1703086068258107393', '销售统计', 1, 'salesReport', 'pages/tj/SalesReport', '', 'iconfont icon-tongjifenxi', 1, 1, '2023-09-17 01:53:56', '2023-09-17 01:53:56', 0);
INSERT INTO `sys_menu` VALUES ('1703832316976087041', '5b728f902e19e6af9216b76cc82f63fc', '添加', 2, '', '', 'bnt.sysDicItem.add', '', 1, 1, '2023-09-19 02:04:15', '2023-09-19 02:04:15', 0);
INSERT INTO `sys_menu` VALUES ('1703832376891719681', '5b728f902e19e6af9216b76cc82f63fc', '查看', 2, '', '', 'bnt.sysDicItem.list', '', 1, 1, '2023-09-19 02:04:29', '2023-09-19 02:04:29', 0);
INSERT INTO `sys_menu` VALUES ('1703832449537064961', '5b728f902e19e6af9216b76cc82f63fc', '删除', 2, '', '', 'bnt.sysDicItem.remove', '', 1, 1, '2023-09-19 02:04:46', '2023-09-19 02:04:46', 0);
INSERT INTO `sys_menu` VALUES ('1703832553681633281', '5fc8df5d01c4df1ceccd8d8f663deada', '查看', 2, '', '', 'bnt.sysDic.list', '', 1, 1, '2023-09-19 02:05:11', '2023-09-19 02:05:11', 0);
INSERT INTO `sys_menu` VALUES ('18', '3', '分配角色', 2, NULL, NULL, 'bnt.sysUser.assignRole', NULL, 1, 1, '2022-05-23 17:14:32', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('19', '4', '分配权限', 2, 'assignAuth', 'system/sysRole/assignAuth', 'bnt.sysRole.assignAuth', NULL, 1, 1, '2022-05-23 17:18:14', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('2', '0', '系统管理', 0, '/system', 'Layout', NULL, 'el-icon-s-tools', 1, 1, '2021-05-31 18:05:37', '2023-09-19 01:15:56', 0);
INSERT INTO `sys_menu` VALUES ('20', '2', '部门管理', 1, 'sysDept', 'system/sysDept/list', '', 'el-icon-s-operation', 4, 1, '2022-05-24 10:07:05', '2022-06-09 09:38:12', 0);
INSERT INTO `sys_menu` VALUES ('21', '20', '查看', 2, NULL, NULL, 'bnt.sysDept.list', NULL, 1, 1, '2022-05-24 10:07:44', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('22', '2', '岗位管理', 1, 'sysPost', 'system/sysPost/list', '', 'el-icon-more-outline', 5, 1, '2022-05-24 10:25:30', '2022-06-09 09:38:13', 0);
INSERT INTO `sys_menu` VALUES ('23', '22', '查看', 2, NULL, NULL, 'bnt.sysPost.list', NULL, 1, 1, '2022-05-24 10:25:45', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('24', '20', '添加', 2, NULL, NULL, 'bnt.sysDept.add', NULL, 1, 1, '2022-05-25 15:31:27', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('25', '20', '修改', 2, NULL, NULL, 'bnt.sysDept.update', NULL, 1, 1, '2022-05-25 15:31:41', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('26', '20', '删除', 2, NULL, NULL, 'bnt.sysDept.remove', NULL, 1, 1, '2022-05-25 15:31:59', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('27', '22', '添加', 2, NULL, NULL, 'bnt.sysPost.add', NULL, 1, 1, '2022-05-25 15:32:44', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('28', '22', '修改', 2, NULL, NULL, 'bnt.sysPost.update', NULL, 1, 1, '2022-05-25 15:32:58', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('29', '22', '删除', 2, NULL, NULL, 'bnt.sysPost.remove', NULL, 1, 1, '2022-05-25 15:33:11', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('3', '2', '用户管理', 1, 'sysUser', 'system/sysUser/treelist', '', 'el-icon-s-custom', 1, 1, '2021-05-31 18:05:37', '2023-02-22 14:12:57', 0);
INSERT INTO `sys_menu` VALUES ('30', '34', '操作日志', 1, 'sysOperLog', 'pages/log/sysOperLog', '', 'el-icon-document-remove', 7, 1, '2022-05-26 16:09:59', '2024-12-14 10:47:35', 0);
INSERT INTO `sys_menu` VALUES ('31', '30', '查看', 2, NULL, NULL, 'bnt.sysOperLog.list', NULL, 1, 1, '2022-05-26 16:10:17', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('32', '34', '登录日志', 1, 'sysLoginLog', 'pages/log/sysLoginLog', '', 'el-icon-s-goods', 8, 1, '2022-05-26 16:36:13', '2024-12-14 10:47:40', 0);
INSERT INTO `sys_menu` VALUES ('33', '32', '查看', 2, NULL, NULL, 'bnt.sysLoginLog.list', NULL, 1, 1, '2022-05-26 16:36:31', '2022-06-09 09:36:36', 0);
INSERT INTO `sys_menu` VALUES ('34', '2', '日志管理', 0, 'log', 'ParentView', '', 'el-icon-tickets', 6, 1, '2022-05-31 13:23:07', '2024-12-14 10:47:45', 0);
INSERT INTO `sys_menu` VALUES ('34c2f0c5e83706b74c01a640158cd02e', '5fc8df5d01c4df1ceccd8d8f663deada', '删除', 2, '', '', 'bnt.sysDic.remove', '', 1, 1, '2023-04-13 11:07:35', '2023-04-13 11:07:35', 0);
INSERT INTO `sys_menu` VALUES ('4', '2', '角色管理', 1, 'sysRole', 'system/sysRole/list', '', 'el-icon-user-solid', 2, 1, '2021-05-31 18:05:37', '2022-06-09 09:37:18', 0);
INSERT INTO `sys_menu` VALUES ('5', '2', '菜单管理', 1, 'sysMenu', 'system/sysMenu/list', '', 'el-icon-s-unfold', 3, 1, '2021-05-31 18:05:37', '2022-06-09 09:37:21', 0);
INSERT INTO `sys_menu` VALUES ('6', '3', '查看', 2, NULL, NULL, 'bnt.sysUser.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('61c097fe293b47ee2972bdc3c048072b', '5fc8df5d01c4df1ceccd8d8f663deada', '修改', 2, '', '', 'bnt.sysDic.update', '', 1, 1, '2023-04-13 11:07:15', '2023-04-13 11:07:15', 0);
INSERT INTO `sys_menu` VALUES ('6d89625d46acaa659436ad4248fde2ab', '5b728f902e19e6af9216b76cc82f63fc', '修改', 2, '', '', 'bnt.sysDicItem.update', '', 1, 1, '2023-04-13 11:08:51', '2023-04-13 11:08:51', 0);
INSERT INTO `sys_menu` VALUES ('7', '3', '添加', 2, NULL, NULL, 'bnt.sysUser.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('720038d02c0f54fb60f66d8b293dcd9b', '5fc8df5d01c4df1ceccd8d8f663deada', '添加', 2, '', '', 'bnt.sysDic.add', '', 2, 1, '2023-04-13 11:06:58', '2023-04-13 11:06:58', 0);
INSERT INTO `sys_menu` VALUES ('7399d492f884c78d86a3974e40975dfb', '947daeb9ca3251bc7e33b30814614fe5', '新增', 2, '', '', 'bnt.code.generator.add', '', 1, 1, '2023-04-30 00:23:12', '2023-04-30 00:23:12', 0);
INSERT INTO `sys_menu` VALUES ('8', '3', '修改', 2, NULL, NULL, 'bnt.sysUser.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES ('9', '3', '删除', 2, NULL, NULL, 'bnt.sysUser.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '业务类型',
  `method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '操作类别',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('1869262828816941057', '角色管理', 'DELETE', 'com.example.liuy.system.controller.SysRoleController.remove()', 'DELETE', 'MANAGE', 'admin', '', '/admin/system/sysRole/remove/1868879835023626241', '127.0.0.1', '', '{\"code\":200,\"message\":\"成功\"}', 1, '', '2024-12-18 14:06:02', '2024-12-18 14:06:02', NULL, 0);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '岗位名称',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1867557322196873218', '', 'aaaaa', '', 0, '2024-12-13 23:10:47', '2024-12-13 23:10:47', 1);
INSERT INTO `sys_post` VALUES ('1867557509686456321', '', '新增岗位', '', 0, '2024-12-13 23:10:20', '2024-12-13 23:10:20', 1);
INSERT INTO `sys_post` VALUES ('1867563681634152449', '', '新岗位', '', 0, '2024-12-13 23:10:20', '2024-12-13 23:10:20', 1);
INSERT INTO `sys_post` VALUES ('1867761034966175746', 'a', '艾', '嗷嗷嗷', 1, '2024-12-14 10:38:37', '2024-12-14 10:38:37', 1);
INSERT INTO `sys_post` VALUES ('1867761154008911873', 'a', '艾', '嗷嗷嗷', 1, '2024-12-14 10:39:46', '2024-12-14 10:39:46', 1);
INSERT INTO `sys_post` VALUES ('1867761255678840833', 'b', '丙', '八百标兵奔北坡', 1, '2024-12-14 10:39:46', '2024-12-14 10:39:46', 1);
INSERT INTO `sys_post` VALUES ('5', 'dsz', '董事长', '董事长', 1, '2024-12-13 21:54:02', '2024-12-13 21:54:02', 0);
INSERT INTO `sys_post` VALUES ('6', 'zjl', '总经理', '总经理', 1, '2024-12-13 21:54:00', '2024-12-13 21:54:00', 0);
INSERT INTO `sys_post` VALUES ('7', 'wz', '网咨', '', 1, '2024-12-13 10:28:50', '2024-12-13 10:28:50', 0);
INSERT INTO `sys_post` VALUES ('8', 'yyzj', '运营总监', '有缘再见', 1, '2024-12-13 21:54:03', '2024-12-13 21:54:03', 0);
INSERT INTO `sys_post` VALUES ('9', 'dz', 'fs', '顶顶顶顶222', 1, '2024-12-14 10:38:41', '2024-12-14 10:38:41', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'SYSTEM', '访问和管理所有模块', '2021-05-31 18:09:18', '2024-12-06 09:16:36', 0);
INSERT INTO `sys_role` VALUES ('1625026561937264642', 'testManger', 'testManager', 'testManger', '2023-02-13 14:58:19', '2024-12-06 09:28:31', 1);
INSERT INTO `sys_role` VALUES ('1866667979827666945', 'role1', 'r1', NULL, '2024-12-11 10:15:02', '2024-12-12 13:03:25', 1);
INSERT INTO `sys_role` VALUES ('1868136222312488961', '测试角色', 'csjs', NULL, '2024-12-15 11:29:18', '2024-12-15 11:32:35', 1);
INSERT INTO `sys_role` VALUES ('1868136926682841090', 'aaaaa', 'aaaaa', NULL, '2024-12-15 11:32:06', '2024-12-15 11:32:37', 1);
INSERT INTO `sys_role` VALUES ('1868138087087374337', 'a', 'a', NULL, '2024-12-15 11:36:42', '2024-12-15 11:36:42', 0);
INSERT INTO `sys_role` VALUES ('1868169128409829377', 'b', 'b', NULL, '2024-12-15 13:40:03', '2024-12-15 13:40:03', 0);
INSERT INTO `sys_role` VALUES ('1868231612521074689', 'aaa', 'bbb', NULL, '2024-12-15 17:48:21', '2024-12-15 17:48:21', 0);
INSERT INTO `sys_role` VALUES ('1868850462895673346', 'bbb', 'bbb', NULL, '2024-12-17 10:47:26', '2024-12-17 10:47:26', 0);
INSERT INTO `sys_role` VALUES ('1868879835023626241', 'gggg', 'fffff', NULL, '2024-12-17 12:44:09', '2024-12-18 14:06:02', 1);
INSERT INTO `sys_role` VALUES ('2', '普通管理员', 'COMMON', '普通管理员', '2021-06-01 08:38:40', '2022-02-24 10:42:46', 0);
INSERT INTO `sys_role` VALUES ('8', '用户管理员', 'ROLE', NULL, '2022-06-08 17:39:04', '2022-06-08 17:39:04', 0);
INSERT INTO `sys_role` VALUES ('b62e7a2e5d54b980aee2f197170a623c', '角色管理员', 'role', '角色管理员', '2023-04-16 05:01:26', '2024-12-12 13:05:15', 1);
INSERT INTO `sys_role` VALUES ('e69ac747ae807ed24122f04347e2cd71', 'testManger', 'testManager', 'testManger', '2023-04-16 05:01:24', '2024-12-06 09:28:58', 1);
INSERT INTO `sys_role` VALUES ('f9156c7335cbe0c8ec5b07c961369c44', 'testManger', 'testManager', 'testManger', '2023-04-16 10:42:19', '2024-12-12 13:03:17', 1);
INSERT INTO `sys_role` VALUES ('fad533c775b2f557544520dee76adb33', '角色管理员', 'role', '角色管理员', '2023-04-16 10:42:20', '2024-12-06 09:28:39', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `menu_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('001f79fb21e88abb36c52d27abaca18f', '1', '1646191837765558273', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('00cc743589e351aefd273e28510b8f96', '1', '1646193783066976258', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('00fa2b70348c5f5d74e68f822210f5c7', '1', '1646193933130784770', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('02ddc2457b0d5a591e48b8e644bc72dd', '1', '1646193851681595394', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('0326a869bd13254478561ff9a0af4112', '1', 'b6f9eb1c88eae40f489c887635440bb0', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('04b2cc21fa4cf7a433a21b72b5583003', '1', '3', '2023-04-27 23:17:17', '2023-04-27 23:22:21', 1);
INSERT INTO `sys_role_menu` VALUES ('0c781f97e2226e42d48fb6c6aa98fb81', '1', '51f8eb07a83fa599bbc85db068a071c5', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('0d6195f0928e5dc7861ef75540dea18c', '1', '9', '2023-04-27 23:17:17', '2023-04-27 23:22:21', 1);
INSERT INTO `sys_role_menu` VALUES ('1', '2', '2', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('10', '2', '11', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('11', '2', '12', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('12', '2', '13', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('13', '2', '19', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('13c7bae825daf3e8079bb8d5316396fa', '1', '5b728f902e19e6af9216b76cc82f63fc', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('14', '2', '5', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('15', '2', '14', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('16', '2', '15', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186579931137', '1', '1646187339429044225', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186747703298', '1', '1646187845945778178', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186756091906', '1', '1646193464044019714', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186772869122', '1', '1646191837765558273', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186785452033', '1', '1646193783066976258', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186793840642', '1', '1646193851681595394', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186802229250', '1', '1646193933130784770', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186819006466', '1', '1646194051976388610', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186831589378', '1', '586efff0cc24c5f8a8cc74a25d3ee9b5', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186852560897', '1', '4422f987e6d08dc0fcbadaf280c6b98c', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186860949505', '1', '51f8eb07a83fa599bbc85db068a071c5', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186869338113', '1', 'b6f9eb1c88eae40f489c887635440bb0', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186886115330', '1', 'ea7c79a11b4a621ee2ce6f23addfa7d7', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186886115331', '1', 'fd551946189361ff79ee445e7788d7ae', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186894503938', '1', '163022f07fff73b6ab81af9dff5ab16c', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186919669762', '1', '527342d2d2182f9d1c0ffc7d10029a49', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186928058370', '1', '9eeb25ad142bcbfee574c1c12698c2af', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186936446977', '1', '2', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186944835585', '1', '07e9b8c265f824bc7f5d0149523cc92c', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186953224193', '1', '5b728f902e19e6af9216b76cc82f63fc', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186961612801', '1', 'e7d746c60d482a33e3ae068dbc840460', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186970001409', '1', '5fc8df5d01c4df1ceccd8d8f663deada', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597186995167234', '1', 'ffa18fd6b196f2149e5107b50ba729e4', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187003555841', '1', '20', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187011944450', '1', '21', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187016138754', '1', '24', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187032915969', '1', '25', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187045498881', '1', '26', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187058081794', '1', '3', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187066470402', '1', '18', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187083247618', '1', '6', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187095830529', '1', '7', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187104219137', '1', '8', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652597187104219138', '1', '9', '2023-04-30 16:54:08', '2023-04-30 17:00:37', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823323181058', '1', '1646187339429044225', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823335763970', '1', '1646187845945778178', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823348346881', '1', '1646193464044019714', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823360929793', '1', '1646191837765558273', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823360929794', '1', '1646193783066976258', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823369318401', '1', '1646193851681595394', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823377707010', '1', '1646193933130784770', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823386095617', '1', '1646194051976388610', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823386095618', '1', '586efff0cc24c5f8a8cc74a25d3ee9b5', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823394484225', '1', '4422f987e6d08dc0fcbadaf280c6b98c', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823402872833', '1', '51f8eb07a83fa599bbc85db068a071c5', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823419650050', '1', 'b6f9eb1c88eae40f489c887635440bb0', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823428038658', '1', 'ea7c79a11b4a621ee2ce6f23addfa7d7', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823436427266', '1', 'fd551946189361ff79ee445e7788d7ae', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823444815873', '1', '163022f07fff73b6ab81af9dff5ab16c', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823461593090', '1', '527342d2d2182f9d1c0ffc7d10029a49', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823461593091', '1', '9eeb25ad142bcbfee574c1c12698c2af', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823482564609', '1', '2', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823499341826', '1', '07e9b8c265f824bc7f5d0149523cc92c', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823511924737', '1', '5b728f902e19e6af9216b76cc82f63fc', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823520313345', '1', 'e7d746c60d482a33e3ae068dbc840460', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823537090561', '1', '5fc8df5d01c4df1ceccd8d8f663deada', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823541284866', '1', 'ffa18fd6b196f2149e5107b50ba729e4', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823558062081', '1', '20', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823579033601', '1', '21', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823595810817', '1', '24', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823612588034', '1', '25', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823612588035', '1', '26', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823629365249', '1', '22', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823637753858', '1', '23', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823646142466', '1', '3', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823654531074', '1', '18', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823654531075', '1', '6', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823662919682', '1', '7', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823671308289', '1', '8', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('1652598823679696898', '1', '9', '2023-04-30 17:00:38', '2024-12-12 13:05:38', 1);
INSERT INTO `sys_role_menu` VALUES ('17', '2', '16', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232517443585', '8', '1688123213473230850', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232517443586', '8', '1688123841486368769', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232517443587', '8', '1688124249835417602', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232517443588', '8', '1688124309843324929', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552450', '8', '1688124364067287041', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552451', '8', '1688124407813877761', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552452', '8', '1688157462419030018', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552453', '8', '1688157721341804546', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552454', '8', '1688157772499730434', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552455', '8', '1688157815650729985', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552456', '8', '1688157859149856769', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552457', '8', '1693220558657359874', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552458', '8', '1693221302559117313', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552459', '8', '1693235624777682945', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232584552460', '8', '1693242092956512258', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232651661314', '8', '1702712629575827457', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232651661315', '8', '1693221551184875522', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232651661316', '8', '1693221902269091841', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232651661317', '8', '1693237943388934146', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232651661318', '8', '1693242189974958081', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703061232651661319', '8', '1702712405893595137', '2023-09-16 23:00:14', '2023-09-16 23:22:18', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790473560065', '8', '1688123213473230850', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790473560066', '8', '1688123841486368769', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790473560067', '8', '1688124249835417602', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790473560068', '8', '1688124309843324929', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790473560069', '8', '1688124364067287041', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790570029057', '8', '1688124407813877761', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790570029058', '8', '1688157462419030018', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790570029059', '8', '1688157721341804546', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790570029060', '8', '1688157772499730434', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777794', '8', '1688157815650729985', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777795', '8', '1688157859149856769', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777796', '8', '1693220558657359874', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777797', '8', '1693221302559117313', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777798', '8', '1693235624777682945', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777799', '8', '1693242092956512258', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777800', '8', '1702712629575827457', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777801', '8', '1693221551184875522', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790607777802', '8', '1693221902269091841', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790666498050', '8', '1693237943388934146', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790666498051', '8', '1693242189974958081', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790666498052', '8', '1702712405893595137', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790666498053', '8', '2', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790666498054', '8', '20', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703066790666498055', '8', '21', '2023-09-16 23:22:19', '2023-09-17 17:16:51', 1);
INSERT INTO `sys_role_menu` VALUES ('1703337209675972610', '8', '1688123213473230850', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209675972611', '8', '1688123841486368769', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209675972612', '8', '1688124249835417602', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209675972613', '8', '1688124309843324929', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209747275778', '8', '1688124364067287041', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209747275779', '8', '1688124407813877761', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209747275780', '8', '1688157462419030018', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209747275781', '8', '1688157721341804546', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209747275782', '8', '1688157772499730434', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209747275783', '8', '1688157815650729985', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209810190338', '8', '1688157859149856769', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209810190339', '8', '1693220558657359874', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209810190340', '8', '1693221302559117313', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209810190341', '8', '1693235624777682945', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209810190342', '8', '1693242092956512258', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209810190343', '8', '1702712629575827457', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209810190344', '8', '1693221551184875522', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209810190345', '8', '1693221902269091841', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209877299202', '8', '1693237943388934146', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209877299203', '8', '1693242189974958081', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209877299204', '8', '1702712405893595137', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209877299205', '8', '1703086068258107393', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209877299206', '8', '1703104946904297473', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209877299207', '8', '2', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209877299208', '8', '20', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('1703337209877299209', '8', '21', '2023-09-17 17:16:52', '2023-09-17 17:16:52', 0);
INSERT INTO `sys_role_menu` VALUES ('18', '2', '17', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('1866672169073311746', '1866667979827666945', '2', '2024-12-11 10:31:40', '2024-12-12 10:59:34', 1);
INSERT INTO `sys_role_menu` VALUES ('1866672169102671874', '1866667979827666945', '3', '2024-12-11 10:31:40', '2024-12-12 10:59:34', 1);
INSERT INTO `sys_role_menu` VALUES ('1866672169102671875', '1866667979827666945', '18', '2024-12-11 10:31:40', '2024-12-12 10:59:34', 1);
INSERT INTO `sys_role_menu` VALUES ('1866672169102671876', '1866667979827666945', '6', '2024-12-11 10:31:40', '2024-12-12 10:59:34', 1);
INSERT INTO `sys_role_menu` VALUES ('1866672169102671877', '1866667979827666945', '8', '2024-12-11 10:31:40', '2024-12-12 10:59:34', 1);
INSERT INTO `sys_role_menu` VALUES ('1866672169102671878', '1866667979827666945', '9', '2024-12-11 10:31:40', '2024-12-12 10:59:34', 1);
INSERT INTO `sys_role_menu` VALUES ('1867041577146855425', '1866667979827666945', '2', '2024-12-12 10:59:34', '2024-12-12 10:59:34', 0);
INSERT INTO `sys_role_menu` VALUES ('1867041577146855426', '1866667979827666945', '4', '2024-12-12 10:59:34', '2024-12-12 10:59:34', 0);
INSERT INTO `sys_role_menu` VALUES ('1867041577146855427', '1866667979827666945', '10', '2024-12-12 10:59:34', '2024-12-12 10:59:34', 0);
INSERT INTO `sys_role_menu` VALUES ('1867041577146855428', '1866667979827666945', '11', '2024-12-12 10:59:34', '2024-12-12 10:59:34', 0);
INSERT INTO `sys_role_menu` VALUES ('1867041577146855429', '1866667979827666945', '12', '2024-12-12 10:59:34', '2024-12-12 10:59:34', 0);
INSERT INTO `sys_role_menu` VALUES ('1867041577146855430', '1866667979827666945', '19', '2024-12-12 10:59:34', '2024-12-12 10:59:34', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303600488449', '1', '2', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303600488450', '1', '3', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303600488451', '1', '18', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303600488452', '1', '6', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303600488453', '1', '7', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303600488454', '1', '8', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303600488455', '1', '9', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625793', '1', '4', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625794', '1', '10', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625795', '1', '11', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625796', '1', '12', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625797', '1', '13', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625798', '1', '19', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625799', '1', '5', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625800', '1', '14', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625801', '1', '15', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625802', '1', '16', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('1867073303646625803', '1', '17', '2024-12-12 13:05:38', '2024-12-12 13:05:38', 0);
INSERT INTO `sys_role_menu` VALUES ('19', '2', '2', '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES ('2', '2', '3', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('20', '2', '3', '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES ('21', '2', '6', '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES ('22', '2', '7', '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES ('23', '2', '8', '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES ('24', '2', '2', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('25', '2', '3', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('26', '2', '6', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('27', '2', '7', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('28', '2', '8', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('29', '2', '5', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('2e62a1095dafae37be74d0b38b9d0ccb', '1', '24', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('2fb51ef3134074a780c0291501326644', '1', '1646194051976388610', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('3', '2', '6', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('30', '2', '14', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('31', '2', '20', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('31ea1d49af4e8ab93f5ac779e61608cd', '1', '1646193464044019714', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('32', '2', '21', '2022-06-09 09:26:34', '2022-06-09 09:26:34', 0);
INSERT INTO `sys_role_menu` VALUES ('33', '1625026561937264647', '2', '2023-02-17 19:46:29', '2023-02-17 19:46:29', 0);
INSERT INTO `sys_role_menu` VALUES ('3391614afb9c7f0e8560b22a1615ec40', '1', '25', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('34', '1625026561937264647', '3', '2023-02-17 19:46:29', '2023-02-17 19:46:29', 0);
INSERT INTO `sys_role_menu` VALUES ('346b146ea1e6db0c46ca5fdc31668443', '1', '6', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('35', '1625026561937264647', '6', '2023-02-17 19:46:29', '2023-02-17 19:46:29', 0);
INSERT INTO `sys_role_menu` VALUES ('36', '1625026561937264647', '7', '2023-02-17 19:46:29', '2023-02-17 19:46:29', 0);
INSERT INTO `sys_role_menu` VALUES ('37', '1625026561937264646', '2', '2023-02-20 02:42:08', '2023-02-20 02:42:08', 0);
INSERT INTO `sys_role_menu` VALUES ('38', '1625026561937264646', '3', '2023-02-20 02:42:08', '2023-02-20 02:42:08', 0);
INSERT INTO `sys_role_menu` VALUES ('38a2cf9b6ca74a14448d4a6f6295d59b', '1', '1646193933130784770', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('38d93150c76ec8a5f2423f978d2688a7', '1', '7', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('39', '1625026561937264646', '6', '2023-02-20 02:42:08', '2023-02-20 02:42:08', 0);
INSERT INTO `sys_role_menu` VALUES ('3a9b2c6098e73a5e3e0941cd600c3bdd', '1', '6', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('3f7b8196db703c3d6ce9ed497ca16299', '1', '3', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('4', '2', '7', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('40', '1625026561937264644', '2', '2023-02-21 00:07:28', '2023-02-21 00:07:28', 0);
INSERT INTO `sys_role_menu` VALUES ('403caffda69218e5ffef546f2491b728', '1', '20', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('41', '1625026561937264644', '20', '2023-02-21 00:07:28', '2023-02-21 00:07:28', 0);
INSERT INTO `sys_role_menu` VALUES ('41b93a1971e3c00857839a12e891d159', '1', '586efff0cc24c5f8a8cc74a25d3ee9b5', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('42', '1625026561937264644', '21', '2023-02-21 00:07:28', '2023-02-21 00:07:28', 0);
INSERT INTO `sys_role_menu` VALUES ('43', '1625026561937264644', '24', '2023-02-21 00:07:28', '2023-02-21 00:07:28', 0);
INSERT INTO `sys_role_menu` VALUES ('44', '1625026561937264644', '25', '2023-02-21 00:07:28', '2023-02-21 00:07:28', 0);
INSERT INTO `sys_role_menu` VALUES ('4da31e346c0a417b5bd481cff30cefff', '1', '8', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('5', '2', '8', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('51a1c522246c12acb200d9978e7d1225', '1', '1646187339429044225', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('5295697810bddd413fe8ef9a9b9a7696', '1', '4422f987e6d08dc0fcbadaf280c6b98c', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('5bf478a3629a919ad085d0299dff8c47', '1', '8', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('5c87d151ae9c3bb5e7e706a0bce5e980', '1', '3', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('5daaa37a5e517bece35112ab3f8c0ea2', '1', '7', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('5ec39e4f899afac65fe628ef12da2a0d', '1', '20', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('6', '2', '9', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('65913a5b893d400b14d305175db15ea1', '1', '9', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('66db71b2e8f581b9d81786e4e365eb54', '1', '18', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('699eec12f37620399f440449fca2d46d', '1', '26', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('6b61a1040dee8ecd3a339c7f2c3970c4', '1', '1646187845945778178', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('7', '2', '18', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('700de323041a6040351085f5cd640185', '1', '7', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('76038bfc2ce6d4b46bbdf30250a57231', '1', '1646193783066976258', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('7762ddb9996f88465576a3fb3d1a6a34', '1', '25', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('7ab761111942b56d124b3beae217d8c9', '1', '1646187339429044225', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('8', '2', '4', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('8019f3d679042fb9c270c703a6563259', '1', '24', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('849e078b5d8f93977ddafdd8fe1c1955', '1', '586efff0cc24c5f8a8cc74a25d3ee9b5', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('88ecabf4088e6fcabd9d4a4904dd00b1', '1', 'ea7c79a11b4a621ee2ce6f23addfa7d7', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('8beffebb6d5f7433b728301febf2d20e', '1', '5fc8df5d01c4df1ceccd8d8f663deada', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('9', '2', '10', '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES ('92023c3ba981ad39e876fdb2c2ff79fe', '1', '21', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('9a066731f41693b77bfc78e090457096', '1', '1646193851681595394', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('9a2b1acee7c11fc652480e59ac96811f', '1', '18', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('9c7782ae957be4b0a97213fc2dccd8a1', '1', '8', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('9f66e9705f8a69de5f6de48e46a71e42', '1', '07e9b8c265f824bc7f5d0149523cc92c', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('a5bc8a03c6c72f0bca768725e2a2be5a', '1', '2', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('ac2673dd4e086bb5109acd0ca4f580a6', '1', 'b6f9eb1c88eae40f489c887635440bb0', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('b1cfc48e55b8862a19fccfd0e74b64a1', '1', '9', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('b4096294e8e299cec06a3e4532d0878c', '1', '1646191837765558273', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('b51bd20d9bbd670bef42f102f995f286', '1', '2', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('b5f40cdc6e7e931b4e1509b2ff6336ba', '1', '1646194051976388610', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('b877f95b0ef983411d23be1fd4b9a3e1', '1', '18', '2023-04-27 23:17:17', '2023-04-27 23:22:21', 1);
INSERT INTO `sys_role_menu` VALUES ('bb8c1624db6393532f5a72ea747ff64f', '1', 'e7d746c60d482a33e3ae068dbc840460', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('bd50293eb7f6b3cc723d3a7f8f7df034', '1', '8', '2023-04-27 23:17:17', '2023-04-27 23:22:21', 1);
INSERT INTO `sys_role_menu` VALUES ('c0f0b237772e139b9f11bf5a385e741a', '1', '18', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('c3fe41102096fbaa8d02e8063e4e1a99', '1', '24', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('cf42a4fcae3a6427006f10a193a0d541', '1', '51f8eb07a83fa599bbc85db068a071c5', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('d43ba2ebcd2e7b7993c7fbd46aa0e46c', '1', '2', '2023-04-27 23:17:17', '2023-04-27 23:22:21', 1);
INSERT INTO `sys_role_menu` VALUES ('d47637ec10b32ebd52705247ae28a70d', '1', '26', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('d528d234b6d244748d2a8d88e15495df', '1', '21', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('d6a702d4776eb329d1c00f9f72fd14d7', '1', '26', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('d7ebbe769805e9952a5f334aa7d71cd2', '1', 'ffa18fd6b196f2149e5107b50ba729e4', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('ddd27f7e7427550965ad59292df76c55', '1', '6', '2023-04-27 23:17:17', '2023-04-27 23:22:21', 1);
INSERT INTO `sys_role_menu` VALUES ('e062f13a82a3d3574650466487a3a946', '1', '25', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('e5abf1c2170ec962edab271d61d7e3c4', '1', '9', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('e6312f2b13bd54b0a8ac2feea4ebc132', '1', '4422f987e6d08dc0fcbadaf280c6b98c', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('e6bb92ecfded7b3fe07b400b0bef4b70', '1', '21', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('e7a1b5430a0be44c06949c276c0b000d', '1', '20', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('e8b576091d27bbd703a60418f9865bb7', '1', '3', '2023-04-28 10:59:18', '2023-04-28 12:32:46', 1);
INSERT INTO `sys_role_menu` VALUES ('f51e08e40924d0dd4be5627ea951024f', '1', '6', '2023-04-27 23:22:21', '2023-04-28 10:59:17', 1);
INSERT INTO `sys_role_menu` VALUES ('f712d88a6dc7f8408484d0b19c24c88b', '1', 'ea7c79a11b4a621ee2ce6f23addfa7d7', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);
INSERT INTO `sys_role_menu` VALUES ('fca54aa223febba8758ea3c575077772', '1', '7', '2023-04-27 23:17:17', '2023-04-27 23:22:21', 1);
INSERT INTO `sys_role_menu` VALUES ('ff42da2ced0be2dcfaa54708069765df', '1', '2', '2023-04-28 12:32:47', '2023-04-30 16:54:07', 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `dept_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门id',
  `post_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '15099909888', 'http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc', '1021', '5', NULL, 1, '2021-05-31 18:08:43', '2024-12-11 10:13:17', 0);
INSERT INTO `sys_user` VALUES ('12', 'sfcx', '96e79218965eb72c92a549dd5a330112', '孙凤霞', '17666578420', NULL, NULL, NULL, NULL, 1, '2023-02-24 00:14:49', '2023-02-24 00:14:49', 0);
INSERT INTO `sys_user` VALUES ('13', 'zhangsz', '96e79218965eb72c92a549dd5a330112', '紫苏子', '17666578420', NULL, '2017', NULL, NULL, 1, '2023-02-24 00:14:49', '2023-02-24 15:24:38', 0);
INSERT INTO `sys_user` VALUES ('14', 'liss', '96e79218965eb72c92a549dd5a330112', '李帅帅', '17666578420', NULL, '2018', NULL, NULL, 1, '2023-02-24 01:48:12', '2023-02-24 15:24:13', 0);
INSERT INTO `sys_user` VALUES ('15', 'zhangss', '96e79218965eb72c92a549dd5a330112', '周生生', '17666578420', NULL, '2013', NULL, NULL, 1, '2023-02-24 01:48:12', '2023-02-24 15:24:06', 0);
INSERT INTO `sys_user` VALUES ('1703060687534747649', 'zzs', '887328d863061b97df42e19cf44c8ddb', '张子松', '13621215240', NULL, NULL, '5', NULL, 1, '2023-09-16 22:58:04', '2023-09-19 03:05:27', 0);
INSERT INTO `sys_user` VALUES ('1866667762071986178', 'work1', 'e10adc3949ba59abbe56e057f20f883e', '沃克1', '123456789', NULL, NULL, NULL, NULL, 1, '2024-12-11 10:14:10', '2024-12-11 10:14:10', 0);
INSERT INTO `sys_user` VALUES ('19', 'oms', '96e79218965eb72c92a549dd5a330112', '欧美思', '17666578420', NULL, NULL, NULL, NULL, 1, '2023-02-24 15:29:23', '2023-02-24 15:29:23', 0);
INSERT INTO `sys_user` VALUES ('2', 'wangqq', '96e79218965eb72c92a549dd5a330112', '王倩倩', '15010546381', 'http://r61cnlsfq.hn-bkt.clouddn.com/b09b3467-3d99-437a-bd2e-dd8c9be92bb8', '1022', '6', NULL, 1, '2022-02-08 10:35:38', '2023-03-26 23:20:42', 0);
INSERT INTO `sys_user` VALUES ('20', 'fengsb', '96e79218965eb72c92a549dd5a330112', '他奶奶的', '17666578420', NULL, NULL, NULL, NULL, 1, '2023-02-24 15:29:23', '2024-12-06 09:30:20', 1);
INSERT INTO `sys_user` VALUES ('22', 'dasany44uan', '96e79218965eb72c92a549dd5a330112', '去你的', '17666578420', NULL, '2017', NULL, NULL, 1, '2023-02-24 15:33:52', '2024-12-06 09:30:17', 1);
INSERT INTO `sys_user` VALUES ('23', 'fengsb444', '96e79218965eb72c92a549dd5a330112', '他奶奶的你你你你你你', '17666578420', NULL, '2018', NULL, NULL, 1, '2023-02-24 15:33:52', '2024-12-06 09:30:15', 1);
INSERT INTO `sys_user` VALUES ('25', '奋斗奋斗', 'b8ce334bae3faf976fa457702fe7545b', '分地方地方', '17666564356', NULL, '10', NULL, NULL, NULL, '2023-02-25 00:36:20', '2024-12-06 09:30:12', 1);
INSERT INTO `sys_user` VALUES ('26', '3333', '96e79218965eb72c92a549dd5a330112', '111111', '13423232143', NULL, '1026', NULL, NULL, NULL, '2023-02-25 00:37:19', '2024-12-06 09:30:09', 1);
INSERT INTO `sys_user` VALUES ('28', '33335444', '1a100d2c0dab19c4430e7d73762b3423', '333333', '33333333333', NULL, '20', NULL, NULL, NULL, '2023-02-25 00:40:20', '2024-12-06 09:30:07', 1);
INSERT INTO `sys_user` VALUES ('29', '454545', '1a100d2c0dab19c4430e7d73762b3423', '222222', '11111111111', NULL, '2017', NULL, NULL, NULL, '2023-02-25 00:43:30', '2024-12-06 09:29:54', 1);
INSERT INTO `sys_user` VALUES ('2bfcb4ceab3932f9019481dd0d4f9408', '测试20230420', 'e10adc3949ba59abbe56e057f20f883e', '邢道荣', '13785748965', NULL, NULL, NULL, NULL, 0, '2023-04-20 14:37:55', '2024-10-05 18:30:43', 0);
INSERT INTO `sys_user` VALUES ('3', 'wanggang', '96e79218965eb72c92a549dd5a330112', '王霄', '18909098909', NULL, '2016', '5', NULL, 1, '2022-05-24 11:05:40', '2023-02-22 21:20:02', 0);
INSERT INTO `sys_user` VALUES ('30', 'dfdsfdfdsf', '73882ab1fa529d7273da0db6b49cc4f3', '2223434', '66666666666', NULL, '30', NULL, NULL, NULL, '2023-02-25 00:52:26', '2024-12-06 09:30:03', 1);
INSERT INTO `sys_user` VALUES ('32', '33333让人 ', '73882ab1fa529d7273da0db6b49cc4f3', '33434343', '44444444444', NULL, '2016', NULL, NULL, 1, '2023-02-25 01:18:42', '2024-12-06 09:30:00', 1);
INSERT INTO `sys_user` VALUES ('4', 'zhangsanf', '123456', '张三丰', '17755678942', NULL, NULL, NULL, NULL, NULL, '2023-02-17 12:20:04', '2023-02-17 12:21:28', 1);
INSERT INTO `sys_user` VALUES ('5', 'fdfdfd', '96e79218965eb72c92a549dd5a330112', '111111', '13621215240', NULL, NULL, NULL, NULL, 1, '2023-02-19 14:38:45', '2023-02-20 01:57:03', 1);
INSERT INTO `sys_user` VALUES ('6', '周先生', '96e79218965eb72c92a549dd5a330112', '周先生', '13545489658', NULL, '2013', NULL, NULL, 1, '2023-02-21 23:49:16', '2023-04-21 00:29:06', 0);
INSERT INTO `sys_user` VALUES ('7', '李大侠', '96e79218965eb72c92a549dd5a330112', '李大侠', '13800000000', NULL, '2017', NULL, NULL, 1, '2023-02-22 21:38:00', '2023-04-21 01:39:33', 0);
INSERT INTO `sys_user` VALUES ('8', 'lsq', '96e79218965eb72c92a549dd5a330112', '李思琪', '17666578420', NULL, '1026', NULL, NULL, 1, '2023-02-23 15:59:04', '2024-12-08 11:32:00', 0);
INSERT INTO `sys_user` VALUES ('85fcd7e29ce8908e27d63ad6144a8bca', 'zhenzhen', 'e10adc3949ba59abbe56e057f20f883e', '珍珍', '13800138000', NULL, NULL, '9', NULL, 1, '2023-04-27 23:14:37', '2023-09-16 22:39:06', 0);
INSERT INTO `sys_user` VALUES ('886f5b1da471ca35ad0eb9445b22c1b7', '霍石斛', '21218cca77804d2ba1922c33e0151105', '郝大通', '12478954789', NULL, NULL, NULL, NULL, 1, '2023-04-20 14:40:47', '2023-04-21 01:35:38', 0);
INSERT INTO `sys_user` VALUES ('9', 'zhang', '96e79218965eb72c92a549dd5a330112', '徐亚', '17666578420', NULL, '20', NULL, NULL, 1, '2023-02-23 15:59:04', '2024-12-08 11:31:06', 0);
INSERT INTO `sys_user` VALUES ('dd59e1b7fd2e900869775ebe1127afb5', 'xyy', '9b4da352f6e432d64f545e1704590b53', '逍遥游', '333333', NULL, '2013', NULL, NULL, 1, '2023-04-14 02:28:38', '2024-12-08 11:30:54', 1);

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept`;
CREATE TABLE `sys_user_dept`  (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dept_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `create_time` timestamp NOT NULL,
  `update_time` timestamp NOT NULL,
  `is_deleted` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户和部门中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------
INSERT INTO `sys_user_dept` VALUES ('0216ec8e31bcad0acb1d45b68d14729a', 'dd59e1b7fd2e900869775ebe1127afb5', '30', '2023-04-21 01:36:35', '2023-04-21 01:36:35', 1);
INSERT INTO `sys_user_dept` VALUES ('021b2ec707ccd4ab9748453db423182a', '9', '2016', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('05455ee60de5eafdd4cdb98c65033e39', '886f5b1da471ca35ad0eb9445b22c1b7', '2012', '2023-04-20 14:41:45', '2023-04-20 14:41:45', 1);
INSERT INTO `sys_user_dept` VALUES ('092f7bf0f667840be7a7614627d8304e', '886f5b1da471ca35ad0eb9445b22c1b7', '2016', '2023-04-20 14:41:45', '2023-04-20 14:41:45', 1);
INSERT INTO `sys_user_dept` VALUES ('0d19b2d724bbfc55c9a6eb66b8cb86cb', '9', '2017', '2023-04-21 01:35:57', '2023-04-21 01:35:57', 0);
INSERT INTO `sys_user_dept` VALUES ('0e6750ff408f93ccc0f2ead27f4964dd', '9', '20', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('1652698891527208962', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-04-30 23:38:16', '2023-04-30 23:38:16', 1);
INSERT INTO `sys_user_dept` VALUES ('1652698891560763393', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-04-30 23:38:16', '2023-04-30 23:38:16', 1);
INSERT INTO `sys_user_dept` VALUES ('1652698891564957698', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-04-30 23:38:16', '2023-04-30 23:38:16', 1);
INSERT INTO `sys_user_dept` VALUES ('1652700548197617666', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-04-30 23:44:51', '2023-04-30 23:44:51', 1);
INSERT INTO `sys_user_dept` VALUES ('1652700548218589185', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-04-30 23:44:51', '2023-04-30 23:44:51', 1);
INSERT INTO `sys_user_dept` VALUES ('1652700548243755009', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-04-30 23:44:51', '2023-04-30 23:44:51', 1);
INSERT INTO `sys_user_dept` VALUES ('1652729128482856961', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-05-01 01:38:25', '2023-05-01 01:38:25', 1);
INSERT INTO `sys_user_dept` VALUES ('1652729128495439873', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-05-01 01:38:25', '2023-05-01 01:38:25', 1);
INSERT INTO `sys_user_dept` VALUES ('1652729128512217089', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-05-01 01:38:25', '2023-05-01 01:38:25', 1);
INSERT INTO `sys_user_dept` VALUES ('1653000897789759489', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-05-01 19:38:20', '2023-05-01 19:38:20', 1);
INSERT INTO `sys_user_dept` VALUES ('1653000897814925313', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-05-01 19:38:20', '2023-05-01 19:38:20', 1);
INSERT INTO `sys_user_dept` VALUES ('1653000897827508225', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-05-01 19:38:20', '2023-05-01 19:38:20', 1);
INSERT INTO `sys_user_dept` VALUES ('1653296716740915202', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-05-02 15:13:49', '2023-05-02 15:13:49', 1);
INSERT INTO `sys_user_dept` VALUES ('1653296716774469634', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-05-02 15:13:49', '2023-05-02 15:13:49', 1);
INSERT INTO `sys_user_dept` VALUES ('1653296716820606978', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-05-02 15:13:49', '2023-05-02 15:13:49', 1);
INSERT INTO `sys_user_dept` VALUES ('1687900815578677249', 'dd59e1b7fd2e900869775ebe1127afb5', '30', '2023-08-06 02:58:09', '2023-08-06 02:58:09', 0);
INSERT INTO `sys_user_dept` VALUES ('1687900815578677250', 'dd59e1b7fd2e900869775ebe1127afb5', '2013', '2023-08-06 02:58:09', '2023-08-06 02:58:09', 0);
INSERT INTO `sys_user_dept` VALUES ('1687900815578677251', 'dd59e1b7fd2e900869775ebe1127afb5', '2018', '2023-08-06 02:58:09', '2023-08-06 02:58:09', 0);
INSERT INTO `sys_user_dept` VALUES ('1695816509540646914', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-08-27 23:12:17', '2023-08-27 23:12:17', 1);
INSERT INTO `sys_user_dept` VALUES ('1695816509540646915', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-08-27 23:12:17', '2023-08-27 23:12:17', 1);
INSERT INTO `sys_user_dept` VALUES ('1695816509540646916', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-08-27 23:12:17', '2023-08-27 23:12:17', 1);
INSERT INTO `sys_user_dept` VALUES ('1703055571687632897', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-09-16 22:37:44', '2023-09-16 22:37:44', 1);
INSERT INTO `sys_user_dept` VALUES ('1703055571687632898', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-09-16 22:37:44', '2023-09-16 22:37:44', 1);
INSERT INTO `sys_user_dept` VALUES ('1703055571687632899', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-09-16 22:37:44', '2023-09-16 22:37:44', 1);
INSERT INTO `sys_user_dept` VALUES ('1703055661303132161', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-09-16 22:38:06', '2023-09-16 22:38:06', 1);
INSERT INTO `sys_user_dept` VALUES ('1703055661303132162', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-09-16 22:38:06', '2023-09-16 22:38:06', 1);
INSERT INTO `sys_user_dept` VALUES ('1703055661370241026', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-09-16 22:38:06', '2023-09-16 22:38:06', 1);
INSERT INTO `sys_user_dept` VALUES ('1703055916052574209', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-09-16 22:39:06', '2023-09-16 22:39:06', 0);
INSERT INTO `sys_user_dept` VALUES ('1703055916052574210', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-09-16 22:39:06', '2023-09-16 22:39:06', 0);
INSERT INTO `sys_user_dept` VALUES ('1703055916052574211', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-09-16 22:39:06', '2023-09-16 22:39:06', 0);
INSERT INTO `sys_user_dept` VALUES ('1703060687597662210', '1703060687534747649', '10', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687597662211', '1703060687534747649', '1010', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687597662212', '1703060687534747649', '1021', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687597662213', '1703060687534747649', '1022', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687597662214', '1703060687534747649', '1024', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687597662215', '1703060687534747649', '1020', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687597662216', '1703060687534747649', '1025', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687597662217', '1703060687534747649', '1026', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687668965377', '1703060687534747649', '1027', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703060687668965378', '1703060687534747649', '1028', '2023-09-16 22:58:04', '2023-09-16 22:58:04', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270111956267010', '1703060687534747649', '10', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270111956267011', '1703060687534747649', '1010', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270112023375874', '1703060687534747649', '1021', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270112023375875', '1703060687534747649', '1022', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270112023375876', '1703060687534747649', '1024', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270112023375877', '1703060687534747649', '1020', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270112023375878', '1703060687534747649', '1025', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270112023375879', '1703060687534747649', '1026', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270112023375880', '1703060687534747649', '1027', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703270112090484738', '1703060687534747649', '1028', '2023-09-17 12:50:15', '2023-09-17 12:50:15', 1);
INSERT INTO `sys_user_dept` VALUES ('1703847720490418177', '1703060687534747649', '1027', '2023-09-19 03:05:27', '2023-09-19 03:05:27', 0);
INSERT INTO `sys_user_dept` VALUES ('1967c3db8e45c07c8ec8ed85e63e8b5f', 'dd59e1b7fd2e900869775ebe1127afb5', '30', '2023-04-21 01:37:21', '2023-04-21 01:37:21', 1);
INSERT INTO `sys_user_dept` VALUES ('1b386d905139b52936f65fe170e096a8', '886f5b1da471ca35ad0eb9445b22c1b7', '2017', '2023-04-20 14:40:47', '2023-04-20 14:40:47', 1);
INSERT INTO `sys_user_dept` VALUES ('22fcd7860e5d0e227d1aeae1ec9a062b', '886f5b1da471ca35ad0eb9445b22c1b7', '20', '2023-04-20 14:40:47', '2023-04-20 14:40:47', 1);
INSERT INTO `sys_user_dept` VALUES ('241866e0c5bbfd706c7522d447c723d5', '30', '2013', '2023-04-27 22:57:14', '2023-04-27 22:57:14', 0);
INSERT INTO `sys_user_dept` VALUES ('256206504cb0e48ac1b9df2de154b1ec', 'dd59e1b7fd2e900869775ebe1127afb5', '2018', '2023-04-21 01:36:35', '2023-04-21 01:36:35', 1);
INSERT INTO `sys_user_dept` VALUES ('296821e5f57646cd7ef50a83e81bfa35', '9', '1021', '2023-04-21 01:35:51', '2023-04-21 01:35:51', 1);
INSERT INTO `sys_user_dept` VALUES ('2e6248fcd7b53baa747b55ad8a99bd25', '85fcd7e29ce8908e27d63ad6144a8bca', '2013', '2023-04-27 23:14:37', '2023-04-27 23:14:37', 1);
INSERT INTO `sys_user_dept` VALUES ('30db58cd873ae31b38c3d1d1572cbe19', '9', '1025', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('31de401f7808ea814bb6a8bb91983f1a', '886f5b1da471ca35ad0eb9445b22c1b7', '20', '2023-04-20 14:41:45', '2023-04-20 14:41:45', 1);
INSERT INTO `sys_user_dept` VALUES ('32eebddbdf9a0bec7f25de8f4da4a0bc', '9', '1021', '2023-04-21 01:33:50', '2023-04-21 01:33:50', 1);
INSERT INTO `sys_user_dept` VALUES ('386f7b8da24201f02a44e9214c44e38e', '9', '1026', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('3906d22d589dcff5612a8973da7ffff1', '6', '2013', '2023-04-21 00:29:06', '2023-04-21 00:29:06', 0);
INSERT INTO `sys_user_dept` VALUES ('3c885c4a92cee9fb51c27de40e5c4750', '9', '2017', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('4a55685a085e14d845af44599cc2a391', 'dd59e1b7fd2e900869775ebe1127afb5', '2018', '2023-04-20 15:07:51', '2023-04-20 15:07:51', 1);
INSERT INTO `sys_user_dept` VALUES ('569a310846ced11df754f04962e31c64', '85fcd7e29ce8908e27d63ad6144a8bca', '30', '2023-04-27 23:14:37', '2023-04-27 23:14:37', 1);
INSERT INTO `sys_user_dept` VALUES ('5761fe2eb29cb5377f3cc49deeb3a2cf', '9', '1020', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('61e01c4a252a71dd9a7b371eba8e9a11', 'dd59e1b7fd2e900869775ebe1127afb5', '2018', '2023-04-21 01:37:21', '2023-04-21 01:37:21', 1);
INSERT INTO `sys_user_dept` VALUES ('64fbbeee8f8ba07517d98e8ffc120a37', '9', '10', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('6562e2e93791f63cdc4f7382f7226c70', '85fcd7e29ce8908e27d63ad6144a8bca', '2018', '2023-04-27 23:14:37', '2023-04-27 23:14:37', 1);
INSERT INTO `sys_user_dept` VALUES ('71d8467e1bfb60d30d75b13145384e97', '9', '2012', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('7629a61737872a680d5b710e4ac55376', '886f5b1da471ca35ad0eb9445b22c1b7', '2017', '2023-04-20 14:41:45', '2023-04-20 14:41:45', 1);
INSERT INTO `sys_user_dept` VALUES ('7a77c4efadb5ce2e773f7fa78ab0c81b', '9', '1010', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('7e596b887002b3548d2c30f537ddba50', '886f5b1da471ca35ad0eb9445b22c1b7', '2016', '2023-04-20 14:40:47', '2023-04-20 14:40:47', 1);
INSERT INTO `sys_user_dept` VALUES ('80269d0324abb518541f261dd4b2aacc', '8', '2017', '2023-04-21 20:27:02', '2023-04-21 20:27:02', 0);
INSERT INTO `sys_user_dept` VALUES ('87a088a669e9f18fb66a296c88db399b', '886f5b1da471ca35ad0eb9445b22c1b7', '2016', '2023-04-21 01:35:38', '2023-04-21 01:35:38', 0);
INSERT INTO `sys_user_dept` VALUES ('8a86ce4cff3330ca6b23bd7e4eca032a', 'dd59e1b7fd2e900869775ebe1127afb5', '2013', '2023-04-20 15:07:51', '2023-04-20 15:07:51', 1);
INSERT INTO `sys_user_dept` VALUES ('9305b97041e08bd6fc676ec72afac39a', '9', '1028', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('9c59da9a77ca3abce7f248b5d0702465', '886f5b1da471ca35ad0eb9445b22c1b7', '2012', '2023-04-20 14:40:47', '2023-04-20 14:40:47', 1);
INSERT INTO `sys_user_dept` VALUES ('9d1e70f689533bc52d02ec52d2819f0a', 'dd59e1b7fd2e900869775ebe1127afb5', '2013', '2023-04-21 01:37:21', '2023-04-21 01:37:21', 1);
INSERT INTO `sys_user_dept` VALUES ('a0ef31ca7f60839cd0658f0b4687b588', '9', '2017', '2023-04-21 01:35:51', '2023-04-21 01:35:51', 1);
INSERT INTO `sys_user_dept` VALUES ('a33cfd41337dac936d7adfccc6c06fe9', '9', '1024', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('b085018a6a5cd3e448c18fa7f7ca0a92', '7', '1027', '2023-04-21 01:39:33', '2023-04-21 01:39:33', 0);
INSERT INTO `sys_user_dept` VALUES ('bc5fdb7747346969c0e8b5761066fafa', 'dd59e1b7fd2e900869775ebe1127afb5', '2013', '2023-04-21 01:36:35', '2023-04-21 01:36:35', 1);
INSERT INTO `sys_user_dept` VALUES ('c3648df3faca12e7832597500fd80f95', 'dd59e1b7fd2e900869775ebe1127afb5', '30', '2023-04-20 15:07:51', '2023-04-20 15:07:51', 1);
INSERT INTO `sys_user_dept` VALUES ('cd33d8b51634a889ee127a473ceb547b', '886f5b1da471ca35ad0eb9445b22c1b7', '2012', '2023-04-21 01:35:38', '2023-04-21 01:35:38', 0);
INSERT INTO `sys_user_dept` VALUES ('cd3743ed738b11b9e6e5783f0d60f2f5', '9', '1027', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('e4fca3c29363e9f6741ee11de65c0513', '9', '1022', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);
INSERT INTO `sys_user_dept` VALUES ('e625a14984b41015662b099e8797e863', '9', '1021', '2023-04-20 14:41:53', '2023-04-20 14:41:53', 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '主键id',
  `role_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_admin_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('10', '1', '4', '2022-06-02 16:10:53', '2022-06-02 16:10:53', 0);
INSERT INTO `sys_user_role` VALUES ('11', '2', '3', '2023-02-17 14:19:09', '2023-02-19 03:05:27', 1);
INSERT INTO `sys_user_role` VALUES ('12', '8', '3', '2023-02-17 14:19:09', '2023-02-19 03:05:27', 1);
INSERT INTO `sys_user_role` VALUES ('13', '2', '3', '2023-02-19 03:05:27', '2023-02-21 00:07:09', 1);
INSERT INTO `sys_user_role` VALUES ('14', '8', '3', '2023-02-19 03:05:27', '2023-02-21 00:07:09', 1);
INSERT INTO `sys_user_role` VALUES ('15', '1625026561937264644', '5', '2023-02-19 14:53:32', '2023-02-19 15:09:54', 1);
INSERT INTO `sys_user_role` VALUES ('16', '1625026561937264644', '5', '2023-02-19 15:09:54', '2023-02-19 23:17:19', 1);
INSERT INTO `sys_user_role` VALUES ('17', '1625026561937264644', '5', '2023-02-19 23:17:19', '2023-02-19 23:17:19', 0);
INSERT INTO `sys_user_role` VALUES ('1703064768378630145', '8', '1703060687534747649', '2023-09-16 23:14:17', '2023-09-16 23:14:17', 0);
INSERT INTO `sys_user_role` VALUES ('18', '1625026561937264644', '3', '2023-02-21 00:07:09', '2023-02-21 00:07:09', 0);
INSERT INTO `sys_user_role` VALUES ('1864668781506785282', '1625026561937264642', 'dd59e1b7fd2e900869775ebe1127afb5', '2024-12-05 21:50:56', '2024-12-06 09:29:33', 1);
INSERT INTO `sys_user_role` VALUES ('1864668833428074498', '1', '85fcd7e29ce8908e27d63ad6144a8bca', '2024-12-05 21:51:08', '2024-12-05 21:51:08', 0);
INSERT INTO `sys_user_role` VALUES ('1864668833428074499', '1625026561937264642', '85fcd7e29ce8908e27d63ad6144a8bca', '2024-12-05 21:51:08', '2024-12-05 21:51:08', 0);
INSERT INTO `sys_user_role` VALUES ('1864844594625703937', '1625026561937264642', 'dd59e1b7fd2e900869775ebe1127afb5', '2024-12-06 09:29:33', '2024-12-06 09:29:33', 0);
INSERT INTO `sys_user_role` VALUES ('1864844594638286849', '8', 'dd59e1b7fd2e900869775ebe1127afb5', '2024-12-06 09:29:33', '2024-12-06 09:29:33', 0);
INSERT INTO `sys_user_role` VALUES ('1864844594638286850', 'b62e7a2e5d54b980aee2f197170a623c', 'dd59e1b7fd2e900869775ebe1127afb5', '2024-12-06 09:29:33', '2024-12-06 09:29:33', 0);
INSERT INTO `sys_user_role` VALUES ('1866668061381713922', '1866667979827666945', '1866667762071986178', '2024-12-11 10:15:21', '2024-12-11 10:15:21', 0);
INSERT INTO `sys_user_role` VALUES ('2', '2', '2', '2022-01-20 20:49:37', '2022-02-24 10:43:07', 0);
INSERT INTO `sys_user_role` VALUES ('3', '1', '1', '2022-05-19 10:37:27', '2022-05-24 16:55:53', 1);
INSERT INTO `sys_user_role` VALUES ('4', '2', '1', '2022-05-19 10:37:27', '2022-05-24 16:55:53', 1);
INSERT INTO `sys_user_role` VALUES ('5', '1', '1', '2022-05-24 16:55:53', '2022-05-24 16:55:53', 0);
INSERT INTO `sys_user_role` VALUES ('6', '2', '3', '2022-05-25 16:09:31', '2023-02-17 14:19:09', 1);
INSERT INTO `sys_user_role` VALUES ('647b7e91cfd93688b5e89d14bb706e14', '1', '85fcd7e29ce8908e27d63ad6144a8bca', '2023-04-27 23:18:10', '2024-12-05 21:51:08', 1);
INSERT INTO `sys_user_role` VALUES ('7', '2', '4', '2022-06-02 11:08:14', '2022-06-02 11:15:36', 1);
INSERT INTO `sys_user_role` VALUES ('8', '2', '4', '2022-06-02 11:15:36', '2022-06-02 16:10:53', 1);
INSERT INTO `sys_user_role` VALUES ('9', '1', '4', '2022-06-02 11:15:36', '2022-06-02 16:10:53', 1);

SET FOREIGN_KEY_CHECKS = 1;
