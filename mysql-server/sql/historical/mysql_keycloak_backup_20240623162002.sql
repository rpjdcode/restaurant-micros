-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_PATH` text COLLATE utf8mb4_unicode_ci,
  `REPRESENTATION` text COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` tinyint NOT NULL DEFAULT '0',
  `AUTH_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('031e863b-6365-448e-9273-4efaa3b3a3ca',NULL,'registration-page-form','2be42890-9ed5-4a31-aac5-cfb049ef8010','9d4216c7-d7d2-434b-b63e-adec9fcf20ab',0,10,1,'b6a52d98-6c7a-4d32-82c9-c1f69491b42a',NULL),('06c80e1e-4474-4226-b5aa-85ef7af0386f',NULL,'reset-otp','0de12368-10d1-4f4c-96f5-204ae2b3a65f','65bd7fe7-e2e6-4c15-8c29-3f5ebfcd499a',0,20,0,NULL,NULL),('10f1a411-8aff-4d00-8b53-786380bfdcc6',NULL,'auth-otp-form','0de12368-10d1-4f4c-96f5-204ae2b3a65f','767e37cd-5aa9-4de5-9f67-2862347e3b29',0,20,0,NULL,NULL),('10f70479-4bf3-4fc5-828d-b72959247396',NULL,'client-secret-jwt','0de12368-10d1-4f4c-96f5-204ae2b3a65f','f237fe21-cb2f-4119-9eff-44ac49851d46',2,30,0,NULL,NULL),('11e63aa1-22b0-42ce-adad-5b45d9ba8f9f',NULL,'conditional-user-configured','2be42890-9ed5-4a31-aac5-cfb049ef8010','9cb02d16-3605-4fd2-b1e7-a12c8e180e80',0,10,0,NULL,NULL),('15438262-c442-40dc-8791-cced4a2226e1',NULL,'client-secret','2be42890-9ed5-4a31-aac5-cfb049ef8010','c9f8ac4f-de56-49ff-ac72-66e7858bdfcc',2,10,0,NULL,NULL),('16aa60e7-22a6-47fb-adf4-2a7a1ab6520b',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','c295d056-55a1-41e9-b608-9296eba3a6a5',0,20,1,'86a67e3f-0c24-447c-9791-5711add42c7a',NULL),('172f6a75-c421-49f4-a644-d0e104d15af3',NULL,'auth-otp-form','2be42890-9ed5-4a31-aac5-cfb049ef8010','9cb02d16-3605-4fd2-b1e7-a12c8e180e80',0,20,0,NULL,NULL),('176c52c8-31f6-4d3b-b586-a83cd1373b35',NULL,'direct-grant-validate-password','2be42890-9ed5-4a31-aac5-cfb049ef8010','898a1064-3d62-4c8d-a965-ee5259af79b4',0,20,0,NULL,NULL),('1b037c45-9681-4987-b9a8-bc5422b003cc',NULL,'registration-password-action','0de12368-10d1-4f4c-96f5-204ae2b3a65f','2df06423-5de6-42ea-b3bd-06699149354b',0,50,0,NULL,NULL),('1e0c45ae-3023-44d5-a477-721e558f24e7',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','6a6105a5-a750-4fb6-84dd-d0f2149eefaf',1,20,1,'9cb02d16-3605-4fd2-b1e7-a12c8e180e80',NULL),('1e142cc5-0582-4733-9913-3785708f9d21',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','bc8cae5f-a759-4821-9aae-de01ab762004',0,20,1,'ecc10a03-6413-48ee-9906-afd3cab5b3bd',NULL),('249a7b13-9a80-4fcb-9f20-17c4fb4c790c',NULL,'idp-username-password-form','2be42890-9ed5-4a31-aac5-cfb049ef8010','64bf267a-d0c4-40e5-9491-60c312d50a84',0,10,0,NULL,NULL),('26b962c4-6b82-483b-8cac-1a7683872466',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','898a1064-3d62-4c8d-a965-ee5259af79b4',1,30,1,'54f73589-76da-4544-82a9-f18a5ff51f9c',NULL),('28015c58-94df-412b-8a68-3943ef983ede',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','a67283ad-cb1d-4d29-ae0d-0c67fc6cd1e1',2,30,1,'2956ef8a-444d-4e08-bef7-987ee72616a1',NULL),('2ae81405-b0c5-445f-90ee-ebf4e8579e81',NULL,'http-basic-authenticator','2be42890-9ed5-4a31-aac5-cfb049ef8010','5393d0d5-9d6a-4207-b158-3d4f08607b13',0,10,0,NULL,NULL),('2cb5e038-f898-4abe-9a75-d976a351e96d',NULL,'identity-provider-redirector','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a67283ad-cb1d-4d29-ae0d-0c67fc6cd1e1',2,25,0,NULL,NULL),('2e721cfd-91df-443e-890c-c028c1de3e62',NULL,'conditional-user-configured','2be42890-9ed5-4a31-aac5-cfb049ef8010','4d3f66a6-5f55-439e-aaa5-20a60de03b67',0,10,0,NULL,NULL),('30a7379d-8d32-431c-9726-04fa5bf28132',NULL,'registration-terms-and-conditions','0de12368-10d1-4f4c-96f5-204ae2b3a65f','2df06423-5de6-42ea-b3bd-06699149354b',3,70,0,NULL,NULL),('35571614-727a-4f2a-85f7-b381698610fb',NULL,'direct-grant-validate-password','0de12368-10d1-4f4c-96f5-204ae2b3a65f','79332b18-1e7f-4854-b8ff-0d615c5c7cc7',0,20,0,NULL,NULL),('3871ac70-6cab-4a31-84b6-bd4660ea1301',NULL,'registration-recaptcha-action','2be42890-9ed5-4a31-aac5-cfb049ef8010','b6a52d98-6c7a-4d32-82c9-c1f69491b42a',3,60,0,NULL,NULL),('3b008377-2572-4911-acdc-77e09c4d4a63',NULL,'http-basic-authenticator','0de12368-10d1-4f4c-96f5-204ae2b3a65f','009776f7-7cc2-4879-8a0e-7216ea5ebda1',0,10,0,NULL,NULL),('3cf9d5d1-1075-4d36-97e0-1800a26ed77b',NULL,'auth-spnego','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a67283ad-cb1d-4d29-ae0d-0c67fc6cd1e1',3,20,0,NULL,NULL),('426dfe4f-f369-4e7a-812e-ac9c5976ca07',NULL,'client-x509','2be42890-9ed5-4a31-aac5-cfb049ef8010','c9f8ac4f-de56-49ff-ac72-66e7858bdfcc',2,40,0,NULL,NULL),('441853cb-9763-4c18-bb72-0f7de1c905d5',NULL,'idp-confirm-link','2be42890-9ed5-4a31-aac5-cfb049ef8010','c295d056-55a1-41e9-b608-9296eba3a6a5',0,10,0,NULL,NULL),('45a3b709-7717-4488-897d-e267f925d941',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','0bbc28fe-2e6d-4c24-81fa-0c2e31c332f0',1,40,1,'4d3f66a6-5f55-439e-aaa5-20a60de03b67',NULL),('4670eb8e-6283-4bda-a178-c4470f0f19db',NULL,'conditional-user-configured','0de12368-10d1-4f4c-96f5-204ae2b3a65f','b12a3400-f566-4d49-a274-a141dc405c23',0,10,0,NULL,NULL),('47659e41-7156-4641-9e84-c6c18832aa2b',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','2956ef8a-444d-4e08-bef7-987ee72616a1',1,20,1,'5c8f680b-653f-4905-9c5b-a30a224624ec',NULL),('4cbb2154-45a9-4f18-ad84-1eb4729a5c60',NULL,'reset-credential-email','2be42890-9ed5-4a31-aac5-cfb049ef8010','0bbc28fe-2e6d-4c24-81fa-0c2e31c332f0',0,20,0,NULL,NULL),('4cce0e68-df45-4bc9-bfd5-ff0c2459d64e',NULL,'conditional-user-configured','0de12368-10d1-4f4c-96f5-204ae2b3a65f','5c8f680b-653f-4905-9c5b-a30a224624ec',0,10,0,NULL,NULL),('4e9bd5ee-e346-4fcb-b457-02251741beac',NULL,'idp-review-profile','2be42890-9ed5-4a31-aac5-cfb049ef8010','9216aead-40f3-40b5-ab84-b50012c5feb3',0,10,0,NULL,'01a07b08-c9f2-47cc-ba95-56acee0a8222'),('4f21c787-75e2-4149-af99-458d0c832844',NULL,'reset-password','2be42890-9ed5-4a31-aac5-cfb049ef8010','0bbc28fe-2e6d-4c24-81fa-0c2e31c332f0',0,30,0,NULL,NULL),('52c3109a-0b8e-4883-8c91-75c0a90dd87b',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','79332b18-1e7f-4854-b8ff-0d615c5c7cc7',1,30,1,'b12a3400-f566-4d49-a274-a141dc405c23',NULL),('5bc3d2e3-ba69-430d-8aa1-a8609b7d47af',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','1ef4c971-ea84-494d-a2b2-1f84b804a858',1,20,1,'767e37cd-5aa9-4de5-9f67-2862347e3b29',NULL),('5de164e7-e4b2-4af3-a026-4b4a5f983254',NULL,'idp-confirm-link','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a0ccf293-bc36-43ef-9ad8-72e39f829f33',0,10,0,NULL,NULL),('64d93f1f-cbb8-4e63-b4c9-50d727453af3',NULL,'registration-page-form','0de12368-10d1-4f4c-96f5-204ae2b3a65f','e7be64e4-86bc-4f3a-86fd-a6edbfc93b89',0,10,1,'2df06423-5de6-42ea-b3bd-06699149354b',NULL),('69f8d5cf-6ecb-43b1-a091-d9c8a41b9af4',NULL,'auth-cookie','2be42890-9ed5-4a31-aac5-cfb049ef8010','94733643-e8c4-4675-af66-7909918176b6',2,10,0,NULL,NULL),('6b03cb9c-cd7e-4cd6-ace0-354edbad2634',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','86a67e3f-0c24-447c-9791-5711add42c7a',2,20,1,'64bf267a-d0c4-40e5-9491-60c312d50a84',NULL),('6f0cc71c-18f7-4b88-96d7-dfdb3ed06028',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','9216aead-40f3-40b5-ab84-b50012c5feb3',0,20,1,'ecf5df17-1792-4523-a5c0-035b7e279376',NULL),('71fb66b1-8e69-4fac-9d95-668c7c8ef92e',NULL,'reset-credential-email','0de12368-10d1-4f4c-96f5-204ae2b3a65f','f8d9fe6a-b64b-4b1b-b09d-43451affcdc6',0,20,0,NULL,NULL),('741c313a-8d79-46cf-bf2b-68ac0d9ac9d2',NULL,'client-jwt','2be42890-9ed5-4a31-aac5-cfb049ef8010','c9f8ac4f-de56-49ff-ac72-66e7858bdfcc',2,20,0,NULL,NULL),('75d73b02-8e67-4967-90d1-8446a89b74ec',NULL,'auth-otp-form','0de12368-10d1-4f4c-96f5-204ae2b3a65f','5c8f680b-653f-4905-9c5b-a30a224624ec',0,20,0,NULL,NULL),('7db17647-2f6b-4656-a81a-53a0dd77da31',NULL,'direct-grant-validate-username','2be42890-9ed5-4a31-aac5-cfb049ef8010','898a1064-3d62-4c8d-a965-ee5259af79b4',0,10,0,NULL,NULL),('81d06870-fc8b-4893-95d7-b3de422bd7a2',NULL,'idp-email-verification','0de12368-10d1-4f4c-96f5-204ae2b3a65f','af878bab-7c4d-4dbe-860b-f617592e94da',2,10,0,NULL,NULL),('844fb8be-f50b-4ffa-b866-68eb849ba593',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','af878bab-7c4d-4dbe-860b-f617592e94da',2,20,1,'1ef4c971-ea84-494d-a2b2-1f84b804a858',NULL),('85799e67-37e7-4371-94ce-e8ebcfad8b75',NULL,'registration-user-creation','0de12368-10d1-4f4c-96f5-204ae2b3a65f','2df06423-5de6-42ea-b3bd-06699149354b',0,20,0,NULL,NULL),('8ec7bad3-44e4-491a-9e5a-132f4f1f8112',NULL,'registration-user-creation','2be42890-9ed5-4a31-aac5-cfb049ef8010','b6a52d98-6c7a-4d32-82c9-c1f69491b42a',0,20,0,NULL,NULL),('9289d676-df8f-4947-987f-6ed309c0c48e',NULL,'reset-otp','2be42890-9ed5-4a31-aac5-cfb049ef8010','4d3f66a6-5f55-439e-aaa5-20a60de03b67',0,20,0,NULL,NULL),('94020766-5f26-4cec-bffc-9110ec002e16',NULL,'idp-create-user-if-unique','2be42890-9ed5-4a31-aac5-cfb049ef8010','ecf5df17-1792-4523-a5c0-035b7e279376',2,10,0,NULL,'bbcb6753-eeed-4db8-8b44-6557054d109e'),('94a76a50-5369-4b9a-bd18-7bab46718f90',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','f8d9fe6a-b64b-4b1b-b09d-43451affcdc6',1,40,1,'65bd7fe7-e2e6-4c15-8c29-3f5ebfcd499a',NULL),('9cb7c7f7-1508-4734-8493-dd3bb93f49a4',NULL,'conditional-user-configured','0de12368-10d1-4f4c-96f5-204ae2b3a65f','767e37cd-5aa9-4de5-9f67-2862347e3b29',0,10,0,NULL,NULL),('9cefbf20-6c2e-4a61-9f33-cf275c39e73e',NULL,'identity-provider-redirector','2be42890-9ed5-4a31-aac5-cfb049ef8010','94733643-e8c4-4675-af66-7909918176b6',2,25,0,NULL,NULL),('9e43c8af-bcbd-4ae0-89dd-2f1b218c866b',NULL,'registration-recaptcha-action','0de12368-10d1-4f4c-96f5-204ae2b3a65f','2df06423-5de6-42ea-b3bd-06699149354b',3,60,0,NULL,NULL),('a060bd53-11fd-4a5c-896d-d84892238bf1',NULL,'conditional-user-configured','2be42890-9ed5-4a31-aac5-cfb049ef8010','54f73589-76da-4544-82a9-f18a5ff51f9c',0,10,0,NULL,NULL),('a10837d0-ba8a-43b0-b088-8e9b75ce256e',NULL,'client-secret-jwt','2be42890-9ed5-4a31-aac5-cfb049ef8010','c9f8ac4f-de56-49ff-ac72-66e7858bdfcc',2,30,0,NULL,NULL),('a2bcdad8-36b7-470f-b322-31412e00344f',NULL,'reset-credentials-choose-user','2be42890-9ed5-4a31-aac5-cfb049ef8010','0bbc28fe-2e6d-4c24-81fa-0c2e31c332f0',0,10,0,NULL,NULL),('a42f5d7a-00fb-4347-8b51-6555206fecf7',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','64bf267a-d0c4-40e5-9491-60c312d50a84',1,20,1,'45270695-621d-4dba-bcf8-3ab5d2f39832',NULL),('a596cd54-8d1f-4636-9b93-e8aad5519739',NULL,'registration-password-action','2be42890-9ed5-4a31-aac5-cfb049ef8010','b6a52d98-6c7a-4d32-82c9-c1f69491b42a',0,50,0,NULL,NULL),('a92bdb96-c1a2-49db-9a3c-bd50665d967e',NULL,'idp-username-password-form','0de12368-10d1-4f4c-96f5-204ae2b3a65f','1ef4c971-ea84-494d-a2b2-1f84b804a858',0,10,0,NULL,NULL),('a9c91027-47a2-48e6-9d7d-0681ee143dcc',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','a0ccf293-bc36-43ef-9ad8-72e39f829f33',0,20,1,'af878bab-7c4d-4dbe-860b-f617592e94da',NULL),('b1622c4a-e723-4904-a8d4-d4a45466783f',NULL,'idp-email-verification','2be42890-9ed5-4a31-aac5-cfb049ef8010','86a67e3f-0c24-447c-9791-5711add42c7a',2,10,0,NULL,NULL),('b510a75f-18c3-4c05-bf62-52416af6cc62',NULL,'auth-spnego','2be42890-9ed5-4a31-aac5-cfb049ef8010','94733643-e8c4-4675-af66-7909918176b6',3,20,0,NULL,NULL),('b78e5fe6-8987-4b58-b47f-e1fa950fa6d0',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','94733643-e8c4-4675-af66-7909918176b6',2,30,1,'6a6105a5-a750-4fb6-84dd-d0f2149eefaf',NULL),('b8624f9c-25b8-4ae5-a1d5-b23e5828b189',NULL,'auth-cookie','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a67283ad-cb1d-4d29-ae0d-0c67fc6cd1e1',2,10,0,NULL,NULL),('bbe5a48e-2e44-48b5-9517-1f353fa1d87c',NULL,'conditional-user-configured','0de12368-10d1-4f4c-96f5-204ae2b3a65f','65bd7fe7-e2e6-4c15-8c29-3f5ebfcd499a',0,10,0,NULL,NULL),('be801bfb-c62f-47ef-96dc-e3f33ceed061',NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','ecf5df17-1792-4523-a5c0-035b7e279376',2,20,1,'c295d056-55a1-41e9-b608-9296eba3a6a5',NULL),('c249b00a-9f65-498d-bda6-592b27c03f5f',NULL,'client-secret','0de12368-10d1-4f4c-96f5-204ae2b3a65f','f237fe21-cb2f-4119-9eff-44ac49851d46',2,10,0,NULL,NULL),('c6717c91-1249-4964-87b5-3c050d6bd39c',NULL,'client-jwt','0de12368-10d1-4f4c-96f5-204ae2b3a65f','f237fe21-cb2f-4119-9eff-44ac49851d46',2,20,0,NULL,NULL),('c8b059fa-c50c-4f0c-bd3a-f1eaea4f45dc',NULL,'auth-username-password-form','2be42890-9ed5-4a31-aac5-cfb049ef8010','6a6105a5-a750-4fb6-84dd-d0f2149eefaf',0,10,0,NULL,NULL),('d128d3fd-43ef-42a2-ac43-7a4985597aa6',NULL,'docker-http-basic-authenticator','0de12368-10d1-4f4c-96f5-204ae2b3a65f','51216e79-6677-40b5-9b9c-47e7dfe726fb',0,10,0,NULL,NULL),('dc17eb45-fb5a-4e52-b916-4e6c3fd8d787',NULL,'direct-grant-validate-username','0de12368-10d1-4f4c-96f5-204ae2b3a65f','79332b18-1e7f-4854-b8ff-0d615c5c7cc7',0,10,0,NULL,NULL),('e13ed38a-79e4-4457-bc1a-3b9bab4dd42a',NULL,NULL,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','ecc10a03-6413-48ee-9906-afd3cab5b3bd',2,20,1,'a0ccf293-bc36-43ef-9ad8-72e39f829f33',NULL),('e260cf0b-9ab8-4b02-abdd-e2546bc1d4c8',NULL,'client-x509','0de12368-10d1-4f4c-96f5-204ae2b3a65f','f237fe21-cb2f-4119-9eff-44ac49851d46',2,40,0,NULL,NULL),('e6475508-a681-41ac-82e9-550c91ad42c9',NULL,'direct-grant-validate-otp','2be42890-9ed5-4a31-aac5-cfb049ef8010','54f73589-76da-4544-82a9-f18a5ff51f9c',0,20,0,NULL,NULL),('e70cfcf1-e57f-424a-b644-d4e19f348c2a',NULL,'idp-review-profile','0de12368-10d1-4f4c-96f5-204ae2b3a65f','bc8cae5f-a759-4821-9aae-de01ab762004',0,10,0,NULL,'3e8b5f05-98ed-4707-afb4-388e97619e26'),('e822448d-a601-4036-94fe-8617149c18ba',NULL,'registration-terms-and-conditions','2be42890-9ed5-4a31-aac5-cfb049ef8010','b6a52d98-6c7a-4d32-82c9-c1f69491b42a',3,70,0,NULL,NULL),('f0ff5908-ea3d-4ef3-be3d-7c400ea8659b',NULL,'idp-create-user-if-unique','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ecc10a03-6413-48ee-9906-afd3cab5b3bd',2,10,0,NULL,'46565833-7a75-4684-b784-70d2da85c3a2'),('f17480b7-eae3-448f-8dfd-e2695ccb5e0a',NULL,'auth-otp-form','2be42890-9ed5-4a31-aac5-cfb049ef8010','45270695-621d-4dba-bcf8-3ab5d2f39832',0,20,0,NULL,NULL),('f1d73483-d438-4125-bb52-e4b0d9b86308',NULL,'reset-credentials-choose-user','0de12368-10d1-4f4c-96f5-204ae2b3a65f','f8d9fe6a-b64b-4b1b-b09d-43451affcdc6',0,10,0,NULL,NULL),('f306a18c-e436-4dc1-baf1-8fa00df21b9c',NULL,'reset-password','0de12368-10d1-4f4c-96f5-204ae2b3a65f','f8d9fe6a-b64b-4b1b-b09d-43451affcdc6',0,30,0,NULL,NULL),('f84c644a-d1cf-424d-bfaa-4c2b327f14f9',NULL,'docker-http-basic-authenticator','2be42890-9ed5-4a31-aac5-cfb049ef8010','0fb645bc-040e-479b-8a77-a1dc8e2d5053',0,10,0,NULL,NULL),('fa40e1d6-e5e2-4add-9170-1c51bdafa7ce',NULL,'auth-username-password-form','0de12368-10d1-4f4c-96f5-204ae2b3a65f','2956ef8a-444d-4e08-bef7-987ee72616a1',0,10,0,NULL,NULL),('fda04994-0c79-4468-8ec0-f28bae01bed6',NULL,'conditional-user-configured','2be42890-9ed5-4a31-aac5-cfb049ef8010','45270695-621d-4dba-bcf8-3ab5d2f39832',0,10,0,NULL,NULL),('fdecbce5-e9aa-454a-9b41-758fe64e8e6a',NULL,'direct-grant-validate-otp','0de12368-10d1-4f4c-96f5-204ae2b3a65f','b12a3400-f566-4d49-a274-a141dc405c23',0,20,0,NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` tinyint NOT NULL DEFAULT '0',
  `BUILT_IN` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('009776f7-7cc2-4879-8a0e-7216ea5ebda1','saml ecp','SAML ECP Profile Authentication Flow','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',1,1),('0bbc28fe-2e6d-4c24-81fa-0c2e31c332f0','reset credentials','Reset credentials for a user if they forgot their password or something','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',1,1),('0fb645bc-040e-479b-8a77-a1dc8e2d5053','docker auth','Used by Docker clients to authenticate against the IDP','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',1,1),('1ef4c971-ea84-494d-a2b2-1f84b804a858','Verify Existing Account by Re-authentication','Reauthentication of existing account','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('2956ef8a-444d-4e08-bef7-987ee72616a1','forms','Username, password, otp and other auth forms.','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('2df06423-5de6-42ea-b3bd-06699149354b','registration form','registration form','0de12368-10d1-4f4c-96f5-204ae2b3a65f','form-flow',0,1),('45270695-621d-4dba-bcf8-3ab5d2f39832','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('4d3f66a6-5f55-439e-aaa5-20a60de03b67','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('51216e79-6677-40b5-9b9c-47e7dfe726fb','docker auth','Used by Docker clients to authenticate against the IDP','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',1,1),('5393d0d5-9d6a-4207-b158-3d4f08607b13','saml ecp','SAML ECP Profile Authentication Flow','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',1,1),('54f73589-76da-4544-82a9-f18a5ff51f9c','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('5c8f680b-653f-4905-9c5b-a30a224624ec','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('64bf267a-d0c4-40e5-9491-60c312d50a84','Verify Existing Account by Re-authentication','Reauthentication of existing account','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('65bd7fe7-e2e6-4c15-8c29-3f5ebfcd499a','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('6a6105a5-a750-4fb6-84dd-d0f2149eefaf','forms','Username, password, otp and other auth forms.','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('767e37cd-5aa9-4de5-9f67-2862347e3b29','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('79332b18-1e7f-4854-b8ff-0d615c5c7cc7','direct grant','OpenID Connect Resource Owner Grant','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',1,1),('86a67e3f-0c24-447c-9791-5711add42c7a','Account verification options','Method with which to verity the existing account','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('898a1064-3d62-4c8d-a965-ee5259af79b4','direct grant','OpenID Connect Resource Owner Grant','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',1,1),('9216aead-40f3-40b5-ab84-b50012c5feb3','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',1,1),('94733643-e8c4-4675-af66-7909918176b6','browser','browser based authentication','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',1,1),('9cb02d16-3605-4fd2-b1e7-a12c8e180e80','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('9d4216c7-d7d2-434b-b63e-adec9fcf20ab','registration','registration flow','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',1,1),('a0ccf293-bc36-43ef-9ad8-72e39f829f33','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('a67283ad-cb1d-4d29-ae0d-0c67fc6cd1e1','browser','browser based authentication','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',1,1),('af878bab-7c4d-4dbe-860b-f617592e94da','Account verification options','Method with which to verity the existing account','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('b12a3400-f566-4d49-a274-a141dc405c23','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('b6a52d98-6c7a-4d32-82c9-c1f69491b42a','registration form','registration form','2be42890-9ed5-4a31-aac5-cfb049ef8010','form-flow',0,1),('bc8cae5f-a759-4821-9aae-de01ab762004','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',1,1),('c295d056-55a1-41e9-b608-9296eba3a6a5','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('c9f8ac4f-de56-49ff-ac72-66e7858bdfcc','clients','Base authentication for clients','2be42890-9ed5-4a31-aac5-cfb049ef8010','client-flow',1,1),('e7be64e4-86bc-4f3a-86fd-a6edbfc93b89','registration','registration flow','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',1,1),('ecc10a03-6413-48ee-9906-afd3cab5b3bd','User creation or linking','Flow for the existing/non-existing user alternatives','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',0,1),('ecf5df17-1792-4523-a5c0-035b7e279376','User creation or linking','Flow for the existing/non-existing user alternatives','2be42890-9ed5-4a31-aac5-cfb049ef8010','basic-flow',0,1),('f237fe21-cb2f-4119-9eff-44ac49851d46','clients','Base authentication for clients','0de12368-10d1-4f4c-96f5-204ae2b3a65f','client-flow',1,1),('f8d9fe6a-b64b-4b1b-b09d-43451affcdc6','reset credentials','Reset credentials for a user if they forgot their password or something','0de12368-10d1-4f4c-96f5-204ae2b3a65f','basic-flow',1,1);
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('01a07b08-c9f2-47cc-ba95-56acee0a8222','review profile config','2be42890-9ed5-4a31-aac5-cfb049ef8010'),('3e8b5f05-98ed-4707-afb4-388e97619e26','review profile config','0de12368-10d1-4f4c-96f5-204ae2b3a65f'),('46565833-7a75-4684-b784-70d2da85c3a2','create unique user config','0de12368-10d1-4f4c-96f5-204ae2b3a65f'),('bbcb6753-eeed-4db8-8b44-6557054d109e','create unique user config','2be42890-9ed5-4a31-aac5-cfb049ef8010');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('01a07b08-c9f2-47cc-ba95-56acee0a8222','missing','update.profile.on.first.login'),('3e8b5f05-98ed-4707-afb4-388e97619e26','missing','update.profile.on.first.login'),('46565833-7a75-4684-b784-70d2da85c3a2','false','require.password.update.after.registration'),('bbcb6753-eeed-4db8-8b44-6557054d109e','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FULL_SCOPE_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint NOT NULL DEFAULT '0',
  `SECRET` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BASE_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BEARER_ONLY` tinyint NOT NULL DEFAULT '0',
  `MANAGEMENT_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` tinyint NOT NULL DEFAULT '0',
  `CONSENT_REQUIRED` tinyint NOT NULL DEFAULT '0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ROOT_URL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` tinyint NOT NULL DEFAULT '1',
  `IMPLICIT_FLOW_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DIRECT_ACCESS_GRANTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ALWAYS_DISPLAY_IN_CONSOLE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('009264f5-467a-4838-9671-d9c87fdca8da',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'2be42890-9ed5-4a31-aac5-cfb049ef8010','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('3d77acf1-7225-4aa5-a810-002464124601',1,1,'restaurant-client',0,1,NULL,'',0,'http://localhost:4200',0,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','openid-connect',-1,1,0,'Cliente Restaurante',0,'client-secret','http://localhost:4200','',NULL,1,0,1,0),('4b74d567-cf3f-4b5d-a7af-26481952a52a',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('574deff7-0e85-4562-8868-6b8c45f71f51',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'2be42890-9ed5-4a31-aac5-cfb049ef8010','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'2be42890-9ed5-4a31-aac5-cfb049ef8010','openid-connect',0,0,0,'${client_admin-cli}',0,'client-secret',NULL,NULL,NULL,0,0,1,0),('6946e38e-4be9-4174-959c-5b7b6cb3a02c',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','openid-connect',0,0,0,'${client_broker}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'2be42890-9ed5-4a31-aac5-cfb049ef8010','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','openid-connect',0,0,0,'${client_realm-management}',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL,0,0,0,'master Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02',1,0,'security-admin-console',0,1,NULL,'/admin/restaurant-realm/console/',0,NULL,0,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,0,'account',0,1,NULL,'/realms/restaurant-realm/account/',0,NULL,0,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','openid-connect',0,0,0,'${client_account}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0),('c05f799d-b526-434a-b3c5-61a1ed8a4362',1,0,'restaurant-realm-realm',0,0,NULL,NULL,1,NULL,0,'2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL,0,0,0,'restaurant-realm Realm',0,'client-secret',NULL,NULL,NULL,1,0,0,0),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1',1,0,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'2be42890-9ed5-4a31-aac5-cfb049ef8010','openid-connect',0,0,0,'${client_security-admin-console}',0,'client-secret','${authAdminUrl}',NULL,NULL,1,0,0,0),('e093e353-9df1-4777-9a0b-91e3c6938f0a',1,0,'account-console',0,1,NULL,'/realms/restaurant-realm/account/',0,NULL,0,'0de12368-10d1-4f4c-96f5-204ae2b3a65f','openid-connect',0,0,0,'${client_account-console}',0,'client-secret','${authBaseUrl}',NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('3d77acf1-7225-4aa5-a810-002464124601','backchannel.logout.revoke.offline.tokens','false'),('3d77acf1-7225-4aa5-a810-002464124601','backchannel.logout.session.required','true'),('3d77acf1-7225-4aa5-a810-002464124601','client.secret.creation.time','1717886407'),('3d77acf1-7225-4aa5-a810-002464124601','display.on.consent.screen','false'),('3d77acf1-7225-4aa5-a810-002464124601','oauth2.device.authorization.grant.enabled','false'),('3d77acf1-7225-4aa5-a810-002464124601','oidc.ciba.grant.enabled','false'),('3d77acf1-7225-4aa5-a810-002464124601','post.logout.redirect.uris','http://localhost:4200/*'),('4b74d567-cf3f-4b5d-a7af-26481952a52a','post.logout.redirect.uris','+'),('574deff7-0e85-4562-8868-6b8c45f71f51','post.logout.redirect.uris','+'),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','post.logout.redirect.uris','+'),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','pkce.code.challenge.method','S256'),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','post.logout.redirect.uris','+'),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','post.logout.redirect.uris','+'),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','pkce.code.challenge.method','S256'),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','post.logout.redirect.uris','+'),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','post.logout.redirect.uris','+'),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','pkce.code.challenge.method','S256'),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','post.logout.redirect.uris','+'),('e093e353-9df1-4777-9a0b-91e3c6938f0a','pkce.code.challenge.method','S256'),('e093e353-9df1-4777-9a0b-91e3c6938f0a','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BINDING_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('08a51162-503e-49c7-9a53-9d042a4c8293','roles','0de12368-10d1-4f4c-96f5-204ae2b3a65f','OpenID Connect scope for add user roles to the access token','openid-connect'),('090549be-0026-41ff-a3cd-6200a6b1cf01','microprofile-jwt','2be42890-9ed5-4a31-aac5-cfb049ef8010','Microprofile - JWT built-in scope','openid-connect'),('32d34b3d-07f1-4966-862b-8a04cb028c64','microprofile-jwt','0de12368-10d1-4f4c-96f5-204ae2b3a65f','Microprofile - JWT built-in scope','openid-connect'),('3975d4fd-afbd-4a3f-85e2-b21192c62ba8','phone','2be42890-9ed5-4a31-aac5-cfb049ef8010','OpenID Connect built-in scope: phone','openid-connect'),('4f5f6b73-23e0-4903-bbf0-39d87ad7ab66','role_list','2be42890-9ed5-4a31-aac5-cfb049ef8010','SAML role list','saml'),('5b7385fb-45cc-4bb4-ab80-3ac184ae9530','offline_access','2be42890-9ed5-4a31-aac5-cfb049ef8010','OpenID Connect built-in scope: offline_access','openid-connect'),('641ecb74-9634-43b6-821b-5ca345f182c0','phone','0de12368-10d1-4f4c-96f5-204ae2b3a65f','OpenID Connect built-in scope: phone','openid-connect'),('65964179-4343-4f2c-87ad-f0f593ee6705','web-origins','0de12368-10d1-4f4c-96f5-204ae2b3a65f','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('6ba45dba-9f75-4163-a5fd-6ab7367f97c7','offline_access','0de12368-10d1-4f4c-96f5-204ae2b3a65f','OpenID Connect built-in scope: offline_access','openid-connect'),('6d150f50-3b4a-4943-8328-6f043be7a03b','role_list','0de12368-10d1-4f4c-96f5-204ae2b3a65f','SAML role list','saml'),('89732083-86ee-490f-8776-6c13cb8d0718','email','2be42890-9ed5-4a31-aac5-cfb049ef8010','OpenID Connect built-in scope: email','openid-connect'),('a5de2d90-e8f6-48bb-b484-e7d211645c26','acr','0de12368-10d1-4f4c-96f5-204ae2b3a65f','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('aa6f38b4-2a67-4590-aed1-af884184e92f','acr','2be42890-9ed5-4a31-aac5-cfb049ef8010','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('ad67727d-28ca-4de7-b179-2c98863aaa96','profile','0de12368-10d1-4f4c-96f5-204ae2b3a65f','OpenID Connect built-in scope: profile','openid-connect'),('cba51c78-c24c-4693-8d70-23bc0c7bfbc1','profile','2be42890-9ed5-4a31-aac5-cfb049ef8010','OpenID Connect built-in scope: profile','openid-connect'),('d17dbf91-9e1b-4dbb-9926-ba19be3f5a40','web-origins','2be42890-9ed5-4a31-aac5-cfb049ef8010','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('d9a0da6e-b085-437b-9ca6-de32fc3fb622','email','0de12368-10d1-4f4c-96f5-204ae2b3a65f','OpenID Connect built-in scope: email','openid-connect'),('e7afdbca-4b84-454b-9a50-baad8fd7a4ee','address','2be42890-9ed5-4a31-aac5-cfb049ef8010','OpenID Connect built-in scope: address','openid-connect'),('f4fc149d-a175-42fa-978f-45c35acdb989','roles','2be42890-9ed5-4a31-aac5-cfb049ef8010','OpenID Connect scope for add user roles to the access token','openid-connect'),('febbb6b2-778e-4fbf-a9ea-d08bf5428c45','address','0de12368-10d1-4f4c-96f5-204ae2b3a65f','OpenID Connect built-in scope: address','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('08a51162-503e-49c7-9a53-9d042a4c8293','${rolesScopeConsentText}','consent.screen.text'),('08a51162-503e-49c7-9a53-9d042a4c8293','true','display.on.consent.screen'),('08a51162-503e-49c7-9a53-9d042a4c8293','false','include.in.token.scope'),('090549be-0026-41ff-a3cd-6200a6b1cf01','false','display.on.consent.screen'),('090549be-0026-41ff-a3cd-6200a6b1cf01','true','include.in.token.scope'),('32d34b3d-07f1-4966-862b-8a04cb028c64','false','display.on.consent.screen'),('32d34b3d-07f1-4966-862b-8a04cb028c64','true','include.in.token.scope'),('3975d4fd-afbd-4a3f-85e2-b21192c62ba8','${phoneScopeConsentText}','consent.screen.text'),('3975d4fd-afbd-4a3f-85e2-b21192c62ba8','true','display.on.consent.screen'),('3975d4fd-afbd-4a3f-85e2-b21192c62ba8','true','include.in.token.scope'),('4f5f6b73-23e0-4903-bbf0-39d87ad7ab66','${samlRoleListScopeConsentText}','consent.screen.text'),('4f5f6b73-23e0-4903-bbf0-39d87ad7ab66','true','display.on.consent.screen'),('5b7385fb-45cc-4bb4-ab80-3ac184ae9530','${offlineAccessScopeConsentText}','consent.screen.text'),('5b7385fb-45cc-4bb4-ab80-3ac184ae9530','true','display.on.consent.screen'),('641ecb74-9634-43b6-821b-5ca345f182c0','${phoneScopeConsentText}','consent.screen.text'),('641ecb74-9634-43b6-821b-5ca345f182c0','true','display.on.consent.screen'),('641ecb74-9634-43b6-821b-5ca345f182c0','true','include.in.token.scope'),('65964179-4343-4f2c-87ad-f0f593ee6705','','consent.screen.text'),('65964179-4343-4f2c-87ad-f0f593ee6705','false','display.on.consent.screen'),('65964179-4343-4f2c-87ad-f0f593ee6705','false','include.in.token.scope'),('6ba45dba-9f75-4163-a5fd-6ab7367f97c7','${offlineAccessScopeConsentText}','consent.screen.text'),('6ba45dba-9f75-4163-a5fd-6ab7367f97c7','true','display.on.consent.screen'),('6d150f50-3b4a-4943-8328-6f043be7a03b','${samlRoleListScopeConsentText}','consent.screen.text'),('6d150f50-3b4a-4943-8328-6f043be7a03b','true','display.on.consent.screen'),('89732083-86ee-490f-8776-6c13cb8d0718','${emailScopeConsentText}','consent.screen.text'),('89732083-86ee-490f-8776-6c13cb8d0718','true','display.on.consent.screen'),('89732083-86ee-490f-8776-6c13cb8d0718','true','include.in.token.scope'),('a5de2d90-e8f6-48bb-b484-e7d211645c26','false','display.on.consent.screen'),('a5de2d90-e8f6-48bb-b484-e7d211645c26','false','include.in.token.scope'),('aa6f38b4-2a67-4590-aed1-af884184e92f','false','display.on.consent.screen'),('aa6f38b4-2a67-4590-aed1-af884184e92f','false','include.in.token.scope'),('ad67727d-28ca-4de7-b179-2c98863aaa96','${profileScopeConsentText}','consent.screen.text'),('ad67727d-28ca-4de7-b179-2c98863aaa96','true','display.on.consent.screen'),('ad67727d-28ca-4de7-b179-2c98863aaa96','true','include.in.token.scope'),('cba51c78-c24c-4693-8d70-23bc0c7bfbc1','${profileScopeConsentText}','consent.screen.text'),('cba51c78-c24c-4693-8d70-23bc0c7bfbc1','true','display.on.consent.screen'),('cba51c78-c24c-4693-8d70-23bc0c7bfbc1','true','include.in.token.scope'),('d17dbf91-9e1b-4dbb-9926-ba19be3f5a40','','consent.screen.text'),('d17dbf91-9e1b-4dbb-9926-ba19be3f5a40','false','display.on.consent.screen'),('d17dbf91-9e1b-4dbb-9926-ba19be3f5a40','false','include.in.token.scope'),('d9a0da6e-b085-437b-9ca6-de32fc3fb622','${emailScopeConsentText}','consent.screen.text'),('d9a0da6e-b085-437b-9ca6-de32fc3fb622','true','display.on.consent.screen'),('d9a0da6e-b085-437b-9ca6-de32fc3fb622','true','include.in.token.scope'),('e7afdbca-4b84-454b-9a50-baad8fd7a4ee','${addressScopeConsentText}','consent.screen.text'),('e7afdbca-4b84-454b-9a50-baad8fd7a4ee','true','display.on.consent.screen'),('e7afdbca-4b84-454b-9a50-baad8fd7a4ee','true','include.in.token.scope'),('f4fc149d-a175-42fa-978f-45c35acdb989','${rolesScopeConsentText}','consent.screen.text'),('f4fc149d-a175-42fa-978f-45c35acdb989','true','display.on.consent.screen'),('f4fc149d-a175-42fa-978f-45c35acdb989','false','include.in.token.scope'),('febbb6b2-778e-4fbf-a9ea-d08bf5428c45','${addressScopeConsentText}','consent.screen.text'),('febbb6b2-778e-4fbf-a9ea-d08bf5428c45','true','display.on.consent.screen'),('febbb6b2-778e-4fbf-a9ea-d08bf5428c45','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('009264f5-467a-4838-9671-d9c87fdca8da','090549be-0026-41ff-a3cd-6200a6b1cf01',0),('009264f5-467a-4838-9671-d9c87fdca8da','3975d4fd-afbd-4a3f-85e2-b21192c62ba8',0),('009264f5-467a-4838-9671-d9c87fdca8da','5b7385fb-45cc-4bb4-ab80-3ac184ae9530',0),('009264f5-467a-4838-9671-d9c87fdca8da','89732083-86ee-490f-8776-6c13cb8d0718',1),('009264f5-467a-4838-9671-d9c87fdca8da','aa6f38b4-2a67-4590-aed1-af884184e92f',1),('009264f5-467a-4838-9671-d9c87fdca8da','cba51c78-c24c-4693-8d70-23bc0c7bfbc1',1),('009264f5-467a-4838-9671-d9c87fdca8da','d17dbf91-9e1b-4dbb-9926-ba19be3f5a40',1),('009264f5-467a-4838-9671-d9c87fdca8da','e7afdbca-4b84-454b-9a50-baad8fd7a4ee',0),('009264f5-467a-4838-9671-d9c87fdca8da','f4fc149d-a175-42fa-978f-45c35acdb989',1),('3d77acf1-7225-4aa5-a810-002464124601','08a51162-503e-49c7-9a53-9d042a4c8293',1),('3d77acf1-7225-4aa5-a810-002464124601','32d34b3d-07f1-4966-862b-8a04cb028c64',0),('3d77acf1-7225-4aa5-a810-002464124601','641ecb74-9634-43b6-821b-5ca345f182c0',0),('3d77acf1-7225-4aa5-a810-002464124601','65964179-4343-4f2c-87ad-f0f593ee6705',1),('3d77acf1-7225-4aa5-a810-002464124601','6ba45dba-9f75-4163-a5fd-6ab7367f97c7',0),('3d77acf1-7225-4aa5-a810-002464124601','a5de2d90-e8f6-48bb-b484-e7d211645c26',1),('3d77acf1-7225-4aa5-a810-002464124601','ad67727d-28ca-4de7-b179-2c98863aaa96',1),('3d77acf1-7225-4aa5-a810-002464124601','d9a0da6e-b085-437b-9ca6-de32fc3fb622',1),('3d77acf1-7225-4aa5-a810-002464124601','febbb6b2-778e-4fbf-a9ea-d08bf5428c45',0),('4b74d567-cf3f-4b5d-a7af-26481952a52a','08a51162-503e-49c7-9a53-9d042a4c8293',1),('4b74d567-cf3f-4b5d-a7af-26481952a52a','32d34b3d-07f1-4966-862b-8a04cb028c64',0),('4b74d567-cf3f-4b5d-a7af-26481952a52a','641ecb74-9634-43b6-821b-5ca345f182c0',0),('4b74d567-cf3f-4b5d-a7af-26481952a52a','65964179-4343-4f2c-87ad-f0f593ee6705',1),('4b74d567-cf3f-4b5d-a7af-26481952a52a','6ba45dba-9f75-4163-a5fd-6ab7367f97c7',0),('4b74d567-cf3f-4b5d-a7af-26481952a52a','a5de2d90-e8f6-48bb-b484-e7d211645c26',1),('4b74d567-cf3f-4b5d-a7af-26481952a52a','ad67727d-28ca-4de7-b179-2c98863aaa96',1),('4b74d567-cf3f-4b5d-a7af-26481952a52a','d9a0da6e-b085-437b-9ca6-de32fc3fb622',1),('4b74d567-cf3f-4b5d-a7af-26481952a52a','febbb6b2-778e-4fbf-a9ea-d08bf5428c45',0),('574deff7-0e85-4562-8868-6b8c45f71f51','090549be-0026-41ff-a3cd-6200a6b1cf01',0),('574deff7-0e85-4562-8868-6b8c45f71f51','3975d4fd-afbd-4a3f-85e2-b21192c62ba8',0),('574deff7-0e85-4562-8868-6b8c45f71f51','5b7385fb-45cc-4bb4-ab80-3ac184ae9530',0),('574deff7-0e85-4562-8868-6b8c45f71f51','89732083-86ee-490f-8776-6c13cb8d0718',1),('574deff7-0e85-4562-8868-6b8c45f71f51','aa6f38b4-2a67-4590-aed1-af884184e92f',1),('574deff7-0e85-4562-8868-6b8c45f71f51','cba51c78-c24c-4693-8d70-23bc0c7bfbc1',1),('574deff7-0e85-4562-8868-6b8c45f71f51','d17dbf91-9e1b-4dbb-9926-ba19be3f5a40',1),('574deff7-0e85-4562-8868-6b8c45f71f51','e7afdbca-4b84-454b-9a50-baad8fd7a4ee',0),('574deff7-0e85-4562-8868-6b8c45f71f51','f4fc149d-a175-42fa-978f-45c35acdb989',1),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','090549be-0026-41ff-a3cd-6200a6b1cf01',0),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','3975d4fd-afbd-4a3f-85e2-b21192c62ba8',0),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','5b7385fb-45cc-4bb4-ab80-3ac184ae9530',0),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','89732083-86ee-490f-8776-6c13cb8d0718',1),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','aa6f38b4-2a67-4590-aed1-af884184e92f',1),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','cba51c78-c24c-4693-8d70-23bc0c7bfbc1',1),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','d17dbf91-9e1b-4dbb-9926-ba19be3f5a40',1),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','e7afdbca-4b84-454b-9a50-baad8fd7a4ee',0),('5cb62860-1f5c-4731-87b5-a85a7cbd4cce','f4fc149d-a175-42fa-978f-45c35acdb989',1),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','08a51162-503e-49c7-9a53-9d042a4c8293',1),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','32d34b3d-07f1-4966-862b-8a04cb028c64',0),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','641ecb74-9634-43b6-821b-5ca345f182c0',0),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','65964179-4343-4f2c-87ad-f0f593ee6705',1),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','6ba45dba-9f75-4163-a5fd-6ab7367f97c7',0),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','a5de2d90-e8f6-48bb-b484-e7d211645c26',1),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','ad67727d-28ca-4de7-b179-2c98863aaa96',1),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','d9a0da6e-b085-437b-9ca6-de32fc3fb622',1),('6946e38e-4be9-4174-959c-5b7b6cb3a02c','febbb6b2-778e-4fbf-a9ea-d08bf5428c45',0),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','090549be-0026-41ff-a3cd-6200a6b1cf01',0),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','3975d4fd-afbd-4a3f-85e2-b21192c62ba8',0),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','5b7385fb-45cc-4bb4-ab80-3ac184ae9530',0),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','89732083-86ee-490f-8776-6c13cb8d0718',1),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','aa6f38b4-2a67-4590-aed1-af884184e92f',1),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','cba51c78-c24c-4693-8d70-23bc0c7bfbc1',1),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','d17dbf91-9e1b-4dbb-9926-ba19be3f5a40',1),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','e7afdbca-4b84-454b-9a50-baad8fd7a4ee',0),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','f4fc149d-a175-42fa-978f-45c35acdb989',1),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','08a51162-503e-49c7-9a53-9d042a4c8293',1),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','32d34b3d-07f1-4966-862b-8a04cb028c64',0),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','641ecb74-9634-43b6-821b-5ca345f182c0',0),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','65964179-4343-4f2c-87ad-f0f593ee6705',1),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','6ba45dba-9f75-4163-a5fd-6ab7367f97c7',0),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','a5de2d90-e8f6-48bb-b484-e7d211645c26',1),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','ad67727d-28ca-4de7-b179-2c98863aaa96',1),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','d9a0da6e-b085-437b-9ca6-de32fc3fb622',1),('a80b83d8-3744-4ae2-ba76-f0e9ff29531e','febbb6b2-778e-4fbf-a9ea-d08bf5428c45',0),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','090549be-0026-41ff-a3cd-6200a6b1cf01',0),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','3975d4fd-afbd-4a3f-85e2-b21192c62ba8',0),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','5b7385fb-45cc-4bb4-ab80-3ac184ae9530',0),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','89732083-86ee-490f-8776-6c13cb8d0718',1),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','aa6f38b4-2a67-4590-aed1-af884184e92f',1),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','cba51c78-c24c-4693-8d70-23bc0c7bfbc1',1),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','d17dbf91-9e1b-4dbb-9926-ba19be3f5a40',1),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','e7afdbca-4b84-454b-9a50-baad8fd7a4ee',0),('ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8','f4fc149d-a175-42fa-978f-45c35acdb989',1),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','08a51162-503e-49c7-9a53-9d042a4c8293',1),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','32d34b3d-07f1-4966-862b-8a04cb028c64',0),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','641ecb74-9634-43b6-821b-5ca345f182c0',0),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','65964179-4343-4f2c-87ad-f0f593ee6705',1),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','6ba45dba-9f75-4163-a5fd-6ab7367f97c7',0),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','a5de2d90-e8f6-48bb-b484-e7d211645c26',1),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','ad67727d-28ca-4de7-b179-2c98863aaa96',1),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','d9a0da6e-b085-437b-9ca6-de32fc3fb622',1),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','febbb6b2-778e-4fbf-a9ea-d08bf5428c45',0),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','08a51162-503e-49c7-9a53-9d042a4c8293',1),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','32d34b3d-07f1-4966-862b-8a04cb028c64',0),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','641ecb74-9634-43b6-821b-5ca345f182c0',0),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','65964179-4343-4f2c-87ad-f0f593ee6705',1),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','6ba45dba-9f75-4163-a5fd-6ab7367f97c7',0),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','a5de2d90-e8f6-48bb-b484-e7d211645c26',1),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','ad67727d-28ca-4de7-b179-2c98863aaa96',1),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','d9a0da6e-b085-437b-9ca6-de32fc3fb622',1),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','febbb6b2-778e-4fbf-a9ea-d08bf5428c45',0),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','090549be-0026-41ff-a3cd-6200a6b1cf01',0),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','3975d4fd-afbd-4a3f-85e2-b21192c62ba8',0),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','5b7385fb-45cc-4bb4-ab80-3ac184ae9530',0),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','89732083-86ee-490f-8776-6c13cb8d0718',1),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','aa6f38b4-2a67-4590-aed1-af884184e92f',1),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','cba51c78-c24c-4693-8d70-23bc0c7bfbc1',1),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','d17dbf91-9e1b-4dbb-9926-ba19be3f5a40',1),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','e7afdbca-4b84-454b-9a50-baad8fd7a4ee',0),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','f4fc149d-a175-42fa-978f-45c35acdb989',1),('e093e353-9df1-4777-9a0b-91e3c6938f0a','08a51162-503e-49c7-9a53-9d042a4c8293',1),('e093e353-9df1-4777-9a0b-91e3c6938f0a','32d34b3d-07f1-4966-862b-8a04cb028c64',0),('e093e353-9df1-4777-9a0b-91e3c6938f0a','641ecb74-9634-43b6-821b-5ca345f182c0',0),('e093e353-9df1-4777-9a0b-91e3c6938f0a','65964179-4343-4f2c-87ad-f0f593ee6705',1),('e093e353-9df1-4777-9a0b-91e3c6938f0a','6ba45dba-9f75-4163-a5fd-6ab7367f97c7',0),('e093e353-9df1-4777-9a0b-91e3c6938f0a','a5de2d90-e8f6-48bb-b484-e7d211645c26',1),('e093e353-9df1-4777-9a0b-91e3c6938f0a','ad67727d-28ca-4de7-b179-2c98863aaa96',1),('e093e353-9df1-4777-9a0b-91e3c6938f0a','d9a0da6e-b085-437b-9ca6-de32fc3fb622',1),('e093e353-9df1-4777-9a0b-91e3c6938f0a','febbb6b2-778e-4fbf-a9ea-d08bf5428c45',0);
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('5b7385fb-45cc-4bb4-ab80-3ac184ae9530','5aeaba8b-aadc-483e-b0a8-394639ec76e3'),('6ba45dba-9f75-4163-a5fd-6ab7367f97c7','96845ab5-5b92-4aa9-8c75-ed13ae871cd5');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `CLIENT_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('22880865-7a7d-44f9-b371-5260aba8cc5a','Consent Required','0de12368-10d1-4f4c-96f5-204ae2b3a65f','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','anonymous'),('288ee14a-d38d-4468-985f-772c13c37c73','rsa-enc-generated','2be42890-9ed5-4a31-aac5-cfb049ef8010','rsa-enc-generated','org.keycloak.keys.KeyProvider','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL),('28e0516d-c9ac-48d5-8785-bc2bdbc9c183','Allowed Client Scopes','0de12368-10d1-4f4c-96f5-204ae2b3a65f','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','authenticated'),('2c4b9350-37d2-4010-9e0f-b0087055abae','aes-generated','0de12368-10d1-4f4c-96f5-204ae2b3a65f','aes-generated','org.keycloak.keys.KeyProvider','0de12368-10d1-4f4c-96f5-204ae2b3a65f',NULL),('3457aac0-7336-498f-bc01-4a61bdfb99b9','Max Clients Limit','0de12368-10d1-4f4c-96f5-204ae2b3a65f','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','anonymous'),('357364f5-9f28-46ec-bda9-af645dcee99b',NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL),('39e0ba39-ce00-4f78-84f0-63c173cea6b1','Allowed Protocol Mapper Types','2be42890-9ed5-4a31-aac5-cfb049ef8010','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','anonymous'),('3ef9bcb2-d77e-4c09-820f-6b39ed696adf','Allowed Protocol Mapper Types','0de12368-10d1-4f4c-96f5-204ae2b3a65f','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','authenticated'),('411b32a5-3822-4489-83c1-95fc60fae716','hmac-generated-hs512','0de12368-10d1-4f4c-96f5-204ae2b3a65f','hmac-generated','org.keycloak.keys.KeyProvider','0de12368-10d1-4f4c-96f5-204ae2b3a65f',NULL),('441cf171-5266-4b93-976b-b4eccec53a48','hmac-generated-hs512','2be42890-9ed5-4a31-aac5-cfb049ef8010','hmac-generated','org.keycloak.keys.KeyProvider','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL),('4adbec47-18cc-432e-bc32-b94a772bc46d','Allowed Protocol Mapper Types','2be42890-9ed5-4a31-aac5-cfb049ef8010','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','authenticated'),('51448220-418a-407b-83b8-34a9eae78772','rsa-generated','2be42890-9ed5-4a31-aac5-cfb049ef8010','rsa-generated','org.keycloak.keys.KeyProvider','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL),('63aede3d-4db5-4d27-953e-6ecf45965675','Allowed Client Scopes','2be42890-9ed5-4a31-aac5-cfb049ef8010','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','authenticated'),('657f1628-56c4-45f6-8ce6-ce4c105a0b0a','Allowed Client Scopes','2be42890-9ed5-4a31-aac5-cfb049ef8010','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','anonymous'),('675c1424-dc89-4cb8-bf4f-b3a1e46545bd','aes-generated','2be42890-9ed5-4a31-aac5-cfb049ef8010','aes-generated','org.keycloak.keys.KeyProvider','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL),('6cba2bb8-3f2b-49ff-a5d3-68a4126a1dfe','Trusted Hosts','2be42890-9ed5-4a31-aac5-cfb049ef8010','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','anonymous'),('8144cd04-5531-4861-8c20-988f1c1fc587','Consent Required','2be42890-9ed5-4a31-aac5-cfb049ef8010','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','anonymous'),('8febc0ec-3860-45c9-badb-9a19326a0a84','Trusted Hosts','0de12368-10d1-4f4c-96f5-204ae2b3a65f','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','anonymous'),('9e6dbb3c-e87d-4699-b955-a253cdd924e0','Full Scope Disabled','0de12368-10d1-4f4c-96f5-204ae2b3a65f','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','anonymous'),('9ee96db3-3fa8-48a5-9080-3585351935c0','Full Scope Disabled','2be42890-9ed5-4a31-aac5-cfb049ef8010','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','anonymous'),('ab304cb7-fa3b-41b7-8ae5-3c40953119de','Allowed Client Scopes','0de12368-10d1-4f4c-96f5-204ae2b3a65f','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','anonymous'),('bbddb0c3-f5bb-4c3e-9a28-c6df9cc6baa9','Max Clients Limit','2be42890-9ed5-4a31-aac5-cfb049ef8010','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','anonymous'),('bebb877c-043f-4f47-bdba-6f96aeeb65b6','rsa-enc-generated','0de12368-10d1-4f4c-96f5-204ae2b3a65f','rsa-enc-generated','org.keycloak.keys.KeyProvider','0de12368-10d1-4f4c-96f5-204ae2b3a65f',NULL),('d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','Allowed Protocol Mapper Types','0de12368-10d1-4f4c-96f5-204ae2b3a65f','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','anonymous'),('f379b4cf-a969-4ea4-a04b-dbed01d07888','rsa-generated','0de12368-10d1-4f4c-96f5-204ae2b3a65f','rsa-generated','org.keycloak.keys.KeyProvider','0de12368-10d1-4f4c-96f5-204ae2b3a65f',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('00fcaa01-2ede-4a2f-8926-11966af0fdc3','411b32a5-3822-4489-83c1-95fc60fae716','secret','9vVISZaAI4Eb4pRFoXD1ustrJ4RmwQPK3-50w-l0YcuwteOXwaWZO8NYvVAAt0XARiF8ck4ucp6-mf4_1j47riVTTeoD0bQ1OEnCESPThGF0ngK7inXUWJjW7RlomMxfRYFE-fN_OjALMClgahfeQG4ZLktjd8w6aIoPAbvoNA0'),('02621b57-8f79-454c-b6ff-8225e688ae5a','d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('042b1d36-50cd-4269-bae3-340f5d478fe2','3ef9bcb2-d77e-4c09-820f-6b39ed696adf','allowed-protocol-mapper-types','oidc-full-name-mapper'),('05f93dd6-8903-4de2-aa64-6f7f55c973f2','8febc0ec-3860-45c9-badb-9a19326a0a84','host-sending-registration-request-must-match','true'),('07425e03-72af-4742-98bb-8aade4838907','411b32a5-3822-4489-83c1-95fc60fae716','kid','42ab2a24-ff79-4c6e-a6cc-4d59672a11ad'),('0f59239f-dbf6-4b36-90d0-f4015e1e6454','3ef9bcb2-d77e-4c09-820f-6b39ed696adf','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('132e4c3a-e345-4c62-b982-b3de89c8f957','288ee14a-d38d-4468-985f-772c13c37c73','keyUse','ENC'),('15ec74ec-e510-4626-99ee-4125d8040c2b','3ef9bcb2-d77e-4c09-820f-6b39ed696adf','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('168a71fa-c10c-46e1-af1d-c3a892639615','d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','allowed-protocol-mapper-types','saml-user-property-mapper'),('170fbfd4-b3ad-44af-9349-7fe46078892b','6cba2bb8-3f2b-49ff-a5d3-68a4126a1dfe','client-uris-must-match','true'),('175002f0-5daa-4665-a787-b9a548e48415','4adbec47-18cc-432e-bc32-b94a772bc46d','allowed-protocol-mapper-types','oidc-full-name-mapper'),('1cf63291-3dee-4cb7-971f-822f7564787b','51448220-418a-407b-83b8-34a9eae78772','keyUse','SIG'),('21a7b996-2c30-49f8-806c-42056d8861d1','411b32a5-3822-4489-83c1-95fc60fae716','algorithm','HS512'),('21d6c966-ce56-4380-8493-a567fb8245d1','bebb877c-043f-4f47-bdba-6f96aeeb65b6','algorithm','RSA-OAEP'),('25f89826-7131-463e-8af7-3a1980da8a31','51448220-418a-407b-83b8-34a9eae78772','privateKey','MIIEpAIBAAKCAQEAx7+Ri9Y9k6DIisRyHgr90Xn4T3ZcR2TceTD9t9M59Gy0AFNtK+3GfvtvvGF5Q+/KiM3m0f+CsZ+dzT6RPIFGJWOEkcbXRxzQ7XurgTAQ44skuZdVSSWDRdHr7f1cfVQMCUTHqMmxubtuU+s7O1tU0TlkkdIAJrte1S0MRxTti+IY0DCdXBuhEZT01n3IV58+rr/Tb3srqNq50NP4ijZtC8XhwxkW4J2zc1qEZ2LsHdkpfWi4kgAwS/54ue0IyqJoR/J+253Tg+QI/ByTGk4B3SPjfZZHZGHjkrAxFVvUfTk7IFry2Lly6h+hOTSc+0RdS9pwbfD/BJ+d0xoZq2QjaQIDAQABAoIBABIvZCJNfmymyissCFGo4YPFLXCaj3smeRYFekvWjKOuk9Klxb4mlxgvbvRBEYe4WIGM8VM0BmOCaxzo8dMG1+qGfWbCKg481t6QEESiKh91JwJIf0i6BBICsw6HLvjwAmqDmwPIXQhSQpCcTVexkG694WSPMFlWXKNexwvfoWLHKQW9CUu64P9ilErVpJXGaMPor5yJdBUH9ymEAJRK0pMe1IrrmbnB+qYvN2jmhMAT1J0hgJ4k2lA43Q5R5Fd5KMK1jyfMwtmz65kacCxKHCPrl2Cwx8jOwDB8Xee2vNj+4mJeLrxf+KNafwKUbPidUCxkKNzlu0Xsbvm6LG6pM4kCgYEA8RrUAwy+I2KluQb2MYLlFoPQHlbxxiWnCranwq/fkyY5x44feSYZOtRLwCL2MB6heBcer18yosEGtIEqTTzregngD4KSyfOYVh2WGJ2zZHykUyGu4XpSYH8q1U0euGaOotFDP4AhLzJ80PTQCVms2Dj5IH00tEuyaZxWzrfhseUCgYEA1Barp/FZpB2xkdzgUp0T+rdkWNv+RJql6dz1vKFSM5g2f1j9G1I5oBELOQ2SfEFwmZEayRcbtVtKm0KGKd8LFMckyH3Wumy2/oiKKBNXxRXaXLWSNXgqHS9t1EJodr1IY0QbEHM7DNkIYOEcUgafs9quHT6FPGKRpXq9yz94IzUCgYEA0vAO1tA6NYkjxjpCAFUtikIuPa0Bf8MHXscpBJqMNxg1atJ71KkxX5fG4kV0L+tMh11q2jGmgl/wNtHeqY6H0dB79/Xb6NW2zHi8DbNC9MJbneOVNe2nzobTeaQsIVaQqf/9HrxBzCIWs1XMALI1F0LZKsR/7NFhOSavh9G2osUCgYATSMhs6dYTxRtrPuEqwduaNWirZ71z8XfajtvNPgHibRmvdKD3Bf/1XPdfRaunHrAlVntQA4jicZ2UBnV6gyxXxE/E5yRKKS5ucG3XfQLDCdykB2J2+CkkJDbhUPR8r3NQi1XGpiOdZHKNlIplrvKAgQbJ4/BrcC78E/AD9g5vbQKBgQDOcsMiLjDqJQn5nkEFPUwyh5xSuf4zznN4pkYrt+IllHFvr+4ddaf+oYp7GSzxAzzXaXqBDA9plY5apS3XFx6wzLpfi6bJ9TnOYEx/Z6vipzDQINcbp80zGfppOZdeW/l9BzXwTxvEch8XEyWM1l6ykkX/KUMxCEOFRSN59ekl4w=='),('2dde36e4-3a74-49fd-a993-33bf9263ceca','4adbec47-18cc-432e-bc32-b94a772bc46d','allowed-protocol-mapper-types','saml-user-property-mapper'),('2e828424-08e1-4211-ac4f-3fd15ee94271','f379b4cf-a969-4ea4-a04b-dbed01d07888','priority','100'),('2ed749f8-ad65-48b5-bf74-36e1e26a1f74','288ee14a-d38d-4468-985f-772c13c37c73','priority','100'),('2f6cc9e9-1bc9-42e2-82d8-48f7262e5378','657f1628-56c4-45f6-8ce6-ce4c105a0b0a','allow-default-scopes','true'),('3013e065-a8ae-4daf-af91-51e72a9a9200','675c1424-dc89-4cb8-bf4f-b3a1e46545bd','secret','R3hGLshddHyZa6Z9knvMeQ'),('38819727-160f-4564-9bd9-de4e8095293f','39e0ba39-ce00-4f78-84f0-63c173cea6b1','allowed-protocol-mapper-types','saml-role-list-mapper'),('39c5a028-79c7-4f33-8dce-5d46050b0e05','4adbec47-18cc-432e-bc32-b94a772bc46d','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3b04d556-b501-4479-8df0-e61b360d57a7','8febc0ec-3860-45c9-badb-9a19326a0a84','client-uris-must-match','true'),('3cab9e60-15f5-4c4f-91ff-1b85b46078fa','f379b4cf-a969-4ea4-a04b-dbed01d07888','certificate','MIICrzCCAZcCBgGQReNwRzANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDDBByZXN0YXVyYW50LXJlYWxtMB4XDTI0MDYyMzE2MTU1MVoXDTM0MDYyMzE2MTczMVowGzEZMBcGA1UEAwwQcmVzdGF1cmFudC1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALNffJnXb00UnvG2t2hs1O55fLWVz9jMvZH4iYSO41rTlOX4gkXesFpTqQirXQgOzidUJPvjY0dWLvU9SDDTs+yxt56cNiS+WJXDcsaONuoFPm8/+dJwhhpkBw1ndCKJQpM9+m7auCB71maRPZxyB51FgnqLhrt966fZAEE7YZWmgtlFulNBwCO5EfYtFKOXa47Z/9nnYpx/C4yqoDAJUlv7ELRtsFTQNvc54xan4mvVlsKC7t9Aie++UXt38+KHL1CK5+5sPOS8YdjIZL/NwwP9LOEQr8phJVmP78YZnC/w7O4PWV+dFVpveYKrJSSLch+2G4m0qFSqjHkdc1aPnPECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAgim9AC8hMilxMYzAmHGpJWWtuHOmt8+hHx0nbm9+aJuvBYWqSkE3tdRoVdImDxGh0N0FNmhXNSL8FwnXhmGWY8BMpSxR5pQ2JbFt9/TlfMOfpHOx0A/NDoqAaKHuBMWGGPPFhsMx5EeY5l6qZZXTI/Tfls8T4Rij7kEnMpxJQ1pjy9H8kOZ30fYYrhN0PqH5kYJ+ymeywrbun5CKqnvoK2SDq8itrvuGrr4fJxdWaZj4ntB/mbKsVVJ39BfqOFncwBhydCWZBAU3B+5z/ytTLz4dcnX6NVdyfDP6ITLn2smu34XbSZ0Qy3ct/3nfJbYl+7gnJ1RDB43j9AO00LxnpQ=='),('447edb8d-3630-4769-978e-d2b9e33563d9','f379b4cf-a969-4ea4-a04b-dbed01d07888','privateKey','MIIEpQIBAAKCAQEAs198mddvTRSe8ba3aGzU7nl8tZXP2My9kfiJhI7jWtOU5fiCRd6wWlOpCKtdCA7OJ1Qk++NjR1Yu9T1IMNOz7LG3npw2JL5YlcNyxo426gU+bz/50nCGGmQHDWd0IolCkz36btq4IHvWZpE9nHIHnUWCeouGu33rp9kAQTthlaaC2UW6U0HAI7kR9i0Uo5drjtn/2edinH8LjKqgMAlSW/sQtG2wVNA29znjFqfia9WWwoLu30CJ775Re3fz4ocvUIrn7mw85Lxh2Mhkv83DA/0s4RCvymElWY/vxhmcL/Ds7g9ZX50VWm95gqslJItyH7YbibSoVKqMeR1zVo+c8QIDAQABAoIBAAG/hlijMwKjKT1msAsyWgzoXeoQ2dq46dChqi1waMcfHjLPAIBP0pPjW2nzN0/lOHjXpvQM7kbo/fkGLgQTzmb1bif7bgw6e9LR1T+Hkm9wAxML65JhU8r4n3PUa0joBmldPWm6Tx1egL7Zuqohzl6eu84X8SoRxD4L0cuH0Hs6cry7upDTSyYVB09E43UwWiHWjChJ4V0+tples69E5meS0bP8ue38fYWGOAhF3MTlU7EOEUy7com3OTUHtBqK3JyTlZq/F5iOGjKW3VGFT6l7qVUFXailzWObDpE1JRrtLtuHBpaCmTvgLEDN+OpVs5/YyXpuMMuEaB9I7DBuk3ECgYEA6CIKpKF9xlosDbTLMCHNu5y4g/jeYUeX06yu7ECaUWzIg2zz7OfPsUNmkvOCHGMtoNxZlky7qkqdHnHy6jk3UsdkLjUrAEATBptiMxo7qLVsE0+zK8PJXzPYMcuT2UiIX1zCQCMtDa5q5G+3ze7AR3Hh/RuDr0u/skNIp4VJG5UCgYEAxdDAuCRWc6c9VBFvdSqpCT/JTv9POl4XNKKYvUeppugt+ZL/m78rqbY4Q76HyD/Qb3ntFUKS6HRiY8bK9AipAevXsb8o0oOSqrkNIzwxYNEK2NJqsuofZzjVu7Jg4Fz1NSm2EDQeI6caOz7VkHWeLapmZaEcnPd8xoXNcuz3xO0CgYEA4JW+0lTjyPoI0SHvy5uI3lDcO+KV1Gxdug/CFRTTuJ+Ux4Kr5LLKQGhDXz10zl4uEQnfKwkGL9WMeZ4pNO8yVUZP6FzMQ6u6PJQsx+BDhBAyheSAJoF/3Dnemx6o5nnEZu7piP//YNM029oybGznXrgRur3aA8k3qBJswpazipkCgYEAjcnOiW7KZMWICP0iVepJFS8aXTxVDrIokfrF3k5ChTdA1PYPrxQ8+L164NvtuZQ8E9tiG24HnQTnDTuNd5PJiG4Cwg4R9aqHc0WG7C2V+x57VuSjxDBaaANt98ao98jJndyS+lRREh8Rh0vHim8z/Ol50fjEaKJgVm/LzkeaZRUCgYEAuNKsRcKCwxD0kjRBeOz9NeXT2tXcZuZF+OXhyl0WeH0IjZ3ztf1TOgKTBfU81wPpGyqmTNh+uzqCRdOiBlgnMbcyZoMLRMmX9lNUj6kqFO4lfggmRhy1km9kH1ppPTX4FTXpfZ6cCa3xmLZcCyX01TnlGZRwpCAFBHxwUBMWzW0='),('5c77b64d-5065-48f4-aac0-0fc0ef235314','39e0ba39-ce00-4f78-84f0-63c173cea6b1','allowed-protocol-mapper-types','saml-user-property-mapper'),('5e45e082-a7b0-4806-a7ab-b63eac4fffdd','675c1424-dc89-4cb8-bf4f-b3a1e46545bd','priority','100'),('63f4479f-944d-4d6f-b8c9-d4e4eff884f6','411b32a5-3822-4489-83c1-95fc60fae716','priority','100'),('69ae8c45-fa50-41a3-aa85-a3332a91eaa0','39e0ba39-ce00-4f78-84f0-63c173cea6b1','allowed-protocol-mapper-types','oidc-address-mapper'),('6f1e1177-3910-43d4-8610-9bee3ab24290','d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','allowed-protocol-mapper-types','saml-role-list-mapper'),('73b1e908-7f8f-4653-bf38-01d2be8d21be','6cba2bb8-3f2b-49ff-a5d3-68a4126a1dfe','host-sending-registration-request-must-match','true'),('81dddc12-d70e-4c38-bbef-e022d72aefbe','441cf171-5266-4b93-976b-b4eccec53a48','priority','100'),('8466025e-113b-4c76-9cc7-b323ec3d5139','ab304cb7-fa3b-41b7-8ae5-3c40953119de','allow-default-scopes','true'),('86de562c-8898-4672-945e-55377b3eb80d','bbddb0c3-f5bb-4c3e-9a28-c6df9cc6baa9','max-clients','200'),('8892d4cd-74d5-4045-9d5a-ebbfec1f2328','d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('8ca27e73-f046-4636-8814-35f0b05e4711','28e0516d-c9ac-48d5-8785-bc2bdbc9c183','allow-default-scopes','true'),('8ca2ec3b-69c4-48bc-bb70-ca94a29b2fab','4adbec47-18cc-432e-bc32-b94a772bc46d','allowed-protocol-mapper-types','oidc-address-mapper'),('8e93fb98-686a-4e42-b489-bbdbb4dfcc9c','4adbec47-18cc-432e-bc32-b94a772bc46d','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('90a87ad5-ccfb-43fa-85ac-f2e6b81a9a37','357364f5-9f28-46ec-bda9-af645dcee99b','kc.user.profile.config','{\"attributes\":[{\"name\":\"username\",\"displayName\":\"${username}\",\"validations\":{\"length\":{\"min\":3,\"max\":255},\"username-prohibited-characters\":{},\"up-username-not-idn-homograph\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"email\",\"displayName\":\"${email}\",\"validations\":{\"email\":{},\"length\":{\"max\":255}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"firstName\",\"displayName\":\"${firstName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false},{\"name\":\"lastName\",\"displayName\":\"${lastName}\",\"validations\":{\"length\":{\"max\":255},\"person-name-prohibited-characters\":{}},\"permissions\":{\"view\":[\"admin\",\"user\"],\"edit\":[\"admin\",\"user\"]},\"multivalued\":false}],\"groups\":[{\"name\":\"user-metadata\",\"displayHeader\":\"User metadata\",\"displayDescription\":\"Attributes, which refer to user metadata\"}]}'),('9b0b0f72-cb9c-4d78-bfd6-8ba2ea1810e9','51448220-418a-407b-83b8-34a9eae78772','priority','100'),('9b48036f-2716-480f-ab03-0c65eb09f9f9','3ef9bcb2-d77e-4c09-820f-6b39ed696adf','allowed-protocol-mapper-types','oidc-address-mapper'),('9bdcbb0e-6cfb-428f-96e7-9c5d073aea8c','d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','allowed-protocol-mapper-types','oidc-full-name-mapper'),('9c8e8c2f-57cb-4b7b-8d13-6c6126070e49','51448220-418a-407b-83b8-34a9eae78772','certificate','MIICmzCCAYMCBgGQReNn7jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNjIzMTYxNTQ5WhcNMzQwNjIzMTYxNzI5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDHv5GL1j2ToMiKxHIeCv3RefhPdlxHZNx5MP230zn0bLQAU20r7cZ++2+8YXlD78qIzebR/4Kxn53NPpE8gUYlY4SRxtdHHNDte6uBMBDjiyS5l1VJJYNF0evt/Vx9VAwJRMeoybG5u25T6zs7W1TROWSR0gAmu17VLQxHFO2L4hjQMJ1cG6ERlPTWfchXnz6uv9Nveyuo2rnQ0/iKNm0LxeHDGRbgnbNzWoRnYuwd2Sl9aLiSADBL/ni57QjKomhH8n7bndOD5Aj8HJMaTgHdI+N9lkdkYeOSsDEVW9R9OTsgWvLYuXLqH6E5NJz7RF1L2nBt8P8En53TGhmrZCNpAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACtxNRo7OnDBDyl5beMNSEf69yg6HaMQGPHJ27cOFmLq6MP1XKSDanmDzhb3mvRKQZOgriVkdt/8lO9llj+fprcKAhh6ZNfY+yjPHf8WYk0oyA2/a5FYq4mPE5/fKKJ2+qkUR4rwFY2dXj7pKiaRbQE3oSdj3xV82ulIncwdH6p/0YrOL5yB379OWGvyd/6oSClkY/oovdUAJ4PH+fvKuuwKcw1tmdzRuzEVqaXw2h7qHlQ1uUnjW8x+urjURzPYEtIw3SSFPBgskrW3Kfqlph1piSVZLe4xgGhVRJc1BSfpN3H+M0UNamZpIgvAT4V5FxnO3SNrjaWk4lRg7fz2rbI='),('9e126c69-4a0f-472d-9bf2-eab348f72fdb','675c1424-dc89-4cb8-bf4f-b3a1e46545bd','kid','f65018c5-07e8-4e03-8f34-23bad92836d9'),('9f596590-abd4-44f2-932e-bb30d14e6187','bebb877c-043f-4f47-bdba-6f96aeeb65b6','certificate','MIICrzCCAZcCBgGQReNyLDANBgkqhkiG9w0BAQsFADAbMRkwFwYDVQQDDBByZXN0YXVyYW50LXJlYWxtMB4XDTI0MDYyMzE2MTU1MloXDTM0MDYyMzE2MTczMlowGzEZMBcGA1UEAwwQcmVzdGF1cmFudC1yZWFsbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANoV3kP071A8CUqZf5fjNzsvJ0zaNu5BDGI2nH6IZdyxZK681kCNNW30q/hT0je0H+RxcALkjAyWqmGHjaNvM4turK08Nw0yUhQCxd+xaBw31zFgpTZ5KFqMPLztAUBQ9khB4xOSK5aTT3jNht6E6DjhlrPelpRzAj+FoX4AA0cM6wxlAcLgjqQQgr/gjk3Sv93Va9kFo0VLl85lG7RI5sTkONILPmyjOmzTIFE5K40D7Boi0rt3E8JJlBIACNup0S7dk4fOO8WJQU+VvPP9hrIcyb8kMcLu/35I+n9d72oQJoN+lxzN8cWTBkLDIkpJs9GSAuyMD2CBaW8cdxVLgDUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAg67rVBTKMex81QAygF7oQZoyEBeU5IA9jahZRdN4Y9RblPggBWu7w7b0M2vFqHHBLEreVbADa08rYv/I5Lozhd7gzQpQYCjw8sGZlFLdcX1I/6dWjhwcdBPGTixKS8EtulmxwIB2RBAiQcmf3kwcEf2KigNzMyNIDsUQimJ5VKVlG6xyHW0DVH+k3t7jerPykcVKqsyKsyZoEjIOK75/peRGTGDeMBPGMYykVS4jsHn7KxlReOHSU3W/qxAhEQW7VXNXpHOwu/hj+0SvZ6XfbK3sehYyj5gV971sxQioE6fZAk8TVJlgGQ0AVehO+6PCF8eZ+N4WaczQNYJ/3IFj5g=='),('a05705f2-c263-49e6-b4d5-95b39677f6c7','4adbec47-18cc-432e-bc32-b94a772bc46d','allowed-protocol-mapper-types','saml-role-list-mapper'),('a5993e80-b014-42d4-8202-ceead7b70ce1','2c4b9350-37d2-4010-9e0f-b0087055abae','kid','48dbc3ef-8f31-456e-b326-368e1572920d'),('a669a983-ae40-4e75-b412-ad1551f2826c','4adbec47-18cc-432e-bc32-b94a772bc46d','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('a7afdb70-17e8-4657-9083-75dbaf5edffa','441cf171-5266-4b93-976b-b4eccec53a48','algorithm','HS512'),('b451d3ca-aa74-4901-8c15-5149dd2020e4','3ef9bcb2-d77e-4c09-820f-6b39ed696adf','allowed-protocol-mapper-types','saml-user-property-mapper'),('b469a743-9b8f-42cc-b6be-2829c349ea8d','bebb877c-043f-4f47-bdba-6f96aeeb65b6','privateKey','MIIEowIBAAKCAQEA2hXeQ/TvUDwJSpl/l+M3Oy8nTNo27kEMYjacfohl3LFkrrzWQI01bfSr+FPSN7Qf5HFwAuSMDJaqYYeNo28zi26srTw3DTJSFALF37FoHDfXMWClNnkoWow8vO0BQFD2SEHjE5IrlpNPeM2G3oToOOGWs96WlHMCP4WhfgADRwzrDGUBwuCOpBCCv+COTdK/3dVr2QWjRUuXzmUbtEjmxOQ40gs+bKM6bNMgUTkrjQPsGiLSu3cTwkmUEgAI26nRLt2Th847xYlBT5W88/2GshzJvyQxwu7/fkj6f13vahAmg36XHM3xxZMGQsMiSkmz0ZIC7IwPYIFpbxx3FUuANQIDAQABAoIBAFAkwS2QEXIW3gNALZePtHhXd8XSW2VrGjXtg80sKuLTfgCI/ON0ATKLO7didlpqI148IcGuY5kstShqPC7XasXOwj5XZpO+7lLUQgtWkr/r9XT74zsFg0LjTl7PaipMlnUvYVeL2+DV+dqXDP0xMnXU0SEAp62eJjFZ1mMLdijhdJUfqdLPEnkfmiT1VerCLdWXbkksq5XCifmWqG9rLgmK3iirAFOcPiidsu1jwYA/icAiFDnhoenh0HIEr60xpkS+P//NpeAPwhwAcaxyIw/V5rBy4O9EnwDZIgCsKmQkn+NQAtdsFktkw/I7x4Pf6OmIjfWMKADW4UwBcTYUJPECgYEA94lbEqzFkJ3URg0yliPfSka4welqeKVmEj87gHfFsGrTbLIkBp6kJ3rk8ovJtyb8fRa96ubSpR1XvDb2ZfJnnNUP2ROOoaSk/9dQTNvaboWqreqheFBH7tmHF0JVAO922eIV+TgWWAI4Z9MO89fQY7y7z63rCmqkBSvHzFHpHvMCgYEA4Yq7X0PClYNtpo+8RHCdWriwCDENXIPFCnf7ywwA9vM0jtyABD7KSmES1YOL9BRiOwR1e9Xwy+QhDke+Z35lq4uhCMAKTzGgVOcsVaODO4cKgiVHJGZkE0OaRfIYawKqmpD/cn0c0UEhvK1bjj5aZNt27E1x+mfIMe8H/pItPjcCgYEAj0J+Y+N7/8NoPBadRUmDjDA783YMecB3v227GRG4Zu6caBb9RJuBs5urbzg5yPcWP6ruxUlLdeXyheplVgEhuCGTJ3XrIV/xYmQRhDnlQ/u2GStmwgPsba6VQX/RRFZSuazgPLkaLVszm9sJl1Q6tc5f/8TO99taC+gXnQd23MMCgYB6clMfeS4e9eeF0esoTOtg4XvQNrFGVNOYx2MP7Uhoycjy9osZwu0YTHNpL62/qYFbASS3QoMkbonzsseQcHLKG1gl4/y02gBtl8PeCpOosbvmxE5HWL9kJgOPjcvr7NqqZ6YHhh0rDe0+/e8C3p88ullqGPGUPNvXICp67ulZKQKBgEzUlkwn9AGcn7dJdyW6wlc7x0V0z4UMze3NDJq8Jo7cbDRwuEDJMM3AX1Wc0nGG8E6VUnU16DuRlu1neFFuqxfis0/Ce3KzNk4ChiDS9QdGiG/HLu7hg8exLV8WQ+pnEGfTqSA7CRy4xEqb7K1l0ufVkq80bjqil3TSIbkvGxbS'),('ba1ad049-28c9-4bc4-85c4-19e65f6d31a3','441cf171-5266-4b93-976b-b4eccec53a48','kid','6dd4d91f-3c33-41f4-8fa1-5047cebee0d6'),('bbbec7ee-8aca-48ed-bcb8-100cb6859e50','63aede3d-4db5-4d27-953e-6ecf45965675','allow-default-scopes','true'),('bbec0848-ad19-4cf5-a684-51292a9b732a','3ef9bcb2-d77e-4c09-820f-6b39ed696adf','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('c3c8e538-97a4-4534-ab72-f01f8867778a','d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c3d2ccc3-6cb9-4bae-95c3-c3cab63cbbad','d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('c4e8b3d9-bb65-4bd5-9a98-2e96ec7ccb07','bebb877c-043f-4f47-bdba-6f96aeeb65b6','priority','100'),('c971da4b-15c1-40fb-a1d7-c1c4a6e3276d','2c4b9350-37d2-4010-9e0f-b0087055abae','priority','100'),('ca1b8df8-c1b9-4f25-8635-230be6d183a8','39e0ba39-ce00-4f78-84f0-63c173cea6b1','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('cc9e852d-9f46-4c3b-bc77-73c52c2bab27','39e0ba39-ce00-4f78-84f0-63c173cea6b1','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('d5138da9-0ac3-403b-b421-6f1325662a2a','3ef9bcb2-d77e-4c09-820f-6b39ed696adf','allowed-protocol-mapper-types','saml-role-list-mapper'),('d6eb1841-3c4f-4792-b1d1-1fcd1e35504e','3ef9bcb2-d77e-4c09-820f-6b39ed696adf','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('da206999-406b-40ba-911d-bcbe226b4d09','d40c9e5d-6c20-4e16-9f6d-b6f7b4935607','allowed-protocol-mapper-types','oidc-address-mapper'),('e1eb754b-ad92-416a-a597-5395b042f659','3457aac0-7336-498f-bc01-4a61bdfb99b9','max-clients','200'),('e2fb8757-4651-4dcb-98d1-b9e543d4081d','441cf171-5266-4b93-976b-b4eccec53a48','secret','FcoMd-h1KhzWRB24FUS4xUvJzt_zyiRff_6quyn9U8Mux8kBe7wpx38X4gw43wIwKOFtA7vQVPPNGx4mYC55KfcdHOVNPeHd7LtyuGy2nsFNSsqMhkkVp_SnDU4RH1bi1ElpVBytctKqGRbIF9ELYhrw6MOcFq3HnMCH0vb26Dw'),('e534171b-9d6d-49df-bde4-8d46a0d1f9b2','39e0ba39-ce00-4f78-84f0-63c173cea6b1','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e7c63fcc-0fcf-4685-bd76-ce0965f6e37f','2c4b9350-37d2-4010-9e0f-b0087055abae','secret','44NgXLiqbTpyfv7wgEA-qg'),('e81f4472-ac7f-4b8d-82d6-52cee58f16e6','4adbec47-18cc-432e-bc32-b94a772bc46d','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('f57fb40f-4b72-4166-92ac-df77165f51e6','39e0ba39-ce00-4f78-84f0-63c173cea6b1','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f5df3e1b-4f15-4df5-ab8a-d31784080de2','288ee14a-d38d-4468-985f-772c13c37c73','algorithm','RSA-OAEP'),('f8578942-7d1f-4fc3-a59f-5f7a967ddb81','288ee14a-d38d-4468-985f-772c13c37c73','certificate','MIICmzCCAYMCBgGQReNoYTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwNjIzMTYxNTQ5WhcNMzQwNjIzMTYxNzI5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+2hwNdaXdBxl7n3EIDPqU7iRCwALGobtBEc/fa2SSl4lZNM+m9rBsZd2E3kLW04Joo36GP0rSy3KvkFh1fbEN0VoDg9Ce9zADKIGC2VjlLg3SQYMYpLwlrCAcktxLyl7PrHTju3X2hKDa2phjuLqBRK0MmMwAlJBZBH8uCNvlAJP08IFWdfGz3TaDysnAg+pATwrJ+jpAxFu3N1THWIHFhZgzfzM3yZbkXu+xNy1iuvYl4fp6czxLoIyvheb3upc942+J5u+SgnOXWkS2dWHJ96QA/3N5L9ZUVPw4Q66ErzNosYcQa9Tg+tBkqKX10PRL2avpSNFXfpjGYAOX4y+tAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAICkekQOEfgCfj51V+nubUP/i+68WJ0xXtA8LtBrXIj1/ahbYpqpo75FmJw9Ymj+R2RqTtjSFsJ6rAVlRM3OCOk3I+59g+xbuumhRi+vmV1UeHkxC5iYGekLTY63oJPc/e+LMNJ840C6YHTmDpj+G7IC81BM0zE+94Q0XOsaEIq1SHW51o8RGdz0FfAmxqh6tgh7FNIQLtafft3uhu8WXf5IS94hSnilVBhxaOya01OfhilL/J1XoeE432jScvh+zJSVdiuOV1XFTBwrCw2xSGN9CYz+mgQlZxvj8uA2CEbQ3cgvO0a3tuTZVWp9fyqeOqJqSj7myWc2vCAgo2VJAus='),('f8672c47-5855-442c-9074-dcf40c84ae22','288ee14a-d38d-4468-985f-772c13c37c73','privateKey','MIIEowIBAAKCAQEAvtocDXWl3QcZe59xCAz6lO4kQsACxqG7QRHP32tkkpeJWTTPpvawbGXdhN5C1tOCaKN+hj9K0styr5BYdX2xDdFaA4PQnvcwAyiBgtlY5S4N0kGDGKS8JawgHJLcS8pez6x047t19oSg2tqYY7i6gUStDJjMAJSQWQR/Lgjb5QCT9PCBVnXxs902g8rJwIPqQE8Kyfo6QMRbtzdUx1iBxYWYM38zN8mW5F7vsTctYrr2JeH6enM8S6CMr4Xm97qXPeNviebvkoJzl1pEtnVhyfekAP9zeS/WVFT8OEOuhK8zaLGHEGvU4PrQZKil9dD0S9mr6UjRV36YxmADl+MvrQIDAQABAoIBABcgTCXqtkks2GRSfa/WuBvef3usff7zuhe4a31MgMitSXILJDO8e278fks2Di4Eky4lduoYNp40aOvn4dAwMDQsb2vdnSSmGftH/T7jIhJ4nNQi0W/lsPwfpK8nB0ASgEqfQHVtUcNSxEBrcevOMUtYtwoVDyNC3VBBaz0jdayEn00vcG9BOLz+uR6Zb3iXmhBpEXFXlMDSDdjlreifpZE98EI6iUWddFyX7bGeafxbiXLfjzxojx2MxVIUZgbRy/JzKbD+qTJBmAfJVBkoewLWb9cCjXUXvHOoP0PHN29yiQQvD/yy85VPoxOlajDDGwh9z2B99kBGl0zD+8JuLUECgYEA/r4CqyHX96IjMz4WmA0xkQYsrKuO4w3VlKeln878Ojs3TalMfbF0tTVXiPKui2h+POd1xbKsfdhtYYKci5EI1/FL1zr7QixEpJCQ2uAVvLaMdUlHB71/9Ge17P4g9jYmJ7vXJpHM+arcBp3sGs4LV9o8by2tIkcSU5UX+lo1R9cCgYEAv8tX0h8SoT1/4EkPYL5E2kIdJmwu+DIyj1jeVs8BN1m1kjpraxNEZhZ6FtWGihOBIq/GvnPL38dnr5i9mRr3SehjHArpdSZHyvEUgae4OZmluTOaXIds8/QI32MwdN5KBOzkuuSmlXyBuE5JE/uAdbrqAdEDT4d/oDSzN0hcxBsCgYBlIsTmcmpOy1VUS8smlN5f6GamKvpwlJZ+DU0JNGEZMVdUgul2YZSnOMVG/qpjeJndzjsIwVYQJHPQqc1C79LmAMuOaMFGVVLvTuHjs+GNaaA8FFqZ7Rc2zlIBBCfL+FWPotjZXDtXyAjQq7QINFN2jpM9xJGfMT5KZr/9SgErQwKBgQCUKP5PmKdonbyiQ244uuMvg/FG1D24h/ac2/buMn1rB8cHDlAa6EhnYKex6gNDuOuCIy2xxHxTA5SqhqC4nKc5leayLA/K6uZ89J11x12+SV5HYoC1R/y3u+X6w4IUVf/yLBpJ8gZp5kPDX95+LERBLkJFYvRexHqoBO4JH8JhzwKBgCbQJOlomAUk823VQKRc55wdEe45pIGXmww9C+YkWESkBai/wSMfV3IBa4NQpDbcdeqjKtdFO/vnAq5w23yy+T+oA/n34Eoja6tAy742nlVyuL0Mw36jnqNZwwHwOXk2Zy2PMB4vEcBO9BRF3gYlKdTigQ6DiILZU2rfxhaj1Dhe'),('f9561ff3-c5b1-402f-b38c-b2d212337a5c','39e0ba39-ce00-4f78-84f0-63c173cea6b1','allowed-protocol-mapper-types','oidc-full-name-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHILD_ROLE` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0cf29a6a-9fee-40a4-8e5d-1759424ae784','48224bb6-ff51-4b61-80df-21a79502f3c0'),('14fe14cf-8b18-4414-b93d-bb525fb024d6','ddc22ba3-b6a6-40cd-ad07-ed53b8618b75'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','0cf29a6a-9fee-40a4-8e5d-1759424ae784'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','14fe14cf-8b18-4414-b93d-bb525fb024d6'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','172e173a-d6f3-42e1-8485-f5a6b62e4017'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','183e0128-25f4-4d53-8740-59d8799120fe'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','2197f6dc-54db-4dd1-ba87-b261965909be'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','2bef9930-0fbc-47dd-b06d-75487e9740af'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','2dc21440-10f2-4d41-87d9-fe10ba419aaa'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','380d72d5-8930-40d2-9b58-505a978e8479'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','38d12efb-d3b4-4b84-ba40-951a2c739c9a'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','3e912f76-45f9-4fcd-9cea-bbc790bccd83'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','48224bb6-ff51-4b61-80df-21a79502f3c0'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','4e4ce2a6-85f5-4cde-8c93-2565900b8e82'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','59c9a259-4776-49a4-9246-0111bad81a9c'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','6567c26c-de87-4954-a73f-cafe0dcef321'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','73109d45-fd00-4bb5-a155-58d2e9aa2252'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','7f6a8e3b-950e-44b7-b69a-061a08fbe4ee'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','80d49966-2e7f-4213-b29c-e3215a12ea94'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','818ead46-1754-44a9-a54e-7368eb57cecd'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','8b3b6b75-7fc1-4efc-8f0a-30100ae523aa'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','93a03cbf-5bc7-4e59-ad43-d66ff5bd8ea9'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','97386f3c-87a0-4a3a-bf5f-3ca200f57743'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','9ab0a6e1-da51-4caf-b19c-05051be02f9f'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','9f8d30dd-5e68-43b3-8b70-054c0b78c56f'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','a492f740-90a5-4042-ae04-7157bd5e0df8'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','a851182b-2317-4650-b7cb-24d71f069439'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','b2915b24-f017-4c99-a927-355d0dc46520'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','b371fd78-2018-4a55-89a5-f16bfe689f48'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','b6151cdf-ffb1-48b0-894d-d52e548b2915'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','ce8ce04f-fcc5-4bcd-bfa7-35749cdc3c15'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','cec5da13-9faa-4597-b7b4-747eb2e7340c'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','cf46ebb7-9539-4232-a33a-a8375d1eb336'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','d0b9bfa8-e46d-4aab-a7a4-c48cd5f6e344'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','ddc22ba3-b6a6-40cd-ad07-ed53b8618b75'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','e6b1f430-0338-4098-8579-0b1bbcaff89b'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','e7ba78a3-ebf3-4e5f-8e59-049600725289'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','f830e9c4-4644-404f-9c78-f941657b2ba6'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','fc77f542-4b34-41f4-86f6-19df768ec845'),('187ce72b-15b1-4c17-b196-35ea498cbe06','d26348b8-1315-4d4d-b292-e5d44b385378'),('1baf361f-3a3b-4004-9c2c-f91a30dbfb5e','187ce72b-15b1-4c17-b196-35ea498cbe06'),('1baf361f-3a3b-4004-9c2c-f91a30dbfb5e','9181d070-1509-46d6-b17f-8f077b01ea35'),('1baf361f-3a3b-4004-9c2c-f91a30dbfb5e','96845ab5-5b92-4aa9-8c75-ed13ae871cd5'),('1baf361f-3a3b-4004-9c2c-f91a30dbfb5e','b37d1471-4eb7-431b-80a1-a89b5f4fb494'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','031360c4-5e34-4f93-ab9f-b15978aaae65'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','14e4da89-f519-48af-8d5f-5cc4ccc752bf'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','184e7237-c188-45ea-bf71-127cde70a5c6'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','1f4a2997-00b3-476b-8317-f6d6db846484'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','20349eda-62b1-48d5-91e0-7426edcd6b5f'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','24344b9e-e1a6-4b09-9de1-92b8a80383ba'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','33277570-7a1c-4812-8c53-0ec07db2c02e'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','373d22ad-e962-4e06-ae88-704f5d5dfa3d'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','5620f206-9c33-48b8-a849-5ba02a055de1'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','8f9ba6f5-c1c5-4fbe-97d5-4131cd226d59'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','a239b2a8-7555-4a99-add1-46a881babbf5'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','b5b69292-9a2d-482d-b234-444156f23950'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','b7f9e4ec-112c-4941-8d81-eba50a885043'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','bd444252-5b94-4400-9183-b06d98992cf4'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','cec5bd03-5622-45db-9c77-a1723d662e70'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','d48a90bb-6d42-4439-ab8f-e43aba722360'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','f2211139-ae08-4286-a880-1a0844f61fe6'),('2a52d408-f4ac-4c60-ac97-9958c16e731f','fa8cc133-c4d6-41d4-bb72-e0149892eb9e'),('73109d45-fd00-4bb5-a155-58d2e9aa2252','4e4ce2a6-85f5-4cde-8c93-2565900b8e82'),('73109d45-fd00-4bb5-a155-58d2e9aa2252','e7ba78a3-ebf3-4e5f-8e59-049600725289'),('7dfcb66f-d890-4bfc-91d4-ea4ce1ee8dd1','b2fa9ecd-5014-4ee2-80b2-48cd48c05832'),('a2cd5125-ec78-4c6b-a0c9-9203d1e543ed','0b1164c7-7645-4b73-ab20-4a7b459e6039'),('c7203ab2-b5c0-4777-8b38-8ade09961450','d54ea6ed-1a94-4a0a-9a04-2f645b6dc556'),('cec5da13-9faa-4597-b7b4-747eb2e7340c','7f6a8e3b-950e-44b7-b69a-061a08fbe4ee'),('cec5da13-9faa-4597-b7b4-747eb2e7340c','80d49966-2e7f-4213-b29c-e3215a12ea94'),('d48a90bb-6d42-4439-ab8f-e43aba722360','fa8cc133-c4d6-41d4-bb72-e0149892eb9e'),('efcb1ff3-266e-4e3d-9d0f-3e4113cacbe7','06091ecc-efc9-4007-b4d5-126f32b005d1'),('efcb1ff3-266e-4e3d-9d0f-3e4113cacbe7','5aeaba8b-aadc-483e-b0a8-394639ec76e3'),('efcb1ff3-266e-4e3d-9d0f-3e4113cacbe7','7dfcb66f-d890-4bfc-91d4-ea4ce1ee8dd1'),('efcb1ff3-266e-4e3d-9d0f-3e4113cacbe7','83e768c7-82f9-4ca7-99a0-6afaade0f89c'),('f2211139-ae08-4286-a880-1a0844f61fe6','373d22ad-e962-4e06-ae88-704f5d5dfa3d'),('f2211139-ae08-4286-a880-1a0844f61fe6','8f9ba6f5-c1c5-4fbe-97d5-4131cd226d59');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('7180d8b3-33ec-4a96-9b88-f8a8a1c2583f',NULL,'password','2691900e-1a98-46d3-8907-64e2db192c23',1719159527769,'My password','{\"value\":\"Q0V/4o26pl7SojqIPXlIoOKpQFjdas3DzxVbdFjH9FCl0Vtw36qJCOajti/LIN9WYKBOPpMHEDnRkHkSniMjPQ==\",\"salt\":\"otBuD9ikZpfRxnFgpkzblg==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('9e065b83-eed4-4b77-9c5b-781b5251bfd4',NULL,'password','8bdf082e-4634-4df5-ba3c-62bed0c3751e',1719159452969,NULL,'{\"value\":\"F+StGhx7n8Lb1B9S5hTJuhoqbFUkRjkqURWo1dxHg7VX459yAU8KPUFQrIJ/Q2dvvp/fbKlSXbnjjZ3vlA7ONw==\",\"salt\":\"+ZymMnYUfQZv8YkX+XQGYg==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10),('a22348f0-d862-4c54-8284-0ec0815cf16c',NULL,'password','c47331c7-6743-47a0-b69a-26c50b234e9c',1719159562046,'My password','{\"value\":\"kCLtodlNOKwZAQaen7QOb/TRbOX+fDR4k8P/4yOPvr1AuTqOTVSF+9P6ZTzajjixidex70GTeMsD0PABKTLtJw==\",\"salt\":\"HjtHz+lncw9iOFItLjb1yQ==\",\"additionalParameters\":{}}','{\"hashIterations\":210000,\"algorithm\":\"pbkdf2-sha512\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-06-23 16:16:58',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-06-23 16:16:58',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-06-23 16:16:59',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-06-23 16:16:59',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-06-23 16:17:01',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-06-23 16:17:01',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-06-23 16:17:03',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-06-23 16:17:03',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-06-23 16:17:03',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-06-23 16:17:05',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-06-23 16:17:06',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-06-23 16:17:06',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-06-23 16:17:06',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-06-23 16:17:06',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-06-23 16:17:06',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-06-23 16:17:06',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-06-23 16:17:06',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-06-23 16:17:07',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-06-23 16:17:08',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-06-23 16:17:08',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-06-23 16:17:08',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-06-23 16:17:08',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-06-23 16:17:09',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-06-23 16:17:09',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-06-23 16:17:09',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'9159413478'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-06-23 16:17:09',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-06-23 16:17:11',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-06-23 16:17:11',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-06-23 16:17:12',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-06-23 16:17:12',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-06-23 16:17:12',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-06-23 16:17:12',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-06-23 16:17:12',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-06-23 16:17:13',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-06-23 16:17:14',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-06-23 16:17:14',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-06-23 16:17:14',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'9159413478'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-06-23 16:17:14',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-06-23 16:17:14',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-06-23 16:17:14',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-06-23 16:17:14',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-06-23 16:17:14',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-06-23 16:17:16',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-06-23 16:17:16',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-06-23 16:17:16',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-06-23 16:17:16',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-06-23 16:17:16',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-06-23 16:17:17',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-06-23 16:17:18',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-06-23 16:17:19',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-06-23 16:17:19',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-06-23 16:17:19',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-06-23 16:17:19',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.25.1',NULL,NULL,'9159413478'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-06-23 16:17:19',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-06-23 16:17:19',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-06-23 16:17:19',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-06-23 16:17:19',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-06-23 16:17:22',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-06-23 16:17:22',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-06-23 16:17:23',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-06-23 16:17:23',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-06-23 16:17:23',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-06-23 16:17:23',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-06-23 16:17:23',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-06-23 16:17:23',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-06-23 16:17:23',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-06-23 16:17:23',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-06-23 16:17:23',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-06-23 16:17:23',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-06-23 16:17:24',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.25.1',NULL,NULL,'9159413478'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-06-23 16:17:24',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'9159413478'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-06-23 16:17:24',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'9159413478'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-06-23 16:17:24',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'9159413478'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-06-23 16:17:24',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.25.1',NULL,NULL,'9159413478'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-06-23 16:17:24',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-06-23 16:17:24',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-06-23 16:17:24',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-06-23 16:17:24',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-06-23 16:17:25',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-06-23 16:17:25',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-06-23 16:17:25',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-06-23 16:17:25',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-06-23 16:17:25',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-06-23 16:17:25',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.25.1',NULL,NULL,'9159413478'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-06-23 16:17:25',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'9159413478'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-06-23 16:17:25',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.25.1',NULL,NULL,'9159413478'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-06-23 16:17:25',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-06-23 16:17:25',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.25.1',NULL,NULL,'9159413478'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-06-23 16:17:26',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-06-23 16:17:26',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-06-23 16:17:26',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'9159413478'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-06-23 16:17:26',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-06-23 16:17:26',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'9159413478'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-06-23 16:17:26',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.25.1',NULL,NULL,'9159413478'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-06-23 16:17:26',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-06-23 16:17:26',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'9159413478'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-06-23 16:17:26',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.25.1',NULL,NULL,'9159413478'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-06-23 16:17:26',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-06-23 16:17:26',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-06-23 16:17:26',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-06-23 16:17:26',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-06-23 16:17:26',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'9159413478'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-06-23 16:17:26',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-06-23 16:17:26',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2024-06-23 16:17:27',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.25.1',NULL,NULL,'9159413478'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2024-06-23 16:17:27',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'9159413478'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2024-06-23 16:17:27',107,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-06-23 16:17:27',108,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'9159413478'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-06-23 16:17:27',109,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.25.1',NULL,NULL,'9159413478'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-06-23 16:17:27',110,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2024-06-23 16:17:27',111,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-06-23 16:17:27',112,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.25.1',NULL,NULL,'9159413478'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-06-23 16:17:27',113,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-06-23 16:17:27',114,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-06-23 16:17:27',115,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-06-23 16:17:27',116,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.25.1',NULL,NULL,'9159413478'),('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-06-23 16:17:27',117,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.25.1',NULL,NULL,'9159413478'),('24.0.0-9758','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-06-23 16:17:27',118,'EXECUTED','9:502c557a5189f600f0f445a9b49ebbce','addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...','',NULL,'4.25.1',NULL,NULL,'9159413478'),('24.0.0-9758-2','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-06-23 16:17:27',119,'EXECUTED','9:bf0fdee10afdf597a987adbf291db7b2','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('24.0.0-26618-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-06-23 16:17:27',120,'EXECUTED','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('24.0.0-26618-reindex','keycloak','META-INF/jpa-changelog-24.0.0.xml','2024-06-23 16:17:27',121,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('24.0.2-27228','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-06-23 16:17:27',122,'EXECUTED','9:eaee11f6b8aa25d2cc6a84fb86fc6238','customChange','',NULL,'4.25.1',NULL,NULL,'9159413478'),('24.0.2-27967-drop-index-if-present','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-06-23 16:17:27',123,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478'),('24.0.2-27967-reindex','keycloak','META-INF/jpa-changelog-24.0.2.xml','2024-06-23 16:17:27',124,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.25.1',NULL,NULL,'9159413478');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` tinyint NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL),(1000,0,NULL,NULL),(1001,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('0de12368-10d1-4f4c-96f5-204ae2b3a65f','08a51162-503e-49c7-9a53-9d042a4c8293',1),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','32d34b3d-07f1-4966-862b-8a04cb028c64',0),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','641ecb74-9634-43b6-821b-5ca345f182c0',0),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','65964179-4343-4f2c-87ad-f0f593ee6705',1),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','6ba45dba-9f75-4163-a5fd-6ab7367f97c7',0),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','6d150f50-3b4a-4943-8328-6f043be7a03b',1),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','a5de2d90-e8f6-48bb-b484-e7d211645c26',1),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','ad67727d-28ca-4de7-b179-2c98863aaa96',1),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','d9a0da6e-b085-437b-9ca6-de32fc3fb622',1),('0de12368-10d1-4f4c-96f5-204ae2b3a65f','febbb6b2-778e-4fbf-a9ea-d08bf5428c45',0),('2be42890-9ed5-4a31-aac5-cfb049ef8010','090549be-0026-41ff-a3cd-6200a6b1cf01',0),('2be42890-9ed5-4a31-aac5-cfb049ef8010','3975d4fd-afbd-4a3f-85e2-b21192c62ba8',0),('2be42890-9ed5-4a31-aac5-cfb049ef8010','4f5f6b73-23e0-4903-bbf0-39d87ad7ab66',1),('2be42890-9ed5-4a31-aac5-cfb049ef8010','5b7385fb-45cc-4bb4-ab80-3ac184ae9530',0),('2be42890-9ed5-4a31-aac5-cfb049ef8010','89732083-86ee-490f-8776-6c13cb8d0718',1),('2be42890-9ed5-4a31-aac5-cfb049ef8010','aa6f38b4-2a67-4590-aed1-af884184e92f',1),('2be42890-9ed5-4a31-aac5-cfb049ef8010','cba51c78-c24c-4693-8d70-23bc0c7bfbc1',1),('2be42890-9ed5-4a31-aac5-cfb049ef8010','d17dbf91-9e1b-4dbb-9926-ba19be3f5a40',1),('2be42890-9ed5-4a31-aac5-cfb049ef8010','e7afdbca-4b84-454b-9a50-baad8fd7a4ee',0),('2be42890-9ed5-4a31-aac5-cfb049ef8010','f4fc149d-a175-42fa-978f-45c35acdb989',1);
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS_JSON` text COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SESSION_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `FED_USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STORE_TOKEN` tinyint NOT NULL DEFAULT '0',
  `AUTHENTICATE_BY_DEFAULT` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_TOKEN_ROLE` tinyint NOT NULL DEFAULT '1',
  `TRUST_EMAIL` tinyint NOT NULL DEFAULT '0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LINK_ONLY` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES ('d1a380bf-0118-4d6a-8889-3a49f99f90d1','admin',' ','0de12368-10d1-4f4c-96f5-204ae2b3a65f'),('76cc50c2-b463-4918-b576-e708a1f69b00','developer',' ','0de12368-10d1-4f4c-96f5-204ae2b3a65f'),('eeadde87-116c-4974-b4fd-de6aa1200b7e','user',' ','0de12368-10d1-4f4c-96f5-204ae2b3a65f');
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_ROLE` tinyint DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('031360c4-5e34-4f93-ab9f-b15978aaae65','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_query-realms}','query-realms','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('06091ecc-efc9-4007-b4d5-126f32b005d1','574deff7-0e85-4562-8868-6b8c45f71f51',1,'${role_view-profile}','view-profile','2be42890-9ed5-4a31-aac5-cfb049ef8010','574deff7-0e85-4562-8868-6b8c45f71f51',NULL),('0b1164c7-7645-4b73-ab20-4a7b459e6039','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,'${role_view-consent}','view-consent','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',NULL),('0cf29a6a-9fee-40a4-8e5d-1759424ae784','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_view-clients}','view-clients','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('14e4da89-f519-48af-8d5f-5cc4ccc752bf','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_manage-users}','manage-users','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('14fe14cf-8b18-4414-b93d-bb525fb024d6','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_view-clients}','view-clients','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('151ab445-532a-47c1-b823-fe56b2e0724f','574deff7-0e85-4562-8868-6b8c45f71f51',1,'${role_view-groups}','view-groups','2be42890-9ed5-4a31-aac5-cfb049ef8010','574deff7-0e85-4562-8868-6b8c45f71f51',NULL),('1589980a-9d33-4308-ae1c-80fddbe2be7c','2be42890-9ed5-4a31-aac5-cfb049ef8010',0,'${role_admin}','admin','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL,NULL),('172e173a-d6f3-42e1-8485-f5a6b62e4017','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_query-realms}','query-realms','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('183e0128-25f4-4d53-8740-59d8799120fe','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_manage-realm}','manage-realm','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('184e7237-c188-45ea-bf71-127cde70a5c6','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_manage-clients}','manage-clients','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('187ce72b-15b1-4c17-b196-35ea498cbe06','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,'${role_manage-account}','manage-account','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',NULL),('1baf361f-3a3b-4004-9c2c-f91a30dbfb5e','0de12368-10d1-4f4c-96f5-204ae2b3a65f',0,'${role_default-roles}','default-roles-restaurant-realm','0de12368-10d1-4f4c-96f5-204ae2b3a65f',NULL,NULL),('1f4a2997-00b3-476b-8317-f6d6db846484','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_view-authorization}','view-authorization','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('20349eda-62b1-48d5-91e0-7426edcd6b5f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_view-realm}','view-realm','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('2197f6dc-54db-4dd1-ba87-b261965909be','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_manage-clients}','manage-clients','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('24344b9e-e1a6-4b09-9de1-92b8a80383ba','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_view-events}','view-events','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('2a52d408-f4ac-4c60-ac97-9958c16e731f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_realm-admin}','realm-admin','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('2bef9930-0fbc-47dd-b06d-75487e9740af','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_manage-users}','manage-users','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('2dc21440-10f2-4d41-87d9-fe10ba419aaa','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_create-client}','create-client','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('33277570-7a1c-4812-8c53-0ec07db2c02e','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_manage-identity-providers}','manage-identity-providers','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('340c4061-0a25-4b24-8fe5-1b3cce3887e1','3d77acf1-7225-4aa5-a810-002464124601',1,NULL,'uma_protection','0de12368-10d1-4f4c-96f5-204ae2b3a65f','3d77acf1-7225-4aa5-a810-002464124601',NULL),('373d22ad-e962-4e06-ae88-704f5d5dfa3d','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_query-groups}','query-groups','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('380d72d5-8930-40d2-9b58-505a978e8479','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_view-identity-providers}','view-identity-providers','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('38d12efb-d3b4-4b84-ba40-951a2c739c9a','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_view-realm}','view-realm','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('3e912f76-45f9-4fcd-9cea-bbc790bccd83','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_manage-authorization}','manage-authorization','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('48224bb6-ff51-4b61-80df-21a79502f3c0','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_query-clients}','query-clients','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('4e4ce2a6-85f5-4cde-8c93-2565900b8e82','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_query-groups}','query-groups','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('5620f206-9c33-48b8-a849-5ba02a055de1','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_create-client}','create-client','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('5784f023-a236-40e5-ad95-365a44af19a9','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,'${role_view-applications}','view-applications','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',NULL),('59c9a259-4776-49a4-9246-0111bad81a9c','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_manage-events}','manage-events','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('5aeaba8b-aadc-483e-b0a8-394639ec76e3','2be42890-9ed5-4a31-aac5-cfb049ef8010',0,'${role_offline-access}','offline_access','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL,NULL),('650fde7c-9710-4c2e-a872-3b7cc780f182','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,'${role_delete-account}','delete-account','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',NULL),('6567c26c-de87-4954-a73f-cafe0dcef321','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_manage-identity-providers}','manage-identity-providers','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('69e51d75-dcac-422c-969d-9c8525fa9af7','6946e38e-4be9-4174-959c-5b7b6cb3a02c',1,'${role_read-token}','read-token','0de12368-10d1-4f4c-96f5-204ae2b3a65f','6946e38e-4be9-4174-959c-5b7b6cb3a02c',NULL),('73109d45-fd00-4bb5-a155-58d2e9aa2252','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_view-users}','view-users','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('7dfcb66f-d890-4bfc-91d4-ea4ce1ee8dd1','574deff7-0e85-4562-8868-6b8c45f71f51',1,'${role_manage-account}','manage-account','2be42890-9ed5-4a31-aac5-cfb049ef8010','574deff7-0e85-4562-8868-6b8c45f71f51',NULL),('7f6a8e3b-950e-44b7-b69a-061a08fbe4ee','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_query-groups}','query-groups','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('80d49966-2e7f-4213-b29c-e3215a12ea94','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_query-users}','query-users','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('818ead46-1754-44a9-a54e-7368eb57cecd','2be42890-9ed5-4a31-aac5-cfb049ef8010',0,'${role_create-realm}','create-realm','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL,NULL),('83e768c7-82f9-4ca7-99a0-6afaade0f89c','2be42890-9ed5-4a31-aac5-cfb049ef8010',0,'${role_uma_authorization}','uma_authorization','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL,NULL),('8b3b6b75-7fc1-4efc-8f0a-30100ae523aa','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_impersonation}','impersonation','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('8f9ba6f5-c1c5-4fbe-97d5-4131cd226d59','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_query-users}','query-users','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('9181d070-1509-46d6-b17f-8f077b01ea35','0de12368-10d1-4f4c-96f5-204ae2b3a65f',0,'${role_uma_authorization}','uma_authorization','0de12368-10d1-4f4c-96f5-204ae2b3a65f',NULL,NULL),('93a03cbf-5bc7-4e59-ad43-d66ff5bd8ea9','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_manage-identity-providers}','manage-identity-providers','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('96845ab5-5b92-4aa9-8c75-ed13ae871cd5','0de12368-10d1-4f4c-96f5-204ae2b3a65f',0,'${role_offline-access}','offline_access','0de12368-10d1-4f4c-96f5-204ae2b3a65f',NULL,NULL),('9735b869-c618-4ee0-83dc-a4c8133518fa','574deff7-0e85-4562-8868-6b8c45f71f51',1,'${role_view-applications}','view-applications','2be42890-9ed5-4a31-aac5-cfb049ef8010','574deff7-0e85-4562-8868-6b8c45f71f51',NULL),('97386f3c-87a0-4a3a-bf5f-3ca200f57743','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_query-realms}','query-realms','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('9ab0a6e1-da51-4caf-b19c-05051be02f9f','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_view-authorization}','view-authorization','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('9ec2d8c3-9d46-46b8-ada7-3cefced19da2','574deff7-0e85-4562-8868-6b8c45f71f51',1,'${role_delete-account}','delete-account','2be42890-9ed5-4a31-aac5-cfb049ef8010','574deff7-0e85-4562-8868-6b8c45f71f51',NULL),('9f8d30dd-5e68-43b3-8b70-054c0b78c56f','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_view-realm}','view-realm','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('a239b2a8-7555-4a99-add1-46a881babbf5','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_manage-realm}','manage-realm','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('a2cd5125-ec78-4c6b-a0c9-9203d1e543ed','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,'${role_manage-consent}','manage-consent','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',NULL),('a492f740-90a5-4042-ae04-7157bd5e0df8','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_view-events}','view-events','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('a851182b-2317-4650-b7cb-24d71f069439','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_manage-users}','manage-users','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('b2915b24-f017-4c99-a927-355d0dc46520','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_view-identity-providers}','view-identity-providers','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('b2fa9ecd-5014-4ee2-80b2-48cd48c05832','574deff7-0e85-4562-8868-6b8c45f71f51',1,'${role_manage-account-links}','manage-account-links','2be42890-9ed5-4a31-aac5-cfb049ef8010','574deff7-0e85-4562-8868-6b8c45f71f51',NULL),('b303d10b-0fe4-4e55-bd83-23f53649c64e','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,'${role_view-groups}','view-groups','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',NULL),('b371fd78-2018-4a55-89a5-f16bfe689f48','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_manage-events}','manage-events','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('b37d1471-4eb7-431b-80a1-a89b5f4fb494','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,'${role_view-profile}','view-profile','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',NULL),('b5b69292-9a2d-482d-b234-444156f23950','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_view-identity-providers}','view-identity-providers','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('b6151cdf-ffb1-48b0-894d-d52e548b2915','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_create-client}','create-client','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('b7f9e4ec-112c-4941-8d81-eba50a885043','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_manage-authorization}','manage-authorization','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('bd444252-5b94-4400-9183-b06d98992cf4','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_manage-events}','manage-events','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('c7203ab2-b5c0-4777-8b38-8ade09961450','574deff7-0e85-4562-8868-6b8c45f71f51',1,'${role_manage-consent}','manage-consent','2be42890-9ed5-4a31-aac5-cfb049ef8010','574deff7-0e85-4562-8868-6b8c45f71f51',NULL),('c9a97f90-661d-4a35-8685-a86203a0ecb7','009264f5-467a-4838-9671-d9c87fdca8da',1,'${role_read-token}','read-token','2be42890-9ed5-4a31-aac5-cfb049ef8010','009264f5-467a-4838-9671-d9c87fdca8da',NULL),('ce8ce04f-fcc5-4bcd-bfa7-35749cdc3c15','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_impersonation}','impersonation','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('cec5bd03-5622-45db-9c77-a1723d662e70','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_impersonation}','impersonation','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('cec5da13-9faa-4597-b7b4-747eb2e7340c','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_view-users}','view-users','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('cf46ebb7-9539-4232-a33a-a8375d1eb336','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_manage-clients}','manage-clients','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('d0b9bfa8-e46d-4aab-a7a4-c48cd5f6e344','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_manage-authorization}','manage-authorization','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('d26348b8-1315-4d4d-b292-e5d44b385378','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',1,'${role_manage-account-links}','manage-account-links','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ba76ad0a-7252-4f09-9fc1-c0f6ee35c922',NULL),('d48a90bb-6d42-4439-ab8f-e43aba722360','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_view-clients}','view-clients','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('d54ea6ed-1a94-4a0a-9a04-2f645b6dc556','574deff7-0e85-4562-8868-6b8c45f71f51',1,'${role_view-consent}','view-consent','2be42890-9ed5-4a31-aac5-cfb049ef8010','574deff7-0e85-4562-8868-6b8c45f71f51',NULL),('ddc22ba3-b6a6-40cd-ad07-ed53b8618b75','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_query-clients}','query-clients','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('e6b1f430-0338-4098-8579-0b1bbcaff89b','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_view-events}','view-events','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('e7ba78a3-ebf3-4e5f-8e59-049600725289','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_query-users}','query-users','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL),('efcb1ff3-266e-4e3d-9d0f-3e4113cacbe7','2be42890-9ed5-4a31-aac5-cfb049ef8010',0,'${role_default-roles}','default-roles-master','2be42890-9ed5-4a31-aac5-cfb049ef8010',NULL,NULL),('f2211139-ae08-4286-a880-1a0844f61fe6','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_view-users}','view-users','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('f830e9c4-4644-404f-9c78-f941657b2ba6','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1,'${role_view-authorization}','view-authorization','2be42890-9ed5-4a31-aac5-cfb049ef8010','ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',NULL),('fa8cc133-c4d6-41d4-bb72-e0149892eb9e','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',1,'${role_query-clients}','query-clients','0de12368-10d1-4f4c-96f5-204ae2b3a65f','a80b83d8-3744-4ae2-ba76-f0e9ff29531e',NULL),('fc77f542-4b34-41f4-86f6-19df768ec845','c05f799d-b526-434a-b3c5-61a1ed8a4362',1,'${role_manage-realm}','manage-realm','2be42890-9ed5-4a31-aac5-cfb049ef8010','c05f799d-b526-434a-b3c5-61a1ed8a4362',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VERSION` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('51cyk','24.0.3',1719159448);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext COLLATE utf8mb4_unicode_ci,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATA` longtext COLLATE utf8mb4_unicode_ci,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('05736ebf-5734-4ff7-ab14-ae7c99773d2d','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('06ad0396-74f0-4b61-828a-7ce4694a8bb5','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('1311536e-1379-4645-8178-b6ff522128e0','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'32d34b3d-07f1-4966-862b-8a04cb028c64'),('16cce521-986e-4599-804d-fde44d9895d4','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('19af1730-27d2-4897-aaf3-1b0f47cf3da4','role list','saml','saml-role-list-mapper',NULL,'4f5f6b73-23e0-4903-bbf0-39d87ad7ab66'),('1c6646b2-7394-4091-9697-bc54cce7704c','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'d9a0da6e-b085-437b-9ca6-de32fc3fb622'),('1c70310c-a538-4c09-84ad-b779c48e5151','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('20dccb45-e29e-421f-b551-8c970f2a1f10','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('263ffd24-7b85-4491-8e0c-b53b07623625','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'d17dbf91-9e1b-4dbb-9926-ba19be3f5a40'),('274fe7f9-2cc0-4be3-9c48-bbde6fa6491a','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'f4fc149d-a175-42fa-978f-45c35acdb989'),('281b52fb-63fc-457c-bf9e-a967881f0cea','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','3d77acf1-7225-4aa5-a810-002464124601',NULL),('2bb1c36e-9291-49f9-aa6e-293ed936f6ac','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'08a51162-503e-49c7-9a53-9d042a4c8293'),('2d7e0801-3f95-4952-8e6b-338b74354b5d','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'090549be-0026-41ff-a3cd-6200a6b1cf01'),('2e9c9572-044d-4d9a-b855-519ac332f267','full name','openid-connect','oidc-full-name-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('3089bb01-64cb-4d4a-ada9-b2e20ff4bd0c','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('314c4d5a-e60e-4385-8f9e-c8be83852bbb','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('46be56f7-d673-4318-b0b0-47b264f46979','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('4a191524-3d1c-49d1-9ec4-1dfe8e7a3cdf','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('5117a88c-8067-4328-b612-2413f9f3b05a','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('51320044-f8bc-4d7f-9e84-374d4d40a22d','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'32d34b3d-07f1-4966-862b-8a04cb028c64'),('54d0fbd4-97be-428c-b7a8-3adb99c0c8ed','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'641ecb74-9634-43b6-821b-5ca345f182c0'),('55281bba-d690-4d94-b2c4-6b3b9c293539','audience resolve','openid-connect','oidc-audience-resolve-mapper','a7bb59cb-28ee-4d6e-88ca-5419098fc9b6',NULL),('55c5da0f-5d18-48e5-b3a5-5fa1b301b51f','locale','openid-connect','oidc-usermodel-attribute-mapper','ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02',NULL),('5734067d-558e-419b-aefd-46504261df5f','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('5b1ff5f6-50f3-48a3-9316-a8b502e14923','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('6423d64c-b4d4-458b-96ce-244281ea9030','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'d9a0da6e-b085-437b-9ca6-de32fc3fb622'),('65309a59-c4b7-4544-bf54-c3e4caae6d32','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('66114d53-205c-4bc6-a7fb-4090a1a6065c','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('680c3582-8bee-4dda-b9e5-9efdb28115ce','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','3d77acf1-7225-4aa5-a810-002464124601',NULL),('68851d51-d374-42e7-802c-d8da5244da0c','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','3d77acf1-7225-4aa5-a810-002464124601',NULL),('68cfa1d2-7961-4c0c-8161-6e7462aed3c7','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'641ecb74-9634-43b6-821b-5ca345f182c0'),('6a52c647-8f7c-48f9-98a8-6d41e6b7f351','acr loa level','openid-connect','oidc-acr-mapper',NULL,'aa6f38b4-2a67-4590-aed1-af884184e92f'),('6ea1b6bb-626d-40c3-ba46-a17e1f65a27b','full name','openid-connect','oidc-full-name-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('72349e03-5a72-4283-ab04-7fd27c7fa3e1','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'08a51162-503e-49c7-9a53-9d042a4c8293'),('72f34064-00bc-4f9a-a1c6-2623814fba28','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('76b5294b-93b6-4af2-9ea5-accf4daa434a','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('77d74e52-0cee-4217-aada-ac3834ad7232','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'f4fc149d-a175-42fa-978f-45c35acdb989'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','address','openid-connect','oidc-address-mapper',NULL,'e7afdbca-4b84-454b-9a50-baad8fd7a4ee'),('7bab29f3-3175-4605-bfaf-a0f5c4145dee','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'65964179-4343-4f2c-87ad-f0f593ee6705'),('8573ebdf-e331-458c-b12e-17be3c334715','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('8610b326-43b2-47e8-8d97-2b13b4f9f06f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('86edc6eb-c2d8-412f-8ea4-54d410752c82','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'f4fc149d-a175-42fa-978f-45c35acdb989'),('a0421a7a-f56f-46ec-aab1-c2e88f01a080','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('a2ba6ef4-ae0c-4ffd-bf13-2d3c2f1d20ba','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('a9f11499-8f6c-4200-930d-efb71dce9465','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'090549be-0026-41ff-a3cd-6200a6b1cf01'),('af167923-2d71-40fe-ab30-6acbb363d202','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3975d4fd-afbd-4a3f-85e2-b21192c62ba8'),('b1d22b65-1878-4c6b-a6a7-bdcce55bfbfd','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'89732083-86ee-490f-8776-6c13cb8d0718'),('b1f551ff-e16c-4460-8589-7541f0322d0b','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('b23af258-9720-4e66-853f-e8a2999ba277','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3975d4fd-afbd-4a3f-85e2-b21192c62ba8'),('c2b411cc-e2b2-4827-a38a-4b9f45d8dbdb','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'89732083-86ee-490f-8776-6c13cb8d0718'),('c451d76b-0440-4114-83d1-f4d43b424565','address','openid-connect','oidc-address-mapper',NULL,'febbb6b2-778e-4fbf-a9ea-d08bf5428c45'),('d64c6072-65a8-4f00-a7b9-42aae452892c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('d8b77061-324d-475c-b54c-42d3b4913849','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('da106bef-9a82-4876-ab23-24742cbd35ad','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cba51c78-c24c-4693-8d70-23bc0c7bfbc1'),('ea252ab3-3167-4772-8c3c-69541b29607c','locale','openid-connect','oidc-usermodel-attribute-mapper','d6c5662a-c3f0-4bd8-aa5e-249229207bb1',NULL),('f0ea0b6a-d50c-4af0-a13a-98b398942416','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'08a51162-503e-49c7-9a53-9d042a4c8293'),('f5435386-b368-4109-b12e-da558764e3f8','role list','saml','saml-role-list-mapper',NULL,'6d150f50-3b4a-4943-8328-6f043be7a03b'),('f7a6ef2b-c472-48d2-8c73-ef5b88465468','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ad67727d-28ca-4de7-b179-2c98863aaa96'),('fb2c97bd-478a-4444-80a9-6b816d713e7a','audience resolve','openid-connect','oidc-audience-resolve-mapper','e093e353-9df1-4777-9a0b-91e3c6938f0a',NULL),('fd97f3f1-16e7-45cb-9f92-5c3b334263dc','acr loa level','openid-connect','oidc-acr-mapper',NULL,'a5de2d90-e8f6-48bb-b484-e7d211645c26');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('05736ebf-5734-4ff7-ab14-ae7c99773d2d','true','access.token.claim'),('05736ebf-5734-4ff7-ab14-ae7c99773d2d','locale','claim.name'),('05736ebf-5734-4ff7-ab14-ae7c99773d2d','true','id.token.claim'),('05736ebf-5734-4ff7-ab14-ae7c99773d2d','true','introspection.token.claim'),('05736ebf-5734-4ff7-ab14-ae7c99773d2d','String','jsonType.label'),('05736ebf-5734-4ff7-ab14-ae7c99773d2d','locale','user.attribute'),('05736ebf-5734-4ff7-ab14-ae7c99773d2d','true','userinfo.token.claim'),('06ad0396-74f0-4b61-828a-7ce4694a8bb5','true','access.token.claim'),('06ad0396-74f0-4b61-828a-7ce4694a8bb5','family_name','claim.name'),('06ad0396-74f0-4b61-828a-7ce4694a8bb5','true','id.token.claim'),('06ad0396-74f0-4b61-828a-7ce4694a8bb5','true','introspection.token.claim'),('06ad0396-74f0-4b61-828a-7ce4694a8bb5','String','jsonType.label'),('06ad0396-74f0-4b61-828a-7ce4694a8bb5','lastName','user.attribute'),('06ad0396-74f0-4b61-828a-7ce4694a8bb5','true','userinfo.token.claim'),('1311536e-1379-4645-8178-b6ff522128e0','true','access.token.claim'),('1311536e-1379-4645-8178-b6ff522128e0','gender','claim.name'),('1311536e-1379-4645-8178-b6ff522128e0','true','id.token.claim'),('1311536e-1379-4645-8178-b6ff522128e0','true','introspection.token.claim'),('1311536e-1379-4645-8178-b6ff522128e0','String','jsonType.label'),('1311536e-1379-4645-8178-b6ff522128e0','gender','user.attribute'),('1311536e-1379-4645-8178-b6ff522128e0','true','userinfo.token.claim'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','true','access.token.claim'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','groups','claim.name'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','true','id.token.claim'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','true','introspection.token.claim'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','String','jsonType.label'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','true','multivalued'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','foo','user.attribute'),('1658741c-6d4d-4780-a5de-3f66c86ecb97','true','userinfo.token.claim'),('16cce521-986e-4599-804d-fde44d9895d4','true','access.token.claim'),('16cce521-986e-4599-804d-fde44d9895d4','profile','claim.name'),('16cce521-986e-4599-804d-fde44d9895d4','true','id.token.claim'),('16cce521-986e-4599-804d-fde44d9895d4','true','introspection.token.claim'),('16cce521-986e-4599-804d-fde44d9895d4','String','jsonType.label'),('16cce521-986e-4599-804d-fde44d9895d4','profile','user.attribute'),('16cce521-986e-4599-804d-fde44d9895d4','true','userinfo.token.claim'),('19af1730-27d2-4897-aaf3-1b0f47cf3da4','Role','attribute.name'),('19af1730-27d2-4897-aaf3-1b0f47cf3da4','Basic','attribute.nameformat'),('19af1730-27d2-4897-aaf3-1b0f47cf3da4','false','single'),('1c6646b2-7394-4091-9697-bc54cce7704c','true','access.token.claim'),('1c6646b2-7394-4091-9697-bc54cce7704c','email_verified','claim.name'),('1c6646b2-7394-4091-9697-bc54cce7704c','true','id.token.claim'),('1c6646b2-7394-4091-9697-bc54cce7704c','true','introspection.token.claim'),('1c6646b2-7394-4091-9697-bc54cce7704c','boolean','jsonType.label'),('1c6646b2-7394-4091-9697-bc54cce7704c','emailVerified','user.attribute'),('1c6646b2-7394-4091-9697-bc54cce7704c','true','userinfo.token.claim'),('1c70310c-a538-4c09-84ad-b779c48e5151','true','access.token.claim'),('1c70310c-a538-4c09-84ad-b779c48e5151','zoneinfo','claim.name'),('1c70310c-a538-4c09-84ad-b779c48e5151','true','id.token.claim'),('1c70310c-a538-4c09-84ad-b779c48e5151','true','introspection.token.claim'),('1c70310c-a538-4c09-84ad-b779c48e5151','String','jsonType.label'),('1c70310c-a538-4c09-84ad-b779c48e5151','zoneinfo','user.attribute'),('1c70310c-a538-4c09-84ad-b779c48e5151','true','userinfo.token.claim'),('20dccb45-e29e-421f-b551-8c970f2a1f10','true','access.token.claim'),('20dccb45-e29e-421f-b551-8c970f2a1f10','locale','claim.name'),('20dccb45-e29e-421f-b551-8c970f2a1f10','true','id.token.claim'),('20dccb45-e29e-421f-b551-8c970f2a1f10','true','introspection.token.claim'),('20dccb45-e29e-421f-b551-8c970f2a1f10','String','jsonType.label'),('20dccb45-e29e-421f-b551-8c970f2a1f10','locale','user.attribute'),('20dccb45-e29e-421f-b551-8c970f2a1f10','true','userinfo.token.claim'),('263ffd24-7b85-4491-8e0c-b53b07623625','true','access.token.claim'),('263ffd24-7b85-4491-8e0c-b53b07623625','true','introspection.token.claim'),('274fe7f9-2cc0-4be3-9c48-bbde6fa6491a','true','access.token.claim'),('274fe7f9-2cc0-4be3-9c48-bbde6fa6491a','realm_access.roles','claim.name'),('274fe7f9-2cc0-4be3-9c48-bbde6fa6491a','true','introspection.token.claim'),('274fe7f9-2cc0-4be3-9c48-bbde6fa6491a','String','jsonType.label'),('274fe7f9-2cc0-4be3-9c48-bbde6fa6491a','true','multivalued'),('274fe7f9-2cc0-4be3-9c48-bbde6fa6491a','foo','user.attribute'),('281b52fb-63fc-457c-bf9e-a967881f0cea','true','access.token.claim'),('281b52fb-63fc-457c-bf9e-a967881f0cea','clientAddress','claim.name'),('281b52fb-63fc-457c-bf9e-a967881f0cea','true','id.token.claim'),('281b52fb-63fc-457c-bf9e-a967881f0cea','true','introspection.token.claim'),('281b52fb-63fc-457c-bf9e-a967881f0cea','String','jsonType.label'),('281b52fb-63fc-457c-bf9e-a967881f0cea','clientAddress','user.session.note'),('281b52fb-63fc-457c-bf9e-a967881f0cea','true','userinfo.token.claim'),('2bb1c36e-9291-49f9-aa6e-293ed936f6ac','true','access.token.claim'),('2bb1c36e-9291-49f9-aa6e-293ed936f6ac','true','introspection.token.claim'),('2d7e0801-3f95-4952-8e6b-338b74354b5d','true','access.token.claim'),('2d7e0801-3f95-4952-8e6b-338b74354b5d','groups','claim.name'),('2d7e0801-3f95-4952-8e6b-338b74354b5d','true','id.token.claim'),('2d7e0801-3f95-4952-8e6b-338b74354b5d','true','introspection.token.claim'),('2d7e0801-3f95-4952-8e6b-338b74354b5d','String','jsonType.label'),('2d7e0801-3f95-4952-8e6b-338b74354b5d','true','multivalued'),('2d7e0801-3f95-4952-8e6b-338b74354b5d','foo','user.attribute'),('2e9c9572-044d-4d9a-b855-519ac332f267','true','access.token.claim'),('2e9c9572-044d-4d9a-b855-519ac332f267','true','id.token.claim'),('2e9c9572-044d-4d9a-b855-519ac332f267','true','introspection.token.claim'),('2e9c9572-044d-4d9a-b855-519ac332f267','true','userinfo.token.claim'),('3089bb01-64cb-4d4a-ada9-b2e20ff4bd0c','true','access.token.claim'),('3089bb01-64cb-4d4a-ada9-b2e20ff4bd0c','website','claim.name'),('3089bb01-64cb-4d4a-ada9-b2e20ff4bd0c','true','id.token.claim'),('3089bb01-64cb-4d4a-ada9-b2e20ff4bd0c','true','introspection.token.claim'),('3089bb01-64cb-4d4a-ada9-b2e20ff4bd0c','String','jsonType.label'),('3089bb01-64cb-4d4a-ada9-b2e20ff4bd0c','website','user.attribute'),('3089bb01-64cb-4d4a-ada9-b2e20ff4bd0c','true','userinfo.token.claim'),('314c4d5a-e60e-4385-8f9e-c8be83852bbb','true','access.token.claim'),('314c4d5a-e60e-4385-8f9e-c8be83852bbb','picture','claim.name'),('314c4d5a-e60e-4385-8f9e-c8be83852bbb','true','id.token.claim'),('314c4d5a-e60e-4385-8f9e-c8be83852bbb','true','introspection.token.claim'),('314c4d5a-e60e-4385-8f9e-c8be83852bbb','String','jsonType.label'),('314c4d5a-e60e-4385-8f9e-c8be83852bbb','picture','user.attribute'),('314c4d5a-e60e-4385-8f9e-c8be83852bbb','true','userinfo.token.claim'),('46be56f7-d673-4318-b0b0-47b264f46979','true','access.token.claim'),('46be56f7-d673-4318-b0b0-47b264f46979','website','claim.name'),('46be56f7-d673-4318-b0b0-47b264f46979','true','id.token.claim'),('46be56f7-d673-4318-b0b0-47b264f46979','true','introspection.token.claim'),('46be56f7-d673-4318-b0b0-47b264f46979','String','jsonType.label'),('46be56f7-d673-4318-b0b0-47b264f46979','website','user.attribute'),('46be56f7-d673-4318-b0b0-47b264f46979','true','userinfo.token.claim'),('4a191524-3d1c-49d1-9ec4-1dfe8e7a3cdf','true','access.token.claim'),('4a191524-3d1c-49d1-9ec4-1dfe8e7a3cdf','middle_name','claim.name'),('4a191524-3d1c-49d1-9ec4-1dfe8e7a3cdf','true','id.token.claim'),('4a191524-3d1c-49d1-9ec4-1dfe8e7a3cdf','true','introspection.token.claim'),('4a191524-3d1c-49d1-9ec4-1dfe8e7a3cdf','String','jsonType.label'),('4a191524-3d1c-49d1-9ec4-1dfe8e7a3cdf','middleName','user.attribute'),('4a191524-3d1c-49d1-9ec4-1dfe8e7a3cdf','true','userinfo.token.claim'),('5117a88c-8067-4328-b612-2413f9f3b05a','true','access.token.claim'),('5117a88c-8067-4328-b612-2413f9f3b05a','gender','claim.name'),('5117a88c-8067-4328-b612-2413f9f3b05a','true','id.token.claim'),('5117a88c-8067-4328-b612-2413f9f3b05a','true','introspection.token.claim'),('5117a88c-8067-4328-b612-2413f9f3b05a','String','jsonType.label'),('5117a88c-8067-4328-b612-2413f9f3b05a','gender','user.attribute'),('5117a88c-8067-4328-b612-2413f9f3b05a','true','userinfo.token.claim'),('51320044-f8bc-4d7f-9e84-374d4d40a22d','true','access.token.claim'),('51320044-f8bc-4d7f-9e84-374d4d40a22d','upn','claim.name'),('51320044-f8bc-4d7f-9e84-374d4d40a22d','true','id.token.claim'),('51320044-f8bc-4d7f-9e84-374d4d40a22d','true','introspection.token.claim'),('51320044-f8bc-4d7f-9e84-374d4d40a22d','String','jsonType.label'),('51320044-f8bc-4d7f-9e84-374d4d40a22d','username','user.attribute'),('51320044-f8bc-4d7f-9e84-374d4d40a22d','true','userinfo.token.claim'),('54d0fbd4-97be-428c-b7a8-3adb99c0c8ed','true','access.token.claim'),('54d0fbd4-97be-428c-b7a8-3adb99c0c8ed','phone_number_verified','claim.name'),('54d0fbd4-97be-428c-b7a8-3adb99c0c8ed','true','id.token.claim'),('54d0fbd4-97be-428c-b7a8-3adb99c0c8ed','true','introspection.token.claim'),('54d0fbd4-97be-428c-b7a8-3adb99c0c8ed','boolean','jsonType.label'),('54d0fbd4-97be-428c-b7a8-3adb99c0c8ed','phoneNumberVerified','user.attribute'),('54d0fbd4-97be-428c-b7a8-3adb99c0c8ed','true','userinfo.token.claim'),('55c5da0f-5d18-48e5-b3a5-5fa1b301b51f','true','access.token.claim'),('55c5da0f-5d18-48e5-b3a5-5fa1b301b51f','locale','claim.name'),('55c5da0f-5d18-48e5-b3a5-5fa1b301b51f','true','id.token.claim'),('55c5da0f-5d18-48e5-b3a5-5fa1b301b51f','true','introspection.token.claim'),('55c5da0f-5d18-48e5-b3a5-5fa1b301b51f','String','jsonType.label'),('55c5da0f-5d18-48e5-b3a5-5fa1b301b51f','locale','user.attribute'),('55c5da0f-5d18-48e5-b3a5-5fa1b301b51f','true','userinfo.token.claim'),('5734067d-558e-419b-aefd-46504261df5f','true','access.token.claim'),('5734067d-558e-419b-aefd-46504261df5f','preferred_username','claim.name'),('5734067d-558e-419b-aefd-46504261df5f','true','id.token.claim'),('5734067d-558e-419b-aefd-46504261df5f','true','introspection.token.claim'),('5734067d-558e-419b-aefd-46504261df5f','String','jsonType.label'),('5734067d-558e-419b-aefd-46504261df5f','username','user.attribute'),('5734067d-558e-419b-aefd-46504261df5f','true','userinfo.token.claim'),('5b1ff5f6-50f3-48a3-9316-a8b502e14923','true','access.token.claim'),('5b1ff5f6-50f3-48a3-9316-a8b502e14923','birthdate','claim.name'),('5b1ff5f6-50f3-48a3-9316-a8b502e14923','true','id.token.claim'),('5b1ff5f6-50f3-48a3-9316-a8b502e14923','true','introspection.token.claim'),('5b1ff5f6-50f3-48a3-9316-a8b502e14923','String','jsonType.label'),('5b1ff5f6-50f3-48a3-9316-a8b502e14923','birthdate','user.attribute'),('5b1ff5f6-50f3-48a3-9316-a8b502e14923','true','userinfo.token.claim'),('6423d64c-b4d4-458b-96ce-244281ea9030','true','access.token.claim'),('6423d64c-b4d4-458b-96ce-244281ea9030','email','claim.name'),('6423d64c-b4d4-458b-96ce-244281ea9030','true','id.token.claim'),('6423d64c-b4d4-458b-96ce-244281ea9030','true','introspection.token.claim'),('6423d64c-b4d4-458b-96ce-244281ea9030','String','jsonType.label'),('6423d64c-b4d4-458b-96ce-244281ea9030','email','user.attribute'),('6423d64c-b4d4-458b-96ce-244281ea9030','true','userinfo.token.claim'),('65309a59-c4b7-4544-bf54-c3e4caae6d32','true','access.token.claim'),('65309a59-c4b7-4544-bf54-c3e4caae6d32','preferred_username','claim.name'),('65309a59-c4b7-4544-bf54-c3e4caae6d32','true','id.token.claim'),('65309a59-c4b7-4544-bf54-c3e4caae6d32','true','introspection.token.claim'),('65309a59-c4b7-4544-bf54-c3e4caae6d32','String','jsonType.label'),('65309a59-c4b7-4544-bf54-c3e4caae6d32','username','user.attribute'),('65309a59-c4b7-4544-bf54-c3e4caae6d32','true','userinfo.token.claim'),('66114d53-205c-4bc6-a7fb-4090a1a6065c','true','access.token.claim'),('66114d53-205c-4bc6-a7fb-4090a1a6065c','given_name','claim.name'),('66114d53-205c-4bc6-a7fb-4090a1a6065c','true','id.token.claim'),('66114d53-205c-4bc6-a7fb-4090a1a6065c','true','introspection.token.claim'),('66114d53-205c-4bc6-a7fb-4090a1a6065c','String','jsonType.label'),('66114d53-205c-4bc6-a7fb-4090a1a6065c','firstName','user.attribute'),('66114d53-205c-4bc6-a7fb-4090a1a6065c','true','userinfo.token.claim'),('680c3582-8bee-4dda-b9e5-9efdb28115ce','true','access.token.claim'),('680c3582-8bee-4dda-b9e5-9efdb28115ce','clientHost','claim.name'),('680c3582-8bee-4dda-b9e5-9efdb28115ce','true','id.token.claim'),('680c3582-8bee-4dda-b9e5-9efdb28115ce','true','introspection.token.claim'),('680c3582-8bee-4dda-b9e5-9efdb28115ce','String','jsonType.label'),('680c3582-8bee-4dda-b9e5-9efdb28115ce','clientHost','user.session.note'),('680c3582-8bee-4dda-b9e5-9efdb28115ce','true','userinfo.token.claim'),('68851d51-d374-42e7-802c-d8da5244da0c','true','access.token.claim'),('68851d51-d374-42e7-802c-d8da5244da0c','client_id','claim.name'),('68851d51-d374-42e7-802c-d8da5244da0c','true','id.token.claim'),('68851d51-d374-42e7-802c-d8da5244da0c','true','introspection.token.claim'),('68851d51-d374-42e7-802c-d8da5244da0c','String','jsonType.label'),('68851d51-d374-42e7-802c-d8da5244da0c','client_id','user.session.note'),('68851d51-d374-42e7-802c-d8da5244da0c','true','userinfo.token.claim'),('68cfa1d2-7961-4c0c-8161-6e7462aed3c7','true','access.token.claim'),('68cfa1d2-7961-4c0c-8161-6e7462aed3c7','phone_number','claim.name'),('68cfa1d2-7961-4c0c-8161-6e7462aed3c7','true','id.token.claim'),('68cfa1d2-7961-4c0c-8161-6e7462aed3c7','true','introspection.token.claim'),('68cfa1d2-7961-4c0c-8161-6e7462aed3c7','String','jsonType.label'),('68cfa1d2-7961-4c0c-8161-6e7462aed3c7','phoneNumber','user.attribute'),('68cfa1d2-7961-4c0c-8161-6e7462aed3c7','true','userinfo.token.claim'),('6a52c647-8f7c-48f9-98a8-6d41e6b7f351','true','access.token.claim'),('6a52c647-8f7c-48f9-98a8-6d41e6b7f351','true','id.token.claim'),('6a52c647-8f7c-48f9-98a8-6d41e6b7f351','true','introspection.token.claim'),('6ea1b6bb-626d-40c3-ba46-a17e1f65a27b','true','access.token.claim'),('6ea1b6bb-626d-40c3-ba46-a17e1f65a27b','true','id.token.claim'),('6ea1b6bb-626d-40c3-ba46-a17e1f65a27b','true','introspection.token.claim'),('6ea1b6bb-626d-40c3-ba46-a17e1f65a27b','true','userinfo.token.claim'),('72349e03-5a72-4283-ab04-7fd27c7fa3e1','true','access.token.claim'),('72349e03-5a72-4283-ab04-7fd27c7fa3e1','realm_access.roles','claim.name'),('72349e03-5a72-4283-ab04-7fd27c7fa3e1','true','introspection.token.claim'),('72349e03-5a72-4283-ab04-7fd27c7fa3e1','String','jsonType.label'),('72349e03-5a72-4283-ab04-7fd27c7fa3e1','true','multivalued'),('72349e03-5a72-4283-ab04-7fd27c7fa3e1','foo','user.attribute'),('72f34064-00bc-4f9a-a1c6-2623814fba28','true','access.token.claim'),('72f34064-00bc-4f9a-a1c6-2623814fba28','updated_at','claim.name'),('72f34064-00bc-4f9a-a1c6-2623814fba28','true','id.token.claim'),('72f34064-00bc-4f9a-a1c6-2623814fba28','true','introspection.token.claim'),('72f34064-00bc-4f9a-a1c6-2623814fba28','long','jsonType.label'),('72f34064-00bc-4f9a-a1c6-2623814fba28','updatedAt','user.attribute'),('72f34064-00bc-4f9a-a1c6-2623814fba28','true','userinfo.token.claim'),('76b5294b-93b6-4af2-9ea5-accf4daa434a','true','access.token.claim'),('76b5294b-93b6-4af2-9ea5-accf4daa434a','updated_at','claim.name'),('76b5294b-93b6-4af2-9ea5-accf4daa434a','true','id.token.claim'),('76b5294b-93b6-4af2-9ea5-accf4daa434a','true','introspection.token.claim'),('76b5294b-93b6-4af2-9ea5-accf4daa434a','long','jsonType.label'),('76b5294b-93b6-4af2-9ea5-accf4daa434a','updatedAt','user.attribute'),('76b5294b-93b6-4af2-9ea5-accf4daa434a','true','userinfo.token.claim'),('77d74e52-0cee-4217-aada-ac3834ad7232','true','access.token.claim'),('77d74e52-0cee-4217-aada-ac3834ad7232','true','introspection.token.claim'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','true','access.token.claim'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','true','id.token.claim'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','true','introspection.token.claim'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','country','user.attribute.country'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','formatted','user.attribute.formatted'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','locality','user.attribute.locality'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','postal_code','user.attribute.postal_code'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','region','user.attribute.region'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','street','user.attribute.street'),('77ff2744-15da-4c22-8ef3-149bd5c814b8','true','userinfo.token.claim'),('7bab29f3-3175-4605-bfaf-a0f5c4145dee','true','access.token.claim'),('7bab29f3-3175-4605-bfaf-a0f5c4145dee','true','introspection.token.claim'),('8573ebdf-e331-458c-b12e-17be3c334715','true','access.token.claim'),('8573ebdf-e331-458c-b12e-17be3c334715','nickname','claim.name'),('8573ebdf-e331-458c-b12e-17be3c334715','true','id.token.claim'),('8573ebdf-e331-458c-b12e-17be3c334715','true','introspection.token.claim'),('8573ebdf-e331-458c-b12e-17be3c334715','String','jsonType.label'),('8573ebdf-e331-458c-b12e-17be3c334715','nickname','user.attribute'),('8573ebdf-e331-458c-b12e-17be3c334715','true','userinfo.token.claim'),('8610b326-43b2-47e8-8d97-2b13b4f9f06f','true','access.token.claim'),('8610b326-43b2-47e8-8d97-2b13b4f9f06f','birthdate','claim.name'),('8610b326-43b2-47e8-8d97-2b13b4f9f06f','true','id.token.claim'),('8610b326-43b2-47e8-8d97-2b13b4f9f06f','true','introspection.token.claim'),('8610b326-43b2-47e8-8d97-2b13b4f9f06f','String','jsonType.label'),('8610b326-43b2-47e8-8d97-2b13b4f9f06f','birthdate','user.attribute'),('8610b326-43b2-47e8-8d97-2b13b4f9f06f','true','userinfo.token.claim'),('86edc6eb-c2d8-412f-8ea4-54d410752c82','true','access.token.claim'),('86edc6eb-c2d8-412f-8ea4-54d410752c82','resource_access.${client_id}.roles','claim.name'),('86edc6eb-c2d8-412f-8ea4-54d410752c82','true','introspection.token.claim'),('86edc6eb-c2d8-412f-8ea4-54d410752c82','String','jsonType.label'),('86edc6eb-c2d8-412f-8ea4-54d410752c82','true','multivalued'),('86edc6eb-c2d8-412f-8ea4-54d410752c82','foo','user.attribute'),('a0421a7a-f56f-46ec-aab1-c2e88f01a080','true','access.token.claim'),('a0421a7a-f56f-46ec-aab1-c2e88f01a080','zoneinfo','claim.name'),('a0421a7a-f56f-46ec-aab1-c2e88f01a080','true','id.token.claim'),('a0421a7a-f56f-46ec-aab1-c2e88f01a080','true','introspection.token.claim'),('a0421a7a-f56f-46ec-aab1-c2e88f01a080','String','jsonType.label'),('a0421a7a-f56f-46ec-aab1-c2e88f01a080','zoneinfo','user.attribute'),('a0421a7a-f56f-46ec-aab1-c2e88f01a080','true','userinfo.token.claim'),('a2ba6ef4-ae0c-4ffd-bf13-2d3c2f1d20ba','true','access.token.claim'),('a2ba6ef4-ae0c-4ffd-bf13-2d3c2f1d20ba','nickname','claim.name'),('a2ba6ef4-ae0c-4ffd-bf13-2d3c2f1d20ba','true','id.token.claim'),('a2ba6ef4-ae0c-4ffd-bf13-2d3c2f1d20ba','true','introspection.token.claim'),('a2ba6ef4-ae0c-4ffd-bf13-2d3c2f1d20ba','String','jsonType.label'),('a2ba6ef4-ae0c-4ffd-bf13-2d3c2f1d20ba','nickname','user.attribute'),('a2ba6ef4-ae0c-4ffd-bf13-2d3c2f1d20ba','true','userinfo.token.claim'),('a9f11499-8f6c-4200-930d-efb71dce9465','true','access.token.claim'),('a9f11499-8f6c-4200-930d-efb71dce9465','upn','claim.name'),('a9f11499-8f6c-4200-930d-efb71dce9465','true','id.token.claim'),('a9f11499-8f6c-4200-930d-efb71dce9465','true','introspection.token.claim'),('a9f11499-8f6c-4200-930d-efb71dce9465','String','jsonType.label'),('a9f11499-8f6c-4200-930d-efb71dce9465','username','user.attribute'),('a9f11499-8f6c-4200-930d-efb71dce9465','true','userinfo.token.claim'),('af167923-2d71-40fe-ab30-6acbb363d202','true','access.token.claim'),('af167923-2d71-40fe-ab30-6acbb363d202','phone_number_verified','claim.name'),('af167923-2d71-40fe-ab30-6acbb363d202','true','id.token.claim'),('af167923-2d71-40fe-ab30-6acbb363d202','true','introspection.token.claim'),('af167923-2d71-40fe-ab30-6acbb363d202','boolean','jsonType.label'),('af167923-2d71-40fe-ab30-6acbb363d202','phoneNumberVerified','user.attribute'),('af167923-2d71-40fe-ab30-6acbb363d202','true','userinfo.token.claim'),('b1d22b65-1878-4c6b-a6a7-bdcce55bfbfd','true','access.token.claim'),('b1d22b65-1878-4c6b-a6a7-bdcce55bfbfd','email','claim.name'),('b1d22b65-1878-4c6b-a6a7-bdcce55bfbfd','true','id.token.claim'),('b1d22b65-1878-4c6b-a6a7-bdcce55bfbfd','true','introspection.token.claim'),('b1d22b65-1878-4c6b-a6a7-bdcce55bfbfd','String','jsonType.label'),('b1d22b65-1878-4c6b-a6a7-bdcce55bfbfd','email','user.attribute'),('b1d22b65-1878-4c6b-a6a7-bdcce55bfbfd','true','userinfo.token.claim'),('b1f551ff-e16c-4460-8589-7541f0322d0b','true','access.token.claim'),('b1f551ff-e16c-4460-8589-7541f0322d0b','family_name','claim.name'),('b1f551ff-e16c-4460-8589-7541f0322d0b','true','id.token.claim'),('b1f551ff-e16c-4460-8589-7541f0322d0b','true','introspection.token.claim'),('b1f551ff-e16c-4460-8589-7541f0322d0b','String','jsonType.label'),('b1f551ff-e16c-4460-8589-7541f0322d0b','lastName','user.attribute'),('b1f551ff-e16c-4460-8589-7541f0322d0b','true','userinfo.token.claim'),('b23af258-9720-4e66-853f-e8a2999ba277','true','access.token.claim'),('b23af258-9720-4e66-853f-e8a2999ba277','phone_number','claim.name'),('b23af258-9720-4e66-853f-e8a2999ba277','true','id.token.claim'),('b23af258-9720-4e66-853f-e8a2999ba277','true','introspection.token.claim'),('b23af258-9720-4e66-853f-e8a2999ba277','String','jsonType.label'),('b23af258-9720-4e66-853f-e8a2999ba277','phoneNumber','user.attribute'),('b23af258-9720-4e66-853f-e8a2999ba277','true','userinfo.token.claim'),('c2b411cc-e2b2-4827-a38a-4b9f45d8dbdb','true','access.token.claim'),('c2b411cc-e2b2-4827-a38a-4b9f45d8dbdb','email_verified','claim.name'),('c2b411cc-e2b2-4827-a38a-4b9f45d8dbdb','true','id.token.claim'),('c2b411cc-e2b2-4827-a38a-4b9f45d8dbdb','true','introspection.token.claim'),('c2b411cc-e2b2-4827-a38a-4b9f45d8dbdb','boolean','jsonType.label'),('c2b411cc-e2b2-4827-a38a-4b9f45d8dbdb','emailVerified','user.attribute'),('c2b411cc-e2b2-4827-a38a-4b9f45d8dbdb','true','userinfo.token.claim'),('c451d76b-0440-4114-83d1-f4d43b424565','true','access.token.claim'),('c451d76b-0440-4114-83d1-f4d43b424565','true','id.token.claim'),('c451d76b-0440-4114-83d1-f4d43b424565','true','introspection.token.claim'),('c451d76b-0440-4114-83d1-f4d43b424565','country','user.attribute.country'),('c451d76b-0440-4114-83d1-f4d43b424565','formatted','user.attribute.formatted'),('c451d76b-0440-4114-83d1-f4d43b424565','locality','user.attribute.locality'),('c451d76b-0440-4114-83d1-f4d43b424565','postal_code','user.attribute.postal_code'),('c451d76b-0440-4114-83d1-f4d43b424565','region','user.attribute.region'),('c451d76b-0440-4114-83d1-f4d43b424565','street','user.attribute.street'),('c451d76b-0440-4114-83d1-f4d43b424565','true','userinfo.token.claim'),('d64c6072-65a8-4f00-a7b9-42aae452892c','true','access.token.claim'),('d64c6072-65a8-4f00-a7b9-42aae452892c','profile','claim.name'),('d64c6072-65a8-4f00-a7b9-42aae452892c','true','id.token.claim'),('d64c6072-65a8-4f00-a7b9-42aae452892c','true','introspection.token.claim'),('d64c6072-65a8-4f00-a7b9-42aae452892c','String','jsonType.label'),('d64c6072-65a8-4f00-a7b9-42aae452892c','profile','user.attribute'),('d64c6072-65a8-4f00-a7b9-42aae452892c','true','userinfo.token.claim'),('d8b77061-324d-475c-b54c-42d3b4913849','true','access.token.claim'),('d8b77061-324d-475c-b54c-42d3b4913849','middle_name','claim.name'),('d8b77061-324d-475c-b54c-42d3b4913849','true','id.token.claim'),('d8b77061-324d-475c-b54c-42d3b4913849','true','introspection.token.claim'),('d8b77061-324d-475c-b54c-42d3b4913849','String','jsonType.label'),('d8b77061-324d-475c-b54c-42d3b4913849','middleName','user.attribute'),('d8b77061-324d-475c-b54c-42d3b4913849','true','userinfo.token.claim'),('da106bef-9a82-4876-ab23-24742cbd35ad','true','access.token.claim'),('da106bef-9a82-4876-ab23-24742cbd35ad','picture','claim.name'),('da106bef-9a82-4876-ab23-24742cbd35ad','true','id.token.claim'),('da106bef-9a82-4876-ab23-24742cbd35ad','true','introspection.token.claim'),('da106bef-9a82-4876-ab23-24742cbd35ad','String','jsonType.label'),('da106bef-9a82-4876-ab23-24742cbd35ad','picture','user.attribute'),('da106bef-9a82-4876-ab23-24742cbd35ad','true','userinfo.token.claim'),('ea252ab3-3167-4772-8c3c-69541b29607c','true','access.token.claim'),('ea252ab3-3167-4772-8c3c-69541b29607c','locale','claim.name'),('ea252ab3-3167-4772-8c3c-69541b29607c','true','id.token.claim'),('ea252ab3-3167-4772-8c3c-69541b29607c','true','introspection.token.claim'),('ea252ab3-3167-4772-8c3c-69541b29607c','String','jsonType.label'),('ea252ab3-3167-4772-8c3c-69541b29607c','locale','user.attribute'),('ea252ab3-3167-4772-8c3c-69541b29607c','true','userinfo.token.claim'),('f0ea0b6a-d50c-4af0-a13a-98b398942416','true','access.token.claim'),('f0ea0b6a-d50c-4af0-a13a-98b398942416','resource_access.${client_id}.roles','claim.name'),('f0ea0b6a-d50c-4af0-a13a-98b398942416','true','introspection.token.claim'),('f0ea0b6a-d50c-4af0-a13a-98b398942416','String','jsonType.label'),('f0ea0b6a-d50c-4af0-a13a-98b398942416','true','multivalued'),('f0ea0b6a-d50c-4af0-a13a-98b398942416','foo','user.attribute'),('f5435386-b368-4109-b12e-da558764e3f8','Role','attribute.name'),('f5435386-b368-4109-b12e-da558764e3f8','Basic','attribute.nameformat'),('f5435386-b368-4109-b12e-da558764e3f8','false','single'),('f7a6ef2b-c472-48d2-8c73-ef5b88465468','true','access.token.claim'),('f7a6ef2b-c472-48d2-8c73-ef5b88465468','given_name','claim.name'),('f7a6ef2b-c472-48d2-8c73-ef5b88465468','true','id.token.claim'),('f7a6ef2b-c472-48d2-8c73-ef5b88465468','true','introspection.token.claim'),('f7a6ef2b-c472-48d2-8c73-ef5b88465468','String','jsonType.label'),('f7a6ef2b-c472-48d2-8c73-ef5b88465468','firstName','user.attribute'),('f7a6ef2b-c472-48d2-8c73-ef5b88465468','true','userinfo.token.claim'),('fd97f3f1-16e7-45cb-9f92-5c3b334263dc','true','access.token.claim'),('fd97f3f1-16e7-45cb-9f92-5c3b334263dc','true','id.token.claim'),('fd97f3f1-16e7-45cb-9f92-5c3b334263dc','true','introspection.token.claim'),('fd97f3f1-16e7-45cb-9f92-5c3b334263dc','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADMIN_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text COLLATE utf8mb4_unicode_ci,
  `REGISTRATION_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `RESET_PASSWORD_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `SOCIAL` tinyint NOT NULL DEFAULT '0',
  `SSL_REQUIRED` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` tinyint NOT NULL DEFAULT '0',
  `VERIFY_EMAIL` tinyint NOT NULL DEFAULT '0',
  `MASTER_ADMIN_CLIENT` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_LOCALE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `ADMIN_EVENTS_DETAILS_ENABLED` tinyint NOT NULL DEFAULT '0',
  `EDIT_USERNAME_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` tinyint NOT NULL DEFAULT '0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` tinyint NOT NULL DEFAULT '1',
  `DUPLICATE_EMAILS_ALLOWED` tinyint NOT NULL DEFAULT '0',
  `DOCKER_AUTH_FLOW` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('0de12368-10d1-4f4c-96f5-204ae2b3a65f',60,300,300,NULL,NULL,NULL,1,0,0,NULL,'restaurant-realm',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'c05f799d-b526-434a-b3c5-61a1ed8a4362',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','a67283ad-cb1d-4d29-ae0d-0c67fc6cd1e1','e7be64e4-86bc-4f3a-86fd-a6edbfc93b89','79332b18-1e7f-4854-b8ff-0d615c5c7cc7','f8d9fe6a-b64b-4b1b-b09d-43451affcdc6','f237fe21-cb2f-4119-9eff-44ac49851d46',2592000,0,900,1,0,'51216e79-6677-40b5-9b9c-47e7dfe726fb',0,0,0,0,'1baf361f-3a3b-4004-9c2c-f91a30dbfb5e'),('2be42890-9ed5-4a31-aac5-cfb049ef8010',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'ac406be2-cd34-4d9a-b7cf-59f7fa03b5c8',1800,0,NULL,0,0,0,0,0,1,30,6,'HmacSHA1','totp','94733643-e8c4-4675-af66-7909918176b6','9d4216c7-d7d2-434b-b63e-adec9fcf20ab','898a1064-3d62-4c8d-a965-ee5259af79b4','0bbc28fe-2e6d-4c24-81fa-0c2e31c332f0','c9f8ac4f-de56-49ff-ac72-66e7858bdfcc',2592000,0,900,1,0,'0fb645bc-040e-479b-8a77-a1dc8e2d5053',0,0,0,0,'efcb1ff3-266e-4e3d-9d0f-3e4113cacbe7');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','0de12368-10d1-4f4c-96f5-204ae2b3a65f',''),('_browser_header.contentSecurityPolicyReportOnly','2be42890-9ed5-4a31-aac5-cfb049ef8010',''),('_browser_header.referrerPolicy','0de12368-10d1-4f4c-96f5-204ae2b3a65f','no-referrer'),('_browser_header.referrerPolicy','2be42890-9ed5-4a31-aac5-cfb049ef8010','no-referrer'),('_browser_header.strictTransportSecurity','0de12368-10d1-4f4c-96f5-204ae2b3a65f','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','2be42890-9ed5-4a31-aac5-cfb049ef8010','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','0de12368-10d1-4f4c-96f5-204ae2b3a65f','nosniff'),('_browser_header.xContentTypeOptions','2be42890-9ed5-4a31-aac5-cfb049ef8010','nosniff'),('_browser_header.xFrameOptions','0de12368-10d1-4f4c-96f5-204ae2b3a65f','SAMEORIGIN'),('_browser_header.xFrameOptions','2be42890-9ed5-4a31-aac5-cfb049ef8010','SAMEORIGIN'),('_browser_header.xRobotsTag','0de12368-10d1-4f4c-96f5-204ae2b3a65f','none'),('_browser_header.xRobotsTag','2be42890-9ed5-4a31-aac5-cfb049ef8010','none'),('_browser_header.xXSSProtection','0de12368-10d1-4f4c-96f5-204ae2b3a65f','1; mode=block'),('_browser_header.xXSSProtection','2be42890-9ed5-4a31-aac5-cfb049ef8010','1; mode=block'),('actionTokenGeneratedByAdminLifespan','0de12368-10d1-4f4c-96f5-204ae2b3a65f','43200'),('actionTokenGeneratedByUserLifespan','0de12368-10d1-4f4c-96f5-204ae2b3a65f','300'),('bruteForceProtected','0de12368-10d1-4f4c-96f5-204ae2b3a65f','false'),('bruteForceProtected','2be42890-9ed5-4a31-aac5-cfb049ef8010','false'),('cibaAuthRequestedUserHint','0de12368-10d1-4f4c-96f5-204ae2b3a65f','login_hint'),('cibaBackchannelTokenDeliveryMode','0de12368-10d1-4f4c-96f5-204ae2b3a65f','poll'),('cibaExpiresIn','0de12368-10d1-4f4c-96f5-204ae2b3a65f','120'),('cibaInterval','0de12368-10d1-4f4c-96f5-204ae2b3a65f','5'),('client-policies.policies','0de12368-10d1-4f4c-96f5-204ae2b3a65f','{\"policies\":[]}'),('client-policies.profiles','0de12368-10d1-4f4c-96f5-204ae2b3a65f','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','0de12368-10d1-4f4c-96f5-204ae2b3a65f','0'),('clientOfflineSessionMaxLifespan','0de12368-10d1-4f4c-96f5-204ae2b3a65f','0'),('clientSessionIdleTimeout','0de12368-10d1-4f4c-96f5-204ae2b3a65f','0'),('clientSessionMaxLifespan','0de12368-10d1-4f4c-96f5-204ae2b3a65f','0'),('defaultSignatureAlgorithm','0de12368-10d1-4f4c-96f5-204ae2b3a65f','RS256'),('defaultSignatureAlgorithm','2be42890-9ed5-4a31-aac5-cfb049ef8010','RS256'),('displayName','2be42890-9ed5-4a31-aac5-cfb049ef8010','Keycloak'),('displayNameHtml','2be42890-9ed5-4a31-aac5-cfb049ef8010','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','0de12368-10d1-4f4c-96f5-204ae2b3a65f','30'),('failureFactor','2be42890-9ed5-4a31-aac5-cfb049ef8010','30'),('firstBrokerLoginFlowId','0de12368-10d1-4f4c-96f5-204ae2b3a65f','bc8cae5f-a759-4821-9aae-de01ab762004'),('firstBrokerLoginFlowId','2be42890-9ed5-4a31-aac5-cfb049ef8010','9216aead-40f3-40b5-ab84-b50012c5feb3'),('maxDeltaTimeSeconds','0de12368-10d1-4f4c-96f5-204ae2b3a65f','43200'),('maxDeltaTimeSeconds','2be42890-9ed5-4a31-aac5-cfb049ef8010','43200'),('maxFailureWaitSeconds','0de12368-10d1-4f4c-96f5-204ae2b3a65f','900'),('maxFailureWaitSeconds','2be42890-9ed5-4a31-aac5-cfb049ef8010','900'),('maxTemporaryLockouts','0de12368-10d1-4f4c-96f5-204ae2b3a65f','0'),('maxTemporaryLockouts','2be42890-9ed5-4a31-aac5-cfb049ef8010','0'),('minimumQuickLoginWaitSeconds','0de12368-10d1-4f4c-96f5-204ae2b3a65f','60'),('minimumQuickLoginWaitSeconds','2be42890-9ed5-4a31-aac5-cfb049ef8010','60'),('oauth2DeviceCodeLifespan','0de12368-10d1-4f4c-96f5-204ae2b3a65f','600'),('oauth2DevicePollingInterval','0de12368-10d1-4f4c-96f5-204ae2b3a65f','5'),('offlineSessionMaxLifespan','0de12368-10d1-4f4c-96f5-204ae2b3a65f','5184000'),('offlineSessionMaxLifespan','2be42890-9ed5-4a31-aac5-cfb049ef8010','5184000'),('offlineSessionMaxLifespanEnabled','0de12368-10d1-4f4c-96f5-204ae2b3a65f','false'),('offlineSessionMaxLifespanEnabled','2be42890-9ed5-4a31-aac5-cfb049ef8010','false'),('parRequestUriLifespan','0de12368-10d1-4f4c-96f5-204ae2b3a65f','60'),('permanentLockout','0de12368-10d1-4f4c-96f5-204ae2b3a65f','false'),('permanentLockout','2be42890-9ed5-4a31-aac5-cfb049ef8010','false'),('quickLoginCheckMilliSeconds','0de12368-10d1-4f4c-96f5-204ae2b3a65f','1000'),('quickLoginCheckMilliSeconds','2be42890-9ed5-4a31-aac5-cfb049ef8010','1000'),('realmReusableOtpCode','0de12368-10d1-4f4c-96f5-204ae2b3a65f','false'),('realmReusableOtpCode','2be42890-9ed5-4a31-aac5-cfb049ef8010','false'),('waitIncrementSeconds','0de12368-10d1-4f4c-96f5-204ae2b3a65f','60'),('waitIncrementSeconds','2be42890-9ed5-4a31-aac5-cfb049ef8010','60'),('webAuthnPolicyAttestationConveyancePreference','0de12368-10d1-4f4c-96f5-204ae2b3a65f','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f','not specified'),('webAuthnPolicyAuthenticatorAttachment','0de12368-10d1-4f4c-96f5-204ae2b3a65f','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','0de12368-10d1-4f4c-96f5-204ae2b3a65f','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f','false'),('webAuthnPolicyCreateTimeout','0de12368-10d1-4f4c-96f5-204ae2b3a65f','0'),('webAuthnPolicyCreateTimeoutPasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f','0'),('webAuthnPolicyRequireResidentKey','0de12368-10d1-4f4c-96f5-204ae2b3a65f','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f','not specified'),('webAuthnPolicyRpEntityName','0de12368-10d1-4f4c-96f5-204ae2b3a65f','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f','keycloak'),('webAuthnPolicyRpId','0de12368-10d1-4f4c-96f5-204ae2b3a65f',''),('webAuthnPolicyRpIdPasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f',''),('webAuthnPolicySignatureAlgorithms','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ES256'),('webAuthnPolicyUserVerificationRequirement','0de12368-10d1-4f4c-96f5-204ae2b3a65f','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('0de12368-10d1-4f4c-96f5-204ae2b3a65f','jboss-logging'),('2be42890-9ed5-4a31-aac5-cfb049ef8010','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCALE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FORM_LABEL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INPUT` tinyint NOT NULL DEFAULT '0',
  `SECRET` tinyint NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',1,1,'0de12368-10d1-4f4c-96f5-204ae2b3a65f'),('password','password',1,1,'2be42890-9ed5-4a31-aac5-cfb049ef8010');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('3d77acf1-7225-4aa5-a810-002464124601','http://localhost:4200/*'),('574deff7-0e85-4562-8868-6b8c45f71f51','/realms/master/account/*'),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','/realms/master/account/*'),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','/admin/restaurant-realm/console/*'),('ba76ad0a-7252-4f09-9fc1-c0f6ee35c922','/realms/restaurant-realm/account/*'),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','/admin/master/console/*'),('e093e353-9df1-4777-9a0b-91e3c6938f0a','/realms/restaurant-realm/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `DEFAULT_ACTION` tinyint NOT NULL DEFAULT '0',
  `PROVIDER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('011f589b-a305-48f0-a005-6ddcfa2e2598','CONFIGURE_TOTP','Configure OTP','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'CONFIGURE_TOTP',10),('03954860-a48c-46aa-8bf1-6c3705158771','webauthn-register-passwordless','Webauthn Register Passwordless','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'webauthn-register-passwordless',80),('03a1413f-8d58-45c0-9ac3-e06e766e1776','delete_credential','Delete Credential','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'delete_credential',100),('0e465d74-4c30-417d-9321-6405849d0171','UPDATE_PROFILE','Update Profile','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'UPDATE_PROFILE',40),('2ab32175-4a31-4772-b64e-881d607379cb','delete_account','Delete Account','2be42890-9ed5-4a31-aac5-cfb049ef8010',0,0,'delete_account',60),('34445088-67e2-4d1c-873c-01412901bb84','UPDATE_PASSWORD','Update Password','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'UPDATE_PASSWORD',30),('3d2f95d5-9e91-41d5-8701-95324c7f962d','UPDATE_PROFILE','Update Profile','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'UPDATE_PROFILE',40),('4dd93dbf-92cd-46a0-8e19-985989023d0b','webauthn-register','Webauthn Register','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'webauthn-register',70),('6bcc862f-feb7-4cf5-9abf-c8f26d328fcc','webauthn-register-passwordless','Webauthn Register Passwordless','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'webauthn-register-passwordless',80),('713c3faa-c65a-42e6-96fe-996d71c43d97','UPDATE_PASSWORD','Update Password','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'UPDATE_PASSWORD',30),('7531aae2-9766-490e-96d4-73d8b7aeba32','CONFIGURE_TOTP','Configure OTP','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'CONFIGURE_TOTP',10),('8238d0a7-5700-4cd2-9acb-075dbe68479d','VERIFY_PROFILE','Verify Profile','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'VERIFY_PROFILE',90),('8f04ab59-3bdb-4229-ac9b-302e33f6ac68','VERIFY_EMAIL','Verify Email','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'VERIFY_EMAIL',50),('91582ac3-1a15-491b-8065-cbdd897b0900','update_user_locale','Update User Locale','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'update_user_locale',1000),('96ae7fec-4742-4f36-919d-9cfafdc75b2c','TERMS_AND_CONDITIONS','Terms and Conditions','0de12368-10d1-4f4c-96f5-204ae2b3a65f',0,0,'TERMS_AND_CONDITIONS',20),('a70b0f3f-e211-42d0-a06f-1c1f3903ce0e','delete_credential','Delete Credential','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'delete_credential',100),('aa65456f-a00a-47b9-9e46-70735b05e55d','VERIFY_EMAIL','Verify Email','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'VERIFY_EMAIL',50),('be2e71da-f639-43ec-a6bb-1f0da7a899a9','webauthn-register','Webauthn Register','0de12368-10d1-4f4c-96f5-204ae2b3a65f',1,0,'webauthn-register',70),('c3482ea1-a48f-44f3-af15-bbfd84134be5','TERMS_AND_CONDITIONS','Terms and Conditions','2be42890-9ed5-4a31-aac5-cfb049ef8010',0,0,'TERMS_AND_CONDITIONS',20),('f50c69f9-952e-4966-a002-e0d1fbe00bc0','VERIFY_PROFILE','Verify Profile','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'VERIFY_PROFILE',90),('f9114561-9ea0-481f-907b-80276a0ee86b','delete_account','Delete Account','0de12368-10d1-4f4c-96f5-204ae2b3a65f',0,0,'delete_account',60),('fb9fb177-31b7-4363-bcb0-64f1793f47e8','update_user_locale','Update User Locale','2be42890-9ed5-4a31-aac5-cfb049ef8010',1,0,'update_user_locale',1000);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` tinyint NOT NULL DEFAULT '0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ICON_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` tinyint NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ICON_URI` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','151ab445-532a-47c1-b823-fe56b2e0724f'),('e093e353-9df1-4777-9a0b-91e3c6938f0a','187ce72b-15b1-4c17-b196-35ea498cbe06'),('a7bb59cb-28ee-4d6e-88ca-5419098fc9b6','7dfcb66f-d890-4bfc-91d4-ea4ce1ee8dd1'),('e093e353-9df1-4777-9a0b-91e3c6938f0a','b303d10b-0fe4-4e55-bd83-23f53649c64e');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `LONG_VALUE_HASH` binary(64) DEFAULT NULL,
  `LONG_VALUE_HASH_LOWER_CASE` binary(64) DEFAULT NULL,
  `LONG_VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  KEY `USER_ATTR_LONG_VALUES` (`LONG_VALUE_HASH`,`NAME`),
  KEY `USER_ATTR_LONG_VALUES_LOWER_CASE` (`LONG_VALUE_HASH_LOWER_CASE`,`NAME`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint NOT NULL DEFAULT '0',
  `ENABLED` tinyint NOT NULL DEFAULT '0',
  `FEDERATION_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('2691900e-1a98-46d3-8907-64e2db192c23','ruben@mail.com','ruben@mail.com',0,1,NULL,'Rubén','Dev','0de12368-10d1-4f4c-96f5-204ae2b3a65f','ruben',1719159519133,NULL,0),('8bdf082e-4634-4df5-ba3c-62bed0c3751e',NULL,'63898f09-a5b9-4215-8dbf-e64865057fdc',0,1,NULL,NULL,NULL,'2be42890-9ed5-4a31-aac5-cfb049ef8010','admin',1719159452697,NULL,0),('c47331c7-6743-47a0-b69a-26c50b234e9c','manolo@mail.com','manolo@mail.com',0,1,NULL,'Manolo','Ejemplo','0de12368-10d1-4f4c-96f5-204ae2b3a65f','manolo',1719159543019,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `USER_GROUP_MEMBERSHIP` VALUES ('76cc50c2-b463-4918-b576-e708a1f69b00','2691900e-1a98-46d3-8907-64e2db192c23'),('d1a380bf-0118-4d6a-8889-3a49f99f90d1','2691900e-1a98-46d3-8907-64e2db192c23'),('eeadde87-116c-4974-b4fd-de6aa1200b7e','c47331c7-6743-47a0-b69a-26c50b234e9c');
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUIRED_ACTION` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('1baf361f-3a3b-4004-9c2c-f91a30dbfb5e','2691900e-1a98-46d3-8907-64e2db192c23'),('1589980a-9d33-4308-ae1c-80fddbe2be7c','8bdf082e-4634-4df5-ba3c-62bed0c3751e'),('efcb1ff3-266e-4e3d-9d0f-3e4113cacbe7','8bdf082e-4634-4df5-ba3c-62bed0c3751e'),('1baf361f-3a3b-4004-9c2c-f91a30dbfb5e','c47331c7-6743-47a0-b69a-26c50b234e9c');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTH_METHOD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMEMBER_ME` tinyint NOT NULL DEFAULT '0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('3d77acf1-7225-4aa5-a810-002464124601','http://localhost:4200'),('3d77acf1-7225-4aa5-a810-002464124601','http://localhost:8081'),('ad9f6c29-fab8-4d31-8aa0-f6812b5e9d02','+'),('d6c5662a-c3f0-4bd8-aa5e-249229207bb1','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 16:20:02
