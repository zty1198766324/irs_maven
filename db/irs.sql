/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1:3306
 Source Schema         : irs

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 15/06/2020 09:48:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '全名',
  `e_mail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别：0女，1男,2保密',
  `birthday` date NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'arthur', 'duxiaod@qq.com', '1', '1994-11-08', '陕西省西安市雁塔区', '17693109997', 1);
INSERT INTO `tb_admin` VALUES (2, 'guest', 'e10adc3949ba59abbe56e057f20f883e', NULL, '测试', '645274396@qq.com', '1', '2020-06-15', '华美居', '18998949646', 3);

-- ----------------------------
-- Table structure for tb_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源地址',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `spread` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'true：展开，false：不展开',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点',
  `sorting` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menus
-- ----------------------------
INSERT INTO `tb_menus` VALUES (1, '后台首页', '', 'page/main.html', '', 'false', 0, 9999);
INSERT INTO `tb_menus` VALUES (2, '管理员管理', '', '', '', 'false', 0, 999);
INSERT INTO `tb_menus` VALUES (3, '角色管理', '', 'sys/roleList', '', 'false', 2, 99);
INSERT INTO `tb_menus` VALUES (4, '管理员列表', '&#xe613;', 'sys/adminList', NULL, 'false', 2, 98);
INSERT INTO `tb_menus` VALUES (9, '用户管理', '&#xe61d;', NULL, NULL, 'false', 0, 998);
INSERT INTO `tb_menus` VALUES (10, '添加用户', '&#xe608;', 'user/addUser', NULL, 'false', 9, NULL);
INSERT INTO `tb_menus` VALUES (11, '管理用户', '&#xe60e;', 'user/userList', NULL, 'false', 9, NULL);
INSERT INTO `tb_menus` VALUES (16, '查看', '', '', 'sys:role:list', 'false', 3, NULL);
INSERT INTO `tb_menus` VALUES (17, '新增', NULL, NULL, 'sys:role:save', 'false', 3, NULL);
INSERT INTO `tb_menus` VALUES (18, '修改', NULL, NULL, 'sys:role:update', 'false', 3, NULL);
INSERT INTO `tb_menus` VALUES (19, '删除', NULL, NULL, 'sys:role:delete', 'false', 3, NULL);
INSERT INTO `tb_menus` VALUES (20, '查看', NULL, NULL, 'sys:admin:list', 'false', 4, NULL);
INSERT INTO `tb_menus` VALUES (21, '新增', NULL, NULL, 'sys:admin:save', 'false', 4, NULL);
INSERT INTO `tb_menus` VALUES (22, '修改', NULL, NULL, 'sys:admin:update', 'false', 4, NULL);
INSERT INTO `tb_menus` VALUES (23, '删除', NULL, NULL, 'sys:admin:delete', 'false', 4, NULL);
INSERT INTO `tb_menus` VALUES (33, '新增', NULL, NULL, 'user:user:save', 'false', 10, NULL);
INSERT INTO `tb_menus` VALUES (34, '查看', NULL, NULL, 'user:user:list', 'false', 11, NULL);
INSERT INTO `tb_menus` VALUES (35, '新增', NULL, NULL, 'user:user:save', 'false', 11, NULL);
INSERT INTO `tb_menus` VALUES (36, '修改', NULL, NULL, 'user:user:update', 'false', 11, NULL);
INSERT INTO `tb_menus` VALUES (37, '删除', NULL, NULL, 'user:user:delete', 'false', 11, NULL);
INSERT INTO `tb_menus` VALUES (46, '菜单管理', '&#xe642;', 'sys/menuList', NULL, 'false', 2, 97);
INSERT INTO `tb_menus` VALUES (47, '查看', NULL, NULL, 'sys:menu:list', 'false', 46, NULL);
INSERT INTO `tb_menus` VALUES (48, '新增', NULL, NULL, 'sys:menu:save', 'false', 46, NULL);
INSERT INTO `tb_menus` VALUES (49, '修改', NULL, NULL, 'sys:menu:update', 'false', 46, NULL);
INSERT INTO `tb_menus` VALUES (50, '删除', NULL, NULL, 'sys:menu:delete', 'false', 46, NULL);
INSERT INTO `tb_menus` VALUES (72, '产品工厂', '', '/product/list', '', 'false', 0, 5);

-- ----------------------------
-- Table structure for tb_roles
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE `tb_roles`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名',
  `role_remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_roles
-- ----------------------------
INSERT INTO `tb_roles` VALUES (1, '超级管理员', '超级管理员');
INSERT INTO `tb_roles` VALUES (2, '总经理', '总经理');
INSERT INTO `tb_roles` VALUES (3, '部门经理', '部门经理');
INSERT INTO `tb_roles` VALUES (4, '普通员工', '普通员工');

