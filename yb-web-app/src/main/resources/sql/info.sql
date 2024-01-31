/*
 Navicat Premium Data Transfer

 Source Server         : 43.142.146.167
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : 43.142.146.167:3306
 Source Schema         : db

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 31/01/2024 17:29:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL,
  `tel` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  `time` datetime(3) NULL DEFAULT NULL,
  `del_fag` int NULL DEFAULT NULL COMMENT '0未删除 1:已删除',
  `del_time` bigint NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_name`(`name`, `del_fag`, `del_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', '张三', 'sBqUf9gve1luuARvcFlihg==', '2023-10-11 11:50:47.000', 0, 1);
INSERT INTO `info` VALUES ('2', '李四', 'sBqUf9gve1luuARvcFlihg==', '2023-10-11 11:58:09.000', 0, 2);
INSERT INTO `info` VALUES ('3', '王五', 'sBqUf9gve1luuARvcFlihg==', '2023-10-11 11:54:09.000', 0, 3);
INSERT INTO `info` VALUES ('525c3f0d0dc279b65633b30a7327954b', '王五', 'sBqUf9gve1nbfjJxHAQaVw==', '2023-11-13 17:19:55.177', 1, 1699867313540);
INSERT INTO `info` VALUES ('67dc898bc287515cb23a235af80cf2d2', '王五', 'sBqUf9gve1nbfjJxHAQaVw==', '2023-11-13 17:23:17.167', 0, 0);
INSERT INTO `info` VALUES ('facd776c9e64c717f404692bc06a3629', '1333', 'sBqUf9gve1n6x2gaLjydSA==', '2024-01-05 16:56:32.220', 0, 0);

-- ----------------------------
-- Table structure for info_history
-- ----------------------------
DROP TABLE IF EXISTS `info_history`;
CREATE TABLE `info_history`  (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL,
  `info_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL COMMENT '信息表主键',
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info_history
-- ----------------------------

-- ----------------------------
-- Table structure for mytable
-- ----------------------------
DROP TABLE IF EXISTS `mytable`;
CREATE TABLE `mytable`  (
  `ID` int NOT NULL,
  `username` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL,
  `age` int NOT NULL,
  INDEX `name_city_age`(`username`(10), `city`, `age`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mytable
-- ----------------------------

-- ----------------------------
-- Table structure for new_file
-- ----------------------------
DROP TABLE IF EXISTS `new_file`;
CREATE TABLE `new_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int NULL DEFAULT NULL COMMENT '0:文件夹 1:文件',
  `folder_id` bigint NULL DEFAULT NULL COMMENT '目录 id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件唯一指纹',
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储名称',
  `open` bit(1) NULL DEFAULT NULL COMMENT '是否公开',
  `ico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标类型',
  `thumb` varchar(520) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预览地址',
  `created_by` bigint NULL DEFAULT NULL COMMENT '上传者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_by` bigint NULL DEFAULT NULL COMMENT '修改者',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` bigint NULL DEFAULT 0 COMMENT '乐观锁',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new_file
-- ----------------------------
INSERT INTO `new_file` VALUES (17, 1, 26, 'Unity考核.docx', 'docx', 15992, NULL, NULL, b'1', NULL, '/xasytest/doc/Unity考核_20240112092956.docx', 41, '2024-01-12 09:29:56', NULL, NULL, 0, 0);
INSERT INTO `new_file` VALUES (18, 1, 0, '补助模板.xlsx', 'xlsx', 24576, NULL, NULL, b'1', NULL, '/xasytest/doc/补助模板_20240115095423.xlsx', 41, '2024-01-12 10:17:33', NULL, NULL, 0, 0);
INSERT INTO `new_file` VALUES (19, 1, 0, '补助模板.xlsx', 'xlsx', 24576, NULL, NULL, b'1', NULL, '/xasytest/doc/补助模板_20240115095423.xlsx', 42, '2024-01-15 09:54:24', NULL, NULL, 0, 0);
INSERT INTO `new_file` VALUES (20, 1, 0, '巡检验收.xls', 'xls', 14321, NULL, NULL, b'1', NULL, '/xasytest/doc/巡检验收_20240116143408.xls', 42, '2024-01-16 14:34:08', NULL, NULL, 0, 0);
INSERT INTO `new_file` VALUES (21, 1, 38, '待派单.xls', 'xls', 13954, NULL, NULL, b'1', NULL, '/xasytest/doc/待派单_20240116173819.xls', 42, '2024-01-16 17:38:20', NULL, NULL, 0, 0);
INSERT INTO `new_file` VALUES (22, 1, 0, '待派单.xls', 'xls', 13954, NULL, NULL, b'1', NULL, '/xasytest/doc/待派单_20240117093526.xls', 41, '2024-01-17 09:35:26', NULL, NULL, 0, 0);
INSERT INTO `new_file` VALUES (23, 1, 0, '智慧后勤功能介绍(wz).docx', 'docx', 48508, NULL, NULL, b'1', NULL, '/xasytest/doc/智慧后勤功能介绍(wz)_20240117103304.docx', 41, '2024-01-17 10:33:05', NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for new_folder
-- ----------------------------
DROP TABLE IF EXISTS `new_folder`;
CREATE TABLE `new_folder`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件夹名称',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父id',
  `type` bigint NULL DEFAULT NULL COMMENT 'type',
  `created_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_by` bigint NULL DEFAULT NULL COMMENT '修改者',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` bigint NULL DEFAULT 0 COMMENT '乐观锁',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new_folder
-- ----------------------------
INSERT INTO `new_folder` VALUES (22, '资源', 0, 0, 41, '2024-01-11 11:49:09', 41, '2024-01-11 16:15:33', 0, 0);
INSERT INTO `new_folder` VALUES (25, '资源1', 22, 0, 41, '2024-01-11 11:51:12', 41, '2024-01-11 17:12:29', 0, 0);
INSERT INTO `new_folder` VALUES (26, '资源22222编辑', 25, 0, 41, '2024-01-11 11:51:12', 41, '2024-01-11 17:12:52', 0, 0);
INSERT INTO `new_folder` VALUES (28, '测试新增', 0, 0, 41, '2024-01-11 17:16:59', 41, '2024-01-11 17:16:59', 0, 0);
INSERT INTO `new_folder` VALUES (38, '资源', 0, 0, 42, '2024-01-15 09:54:02', 42, '2024-01-15 09:54:02', 0, 0);

-- ----------------------------
-- Table structure for new_share
-- ----------------------------
DROP TABLE IF EXISTS `new_share`;
CREATE TABLE `new_share`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `ico` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类别',
  `file_id` bigint NULL DEFAULT NULL COMMENT '文件 id',
  `open` bit(1) NULL DEFAULT NULL COMMENT '是否公开',
  `share_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享码',
  `pickup_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取件码',
  `state` int NULL DEFAULT 1 COMMENT '状态 0：已失效、1：永久有效、自定义天数',
  `views` bigint NULL DEFAULT 0 COMMENT '下载次数',
  `created_by` bigint NULL DEFAULT NULL COMMENT '上传者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_by` bigint NULL DEFAULT NULL COMMENT '修改者',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `version` bigint NULL DEFAULT 0 COMMENT '乐观锁',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  `share_obj` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '共享对象',
  `share_auth` json NULL COMMENT '共享权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of new_share
-- ----------------------------
INSERT INTO `new_share` VALUES (11, 'Unity考核.docx', 'docx', 15992, 'docx', 17, b'1', '6t3gxhtg7jp2xq2r', 'ptpb', -1, 0, 41, '2024-01-12 15:27:25', 41, '2024-01-12 15:27:25', 0, 0, '41,42', '{\"look\": true, \"download\": true}');
INSERT INTO `new_share` VALUES (28, '补助模板.xlsx', NULL, 24576, 'xlsx', 18, b'1', 'v2wixupduaayx5nf', 'mw5q', -1, 0, 41, '2024-01-16 17:07:41', 41, '2024-01-16 17:07:41', 0, 0, '59,57,42', '{\"look\": true, \"download\": false}');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  `num` int NULL DEFAULT -1,
  `version` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '', 2, 1001);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码重试次数', '2023-06-14 02:48:15');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码重试次数', '2023-06-14 02:48:16');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '125.76.212.211', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码重试次数', '2023-06-14 03:12:20');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '113.132.11.179', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码重试次数', '2023-07-06 06:05:12');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '202.100.35.106', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码重试次数', '2023-08-08 07:15:51');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '202.100.35.106', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码重试次数', '2023-08-08 07:15:59');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '备注',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  `is_refresh` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1060 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-06-14 01:36:44', '', NULL, '系统管理目录', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-06-14 01:36:44', '', NULL, '系统监控目录', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-06-14 01:36:44', '', NULL, '系统工具目录', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-06-14 01:36:44', '', NULL, '若依官网地址', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-06-14 01:36:44', '', NULL, '用户管理菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-06-14 01:36:44', '', NULL, '角色管理菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-06-14 01:36:44', '', NULL, '菜单管理菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-06-14 01:36:44', '', NULL, '部门管理菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-06-14 01:36:44', '', NULL, '岗位管理菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-06-14 01:36:44', '', NULL, '字典管理菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-06-14 01:36:44', '', NULL, '参数设置菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-06-14 01:36:44', '', NULL, '通知公告菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-06-14 01:36:44', '', NULL, '日志管理菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-06-14 01:36:44', '', NULL, '在线用户菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-06-14 01:36:44', '', NULL, '定时任务菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-06-14 01:36:44', '', NULL, '数据监控菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-06-14 01:36:45', '', NULL, '服务监控菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-06-14 01:36:45', '', NULL, '缓存监控菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-06-14 01:36:45', '', NULL, '缓存列表菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-06-14 01:36:45', '', NULL, '表单构建菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-06-14 01:36:45', '', NULL, '代码生成菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-06-14 01:36:45', '', NULL, '系统接口菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-06-14 01:36:45', '', NULL, '操作日志菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-06-14 01:36:45', '', NULL, '登录日志菜单', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-06-14 01:36:45', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-06-14 01:36:46', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-06-14 01:36:47', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-06-14 01:36:48', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-06-14 01:36:48', '', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-06-14 01:36:48', '', NULL, '', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL COMMENT '备注',
  `version` bigint NULL DEFAULT 1 COMMENT '版本号',
  `login_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1738128657745375235 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-06-14 01:36:43', 'admin', '2023-06-14 01:36:43', '', NULL, '管理员', NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'admin', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-06-14 01:36:43', 'admin', '2023-06-14 01:36:43', '', NULL, '测试员', NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 103, 'liming', 'liming', '00', '4564564@qq.com', '13201537870', '0', '', 'e10adc3949ba59abbe56e057f20f883e', NULL, '0', '127.0.0.1', '2023-06-16 15:53:59', 'admin', '2023-06-16 15:54:03', '', NULL, NULL, 1, 'liming');
INSERT INTO `sys_user` VALUES (1738093680706084865, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738094365866614786, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738094478311710722, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738094505595658241, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738094566727639041, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738094575476957185, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738094741013602305, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738094972312690690, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738095027451011073, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738095671645773826, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738095824217776130, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738098085044072450, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738098219639287809, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738101530790662146, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738121798724567042, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738124219022454786, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);
INSERT INTO `sys_user` VALUES (1738128657745375234, NULL, '测试1', '测试1', '00', '', '13201537879', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `money` double(10, 2) NULL DEFAULT NULL,
  `datetime` datetime(0) NULL DEFAULT NULL,
  `image` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '占分公司', '2023-12-11 14:58:38', 100.00, '2023-12-12 19:40:31', NULL);
INSERT INTO `test` VALUES ('8aedb0a44a944682bad4e5c16ae6417a', '张三', '2024-01-18 17:09:13', 2000.00, NULL, NULL);
INSERT INTO `test` VALUES ('8d377774b4e045d09f4b6ded3abfcc90', '张三1', '2024-01-18 17:09:16', 3000.00, NULL, NULL);
INSERT INTO `test` VALUES ('931baa7358c04bd6b94ffbfb1ef7c42c', '开始', NULL, NULL, NULL, NULL);
INSERT INTO `test` VALUES ('a41b9298aa8c4078a4ffa1ee3eeea24f', '张三133333', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for test_enum
-- ----------------------------
DROP TABLE IF EXISTS `test_enum`;
CREATE TABLE `test_enum`  (
  `id` int NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci NULL DEFAULT NULL,
  `sex` tinyint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_enum
-- ----------------------------
INSERT INTO `test_enum` VALUES (1, '老王2', 2);
INSERT INTO `test_enum` VALUES (2, '老王', 1);
INSERT INTO `test_enum` VALUES (3, '老李', 3);

SET FOREIGN_KEY_CHECKS = 1;
