/*
 Navicat Premium Data Transfer

 Source Server         : local_wzh
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : pear-admin

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 27/07/2021 11:29:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
BEGIN;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'false', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', 1);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.0.0.4)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.0.0.4', 1);
COMMIT;

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for dishes_alipay
-- ----------------------------
DROP TABLE IF EXISTS `dishes_alipay`;
CREATE TABLE `dishes_alipay` (
  `pay_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付订单号',
  `order_id` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付详情',
  `pay_price` double(10,2) DEFAULT NULL COMMENT '支付价格',
  `pay_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付描述',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of dishes_alipay
-- ----------------------------
BEGIN;
INSERT INTO `dishes_alipay` VALUES ('2002b67a-09f8-4c47-bb50-2dbb45bbeca2', '62', 799.50, '支付宝支付', '2021-07-20 14:35:10');
INSERT INTO `dishes_alipay` VALUES ('35cf3eab-adb5-4423-adda-483fd398d90c', '81', 700.10, '支付宝支付', '2021-07-26 09:39:11');
INSERT INTO `dishes_alipay` VALUES ('37048fca-4a7d-485c-909f-3afceb4a6b0f', '64', 1433.00, '支付宝支付', '2021-07-20 17:17:41');
INSERT INTO `dishes_alipay` VALUES ('37951c4d-1291-4b07-b02f-a35ef397d2e4', '66', 1017.00, '支付宝支付', '2021-07-20 17:06:59');
INSERT INTO `dishes_alipay` VALUES ('3b3b481a-e4f6-4a22-8aec-d7ff62f111d9', '80', 652.60, '支付宝支付', '2021-07-26 09:29:14');
INSERT INTO `dishes_alipay` VALUES ('4da03b64-457d-435b-8396-cf65a3625a47', '82', 550.10, '支付宝支付', '2021-07-26 09:41:30');
INSERT INTO `dishes_alipay` VALUES ('56a7b01a-4c8a-4173-ae07-03d354144014', '[CustomerBill(orderId=19, orderBeginTime=Sat Jul 10 13:10:51 CST 2021, orderEndTime=Mon Jul 19 11:00:36 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=8, remark=null, dishesName=锅包肉, price=88.0, num=1, lineCountPrice=88.0), CustomerBill(orderId=19, orderBeginTime=Sat Jul 10 13:10:51 CST 2021, orderEndTime=Mon Jul 19 11:00:36 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=8, remark=null, dishesName=红烧肉, price=108.5, num=1, lineCountPrice=108.5), CustomerBill(orderId=19, orderBeginTime=Sat Jul 10 13:10:51 CST 2021, orderEndTime=Mon Jul 19 11:00:36 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=8, remark=null, dishesName=佛跳墙, price=208.0, num=2, lineCountPrice=416.0)]', 612.50, '支付宝支付', '2021-07-19 16:32:56');
INSERT INTO `dishes_alipay` VALUES ('85b23266-9f00-4049-87e8-fc49319b8fbb', '70', 841.00, '支付宝支付', '2021-07-20 16:44:00');
INSERT INTO `dishes_alipay` VALUES ('9a814b65-3887-4e50-aa0a-7c54388e2c0c', '83', 1023.10, '支付宝支付', '2021-07-27 11:03:38');
INSERT INTO `dishes_alipay` VALUES ('abeae62d-d3f9-4c7c-b511-45279226a08c', '[CustomerBill(orderId=29, orderBeginTime=Mon Jul 19 16:37:58 CST 2021, orderEndTime=Mon Jul 19 16:39:25 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=1, remark=null, dishesName=红烧肉, price=108.5, num=1, lineCountPrice=108.5), CustomerBill(orderId=29, orderBeginTime=Mon Jul 19 16:37:58 CST 2021, orderEndTime=Mon Jul 19 16:39:25 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=1, remark=null, dishesName=锅包肉, price=88.0, num=2, lineCountPrice=176.0), CustomerBill(orderId=29, orderBeginTime=Mon Jul 19 16:37:58 CST 2021, orderEndTime=Mon Jul 19 16:39:25 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=1, remark=null, dishesName=佛跳墙, price=208.0, num=1, lineCountPrice=416.0)]', 700.50, '支付宝支付', '2021-07-19 16:40:00');
INSERT INTO `dishes_alipay` VALUES ('b2849558-b2f8-45e6-b6f2-6da3c69b9090', '[CustomerBill(orderId=4, orderBeginTime=Mon Jun 22 15:07:23 CST 2020, orderEndTime=Tue Jul 06 17:30:16 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=1, remark=测试用户, dishesName=红烧肉, price=108.5, num=1, lineCountPrice=108.5)]', 108.50, '支付宝支付', '2021-07-19 10:59:33');
INSERT INTO `dishes_alipay` VALUES ('b933a4b3-1ccb-4c76-b29b-9edfacf23ec5', '[CustomerBill(orderId=3, orderBeginTime=Mon Jun 22 15:07:23 CST 2020, orderEndTime=Fri Jul 09 23:31:01 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=3, remark=测试用户, dishesName=锅包肉, price=88.0, num=1, lineCountPrice=88.0), CustomerBill(orderId=3, orderBeginTime=Mon Jun 22 15:07:23 CST 2020, orderEndTime=Fri Jul 09 23:31:01 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=3, remark=测试用户, dishesName=红烧肉, price=108.5, num=1, lineCountPrice=108.5)]', 196.50, '支付宝支付', '2021-07-19 10:48:55');
INSERT INTO `dishes_alipay` VALUES ('bd404db7-d812-42ee-8cbc-a24c47d891f5', '[CustomerBill(orderId=38, orderBeginTime=Mon Jul 19 19:22:59 CST 2021, orderEndTime=Tue Jul 20 10:22:48 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=9, remark=null, dishesName=佛跳墙, price=208.0, num=1, lineCountPrice=208.0), CustomerBill(orderId=38, orderBeginTime=Mon Jul 19 19:22:59 CST 2021, orderEndTime=Tue Jul 20 10:22:48 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=9, remark=null, dishesName=锅包肉, price=88.0, num=1, lineCountPrice=88.0)]', 296.00, '支付宝支付', '2021-07-20 10:22:56');
INSERT INTO `dishes_alipay` VALUES ('c20d1a3c-c08f-44fe-a79b-d9a7cf1191d0', '68', 680.00, '支付宝支付', '2021-07-20 16:50:41');
INSERT INTO `dishes_alipay` VALUES ('c31486d3-ec3d-499a-bc2b-99e7cfae8dd2', '71', 810.50, '支付宝支付', '2021-07-20 17:23:40');
INSERT INTO `dishes_alipay` VALUES ('d95cbff7-93fd-478d-8595-82d1e6defff5', '[CustomerBill(orderId=36, orderBeginTime=Mon Jul 19 19:19:28 CST 2021, orderEndTime=Tue Jul 20 10:25:06 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=2, remark=null, dishesName=红烧鱼, price=99.0, num=2, lineCountPrice=198.0), CustomerBill(orderId=36, orderBeginTime=Mon Jul 19 19:19:28 CST 2021, orderEndTime=Tue Jul 20 10:25:06 CST 2021, waiterId=1309861917694623744, waiterRealName=管理, orderState=2, tableId=2, remark=null, dishesName=佛跳墙, price=208.0, num=2, lineCountPrice=416.0)]', 614.00, '支付宝支付', '2021-07-20 10:25:14');
COMMIT;

-- ----------------------------
-- Table structure for dishes_food
-- ----------------------------
DROP TABLE IF EXISTS `dishes_food`;
CREATE TABLE `dishes_food` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜品编号',
  `name` varchar(50) NOT NULL COMMENT '菜品名称',
  `introduction` varchar(100) DEFAULT NULL COMMENT '菜品简介',
  `details` varchar(100) DEFAULT NULL COMMENT '菜品详情',
  `recommend` bit(1) DEFAULT NULL COMMENT '推荐菜品（0非推荐1推荐）',
  `picture_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜品图像地址',
  `price` decimal(10,2) NOT NULL COMMENT '餐品价格',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜品详情表';

-- ----------------------------
-- Records of dishes_food
-- ----------------------------
BEGIN;
INSERT INTO `dishes_food` VALUES (4, '红烧肉', '香甜、肥而不腻、美味可口', '红烧肉，一道著名的大众菜肴，各大菜系都有自己特色的红烧肉。其以五花肉为制作主料，最好选用肥瘦相间的三层肉（五花肉）来做，锅具以砂锅为主，做出来的肉肥瘦相间，香甜松软，营养丰富，入口即化', b'1', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fs1.cdn.xiachufang.com%2Fc519cbde88d311e6b87c0242ac110003_600w_387h.jpg%402o_50sh_1pr_1l_660w_90q_1wh&refer=http%3A%2F%2Fs1.cdn.xiachufang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627289547&t=07c8bd2e6fb9fb75b55bfac926161524', 108.50, NULL);
INSERT INTO `dishes_food` VALUES (5, '锅包肉', '口味酸甜', '锅包肉（英文名：Fried Pork in Scoop），原名锅爆肉，光绪年间始创自哈尔滨道台府府尹杜学瀛厨师郑兴文之手。 [20]  成菜后，色泽金黄，口味酸甜', b'0', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.syuan.net%2Fforum%2F201911%2F29%2F031447mz35kqfkv7mqgmv3.jpg&refer=http%3A%2F%2Fimg.syuan.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627437479&t=d7b6ff53ac87a6aa6908cfe64381de27', 88.00, NULL);
INSERT INTO `dishes_food` VALUES (6, '佛跳墙', '软嫩柔润，浓郁荤香，又荤而不腻，味中有味', '佛跳墙又名福寿全，是福建省福州市的一道特色名菜，属闽菜系。相传，该菜品是在清道光年间由福州聚春园菜馆老板郑春发研制出来的，又据费孝通先生记，发明此菜者乃一帮要饭的乞丐', b'1', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi.women-health.cn%2Fupimg%2Fallimg%2F190104%2F18-1Z10411342L14.jpg&refer=http%3A%2F%2Fi.women-health.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627289361&t=92fc93d39e7a445579adeed9a76cf35c', 208.00, NULL);
INSERT INTO `dishes_food` VALUES (7, '松鼠鱼', '酥嫩，甜酸，鲜香', '松鼠鱼是江苏省的一道传统名菜，属于苏菜系，该菜品以黄鱼为主要材料；松鼠鱼因形似松鼠而得名', b'0', 'https://img2.baidu.com/it/u=3983964839,499939048&fm=26&fmt=auto&gp=0.jpg', 99.00, NULL);
INSERT INTO `dishes_food` VALUES (12, '宫保鸡丁', '2018年9月，被评为“中国菜”之贵州十大经典名菜、四川十大经典名菜', '宫保鸡丁选用鸡肉为主料，佐以花生米、辣椒等辅料烹制而成；红而不辣、辣而不猛、香辣味浓、肉质滑脆；其入口鲜辣，鸡肉的鲜嫩可以配合花生的香脆。', b'1', 'https://img1.baidu.com/it/u=3783517470,384999655&fm=26&fmt=auto&gp=0.jpg', 76.50, NULL);
INSERT INTO `dishes_food` VALUES (13, '可乐鸡翅', '味道鲜美、鸡翅嫩滑、咸甜适中', '可乐鸡翅具有味道鲜美、色泽艳丽、鸡肉嫩滑、咸甜适中的特点。一般人群均可食用，不适合感冒发热、内火偏旺、痰湿偏重之人；患有热毒疖肿、高血压、血脂偏高、胆囊炎、胆石症、糖尿病患者忌食。', b'1', 'https://img0.baidu.com/it/u=3257742397,2747420151&fm=26&fmt=auto&gp=0.jpg', 66.80, NULL);
INSERT INTO `dishes_food` VALUES (14, '糖醋排骨', '做法精细，色、香、味具全', '糖醋排骨是糖醋味型中具有代表性的一道大众喜爱的传统名菜，它颇受中国人民喜爱。在沪，浙，川，淮扬四个菜系中都有这个菜。', b'1', 'https://img1.baidu.com/it/u=2417839317,2796233087&fm=26&fmt=auto&gp=0.jpg', 106.80, NULL);
INSERT INTO `dishes_food` VALUES (15, '鱼香肉丝', '酸辣可口,咸甜适中', '鱼香肉丝（Yuxiang shredded pork） [1]  ，是四川的一道特色名菜，该菜品以泡辣椒、子姜、大蒜、糖和醋炒制猪里脊肉丝而成，由民国时期的一位川菜大厨所创制，相传灵感来自泡椒肉丝。', b'1', 'https://img0.baidu.com/it/u=4064102339,650669384&fm=26&fmt=auto&gp=0.jpg', 66.50, NULL);
INSERT INTO `dishes_food` VALUES (16, '回锅肉', '色泽红亮，咸鲜微辣，略带回甜', '回锅肉（Twice-cooked pork slices） [1]  ，是一种四川传统菜式中家常（味型）菜肴的代表菜肴之一，属于川菜系列。', b'1', 'https://img1.baidu.com/it/u=1463980924,1556284074&fm=26&fmt=auto&gp=0.jpg', 88.00, NULL);
INSERT INTO `dishes_food` VALUES (17, '酸菜鱼', '酸辣可口', '酸菜鱼以草鱼为主料，配以泡菜等食材煮制而成，口味酸辣可口；鱼含丰富优质蛋白，能提供人丰富的蛋白质、矿物质等营养；酸菜中的乳酸可以促进人体对铁元素的吸收，还可以增加人的食欲。', NULL, 'https://img1.baidu.com/it/u=3703451110,2091739648&fm=26&fmt=auto&gp=0.jpg', 103.50, NULL);
INSERT INTO `dishes_food` VALUES (18, '水煮肉片', '麻、辣、鲜、烫、香', '水煮肉片（Poached spicy slices of pork）是以猪里脊肉为主料的一道地方新创名菜，起源于自贡，发扬于西南，属于川菜中著名的家常菜', NULL, 'https://img1.baidu.com/it/u=1716698281,3694400329&fm=26&fmt=auto&gp=0.jpg', 78.00, NULL);
COMMIT;

-- ----------------------------
-- Table structure for dishes_order
-- ----------------------------
DROP TABLE IF EXISTS `dishes_order`;
CREATE TABLE `dishes_order` (
  `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `order_begin_time` datetime NOT NULL COMMENT '订单开始时间',
  `order_end_time` datetime DEFAULT NULL COMMENT '订单结束时间',
  `waiter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单点餐员编号',
  `order_state` int NOT NULL COMMENT '订单状态（0正在用餐，1准备结账，2已经结账，3免单订单）',
  `table_id` int NOT NULL COMMENT '订单的桌号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='点餐订单表';

-- ----------------------------
-- Records of dishes_order
-- ----------------------------
BEGIN;
INSERT INTO `dishes_order` VALUES (2, '2020-06-10 15:07:23', '2021-07-06 14:42:01', '1309861917694623744', 2, 6, '测试用户');
INSERT INTO `dishes_order` VALUES (3, '2020-06-22 15:07:23', '2021-07-09 23:31:01', '1309861917694623744', 2, 3, '测试用户');
INSERT INTO `dishes_order` VALUES (4, '2020-06-22 15:07:23', '2021-07-06 17:30:16', '1309861917694623744', 2, 1, '测试用户');
INSERT INTO `dishes_order` VALUES (5, '2020-06-22 15:07:23', '2021-07-13 09:06:42', '1309861917694623744', 2, 4, '测试用户');
INSERT INTO `dishes_order` VALUES (6, '2021-07-09 20:20:51', '2021-07-13 09:06:46', '1309861917694623744', 2, 8, NULL);
INSERT INTO `dishes_order` VALUES (7, '2021-07-09 20:24:04', '2021-07-13 09:06:49', '1309861917694623744', 2, 5, NULL);
INSERT INTO `dishes_order` VALUES (8, '2021-07-09 20:28:01', '2021-07-13 09:06:53', '1309861917694623744', 2, 5, NULL);
INSERT INTO `dishes_order` VALUES (9, '2021-07-09 20:28:45', '2021-07-13 09:06:56', '1309861917694623744', 3, 8, NULL);
INSERT INTO `dishes_order` VALUES (10, '2021-07-09 23:30:18', '2021-07-13 09:06:59', '1309861917694623744', 3, 5, NULL);
INSERT INTO `dishes_order` VALUES (11, '2021-07-09 23:59:11', '2021-07-13 09:07:02', '1309861917694623744', 2, 5, NULL);
INSERT INTO `dishes_order` VALUES (12, '2021-07-10 00:05:47', '2021-07-13 09:07:05', '1309861917694623744', 2, 2, NULL);
INSERT INTO `dishes_order` VALUES (13, '2021-07-10 00:07:52', '2021-07-13 09:07:09', '1309861917694623744', 3, 5, NULL);
INSERT INTO `dishes_order` VALUES (14, '2021-07-10 00:09:21', '2021-07-13 09:07:11', '1309861917694623744', 2, 5, NULL);
INSERT INTO `dishes_order` VALUES (15, '2021-07-10 00:11:51', '2021-07-13 09:07:14', '1309861917694623744', 2, 3, NULL);
INSERT INTO `dishes_order` VALUES (16, '2021-07-10 00:32:48', '2021-07-19 16:32:25', '1309861917694623744', 3, 9, NULL);
INSERT INTO `dishes_order` VALUES (17, '2021-07-10 00:37:06', '2021-07-13 09:07:18', '1309861917694623744', 3, 7, NULL);
INSERT INTO `dishes_order` VALUES (18, '2021-07-10 00:44:20', '2021-07-10 00:45:17', '1309861917694623744', 2, 8, NULL);
INSERT INTO `dishes_order` VALUES (19, '2021-07-10 13:10:51', '2021-07-19 11:00:36', '1309861917694623744', 2, 8, NULL);
INSERT INTO `dishes_order` VALUES (22, '2021-07-13 15:30:43', '2021-07-13 15:31:19', '1309861917694623744', 2, 6, NULL);
INSERT INTO `dishes_order` VALUES (25, '2021-07-19 16:31:58', '2021-07-19 16:33:29', '1309861917694623744', 2, 1, NULL);
INSERT INTO `dishes_order` VALUES (26, '2021-07-19 16:36:28', '2021-07-19 16:50:38', '1309861917694623744', 3, 1, NULL);
INSERT INTO `dishes_order` VALUES (27, '2021-07-19 16:37:27', '2021-07-19 16:52:11', '1309861917694623744', 2, 1, NULL);
INSERT INTO `dishes_order` VALUES (28, '2021-07-19 16:37:43', '2021-07-19 16:52:15', '1309861917694623744', 2, 2, NULL);
INSERT INTO `dishes_order` VALUES (29, '2021-07-19 16:37:58', '2021-07-19 16:39:25', '1309861917694623744', 2, 1, NULL);
INSERT INTO `dishes_order` VALUES (30, '2021-07-19 16:43:09', '2021-07-19 19:25:07', '1309861917694623744', 2, 1, NULL);
INSERT INTO `dishes_order` VALUES (31, '2021-07-19 16:45:14', '2021-07-20 08:33:04', '1309861917694623744', 3, 1, NULL);
INSERT INTO `dishes_order` VALUES (32, '2021-07-19 16:46:03', '2021-07-20 10:10:23', '1309861917694623744', 2, 3, NULL);
INSERT INTO `dishes_order` VALUES (33, '2021-07-19 16:48:19', '2021-07-20 10:23:47', '1309861917694623744', 2, 3, NULL);
INSERT INTO `dishes_order` VALUES (36, '2021-07-19 19:19:28', '2021-07-20 10:25:06', '1309861917694623744', 2, 2, NULL);
INSERT INTO `dishes_order` VALUES (38, '2021-07-19 19:22:59', '2021-07-20 10:22:48', '1309861917694623744', 2, 9, NULL);
INSERT INTO `dishes_order` VALUES (39, '2021-07-20 08:15:29', '2021-07-20 10:08:09', '1309861917694623744', 2, 2, NULL);
INSERT INTO `dishes_order` VALUES (41, '2021-07-20 10:01:05', '2021-07-20 10:07:04', '1309861917694623744', 2, 5, NULL);
INSERT INTO `dishes_order` VALUES (53, '2021-07-20 12:46:28', '2021-07-20 13:02:52', '1309861917694623744', 3, 2, NULL);
INSERT INTO `dishes_order` VALUES (54, '2021-07-20 12:52:17', '2021-07-20 13:02:55', '1309861917694623744', 3, 3, NULL);
INSERT INTO `dishes_order` VALUES (55, '2021-07-20 12:56:16', '2021-07-20 13:02:58', '1309861917694623744', 3, 4, NULL);
INSERT INTO `dishes_order` VALUES (56, '2021-07-20 12:57:52', '2021-07-20 13:03:00', '1309861917694623744', 3, 5, NULL);
INSERT INTO `dishes_order` VALUES (57, '2021-07-20 12:58:54', '2021-07-20 13:03:02', '1309861917694623744', 3, 6, NULL);
INSERT INTO `dishes_order` VALUES (58, '2021-07-20 12:59:45', '2021-07-20 13:03:05', '1309861917694623744', 3, 7, NULL);
INSERT INTO `dishes_order` VALUES (59, '2021-07-20 13:02:07', '2021-07-20 14:24:25', '1309861917694623744', 2, 8, NULL);
INSERT INTO `dishes_order` VALUES (60, '2021-07-20 14:11:15', '2021-07-20 14:12:14', '1309861917694623744', 2, 2, NULL);
INSERT INTO `dishes_order` VALUES (61, '2021-07-20 14:32:49', '2021-07-20 14:33:32', '1309861917694623744', 2, 8, NULL);
INSERT INTO `dishes_order` VALUES (62, '2021-07-20 14:34:37', '2021-07-20 14:35:02', '1309861917694623744', 2, 8, NULL);
INSERT INTO `dishes_order` VALUES (63, '2021-07-20 14:36:54', '2021-07-26 09:15:31', '1309861917694623744', 2, 8, NULL);
INSERT INTO `dishes_order` VALUES (64, '2021-07-20 14:37:07', '2021-07-20 17:17:30', '1309861917694623744', 2, 2, NULL);
INSERT INTO `dishes_order` VALUES (66, '2021-07-20 14:52:37', '2021-07-20 17:06:52', '1309861917694623744', 2, 3, NULL);
INSERT INTO `dishes_order` VALUES (68, '2021-07-20 15:15:04', '2021-07-20 16:50:31', '1309861917694623744', 2, 4, NULL);
INSERT INTO `dishes_order` VALUES (70, '2021-07-20 15:27:10', '2021-07-20 16:43:38', '1309861917694623744', 2, 9, NULL);
INSERT INTO `dishes_order` VALUES (71, '2021-07-20 17:22:17', '2021-07-20 17:23:24', '1309861917694623744', 2, 5, NULL);
INSERT INTO `dishes_order` VALUES (76, '2021-07-20 17:45:48', '2021-07-26 09:15:27', '1309861917694623744', 3, 9, NULL);
INSERT INTO `dishes_order` VALUES (78, '2021-07-20 18:42:40', '2021-07-26 09:16:49', '1309861917694623744', 3, 2, NULL);
INSERT INTO `dishes_order` VALUES (79, '2021-07-21 15:42:49', '2021-07-26 09:16:52', '1309861917694623744', 3, 6, NULL);
INSERT INTO `dishes_order` VALUES (80, '2021-07-26 09:17:28', '2021-07-26 09:29:01', '1309861917694623744', 2, 9, NULL);
INSERT INTO `dishes_order` VALUES (81, '2021-07-26 09:38:29', '2021-07-26 09:39:03', '1309861917694623744', 2, 9, NULL);
INSERT INTO `dishes_order` VALUES (82, '2021-07-26 09:40:58', '2021-07-26 09:41:20', '1309861917694623744', 2, 9, NULL);
INSERT INTO `dishes_order` VALUES (83, '2021-07-27 11:02:43', '2021-07-27 11:03:20', '1309861917694623744', 2, 9, NULL);
COMMIT;

-- ----------------------------
-- Table structure for dishes_table
-- ----------------------------
DROP TABLE IF EXISTS `dishes_table`;
CREATE TABLE `dishes_table` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '餐桌编号',
  `name` varchar(10) DEFAULT NULL COMMENT '餐桌名字',
  `status` int DEFAULT NULL COMMENT '餐桌状态（0-无人1-有人）',
  `remark` varchar(255) DEFAULT NULL COMMENT '餐桌描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='点餐餐桌表';

-- ----------------------------
-- Records of dishes_table
-- ----------------------------
BEGIN;
INSERT INTO `dishes_table` VALUES (1, '一号桌', 0, '餐桌');
INSERT INTO `dishes_table` VALUES (2, '二号桌', 0, '餐桌');
INSERT INTO `dishes_table` VALUES (3, '三号桌', 0, '餐桌');
INSERT INTO `dishes_table` VALUES (4, '四号桌', 0, '餐桌');
INSERT INTO `dishes_table` VALUES (5, '五号桌', 0, '餐桌');
INSERT INTO `dishes_table` VALUES (6, '六号桌', 0, '餐桌');
INSERT INTO `dishes_table` VALUES (7, '七号桌', 0, '餐桌');
INSERT INTO `dishes_table` VALUES (8, '八号桌', 0, '餐桌');
INSERT INTO `dishes_table` VALUES (9, '九号桌', 0, '餐桌');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `parent_menu_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级菜单',
  `parent_menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级菜单名称',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES ('1328525218309734400', 'sys_user', 'App用户', NULL, NULL, 'SysUser', 'crud', 'com.pearadmin.system', 'system', 'user', 'App用户', 'Jmys', '1', '/pear-system', 'null', '', '2020-11-17 10:24:33', '', '2021-04-02 16:07:18', '', '1', '系统管理');
INSERT INTO `gen_table` VALUES ('1370410322996756480', 'sys_notice', '站内消息', NULL, NULL, 'SysNotice', 'crud', 'com.pearadmin.system', 'system', 'notice', 'notice', 'jmys', '1', 'D:\\openSource\\Pear-Admin-Boot\\pear-modules\\pear-system', 'null', '', '2021-03-12 16:24:16', '', '2021-03-30 18:04:17', '生成', '1', '系统管理');
INSERT INTO `gen_table` VALUES ('1411151867894824960', 'dishes_food', '菜品详情表', NULL, NULL, 'DishesFood', 'crud', 'com.pearadmin.system', 'dishes', 'food', '菜品详情', 'wzh', '0', '/', 'null', '', '2021-07-03 10:36:37', '', '2021-07-03 11:29:46', '', '1411163720947597312', '菜品详情菜单');
INSERT INTO `gen_table` VALUES ('1411242780881059840', 'dishes_order', '点餐订单表', NULL, NULL, 'order', 'crud', 'com.pearadmin.system', 'dishes', 'order', '点餐订单', 'wzh', '0', '/', 'null', '', '2021-07-03 16:37:53', '', '2021-07-07 19:37:49', '', '1412709078576136192', '点餐界面');
INSERT INTO `gen_table` VALUES ('1411880404457095168', 'order_details', '点餐订单详情表', NULL, NULL, 'prepareOrder', 'crud', 'com.pearadmin.system', 'dishes', 'prepareOrder', '后厨备餐表', 'wzh', '0', '/', 'null', '', '2021-07-05 10:51:34', '', '2021-07-05 11:04:59', '', '1411881775403106304', '后厨备餐表菜单');
INSERT INTO `gen_table` VALUES ('1415159677565534208', 'dishes_alipay', '支付宝支付', NULL, NULL, 'DishesAlipay', 'crud', 'com.pearadmin.system', 'system', 'alipay', '支付宝支付', 'wzh', '0', '/', 'null', '', '2021-07-14 12:02:14', '', '2021-07-14 12:03:08', '', '', '');
INSERT INTO `gen_table` VALUES ('1417320130324463616', 'dishes_table', '点餐餐桌表', NULL, NULL, 'DishesTable', 'crud', 'com.pearadmin.system', 'dishes', 'table', '点餐餐桌', 'wzh', '0', '/', 'null', '', '2021-07-20 11:07:06', '', '2021-07-20 11:19:52', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES ('1328525219052126208', '1328525218309734400', 'user_id', '编号', 'char(19)', 'String', 'userId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 1, '', '2020-11-17 10:24:33', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525219400253440', '1328525218309734400', 'username', '账户', 'char(20)', 'String', 'username', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', 'input', 2, '', '2020-11-17 10:24:33', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525219786129408', '1328525218309734400', 'password', '密码', 'char(60)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 3, '', '2020-11-17 10:24:33', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525220104896512', '1328525218309734400', 'salt', '姓名', 'char(10)', 'String', 'salt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 4, '', '2020-11-17 10:24:33', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525220423663616', '1328525218309734400', 'status', '状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'input', 5, '', '2020-11-17 10:24:33', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525220734042112', '1328525218309734400', 'real_name', '姓名', 'char(8)', 'String', 'realName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', 'input', 6, '', '2020-11-17 10:24:33', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525221044420608', '1328525218309734400', 'email', '邮箱', 'char(20)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 7, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525221363187712', '1328525218309734400', 'avatar', '头像', 'varchar(30)', 'String', 'avatar', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'input', 8, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525221677760512', '1328525218309734400', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'user_sex', 9, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525222000721920', '1328525218309734400', 'phone', '电话', 'char(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 10, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525222415958016', '1328525218309734400', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', 'input', 11, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525222764085248', '1328525218309734400', 'create_by', '创建人', 'char(1)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 12, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525223091240960', '1328525218309734400', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', 'input', 13, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525223552614400', '1328525218309734400', 'update_by', '修改人', 'char(1)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', 'input', 14, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525223896547328', '1328525218309734400', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', 'input', 15, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525224206925824', '1328525218309734400', 'enable', '是否启用', 'char(1)', 'String', 'enable', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 16, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525224542470144', '1328525218309734400', 'login', '是否登录', 'char(1)', 'String', 'login', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 17, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1328525224861237248', '1328525218309734400', 'dept_id', '部门编号', 'char(19)', 'String', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 18, '', '2020-11-17 10:24:34', NULL, '2021-04-02 16:07:18');
INSERT INTO `gen_table_column` VALUES ('1370410323613319168', '1370410322996756480', 'id', '编号', 'char(20)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 1, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410323856588800', '1370410322996756480', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', 'input', 2, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410324095664128', '1370410322996756480', 'content', '内容', 'text', 'String', 'content', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', 'input', 3, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410324317962240', '1370410322996756480', 'sender', '发送人', 'char(20)', 'String', 'sender', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'select', 'input', 4, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410324557037568', '1370410322996756480', 'accept', '接收者', 'char(20)', 'String', 'accept', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', 'input', 5, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410324766752768', '1370410322996756480', 'type', '类型', 'char(10)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_notice_type', 6, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410325018411008', '1370410322996756480', 'create_by', '创建人', 'char(20)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 7, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410325240709120', '1370410322996756480', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', 'input', 8, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410325471395840', '1370410322996756480', 'update_by', '修改人', 'char(20)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 9, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410325702082560', '1370410322996756480', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', 'input', 10, '', '2021-03-12 16:24:16', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1370410325928574976', '1370410322996756480', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 11, '', '2021-03-12 16:24:17', NULL, '2021-03-30 18:04:17');
INSERT INTO `gen_table_column` VALUES ('1411151867978711040', '1411151867894824960', 'id', '菜品编号', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 1, '', '2021-07-03 10:36:37', NULL, '2021-07-03 11:29:46');
INSERT INTO `gen_table_column` VALUES ('1411151868033236992', '1411151867894824960', 'name', '菜品名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', 'input', 2, '', '2021-07-03 10:36:37', NULL, '2021-07-03 11:29:46');
INSERT INTO `gen_table_column` VALUES ('1411151868054208512', '1411151867894824960', 'introduction', '菜品简介', 'varchar(100)', 'String', 'introduction', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 3, '', '2021-07-03 10:36:37', NULL, '2021-07-03 11:29:46');
INSERT INTO `gen_table_column` VALUES ('1411151868066791424', '1411151867894824960', 'details', '菜品详情', 'varchar(100)', 'String', 'details', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 4, '', '2021-07-03 10:36:37', NULL, '2021-07-03 11:29:46');
INSERT INTO `gen_table_column` VALUES ('1411151868079374336', '1411151867894824960', 'recommend', '推荐菜品（0非推荐1推荐）', 'int', 'Integer', 'recommend', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 5, '', '2021-07-03 10:36:37', NULL, '2021-07-03 11:29:46');
INSERT INTO `gen_table_column` VALUES ('1411151868100345856', '1411151867894824960', 'picture_url', '菜品图像地址', 'varchar(500)', 'String', 'pictureUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', 'input', 6, '', '2021-07-03 10:36:37', NULL, '2021-07-03 11:29:46');
INSERT INTO `gen_table_column` VALUES ('1411151868108734464', '1411151867894824960', 'price', '餐品价格', 'decimal(10,2)', 'Double', 'price', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'input', 7, '', '2021-07-03 10:36:37', NULL, '2021-07-03 11:29:46');
INSERT INTO `gen_table_column` VALUES ('1411151868121317376', '1411151867894824960', 'remark', '备注', 'varchar(200)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', 'input', 8, '', '2021-07-03 10:36:37', NULL, '2021-07-03 11:29:46');
INSERT INTO `gen_table_column` VALUES ('1411242780990111744', '1411242780881059840', 'order_id', '订单编号', 'bigint', 'Long', 'orderId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 1, '', '2021-07-03 16:37:53', NULL, '2021-07-07 19:37:49');
INSERT INTO `gen_table_column` VALUES ('1411242781027860480', '1411242780881059840', 'order_begin_time', '订单开始时间', 'datetime', 'Date', 'orderBeginTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', 'input', 2, '', '2021-07-03 16:37:53', NULL, '2021-07-07 19:37:49');
INSERT INTO `gen_table_column` VALUES ('1411242781044637696', '1411242780881059840', 'order_end_time', '订单结束时间', 'datetime', 'Date', 'orderEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', 'input', 3, '', '2021-07-03 16:37:53', NULL, '2021-07-07 19:37:49');
INSERT INTO `gen_table_column` VALUES ('1411242781057220608', '1411242780881059840', 'waiter_id', '订单点餐员编号', 'int', 'Integer', 'waiterId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'input', 4, '', '2021-07-03 16:37:53', NULL, '2021-07-07 19:37:49');
INSERT INTO `gen_table_column` VALUES ('1411242781069803520', '1411242780881059840', 'order_state', '订单状态（0正在用餐，1准备结账，2已经结账，3免单订单）', 'int', 'Integer', 'orderState', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'input', 5, '', '2021-07-03 16:37:53', NULL, '2021-07-07 19:37:49');
INSERT INTO `gen_table_column` VALUES ('1411242781086580736', '1411242780881059840', 'table_id', '订单的桌号', 'int', 'Integer', 'tableId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'input', 6, '', '2021-07-03 16:37:53', NULL, '2021-07-07 19:37:49');
INSERT INTO `gen_table_column` VALUES ('1411242781099163648', '1411242780881059840', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', 'input', 7, '', '2021-07-03 16:37:53', NULL, '2021-07-07 19:37:49');
INSERT INTO `gen_table_column` VALUES ('1411880404549369856', '1411880404457095168', 'od_id', '详单编号', 'bigint', 'Long', 'odId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 1, '', '2021-07-05 10:51:34', NULL, '2021-07-05 11:04:59');
INSERT INTO `gen_table_column` VALUES ('1411880404587118592', '1411880404457095168', 'order_reference', '对应订单编号', 'bigint', 'Long', 'orderReference', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'input', 2, '', '2021-07-05 10:51:34', NULL, '2021-07-05 11:04:59');
INSERT INTO `gen_table_column` VALUES ('1411880404599701504', '1411880404457095168', 'dishes', '对应菜品编号', 'int', 'Long', 'dishes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'input', 3, '', '2021-07-05 10:51:34', NULL, '2021-07-05 11:04:59');
INSERT INTO `gen_table_column` VALUES ('1411880404608090112', '1411880404457095168', 'num', '菜品数量', 'int', 'Long', 'num', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'input', 4, '', '2021-07-05 10:51:34', NULL, '2021-07-05 11:04:59');
INSERT INTO `gen_table_column` VALUES ('1415159678362451968', '1415159677565534208', 'pay_id', 'null', 'varchar(255)', 'String', 'payId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 1, '', '2021-07-14 12:02:14', NULL, '2021-07-14 12:03:08');
INSERT INTO `gen_table_column` VALUES ('1415159678756716544', '1415159677565534208', 'pay_details', 'null', 'varchar(255)', 'String', 'payDetails', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 2, '', '2021-07-14 12:02:14', NULL, '2021-07-14 12:03:08');
INSERT INTO `gen_table_column` VALUES ('1415159679117426688', '1415159677565534208', 'pay_price', 'null', 'double(10,2)', 'BigDecimal', 'payPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 3, '', '2021-07-14 12:02:14', NULL, '2021-07-14 12:03:08');
INSERT INTO `gen_table_column` VALUES ('1415159679473942528', '1415159677565534208', 'pay_desc', 'null', 'varchar(255)', 'String', 'payDesc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 4, '', '2021-07-14 12:02:14', NULL, '2021-07-14 12:03:08');
INSERT INTO `gen_table_column` VALUES ('1417320130425126912', '1417320130324463616', 'id', '餐桌编号', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'input', 1, '', '2021-07-20 11:07:06', NULL, '2021-07-20 11:19:52');
INSERT INTO `gen_table_column` VALUES ('1417320130458681344', '1417320130324463616', 'name', '餐桌名字', 'varchar(10)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', 'input', 2, '', '2021-07-20 11:07:06', NULL, '2021-07-20 11:19:52');
INSERT INTO `gen_table_column` VALUES ('1417320130471264256', '1417320130324463616', 'value', '餐桌值', 'int', 'Long', 'value', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'input', 3, '', '2021-07-20 11:07:06', NULL, '2021-07-20 11:19:52');
INSERT INTO `gen_table_column` VALUES ('1417320130483847168', '1417320130324463616', 'status', '餐桌状态（0-无人1-有人）', 'bit(1)', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'input', 4, '', '2021-07-20 11:07:06', NULL, '2021-07-20 11:19:52');
INSERT INTO `gen_table_column` VALUES ('1417320130492235776', '1417320130324463616', 'remark', '餐桌描述', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', 'input', 5, '', '2021-07-20 11:07:06', NULL, '2021-07-20 11:19:52');
COMMIT;

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `od_id` bigint NOT NULL AUTO_INCREMENT COMMENT '详单编号',
  `order_reference` bigint NOT NULL COMMENT '对应订单编号',
  `dishes` int NOT NULL COMMENT '对应菜品编号',
  `num` int NOT NULL COMMENT '菜品数量',
  `status` int DEFAULT NULL COMMENT '订单菜品烹饪状态（0-未烹饪 1-正在烹饪 2-烹饪完成）',
  PRIMARY KEY (`od_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='点餐订单详情表';

-- ----------------------------
-- Records of order_details
-- ----------------------------
BEGIN;
INSERT INTO `order_details` VALUES (1, 2, 4, 2, 1);
INSERT INTO `order_details` VALUES (2, 2, 6, 1, 0);
INSERT INTO `order_details` VALUES (3, 3, 5, 1, 1);
INSERT INTO `order_details` VALUES (4, 3, 4, 1, 0);
INSERT INTO `order_details` VALUES (5, 4, 4, 1, 0);
INSERT INTO `order_details` VALUES (6, 4, 2, 1, 0);
INSERT INTO `order_details` VALUES (7, 4, 1, 1, 0);
INSERT INTO `order_details` VALUES (8, 5, 1, 1, 0);
INSERT INTO `order_details` VALUES (9, 5, 2, 1, 0);
INSERT INTO `order_details` VALUES (10, 16, 4, 1, 2);
INSERT INTO `order_details` VALUES (11, 16, 5, 1, 2);
INSERT INTO `order_details` VALUES (12, 16, 6, 1, 0);
INSERT INTO `order_details` VALUES (13, 17, 11, 3, 0);
INSERT INTO `order_details` VALUES (14, 17, 6, 2, 0);
INSERT INTO `order_details` VALUES (15, 17, 5, 2, 0);
INSERT INTO `order_details` VALUES (16, 18, 4, 2, 0);
INSERT INTO `order_details` VALUES (17, 18, 6, 2, 0);
INSERT INTO `order_details` VALUES (18, 18, 7, 1, 0);
INSERT INTO `order_details` VALUES (19, 19, 5, 1, 0);
INSERT INTO `order_details` VALUES (20, 19, 4, 1, 0);
INSERT INTO `order_details` VALUES (21, 19, 10, 2, 2);
INSERT INTO `order_details` VALUES (22, 22, 5, 1, 0);
INSERT INTO `order_details` VALUES (23, 22, 6, 1, 0);
INSERT INTO `order_details` VALUES (24, 22, 4, 1, 0);
INSERT INTO `order_details` VALUES (25, 29, 4, 1, 0);
INSERT INTO `order_details` VALUES (26, 29, 5, 2, 0);
INSERT INTO `order_details` VALUES (27, 29, 6, 1, 0);
INSERT INTO `order_details` VALUES (28, 29, 11, 1, 2);
INSERT INTO `order_details` VALUES (29, 34, 4, 2, 2);
INSERT INTO `order_details` VALUES (30, 34, 6, 2, 2);
INSERT INTO `order_details` VALUES (31, 34, 11, 2, 2);
INSERT INTO `order_details` VALUES (32, 30, 4, 2, 2);
INSERT INTO `order_details` VALUES (33, 30, 5, 1, 2);
INSERT INTO `order_details` VALUES (34, 30, 6, 1, 2);
INSERT INTO `order_details` VALUES (35, 30, 4, 1, 2);
INSERT INTO `order_details` VALUES (36, 36, 7, 2, 2);
INSERT INTO `order_details` VALUES (37, 36, 6, 2, 2);
INSERT INTO `order_details` VALUES (38, 38, 6, 1, 2);
INSERT INTO `order_details` VALUES (39, 38, 5, 1, 2);
INSERT INTO `order_details` VALUES (40, 39, 5, 2, 2);
INSERT INTO `order_details` VALUES (41, 39, 4, 1, 2);
INSERT INTO `order_details` VALUES (42, 39, 10, 1, 2);
INSERT INTO `order_details` VALUES (43, 39, 11, 1, 2);
INSERT INTO `order_details` VALUES (44, 39, 7, 1, 1);
INSERT INTO `order_details` VALUES (45, 39, 6, 1, 0);
INSERT INTO `order_details` VALUES (46, 39, 5, 2, 0);
INSERT INTO `order_details` VALUES (47, 39, 4, 1, 0);
INSERT INTO `order_details` VALUES (48, 39, 10, 1, 0);
INSERT INTO `order_details` VALUES (49, 39, 11, 1, 0);
INSERT INTO `order_details` VALUES (50, 39, 7, 1, 0);
INSERT INTO `order_details` VALUES (51, 41, 5, 1, 0);
INSERT INTO `order_details` VALUES (52, 41, 4, 1, 1);
INSERT INTO `order_details` VALUES (53, 41, 6, 1, 1);
INSERT INTO `order_details` VALUES (54, 41, 7, 2, 0);
INSERT INTO `order_details` VALUES (55, 41, 11, 1, 0);
INSERT INTO `order_details` VALUES (56, 59, 10, 1, 0);
INSERT INTO `order_details` VALUES (57, 59, 6, 1, 0);
INSERT INTO `order_details` VALUES (58, 59, 7, 1, 0);
INSERT INTO `order_details` VALUES (59, 59, 5, 1, 0);
INSERT INTO `order_details` VALUES (60, 59, 4, 1, 0);
INSERT INTO `order_details` VALUES (61, 60, 4, 1, 0);
INSERT INTO `order_details` VALUES (62, 60, 5, 1, 0);
INSERT INTO `order_details` VALUES (63, 60, 10, 1, 0);
INSERT INTO `order_details` VALUES (64, 60, 6, 2, 0);
INSERT INTO `order_details` VALUES (65, 60, 11, 1, 1);
INSERT INTO `order_details` VALUES (66, 61, 5, 1, 0);
INSERT INTO `order_details` VALUES (67, 61, 6, 1, 0);
INSERT INTO `order_details` VALUES (68, 61, 4, 1, 0);
INSERT INTO `order_details` VALUES (69, 61, 10, 1, 0);
INSERT INTO `order_details` VALUES (70, 61, 7, 1, 0);
INSERT INTO `order_details` VALUES (71, 61, 11, 1, 0);
INSERT INTO `order_details` VALUES (72, 62, 5, 1, 0);
INSERT INTO `order_details` VALUES (73, 62, 6, 1, 0);
INSERT INTO `order_details` VALUES (74, 62, 7, 1, 0);
INSERT INTO `order_details` VALUES (75, 62, 4, 1, 0);
INSERT INTO `order_details` VALUES (76, 62, 11, 1, 0);
INSERT INTO `order_details` VALUES (77, 62, 5, 1, 0);
INSERT INTO `order_details` VALUES (78, 63, 5, 1, 2);
INSERT INTO `order_details` VALUES (79, 63, 6, 1, 1);
INSERT INTO `order_details` VALUES (80, 63, 7, 1, 1);
INSERT INTO `order_details` VALUES (81, 63, 4, 1, 0);
INSERT INTO `order_details` VALUES (82, 63, 10, 1, 0);
INSERT INTO `order_details` VALUES (83, 63, 5, 1, 0);
INSERT INTO `order_details` VALUES (84, 64, 5, 1, 0);
INSERT INTO `order_details` VALUES (85, 64, 4, 1, 0);
INSERT INTO `order_details` VALUES (86, 64, 10, 1, 0);
INSERT INTO `order_details` VALUES (87, 64, 11, 2, 0);
INSERT INTO `order_details` VALUES (88, 64, 6, 1, 0);
INSERT INTO `order_details` VALUES (89, 64, 5, 1, 0);
INSERT INTO `order_details` VALUES (90, 64, 4, 1, 0);
INSERT INTO `order_details` VALUES (91, 64, 10, 1, 0);
INSERT INTO `order_details` VALUES (92, 66, 5, 1, 0);
INSERT INTO `order_details` VALUES (93, 66, 4, 1, 0);
INSERT INTO `order_details` VALUES (94, 66, 11, 1, 0);
INSERT INTO `order_details` VALUES (95, 66, 10, 1, 0);
INSERT INTO `order_details` VALUES (96, 66, 4, 1, 0);
INSERT INTO `order_details` VALUES (97, 66, 5, 1, 0);
INSERT INTO `order_details` VALUES (98, 66, 6, 1, 0);
INSERT INTO `order_details` VALUES (100, 68, 5, 3, 0);
INSERT INTO `order_details` VALUES (101, 68, 6, 2, 0);
INSERT INTO `order_details` VALUES (102, 70, 4, 1, 0);
INSERT INTO `order_details` VALUES (103, 70, 4, 1, 0);
INSERT INTO `order_details` VALUES (104, 70, 10, 3, 0);
INSERT INTO `order_details` VALUES (105, 71, 5, 1, 0);
INSERT INTO `order_details` VALUES (106, 71, 6, 1, 0);
INSERT INTO `order_details` VALUES (107, 71, 4, 1, 0);
INSERT INTO `order_details` VALUES (108, 71, 7, 1, 0);
INSERT INTO `order_details` VALUES (109, 71, 11, 1, 1);
INSERT INTO `order_details` VALUES (110, 71, 7, 1, 0);
INSERT INTO `order_details` VALUES (111, 76, 5, 1, 0);
INSERT INTO `order_details` VALUES (112, 76, 6, 1, 0);
INSERT INTO `order_details` VALUES (113, 76, 11, 1, 0);
INSERT INTO `order_details` VALUES (114, 76, 10, 1, 0);
INSERT INTO `order_details` VALUES (115, 80, 12, 1, 0);
INSERT INTO `order_details` VALUES (116, 80, 13, 1, 0);
INSERT INTO `order_details` VALUES (117, 80, 14, 1, 0);
INSERT INTO `order_details` VALUES (118, 80, 15, 2, 0);
INSERT INTO `order_details` VALUES (119, 80, 17, 1, 0);
INSERT INTO `order_details` VALUES (120, 80, 16, 1, 0);
INSERT INTO `order_details` VALUES (121, 80, 18, 1, 0);
INSERT INTO `order_details` VALUES (122, 81, 13, 1, 0);
INSERT INTO `order_details` VALUES (123, 81, 14, 1, 0);
INSERT INTO `order_details` VALUES (124, 81, 5, 1, 0);
INSERT INTO `order_details` VALUES (125, 81, 7, 1, 0);
INSERT INTO `order_details` VALUES (126, 81, 15, 1, 0);
INSERT INTO `order_details` VALUES (127, 81, 12, 1, 0);
INSERT INTO `order_details` VALUES (128, 81, 16, 1, 0);
INSERT INTO `order_details` VALUES (129, 81, 4, 1, 0);
INSERT INTO `order_details` VALUES (130, 82, 4, 1, 0);
INSERT INTO `order_details` VALUES (131, 82, 5, 1, 0);
INSERT INTO `order_details` VALUES (132, 82, 12, 1, 0);
INSERT INTO `order_details` VALUES (133, 82, 13, 1, 0);
INSERT INTO `order_details` VALUES (134, 82, 14, 1, 0);
INSERT INTO `order_details` VALUES (135, 82, 17, 1, 0);
INSERT INTO `order_details` VALUES (136, 83, 5, 1, 0);
INSERT INTO `order_details` VALUES (137, 83, 4, 1, 0);
INSERT INTO `order_details` VALUES (138, 83, 6, 1, 0);
INSERT INTO `order_details` VALUES (139, 83, 7, 1, 0);
INSERT INTO `order_details` VALUES (140, 83, 14, 1, 0);
INSERT INTO `order_details` VALUES (141, 83, 13, 1, 0);
INSERT INTO `order_details` VALUES (142, 83, 12, 1, 0);
INSERT INTO `order_details` VALUES (143, 83, 16, 1, 0);
INSERT INTO `order_details` VALUES (144, 83, 17, 1, 0);
INSERT INTO `order_details` VALUES (145, 83, 18, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for schedule_calendars
-- ----------------------------
DROP TABLE IF EXISTS `schedule_calendars`;
CREATE TABLE `schedule_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `schedule_cron_triggers`;
CREATE TABLE `schedule_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `schedule_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `schedule_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `schedule_cron_triggers` VALUES ('PearScheduler', 'Pear_1361202980476420096', 'DEFAULT', '*/5 * * * * ?', 'Asia/Shanghai');
INSERT INTO `schedule_cron_triggers` VALUES ('PearScheduler', 'Pear_1361243793570922496', 'DEFAULT', '*/5 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for schedule_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `schedule_fired_triggers`;
CREATE TABLE `schedule_fired_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_group
-- ----------------------------
DROP TABLE IF EXISTS `schedule_group`;
CREATE TABLE `schedule_group` (
  `group_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '注释',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES ('1361202980476420096', 'commonTask', '123456', '*/5 * * * * ?', 1, '测试任务', '2021-02-15 14:37:35', '测试任务');
INSERT INTO `schedule_job` VALUES ('1361243793570922496', 'exceptionTask', '123456', '*/5 * * * * ?', 1, '异常任务', '2021-02-15 17:19:46', '异常任务');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_details
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_details`;
CREATE TABLE `schedule_job_details` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_job_details
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_details` VALUES ('PearScheduler', 'Pear_1361202980476420096', 'DEFAULT', NULL, 'com.pearadmin.schedule.handler.ScheduleContext', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720029636F6D2E7065617261646D696E2E7363686564756C652E646F6D61696E2E5363686564756C654A6F62C4760C6A9C2FA04B0200094C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000E63726F6E45787072657373696F6E71007E00094C000767726F7570496471007E00094C00056A6F62496471007E00094C00076A6F624E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E0009787074000A636F6D6D6F6E5461736B7372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770E05000007E5020F0E252307DB4CF87874000D2A2F35202A202A202A202A203F707400133133363132303239383034373634323030393674000CE6B58BE8AF95E4BBBBE58AA174000631323334353674000CE6B58BE8AF95E4BBBBE58AA1740001307800);
INSERT INTO `schedule_job_details` VALUES ('PearScheduler', 'Pear_1361243793570922496', 'DEFAULT', NULL, 'com.pearadmin.schedule.handler.ScheduleContext', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720029636F6D2E7065617261646D696E2E7363686564756C652E646F6D61696E2E5363686564756C654A6F62C4760C6A9C2FA04B0200094C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000E63726F6E45787072657373696F6E71007E00094C000767726F7570496471007E00094C00056A6F62496471007E00094C00076A6F624E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E0009787074000D657863657074696F6E5461736B7372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770E05000007E5020F11132D2B9938447874000D2A2F35202A202A202A202A203F707400133133363132343337393335373039323234393674000CE5BC82E5B8B8E4BBBBE58AA174000331323374000CE5BC82E5B8B8E4BBBBE58AA1740001307800);
COMMIT;

-- ----------------------------
-- Table structure for schedule_locks
-- ----------------------------
DROP TABLE IF EXISTS `schedule_locks`;
CREATE TABLE `schedule_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_locks
-- ----------------------------
BEGIN;
INSERT INTO `schedule_locks` VALUES ('PearScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for schedule_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_log`;
CREATE TABLE `schedule_log` (
  `log_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务日志id',
  `job_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `status` tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `schedule_paused_trigger_grps`;
CREATE TABLE `schedule_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `schedule_scheduler_state`;
CREATE TABLE `schedule_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_scheduler_state
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `schedule_simple_triggers`;
CREATE TABLE `schedule_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `schedule_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `schedule_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `schedule_simprop_triggers`;
CREATE TABLE `schedule_simprop_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `schedule_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `schedule_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for schedule_triggers
-- ----------------------------
DROP TABLE IF EXISTS `schedule_triggers`;
CREATE TABLE `schedule_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `schedule_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `schedule_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of schedule_triggers
-- ----------------------------
BEGIN;
INSERT INTO `schedule_triggers` VALUES ('PearScheduler', 'Pear_1361202980476420096', 'DEFAULT', 'Pear_1361202980476420096', 'DEFAULT', NULL, 1614173955000, 1614173950000, 5, 'PAUSED', 'CRON', 1613371055000, 0, NULL, 2, '');
INSERT INTO `schedule_triggers` VALUES ('PearScheduler', 'Pear_1361243793570922496', 'DEFAULT', 'Pear_1361243793570922496', 'DEFAULT', NULL, 1614173955000, 1614173950000, 5, 'PAUSED', 'CRON', 1613380785000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720029636F6D2E7065617261646D696E2E7363686564756C652E646F6D61696E2E5363686564756C654A6F62C4760C6A9C2FA04B0200094C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C000E63726F6E45787072657373696F6E71007E00094C000767726F7570496471007E00094C00056A6F62496471007E00094C00076A6F624E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E0009787074000D657863657074696F6E5461736B7074000D2A2F35202A202A202A202A203F707400133133363132343337393335373039323234393674000CE5BC82E5B8B8E4BBBBE58AA174000631323334353674000CE5BC82E5B8B8E4BBBBE58AA1740001307800);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置标识',
  `config_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置名称',
  `config_code` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置标识',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置值',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_by` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `config_type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置类型',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES ('1', '1', 'oss_point', 'oss-cn-beijing.aliyuncs.com', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES ('1307313917164257280', '网站描述', 'system_desc', '网站描述', '2020-11-08 19:19:32', NULL, NULL, NULL, '网站描述', 'custom');
INSERT INTO `sys_config` VALUES ('1309118169381601280', '网站数据', 'system_meta', '网站数据', '2020-11-03 19:20:48', NULL, NULL, NULL, '网站数据', 'custom');
INSERT INTO `sys_config` VALUES ('1356140265433202688', '系统配置', 'main_from', '854085467@qq.com', NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('1356140265865216000', '系统配置', 'main_user', '854085467', NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('1356140266297229312', '系统配置', 'main_pass', '123456', NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('1356140266754408448', '系统配置', 'main_port', '456', NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('1356140267211587584', '系统配置', 'main_host', 'smtp.qq.com', NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('1356178612746715136', '系统配置', 'oss_path', 'D://upload', NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('1356178613115813888', '系统配置', 'oss_type', 'local', NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('1370975131278508032', '上传方式', 'upload_kind', NULL, NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('1370975131630829568', '上传路径', 'upload_path', NULL, NULL, NULL, NULL, NULL, NULL, 'system');
INSERT INTO `sys_config` VALUES ('2', '2', 'oss_key', 'LTAI4G8ZDXDU6DiibSVd8G2b', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES ('3', '3', 'oss_secret', '9apyAWE7Xfu7NP5jgFHFdXeyPa28jL', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES ('4', '4', 'oss_bucket', 'pearadmin-bbs', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `parent_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父级编号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门名称',
  `sort` int DEFAULT NULL COMMENT '排序',
  `leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系方式',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门状态',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '备注',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('1', '0', '济南总公司', 1, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('10', '8', '设计部', 3, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('1316361008259792896', '1316360459930042368', '软件部', 1, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('1316361192645591040', '1316360459930042368', '市场部', 1, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('1377824449830584320', '3', '财务部', 1, '就眠仪式', '15553726531', '854085467@qq.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('1377825171905183744', '8', '财务部', 1, '就眠仪式', '15553726531', '854085467@qq.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('3', '1', '杭州分公司', 1, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '浙江杭州');
INSERT INTO `sys_dept` VALUES ('4', '2', '软件部', 2, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('5', '2', '市场部', 2, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('6', '3', '软件部', 3, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '浙江杭州');
INSERT INTO `sys_dept` VALUES ('7', '3', '设计部', 4, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('8', '1', '深圳分公司', 3, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
INSERT INTO `sys_dept` VALUES ('9', '8', '软件部', 3, '就眠仪式', '15553726531', 'pearadmin@gmail.com', '0', NULL, NULL, NULL, NULL, NULL, '山东济南');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `data_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `data_label` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典标签',
  `data_value` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典值',
  `type_code` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属类型',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否默认',
  `update_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`data_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES ('1', '男', '0', 'system_user_sex', '0', NULL, NULL, NULL, NULL, '描述', '1');
INSERT INTO `sys_dict_data` VALUES ('1302833449496739840', '字典名称', '字典值', 'dict_code', '1', NULL, NULL, NULL, NULL, 'aw', '0');
INSERT INTO `sys_dict_data` VALUES ('1317401149287956480', '男', 'boy', 'user_sex', NULL, NULL, NULL, NULL, NULL, '男 : body', '0');
INSERT INTO `sys_dict_data` VALUES ('1317402976670711808', '女', 'girl', 'user_sex', NULL, NULL, NULL, NULL, NULL, '女 : girl', '0');
INSERT INTO `sys_dict_data` VALUES ('1370411072367886336', '公告', 'public', 'sys_notice_type', NULL, NULL, NULL, NULL, NULL, '公告', '0');
INSERT INTO `sys_dict_data` VALUES ('1370411179544936448', '私信', 'private', 'sys_notice_type', NULL, NULL, NULL, NULL, NULL, '私信', '0');
INSERT INTO `sys_dict_data` VALUES ('1387076909438861312', '短信', 'smmm', 'sys_notice_type', NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_dict_data` VALUES ('2', '女', '1', 'system_user_sex', '1', NULL, NULL, NULL, NULL, '描述', '0');
INSERT INTO `sys_dict_data` VALUES ('447572898392182784', 'awd', 'awd', 'dict_code', '1', NULL, NULL, NULL, NULL, 'awd', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典类型名称',
  `type_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典类型标识',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字典类型描述',
  `enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否启用',
  `create_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES ('1317360314219495424', '登录类型', 'sys_notice_type', '登录类型', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('1317400519127334912', '用户类型', 'user_status', '用户类型', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('1317400823096934400', '配置类型', 'config_type', '配置类型', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('1370410853110644736', '消息类型', 'sys_notice_type', '消息类型', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('455184568505470976', '用户性别', 'user_sex', '用户性别', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES ('455184935989415936', '全局状态', 'sys_status', '状态描述\n', '0', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名称',
  `file_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件描述',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件路径',
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件类型',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `target_date` datetime DEFAULT NULL COMMENT '所属时间',
  `file_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logging
-- ----------------------------
DROP TABLE IF EXISTS `sys_logging`;
CREATE TABLE `sys_logging` (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '相应消息体',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方式',
  `business_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务类型',
  `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `operate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人',
  `operate_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作路径',
  `operate_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作地址',
  `request_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求参数',
  `response_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相应消息体',
  `success` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否成功',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `request_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求消息体',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '使用浏览器',
  `system_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `logging_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志类型，登录日志，操作日志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_logging
-- ----------------------------
BEGIN;
INSERT INTO `sys_logging` VALUES ('1387093346635218944', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-04-28 01:16:39', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1387093352247197696', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-04-28 01:16:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1387093362711986176', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-04-28 01:16:43', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1410753819075149824', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:14:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1410753825031061504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:14:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1410753929876078592', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:15:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1410754053255725056', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:15:52', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1410756616906604544', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:26:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1410756622610857984', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:26:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1410757092624564224', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:27:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1410757098458841088', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:27:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1410757858303148032', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:30:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1410757881178882048', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-02 08:31:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411131963313487872', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:17:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411131968887717888', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:17:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411132043609243648', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:17:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411132048923426816', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:17:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411136023517200384', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:33:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411136704571506688', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:36:23', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411136958301732864', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-03 09:37:23', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411137049167134720', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-03 09:37:45', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411137140670070784', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-03 09:38:07', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411137194902421504', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:38:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411137200120135680', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:38:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411137210572341248', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:38:23', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411137435873574912', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-03 09:39:17', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411137480089927680', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-03 09:39:28', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411137510544769024', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:39:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411137515758288896', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:39:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411137528991318016', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:39:39', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138032962109440', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:41:40', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138038599254016', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:41:41', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138079233671168', '修改用户', '/system/user/update', 'EDIT', 'PUT', 'admin', '/system/user/update', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:41:50', '修改用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138084434608128', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:41:52', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138166122872832', '登录', '/login', 'OTHER', 'POST', '123456', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:42:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411138171357364224', '主页', '/index', 'ADD', 'GET', '123456', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:42:12', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138186259726336', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:42:16', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138256614981632', '删除用户', '/system/user/remove/1370973608502886401', 'REMOVE', 'DELETE', '123456', '/system/user/remove/1370973608502886401', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:42:33', '删除用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138268400975872', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:42:36', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138283571773440', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:42:39', '查询用户', 'page=1&limit=10&realName=&username=&deptId=3', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138291553533952', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:42:41', '查询用户', 'page=1&limit=10&realName=&username=&deptId=8', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138304505544704', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:42:44', '查询用户', 'page=1&limit=10&realName=&username=&deptId=', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138384415424512', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:43:03', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138659133947904', '主页', '/index', 'ADD', 'GET', '123456', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:44:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411138668113952768', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 09:44:11', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411143216815669248', '主页', '/index', 'ADD', 'GET', '123456', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:02:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411143225502072832', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:02:17', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411144150656483328', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:05:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411144156079718400', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:05:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411144164736761856', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:06:01', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411144666916585472', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:08:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411144677964382208', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:08:04', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411144859003125760', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:08:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411144867127492608', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:08:49', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411144959523815424', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:09:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411144970835853312', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:09:14', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145221843976192', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:10:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145231486681088', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:10:16', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145289758146560', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:10:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145298075451392', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:10:32', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145390341750784', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:10:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145399405641728', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:10:56', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145495744610304', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:11:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145503575375872', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:11:21', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145604624547840', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:11:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145614191755264', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:11:47', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145901912621056', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:12:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411145912155111424', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:12:58', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411147002426687488', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:17:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411147036325052416', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:17:26', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411147676241625088', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:19:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411147683430662144', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:20:00', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411147969821933568', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:21:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411147975387774976', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:21:10', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411150105066602496', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:29:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411150110758273024', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:29:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411151088496672768', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:33:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411151094188343296', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:33:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411154712589238272', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:47:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411155373422804992', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:50:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411155628780421120', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:51:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411155902311956480', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:52:40', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411156636931719168', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:55:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411156644649238528', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:55:37', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411156724156465152', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:55:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411156730628276224', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:55:57', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411156845543817216', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 10:56:25', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158096570482688', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:01:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158105797951488', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:01:25', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158455946838016', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:02:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158463827935232', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:02:50', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158544849305600', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:03:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158551035904000', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:03:11', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158556077457408', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:03:12', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158561408417792', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:03:14', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158746104594432', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:03:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411158751502663680', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:03:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411158758884638720', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:04:01', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411159032302927872', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:05:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411159038263033856', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:05:07', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411159179632050176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:05:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411159186229690368', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:05:43', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411159243309973504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:05:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411159639306797056', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:07:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411160456206221312', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:10:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411160571025293312', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:11:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411160671311101952', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:11:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411160694694346752', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:11:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411160774113492992', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:12:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411161202087690240', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:13:43', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411162571158847488', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:19:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411162892933267456', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:20:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411162928593240064', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:20:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411162941117431808', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:20:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411163397898108928', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:22:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411164012921487360', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:24:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411164753094508544', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:27:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411165982893801472', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:32:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411165988749049856', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:32:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411166521387909120', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:34:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411167403080941568', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:38:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411167619628662784', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:39:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411167625429385216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 11:39:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411205845005369344', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:11:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411205850252443648', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:11:08', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411207573675180032', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:17:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411207579601731584', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:18:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411207879096008704', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:19:12', '登录成功', NULL, '火狐浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411207884489883648', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:19:13', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411207909882200064', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:19:19', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411207987103531008', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:19:38', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208017310908416', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:19:45', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208094683234304', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:20:03', '登录成功', NULL, '火狐浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411208100135829504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:20:05', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208120822136832', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:20:10', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208268235145216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:20:45', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208275570982912', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:20:47', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208390897565696', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:21:14', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208401005838336', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:21:16', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208429933953024', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:21:23', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411208440675565568', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:21:26', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411209295453749248', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:24:50', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411209298360401920', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:24:50', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411209353515499520', '删除用户', '/system/user/batchRemove/1306230031168569344', 'REMOVE', 'DELETE', 'admin', '/system/user/batchRemove/1306230031168569344', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:25:04', '删除用户', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411209358930345984', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:25:05', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411209376093437952', '删除用户', '/system/user/batchRemove/1310409555649232897', 'REMOVE', 'DELETE', 'admin', '/system/user/batchRemove/1310409555649232897', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:25:09', '删除用户', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411209381327929344', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 14:25:10', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411211476785430528', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:33:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411211482166722560', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:33:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411212037106696192', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:35:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411212042827726848', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:35:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411212848092151808', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:38:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411212853796405248', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:38:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411213246119018496', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:40:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411213251936518144', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:40:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411213515909234688', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:41:36', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411213521521213440', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:41:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411215802178207744', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:50:41', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411215802312425472', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:50:41', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411215803629436928', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:50:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411215949721239552', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:51:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411216130827091968', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:51:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411216136514568192', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:52:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411216729106808832', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:54:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411216734706204672', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:54:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411217027942580224', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:55:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411217036222136320', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:55:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411217238899294208', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:56:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411217244624519168', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:56:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411217738914856960', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:58:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411217744468115456', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 14:58:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411218369406828544', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:00:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411218375257882624', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:00:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411218697879552000', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:02:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411218703915155456', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:02:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411221188666982400', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:12:05', '登录成功', NULL, '火狐浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411221199555395584', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:12:08', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411221232078028800', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:12:16', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411221288558526464', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:12:29', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411221501629169664', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:13:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411221505924136960', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:13:21', '登录成功', NULL, '火狐浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411221511477395456', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:13:22', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411221516309233664', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:13:23', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411221543186333696', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:13:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411221548454379520', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:13:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411221939409649664', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:15:04', '登录成功', NULL, '火狐浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411221944828690432', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:15:06', '返回 Index 主页视图', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411221950268702720', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:15:07', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411222072750768128', '修改用户', '/system/user/update', 'EDIT', 'PUT', 'admin', '/system/user/update', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:15:36', '修改用户', NULL, '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411222078174003200', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '192.168.1.193', NULL, NULL, '1', NULL, '2021-07-03 15:15:37', '查询用户', 'page=1&limit=10', '火狐浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411222307615014912', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:16:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411222312841117696', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:16:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411222908784607232', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:18:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411222914325282816', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:18:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411223418128302080', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:20:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411223424096796672', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:20:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411224442595442688', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:25:01', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411224470747611136', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:25:08', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411224787421757440', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:26:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411224796829581312', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:26:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411225247511740416', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:28:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411225265060708352', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:28:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411225402457718784', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:28:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411225719559684096', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:30:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411225732926930944', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:30:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411226183596507136', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:31:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411226190198341632', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:31:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411226277590859776', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:32:19', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411226284419186688', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:32:20', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411227784948219904', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:38:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411227802182615040', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:38:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411228680188854272', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:41:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411228688325804032', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:41:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411229225406431232', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:44:01', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411229236605222912', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:44:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411230609979736064', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:49:31', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411230612404043776', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:49:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411230819556524032', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:50:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411230825726345216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:50:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411230954231431168', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:50:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411230963907690496', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:50:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411231158548561920', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:51:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411231167985745920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:51:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411231517824253952', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:53:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411231526103810048', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:53:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411232794377453568', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:58:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411232798076829696', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 15:58:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411234365072998400', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:04:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411234379170054144', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:04:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411236301885145088', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:12:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411236314199621632', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:12:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411236743327252480', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:13:54', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411237382644039680', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:16:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411237386804789248', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:16:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411237395029819392', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:16:29', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411237899264851968', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:18:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411237904977494016', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:18:31', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411238039719510016', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:19:03', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411238045285351424', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:19:04', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411238149668995072', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:19:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411238156165971968', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:19:31', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411238164823015424', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:19:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411238169944260608', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:19:34', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411238637932118016', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:21:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411238643653148672', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:21:27', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240420200939520', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:28:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411240428019122176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:28:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240437808627712', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:28:35', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240471019126784', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:28:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411240476316532736', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:28:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240482364719104', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:28:45', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240489226600448', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:28:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240495278981120', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:28:48', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240595594149888', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411240601180962816', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240607984123904', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:15', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240699336065024', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411240704985792512', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240710908149760', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:40', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240746664591360', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:48', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411240751945220096', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240757573976064', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:29:51', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240825291014144', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:30:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411240843817254912', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:30:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411240851262144512', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:30:13', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411242451963740160', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:36:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411242458385219584', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:36:36', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411242721812676608', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:37:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411242729295314944', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-03 16:37:41', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411638204980789248', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 18:49:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411638210953478144', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 18:49:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411638217236545536', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 18:49:13', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411639399518568448', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 18:53:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411639405893910528', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 18:53:56', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411639473623531520', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 18:54:12', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411646764565397504', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:23:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411646770265456640', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:23:12', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411646911068241920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:23:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411648675402219520', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:30:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411648681089695744', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:30:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411654418482331648', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:53:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411654423913955328', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:53:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411654957576224768', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:55:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411654962965905408', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:55:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411654979130753024', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 19:55:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411656938810245120', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:03:36', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411656944535470080', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:03:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411656959119065088', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:03:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411659512208687104', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:13:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411659518013603840', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:13:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411659717415010304', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:14:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411659724587270144', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:14:40', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411659745302937600', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:14:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411659897166102528', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:15:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411659902937464832', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:15:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411660049985568768', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:15:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411660057648562176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:16:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411660473270534144', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:17:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411660480216301568', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:17:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411660494707621888', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:17:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411661142333325312', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:20:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411661150378000384', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:20:20', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411662107446870016', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:24:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411662118968623104', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:24:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411662875780448256', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:27:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411662884563320832', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:27:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411663801337511936', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:30:52', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411663808123895808', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:30:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411664414561533952', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:33:19', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411664418357379072', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:33:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411664706246017024', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:34:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411664709580488704', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:34:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411665201706565632', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:36:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411665208413257728', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:36:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411665246564646912', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-04 20:36:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411851047722287104', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 08:54:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411851058002526208', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 08:54:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411853966223867904', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:06:31', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411853994384424960', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:06:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411855794793611264', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:13:47', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411855798350381056', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:13:48', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411857528731467776', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:20:41', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411857534116954112', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:20:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411857686072393728', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:21:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411857688396038144', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:21:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411859667407077376', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:29:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411859674218627072', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:29:12', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411860911857074176', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:34:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411860917368389632', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:34:08', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411861356117753856', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:35:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411861358172962816', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:35:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411861690206650368', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:37:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411861694694555648', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:37:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411861956431708160', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:38:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411862688895598592', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:41:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411862706369069056', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:41:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411862987995611136', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:42:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411862993121050624', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:42:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411863203402481664', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:43:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411863345434198016', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:43:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411865546655268864', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:52:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411865554397954048', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:52:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411867376936288256', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:59:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411867387321384960', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 09:59:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411867493537939456', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 10:00:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411868101615550464', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 10:02:41', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411868106271227904', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 10:02:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411868258910339072', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 10:03:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411877423154200576', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 10:39:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411877428162199552', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 10:39:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411880258247852032', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 10:51:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411883163185053696', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 11:02:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411883256139218944', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 11:02:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411885325835304960', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 11:11:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411885333036924928', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 11:11:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411897394731155456', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 11:59:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411899061547565056', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:05:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411899066970800128', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:05:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411899347288719360', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:06:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411899402875830272', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:07:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411900877974798336', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:12:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411900883616137216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:12:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411901004550504448', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:13:26', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411901619968147456', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:15:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411901629896065024', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:15:55', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411901652197179392', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:16:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411901658165673984', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:16:02', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411901833491775488', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:16:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411901839875506176', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 12:16:45', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411925123698524160', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 13:49:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411925135933308928', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 13:49:19', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411925557725102080', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 13:51:00', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411925563416772608', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 13:51:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411925766156845056', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 13:51:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411930897170563072', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:12:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411930902879010816', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:12:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411937259132813312', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:37:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411937265009033216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:37:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411938207930515456', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:41:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411938212057710592', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:41:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411938879891570688', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:43:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411938882110357504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:43:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411941236327055360', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:53:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411941241045647360', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:53:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411941260050038784', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:53:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411941265540382720', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 14:53:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411943718994313216', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:03:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411943723821957120', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:03:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411945301639430144', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:09:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411945306525794304', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:09:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411945435752300544', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:09:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411945679877570560', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:10:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411945696856113152', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:11:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411945837864419328', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:11:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411946370767519744', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:13:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411946377067364352', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:13:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411946876764160000', 'Remember Me', '/dishes/prepareOrder/update', 'OTHER', 'PUT', 'admin', '/dishes/prepareOrder/update', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:15:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411947246861156352', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:17:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411947273226551296', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:17:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411947767625940992', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:19:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411947773963534336', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:19:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411948368623566848', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:21:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411948373598011392', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:21:40', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411949651296256000', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:26:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411949654035136512', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:26:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411953550644215808', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:42:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411953567681478656', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:42:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411953686657105920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:42:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411953838092451840', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 15:43:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411959380630306816', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:05:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411959386607190016', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:05:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411959444555694080', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:05:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411959549597843456', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:06:04', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411959879114948608', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:07:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411959883728683008', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:07:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411960554569859072', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:10:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411960558168571904', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:10:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411960577491730432', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:10:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411960953070682112', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:11:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411960959047565312', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:11:40', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411961468328345600', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:13:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411961472669450240', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:13:43', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411961825288781824', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:15:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411961836433047552', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:15:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411961874462801920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:15:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411962390467051520', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:17:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411962402550841344', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:17:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1411962669862223872', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:18:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1411962684592619520', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-05 16:18:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412205386986946560', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 08:22:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412225728535068672', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 09:43:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412229556433059840', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 09:58:59', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412229582513242112', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 09:59:05', '查询用户', 'page=1&limit=10&realName=%E7%AE%A1%E7%90%86&username=', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412251915227496448', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 11:27:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412252950494969856', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 11:31:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412253499869102080', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 11:34:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412293770925309952', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:14:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412293776298213376', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:14:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412294219816501248', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:15:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412294684088205312', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:17:47', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412294688110542848', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:17:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412295027433930752', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:19:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412295034077708288', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:19:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412295563361124352', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:21:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412295567769337856', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:21:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412296723539165184', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:25:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412296729214058496', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:25:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412297308145451008', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:28:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412297313354776576', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:28:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412300758476390400', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:41:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412300764646211584', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 14:41:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412321919956418560', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:06:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412325473421099008', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:20:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412332189516824576', 'Remember Me', '/component/layui/css/modules/layer/default/icon.png', 'OTHER', 'GET', 'admin', '/component/layui/css/modules/layer/default/icon.png', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:46:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412332189521018880', 'Remember Me', '/dishes/customerBill/edit', 'OTHER', 'GET', 'admin', '/dishes/customerBill/edit', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:46:49', '登录成功', 'orderId=2', '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412332189521018881', 'Remember Me', '/component/layui/css/modules/layer/default/loading-1.gif', 'OTHER', 'GET', 'admin', '/component/layui/css/modules/layer/default/loading-1.gif', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:46:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412332242906120192', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:47:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412332975483256832', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:49:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412332980977795072', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:49:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412333248649887744', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:51:01', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412333257118187520', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:51:03', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412334736017195008', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:56:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412334741046165504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:56:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412335503813902336', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 16:59:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412335508889010176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:00:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412335851983077376', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:01:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412335856135438336', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:01:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412336755356467200', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:04:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412336760662261760', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:04:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412337599636307968', 'Remember Me', '/component/layui/css/modules/layer/default/icon.png', 'OTHER', 'GET', 'admin', '/component/layui/css/modules/layer/default/icon.png', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:08:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412337611598462976', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:08:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412339068884221952', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:14:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412339073372127232', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:14:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412340625419796480', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:20:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412340628049625088', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:20:20', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412341105415946240', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:22:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412341110260367360', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:22:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412341782728933376', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:24:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412341787372027904', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:24:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412342072895078400', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:26:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412342076812558336', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:26:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412342535107379200', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:27:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412342538408296448', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:27:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412343001488818176', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:29:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412343007297929216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:29:48', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412343399733788672', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:31:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412343401323429888', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:31:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412348572489220096', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:51:55', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412348600402313216', '修改用户', '/system/user/update', 'EDIT', 'PUT', 'admin', '/system/user/update', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:52:01', '修改用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412348605603250176', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:52:02', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412348731927298048', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-06 17:52:33', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412348813913358336', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-06 17:52:52', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412348907131764736', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:53:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412348912374644736', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:53:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412348920364793856', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:53:17', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412349041496293376', '登录', '/login', 'OTHER', 'POST', '123456', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:53:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412349046831448064', '主页', '/index', 'ADD', 'GET', '123456', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:53:48', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412349056709033984', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 17:53:50', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412364773114249216', '主页', '/index', 'ADD', 'GET', '123456', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 18:56:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412364782442381312', '查询用户', '/system/user/data', 'QUERY', 'GET', '123456', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 18:56:19', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412365344739164160', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 18:58:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412365350065930240', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 18:58:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412365361629626368', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 18:58:37', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412367475189743616', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:07:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412368822970613760', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:12:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412370649384484864', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:19:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412370655143264256', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:19:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412371917154811904', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:24:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412371934452121600', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:24:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412372137947168768', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:25:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412372223276089344', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:25:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412372657579491328', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:27:37', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412373303938514944', 'Remember Me', '/dishes/tableBill/main', 'OTHER', 'GET', 'admin', '/dishes/tableBill/main', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:30:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412373359001337856', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:30:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412373364353269760', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-06 19:30:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412560408450957312', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 07:53:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412560419125460992', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 07:53:43', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412560858181009408', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 07:55:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412560862178181120', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 07:55:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412561139585253376', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 07:56:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412561144605835264', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 07:56:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412562117281710080', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:00:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412562119907344384', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:00:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412562349780369408', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:01:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412562354381520896', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:01:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412562434010382336', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:01:43', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412562835392692224', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:03:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412562845777788928', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:03:21', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412564303885631488', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:09:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412564311666065408', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:09:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412566987300667392', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:19:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412566988567347200', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:19:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412566993499848704', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:19:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412567075083255808', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:20:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412567077029412864', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:20:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412567439996092416', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:21:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412567443724828672', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:21:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412567700391067648', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:22:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412567705076105216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:22:40', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412573962939924480', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:47:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412573973996109824', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:47:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412576362656432128', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 08:57:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412586938023542784', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 09:39:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412586942494670848', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 09:39:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412587236402135040', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 09:40:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412587240751628288', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 09:40:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412599004755132416', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 10:27:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412599010010595328', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 10:27:03', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412614100462075904', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 11:27:01', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412614102806691840', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 11:27:02', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412649310448779264', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:46:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412649316203364352', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:46:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412649974872670208', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:49:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412650514293719040', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:51:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412650518924230656', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:51:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412650941320003584', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:53:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412650950430031872', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:53:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412651801211043840', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:56:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412651806491672576', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:56:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412651947768414208', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:57:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412651951530704896', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 13:57:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412652658224791552', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:00:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412652662519758848', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:00:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412653022130995200', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:01:41', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412653028397285376', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:01:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412653447081099264', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:03:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412653462214148096', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:03:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412657151888850944', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:18:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412657156385144832', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:18:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412660331808817152', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:30:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412660335323643904', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:30:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412661334427828224', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:34:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412661338773127168', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:34:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412666325465038848', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 14:54:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412676096435945472', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 15:33:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412676784566042624', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 15:36:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412679016745271296', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 15:44:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412679592694513664', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 15:47:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412680577768751104', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 15:51:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412682089643376640', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 15:57:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412682152226586624', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 15:57:26', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412682828855902208', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:00:07', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412683237909594112', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:01:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412683613710843904', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:03:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412683672259133440', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:03:29', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412685006601453568', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:08:47', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412685378170650624', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:10:15', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412687095973019648', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:17:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412687113480044544', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:17:09', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412687369420668928', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:18:10', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412688590386757632', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:23:01', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412688617339355136', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:23:08', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412689178218463232', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:25:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412689201924669440', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:25:27', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412690525378576384', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:30:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412690549571321856', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:30:48', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412690740517011456', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:31:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412690762121871360', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:31:39', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412690944993525760', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:32:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412690971467972608', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:32:29', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412691528928722944', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:34:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412691549942185984', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:34:47', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412691790804287488', 'Remember Me', '/dishes/customerBill/edit', 'OTHER', 'GET', 'admin', '/dishes/customerBill/edit', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:35:44', '登录成功', 'orderId=2', '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412692442313916416', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:38:19', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412692473171410944', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:38:27', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412696015215001600', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:52:31', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412696780864225280', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:55:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412696807502249984', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:55:40', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412697400618778624', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:58:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412697424111075328', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:58:07', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412697834133651456', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:59:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412697857000996864', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 16:59:50', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412698938342899712', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:04:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412698952377040896', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:04:12', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412700381221224448', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:09:52', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412700397415432192', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:09:56', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412700598351953920', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:10:44', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412700609194229760', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:10:47', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412701007728607232', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:12:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412701020970024960', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:12:25', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412701657422102528', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:14:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412701673289154560', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:15:00', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412702470601179136', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:18:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412702488015929344', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:18:15', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412703175412023296', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:20:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412703194722598912', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:21:03', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412703254256549888', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:21:17', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412707290275905536', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:37:19', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412707306931486720', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:37:23', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412707743462064128', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:39:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412707757752057856', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:39:11', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412708286230167552', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:41:17', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412708299542888448', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:41:20', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412709120867303424', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 17:44:36', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412736783153627136', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 19:34:31', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412738174668505088', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 19:40:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412738180636999680', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 19:40:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412739829732474880', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 19:46:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412739845897322496', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 19:46:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412740099086483456', 'Remember Me', '/system/power/main', 'OTHER', 'GET', 'admin', '/system/power/main', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 19:47:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412740147551666176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 19:47:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412740241311137792', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-07 19:48:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412921892280467456', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 07:50:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412921896042758144', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 07:50:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412923886864957440', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 07:58:00', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412923890442698752', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 07:58:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412924249852608512', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 07:59:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412924253816225792', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 07:59:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412925544822996992', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:04:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412925549302513664', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:04:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412927172846288896', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:11:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412927176835072000', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:11:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412928439635148800', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:16:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412928444857057280', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:16:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412931817568206848', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:29:31', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412934912020840448', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:41:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412934915539861504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:41:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412935344206118912', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:43:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412935347888717824', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:43:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412938221720961024', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:54:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412938225458085888', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:54:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412938610222563328', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:56:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412938613712224256', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:56:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412939282712100864', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:59:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412939289901137920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 08:59:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412939878512984064', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:01:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412939882594041856', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:01:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412940264279900160', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:03:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412940269858324480', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:03:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412940517355814912', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:04:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412940521571090432', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:04:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412942857123135488', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:13:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412942867394985984', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:13:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412942912206929920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:13:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412943071322046464', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:14:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412943075491184640', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:14:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412943259423997952', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:14:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412943265287634944', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:15:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412945895917355008', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:25:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412945914300989440', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:25:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412945952116834304', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:25:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412946396494954496', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:27:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412946402295676928', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:27:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412946659196796928', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:28:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412946662912950272', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 09:28:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412954956276695040', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:01:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412954961100144640', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:01:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412955376134914048', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:03:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412955389976117248', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:03:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412957211067416576', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:10:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412957221809029120', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:10:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412957661401448448', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:12:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412959647916097536', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:20:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412959652483694592', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:20:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412959889797414912', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:21:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412959894109159424', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:21:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412960291485908992', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:22:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412960295474692096', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:22:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412962642221334528', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:32:00', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412962646138814464', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:32:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412962855308754944', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:32:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412962858932633600', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:32:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412963370302177280', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:34:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412964544443056128', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:39:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412964557734805504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:39:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412964752342122496', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:40:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412966152748924928', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:45:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412966800840196096', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:48:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412966806569615360', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:48:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412967770944962560', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:52:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412967777290944512', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:52:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412968017502928896', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:53:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412968021428797440', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 10:53:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412970104584404992', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:01:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412970108858400768', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:01:40', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412970596198776832', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:03:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412970598790856704', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:03:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412971313110188032', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:06:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412971316343996416', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:06:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412971739226308608', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:08:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412972308628242432', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:10:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412972312751243264', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:10:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412972352685211648', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:10:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412972597250883584', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:11:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412972600744738816', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:11:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412972817879662592', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:12:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412972829397221376', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:12:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412972849882202112', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:12:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412973683894386688', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:15:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412973688919162880', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:15:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412974067220217856', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:17:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412974071863312384', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:17:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412975511579131904', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:23:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412975516490661888', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:23:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412976035716136960', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:25:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412976040438923264', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:25:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412976537275203584', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:27:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412976541691805696', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:27:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412976677872467968', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:27:47', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412976681970302976', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:27:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412976827311325184', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:28:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412976832071860224', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:28:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1412976983301685248', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:28:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1412976988087386112', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 11:29:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413015977439789056', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:03:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413015982359707648', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:03:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413016381510647808', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:05:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413016386946465792', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:05:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413017818772799488', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:11:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413017834958618624', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:11:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413027685856182272', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:50:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413027691635933184', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:50:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413028114153340928', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:52:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413028118297313280', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:52:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413028468131627008', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:53:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413028471814225920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 14:53:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413035275130503168', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:20:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413035279505162240', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:20:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413035703394107392', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:22:19', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413035707198341120', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:22:20', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413035951352971264', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:23:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413035954968461312', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:23:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413036714192011264', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:26:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413036718172405760', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:26:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413037055201509376', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:27:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413037058733113344', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:27:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413037745206460416', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:30:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413037749824389120', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:30:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413041899970756608', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:46:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413041905259773952', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:46:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413042171346419712', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:48:01', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413042175792381952', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:48:02', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413042231438213120', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 15:48:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413045590756950016', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:01:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413045595517485056', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:01:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413046168207753216', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:03:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413046170845970432', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:03:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413047106372894720', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:07:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413047110722387968', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:07:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413047236048191488', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:08:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413047240397684736', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:08:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413047523060219904', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:09:17', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413047527925612544', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:09:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413048263258406912', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:12:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413048268966854656', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:12:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413048436432830464', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:12:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413048440736186368', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:12:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413048704956366848', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:13:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413048708907401216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:14:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413049049891733504', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:15:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413049054820040704', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:15:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413049274018562048', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:16:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413049278414192640', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:16:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413049626423984128', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:17:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413049631062884352', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:17:40', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413049835094802432', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:18:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413049841524670464', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:18:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413050868013465600', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:22:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413050872530731008', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:22:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413051119801729024', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:23:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413051124579041280', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:23:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413051325549117440', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:24:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413051330699722752', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:24:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413051553660534784', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:25:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413051558790168576', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:25:20', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413051737228443648', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:26:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413051742290968576', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:26:03', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413052039813922816', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:27:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413052045090357248', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:27:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413052214334717952', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:27:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413052218721959936', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:27:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413052365027672064', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:28:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413052375987388416', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:28:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413053094010290176', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:31:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413053098561110016', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:31:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413053851375763456', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:34:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413053856073383936', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:34:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413054073510297600', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:35:19', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413054077465526272', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:35:20', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413055048115552256', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:39:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413055053052248064', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:39:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413055395181625344', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:40:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413055400688746496', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:40:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413055623607615488', 'Remember Me', '/dishes/order/edit', 'OTHER', 'GET', 'admin', '/dishes/order/edit', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:41:29', '登录成功', 'orderId=7', '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413055632486957056', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:41:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413055636630929408', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:41:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413056166790955008', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:43:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413056170045734912', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:43:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413056555477106688', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:45:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413056561126834176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:45:12', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413057422896922624', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:48:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413057426713739264', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:48:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413059039448793088', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 16:55:03', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413088724039761920', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 18:53:00', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413088729320390656', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 18:53:02', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413093351044939776', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:11:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413093355637702656', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:11:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413094955886313472', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:17:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413094964346224640', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:17:48', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413102739306577920', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:48:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413102744549457920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:48:43', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413103250990694400', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:50:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413103256531369984', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:50:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413104992839008256', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:57:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413104998522290176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:57:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413105423287844864', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:59:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413105427989659648', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 19:59:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413106223254863872', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 20:02:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413106227365281792', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 20:02:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413107441461100544', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 20:07:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413107445575712768', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-08 20:07:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413290337509572608', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:14:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413290341825511424', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:14:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413291897920684032', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:20:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413291901745889280', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:20:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413292287143706624', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:21:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413292291174432768', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:21:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413292454894895104', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:22:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413292459928059904', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:22:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413294093890486272', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:29:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413294098147704832', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:29:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413294275948445696', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:29:48', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413294281082273792', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:29:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413294912618627072', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:32:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413294917186224128', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:32:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413295211349540864', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:33:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413295664850272256', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:35:19', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413295669019410432', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:35:20', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413296382105616384', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:38:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413296387101032448', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:38:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413298558852923392', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:46:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413298564058054656', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:46:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413298978421735424', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:48:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413298983496843264', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:48:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413300297203187712', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:53:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413300303255568384', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:53:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413300752109010944', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:55:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413300756328480768', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:55:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413301228363841536', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:57:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413301233975820288', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 08:57:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413305857797521408', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:15:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413305862977486848', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:15:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413308908851691520', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:27:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413308913037606912', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:27:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413310041406046208', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:32:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413310046376296448', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:32:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413310499440820224', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:34:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413310504910192640', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:34:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413310770149588992', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:35:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413310773945434112', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:35:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413310809479577600', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:35:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413311795556253696', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:39:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413311800362926080', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:39:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413312027677425664', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:40:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413312031653625856', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:40:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413312205322977280', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:41:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413312209114628096', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:41:03', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413312411238137856', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:41:52', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413312415315001344', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:41:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413312794844987392', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:43:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413312801643954176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:43:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413313803692539904', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:47:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413313807861678080', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:47:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413316073511452672', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:56:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413316077919666176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:56:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413316112304570368', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:56:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413316454874349568', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:57:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413316458959601664', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:57:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413316764338487296', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:59:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413316770952904704', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 09:59:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413317469442932736', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:01:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413317474912305152', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:01:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413317746350882816', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:03:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413317751321133056', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:03:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413317923891576832', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:03:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413317928161378304', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:03:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413318120776400896', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:04:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413318125675347968', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:04:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413318417863147520', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:05:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413318421122121728', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:05:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413318671291383808', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:06:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413318674894290944', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:06:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413319766445129728', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:11:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413319772417818624', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:11:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413320185527402496', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:12:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413320189491019776', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:12:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413322139452309504', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:20:31', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413322144221233152', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:20:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413324023617552384', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:28:00', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413324029875453952', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:28:02', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413324274365628416', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:29:00', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413324278815784960', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:29:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413324573943791616', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:30:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413324591845081088', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:30:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413324811202985984', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:31:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413324815892217856', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:31:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413325340721283072', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:33:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413325345515372544', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:33:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413325977383075840', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:35:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413325983489982464', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:35:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413326183927382016', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:36:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413326189036044288', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:36:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413327525441961984', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:41:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413327531746000896', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:41:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413327795534168064', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:42:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413327800475058176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:43:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413327832209162240', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:43:08', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413330043660140544', 'Remember Me', '/dishes/order/edit', 'OTHER', 'GET', 'admin', '/dishes/order/edit', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:51:55', '登录成功', 'orderId=4', '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413330046323523584', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:51:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413330053982322688', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:51:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413330418664472576', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:53:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413330422359654400', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 10:53:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413333734249201664', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:06:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413333739118788608', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:06:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413334214849331200', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:08:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413334217676292096', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:08:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413334466511765504', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:09:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413334470626377728', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:09:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413335032096882688', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:11:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413335036526067712', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:11:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413335646071685120', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:14:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413335650442149888', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:14:12', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413336084389036032', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:15:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413336088432345088', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:15:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413338155511185408', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:24:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413338160179445760', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:24:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413340411627307008', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:33:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413340416400424960', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 11:33:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413356506388103168', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:37:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413356511089917952', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:37:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413356918285533184', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:38:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413356924027535360', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:38:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413358988736593920', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:46:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413358995971768320', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:46:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413361886153408512', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:58:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413361891358539776', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:58:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413362167486349312', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:59:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413362171840036864', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 12:59:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413362746828783616', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:01:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413362751249580032', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:01:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413362923442536448', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:02:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413364215934091264', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:07:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413364220614934528', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:07:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413364268706824192', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:07:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413364637809770496', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:09:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413364655094497280', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:09:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413365312048332800', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:12:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413365316888559616', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 13:12:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413378746710228992', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:05:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413378766360543232', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:05:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413379015837745152', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:06:31', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413379023878225920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:06:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413379407954837504', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:08:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413379413222883328', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:08:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413379715976134656', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:09:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413379720824750080', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:09:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413380104544845824', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:10:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413380109452181504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:10:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413382020939120640', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:18:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413382026798563328', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:18:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413382436653367296', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:20:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413382441124495360', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:20:08', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413382726995673088', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:21:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413382731374526464', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:21:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413383098711670784', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:22:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413383104227180544', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:22:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413383318950379520', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:23:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413383324260368384', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:23:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413383983432990720', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:26:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413383987715375104', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:26:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413384407691034624', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:27:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413384412132802560', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:27:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413386645440299008', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:36:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413386649936592896', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:36:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413386978048606208', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:38:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413386983186628608', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:38:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413387686940508160', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:40:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413387690841210880', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:41:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413388581849792512', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:44:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413388585897295872', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:44:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413388756785823744', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:45:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413388760376147968', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:45:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413388964139630592', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:46:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413388968157773824', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:46:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413389258353278976', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:47:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413389262862155776', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:47:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413389842531745792', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:49:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413389846579249152', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:49:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413390619404926976', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:52:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413390622999445504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:52:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413390867489619968', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:53:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413390871335796736', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:53:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413391730241175552', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:57:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413391734682943488', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:57:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413391874856583168', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:57:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413391878862143488', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:57:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413392174359248896', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:58:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413392178448695296', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:58:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413392316038643712', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:59:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413392319985483776', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 14:59:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413392795606974464', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:01:17', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413392799692226560', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:01:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413393173203386368', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:02:47', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413393177204752384', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:02:48', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413394287923560448', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:07:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413394291958480896', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:07:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413394631780990976', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:08:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413394635597807616', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:08:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413394925055115264', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:09:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413394928490250240', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:09:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413395876767858688', 'Remember Me', '/dishes/order/edit', 'OTHER', 'GET', 'admin', '/dishes/order/edit', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:13:31', '登录成功', 'orderId=11', '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413395878009372672', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:13:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413395883046731776', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:13:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413396062026072064', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:14:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413396067164094464', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:14:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413396499831717888', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:16:00', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413396504789385216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:16:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413396722771558400', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:16:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413396726768730112', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:16:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413397289631744000', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:19:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413397294614577152', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:19:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413397895385710592', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:21:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413397899038949376', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:21:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413398552561844224', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:24:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413398557133635584', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:24:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413399043693871104', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:26:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413399048374714368', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:26:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413401912614584320', 'Remember Me', '/dishes/order/edit', 'OTHER', 'GET', 'admin', '/dishes/order/edit', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:37:30', '登录成功', 'orderId=11', '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413401914107756544', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:37:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413401920273383424', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:37:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413402138096173056', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:38:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413402141309009920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:38:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413402885122686976', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:41:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413402889472180224', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:41:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413403059987415040', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:42:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413403063951032320', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:42:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413403436644302848', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:43:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413403440268181504', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:43:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413404390370312192', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:47:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413404393696395264', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:47:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413406557294559232', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:55:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413406560704528384', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:55:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413406794478256128', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:56:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413406805907734528', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 15:56:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413409901996146688', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:09:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413409906194644992', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:09:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413411978809966592', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:17:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413411983071379456', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:17:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413412460534169600', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:19:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413412464577478656', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:19:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413413197989281792', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:22:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413413202456215552', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:22:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413416674199076864', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:36:10', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413416678930251776', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:36:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413416898787278848', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:37:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413416908241240064', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:37:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413417194389241856', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:38:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413417194389241857', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:38:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413417217743126528', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:38:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413421111873372160', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:53:48', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413421116336111616', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:53:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413422140769697792', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:57:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413422144422936576', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 16:57:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413423010517352448', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:01:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413423021892304896', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:01:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413423543055548416', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:03:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413423547178549248', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:03:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413423914729603072', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:04:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413423917879525376', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:04:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413424155616870400', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:05:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413424159467241472', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:05:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413424344410882048', 'Remember Me', '/component/pear/css/pear.css', 'OTHER', 'GET', 'admin', '/component/pear/css/pear.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:06:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413424344410882049', 'Remember Me', '/component/pear/css/module/dtree/dtree.css', 'OTHER', 'GET', 'admin', '/component/pear/css/module/dtree/dtree.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:06:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413424344410882050', 'Remember Me', '/component/pear/font/iconfont.css', 'OTHER', 'GET', 'admin', '/component/pear/font/iconfont.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:06:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413424344410882051', 'Remember Me', '/component/layui/css/layui.css', 'OTHER', 'GET', 'admin', '/component/layui/css/layui.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:06:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413424344410882052', 'Remember Me', '/component/pear/css/module/iconPicker.css', 'OTHER', 'GET', 'admin', '/component/pear/css/module/iconPicker.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:06:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413424344410882053', 'Remember Me', '/component/pear/css/module/dtree/font/dtreefont.css', 'OTHER', 'GET', 'admin', '/component/pear/css/module/dtree/font/dtreefont.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:06:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413424388929224704', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:06:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413424402413912064', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:06:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413424648669888512', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:07:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413424654504165376', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:07:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413425508187635712', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:11:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413425512923004928', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:11:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413425819941863424', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:12:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413425823809011712', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:12:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413426570151854080', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:15:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413426574073528320', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:15:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413426775479812096', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:16:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413426778881392640', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:16:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413427342176419840', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:18:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413427347830341632', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 17:18:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413449194877747200', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 18:45:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413449199868968960', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 18:45:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413450351821979648', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 18:49:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413450355806568448', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 18:50:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413454218429202432', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:05:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413454222753529856', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:05:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413457326001618944', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:17:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413457330753765376', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:17:43', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413459176939585536', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:25:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413459181863698432', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:25:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413459603106037760', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:26:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413459608374083584', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:26:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413459747281043456', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:27:19', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413459753803186176', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:27:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413460633159991296', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:30:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413460637744365568', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:30:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413463224572968960', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:41:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413463231657148416', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:41:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413466477834534912', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:54:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413466482712510464', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 19:54:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413473189840814080', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 20:20:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413473194819452928', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 20:20:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413473977342361600', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 20:23:52', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413473981662494720', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 20:23:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413474991814475776', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 20:27:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413474996247855104', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 20:27:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413520475585249280', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:28:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413520554899537920', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:28:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413520560196943872', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:28:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413520830435950592', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:30:03', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413527964833808384', 'Remember Me', '/system/user/center', 'OTHER', 'GET', 'admin', '/system/user/center', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:58:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413527979518066688', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:58:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413527998316937216', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:58:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413528021603713024', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:58:37', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413528115799392256', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-09 23:59:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413529753398280192', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:05:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413529759060590592', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:05:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413530317360201728', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:07:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413530324184334336', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:07:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413530628409786368', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:08:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413530633665249280', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:09:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413531317995307008', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:11:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413531323145912320', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:11:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413536572254453760', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:32:36', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413536584963194880', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:32:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413537650173804544', 'Remember Me', '/index', 'OTHER', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:36:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413537654766567424', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:36:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413539225155928064', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:43:08', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413539421122199552', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:43:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413539426344108032', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 00:43:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1413727140263755776', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 13:09:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1413727224380522496', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-10 13:10:11', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414042681625018368', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 10:03:42', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414042688340099072', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 10:03:43', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414160149207056384', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:50:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414160154936475648', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:50:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414160334549155840', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:51:12', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414160723004620800', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:52:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414160731128987648', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:52:47', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161200970727424', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:54:39', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161301776629760', '修改用户', '/system/user/update', 'EDIT', 'PUT', 'admin', '/system/user/update', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:55:03', '修改用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161307019509760', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:55:04', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161460212269056', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-11 17:55:41', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414161499135410176', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-11 17:55:50', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414161574720962560', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:56:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414161580047728640', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:56:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161584258809856', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:56:10', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161645625671680', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:56:25', '查询用户', 'page=1&limit=10&realName=&username=&deptId=', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161666152595456', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:56:30', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161791079940096', '修改用户', '/system/user/update', 'EDIT', 'PUT', 'admin', '/system/user/update', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:57:00', '修改用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414161796335403008', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:57:01', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414162398377410560', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:59:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414162403599319040', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:59:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414162407978172416', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 17:59:27', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414162703856959488', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:00:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414162792881061888', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:00:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414162852784111616', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:01:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414162858026991616', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:01:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414162923860787200', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:01:30', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414163074583101440', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:02:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414163079805009920', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:02:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414163616696893440', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:04:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414163621918801920', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:04:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414163664751034368', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:04:26', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414163739078295552', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:04:44', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414163815532068864', '新增用户', '/system/user/save', 'ADD', 'POST', 'user1', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:05:02', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414163821051772928', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:05:03', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414163878241107968', '登录', '/login', 'OTHER', 'POST', 'user2', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:05:17', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414163883488182272', '主页', '/index', 'ADD', 'GET', 'user2', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:05:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414164021484978176', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:05:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414164026736246784', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:05:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414164301647708160', '登录', '/login', 'OTHER', 'POST', 'user2', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:06:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414164306886393856', '主页', '/index', 'ADD', 'GET', 'user2', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:06:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414164509697769472', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:07:48', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414164514940649472', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:07:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414164552089600000', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:07:58', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414164633605898240', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:08:17', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414164639104630784', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:08:19', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414164704196034560', '登录', '/login', 'OTHER', 'POST', 'user3', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:08:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414164709392777216', '主页', '/index', 'ADD', 'GET', 'user3', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-11 18:08:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414174780822650880', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '223.104.146.110', NULL, NULL, '1', NULL, '2021-07-11 18:48:37', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414174788082991104', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '223.104.146.110', NULL, NULL, '1', NULL, '2021-07-11 18:48:38', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414232166786662400', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '183.208.133.228', NULL, NULL, '1', NULL, '2021-07-11 22:36:38', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414232172235063296', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '183.208.133.228', NULL, NULL, '1', NULL, '2021-07-11 22:36:40', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414752705762557952', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:05:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414752712553136128', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:05:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414753398443474944', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:07:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414754344644902912', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:11:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414754374357352448', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:11:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414755073728184320', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:14:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414755078845235200', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:14:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414755930976813056', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:17:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414756796886679552', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:21:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414756801722712064', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:21:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414757228426035200', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:23:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414757230909063168', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:23:03', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414757560359059456', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:24:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414757566092673024', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:24:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414758563120676864', 'Remember Me', '/component/pear/css/module/dtree/font/dtreefont.css', 'OTHER', 'GET', 'user1', '/component/pear/css/module/dtree/font/dtreefont.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:28:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414758563233923072', 'Remember Me', '/component/pear/css/pear.css', 'OTHER', 'GET', 'user1', '/component/pear/css/pear.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:28:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414758563317809152', 'Remember Me', '/component/pear/css/module/iconPicker.css', 'OTHER', 'GET', 'user1', '/component/pear/css/module/iconPicker.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:28:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414758568371945472', 'Remember Me', '/component/pear/font/iconfont.css', 'OTHER', 'GET', 'user1', '/component/pear/font/iconfont.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:28:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414758568984313856', 'Remember Me', '/component/layui/css/layui.css', 'OTHER', 'GET', 'user1', '/component/layui/css/layui.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:28:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414758570381017088', 'Remember Me', '/component/pear/css/module/dtree/dtree.css', 'OTHER', 'GET', 'user1', '/component/pear/css/module/dtree/dtree.css', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:28:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414760886169501696', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:37:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414760892687450112', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:37:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414762832452386816', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:45:19', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1414762846692048896', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 09:45:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1414849666863857664', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-13 15:30:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415155376399056896', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 11:45:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415155382946365440', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 11:45:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415159462364184576', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 12:01:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415159468403982336', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 12:01:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415159605897461760', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 12:01:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415161566319345664', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 12:09:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415205578891853824', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:04:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415205600370884608', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:04:43', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415206193785208832', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:07:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415208504016240640', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:16:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415208510701961216', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:16:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415208554154950656', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:16:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415208967520387072', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:18:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415208974298382336', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:18:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415210822438748160', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:25:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415210864797024256', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:25:38', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415211077947359232', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '112.23.150.218', NULL, NULL, '1', NULL, '2021-07-14 15:26:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415211083672584192', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '112.23.150.218', NULL, NULL, '1', NULL, '2021-07-14 15:26:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415211213557596160', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '112.23.150.218', NULL, NULL, '1', NULL, '2021-07-14 15:27:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415213231068151808', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:35:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415213237246361600', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:35:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415213256523382784', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:35:10', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415213321472180224', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:35:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415218621994500096', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:56:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415218634933927936', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:56:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415218999867736064', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:57:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415219005114810368', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:57:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415219482569211904', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:59:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415219498125885440', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 15:59:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415219722575675392', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 16:00:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415219850057351168', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 16:01:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415219854046134272', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 16:01:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415241141950873600', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:25:57', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415241149412540416', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:25:59', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415241274448936960', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:26:28', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415241562081722368', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:27:37', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415241712028090368', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:28:13', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415241887064784896', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:28:54', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415242285565607936', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:30:29', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415242301369745408', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:30:33', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415243699029278720', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:36:06', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415244026323402752', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:37:24', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415244458475126784', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:39:08', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415245273847824384', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-14 17:42:22', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415479427566927872', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:12:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415479434172956672', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:12:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415479445917007872', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:12:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415479479228170240', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:13:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415480073439412224', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:15:23', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415480080003497984', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:15:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415482025762095104', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:23:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415482030904311808', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:23:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415482335419170816', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:24:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415482339718332416', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:24:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415482665691250688', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:25:41', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415482674239242240', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:25:43', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415484443715436544', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:32:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415484455778254848', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:32:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415484732661039104', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:33:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415484737530626048', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:33:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415485098886692864', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:35:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415485106235113472', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:35:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415485972514078720', 'Remember Me', '/component/layui/css/modules/layer/default/icon.png', 'OTHER', 'GET', 'user1', '/component/layui/css/modules/layer/default/icon.png', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:38:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415489054991974400', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:51:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415489063980367872', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:51:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415490408024113152', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:56:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415490413023723520', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 09:56:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415507669208268800', 'Remember Me', '/system/role/main', 'OTHER', 'GET', 'user1', '/system/role/main', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:05:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415507685293424640', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:05:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415507720223588352', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:05:14', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415507932606365696', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:06:05', '查询用户', 'page=1&limit=10&realName=user1&username=', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415508272982523904', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:07:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415508282600062976', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:07:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415508291169026048', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:07:30', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415509013348483072', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:10:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415509050719731712', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:10:31', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415509057631944704', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:10:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415509065064251392', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '0', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'deptId\' in \'class com.pearadmin.system.domain.SysUser\'', '2021-07-15 11:10:35', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415509377648951296', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:11:49', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415509384192065536', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:11:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415509390617739264', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:11:52', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415509698232188928', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:13:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415509704854994944', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:13:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415509711565881344', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:13:09', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415509911135059968', '新增用户', '/system/user/save', 'ADD', 'POST', 'user1', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:13:57', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415509918714167296', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:13:58', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415512816818847744', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:25:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415512830794268672', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:25:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415512840965455872', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:25:36', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415513206855565312', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:27:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415513213507731456', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:27:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415513222017974272', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:27:06', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415513320240185344', '新增用户', '/system/user/save', 'ADD', 'POST', 'user1', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:27:30', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415513327794126848', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:27:31', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415513338657374208', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:27:34', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415513365970681856', '修改用户', '/system/user/update', 'EDIT', 'PUT', 'user1', '/system/user/update', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:27:40', '修改用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415513373126164480', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 11:27:42', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415524649147564032', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 12:12:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415524655497740288', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 12:12:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415524661759836160', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 12:12:33', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415524677622693888', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 12:12:37', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415524682576166912', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 12:12:38', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415551063800414208', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 13:57:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415551070351917056', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 13:57:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415552135906459648', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:01:44', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415552143519121408', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:01:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415552172073943040', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:01:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415552411707113472', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-15 14:02:49', '账户密码不正确', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415552448373719040', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:02:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415552455508230144', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:03:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415552509832855552', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:03:13', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415553632031473664', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:07:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415553639417643008', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:07:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415553645834928128', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:07:44', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415553874164449280', '新增用户', '/system/user/save', 'ADD', 'POST', 'user1', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:08:39', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415553884260139008', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:08:41', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415553910629728256', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:08:47', '查询用户', 'page=1&limit=10&realName=user6&username=', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415553933073448960', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:08:52', '查询用户', 'page=1&limit=10&realName=user&username=', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415553999687385088', '修改用户', '/system/user/update', 'EDIT', 'PUT', 'user1', '/system/user/update', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:09:09', '修改用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415554009132957696', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:09:11', '查询用户', 'page=1&limit=10&realName=user&username=', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415554023234207744', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:09:14', '查询用户', 'page=1&limit=10&realName=user7&username=', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415554108097560576', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-15 14:09:34', '用户未启用', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415554148560011264', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:09:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415554155455447040', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:09:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415554161579130880', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:09:47', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415554178175991808', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:09:51', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415554192814112768', '删除用户', '/system/user/remove/1415553874164449281', 'REMOVE', 'DELETE', 'user1', '/system/user/remove/1415553874164449281', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:09:54', '删除用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415554217971548160', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:10:00', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415554236288073728', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:10:05', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415556878712176640', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:20:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415556885108490240', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:20:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415556891634827264', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:20:38', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415557251657105408', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:22:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415557263665397760', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:22:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415557319420280832', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:22:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415557614384709632', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:23:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415557618520293376', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:23:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415560732589686784', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:35:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415560737840955392', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:35:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415561080515592192', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:37:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415561083967504384', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:37:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415561428902871040', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:38:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415561476449501184', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:38:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415566219183915008', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:57:41', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415566223294332928', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 14:57:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415567009478868992', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:00:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415567015283785728', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:00:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415569543345995776', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:10:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415569548416909312', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:10:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415574370864070656', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:30:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415574375884652544', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:30:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415574832434642944', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:31:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415574837660745728', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:31:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415575506606096384', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:34:36', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415575511777673216', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:34:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415575910077169664', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:36:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415575915823366144', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:36:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415576558420099072', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:38:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415576565776908288', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:38:48', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415577299377455104', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:41:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415577979773255680', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:44:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415581391533375488', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 15:57:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415583164629254144', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:05:01', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415583171201728512', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:05:03', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415583493341052928', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:06:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415583499498291200', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:06:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415584346542178304', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:09:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415584353429225472', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:09:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415585223181074432', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:13:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415585231771009024', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:13:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415586829880524800', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:19:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415586833420517376', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:19:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415587141861244928', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:20:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415587145564815360', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:20:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415588641543028736', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:26:47', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415588645217239040', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:26:48', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415588675365896192', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:26:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415590517592293376', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:34:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415590522642235392', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:34:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415590840004247552', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:35:31', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415590845100326912', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:35:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415591086293778432', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:36:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415591091532464128', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:36:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415591352111988736', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:37:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415591357963042816', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:37:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415591557062459392', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:38:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415591565593673728', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:38:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415591883119263744', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:39:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415591889305862144', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:39:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415592029349478400', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:40:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415592597937717248', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:42:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415592603163820032', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:42:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415593284314595328', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:45:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415593289532309504', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:45:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415594089222504448', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:48:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415594094297612288', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:48:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415594567658373120', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:50:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415594571496161280', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:50:21', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415595850775658496', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:55:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415595855951429632', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:55:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415596798168268800', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:59:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415596801662124032', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 16:59:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415597341670375424', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:01:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415597347152330752', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:01:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415597558436200448', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:02:13', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415597564706684928', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:02:15', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415597811512115200', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:03:13', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415597817560301568', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:03:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415598034296766464', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:04:07', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415598040336564224', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:04:08', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415598328569135104', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:05:17', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415598334562795520', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:05:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415598732136677376', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:06:53', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415598738121949184', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:06:54', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415599037431676928', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:08:06', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415599043391782912', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:08:07', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415599615985582080', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:10:24', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415599621970853888', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:10:25', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415599715797434368', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:10:47', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415599982525808640', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:11:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415599988917927936', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:11:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415600494725824512', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:13:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415600501172469760', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:13:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415600760082661376', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:14:56', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415600766147624960', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:14:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415600919306829824', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:15:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415601205136064512', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:16:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415601211695955968', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:16:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415601301982543872', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:17:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415601515581669376', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:17:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415601522036703232', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:17:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415602248355938304', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:20:51', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415602254311849984', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:20:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415603108188258304', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:24:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415603114836230144', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:24:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415604578975481856', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:30:07', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415604585648619520', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:30:09', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415605133521190912', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:32:19', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415605143629463552', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:32:22', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415605356612026368', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:33:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415605362597298176', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:33:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415605500518596608', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:33:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415605722644742144', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:34:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415605729322074112', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:34:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415605845353299968', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:35:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415605850759757824', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:35:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415606679982047232', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:38:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415606686382555136', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 17:38:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415628403855327232', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:04:47', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415630828481806336', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:14:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415631173693997056', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:15:48', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415631180216139776', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:15:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415632044171460608', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:19:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415632050106400768', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:19:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415632301391347712', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:20:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415632307879936000', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:20:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415633395211304960', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:24:37', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415633401217548288', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:24:39', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415633470499061760', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:24:55', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415634364640788480', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:28:28', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415634372807098368', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:28:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415634400959266816', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:28:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415634833459118080', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:30:20', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415634840329388032', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:30:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415635439963865088', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:32:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415635446456647680', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:32:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415636248889917440', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:35:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415636258901721088', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:36:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415636379970306048', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:36:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415636978145165312', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:38:52', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415636984797331456', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:38:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415637568434733056', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:41:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415637571882450944', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:41:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415639637958852608', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:49:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415641015519281152', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:54:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415641021114482688', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:54:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415641308873097216', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:56:04', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415641315651092480', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:56:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415642024471691264', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:58:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415642032088547328', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 19:58:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415643543497605120', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:04:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415643548929228800', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:04:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415644037322375168', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:06:55', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415644043995512832', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:06:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415644668011479040', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:09:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415644674307129344', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:09:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415644719643361280', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:09:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415644972476006400', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:10:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415644978893291520', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:10:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415645180215689216', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:11:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415645186683305984', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:11:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415645605564252160', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:13:08', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415645611557912576', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:13:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415645967377498112', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:14:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415645973379547136', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:14:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415646637182681088', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:17:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415646643188924416', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:17:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415646988296257536', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:18:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415646994315083776', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:18:40', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415647436470222848', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:20:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415647442866536448', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:20:27', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415647601813880832', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:21:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415648481309097984', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:24:34', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415648487889960960', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:24:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415648549089050624', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:24:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415648550007603200', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:24:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415648551320420352', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:24:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415648689015226368', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:25:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415648695138910208', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:25:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415648954418200576', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:26:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415648960814514176', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:26:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415649590215966720', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:28:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415649596733915136', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:29:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415649834408345600', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:29:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415650690650341376', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:33:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415650697168289792', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-15 20:33:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415833640780169216', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '127.0.0.1', NULL, NULL, '0', NULL, '2021-07-16 08:40:20', '登录失败', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415833769478193152', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-16 08:40:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415833775769649152', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-16 08:40:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415834113499201536', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-16 08:42:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415834119559970816', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-16 08:42:14', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415834279291650048', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-16 08:42:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1415834783245664256', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-16 08:44:52', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1415834789474205696', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-16 08:44:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416920731115061248', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '112.23.150.218', NULL, NULL, '1', NULL, '2021-07-19 08:40:02', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1416920737133887488', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '112.23.150.218', NULL, NULL, '1', NULL, '2021-07-19 08:40:04', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416953101331464192', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 10:48:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1416953107505479680', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 10:48:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416953140728561664', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 10:48:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416955805273423872', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 10:59:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1416955813452316672', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 10:59:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416956129497317376', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 11:00:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416956814712373248', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 11:03:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1416956818822791168', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 11:03:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416957231798157312', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 11:05:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1416957239205298176', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 11:05:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416957388124061696', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 11:05:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416962053620367360', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '112.23.150.218', NULL, NULL, '1', NULL, '2021-07-19 11:24:14', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1416962059752439808', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '112.23.150.218', NULL, NULL, '1', NULL, '2021-07-19 11:24:16', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1416962837816803328', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '112.23.150.218', NULL, NULL, '1', NULL, '2021-07-19 11:27:21', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417038594421293056', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:28:23', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417038600855355392', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:28:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417038888228093952', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.89', NULL, NULL, '1', NULL, '2021-07-19 16:29:33', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417038894033010688', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.89', NULL, NULL, '1', NULL, '2021-07-19 16:29:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417038969207521280', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '192.168.5.89', NULL, NULL, '1', NULL, '2021-07-19 16:29:52', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417039137654964224', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:30:32', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417039143422132224', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:30:34', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417039158098001920', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 16:30:37', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417039165010214912', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 16:30:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417039287899127808', '登录', '/login', 'OTHER', 'POST', 'user2', '/login', '192.168.5.89', NULL, NULL, '1', NULL, '2021-07-19 16:31:08', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417039293683073024', '主页', '/index', 'ADD', 'GET', 'user2', '/index', '192.168.5.89', NULL, NULL, '1', NULL, '2021-07-19 16:31:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417039317125038080', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 16:31:15', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417039348754284544', '主页', '/index', 'ADD', 'GET', 'user2', '/index', '192.168.5.89', NULL, NULL, '1', NULL, '2021-07-19 16:31:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417039407818473472', '登录', '/login', 'OTHER', 'POST', 'user4', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:31:37', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417039413820522496', '主页', '/index', 'ADD', 'GET', 'user4', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:31:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417040283090026496', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:35:05', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417040288840417280', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:35:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417040467916226560', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:35:50', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417040806979567616', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.91', NULL, NULL, '1', NULL, '2021-07-19 16:37:10', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417040813946306560', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.91', NULL, NULL, '1', NULL, '2021-07-19 16:37:12', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417040841062481920', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:37:19', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417040847098085376', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:37:20', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417040853532147712', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:37:22', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417040894527275008', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.91', NULL, NULL, '1', NULL, '2021-07-19 16:37:31', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417040900596432896', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.91', NULL, NULL, '1', NULL, '2021-07-19 16:37:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417040983438131200', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:37:52', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417040989234659328', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:37:54', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417040996364976128', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:37:56', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042060111773696', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:42:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417042065891524608', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:42:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042114121826304', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:42:22', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042309547032576', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '0', '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n### The error may exist in file [/Users/weizhihao/Documents/南通职业大学实训/点餐系统/OrderSys/pear-modules/pear-system/target/classes/com/pearadmin/system/mapper/xml/SysUserMapper.xml]\n### The error may involve com.pearadmin.system.mapper.SysUserMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user          ( user_id,                                           username,                                           password,                                           real_name,                                           email,                                           phone,                                           sex,                                           create_time,                                                        status,                                           enable,                                           dept_id )           values( ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                                         ?,                                           ?,                                           ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1', '2021-07-19 16:43:09', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042350818983936', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '0', '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n### The error may exist in file [/Users/weizhihao/Documents/南通职业大学实训/点餐系统/OrderSys/pear-modules/pear-system/target/classes/com/pearadmin/system/mapper/xml/SysUserMapper.xml]\n### The error may involve com.pearadmin.system.mapper.SysUserMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user          ( user_id,                                           username,                                           password,                                           real_name,                                           email,                                           phone,                                           sex,                                           create_time,                                                        status,                                           enable,                                           dept_id )           values( ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                                         ?,                                           ?,                                           ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1', '2021-07-19 16:43:19', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042372172185600', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '0', '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n### The error may exist in file [/Users/weizhihao/Documents/南通职业大学实训/点餐系统/OrderSys/pear-modules/pear-system/target/classes/com/pearadmin/system/mapper/xml/SysUserMapper.xml]\n### The error may involve com.pearadmin.system.mapper.SysUserMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user          ( user_id,                                           username,                                           password,                                           real_name,                                           email,                                           phone,                                           sex,                                           create_time,                                                        status,                                           enable,                                           dept_id )           values( ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                                         ?,                                           ?,                                           ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1', '2021-07-19 16:43:24', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042403579133952', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '0', '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n### The error may exist in file [/Users/weizhihao/Documents/南通职业大学实训/点餐系统/OrderSys/pear-modules/pear-system/target/classes/com/pearadmin/system/mapper/xml/SysUserMapper.xml]\n### The error may involve com.pearadmin.system.mapper.SysUserMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user          ( user_id,                                           username,                                           password,                                           real_name,                                           email,                                           phone,                                           sex,                                           create_time,                                                        status,                                           enable,                                           dept_id )           values( ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                                         ?,                                           ?,                                           ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1', '2021-07-19 16:43:31', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042553944932352', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '0', '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n### The error may exist in file [/Users/weizhihao/Documents/南通职业大学实训/点餐系统/OrderSys/pear-modules/pear-system/target/classes/com/pearadmin/system/mapper/xml/SysUserMapper.xml]\n### The error may involve com.pearadmin.system.mapper.SysUserMapper.insert-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_user          ( user_id,                                           username,                                           password,                                           real_name,                                           email,                                           phone,                                           sex,                                           create_time,                                                        status,                                           enable,                                           dept_id )           values( ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                           ?,                                                         ?,                                           ?,                                           ? )\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1\n; Data truncation: Data too long for column \'phone\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'phone\' at row 1', '2021-07-19 16:44:07', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042682651344896', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:44:38', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042689584529408', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:44:39', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042707976552448', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:44:44', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042846501830656', '修改用户', '/system/user/update', 'EDIT', 'PUT', 'admin', '/system/user/update', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:45:17', '修改用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042852956864512', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:45:18', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417042863711059968', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.91', NULL, NULL, '1', NULL, '2021-07-19 16:45:21', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417042869595668480', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.91', NULL, NULL, '1', NULL, '2021-07-19 16:45:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043002475413504', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:45:54', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043009429569536', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:45:56', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043114975035392', '登录', '/login', 'OTHER', 'POST', 'user3', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:46:21', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417043120712843264', '主页', '/index', 'ADD', 'GET', 'user3', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:46:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043187897204736', '主页', '/index', 'ADD', 'GET', 'user3', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:46:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043214996602880', '新增用户', '/system/user/save', 'ADD', 'POST', 'admin', '/system/user/save', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:46:45', '新增用户', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043221803958272', '查询用户', '/system/user/data', 'QUERY', 'GET', 'admin', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-19 16:46:46', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043318822404096', '主页', '/index', 'ADD', 'GET', 'user3', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:47:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043409532616704', '登录', '/login', 'OTHER', 'POST', 'cl', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:47:31', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417043415345922048', '主页', '/index', 'ADD', 'GET', 'cl', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:47:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043899490238464', '登录', '/login', 'OTHER', 'POST', 'ykl', '/login', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 16:49:28', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417043905278377984', '主页', '/index', 'ADD', 'GET', 'ykl', '/index', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 16:49:29', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417043905488093184', '查询用户', '/system/user/data', 'QUERY', 'GET', 'cl', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:49:29', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417044634235830272', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 16:52:23', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417044784597434368', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 16:52:59', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417044866977759232', '查询用户', '/system/user/data', 'QUERY', 'GET', 'cl', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:53:18', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417044914729910272', '查询用户', '/system/user/data', 'QUERY', 'GET', 'cl', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:53:30', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417044987433975808', '查询用户', '/system/user/data', 'QUERY', 'GET', 'cl', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:53:47', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417045005817610240', '查询用户', '/system/user/data', 'QUERY', 'GET', 'cl', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:53:52', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417045093499535360', '查询用户', '/system/user/data', 'QUERY', 'GET', 'cl', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 16:54:12', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417045778970443776', '登录', '/login', 'OTHER', 'POST', 'WXS', '/login', '192.168.5.106', NULL, NULL, '1', NULL, '2021-07-19 16:56:56', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417045784771166208', '主页', '/index', 'ADD', 'GET', 'WXS', '/index', '192.168.5.106', NULL, NULL, '1', NULL, '2021-07-19 16:56:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417053040866754560', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 17:25:47', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417053046713614336', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 17:25:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417078138227130368', '登录', '/login', 'OTHER', 'POST', 'cl', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 19:05:31', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417078144585695232', '主页', '/index', 'ADD', 'GET', 'cl', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-19 19:05:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417078640218210304', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:07:31', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417078725777817600', 'Remember Me', '/', 'OTHER', 'GET', 'admin', '/', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:07:51', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417078950001115136', '登录', '/login', 'OTHER', 'POST', '未登录用户', '/login', '192.168.5.88', NULL, NULL, '0', NULL, '2021-07-19 19:08:44', '账户密码不正确', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417079007974785024', '登录', '/login', 'OTHER', 'POST', 'ykl', '/login', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:08:58', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417079013981028352', '主页', '/index', 'ADD', 'GET', 'ykl', '/index', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:09:00', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417079109485330432', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:09:23', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417079173775622144', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:09:38', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417079206537330688', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:09:46', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417079369800613888', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:10:25', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417079452357099520', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:10:44', '查询用户', 'page=2&limit=10&realName=ykl&username=', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417079549539123200', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:11:07', '查询用户', 'page=1&limit=10&realName=&username=', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417079640962367488', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:11:29', '查询用户', 'page=2&limit=10&realName=&username=', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417082310989185024', '主页', '/index', 'ADD', 'GET', 'ykl', '/index', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:22:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417082343918665728', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-19 19:22:14', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417276826589331456', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:15:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417276832775929856', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:15:03', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417278135182819328', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:20:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417278141281337344', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:20:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417279023691595776', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:23:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417279029580398592', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:23:47', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417279445810544640', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:25:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417279452118777856', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:25:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417279555877470208', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:25:53', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417279768809701376', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:26:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417279774723670016', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:26:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417279825944510464', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:26:57', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417280373485731840', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:29:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417280379210956800', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 08:29:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417281253824004096', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.103', NULL, NULL, '1', NULL, '2021-07-20 08:32:37', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417281258941054976', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.103', NULL, NULL, '1', NULL, '2021-07-20 08:32:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417289187123527680', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:04:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417289193171714048', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:04:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417289528669896704', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:05:30', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417289534504173568', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:05:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417290819227877376', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:10:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417290825351561216', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:10:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417291177941532672', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:12:03', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417291183700312064', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:12:05', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417291730482364416', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:14:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417291736362778624', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:14:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417292145206755328', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:15:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417292151405936640', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:15:56', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417292213670379520', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:16:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417302759346012160', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:58:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417302765004128256', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:58:06', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417303032277762048', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:59:10', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417303086010990592', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 09:59:23', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417305398792159232', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:08:34', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417305404051816448', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:08:35', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417306673776689152', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:13:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417306678986014720', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:13:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417306687534006272', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:13:41', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417307150006353920', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:15:32', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Android', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417308925392322560', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:22:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417308931096576000', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:22:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417309179890106368', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:23:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417309506529918976', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:24:53', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417309512183840768', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:24:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417317131489378304', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:55:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417317137290100736', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 10:55:13', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417320008530264064', '登录', '/login', 'OTHER', 'POST', 'admin', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 11:06:37', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417320013731201024', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 11:06:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417320990379081728', '主页', '/index', 'ADD', 'GET', 'admin', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 11:10:31', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417332603932901376', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 11:56:40', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417332609645543424', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 11:56:42', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417333112727142400', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 11:58:42', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417333118469144576', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 11:58:43', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417334512357998592', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:04:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417334518032891904', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:04:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417335515476131840', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:08:14', '登录成功', NULL, '谷歌浏览器', 'Android', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417335521163608064', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:08:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Android', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417335816203534336', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:09:26', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417335822343995392', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:09:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417336093816127488', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:10:32', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417336098140454912', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:10:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417337461620604928', 'Remember Me', '/dishes/order/createOrder', 'OTHER', 'POST', 'user1', '/dishes/order/createOrder', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:15:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417337542822330368', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:16:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417337870384889856', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:17:36', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417337874973458432', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:17:37', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417338483940261888', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:20:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417338488474304512', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:20:03', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417338686877466624', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:20:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417339376479764480', 'Remember Me', '/dishes/order/createOrder', 'OTHER', 'POST', 'user1', '/dishes/order/createOrder', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:23:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417339400416657408', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:23:41', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417339444540735488', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:23:51', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417339854118715392', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:25:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417339859684556800', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:25:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417339926101360640', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:25:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417340329442410496', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:27:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417340334643347456', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:27:23', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417340394823221248', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:27:38', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417340493108346880', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:28:01', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417340498690965504', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:28:02', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417340533788901376', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:28:11', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417342821349720064', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:37:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417342825661464576', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:37:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417342856200192000', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:37:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417342936181374976', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:37:44', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417342971929427968', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:37:52', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417342985414115328', '查询用户', '/system/user/data', 'QUERY', 'GET', 'user1', '/system/user/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:37:55', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417343224141316096', 'Remember Me', '/index', 'OTHER', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:38:52', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417343235998613504', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:38:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417343641625559040', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:40:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417343739629666304', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:40:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417344543199592448', 'Remember Me', '/dishes/order/main', 'OTHER', 'GET', 'user1', '/dishes/order/main', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:44:07', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417344553014263808', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:44:09', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417344722833244160', 'Remember Me', '/console', 'OTHER', 'GET', 'user1', '/console', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:44:50', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417344744823980032', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:44:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417345111397761024', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:46:22', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417346577378312192', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:52:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417347580244787200', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:56:11', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417347981186695168', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:57:46', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417348234862395392', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 12:58:47', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417349050436419584', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 13:02:01', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417366394651017216', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:10:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417368976593256448', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:21:12', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417369216557776896', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:22:09', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417371554030813184', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:31:27', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417371833295962112', 'Remember Me', '/', 'OTHER', 'GET', 'user1', '/', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:32:33', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417371833295962113', 'Remember Me', '/dishes/customerBill/data', 'OTHER', 'GET', 'user1', '/dishes/customerBill/data', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:32:33', '登录成功', 'page=1&limit=10', '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417372317155065856', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:34:29', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417372322527969280', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:34:30', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417376858747437056', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:52:31', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417376864397164544', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:52:33', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417378564721868800', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:59:18', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417378570388373504', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 14:59:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417379301182930944', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:02:14', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417379306631331840', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:02:15', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417380223447465984', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:05:54', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417380229072027648', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:05:55', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417380605829578752', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:07:25', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417380611403808768', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:07:26', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417382131235028992', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:13:28', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417382404531683328', '登录', '/login', 'OTHER', 'POST', 'cl', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-20 15:14:34', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417382409665511424', '主页', '/index', 'ADD', 'GET', 'cl', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-20 15:14:35', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417383200593805312', '查询用户', '/system/user/data', 'QUERY', 'GET', 'cl', '/system/user/data', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-20 15:17:43', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417384803384164352', 'Remember Me', '/', 'OTHER', 'GET', 'ykl', '/', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:24:06', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417385056506216448', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:25:06', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417385062764118016', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:25:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417385071811231744', 'Remember Me', '/', 'OTHER', 'GET', 'ykl', '/', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:25:10', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417385236257308672', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-20 15:25:49', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417385241399525376', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-20 15:25:50', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417385429161738240', '登录', '/login', 'OTHER', 'POST', 'ykl', '/login', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:26:35', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417385434413006848', '主页', '/index', 'ADD', 'GET', 'ykl', '/index', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:26:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417385497247875072', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:26:51', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417387369526460416', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-20 15:34:17', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417387374857420800', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '192.168.5.74', NULL, NULL, '1', NULL, '2021-07-20 15:34:19', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417387610216595456', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:35:15', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417387615555944448', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:35:16', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417387649085210624', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 15:35:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417392509943808000', '登录', '/login', 'OTHER', 'POST', 'ykl', '/login', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:54:43', '登录成功', NULL, '谷歌浏览器', 'Windows', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417392515065053184', '主页', '/index', 'ADD', 'GET', 'ykl', '/index', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:54:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417392582735953920', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:55:00', '查询用户', 'page=1&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417393281305673728', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 15:57:47', '查询用户', 'page=2&limit=10', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417394367500386304', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 16:02:06', '查询用户', 'page=2&limit=10&realName=&username=&deptId=3', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417394371782770688', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 16:02:07', '查询用户', 'page=1&limit=10&realName=&username=&deptId=8', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417394376270675968', '查询用户', '/system/user/data', 'QUERY', 'GET', 'ykl', '/system/user/data', '192.168.5.88', NULL, NULL, '1', NULL, '2021-07-20 16:02:08', '查询用户', 'page=1&limit=10&realName=&username=&deptId=1', '谷歌浏览器', 'Windows', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417401915372732416', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 16:32:05', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417401921018265600', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 16:32:07', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417404747891081216', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 16:43:21', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417404753549197312', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 16:43:22', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417406491379367936', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 16:50:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417406496550944768', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 16:50:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417410637763444736', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:06:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417410643119570944', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:06:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417413316988370944', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:17:24', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417413322344497152', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:17:25', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417414221745881088', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:20:59', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417414227118784512', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:21:01', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417414354990530560', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:21:31', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417414360145330176', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:21:32', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417416051968180224', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:28:16', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417416057403998208', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:28:17', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417418915507601408', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:39:38', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417418915625041920', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:39:39', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417418942279843840', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:39:45', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417418947459809280', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:39:46', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417419750899712000', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:42:58', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417419756486524928', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:42:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417420443471577088', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:45:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417420448789954560', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:45:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417420776381874176', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 17:47:02', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417434756085186560', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 18:42:35', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417434761378398208', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-20 18:42:36', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1417751686952255488', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-21 15:41:57', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1417751692543262720', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-21 15:41:59', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419455858214961152', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 08:33:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1419455864468668416', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 08:33:45', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419458185269346304', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 08:42:58', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419466255886188544', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:15:02', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1419466261724659712', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:15:04', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419466539727323136', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:16:10', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419466597386420224', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:16:24', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419466659554394112', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:16:39', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419469696809304064', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:28:43', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1419469702211567616', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:28:44', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419472107909152768', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:38:18', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419472737700675584', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:40:48', '登录成功', NULL, '谷歌浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1419472742863863808', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-26 09:40:49', '返回 Index 主页视图', NULL, '谷歌浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419854301559259136', '登录', '/login', 'OTHER', 'POST', 'user1', '/login', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-27 10:57:00', '登录成功', NULL, '你用啥浏览器', 'Mac', 'LOGIN');
INSERT INTO `sys_logging` VALUES ('1419854307418701824', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-27 10:57:01', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419854435479191552', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-27 10:57:32', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419855240668119040', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-27 11:00:44', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419855551688343552', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-27 11:01:58', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
INSERT INTO `sys_logging` VALUES ('1419855702582624256', '主页', '/index', 'ADD', 'GET', 'user1', '/index', '127.0.0.1', NULL, NULL, '1', NULL, '2021-07-27 11:02:34', '返回 Index 主页视图', NULL, '你用啥浏览器', 'Mac', 'OPERATE');
COMMIT;

-- ----------------------------
-- Table structure for sys_mail
-- ----------------------------
DROP TABLE IF EXISTS `sys_mail`;
CREATE TABLE `sys_mail` (
  `mail_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮件id(主键)',
  `receiver` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '收件人邮箱',
  `subject` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮件主体',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮件正文',
  `create_by` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发送人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`mail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_mail
-- ----------------------------
BEGIN;
INSERT INTO `sys_mail` VALUES ('1349598576807772160', '1218600762@qq.com', 'macbook pro', '13.3寸\nm1处理器\n16G内存', 'admin', '2021-01-14 06:06:23');
INSERT INTO `sys_mail` VALUES ('1357215518368464896', 'BoscoKuo@aliyun.com', '湖人总冠军', '湖人总冠军', 'admin', '2021-02-04 06:33:36');
INSERT INTO `sys_mail` VALUES ('1357219037586653184', 'BoscoKuo@aliyun.com', 'LebronJames', 'Lakers', 'admin', '2021-02-04 06:47:35');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `sender` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发送人',
  `accept` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接收者',
  `type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型',
  `create_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES ('1370769290961092608', '公告测试', '公告测试', '1309861917694623744', NULL, 'public', NULL, '2021-03-14 00:10:41', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370769348204953600', '私信测试', '私信测试', '1309861917694623744', '1310409555649232897', 'private', NULL, '2021-03-14 00:10:55', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370771980034244608', '公告测试', '公告测试', '1309861917694623744', NULL, 'public', NULL, '2021-03-14 00:21:22', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370772014771470336', '公告测试', '公告测试', '1309861917694623744', NULL, 'public', NULL, '2021-03-14 00:21:31', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370772050439831552', '公告测试', '公告测试', '1309861917694623744', NULL, 'public', NULL, '2021-03-14 00:21:39', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370772089446858752', '私信测试', '私信测试', '1309861917694623744', '1310409555649232897', 'private', NULL, '2021-03-14 00:21:48', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370772143918284800', '私信测试', '私信测试', '1309861917694623744', '1310409555649232897', 'private', NULL, '2021-03-14 00:22:01', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370772363838226432', '私信测试', '私信测试', '1309861917694623744', '1349021166525743105', 'private', NULL, '2021-03-14 00:22:54', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370772466212798464', '私信测试', '私信测试', '1309861917694623744', '1349021166525743105', 'private', NULL, '2021-03-14 00:23:18', NULL, NULL, NULL);
INSERT INTO `sys_notice` VALUES ('1370971086266564608', '私信测试', '私信测试', '1309861917694623744', '1309861917694623744', 'private', NULL, '2021-03-14 13:32:33', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_power`;
CREATE TABLE `sys_power` (
  `power_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限编号',
  `power_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限名称',
  `power_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限类型',
  `power_code` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `power_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限路径',
  `open_type` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '打开方式',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '父类编号',
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否开启',
  PRIMARY KEY (`power_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_power
-- ----------------------------
BEGIN;
INSERT INTO `sys_power` VALUES ('1', '系统管理', '0', '', '', NULL, '0', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1284020948269268992', '用户列表', '2', 'sys:user:data', '', '', '2', 'layui-icon-username', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1284022967767924736', '用户保存', '2', 'sys:user:add', '', '', '2', 'layui-icon-username', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1302180351979814912', '布局构建', '1', 'generator:from:main', 'component/code/index.html', '_iframe', '442417411065516032', 'layui-icon-senior', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1304387665067507712', '数据字典', '1', 'sys:dictType:main', '/system/dictType/main', '_iframe', '1', 'layui-icon layui-icon layui-icon layui-icon layui-icon-flag', 4, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1304793451996381184', '文件管理', '1', 'sys:file:main', '/system/file/main', '_iframe', '1', 'layui-icon layui-icon layui-icon-read', 5, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1305870685385523200', '百度一下', '1', '', 'http://www.baidu.com', '0', '474356044148117504', 'layui-icon-search', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_power` VALUES ('1305875436139446272', '百度一下', '1', 'http://www.baidu.com', 'http://www.baidu.com', '0', '451002662209589248', 'layui-icon-search', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1307299332784914432', '系统配置', '1', 'sys:config:main', '/system/config/main', '0', '1', 'layui-icon layui-icon layui-icon-note', 6, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1307562196556840960', '工作流程', '0', '', '', '0', '0', 'layui-icon layui-icon-chat', 5, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1307562519451140096', '模型管理', '1', '/process/model/main', '/process/model/main', '0', '1307562196556840960', 'layui-icon-circle', 0, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1308571483794046976', '流程定义', '1', 'process:defined:main', '/process/defined/main', '0', '1307562196556840960', 'layui-icon-chart-screen', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310206853057085440', '用户修改', '2', 'sys:user:edit', '', '', '2', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310208636370288640', '用户删除', '2', 'sys:user:remove', '', '', '2', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310209696916832256', '角色新增', '2', 'sys:role:add', '', '', '3', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310209900478988288', '角色删除', '2', 'sys:role:remove', '', '', '3', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310210054728712192', '角色修改', '2', 'sys:role:edit', '', '', '3', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310211965188046848', '角色授权', '2', 'sys:role:power', '', '', '3', 'layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310226416867999744', '权限列表', '2', 'sys:power:data', '', '', '4', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310226976593674240', '权限新增', '2', 'sys:power:add', '', '', '4', 'layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310227130998587392', '权限修改', '2', 'sys:power:edit', '', '', '4', 'layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310227300935008256', '权限删除', '2', 'sys:power:remove', '', '', '4', 'layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310232350285627392', '操作日志', '2', 'sys:log:operateLog', '', '', '450300705362808832', 'layui-icon layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310232462562951168', '登录日志', '2', 'sys:log:loginLog', '', '', '450300705362808832', 'layui-icon layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310238229588344832', '配置列表', '2', 'sys:config:data', '', '', '1307299332784914432', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310238417082122240', '配置新增', '2', 'sys:config:add', '', '', '1307299332784914432', 'layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310238574355939328', '配置修改', '2', 'sys:config:edit', '', '', '1307299332784914432', 'layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310238700705153024', '配置删除', '2', 'sys:config:remove', '', '', '1307299332784914432', 'layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310243862937075712', '文件列表', '2', 'sys:file:data', '', '', '1304793451996381184', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310244103824343040', '文件新增', '2', 'sys:file:add', '', '', '1304793451996381184', 'layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310244248884346880', '文件删除', '2', 'sys:file:remove', '', '', '1304793451996381184', 'layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310390699333517312', '任务列表', '2', 'sch:job:data', '', '', '442650770626711552', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310390994826428416', '任务新增', '2', 'sch:job:add', '', '', '442650770626711552', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310391095670079488', '任务修改', '2', 'sch:job:edit', '', '', '442650770626711552', 'layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310391707069579264', '任务删除', '2', 'sch:job:remove', '', '', '442650770626711552', 'layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310395250908332032', '日志列表', '2', 'sch:log:data', '', '', '442651158935375872', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310397832091402240', '任务恢复', '2', 'sch:job:resume', '', '', '442650770626711552', 'layui-icon-vercode', NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310398020692475904', '任务停止', '2', 'sch:job:pause', '', '', '442650770626711552', 'layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310398158974484480', '任务运行', '2', 'sch:job:run', '', '', '442650770626711552', 'layui-icon-vercode', 4, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310402491631796224', '数据类型列表', '2', 'sys:dictType:data', '', '', '1304387665067507712', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310402688881524736', '数据类型新增', '2', 'sys:dictType:add', '', '', '1304387665067507712', 'layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310402817776680960', '数据类型修改', '2', 'sys:dictType:edit', '', '', '1304387665067507712', 'layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310403004406431744', '数据类型删除', '2', 'sys:dictType:remove', '', '', '1304387665067507712', 'layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310404584291696640', '数据字典视图', '2', 'sys:dictData:main', '', '', '1304387665067507712', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310404705934901248', '数据字典列表', '2', 'sys:dictData:data', '', '', '1304387665067507712', 'layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310404831407505408', '数据字典新增', '2', 'sys:dictData:add', '', '', '1304387665067507712', 'layui-icon-vercode', 5, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310404999599095808', '数据字典删除', '2', 'sys:dictData:remove', '', '', '1304387665067507712', 'layui-icon-vercode', 6, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1310405161587310592', '数据字典修改', '2', 'sys:dictData:edit', '', '', '1304387665067507712', 'layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1313142510486290432', '公告列表', '1', 'sys:notice:data', '/system/notice/data', '0', '1313142171393589248', 'layui-icon-notice', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1313482983558086656', '公告新增', '2', 'sys:notice:add', '', '', '1313142171393589248', 'layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1313483090852577280', '公告修改', '2', 'sys:notice:edit', '', '', '1313142171393589248', 'layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1313483189850734592', '公告删除', '2', 'sys:notice:remove', '', '', '1313142171393589248', 'layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1315584471046553600', '部门管理', '1', 'sys:dept:main', '/system/dept/main', '_iframe', '1', 'layui-icon layui-icon layui-icon layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1316558444790022144', '部门新增', '2', 'sys:dept:add', '', '', '1315584471046553600', 'layui-icon layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1316558556102656000', '部门修改', '2', 'sys:dept:edit', '', '', '1315584471046553600', 'layui-icon layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1316558685442408448', '部门删除', '2', 'sys:dept:remove', '', '', '1315584471046553600', 'layui-icon layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1317555660455411712', '部门列表', '2', 'sys:dept:data', '', '', '1315584471046553600', 'layui-icon layui-icon layui-icon layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1318229908526202880', '模型新增', '2', 'pro:model:add', '', '', '1307562519451140096', 'layui-icon layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1318230013262168064', '模型修改', '2', 'pro:model:edit', '', '', '1307562519451140096', 'layui-icon layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1318230265385975808', '模型删除', '2', 'pro:model:remove', '', '', '1307562519451140096', 'layui-icon layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1320969572051845120', '111111', '2', '', '', '', '1284020948269268992', 'layui-icon-login-qq', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_power` VALUES ('1322085079861690368', '用户管理', '1', 'sys:user:main', '/system/user/main', '_iframe', '1412367108544659456', 'layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon-rate', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1322085270392143872', '用户列表', '2', 'sys:user:data', '', '', '1322085079861690368', 'layui-icon layui-icon layui-icon layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1322085393021009920', '用户新增', '2', 'sys:user:add', '', '', '1322085079861690368', 'layui-icon layui-icon-vercode', NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1322085497798918144', '用户修改', '2', 'sys:user:edit', '', '', '1322085079861690368', 'layui-icon layui-icon layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1322085659766161408', '用户删除', '2', 'sys:user:remove', '', '', '1322085079861690368', 'layui-icon layui-icon-rate', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1329349076189184000', '', '1', '', '', '', '451002662209589248', 'layui-icon', NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1330865171429588992', '在线用户', '1', 'sys:online:main', '/system/online/main', '_iframe', '694203021537574912', 'layui-icon layui-icon layui-icon-username', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1348562759603716096', '在线列表', '1', 'sys:online:data', '/system/online/data', '_iframe', '1330865171429588992', 'layui-icon layui-icon-username', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1349016358033031168', '环境监控', '1', 'sys:monitor:main', '/system/monitor/main', '_iframe', '694203021537574912', 'layui-icon layui-icon-vercode', 9, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1349279791521464320', '电子邮件', '1', 'sys:mail:main', '/system/mail/main', '_iframe', '1', 'layui-icon layui-icon layui-icon layui-icon-list', 7, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1349636574442160128', '邮件发送', '2', 'sys:mail:save', '', '', '1349279791521464320', 'layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon-vercode', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1349636919478190080', '邮件删除', '2', 'sys:mail:remove', '', '', '1349279791521464320', 'layui-icon layui-icon layui-icon layui-icon layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1349637786285637632', '邮件列表', '2', 'sys:mail:data', '', '', '1349279791521464320', 'layui-icon layui-icon layui-icon-vercode', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1349638479767666688', '邮件新增', '2', 'sys:mail:add', '', '', '1349279791521464320', 'layui-icon layui-icon layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1355962888132493312', '系统设置', '1', 'sys:setup:main', '/system/setup/main', '_iframe', '1', 'layui-icon layui-icon layui-icon-set', 11, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1370412169610395648', '站内消息', '1', 'system:notice:main', '/system/notice/main', '_iframe', '1', 'layui-icon layui-icon layui-icon layui-icon-set-fill', 8, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('1370412169610395649', '消息列表', '2', 'system:notice:data', '', NULL, '1370412169610395648', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1370412169610395650', '消息新增', '2', 'system:notice:add', '', NULL, '1370412169610395648', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1370412169610395651', '消息修改', '2', 'system:notice:edit', '', NULL, '1370412169610395648', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1370412169610395652', '消息删除', '2', 'system:notice:remove', '', NULL, '1370412169610395648', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1370974716822552576', '修改设置', '2', 'sys:setup:add', '', '', '1355962888132493312', 'layui-icon layui-icon-vercode', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411163720947597312', '菜品详情', '1', 'dishes:food:main', '/dishes/food/main', '_iframe', '1412367108544659456', 'layui-icon layui-icon layui-icon layui-icon layui-icon-read', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411163720947597313', '菜品详情列表', '2', 'dishes:food:data', '', NULL, '1411163720947597312', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411163720947597314', '菜品详情新增', '2', 'dishes:food:add', '', NULL, '1411163720947597312', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411163720947597315', '菜品详情修改', '2', 'dishes:food:edit', '', NULL, '1411163720947597312', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411163720947597316', '菜品详情删除', '2', 'dishes:food:remove', '', NULL, '1411163720947597312', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411639239606534144', '后厨', '0', '', '', '', '0', 'layui-icon layui-icon-component', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411643459269296128', '餐桌结账', '1', 'dishes:tableBill:main', '/dishes/tableBill/main', '_iframe', '1412367934046601216', 'layui-icon layui-icon layui-icon-rmb', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411643459269296129', '餐桌结账列表', '2', 'dishes:tableBill:data', '', NULL, '1411643459269296128', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411643459269296130', '餐桌结账新增', '2', 'dishes:tableBill:add', '', NULL, '1411643459269296128', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411643459269296131', '餐桌结账修改', '2', 'dishes:tableBill:edit', '', NULL, '1411643459269296128', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411643459269296132', '餐桌结账删除', '2', 'dishes:tableBill:remove', '', NULL, '1411643459269296128', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411883806805196800', '备菜界面', '1', 'dishes:prepareOrder:main', '/dishes/prepareOrder/main', '_iframe', '1411639239606534144', 'layui-icon layui-icon layui-icon layui-icon layui-icon-fire', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411883806805196801', '后厨备餐表列表', '2', 'dishes:prepareOrder:data', '', NULL, '1411883806805196800', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411883806805196802', '后厨备餐表新增', '2', 'dishes:prepareOrder:add', '', NULL, '1411883806805196800', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411883806805196803', '后厨备餐表修改', '2', 'dishes:prepareOrder:edit', '', NULL, '1411883806805196800', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1411883806805196804', '后厨备餐表删除', '2', 'dishes:prepareOrder:remove', '', NULL, '1411883806805196800', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412241771278106624', '顾客结账界面', '1', 'dishes:customerBill:main', '/dishes/customerBill/main', '_iframe', '1412366934724313088', 'layui-icon layui-icon layui-icon-rate-half', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412241771278106625', '顾客买单列表', '2', 'dishes:customerBill:data', '', NULL, '1412241771278106624', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412241771278106626', '顾客买单新增', '2', 'dishes:customerBill:add', '', NULL, '1412241771278106624', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412241771278106627', '顾客买单修改', '2', 'dishes:customerBill:edit', '', NULL, '1412241771278106624', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412241771278106628', '顾客买单删除', '2', 'dishes:customerBill:remove', '', NULL, '1412241771278106624', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412366934724313088', '运营功能', '0', '', '', '', '0', 'layui-icon layui-icon-template', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412367108544659456', '餐厅管理', '0', '', '', '', '0', 'layui-icon layui-icon-home', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412367934046601216', '服务员点餐功能', '0', '', '', '', '0', 'layui-icon layui-icon-survey', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412737637101338624', '服务点餐界面', '1', 'dishes:order:main', '/dishes/order/main', '_iframe', '1412367934046601216', 'layui-icon layui-icon layui-icon-edit', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412737637101338625', '点餐订单列表', '2', 'dishes:order:data', '', NULL, '1412737637101338624', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412737637101338626', '点餐订单新增', '2', 'dishes:order:add', '', NULL, '1412737637101338624', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412737637101338627', '点餐订单修改', '2', 'dishes:order:edit', '', NULL, '1412737637101338624', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('1412737637101338628', '点餐订单删除', '2', 'dishes:order:remove', '', NULL, '1412737637101338624', 'layui-icon layui-icon-set-fill', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('2', '用户管理', '2', '', '', '_iframe', '1320969572051845120', 'layui-icon layui-icon layui-icon-username', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('3', '角色管理', '1', 'sys:role:main', '/system/role/main', '_iframe', '1412367108544659456', 'layui-icon layui-icon layui-icon layui-icon-user', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('4', '权限管理', '1', 'sys:power:main', '/system/power/main', '_iframe', '1', 'layui-icon layui-icon-vercode', 2, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('442359447487123456', '角色列表', '2', 'sys:role:data', '', '', '3', 'layui-icon layui-icon-rate', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('442417411065516032', '开发工具', '0', '', '', '', '0', 'layui-icon layui-icon layui-icon-senior', 4, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('442418188639145984', '代码生成', '1', 'exp:template:main', '/generate/main', '_iframe', '442417411065516032', 'layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon-template-1', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('442650770626711552', '定时任务', '1', 'sch:job:main', '/schedule/job/main', '_iframe', '694203021537574912', 'layui-icon layui-icon layui-icon layui-icon  layui-icon-chat', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('442651158935375872', '任务日志', '1', 'sch:log:main', '/schedule/log/main', '_iframe', '694203021537574912', 'layui-icon layui-icon layui-icon  layui-icon-file', 1, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('450300705362808832', '行为日志', '1', 'sys:log:main', '/system/log/main', '_iframe', '694203021537574912', 'layui-icon layui-icon layui-icon layui-icon  layui-icon-chart', 7, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('451002662209589248', '工作空间', '1', '', '', '', '451002662209589248', 'layui-icon layui-icon layui-icon-home', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('451003242072117248', '项目总览', '1', 'process:model:main', '/console', '_iframe', '451002662209589248', 'layui-icon  layui-icon-component', 0, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('474356363552755712', '项目介绍', '1', 'home', '/console', '_iframe', '474356044148117504', 'layui-icon layui-icon-home', 1, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `sys_power` VALUES ('694203021537574912', '系统监控', '0', '', '', '', '0', 'layui-icon  layui-icon-console', 3, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_power` VALUES ('694203311615639552', '接口文档', '1', 'sys:doc:main', '/system/doc/main', '_iframe', '442417411065516032', 'layui-icon layui-icon layui-icon layui-icon  layui-icon-chart', 9, NULL, NULL, NULL, NULL, NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编号',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色标识',
  `enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详情',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1309851245195821056', '超级管理员', 'admin', '0', NULL, NULL, NULL, NULL, NULL, '超级管理员', 1);
INSERT INTO `sys_role` VALUES ('1313761100243664896', '普通管理员', 'manager', '0', NULL, NULL, NULL, NULL, NULL, '普通管理员', 2);
INSERT INTO `sys_role` VALUES ('1356112133691015168', '应急管理员', 'users', '0', NULL, NULL, NULL, NULL, NULL, '应急管理员', 2);
INSERT INTO `sys_role` VALUES ('1412350312731115520', '厨师', 'cook', '0', NULL, NULL, NULL, NULL, NULL, '厨师', 3);
INSERT INTO `sys_role` VALUES ('1412350653342154752', '点餐服务员', 'orderingStaff', '0', NULL, NULL, NULL, NULL, NULL, '点餐服务员', 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_power
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_power`;
CREATE TABLE `sys_role_power` (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `power_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_power
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_power` VALUES ('1284022485632679936', '3', '474356044148117504', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679937', '3', '474356363552755712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679938', '3', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679939', '3', '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679940', '3', '442359447487123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679941', '3', '4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679942', '3', '442722702474743808', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679943', '3', '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679944', '3', '1284020948269268992', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679945', '3', '442417411065516032', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679946', '3', '442418188639145984', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679947', '3', '694203021537574912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679948', '3', '450300705362808832', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679949', '3', '442520236248403968', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679950', '3', '694203311615639552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679951', '3', '442650387514789888', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679952', '3', '442650770626711552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679953', '3', '442651158935375872', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679954', '3', '451002662209589248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1284022485632679955', '3', '451003242072117248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650364506112', '2', '474356044148117504', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700416', '2', '474356363552755712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700417', '2', '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700418', '2', '1284020948269268992', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700419', '2', '450300705362808832', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700420', '2', '442417411065516032', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700421', '2', '442418188639145984', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700422', '2', '694203021537574912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700423', '2', '442520236248403968', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700424', '2', '694203311615639552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700425', '2', '442650387514789888', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700426', '2', '442650770626711552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700427', '2', '442651158935375872', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700428', '2', '451002662209589248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1305379650368700429', '2', '451003242072117248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380352', '1', '451002662209589248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380353', '1', '451003242072117248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380354', '1', '1305875436139446272', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380355', '1', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380356', '1', '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380357', '1', '1284020948269268992', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380358', '1', '1284022967767924736', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380359', '1', '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380360', '1', '442359447487123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380361', '1', '4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380362', '1', '1304387665067507712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380363', '1', '450300705362808832', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380364', '1', '1304793451996381184', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380365', '1', '1307299332784914432', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380366', '1', '442650387514789888', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380367', '1', '442650770626711552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380368', '1', '442651158935375872', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380369', '1', '694203021537574912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380370', '1', '442520236248403968', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380371', '1', '694203311615639552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380372', '1', '442417411065516032', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380373', '1', '442418188639145984', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380374', '1', '1302180351979814912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380375', '1', '1307562196556840960', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380376', '1', '1307562519451140096', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1308571532737380377', '1', '1308571483794046976', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897792', '1310215420371795968', '451002662209589248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897793', '1310215420371795968', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897794', '1310215420371795968', '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897795', '1310215420371795968', '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897796', '1310215420371795968', '4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897797', '1310215420371795968', '1304387665067507712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897798', '1310215420371795968', '450300705362808832', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897799', '1310215420371795968', '1304793451996381184', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897800', '1310215420371795968', '1307299332784914432', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897801', '1310215420371795968', '1313142171393589248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897802', '1310215420371795968', '1313142510486290432', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897803', '1310215420371795968', '442650387514789888', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897804', '1310215420371795968', '694203021537574912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897805', '1310215420371795968', '442417411065516032', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1313147486356897806', '1310215420371795968', '1307562196556840960', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1320969221462556672', '1320969145759563776', '451002662209589248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1320969221462556673', '1320969145759563776', '451003242072117248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1320969221462556674', '1320969145759563776', '1305875436139446272', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778112', '1309851245195821056', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778113', '1309851245195821056', '1322085079861690368', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778114', '1309851245195821056', '1322085393021009920', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778115', '1309851245195821056', '1322085270392143872', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778116', '1309851245195821056', '1322085497798918144', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778117', '1309851245195821056', '1322085659766161408', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778118', '1309851245195821056', '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778119', '1309851245195821056', '1310209696916832256', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778120', '1309851245195821056', '1310209900478988288', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778121', '1309851245195821056', '1310210054728712192', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778122', '1309851245195821056', '442359447487123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778123', '1309851245195821056', '1310211965188046848', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778124', '1309851245195821056', '4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778125', '1309851245195821056', '1310226416867999744', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778126', '1309851245195821056', '1310226976593674240', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778127', '1309851245195821056', '1310227130998587392', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778128', '1309851245195821056', '1310227300935008256', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778129', '1309851245195821056', '1315584471046553600', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778130', '1309851245195821056', '1316558444790022144', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778131', '1309851245195821056', '1316558556102656000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778132', '1309851245195821056', '1317555660455411712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778133', '1309851245195821056', '1316558685442408448', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778134', '1309851245195821056', '1304387665067507712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778135', '1309851245195821056', '1310405161587310592', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778136', '1309851245195821056', '1310402491631796224', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778137', '1309851245195821056', '1310404584291696640', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778138', '1309851245195821056', '1310404705934901248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778139', '1309851245195821056', '1310402688881524736', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778140', '1309851245195821056', '1310402817776680960', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778141', '1309851245195821056', '1310403004406431744', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778142', '1309851245195821056', '1310404831407505408', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778143', '1309851245195821056', '1310404999599095808', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778144', '1309851245195821056', '1304793451996381184', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778145', '1309851245195821056', '1310243862937075712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778146', '1309851245195821056', '1310244103824343040', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778147', '1309851245195821056', '1310244248884346880', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778148', '1309851245195821056', '1307299332784914432', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778149', '1309851245195821056', '1310238229588344832', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778150', '1309851245195821056', '1310238417082122240', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778151', '1309851245195821056', '1310238574355939328', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778152', '1309851245195821056', '1310238700705153024', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778153', '1309851245195821056', '1349279791521464320', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778154', '1309851245195821056', '1349637786285637632', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778155', '1309851245195821056', '1349638479767666688', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778156', '1309851245195821056', '1349636919478190080', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778157', '1309851245195821056', '1349636574442160128', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778158', '1309851245195821056', '1355962888132493312', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778159', '1309851245195821056', '694203021537574912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778160', '1309851245195821056', '1330865171429588992', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778161', '1309851245195821056', '1348562759603716096', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778162', '1309851245195821056', '442650770626711552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778163', '1309851245195821056', '1310397832091402240', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778164', '1309851245195821056', '1310390699333517312', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778165', '1309851245195821056', '1310390994826428416', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778166', '1309851245195821056', '1310391095670079488', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778167', '1309851245195821056', '1310391707069579264', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778168', '1309851245195821056', '1310398020692475904', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778169', '1309851245195821056', '1310398158974484480', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778170', '1309851245195821056', '442651158935375872', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778171', '1309851245195821056', '1310395250908332032', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778172', '1309851245195821056', '450300705362808832', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778173', '1309851245195821056', '1310232350285627392', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778174', '1309851245195821056', '1310232462562951168', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778175', '1309851245195821056', '1349016358033031168', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778176', '1309851245195821056', '442417411065516032', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778177', '1309851245195821056', '442418188639145984', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778178', '1309851245195821056', '1302180351979814912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778179', '1309851245195821056', '694203311615639552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778180', '1309851245195821056', '1307562196556840960', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778181', '1309851245195821056', '1307562519451140096', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778182', '1309851245195821056', '1318229908526202880', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778183', '1309851245195821056', '1318230013262168064', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778184', '1309851245195821056', '1318230265385975808', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1355962953458778185', '1309851245195821056', '1308571483794046976', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879936', '1313761100243664896', '1411639239606534144', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879937', '1313761100243664896', '1411883806805196800', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879938', '1313761100243664896', '1411883806805196801', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879939', '1313761100243664896', '1411883806805196802', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879940', '1313761100243664896', '1411883806805196803', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879941', '1313761100243664896', '1411883806805196804', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879942', '1313761100243664896', '1412366934724313088', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879943', '1313761100243664896', '1412241771278106624', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879944', '1313761100243664896', '1412241771278106625', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879945', '1313761100243664896', '1412241771278106626', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879946', '1313761100243664896', '1412241771278106627', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879947', '1313761100243664896', '1412241771278106628', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879948', '1313761100243664896', '1412367108544659456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879949', '1313761100243664896', '1411163720947597312', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879950', '1313761100243664896', '1411163720947597313', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879951', '1313761100243664896', '1411163720947597314', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879952', '1313761100243664896', '1411163720947597315', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879953', '1313761100243664896', '1411163720947597316', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879954', '1313761100243664896', '1322085079861690368', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879955', '1313761100243664896', '1322085393021009920', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879956', '1313761100243664896', '1322085270392143872', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879957', '1313761100243664896', '1322085497798918144', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879958', '1313761100243664896', '1322085659766161408', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879959', '1313761100243664896', '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879960', '1313761100243664896', '1310209696916832256', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879961', '1313761100243664896', '1310209900478988288', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879962', '1313761100243664896', '1310210054728712192', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879963', '1313761100243664896', '1310211965188046848', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879964', '1313761100243664896', '442359447487123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879965', '1313761100243664896', '1412367934046601216', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879966', '1313761100243664896', '1412737637101338624', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879967', '1313761100243664896', '1412737637101338625', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879968', '1313761100243664896', '1412737637101338626', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879969', '1313761100243664896', '1412737637101338627', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879970', '1313761100243664896', '1412737637101338628', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879971', '1313761100243664896', '1411643459269296128', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879972', '1313761100243664896', '1411643459269296129', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879973', '1313761100243664896', '1411643459269296130', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879974', '1313761100243664896', '1411643459269296131', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879975', '1313761100243664896', '1411643459269296132', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879976', '1313761100243664896', '1310226416867999744', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879977', '1313761100243664896', '1310226976593674240', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879978', '1313761100243664896', '1310227130998587392', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879979', '1313761100243664896', '1310227300935008256', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879980', '1313761100243664896', '1316558444790022144', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879981', '1313761100243664896', '1316558556102656000', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879982', '1313761100243664896', '1317555660455411712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879983', '1313761100243664896', '1316558685442408448', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879984', '1313761100243664896', '1310402491631796224', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879985', '1313761100243664896', '1310404584291696640', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879986', '1313761100243664896', '1310405161587310592', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879987', '1313761100243664896', '1310402688881524736', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879988', '1313761100243664896', '1310404705934901248', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879989', '1313761100243664896', '1310402817776680960', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879990', '1313761100243664896', '1310403004406431744', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879991', '1313761100243664896', '1310404831407505408', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879992', '1313761100243664896', '1310404999599095808', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879993', '1313761100243664896', '1310243862937075712', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879994', '1313761100243664896', '1310244103824343040', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879995', '1313761100243664896', '1310244248884346880', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879996', '1313761100243664896', '1310238229588344832', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879997', '1313761100243664896', '1310238417082122240', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879998', '1313761100243664896', '1310238574355939328', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859879999', '1313761100243664896', '1310238700705153024', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880000', '1313761100243664896', '1349637786285637632', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880001', '1313761100243664896', '1349638479767666688', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880002', '1313761100243664896', '1349636919478190080', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880003', '1313761100243664896', '1349636574442160128', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880004', '1313761100243664896', '1355962888132493312', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880005', '1313761100243664896', '1370974716822552576', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880006', '1313761100243664896', '694203021537574912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880007', '1313761100243664896', '1330865171429588992', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880008', '1313761100243664896', '1348562759603716096', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880009', '1313761100243664896', '442651158935375872', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880010', '1313761100243664896', '1310395250908332032', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880011', '1313761100243664896', '450300705362808832', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880012', '1313761100243664896', '1310232350285627392', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880013', '1313761100243664896', '1310232462562951168', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880014', '1313761100243664896', '1349016358033031168', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880015', '1313761100243664896', '1302180351979814912', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880016', '1313761100243664896', '442418188639145984', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880017', '1313761100243664896', '694203311615639552', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880018', '1313761100243664896', '1307562519451140096', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880019', '1313761100243664896', '1318229908526202880', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880020', '1313761100243664896', '1318230013262168064', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880021', '1313761100243664896', '1318230265385975808', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414163559859880022', '1313761100243664896', '1308571483794046976', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260032', '1412350653342154752', '1412367934046601216', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260033', '1412350653342154752', '1412737637101338624', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260034', '1412350653342154752', '1412737637101338625', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260035', '1412350653342154752', '1412737637101338626', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260036', '1412350653342154752', '1412737637101338627', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260037', '1412350653342154752', '1412737637101338628', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260038', '1412350653342154752', '1411643459269296128', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260039', '1412350653342154752', '1411643459269296129', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260040', '1412350653342154752', '1411643459269296130', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260041', '1412350653342154752', '1411643459269296131', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164183129260042', '1412350653342154752', '1411643459269296132', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164214154526720', '1412350312731115520', '1411639239606534144', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164214154526721', '1412350312731115520', '1411883806805196800', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164214154526722', '1412350312731115520', '1411883806805196801', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164214154526723', '1412350312731115520', '1411883806805196802', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164214154526724', '1412350312731115520', '1411883806805196803', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('1414164214154526725', '1412350312731115520', '1411883806805196804', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('442062615250866176', '693913251020275712', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('442062615250866177', '693913251020275712', '2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('442062615250866178', '693913251020275712', '3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_power` VALUES ('442062615250866179', '693913251020275712', '4', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `username` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账户',
  `password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态',
  `real_name` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `email` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否启用',
  `login` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否登录',
  `dept_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '部门编号',
  `last_time` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1309861917694623744', 'admin', '$2a$10$6T.NGloFO.mD/QOAUelMTOcjAH8N49h34TsXduDVlnNMrASIGBNz6', NULL, '1', '管理', 'Jmys1992@qq.com', '1378647938930049024', '0', '15553726531', '2020-09-26 22:26:32', NULL, NULL, NULL, '被岁月镂空，亦受其雕琢', '1', NULL, '1', '2021-07-20 11:06:37');
INSERT INTO `sys_user` VALUES ('1349016976730619905', 'mwj', '$2a$10$mD0pnwOGjmOKihboidaTveUdrqcDYoluzfCOA0Ho87iwr9PKrDA6i', NULL, '1', '风筝', '', NULL, '1', '666666666', '2021-01-12 23:34:45', NULL, NULL, NULL, NULL, '1', NULL, '6', '2021-01-12 23:35:12');
INSERT INTO `sys_user` VALUES ('1349021166525743105', 'xiana', '$2a$10$6VuyGmiEbIix/gPDU8oe3O7DZSxGVByjXCHQGtyEMoRAt74M/daee', NULL, '1', '夏娜', 'xiana@gmail.com', NULL, '0', '15553726531', '2021-01-12 23:51:24', NULL, NULL, NULL, NULL, '1', NULL, '1', NULL);
INSERT INTO `sys_user` VALUES ('1355966975355912193', 'sanman', '$2a$10$AD3QnQMRhYY7RUDHd1EEL.KHaDW8/S66SsESwh.9ta8bLiUXrZcJe', NULL, '1', '散漫', 'sanman@gmail.com', NULL, '0', '15553726531', '2021-02-01 03:51:34', NULL, NULL, NULL, NULL, '1', NULL, '1', NULL);
INSERT INTO `sys_user` VALUES ('1355967204012589057', 'langhua', '$2a$10$MNbf6dSvvncpoPsNFyMW6ObPwfj3jCKsZa7LvVAiXco1DWtgA46he', NULL, '1', '浪花', 'langhua@gmail.com', NULL, '0', '15553726531', '2021-02-01 03:52:29', NULL, NULL, NULL, NULL, '1', NULL, '1', NULL);
INSERT INTO `sys_user` VALUES ('1355967579994193921', 'zidian', '$2a$10$c9OatFOMGnj37A6UJTwfGOKqCwCx50K8eZsjV5YoBRlpYHcz8WfyW', NULL, '1', '字典', 'zidian', NULL, '0', '15553726531', '2021-02-01 03:53:58', NULL, NULL, NULL, NULL, '1', NULL, '1', NULL);
INSERT INTO `sys_user` VALUES ('1411138032962109441', 'user1', '$2a$10$lcvVpk1J/bAmnhEtcjXM6.38FUVlCNjn4ETzmPCssZNpOtADFew2.', NULL, '1', 'user1', '1362371739@qq.com', NULL, '0', '18770022324', '2021-07-03 09:41:39', NULL, NULL, NULL, NULL, '1', NULL, '3', '2021-07-27 10:57:00');
INSERT INTO `sys_user` VALUES ('1414163815532068865', 'user2', '$2a$10$K/AWUdocsuzBGnewQcX2yuLFU7YTC57UfbWLSvuV4GJHGZFD/yZTe', NULL, '1', 'user2', '1362371739@qq.com', NULL, '1', '18770022324', '2021-07-11 18:05:02', NULL, NULL, NULL, NULL, '1', NULL, '1', '2021-07-19 16:31:08');
INSERT INTO `sys_user` VALUES ('1414164633605898241', 'user3', '$2a$10$6pqTj9utH0iHjDMk7ipar.SdTKq/Lfuc1Txqjle96.5/NLJ0dP7K6', NULL, '1', 'user3', '1362371739@qq.com', NULL, '0', '18770022324', '2021-07-11 18:08:17', NULL, NULL, NULL, NULL, '1', NULL, '1', '2021-07-19 16:46:21');
INSERT INTO `sys_user` VALUES ('1415509911135059969', 'user4', '$2a$10$wImSI/6s.oamm7cjEdgPletP8RuwZGsJ/FA0kKbyNtFViSPCLJMau', NULL, '1', 'user4', '1362371739@qq.com', NULL, '1', '18770022324', '2021-07-15 11:13:56', NULL, NULL, NULL, NULL, '1', NULL, '1', '2021-07-19 16:31:37');
INSERT INTO `sys_user` VALUES ('1415513320240185345', 'user5', '$2a$10$dYkZwD.DnlKEOg7WKQSvYOx.ggBX5f5mn9t5s/97Gnw9guWbTfQ/C', NULL, '1', 'user5', '1362371739@qq.com', NULL, '1', '18770022324', '2021-07-15 11:27:29', NULL, NULL, NULL, NULL, '1', NULL, '1', NULL);
INSERT INTO `sys_user` VALUES ('1417042682651344897', 'ykl', '$2a$10$vft/R7xMJXExeZ8KlEcfsOAFRgr1NeHKOASoRKNtK.mZx0b22wvVO', NULL, '1', 'ykl', '1232312@qq.com', NULL, '0', '12121212', '2021-07-19 16:44:38', NULL, NULL, NULL, NULL, '1', NULL, '3', '2021-07-20 15:54:43');
INSERT INTO `sys_user` VALUES ('1417043002475413505', 'WXS', '$2a$10$8mOYZXKdM/qlHjTX7/Aoz.wV7rx0t0xWS1N0qODJq0NmAe854zS8S', NULL, '1', 'WXS', '1362371739@qq.com', NULL, '0', '1212121212', '2021-07-19 16:45:54', NULL, NULL, NULL, NULL, '1', NULL, '1', '2021-07-19 16:56:56');
INSERT INTO `sys_user` VALUES ('1417043214996602881', 'cl', '$2a$10$sxfYMJe.I/6jjmFh/qDADudr1qMQD3QOdCjnrPrP19MxyQscubq/e', NULL, '1', 'cl', '1362371739@qq.com', NULL, '1', '12121212', '2021-07-19 16:46:45', NULL, NULL, NULL, NULL, '1', NULL, '1', '2021-07-20 15:14:34');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `user_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户编号',
  `role_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1302196622322565120', '1302196622007992320', '1');
INSERT INTO `sys_user_role` VALUES ('1304443027040763904', '1304443026482921472', '1');
INSERT INTO `sys_user_role` VALUES ('1304443027044958208', '1304443026482921472', '2');
INSERT INTO `sys_user_role` VALUES ('1304443027044958209', '1304443026482921472', '3');
INSERT INTO `sys_user_role` VALUES ('1304443307404820480', '1304443306888921088', '1');
INSERT INTO `sys_user_role` VALUES ('1304443307404820481', '1304443306888921088', '2');
INSERT INTO `sys_user_role` VALUES ('1305359805342285824', '1305359804906078208', '');
INSERT INTO `sys_user_role` VALUES ('1305359807724650496', '1305359807296831488', '');
INSERT INTO `sys_user_role` VALUES ('1305390235135246336', '1305390234694844416', '');
INSERT INTO `sys_user_role` VALUES ('1306229860422647808', '1306229859755753472', '1');
INSERT INTO `sys_user_role` VALUES ('1306229892144168960', '1306229891624075264', '1');
INSERT INTO `sys_user_role` VALUES ('1306243520893288448', '1306243520482246656', '');
INSERT INTO `sys_user_role` VALUES ('1308074663896678400', '1308074663313670144', '1');
INSERT INTO `sys_user_role` VALUES ('1308074663896678401', '1308074663313670144', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1308074663896678402', '1308074663313670144', '2');
INSERT INTO `sys_user_role` VALUES ('1308075167091523584', '1308075166433017856', '1');
INSERT INTO `sys_user_role` VALUES ('1308075167091523585', '1308075166433017856', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1308075241188098048', '1308074939114323968', '1');
INSERT INTO `sys_user_role` VALUES ('1308075241188098049', '1308074939114323968', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1308075407685189632', '1308075407114764288', '1');
INSERT INTO `sys_user_role` VALUES ('1308075407685189633', '1308075407114764288', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1308075638158000128', '1308075637621129216', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1308328954523811840', '1308328954045661184', '1');
INSERT INTO `sys_user_role` VALUES ('1308328954523811841', '1308328954045661184', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1308328954523811842', '1308328954045661184', '2');
INSERT INTO `sys_user_role` VALUES ('1308571264494862336', '1308076162903179264', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1309445423668133888', '1309444883659882496', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1309445423668133889', '1309444883659882496', '1309121036125470720');
INSERT INTO `sys_user_role` VALUES ('1309445423668133890', '1309444883659882496', '2');
INSERT INTO `sys_user_role` VALUES ('1309752526945386496', '1', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1309752526945386497', '1', '1309121036125470720');
INSERT INTO `sys_user_role` VALUES ('1309752526945386498', '1', '2');
INSERT INTO `sys_user_role` VALUES ('1309860016655695872', '1309860016043327488', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1309860554432577536', '1309860553891512320', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1309861324494209024', '1309861323898617856', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1309861325593116672', '1309861324909445120', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1310080380040118272', '1310080379331280896', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1310080380589572096', '1310080379935260672', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1310080718918909952', '1310080718256209920', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1310080719917154304', '1310080719208316928', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1310082314557980672', '1310082313954000896', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1310082315195514880', '1310082314545397760', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1310083089153654784', '1310083088511926272', '1309121036125470720');
INSERT INTO `sys_user_role` VALUES ('1310083089828937728', '1310083089216569344', '1309121036125470720');
INSERT INTO `sys_user_role` VALUES ('1310083324709961728', '1310083324110176256', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1310208453033066496', '1310208452424892416', '1309121036125470720');
INSERT INTO `sys_user_role` VALUES ('1310209026096627712', '1310209025576534016', '1306230258952830976');
INSERT INTO `sys_user_role` VALUES ('1310209026096627713', '1310209025576534016', '1309121036125470720');
INSERT INTO `sys_user_role` VALUES ('1310381721815875584', '1306229381332467712', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1310424875067768832', '1310421836906889217', '1310421428759166976');
INSERT INTO `sys_user_role` VALUES ('1314015448013996032', '1304491590080790528', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1314410103465574400', '1314410059245027329', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1314416691479838720', '1314416690875858945', '');
INSERT INTO `sys_user_role` VALUES ('1316275764227735552', '1316275763711836161', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1316275764227735553', '1316275763711836161', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1316275899439513600', '1315827004456566785', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1316275899439513601', '1315827004456566785', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1316275930657718272', '1315829324519047169', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1316410619078901760', '1306229606205882368', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1316410619078901761', '1306229606205882368', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1316410619078901762', '1306229606205882368', '1316407534105395200');
INSERT INTO `sys_user_role` VALUES ('1316410619078901763', '1306229606205882368', '1316408008376320000');
INSERT INTO `sys_user_role` VALUES ('1318205966671413248', '1318205965996130305', '');
INSERT INTO `sys_user_role` VALUES ('1320899195875360768', '1320899195225243649', '');
INSERT INTO `sys_user_role` VALUES ('1329795580615983104', '1329795579919728641', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1329795580615983105', '1329795579919728641', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1329795614484987904', '1329795613730013185', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1329795688124383232', '1329795687465877505', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1329795704863850496', '1329795703882383361', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1329795716930863104', '1329795716255580161', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1329795741211688960', '1329795740536406017', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1349021014649995264', '1349016976730619905', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1349021167326855168', '1349021166525743105', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1349021167326855169', '1349021166525743105', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1355967256000987136', '1355966975355912193', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1355967256000987137', '1355966975355912193', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1355967330718318592', '1355967204012589057', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1355967330718318593', '1355967204012589057', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1355967580686254080', '1355967579994193921', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1355967580686254081', '1355967579994193921', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1360858458609418240', '1309861917694623744', '1309851245195821056');
INSERT INTO `sys_user_role` VALUES ('1360858458609418241', '1309861917694623744', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1414161791096717312', '1411138032962109441', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1414163815863418880', '1414163815532068865', '1412350653342154752');
INSERT INTO `sys_user_role` VALUES ('1414164633928859648', '1414164633605898241', '1412350312731115520');
INSERT INTO `sys_user_role` VALUES ('1415509912108138496', '1415509911135059969', '1412350312731115520');
INSERT INTO `sys_user_role` VALUES ('1415513366641770496', '1415513320240185345', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1415513366641770497', '1415513320240185345', '1412350312731115520');
INSERT INTO `sys_user_role` VALUES ('1417042310293618688', '1417042309547032577', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1417042351657844736', '1417042350818983937', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1417042351657844737', '1417042350818983937', '1356112133691015168');
INSERT INTO `sys_user_role` VALUES ('1417042373237538816', '1417042372172185601', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1417042404321525760', '1417042403579133953', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1417042554678935552', '1417042553944932353', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1417042846938038272', '1417042682651344897', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1417043003259748352', '1417043002475413505', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('1417043215747383296', '1417043214996602881', '1313761100243664896');
INSERT INTO `sys_user_role` VALUES ('442110794142978048', NULL, '1');
INSERT INTO `sys_user_role` VALUES ('442110794142978049', NULL, '2');
INSERT INTO `sys_user_role` VALUES ('442110794142978050', NULL, '3');
INSERT INTO `sys_user_role` VALUES ('442114944884936704', '442114944884936704', '1');
INSERT INTO `sys_user_role` VALUES ('442114944884936705', '442114944884936704', '2');
INSERT INTO `sys_user_role` VALUES ('442114944884936706', '442114944884936704', '3');
INSERT INTO `sys_user_role` VALUES ('442114944884936707', '442114944884936704', '693913251020275712');
INSERT INTO `sys_user_role` VALUES ('442114944884936708', '442114944884936704', '693949793801601024');
INSERT INTO `sys_user_role` VALUES ('442114944884936709', '442114944884936704', '694106517393113088');
INSERT INTO `sys_user_role` VALUES ('442127724396548096', '3', '1');
INSERT INTO `sys_user_role` VALUES ('442127724396548097', '3', '2');
INSERT INTO `sys_user_role` VALUES ('442127724396548098', '3', '3');
INSERT INTO `sys_user_role` VALUES ('445004989551742976', '442492965651353600', '1');
INSERT INTO `sys_user_role` VALUES ('445004989551742977', '442492965651353600', '2');
INSERT INTO `sys_user_role` VALUES ('445005010271604736', '444226209941950464', '1');
INSERT INTO `sys_user_role` VALUES ('445005010271604737', '444226209941950464', '2');
INSERT INTO `sys_user_role` VALUES ('445005010271604738', '444226209941950464', '3');
INSERT INTO `sys_user_role` VALUES ('447196043407396864', '447196042723725312', '1');
INSERT INTO `sys_user_role` VALUES ('447196043407396865', '447196042723725312', '2');
INSERT INTO `sys_user_role` VALUES ('447197132043194368', '447197131518906368', '1');
INSERT INTO `sys_user_role` VALUES ('447197773046091776', '447197772274339840', '1');
INSERT INTO `sys_user_role` VALUES ('447200144400715776', '447199996320813056', '1');
INSERT INTO `sys_user_role` VALUES ('447200144400715777', '447199996320813056', '2');
INSERT INTO `sys_user_role` VALUES ('449248198469488640', '449248198058446848', '3');
INSERT INTO `sys_user_role` VALUES ('463926002653990912', '463926002318446592', '3');
INSERT INTO `sys_user_role` VALUES ('463926371165540352', '442488661347536896', '3');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