-- ----------------------------
-- Table structure for tb_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles_menus`;
CREATE TABLE `tb_roles_menus`  (
  `menu_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`menu_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `tb_roles_menus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `tb_menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_roles_menus_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_roles_menus
-- ----------------------------
INSERT INTO `tb_roles_menus` VALUES (1, 1);
INSERT INTO `tb_roles_menus` VALUES (2, 1);
INSERT INTO `tb_roles_menus` VALUES (3, 1);
INSERT INTO `tb_roles_menus` VALUES (4, 1);
INSERT INTO `tb_roles_menus` VALUES (9, 1);
INSERT INTO `tb_roles_menus` VALUES (10, 1);
INSERT INTO `tb_roles_menus` VALUES (11, 1);
INSERT INTO `tb_roles_menus` VALUES (16, 1);
INSERT INTO `tb_roles_menus` VALUES (17, 1);
INSERT INTO `tb_roles_menus` VALUES (18, 1);
INSERT INTO `tb_roles_menus` VALUES (19, 1);
INSERT INTO `tb_roles_menus` VALUES (20, 1);
INSERT INTO `tb_roles_menus` VALUES (21, 1);
INSERT INTO `tb_roles_menus` VALUES (22, 1);
INSERT INTO `tb_roles_menus` VALUES (23, 1);
INSERT INTO `tb_roles_menus` VALUES (33, 1);
INSERT INTO `tb_roles_menus` VALUES (34, 1);
INSERT INTO `tb_roles_menus` VALUES (35, 1);
INSERT INTO `tb_roles_menus` VALUES (36, 1);
INSERT INTO `tb_roles_menus` VALUES (37, 1);
INSERT INTO `tb_roles_menus` VALUES (46, 1);
INSERT INTO `tb_roles_menus` VALUES (47, 1);
INSERT INTO `tb_roles_menus` VALUES (48, 1);
INSERT INTO `tb_roles_menus` VALUES (49, 1);
INSERT INTO `tb_roles_menus` VALUES (50, 1);
INSERT INTO `tb_roles_menus` VALUES (72, 1);
INSERT INTO `tb_roles_menus` VALUES (1, 2);
INSERT INTO `tb_roles_menus` VALUES (2, 2);
INSERT INTO `tb_roles_menus` VALUES (3, 2);
INSERT INTO `tb_roles_menus` VALUES (4, 2);
INSERT INTO `tb_roles_menus` VALUES (9, 2);
INSERT INTO `tb_roles_menus` VALUES (10, 2);
INSERT INTO `tb_roles_menus` VALUES (11, 2);
INSERT INTO `tb_roles_menus` VALUES (16, 2);
INSERT INTO `tb_roles_menus` VALUES (17, 2);
INSERT INTO `tb_roles_menus` VALUES (18, 2);
INSERT INTO `tb_roles_menus` VALUES (19, 2);
INSERT INTO `tb_roles_menus` VALUES (20, 2);
INSERT INTO `tb_roles_menus` VALUES (21, 2);
INSERT INTO `tb_roles_menus` VALUES (22, 2);
INSERT INTO `tb_roles_menus` VALUES (23, 2);
INSERT INTO `tb_roles_menus` VALUES (33, 2);
INSERT INTO `tb_roles_menus` VALUES (34, 2);
INSERT INTO `tb_roles_menus` VALUES (35, 2);
INSERT INTO `tb_roles_menus` VALUES (36, 2);
INSERT INTO `tb_roles_menus` VALUES (37, 2);
INSERT INTO `tb_roles_menus` VALUES (46, 2);
INSERT INTO `tb_roles_menus` VALUES (47, 2);
INSERT INTO `tb_roles_menus` VALUES (48, 2);
INSERT INTO `tb_roles_menus` VALUES (49, 2);
INSERT INTO `tb_roles_menus` VALUES (50, 2);
INSERT INTO `tb_roles_menus` VALUES (9, 3);
INSERT INTO `tb_roles_menus` VALUES (10, 3);
INSERT INTO `tb_roles_menus` VALUES (11, 3);
INSERT INTO `tb_roles_menus` VALUES (33, 3);
INSERT INTO `tb_roles_menus` VALUES (34, 3);
INSERT INTO `tb_roles_menus` VALUES (35, 3);
INSERT INTO `tb_roles_menus` VALUES (36, 3);
INSERT INTO `tb_roles_menus` VALUES (37, 3);
INSERT INTO `tb_roles_menus` VALUES (9, 4);
INSERT INTO `tb_roles_menus` VALUES (10, 4);
INSERT INTO `tb_roles_menus` VALUES (11, 4);
INSERT INTO `tb_roles_menus` VALUES (33, 4);
INSERT INTO `tb_roles_menus` VALUES (34, 4);
INSERT INTO `tb_roles_menus` VALUES (35, 4);
INSERT INTO `tb_roles_menus` VALUES (36, 4);
INSERT INTO `tb_roles_menus` VALUES (37, 4);
INSERT INTO `tb_roles_menus` VALUES (72, 4);

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users`  (
  `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `e_mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称：唯一',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '0:女，1:男，2：保密',
  `birthday` date NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `e_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '0:未激活，1，正常，2，禁用',
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES (35, '645274396@qq.com', '测试', 'e10adc3949ba59abbe56e057f20f883e', '1', '2020-06-15', '华美居', '18998949646', 'ba34413f984d4c6db918968617315c04437', '1', '2020-06-15 08:55:58');

SET FOREIGN_KEY_CHECKS = 1;
