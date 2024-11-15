-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.27

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
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES ('4872c105-dd6c-48ac-bddb-17b193cf5c6b','a297f157-5bd2-4fb6-aa45-319a15c3ab9a');
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0219cba1-8df2-4d3b-9b9b-b7af53e25b90',NULL,'registration-terms-and-conditions','3929fd70-b926-4893-87ea-df1d4e547204','2794c758-ab38-4832-98cb-8a0b483d204f',3,70,_binary '\0',NULL,NULL),('0980d621-bba4-43d6-9606-a0523b1158e7',NULL,'idp-review-profile','77ed64ab-5412-4324-afcf-146bfc77e1b5','bf37da5d-abcd-45c2-9e92-d70c375acb2f',0,10,_binary '\0',NULL,'2a480cd0-9270-46c3-a950-576471e1bd40'),('0a210e9d-f019-4f3e-b272-f9777e5809b1',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','45c5197f-dc32-4a48-b609-5ec84341deea',1,30,_binary '','c5bf37ca-06ca-4ec7-b735-a29829ab95ec',NULL),('0dd8a35d-fe34-40eb-9ead-5a282cb2501c',NULL,'registration-password-action','3929fd70-b926-4893-87ea-df1d4e547204','2794c758-ab38-4832-98cb-8a0b483d204f',0,50,_binary '\0',NULL,NULL),('0e9d23dd-fe0b-46d1-a552-4eb29f448a1c',NULL,'reset-credentials-choose-user','77ed64ab-5412-4324-afcf-146bfc77e1b5','50b96e03-b4c3-4a6a-87fa-d5ba51e6b57d',0,10,_binary '\0',NULL,NULL),('0fdce52e-80ba-4a65-94a5-26124a9636c7',NULL,'identity-provider-redirector','3929fd70-b926-4893-87ea-df1d4e547204','31f058cc-1cec-4a63-9655-0ebc8da045e5',2,25,_binary '\0',NULL,NULL),('115cdf2f-9cf3-4408-8242-7256908d25ff',NULL,'registration-page-form','3929fd70-b926-4893-87ea-df1d4e547204','a45b0871-d35e-49f5-8956-00a6477c4087',0,10,_binary '','2794c758-ab38-4832-98cb-8a0b483d204f',NULL),('11f4872a-9a95-477b-a61f-300e1f4ec30c',NULL,'idp-email-verification','77ed64ab-5412-4324-afcf-146bfc77e1b5','c03620fa-54fc-46c0-813f-e772228b26ab',2,10,_binary '\0',NULL,NULL),('120b9ba6-d02d-4f84-9f65-93f3e94c71e6',NULL,'auth-spnego','3929fd70-b926-4893-87ea-df1d4e547204','31f058cc-1cec-4a63-9655-0ebc8da045e5',3,20,_binary '\0',NULL,NULL),('17156c6c-029f-4147-8366-74cce3e2e845',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','4bc84670-81cd-4359-908a-217bec50942f',0,20,_binary '','5616a1d4-2178-4b4d-8f4c-85e022d0167e',NULL),('1876f599-8c06-4acf-bf1d-dc3571000980',NULL,'conditional-user-configured','77ed64ab-5412-4324-afcf-146bfc77e1b5','fee8cc44-a7ab-4d0b-81d6-1c3648b851bb',0,10,_binary '\0',NULL,NULL),('1b29c7ee-3842-4cce-b174-619c0a21aeb4',NULL,'client-x509','3929fd70-b926-4893-87ea-df1d4e547204','985e9211-b955-4239-a055-40a8bcaf3799',2,40,_binary '\0',NULL,NULL),('1bf330bf-3cd2-4efd-bf18-0ebbee95c199',NULL,'auth-otp-form','b27e471f-0707-4dd7-8f2e-f6d21acecce8','4b703460-1186-4898-af4e-c62d92b0432c',0,20,_binary '\0',NULL,NULL),('1f60e094-0e4a-4800-aaea-cb8cadc16192',NULL,'conditional-user-configured','b27e471f-0707-4dd7-8f2e-f6d21acecce8','698e1bd2-2f90-41a3-991c-c601b5181989',0,10,_binary '\0',NULL,NULL),('1fbe3110-d454-421f-9bdd-d2c307258086',NULL,'auth-username-password-form','3929fd70-b926-4893-87ea-df1d4e547204','c3640ac8-428d-47b8-b473-4b29847d67e8',0,10,_binary '\0',NULL,NULL),('2020dff7-eae7-46cc-a782-ec113c95f452',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','c03620fa-54fc-46c0-813f-e772228b26ab',2,20,_binary '','6f0d5c41-fb6c-4bd5-b004-03e89a5356a7',NULL),('21242d7e-503e-425f-8c88-f17f5d621464',NULL,'idp-create-user-if-unique','3929fd70-b926-4893-87ea-df1d4e547204','5616a1d4-2178-4b4d-8f4c-85e022d0167e',2,10,_binary '\0',NULL,'8c64e933-5978-4899-90d3-14c1ffcd9545'),('21596460-76cd-4d1e-9df6-7326e9686dd7',NULL,'client-jwt','3929fd70-b926-4893-87ea-df1d4e547204','985e9211-b955-4239-a055-40a8bcaf3799',2,20,_binary '\0',NULL,NULL),('218b2b1b-08e2-4750-8367-c20416cf084f',NULL,'reset-password','b27e471f-0707-4dd7-8f2e-f6d21acecce8','c9e33c61-cd0d-44ea-b723-9107d45cd733',0,30,_binary '\0',NULL,NULL),('23a7ae98-4a61-421f-ad5f-5fc88fe1f508',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','2aafd3de-678d-4041-997b-c1717b2c2597',1,20,_binary '','2b8db65c-18da-4756-843d-ffdcece79d72',NULL),('23dd1bb2-43b5-4e71-864d-ea0eee66df8d',NULL,'conditional-user-configured','3929fd70-b926-4893-87ea-df1d4e547204','299a6fa3-d865-4746-8718-a8f61d18c828',0,10,_binary '\0',NULL,NULL),('268cf5c3-0886-4a4c-9d98-e71e6e785936',NULL,'idp-username-password-form','b27e471f-0707-4dd7-8f2e-f6d21acecce8','c0895945-d9e8-4a64-9c81-fb62bc1d6733',0,10,_binary '\0',NULL,NULL),('27521713-a238-4b8c-b8fc-0db0294c2ca5',NULL,'docker-http-basic-authenticator','b27e471f-0707-4dd7-8f2e-f6d21acecce8','a469ef55-1683-474f-bd37-38b82c81442f',0,10,_binary '\0',NULL,NULL),('2951e265-ae30-4823-9735-ac75f9cc74bf',NULL,'reset-otp','b27e471f-0707-4dd7-8f2e-f6d21acecce8','3714b772-9ed3-4c7d-883d-6da5a04805fb',0,20,_binary '\0',NULL,NULL),('353b1f23-c139-4224-8bfa-89c80d19eeb1',NULL,'auth-otp-form','3929fd70-b926-4893-87ea-df1d4e547204','0b4552fd-b226-4942-a014-689b669d2ebc',0,20,_binary '\0',NULL,NULL),('39206037-ac81-40fa-b91a-f786feade592',NULL,'client-secret','3929fd70-b926-4893-87ea-df1d4e547204','985e9211-b955-4239-a055-40a8bcaf3799',2,10,_binary '\0',NULL,NULL),('3b16c1bb-e057-4fcb-934f-13811f2ab904',NULL,'idp-review-profile','3929fd70-b926-4893-87ea-df1d4e547204','4bc84670-81cd-4359-908a-217bec50942f',0,10,_binary '\0',NULL,'e09c2c2a-4798-4041-8c99-f39dc7fbc47a'),('3cc2ff7f-1a7f-48b6-92be-c208ac29f414',NULL,'reset-credentials-choose-user','3929fd70-b926-4893-87ea-df1d4e547204','012a0be1-59fd-44b4-a11e-efb3503fa645',0,10,_binary '\0',NULL,NULL),('3f2fec91-19af-4b0a-b004-ecb41e703e8c',NULL,'reset-credential-email','77ed64ab-5412-4324-afcf-146bfc77e1b5','50b96e03-b4c3-4a6a-87fa-d5ba51e6b57d',0,20,_binary '\0',NULL,NULL),('43ba236c-cc6f-4ced-821e-ca6318cf1fec',NULL,'direct-grant-validate-otp','b27e471f-0707-4dd7-8f2e-f6d21acecce8','698e1bd2-2f90-41a3-991c-c601b5181989',0,20,_binary '\0',NULL,NULL),('444ef199-2f0a-4b89-8de3-92344d01cff6',NULL,'conditional-user-configured','b27e471f-0707-4dd7-8f2e-f6d21acecce8','4b703460-1186-4898-af4e-c62d92b0432c',0,10,_binary '\0',NULL,NULL),('47eec590-ee4e-404a-b51b-db89729de362',NULL,'idp-confirm-link','b27e471f-0707-4dd7-8f2e-f6d21acecce8','5beff20b-3b70-407b-aad9-27d7d4c7f6d6',0,10,_binary '\0',NULL,NULL),('49b98d30-ee04-4eda-880c-c1614ddc7ec9',NULL,'client-secret','b27e471f-0707-4dd7-8f2e-f6d21acecce8','fd5e2e98-3618-4f54-86db-ef8465e08dc6',2,10,_binary '\0',NULL,NULL),('4ad525a8-62ec-4799-8ab6-3f21bab7b27b',NULL,'idp-username-password-form','3929fd70-b926-4893-87ea-df1d4e547204','2aafd3de-678d-4041-997b-c1717b2c2597',0,10,_binary '\0',NULL,NULL),('4c0c3e3e-9269-45e5-a98b-94c608973df0',NULL,'client-secret-jwt','77ed64ab-5412-4324-afcf-146bfc77e1b5','2a3bdb38-813c-4854-913a-733cc53f3b42',2,30,_binary '\0',NULL,NULL),('4c1b3cda-c6f2-4859-a21f-4296edb92e34',NULL,'registration-recaptcha-action','77ed64ab-5412-4324-afcf-146bfc77e1b5','c69356c8-440d-4f36-90ad-2485c2f56729',3,60,_binary '\0',NULL,NULL),('4de6d9b7-4401-44fc-8b44-fae2d735a55b',NULL,'auth-otp-form','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1e7d1ca4-5d26-41e4-97be-2dbb2a1624fb',0,20,_binary '\0',NULL,NULL),('51679e1a-8d7c-4e60-9bd0-6d18e2cbffca',NULL,'docker-http-basic-authenticator','3929fd70-b926-4893-87ea-df1d4e547204','aaab7967-9306-4550-b61b-718518093adc',0,10,_binary '\0',NULL,NULL),('5465e4dd-c4e1-4f0c-a4fd-86c35f6b933e',NULL,'auth-cookie','b27e471f-0707-4dd7-8f2e-f6d21acecce8','40b731a0-5049-4684-94ca-adab04fd1935',2,10,_binary '\0',NULL,NULL),('55cf45ed-ab6f-4c45-840e-e8a09634fd77',NULL,'auth-spnego','77ed64ab-5412-4324-afcf-146bfc77e1b5','9603099b-df69-49e1-814a-f23667040195',3,20,_binary '\0',NULL,NULL),('57e67ec0-ccf4-4302-8580-d6fc5f72e4a2',NULL,'http-basic-authenticator','b27e471f-0707-4dd7-8f2e-f6d21acecce8','ab8ea325-ba14-4e3c-be9c-645754de7d2c',0,10,_binary '\0',NULL,NULL),('580af3c5-82a9-4a6f-8475-9c56dc4b2bf4',NULL,'idp-review-profile','b27e471f-0707-4dd7-8f2e-f6d21acecce8','886cea4a-e8e7-4be8-b90e-e4c788b8104f',0,10,_binary '\0',NULL,'01963788-7846-4b35-a507-d024811f6da9'),('58dfcd80-5ee7-4116-9d71-f792d1a54643',NULL,'reset-credentials-choose-user','b27e471f-0707-4dd7-8f2e-f6d21acecce8','c9e33c61-cd0d-44ea-b723-9107d45cd733',0,10,_binary '\0',NULL,NULL),('5ab69f2d-e1ce-42d8-b1d5-6ad605618188',NULL,'direct-grant-validate-username','77ed64ab-5412-4324-afcf-146bfc77e1b5','16aa05b2-6c24-42aa-bf3b-e5b606cecebe',0,10,_binary '\0',NULL,NULL),('5c49b9ce-eeba-49ba-83eb-11cc042e0f02',NULL,'auth-otp-form','77ed64ab-5412-4324-afcf-146bfc77e1b5','07ce9e39-dfc6-4bf0-aaa3-0d22e71da7eb',0,20,_binary '\0',NULL,NULL),('5db7c003-f19e-4bc7-a798-496895d095f3',NULL,'idp-email-verification','3929fd70-b926-4893-87ea-df1d4e547204','685406be-8f1d-4991-8ddc-d2f284e166ce',2,10,_binary '\0',NULL,NULL),('644c5982-5d28-4996-8b68-890b14696bea',NULL,'client-jwt','b27e471f-0707-4dd7-8f2e-f6d21acecce8','fd5e2e98-3618-4f54-86db-ef8465e08dc6',2,20,_binary '\0',NULL,NULL),('64bc66f8-459f-4fa6-865c-1ee981a8710d',NULL,'registration-user-creation','3929fd70-b926-4893-87ea-df1d4e547204','2794c758-ab38-4832-98cb-8a0b483d204f',0,20,_binary '\0',NULL,NULL),('64c8efcc-4962-493d-b044-02c292e53adb',NULL,'identity-provider-redirector','b27e471f-0707-4dd7-8f2e-f6d21acecce8','40b731a0-5049-4684-94ca-adab04fd1935',2,25,_binary '\0',NULL,NULL),('6f697301-0217-4d41-951d-c5742ef0d123',NULL,'http-basic-authenticator','3929fd70-b926-4893-87ea-df1d4e547204','1a1ec185-7467-4a98-a234-2c9565c2e879',0,10,_binary '\0',NULL,NULL),('6fda63f8-5d90-4c37-91c9-32fdcd7b4b13',NULL,'client-secret','77ed64ab-5412-4324-afcf-146bfc77e1b5','2a3bdb38-813c-4854-913a-733cc53f3b42',2,10,_binary '\0',NULL,NULL),('70e3afcd-15e8-4882-9eaf-ad3c60a3109b',NULL,'conditional-user-configured','3929fd70-b926-4893-87ea-df1d4e547204','2b8db65c-18da-4756-843d-ffdcece79d72',0,10,_binary '\0',NULL,NULL),('7794f22d-8f26-4804-b4dc-9b31bee1213a',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','5beff20b-3b70-407b-aad9-27d7d4c7f6d6',0,20,_binary '','31bf73b4-c107-4119-8831-e0399d34fe29',NULL),('7b768c85-6587-40f2-8821-0a02e8043db8',NULL,'idp-confirm-link','77ed64ab-5412-4324-afcf-146bfc77e1b5','df831aeb-5fb9-4d0b-9160-ef926efe1637',0,10,_binary '\0',NULL,NULL),('821bca1d-5676-47ad-8113-cf721dbbc535',NULL,'docker-http-basic-authenticator','77ed64ab-5412-4324-afcf-146bfc77e1b5','a8ce0de3-2d2f-42d3-89db-74d8c2a1c4a8',0,10,_binary '\0',NULL,NULL),('827b0355-4c51-4c21-9963-8df84855eb81',NULL,'auth-otp-form','77ed64ab-5412-4324-afcf-146bfc77e1b5','ce74944a-32f9-4c15-a9bc-35e15b9f40a3',0,20,_binary '\0',NULL,NULL),('82b020c0-086e-457b-b185-8177995216d1',NULL,'identity-provider-redirector','77ed64ab-5412-4324-afcf-146bfc77e1b5','9603099b-df69-49e1-814a-f23667040195',2,25,_binary '\0',NULL,NULL),('83b56b24-b9fd-4430-985e-5b10977cf2ff',NULL,'direct-grant-validate-password','77ed64ab-5412-4324-afcf-146bfc77e1b5','16aa05b2-6c24-42aa-bf3b-e5b606cecebe',0,20,_binary '\0',NULL,NULL),('88b9bf3d-7ebe-43f9-87b9-a8f46ae2dbaa',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','8ac69963-18b8-4fff-bfd3-b801a7cc72ed',1,30,_binary '','698e1bd2-2f90-41a3-991c-c601b5181989',NULL),('8b072328-2455-4191-a75d-0b12d6b20860',NULL,'http-basic-authenticator','77ed64ab-5412-4324-afcf-146bfc77e1b5','0c2ce967-7848-4b76-9306-9809242f6bec',0,10,_binary '\0',NULL,NULL),('8b4b3992-4308-4aab-9f58-527e75a443bf',NULL,'conditional-user-configured','b27e471f-0707-4dd7-8f2e-f6d21acecce8','3714b772-9ed3-4c7d-883d-6da5a04805fb',0,10,_binary '\0',NULL,NULL),('8c20b075-d52f-4246-b8f1-7a6ecf6eacb8',NULL,'reset-credential-email','b27e471f-0707-4dd7-8f2e-f6d21acecce8','c9e33c61-cd0d-44ea-b723-9107d45cd733',0,20,_binary '\0',NULL,NULL),('8c8c9c1f-9d3d-4534-8bff-009f8477377f',NULL,'direct-grant-validate-otp','77ed64ab-5412-4324-afcf-146bfc77e1b5','15c83069-1f7c-4fda-8e1b-7adfa0ee8072',0,20,_binary '\0',NULL,NULL),('8ed555c5-ebae-41cd-9603-af381bd1a062',NULL,'conditional-user-configured','3929fd70-b926-4893-87ea-df1d4e547204','c5bf37ca-06ca-4ec7-b735-a29829ab95ec',0,10,_binary '\0',NULL,NULL),('8ed840af-c4df-4518-ad12-0c1fda956668',NULL,'auth-otp-form','3929fd70-b926-4893-87ea-df1d4e547204','2b8db65c-18da-4756-843d-ffdcece79d72',0,20,_binary '\0',NULL,NULL),('8eed384b-8d9c-4fbd-9199-37c038e890e1',NULL,'auth-cookie','3929fd70-b926-4893-87ea-df1d4e547204','31f058cc-1cec-4a63-9655-0ebc8da045e5',2,10,_binary '\0',NULL,NULL),('8f482016-2836-4825-a753-80d6e0720a5b',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','31bf73b4-c107-4119-8831-e0399d34fe29',2,20,_binary '','c0895945-d9e8-4a64-9c81-fb62bc1d6733',NULL),('90b2a9dd-12ca-41dc-a0a0-5fccb7496993',NULL,'conditional-user-configured','77ed64ab-5412-4324-afcf-146bfc77e1b5','ce74944a-32f9-4c15-a9bc-35e15b9f40a3',0,10,_binary '\0',NULL,NULL),('94d3e89b-875c-4627-8ae8-c17dc0dcb3c7',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','40b731a0-5049-4684-94ca-adab04fd1935',2,30,_binary '','59731159-6298-49d0-8315-d901be99e786',NULL),('970f80f1-e7e9-4bb7-bd6b-fc12d675e94c',NULL,'conditional-user-configured','77ed64ab-5412-4324-afcf-146bfc77e1b5','07ce9e39-dfc6-4bf0-aaa3-0d22e71da7eb',0,10,_binary '\0',NULL,NULL),('98fbbfca-c125-4354-83b7-037f7a14b4cc',NULL,'client-secret-jwt','b27e471f-0707-4dd7-8f2e-f6d21acecce8','fd5e2e98-3618-4f54-86db-ef8465e08dc6',2,30,_binary '\0',NULL,NULL),('9c31a14d-fbe7-4018-8b73-eac41cfdae73',NULL,'client-x509','b27e471f-0707-4dd7-8f2e-f6d21acecce8','fd5e2e98-3618-4f54-86db-ef8465e08dc6',2,40,_binary '\0',NULL,NULL),('9dd8f4d0-d3e7-46b7-8da5-8d1d46dd3869',NULL,'conditional-user-configured','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1e7d1ca4-5d26-41e4-97be-2dbb2a1624fb',0,10,_binary '\0',NULL,NULL),('9fa967cf-aa32-4060-b593-0f8861d1d8b9',NULL,'idp-email-verification','b27e471f-0707-4dd7-8f2e-f6d21acecce8','31bf73b4-c107-4119-8831-e0399d34fe29',2,10,_binary '\0',NULL,NULL),('a0d6e58e-845d-4b44-acc7-fc881e3e847f',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','44cf2e4b-b61b-43d6-8ae7-0f9409c46656',2,20,_binary '','5beff20b-3b70-407b-aad9-27d7d4c7f6d6',NULL),('a87eab4d-13e1-4b2c-983e-867ce6dfe9a7',NULL,'conditional-user-configured','77ed64ab-5412-4324-afcf-146bfc77e1b5','15c83069-1f7c-4fda-8e1b-7adfa0ee8072',0,10,_binary '\0',NULL,NULL),('a90221fb-5bf3-4e80-b09f-62e9ad0d0a0f',NULL,'auth-spnego','b27e471f-0707-4dd7-8f2e-f6d21acecce8','40b731a0-5049-4684-94ca-adab04fd1935',3,20,_binary '\0',NULL,NULL),('aa1307d9-f0d7-48d1-9a07-6c2618a1a68e',NULL,'registration-page-form','77ed64ab-5412-4324-afcf-146bfc77e1b5','f9a07c90-ce5d-448b-8a69-55c6d2da9b87',0,10,_binary '','c69356c8-440d-4f36-90ad-2485c2f56729',NULL),('b38d4a9c-a001-4b75-b007-d2de21ea2ae6',NULL,'registration-recaptcha-action','b27e471f-0707-4dd7-8f2e-f6d21acecce8','2c039ee1-11a5-4c11-bd89-d72863357d90',3,60,_binary '\0',NULL,NULL),('b68478bc-eb64-41db-a6fa-261c5e59e5c5',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','31f058cc-1cec-4a63-9655-0ebc8da045e5',2,30,_binary '','c3640ac8-428d-47b8-b473-4b29847d67e8',NULL),('b6ee65ad-feaf-4875-9c3e-85d9053c5dc0',NULL,'direct-grant-validate-otp','3929fd70-b926-4893-87ea-df1d4e547204','c5bf37ca-06ca-4ec7-b735-a29829ab95ec',0,20,_binary '\0',NULL,NULL),('b8a5bd1c-4b2a-46a0-b9e3-17237b606600',NULL,'reset-otp','3929fd70-b926-4893-87ea-df1d4e547204','299a6fa3-d865-4746-8718-a8f61d18c828',0,20,_binary '\0',NULL,NULL),('b9154835-f1e0-4c81-b00b-26b120b18c09',NULL,'registration-page-form','b27e471f-0707-4dd7-8f2e-f6d21acecce8','31431ce4-1395-47d3-a08f-315d95cbf6b9',0,10,_binary '','2c039ee1-11a5-4c11-bd89-d72863357d90',NULL),('b994e772-042d-4687-b6e5-1dccb9d95972',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','c9e33c61-cd0d-44ea-b723-9107d45cd733',1,40,_binary '','3714b772-9ed3-4c7d-883d-6da5a04805fb',NULL),('bcb79297-91f8-452d-8169-c8d8fdf62e87',NULL,'idp-create-user-if-unique','b27e471f-0707-4dd7-8f2e-f6d21acecce8','44cf2e4b-b61b-43d6-8ae7-0f9409c46656',2,10,_binary '\0',NULL,'05a1f287-3ad1-44d6-82bb-9fdc911554ec'),('bdb84795-8d0a-407f-a2fb-d8bde9660e44',NULL,'client-jwt','77ed64ab-5412-4324-afcf-146bfc77e1b5','2a3bdb38-813c-4854-913a-733cc53f3b42',2,20,_binary '\0',NULL,NULL),('bede3b0c-c837-4935-b0a5-0f09e92bbb43',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','bf37da5d-abcd-45c2-9e92-d70c375acb2f',0,20,_binary '','319a5546-b3f7-4fa9-839c-084a77668a67',NULL),('c094561d-a3ae-4c4a-bbcc-9aa53c9ce282',NULL,'auth-username-password-form','b27e471f-0707-4dd7-8f2e-f6d21acecce8','59731159-6298-49d0-8315-d901be99e786',0,10,_binary '\0',NULL,NULL),('c194d747-45f8-45c5-9816-ce142bb79a69',NULL,'direct-grant-validate-username','b27e471f-0707-4dd7-8f2e-f6d21acecce8','8ac69963-18b8-4fff-bfd3-b801a7cc72ed',0,10,_binary '\0',NULL,NULL),('c2348b50-0ec9-42c1-a988-de56042b44a3',NULL,'reset-password','3929fd70-b926-4893-87ea-df1d4e547204','012a0be1-59fd-44b4-a11e-efb3503fa645',0,30,_binary '\0',NULL,NULL),('c289ee41-7192-4ef2-8902-24a44b9ba6f3',NULL,'idp-create-user-if-unique','77ed64ab-5412-4324-afcf-146bfc77e1b5','319a5546-b3f7-4fa9-839c-084a77668a67',2,10,_binary '\0',NULL,'79440090-480b-434d-a53f-9fc98622009b'),('c3b92940-b8b7-40ed-84ea-ef67fb162fcc',NULL,'registration-password-action','b27e471f-0707-4dd7-8f2e-f6d21acecce8','2c039ee1-11a5-4c11-bd89-d72863357d90',0,50,_binary '\0',NULL,NULL),('c4bf365a-ff50-41c1-969a-e93a58f80a59',NULL,'registration-user-creation','b27e471f-0707-4dd7-8f2e-f6d21acecce8','2c039ee1-11a5-4c11-bd89-d72863357d90',0,20,_binary '\0',NULL,NULL),('c634d6ab-6f82-454d-a4dc-ddb99a18f06e',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','9603099b-df69-49e1-814a-f23667040195',2,30,_binary '','53f046b2-7925-47e6-bc24-2e4e0d81360e',NULL),('c76d5358-69dd-4d4e-83a3-99208aac4e1c',NULL,'auth-username-password-form','77ed64ab-5412-4324-afcf-146bfc77e1b5','53f046b2-7925-47e6-bc24-2e4e0d81360e',0,10,_binary '\0',NULL,NULL),('c7d676d1-c3e6-4f1d-88d3-9e32f6fb411d',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','319a5546-b3f7-4fa9-839c-084a77668a67',2,20,_binary '','df831aeb-5fb9-4d0b-9160-ef926efe1637',NULL),('c8e8f414-a5ec-4fb5-99d0-14aebc342b9d',NULL,'conditional-user-configured','3929fd70-b926-4893-87ea-df1d4e547204','0b4552fd-b226-4942-a014-689b669d2ebc',0,10,_binary '\0',NULL,NULL),('cc44e01f-b394-41b6-81b2-912ad6aa31a8',NULL,'auth-cookie','77ed64ab-5412-4324-afcf-146bfc77e1b5','9603099b-df69-49e1-814a-f23667040195',2,10,_binary '\0',NULL,NULL),('cdd06ddc-13b8-4e8e-81da-9155934260c8',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','53f046b2-7925-47e6-bc24-2e4e0d81360e',1,20,_binary '','07ce9e39-dfc6-4bf0-aaa3-0d22e71da7eb',NULL),('d0980e00-690f-412d-87f4-8c5a5f412b21',NULL,'direct-grant-validate-password','b27e471f-0707-4dd7-8f2e-f6d21acecce8','8ac69963-18b8-4fff-bfd3-b801a7cc72ed',0,20,_binary '\0',NULL,NULL),('d5b30d88-b1bc-4d6f-b33b-d0e060d092b0',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','012a0be1-59fd-44b4-a11e-efb3503fa645',1,40,_binary '','299a6fa3-d865-4746-8718-a8f61d18c828',NULL),('d6069e64-222c-4aa8-a03e-c782e66667aa',NULL,'idp-username-password-form','77ed64ab-5412-4324-afcf-146bfc77e1b5','6f0d5c41-fb6c-4bd5-b004-03e89a5356a7',0,10,_binary '\0',NULL,NULL),('d939ac28-e8ff-4cc3-a783-cbfebfc75f3a',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','886cea4a-e8e7-4be8-b90e-e4c788b8104f',0,20,_binary '','44cf2e4b-b61b-43d6-8ae7-0f9409c46656',NULL),('dac60b9b-f674-450b-a224-10c083623a22',NULL,'client-secret-jwt','3929fd70-b926-4893-87ea-df1d4e547204','985e9211-b955-4239-a055-40a8bcaf3799',2,30,_binary '\0',NULL,NULL),('dbbdf28f-df65-4b16-a0f4-fb3065e19784',NULL,'reset-password','77ed64ab-5412-4324-afcf-146bfc77e1b5','50b96e03-b4c3-4a6a-87fa-d5ba51e6b57d',0,30,_binary '\0',NULL,NULL),('dc2d0350-2250-456b-864f-6e6a9bfa6a5a',NULL,'registration-recaptcha-action','3929fd70-b926-4893-87ea-df1d4e547204','2794c758-ab38-4832-98cb-8a0b483d204f',3,60,_binary '\0',NULL,NULL),('dc9f8a0d-48f2-4c36-a4ce-0d6be4d6ebf2',NULL,'idp-confirm-link','3929fd70-b926-4893-87ea-df1d4e547204','43f17543-2f05-4ae2-915c-c6c1451d52b8',0,10,_binary '\0',NULL,NULL),('df22a0d9-b584-418d-a8ba-09adf006db1b',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','43f17543-2f05-4ae2-915c-c6c1451d52b8',0,20,_binary '','685406be-8f1d-4991-8ddc-d2f284e166ce',NULL),('dfa89a82-d640-48b7-97f5-34f3d5ceb035',NULL,'reset-credential-email','3929fd70-b926-4893-87ea-df1d4e547204','012a0be1-59fd-44b4-a11e-efb3503fa645',0,20,_binary '\0',NULL,NULL),('e5199e57-8d41-4255-a2de-da0c4ac7e021',NULL,'client-x509','77ed64ab-5412-4324-afcf-146bfc77e1b5','2a3bdb38-813c-4854-913a-733cc53f3b42',2,40,_binary '\0',NULL,NULL),('e56b1051-a16a-445b-bff0-be0942168c28',NULL,'direct-grant-validate-password','3929fd70-b926-4893-87ea-df1d4e547204','45c5197f-dc32-4a48-b609-5ec84341deea',0,20,_binary '\0',NULL,NULL),('e6e84f5c-fa22-4ab7-a0f2-c713649ff9ed',NULL,'registration-password-action','77ed64ab-5412-4324-afcf-146bfc77e1b5','c69356c8-440d-4f36-90ad-2485c2f56729',0,50,_binary '\0',NULL,NULL),('e84a11ed-9721-486a-858a-d984865a2c91',NULL,'reset-otp','77ed64ab-5412-4324-afcf-146bfc77e1b5','fee8cc44-a7ab-4d0b-81d6-1c3648b851bb',0,20,_binary '\0',NULL,NULL),('e8a02956-3f7d-4ae6-bc37-eb96c3154a92',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','50b96e03-b4c3-4a6a-87fa-d5ba51e6b57d',1,40,_binary '','fee8cc44-a7ab-4d0b-81d6-1c3648b851bb',NULL),('e993af92-932d-45df-8148-15be05d5bb4b',NULL,'registration-user-creation','77ed64ab-5412-4324-afcf-146bfc77e1b5','c69356c8-440d-4f36-90ad-2485c2f56729',0,20,_binary '\0',NULL,NULL),('eba45285-6209-4b4f-96ba-77cc5475c788',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','c0895945-d9e8-4a64-9c81-fb62bc1d6733',1,20,_binary '','1e7d1ca4-5d26-41e4-97be-2dbb2a1624fb',NULL),('ef5590b8-f8b4-4a0f-a61c-fc9f87c30453',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','6f0d5c41-fb6c-4bd5-b004-03e89a5356a7',1,20,_binary '','ce74944a-32f9-4c15-a9bc-35e15b9f40a3',NULL),('f228896d-a838-46d7-b9d7-f5105c560d29',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','c3640ac8-428d-47b8-b473-4b29847d67e8',1,20,_binary '','0b4552fd-b226-4942-a014-689b669d2ebc',NULL),('f3476170-5897-4c8d-9ac1-040e3aada17a',NULL,NULL,'b27e471f-0707-4dd7-8f2e-f6d21acecce8','59731159-6298-49d0-8315-d901be99e786',1,20,_binary '','4b703460-1186-4898-af4e-c62d92b0432c',NULL),('f5636f46-44c4-4a8e-930a-56e83b2b2558',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','5616a1d4-2178-4b4d-8f4c-85e022d0167e',2,20,_binary '','43f17543-2f05-4ae2-915c-c6c1451d52b8',NULL),('f8bbaac2-d3e1-43bb-bf15-e3580162f5bf',NULL,'direct-grant-validate-username','3929fd70-b926-4893-87ea-df1d4e547204','45c5197f-dc32-4a48-b609-5ec84341deea',0,10,_binary '\0',NULL,NULL),('fc335e1c-7c19-4b55-a716-18f16f1a968a',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','16aa05b2-6c24-42aa-bf3b-e5b606cecebe',1,30,_binary '','15c83069-1f7c-4fda-8e1b-7adfa0ee8072',NULL),('fc5ec072-0196-4d7c-a919-e240d8bb2008',NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','df831aeb-5fb9-4d0b-9160-ef926efe1637',0,20,_binary '','c03620fa-54fc-46c0-813f-e772228b26ab',NULL),('ff28a824-697a-404e-8760-fef3193675fd',NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','685406be-8f1d-4991-8ddc-d2f284e166ce',2,20,_binary '','2aafd3de-678d-4041-997b-c1717b2c2597',NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('012a0be1-59fd-44b4-a11e-efb3503fa645','reset credentials','Reset credentials for a user if they forgot their password or something','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '',_binary ''),('07ce9e39-dfc6-4bf0-aaa3-0d22e71da7eb','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary ''),('0b4552fd-b226-4942-a014-689b669d2ebc','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('0c2ce967-7848-4b76-9306-9809242f6bec','saml ecp','SAML ECP Profile Authentication Flow','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '',_binary ''),('15c83069-1f7c-4fda-8e1b-7adfa0ee8072','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary ''),('16aa05b2-6c24-42aa-bf3b-e5b606cecebe','direct grant','OpenID Connect Resource Owner Grant','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '',_binary ''),('1a1ec185-7467-4a98-a234-2c9565c2e879','saml ecp','SAML ECP Profile Authentication Flow','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '',_binary ''),('1e7d1ca4-5d26-41e4-97be-2dbb2a1624fb','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('2794c758-ab38-4832-98cb-8a0b483d204f','registration form','registration form','3929fd70-b926-4893-87ea-df1d4e547204','form-flow',_binary '\0',_binary ''),('299a6fa3-d865-4746-8718-a8f61d18c828','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('2a3bdb38-813c-4854-913a-733cc53f3b42','clients','Base authentication for clients','77ed64ab-5412-4324-afcf-146bfc77e1b5','client-flow',_binary '',_binary ''),('2aafd3de-678d-4041-997b-c1717b2c2597','Verify Existing Account by Re-authentication','Reauthentication of existing account','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('2b8db65c-18da-4756-843d-ffdcece79d72','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('2c039ee1-11a5-4c11-bd89-d72863357d90','registration form','registration form','b27e471f-0707-4dd7-8f2e-f6d21acecce8','form-flow',_binary '\0',_binary ''),('31431ce4-1395-47d3-a08f-315d95cbf6b9','registration','registration flow','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '',_binary ''),('319a5546-b3f7-4fa9-839c-084a77668a67','User creation or linking','Flow for the existing/non-existing user alternatives','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary ''),('31bf73b4-c107-4119-8831-e0399d34fe29','Account verification options','Method with which to verity the existing account','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('31f058cc-1cec-4a63-9655-0ebc8da045e5','browser','browser based authentication','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '',_binary ''),('3714b772-9ed3-4c7d-883d-6da5a04805fb','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('40b731a0-5049-4684-94ca-adab04fd1935','browser','browser based authentication','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '',_binary ''),('43f17543-2f05-4ae2-915c-c6c1451d52b8','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('44cf2e4b-b61b-43d6-8ae7-0f9409c46656','User creation or linking','Flow for the existing/non-existing user alternatives','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('45c5197f-dc32-4a48-b609-5ec84341deea','direct grant','OpenID Connect Resource Owner Grant','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '',_binary ''),('4b703460-1186-4898-af4e-c62d92b0432c','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('4bc84670-81cd-4359-908a-217bec50942f','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '',_binary ''),('50b96e03-b4c3-4a6a-87fa-d5ba51e6b57d','reset credentials','Reset credentials for a user if they forgot their password or something','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '',_binary ''),('53f046b2-7925-47e6-bc24-2e4e0d81360e','forms','Username, password, otp and other auth forms.','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary ''),('5616a1d4-2178-4b4d-8f4c-85e022d0167e','User creation or linking','Flow for the existing/non-existing user alternatives','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('59731159-6298-49d0-8315-d901be99e786','forms','Username, password, otp and other auth forms.','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('5beff20b-3b70-407b-aad9-27d7d4c7f6d6','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('685406be-8f1d-4991-8ddc-d2f284e166ce','Account verification options','Method with which to verity the existing account','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('698e1bd2-2f90-41a3-991c-c601b5181989','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('6f0d5c41-fb6c-4bd5-b004-03e89a5356a7','Verify Existing Account by Re-authentication','Reauthentication of existing account','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary ''),('886cea4a-e8e7-4be8-b90e-e4c788b8104f','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '',_binary ''),('8ac69963-18b8-4fff-bfd3-b801a7cc72ed','direct grant','OpenID Connect Resource Owner Grant','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '',_binary ''),('9603099b-df69-49e1-814a-f23667040195','browser','browser based authentication','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '',_binary ''),('985e9211-b955-4239-a055-40a8bcaf3799','clients','Base authentication for clients','3929fd70-b926-4893-87ea-df1d4e547204','client-flow',_binary '',_binary ''),('a45b0871-d35e-49f5-8956-00a6477c4087','registration','registration flow','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '',_binary ''),('a469ef55-1683-474f-bd37-38b82c81442f','docker auth','Used by Docker clients to authenticate against the IDP','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '',_binary ''),('a8ce0de3-2d2f-42d3-89db-74d8c2a1c4a8','docker auth','Used by Docker clients to authenticate against the IDP','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '',_binary ''),('aaab7967-9306-4550-b61b-718518093adc','docker auth','Used by Docker clients to authenticate against the IDP','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '',_binary ''),('ab8ea325-ba14-4e3c-be9c-645754de7d2c','saml ecp','SAML ECP Profile Authentication Flow','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '',_binary ''),('bf37da5d-abcd-45c2-9e92-d70c375acb2f','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '',_binary ''),('c03620fa-54fc-46c0-813f-e772228b26ab','Account verification options','Method with which to verity the existing account','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary ''),('c0895945-d9e8-4a64-9c81-fb62bc1d6733','Verify Existing Account by Re-authentication','Reauthentication of existing account','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '\0',_binary ''),('c3640ac8-428d-47b8-b473-4b29847d67e8','forms','Username, password, otp and other auth forms.','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('c5bf37ca-06ca-4ec7-b735-a29829ab95ec','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','3929fd70-b926-4893-87ea-df1d4e547204','basic-flow',_binary '\0',_binary ''),('c69356c8-440d-4f36-90ad-2485c2f56729','registration form','registration form','77ed64ab-5412-4324-afcf-146bfc77e1b5','form-flow',_binary '\0',_binary ''),('c9e33c61-cd0d-44ea-b723-9107d45cd733','reset credentials','Reset credentials for a user if they forgot their password or something','b27e471f-0707-4dd7-8f2e-f6d21acecce8','basic-flow',_binary '',_binary ''),('ce74944a-32f9-4c15-a9bc-35e15b9f40a3','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary ''),('df831aeb-5fb9-4d0b-9160-ef926efe1637','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary ''),('f9a07c90-ce5d-448b-8a69-55c6d2da9b87','registration','registration flow','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '',_binary ''),('fd5e2e98-3618-4f54-86db-ef8465e08dc6','clients','Base authentication for clients','b27e471f-0707-4dd7-8f2e-f6d21acecce8','client-flow',_binary '',_binary ''),('fee8cc44-a7ab-4d0b-81d6-1c3648b851bb','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','77ed64ab-5412-4324-afcf-146bfc77e1b5','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('01963788-7846-4b35-a507-d024811f6da9','review profile config','b27e471f-0707-4dd7-8f2e-f6d21acecce8'),('05a1f287-3ad1-44d6-82bb-9fdc911554ec','create unique user config','b27e471f-0707-4dd7-8f2e-f6d21acecce8'),('2a480cd0-9270-46c3-a950-576471e1bd40','review profile config','77ed64ab-5412-4324-afcf-146bfc77e1b5'),('79440090-480b-434d-a53f-9fc98622009b','create unique user config','77ed64ab-5412-4324-afcf-146bfc77e1b5'),('8c64e933-5978-4899-90d3-14c1ffcd9545','create unique user config','3929fd70-b926-4893-87ea-df1d4e547204'),('e09c2c2a-4798-4041-8c99-f39dc7fbc47a','review profile config','3929fd70-b926-4893-87ea-df1d4e547204');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('01963788-7846-4b35-a507-d024811f6da9','missing','update.profile.on.first.login'),('05a1f287-3ad1-44d6-82bb-9fdc911554ec','false','require.password.update.after.registration'),('2a480cd0-9270-46c3-a950-576471e1bd40','missing','update.profile.on.first.login'),('79440090-480b-434d-a53f-9fc98622009b','false','require.password.update.after.registration'),('8c64e933-5978-4899-90d3-14c1ffcd9545','false','require.password.update.after.registration'),('e09c2c2a-4798-4041-8c99-f39dc7fbc47a','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('01c49ed9-27c5-4cd8-ba34-964d38455f13',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/test/console/',_binary '\0',NULL,_binary '\0','b27e471f-0707-4dd7-8f2e-f6d21acecce8','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','3929fd70-b926-4893-87ea-df1d4e547204',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('172afcd0-ff68-4225-a747-b8df6de29acc',_binary '',_binary '\0','food-delivery-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','3929fd70-b926-4893-87ea-df1d4e547204',NULL,0,_binary '\0',_binary '\0','food-delivery Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','b27e471f-0707-4dd7-8f2e-f6d21acecce8','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('32aa886a-9b02-45a6-ad72-015a2c8c33bf',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','77ed64ab-5412-4324-afcf-146bfc77e1b5','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('375829ae-ea46-4150-ae1e-30e27d0c2079',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','3929fd70-b926-4893-87ea-df1d4e547204','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','77ed64ab-5412-4324-afcf-146bfc77e1b5','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','3929fd70-b926-4893-87ea-df1d4e547204','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '',_binary '\0','test-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','3929fd70-b926-4893-87ea-df1d4e547204',NULL,0,_binary '\0',_binary '\0','test Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/food-delivery/account/',_binary '\0',NULL,_binary '\0','77ed64ab-5412-4324-afcf-146bfc77e1b5','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8883e639-1a69-43ef-8343-d80a7f1e7e86',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/food-delivery/account/',_binary '\0',NULL,_binary '\0','77ed64ab-5412-4324-afcf-146bfc77e1b5','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('911a5f29-a2ef-4a61-ba38-6921db6fff14',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/test/account/',_binary '\0',NULL,_binary '\0','b27e471f-0707-4dd7-8f2e-f6d21acecce8','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('91f553a2-aa4e-45a7-81de-de44541e3787',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','b27e471f-0707-4dd7-8f2e-f6d21acecce8','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/test/account/',_binary '\0',NULL,_binary '\0','b27e471f-0707-4dd7-8f2e-f6d21acecce8','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9da359a5-53bb-4046-86fb-efbee9268e8b',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','b27e471f-0707-4dd7-8f2e-f6d21acecce8','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606',_binary '',_binary '','angular',0,_binary '',NULL,'http://localhost:4200',_binary '\0','http://localhost:4200',_binary '\0','77ed64ab-5412-4324-afcf-146bfc77e1b5','openid-connect',-1,_binary '',_binary '\0','angular',_binary '\0','client-secret','http://localhost:4200','',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('bcd41309-62ab-4c60-b70a-716be700d744',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/food-delivery/console/',_binary '\0',NULL,_binary '\0','77ed64ab-5412-4324-afcf-146bfc77e1b5','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c9609d0d-e995-4c36-a6d0-0ac84ae85777',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','77ed64ab-5412-4324-afcf-146bfc77e1b5','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('cd2fa6f9-0dab-443d-a686-1873001e97a3',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','3929fd70-b926-4893-87ea-df1d4e547204','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','3929fd70-b926-4893-87ea-df1d4e547204','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f65759e0-3ac0-490d-8725-bd00e4103f2d',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','3929fd70-b926-4893-87ea-df1d4e547204','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b',_binary '',_binary '','api-gateway',0,_binary '\0','NowvNnxwcLOUtpslfPz3OTTAUzTNWfAj','',_binary '\0','',_binary '\0','77ed64ab-5412-4324-afcf-146bfc77e1b5','openid-connect',-1,_binary '',_binary '\0','api-gateway',_binary '','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('01c49ed9-27c5-4cd8-ba34-964d38455f13','pkce.code.challenge.method','S256'),('01c49ed9-27c5-4cd8-ba34-964d38455f13','post.logout.redirect.uris','+'),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','pkce.code.challenge.method','S256'),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','post.logout.redirect.uris','+'),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','post.logout.redirect.uris','+'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','pkce.code.challenge.method','S256'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','post.logout.redirect.uris','+'),('911a5f29-a2ef-4a61-ba38-6921db6fff14','pkce.code.challenge.method','S256'),('911a5f29-a2ef-4a61-ba38-6921db6fff14','post.logout.redirect.uris','+'),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','post.logout.redirect.uris','+'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','backchannel.logout.revoke.offline.tokens','false'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','backchannel.logout.session.required','true'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','display.on.consent.screen','false'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','oauth2.device.authorization.grant.enabled','false'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','oidc.ciba.grant.enabled','false'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','post.logout.redirect.uris','*'),('bcd41309-62ab-4c60-b70a-716be700d744','pkce.code.challenge.method','S256'),('bcd41309-62ab-4c60-b70a-716be700d744','post.logout.redirect.uris','+'),('eaac4b3f-d750-4eed-aeea-18cc89692999','post.logout.redirect.uris','+'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','pkce.code.challenge.method','S256'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','post.logout.redirect.uris','+'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','acr.loa.map','{}'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','backchannel.logout.revoke.offline.tokens','false'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','backchannel.logout.session.required','true'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','client_credentials.use_refresh_token','false'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','client.secret.creation.time','1730997410'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','display.on.consent.screen','false'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','oauth2.device.authorization.grant.enabled','false'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','oidc.ciba.grant.enabled','false'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','require.pushed.authorization.requests','false'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','tls.client.certificate.bound.access.tokens','false'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','token.response.type.bearer.lower-case','false'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','use.refresh.tokens','true');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('04257960-1293-4dff-82b8-9847dab077ec','web-origins','3929fd70-b926-4893-87ea-df1d4e547204','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('0dd2fe09-9518-4eb0-ad84-8ed5ff1c754f','addresses','77ed64ab-5412-4324-afcf-146bfc77e1b5','','openid-connect'),('1139643a-c891-4b58-9ac7-f308426a8cdb','profile','3929fd70-b926-4893-87ea-df1d4e547204','OpenID Connect built-in scope: profile','openid-connect'),('161c4e30-5f89-4319-aa31-547e7e7c9461','phone','77ed64ab-5412-4324-afcf-146bfc77e1b5','OpenID Connect built-in scope: phone','openid-connect'),('216c9e1a-1803-48b3-a656-1fb82a601996','role_list','b27e471f-0707-4dd7-8f2e-f6d21acecce8','SAML role list','saml'),('2286ca59-72d6-42f7-91a1-0c160c26cbd2','web-origins','77ed64ab-5412-4324-afcf-146bfc77e1b5','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('23c914b0-4609-4634-b091-9b2dfddacca1','roles','3929fd70-b926-4893-87ea-df1d4e547204','OpenID Connect scope for add user roles to the access token','openid-connect'),('2a3c2ad0-9990-4d89-9c09-7198b606ed61','email','77ed64ab-5412-4324-afcf-146bfc77e1b5','OpenID Connect built-in scope: email','openid-connect'),('340c2443-3fb0-4eeb-af3f-5acfaa7596bc','role_list','77ed64ab-5412-4324-afcf-146bfc77e1b5','SAML role list','saml'),('365a8870-1ca9-47a0-8efa-1ca1467e0ea5','profile','77ed64ab-5412-4324-afcf-146bfc77e1b5','OpenID Connect built-in scope: profile','openid-connect'),('3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63','microprofile-jwt','3929fd70-b926-4893-87ea-df1d4e547204','Microprofile - JWT built-in scope','openid-connect'),('416d08e7-9e79-49d8-a35b-94e68c23d724','microprofile-jwt','77ed64ab-5412-4324-afcf-146bfc77e1b5','Microprofile - JWT built-in scope','openid-connect'),('421d019b-2280-4f22-94b7-1c0b32eca846','offline_access','77ed64ab-5412-4324-afcf-146bfc77e1b5','OpenID Connect built-in scope: offline_access','openid-connect'),('443d6287-3f2d-4336-b3dd-324bcd29ec97','acr','3929fd70-b926-4893-87ea-df1d4e547204','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('4a802a80-2f75-4c40-b92d-c91e7259f94d','offline_access','b27e471f-0707-4dd7-8f2e-f6d21acecce8','OpenID Connect built-in scope: offline_access','openid-connect'),('54b4dac4-785e-4198-8e1d-c6f39fc603a7','roles','b27e471f-0707-4dd7-8f2e-f6d21acecce8','OpenID Connect scope for add user roles to the access token','openid-connect'),('575ec1fb-7509-4a92-ad36-b1b5badb2556','phone','b27e471f-0707-4dd7-8f2e-f6d21acecce8','OpenID Connect built-in scope: phone','openid-connect'),('57863503-288c-4200-88d2-08115588b2dc','address','3929fd70-b926-4893-87ea-df1d4e547204','OpenID Connect built-in scope: address','openid-connect'),('59442141-74b9-4689-ad1c-f6e4805b24d9','phone','3929fd70-b926-4893-87ea-df1d4e547204','OpenID Connect built-in scope: phone','openid-connect'),('5d697c29-6221-4cc5-bb32-1ee94a320074','address','b27e471f-0707-4dd7-8f2e-f6d21acecce8','OpenID Connect built-in scope: address','openid-connect'),('6c35aa83-e5a3-4c73-a0be-6b6924e47aff','microprofile-jwt','b27e471f-0707-4dd7-8f2e-f6d21acecce8','Microprofile - JWT built-in scope','openid-connect'),('6e966667-4c24-43d8-9ce1-436472a45c51','email','3929fd70-b926-4893-87ea-df1d4e547204','OpenID Connect built-in scope: email','openid-connect'),('8ff33e64-f231-4c61-9d7a-7ec23e63f579','acr','b27e471f-0707-4dd7-8f2e-f6d21acecce8','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('aa7d075a-6135-4126-9cee-272e8a9b70e1','email','b27e471f-0707-4dd7-8f2e-f6d21acecce8','OpenID Connect built-in scope: email','openid-connect'),('b7eab178-63d4-45ac-8595-75d78d8ce841','address','77ed64ab-5412-4324-afcf-146bfc77e1b5','OpenID Connect built-in scope: address','openid-connect'),('b8d8d8e2-ce52-421c-9b0b-2d6092cd295d','profile','b27e471f-0707-4dd7-8f2e-f6d21acecce8','OpenID Connect built-in scope: profile','openid-connect'),('c061173a-1027-4333-9e09-3dd067ae7ab7','web-origins','b27e471f-0707-4dd7-8f2e-f6d21acecce8','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('ec8dbbd0-f009-4164-8969-dd7ddac7b84f','offline_access','3929fd70-b926-4893-87ea-df1d4e547204','OpenID Connect built-in scope: offline_access','openid-connect'),('f21b14c5-14d7-4ad2-b5bb-ee35b65ed119','roles','77ed64ab-5412-4324-afcf-146bfc77e1b5','OpenID Connect scope for add user roles to the access token','openid-connect'),('f9d71f8b-b401-4ab2-96b1-60d63405c98e','role_list','3929fd70-b926-4893-87ea-df1d4e547204','SAML role list','saml'),('ffd59b36-ff8a-4b66-b288-9f29f3b0dda1','acr','77ed64ab-5412-4324-afcf-146bfc77e1b5','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('04257960-1293-4dff-82b8-9847dab077ec','','consent.screen.text'),('04257960-1293-4dff-82b8-9847dab077ec','false','display.on.consent.screen'),('04257960-1293-4dff-82b8-9847dab077ec','false','include.in.token.scope'),('0dd2fe09-9518-4eb0-ad84-8ed5ff1c754f','','consent.screen.text'),('0dd2fe09-9518-4eb0-ad84-8ed5ff1c754f','true','display.on.consent.screen'),('0dd2fe09-9518-4eb0-ad84-8ed5ff1c754f','','gui.order'),('0dd2fe09-9518-4eb0-ad84-8ed5ff1c754f','true','include.in.token.scope'),('1139643a-c891-4b58-9ac7-f308426a8cdb','${profileScopeConsentText}','consent.screen.text'),('1139643a-c891-4b58-9ac7-f308426a8cdb','true','display.on.consent.screen'),('1139643a-c891-4b58-9ac7-f308426a8cdb','true','include.in.token.scope'),('161c4e30-5f89-4319-aa31-547e7e7c9461','${phoneScopeConsentText}','consent.screen.text'),('161c4e30-5f89-4319-aa31-547e7e7c9461','true','display.on.consent.screen'),('161c4e30-5f89-4319-aa31-547e7e7c9461','true','include.in.token.scope'),('216c9e1a-1803-48b3-a656-1fb82a601996','${samlRoleListScopeConsentText}','consent.screen.text'),('216c9e1a-1803-48b3-a656-1fb82a601996','true','display.on.consent.screen'),('2286ca59-72d6-42f7-91a1-0c160c26cbd2','','consent.screen.text'),('2286ca59-72d6-42f7-91a1-0c160c26cbd2','false','display.on.consent.screen'),('2286ca59-72d6-42f7-91a1-0c160c26cbd2','false','include.in.token.scope'),('23c914b0-4609-4634-b091-9b2dfddacca1','${rolesScopeConsentText}','consent.screen.text'),('23c914b0-4609-4634-b091-9b2dfddacca1','true','display.on.consent.screen'),('23c914b0-4609-4634-b091-9b2dfddacca1','false','include.in.token.scope'),('2a3c2ad0-9990-4d89-9c09-7198b606ed61','${emailScopeConsentText}','consent.screen.text'),('2a3c2ad0-9990-4d89-9c09-7198b606ed61','true','display.on.consent.screen'),('2a3c2ad0-9990-4d89-9c09-7198b606ed61','true','include.in.token.scope'),('340c2443-3fb0-4eeb-af3f-5acfaa7596bc','${samlRoleListScopeConsentText}','consent.screen.text'),('340c2443-3fb0-4eeb-af3f-5acfaa7596bc','true','display.on.consent.screen'),('365a8870-1ca9-47a0-8efa-1ca1467e0ea5','${profileScopeConsentText}','consent.screen.text'),('365a8870-1ca9-47a0-8efa-1ca1467e0ea5','true','display.on.consent.screen'),('365a8870-1ca9-47a0-8efa-1ca1467e0ea5','true','include.in.token.scope'),('3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63','false','display.on.consent.screen'),('3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63','true','include.in.token.scope'),('416d08e7-9e79-49d8-a35b-94e68c23d724','false','display.on.consent.screen'),('416d08e7-9e79-49d8-a35b-94e68c23d724','true','include.in.token.scope'),('421d019b-2280-4f22-94b7-1c0b32eca846','${offlineAccessScopeConsentText}','consent.screen.text'),('421d019b-2280-4f22-94b7-1c0b32eca846','true','display.on.consent.screen'),('443d6287-3f2d-4336-b3dd-324bcd29ec97','false','display.on.consent.screen'),('443d6287-3f2d-4336-b3dd-324bcd29ec97','false','include.in.token.scope'),('4a802a80-2f75-4c40-b92d-c91e7259f94d','${offlineAccessScopeConsentText}','consent.screen.text'),('4a802a80-2f75-4c40-b92d-c91e7259f94d','true','display.on.consent.screen'),('54b4dac4-785e-4198-8e1d-c6f39fc603a7','${rolesScopeConsentText}','consent.screen.text'),('54b4dac4-785e-4198-8e1d-c6f39fc603a7','true','display.on.consent.screen'),('54b4dac4-785e-4198-8e1d-c6f39fc603a7','false','include.in.token.scope'),('575ec1fb-7509-4a92-ad36-b1b5badb2556','${phoneScopeConsentText}','consent.screen.text'),('575ec1fb-7509-4a92-ad36-b1b5badb2556','true','display.on.consent.screen'),('575ec1fb-7509-4a92-ad36-b1b5badb2556','true','include.in.token.scope'),('57863503-288c-4200-88d2-08115588b2dc','${addressScopeConsentText}','consent.screen.text'),('57863503-288c-4200-88d2-08115588b2dc','true','display.on.consent.screen'),('57863503-288c-4200-88d2-08115588b2dc','true','include.in.token.scope'),('59442141-74b9-4689-ad1c-f6e4805b24d9','${phoneScopeConsentText}','consent.screen.text'),('59442141-74b9-4689-ad1c-f6e4805b24d9','true','display.on.consent.screen'),('59442141-74b9-4689-ad1c-f6e4805b24d9','true','include.in.token.scope'),('5d697c29-6221-4cc5-bb32-1ee94a320074','${addressScopeConsentText}','consent.screen.text'),('5d697c29-6221-4cc5-bb32-1ee94a320074','true','display.on.consent.screen'),('5d697c29-6221-4cc5-bb32-1ee94a320074','true','include.in.token.scope'),('6c35aa83-e5a3-4c73-a0be-6b6924e47aff','false','display.on.consent.screen'),('6c35aa83-e5a3-4c73-a0be-6b6924e47aff','true','include.in.token.scope'),('6e966667-4c24-43d8-9ce1-436472a45c51','${emailScopeConsentText}','consent.screen.text'),('6e966667-4c24-43d8-9ce1-436472a45c51','true','display.on.consent.screen'),('6e966667-4c24-43d8-9ce1-436472a45c51','true','include.in.token.scope'),('8ff33e64-f231-4c61-9d7a-7ec23e63f579','false','display.on.consent.screen'),('8ff33e64-f231-4c61-9d7a-7ec23e63f579','false','include.in.token.scope'),('aa7d075a-6135-4126-9cee-272e8a9b70e1','${emailScopeConsentText}','consent.screen.text'),('aa7d075a-6135-4126-9cee-272e8a9b70e1','true','display.on.consent.screen'),('aa7d075a-6135-4126-9cee-272e8a9b70e1','true','include.in.token.scope'),('b7eab178-63d4-45ac-8595-75d78d8ce841','${addressScopeConsentText}','consent.screen.text'),('b7eab178-63d4-45ac-8595-75d78d8ce841','true','display.on.consent.screen'),('b7eab178-63d4-45ac-8595-75d78d8ce841','true','include.in.token.scope'),('b8d8d8e2-ce52-421c-9b0b-2d6092cd295d','${profileScopeConsentText}','consent.screen.text'),('b8d8d8e2-ce52-421c-9b0b-2d6092cd295d','true','display.on.consent.screen'),('b8d8d8e2-ce52-421c-9b0b-2d6092cd295d','true','include.in.token.scope'),('c061173a-1027-4333-9e09-3dd067ae7ab7','','consent.screen.text'),('c061173a-1027-4333-9e09-3dd067ae7ab7','false','display.on.consent.screen'),('c061173a-1027-4333-9e09-3dd067ae7ab7','false','include.in.token.scope'),('ec8dbbd0-f009-4164-8969-dd7ddac7b84f','${offlineAccessScopeConsentText}','consent.screen.text'),('ec8dbbd0-f009-4164-8969-dd7ddac7b84f','true','display.on.consent.screen'),('f21b14c5-14d7-4ad2-b5bb-ee35b65ed119','${rolesScopeConsentText}','consent.screen.text'),('f21b14c5-14d7-4ad2-b5bb-ee35b65ed119','true','display.on.consent.screen'),('f21b14c5-14d7-4ad2-b5bb-ee35b65ed119','false','include.in.token.scope'),('f9d71f8b-b401-4ab2-96b1-60d63405c98e','${samlRoleListScopeConsentText}','consent.screen.text'),('f9d71f8b-b401-4ab2-96b1-60d63405c98e','true','display.on.consent.screen'),('ffd59b36-ff8a-4b66-b288-9f29f3b0dda1','false','display.on.consent.screen'),('ffd59b36-ff8a-4b66-b288-9f29f3b0dda1','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('01c49ed9-27c5-4cd8-ba34-964d38455f13','4a802a80-2f75-4c40-b92d-c91e7259f94d',_binary '\0'),('01c49ed9-27c5-4cd8-ba34-964d38455f13','54b4dac4-785e-4198-8e1d-c6f39fc603a7',_binary ''),('01c49ed9-27c5-4cd8-ba34-964d38455f13','575ec1fb-7509-4a92-ad36-b1b5badb2556',_binary '\0'),('01c49ed9-27c5-4cd8-ba34-964d38455f13','5d697c29-6221-4cc5-bb32-1ee94a320074',_binary '\0'),('01c49ed9-27c5-4cd8-ba34-964d38455f13','6c35aa83-e5a3-4c73-a0be-6b6924e47aff',_binary '\0'),('01c49ed9-27c5-4cd8-ba34-964d38455f13','8ff33e64-f231-4c61-9d7a-7ec23e63f579',_binary ''),('01c49ed9-27c5-4cd8-ba34-964d38455f13','aa7d075a-6135-4126-9cee-272e8a9b70e1',_binary ''),('01c49ed9-27c5-4cd8-ba34-964d38455f13','b8d8d8e2-ce52-421c-9b0b-2d6092cd295d',_binary ''),('01c49ed9-27c5-4cd8-ba34-964d38455f13','c061173a-1027-4333-9e09-3dd067ae7ab7',_binary ''),('0e3a80af-5a82-4aa4-98d8-d862fece46be','04257960-1293-4dff-82b8-9847dab077ec',_binary ''),('0e3a80af-5a82-4aa4-98d8-d862fece46be','1139643a-c891-4b58-9ac7-f308426a8cdb',_binary ''),('0e3a80af-5a82-4aa4-98d8-d862fece46be','23c914b0-4609-4634-b091-9b2dfddacca1',_binary ''),('0e3a80af-5a82-4aa4-98d8-d862fece46be','3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63',_binary '\0'),('0e3a80af-5a82-4aa4-98d8-d862fece46be','443d6287-3f2d-4336-b3dd-324bcd29ec97',_binary ''),('0e3a80af-5a82-4aa4-98d8-d862fece46be','57863503-288c-4200-88d2-08115588b2dc',_binary '\0'),('0e3a80af-5a82-4aa4-98d8-d862fece46be','59442141-74b9-4689-ad1c-f6e4805b24d9',_binary '\0'),('0e3a80af-5a82-4aa4-98d8-d862fece46be','6e966667-4c24-43d8-9ce1-436472a45c51',_binary ''),('0e3a80af-5a82-4aa4-98d8-d862fece46be','ec8dbbd0-f009-4164-8969-dd7ddac7b84f',_binary '\0'),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','4a802a80-2f75-4c40-b92d-c91e7259f94d',_binary '\0'),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','54b4dac4-785e-4198-8e1d-c6f39fc603a7',_binary ''),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','575ec1fb-7509-4a92-ad36-b1b5badb2556',_binary '\0'),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','5d697c29-6221-4cc5-bb32-1ee94a320074',_binary '\0'),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','6c35aa83-e5a3-4c73-a0be-6b6924e47aff',_binary '\0'),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','8ff33e64-f231-4c61-9d7a-7ec23e63f579',_binary ''),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','aa7d075a-6135-4126-9cee-272e8a9b70e1',_binary ''),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','b8d8d8e2-ce52-421c-9b0b-2d6092cd295d',_binary ''),('1cbf543a-8fc4-4097-ac50-8b1dda5342aa','c061173a-1027-4333-9e09-3dd067ae7ab7',_binary ''),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('32aa886a-9b02-45a6-ad72-015a2c8c33bf','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary ''),('375829ae-ea46-4150-ae1e-30e27d0c2079','04257960-1293-4dff-82b8-9847dab077ec',_binary ''),('375829ae-ea46-4150-ae1e-30e27d0c2079','1139643a-c891-4b58-9ac7-f308426a8cdb',_binary ''),('375829ae-ea46-4150-ae1e-30e27d0c2079','23c914b0-4609-4634-b091-9b2dfddacca1',_binary ''),('375829ae-ea46-4150-ae1e-30e27d0c2079','3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63',_binary '\0'),('375829ae-ea46-4150-ae1e-30e27d0c2079','443d6287-3f2d-4336-b3dd-324bcd29ec97',_binary ''),('375829ae-ea46-4150-ae1e-30e27d0c2079','57863503-288c-4200-88d2-08115588b2dc',_binary '\0'),('375829ae-ea46-4150-ae1e-30e27d0c2079','59442141-74b9-4689-ad1c-f6e4805b24d9',_binary '\0'),('375829ae-ea46-4150-ae1e-30e27d0c2079','6e966667-4c24-43d8-9ce1-436472a45c51',_binary ''),('375829ae-ea46-4150-ae1e-30e27d0c2079','ec8dbbd0-f009-4164-8969-dd7ddac7b84f',_binary '\0'),('4055450d-9cf0-4643-9def-6f0fc139cd30','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('4055450d-9cf0-4643-9def-6f0fc139cd30','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('4055450d-9cf0-4643-9def-6f0fc139cd30','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('4055450d-9cf0-4643-9def-6f0fc139cd30','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('4055450d-9cf0-4643-9def-6f0fc139cd30','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('4055450d-9cf0-4643-9def-6f0fc139cd30','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('4055450d-9cf0-4643-9def-6f0fc139cd30','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('4055450d-9cf0-4643-9def-6f0fc139cd30','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('4055450d-9cf0-4643-9def-6f0fc139cd30','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary ''),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','04257960-1293-4dff-82b8-9847dab077ec',_binary ''),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','1139643a-c891-4b58-9ac7-f308426a8cdb',_binary ''),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','23c914b0-4609-4634-b091-9b2dfddacca1',_binary ''),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63',_binary '\0'),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','443d6287-3f2d-4336-b3dd-324bcd29ec97',_binary ''),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','57863503-288c-4200-88d2-08115588b2dc',_binary '\0'),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','59442141-74b9-4689-ad1c-f6e4805b24d9',_binary '\0'),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','6e966667-4c24-43d8-9ce1-436472a45c51',_binary ''),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','ec8dbbd0-f009-4164-8969-dd7ddac7b84f',_binary '\0'),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary ''),('8883e639-1a69-43ef-8343-d80a7f1e7e86','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('8883e639-1a69-43ef-8343-d80a7f1e7e86','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('8883e639-1a69-43ef-8343-d80a7f1e7e86','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('8883e639-1a69-43ef-8343-d80a7f1e7e86','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('8883e639-1a69-43ef-8343-d80a7f1e7e86','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary ''),('911a5f29-a2ef-4a61-ba38-6921db6fff14','4a802a80-2f75-4c40-b92d-c91e7259f94d',_binary '\0'),('911a5f29-a2ef-4a61-ba38-6921db6fff14','54b4dac4-785e-4198-8e1d-c6f39fc603a7',_binary ''),('911a5f29-a2ef-4a61-ba38-6921db6fff14','575ec1fb-7509-4a92-ad36-b1b5badb2556',_binary '\0'),('911a5f29-a2ef-4a61-ba38-6921db6fff14','5d697c29-6221-4cc5-bb32-1ee94a320074',_binary '\0'),('911a5f29-a2ef-4a61-ba38-6921db6fff14','6c35aa83-e5a3-4c73-a0be-6b6924e47aff',_binary '\0'),('911a5f29-a2ef-4a61-ba38-6921db6fff14','8ff33e64-f231-4c61-9d7a-7ec23e63f579',_binary ''),('911a5f29-a2ef-4a61-ba38-6921db6fff14','aa7d075a-6135-4126-9cee-272e8a9b70e1',_binary ''),('911a5f29-a2ef-4a61-ba38-6921db6fff14','b8d8d8e2-ce52-421c-9b0b-2d6092cd295d',_binary ''),('911a5f29-a2ef-4a61-ba38-6921db6fff14','c061173a-1027-4333-9e09-3dd067ae7ab7',_binary ''),('91f553a2-aa4e-45a7-81de-de44541e3787','4a802a80-2f75-4c40-b92d-c91e7259f94d',_binary '\0'),('91f553a2-aa4e-45a7-81de-de44541e3787','54b4dac4-785e-4198-8e1d-c6f39fc603a7',_binary ''),('91f553a2-aa4e-45a7-81de-de44541e3787','575ec1fb-7509-4a92-ad36-b1b5badb2556',_binary '\0'),('91f553a2-aa4e-45a7-81de-de44541e3787','5d697c29-6221-4cc5-bb32-1ee94a320074',_binary '\0'),('91f553a2-aa4e-45a7-81de-de44541e3787','6c35aa83-e5a3-4c73-a0be-6b6924e47aff',_binary '\0'),('91f553a2-aa4e-45a7-81de-de44541e3787','8ff33e64-f231-4c61-9d7a-7ec23e63f579',_binary ''),('91f553a2-aa4e-45a7-81de-de44541e3787','aa7d075a-6135-4126-9cee-272e8a9b70e1',_binary ''),('91f553a2-aa4e-45a7-81de-de44541e3787','b8d8d8e2-ce52-421c-9b0b-2d6092cd295d',_binary ''),('91f553a2-aa4e-45a7-81de-de44541e3787','c061173a-1027-4333-9e09-3dd067ae7ab7',_binary ''),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','4a802a80-2f75-4c40-b92d-c91e7259f94d',_binary '\0'),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','54b4dac4-785e-4198-8e1d-c6f39fc603a7',_binary ''),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','575ec1fb-7509-4a92-ad36-b1b5badb2556',_binary '\0'),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','5d697c29-6221-4cc5-bb32-1ee94a320074',_binary '\0'),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','6c35aa83-e5a3-4c73-a0be-6b6924e47aff',_binary '\0'),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','8ff33e64-f231-4c61-9d7a-7ec23e63f579',_binary ''),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','aa7d075a-6135-4126-9cee-272e8a9b70e1',_binary ''),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','b8d8d8e2-ce52-421c-9b0b-2d6092cd295d',_binary ''),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','c061173a-1027-4333-9e09-3dd067ae7ab7',_binary ''),('9da359a5-53bb-4046-86fb-efbee9268e8b','4a802a80-2f75-4c40-b92d-c91e7259f94d',_binary '\0'),('9da359a5-53bb-4046-86fb-efbee9268e8b','54b4dac4-785e-4198-8e1d-c6f39fc603a7',_binary ''),('9da359a5-53bb-4046-86fb-efbee9268e8b','575ec1fb-7509-4a92-ad36-b1b5badb2556',_binary '\0'),('9da359a5-53bb-4046-86fb-efbee9268e8b','5d697c29-6221-4cc5-bb32-1ee94a320074',_binary '\0'),('9da359a5-53bb-4046-86fb-efbee9268e8b','6c35aa83-e5a3-4c73-a0be-6b6924e47aff',_binary '\0'),('9da359a5-53bb-4046-86fb-efbee9268e8b','8ff33e64-f231-4c61-9d7a-7ec23e63f579',_binary ''),('9da359a5-53bb-4046-86fb-efbee9268e8b','aa7d075a-6135-4126-9cee-272e8a9b70e1',_binary ''),('9da359a5-53bb-4046-86fb-efbee9268e8b','b8d8d8e2-ce52-421c-9b0b-2d6092cd295d',_binary ''),('9da359a5-53bb-4046-86fb-efbee9268e8b','c061173a-1027-4333-9e09-3dd067ae7ab7',_binary ''),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','0dd2fe09-9518-4eb0-ad84-8ed5ff1c754f',_binary '\0'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary ''),('bcd41309-62ab-4c60-b70a-716be700d744','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('bcd41309-62ab-4c60-b70a-716be700d744','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('bcd41309-62ab-4c60-b70a-716be700d744','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('bcd41309-62ab-4c60-b70a-716be700d744','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('bcd41309-62ab-4c60-b70a-716be700d744','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('bcd41309-62ab-4c60-b70a-716be700d744','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('bcd41309-62ab-4c60-b70a-716be700d744','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('bcd41309-62ab-4c60-b70a-716be700d744','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('bcd41309-62ab-4c60-b70a-716be700d744','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary ''),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('c9609d0d-e995-4c36-a6d0-0ac84ae85777','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary ''),('cd2fa6f9-0dab-443d-a686-1873001e97a3','04257960-1293-4dff-82b8-9847dab077ec',_binary ''),('cd2fa6f9-0dab-443d-a686-1873001e97a3','1139643a-c891-4b58-9ac7-f308426a8cdb',_binary ''),('cd2fa6f9-0dab-443d-a686-1873001e97a3','23c914b0-4609-4634-b091-9b2dfddacca1',_binary ''),('cd2fa6f9-0dab-443d-a686-1873001e97a3','3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63',_binary '\0'),('cd2fa6f9-0dab-443d-a686-1873001e97a3','443d6287-3f2d-4336-b3dd-324bcd29ec97',_binary ''),('cd2fa6f9-0dab-443d-a686-1873001e97a3','57863503-288c-4200-88d2-08115588b2dc',_binary '\0'),('cd2fa6f9-0dab-443d-a686-1873001e97a3','59442141-74b9-4689-ad1c-f6e4805b24d9',_binary '\0'),('cd2fa6f9-0dab-443d-a686-1873001e97a3','6e966667-4c24-43d8-9ce1-436472a45c51',_binary ''),('cd2fa6f9-0dab-443d-a686-1873001e97a3','ec8dbbd0-f009-4164-8969-dd7ddac7b84f',_binary '\0'),('eaac4b3f-d750-4eed-aeea-18cc89692999','04257960-1293-4dff-82b8-9847dab077ec',_binary ''),('eaac4b3f-d750-4eed-aeea-18cc89692999','1139643a-c891-4b58-9ac7-f308426a8cdb',_binary ''),('eaac4b3f-d750-4eed-aeea-18cc89692999','23c914b0-4609-4634-b091-9b2dfddacca1',_binary ''),('eaac4b3f-d750-4eed-aeea-18cc89692999','3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63',_binary '\0'),('eaac4b3f-d750-4eed-aeea-18cc89692999','443d6287-3f2d-4336-b3dd-324bcd29ec97',_binary ''),('eaac4b3f-d750-4eed-aeea-18cc89692999','57863503-288c-4200-88d2-08115588b2dc',_binary '\0'),('eaac4b3f-d750-4eed-aeea-18cc89692999','59442141-74b9-4689-ad1c-f6e4805b24d9',_binary '\0'),('eaac4b3f-d750-4eed-aeea-18cc89692999','6e966667-4c24-43d8-9ce1-436472a45c51',_binary ''),('eaac4b3f-d750-4eed-aeea-18cc89692999','ec8dbbd0-f009-4164-8969-dd7ddac7b84f',_binary '\0'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','04257960-1293-4dff-82b8-9847dab077ec',_binary ''),('f65759e0-3ac0-490d-8725-bd00e4103f2d','1139643a-c891-4b58-9ac7-f308426a8cdb',_binary ''),('f65759e0-3ac0-490d-8725-bd00e4103f2d','23c914b0-4609-4634-b091-9b2dfddacca1',_binary ''),('f65759e0-3ac0-490d-8725-bd00e4103f2d','3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63',_binary '\0'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','443d6287-3f2d-4336-b3dd-324bcd29ec97',_binary ''),('f65759e0-3ac0-490d-8725-bd00e4103f2d','57863503-288c-4200-88d2-08115588b2dc',_binary '\0'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','59442141-74b9-4689-ad1c-f6e4805b24d9',_binary '\0'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','6e966667-4c24-43d8-9ce1-436472a45c51',_binary ''),('f65759e0-3ac0-490d-8725-bd00e4103f2d','ec8dbbd0-f009-4164-8969-dd7ddac7b84f',_binary '\0'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('421d019b-2280-4f22-94b7-1c0b32eca846','15041204-f8b8-43e2-aebd-182ceecd78b1'),('4a802a80-2f75-4c40-b92d-c91e7259f94d','e06de8f7-b1ee-4104-b8fb-3c0ee4153964'),('ec8dbbd0-f009-4164-8969-dd7ddac7b84f','5bed8e8a-9098-4517-a765-c7a9255927c2');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('0007c1b2-78f3-4559-9244-2ed35fad853f','Consent Required','77ed64ab-5412-4324-afcf-146bfc77e1b5','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','anonymous'),('0a7ba27e-4373-48c8-9e79-db0145360c65','Allowed Protocol Mapper Types','3929fd70-b926-4893-87ea-df1d4e547204','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3929fd70-b926-4893-87ea-df1d4e547204','anonymous'),('17748748-908b-4280-bdeb-8826cc09adef','Allowed Protocol Mapper Types','b27e471f-0707-4dd7-8f2e-f6d21acecce8','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','anonymous'),('18270526-a150-48ed-bdc8-2291ea2cedf0','Allowed Protocol Mapper Types','b27e471f-0707-4dd7-8f2e-f6d21acecce8','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','authenticated'),('1881bc78-ab53-414f-bba0-3f85d5072428','Trusted Hosts','77ed64ab-5412-4324-afcf-146bfc77e1b5','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','anonymous'),('18e9271d-5858-4121-8491-665cc33e6b41','Allowed Client Scopes','b27e471f-0707-4dd7-8f2e-f6d21acecce8','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','authenticated'),('2a887884-f6c5-48e6-83b7-412d0f0956ed','Allowed Client Scopes','77ed64ab-5412-4324-afcf-146bfc77e1b5','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','anonymous'),('2d9cf364-3e62-429a-bd72-84bc0ce611f4','Max Clients Limit','b27e471f-0707-4dd7-8f2e-f6d21acecce8','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','anonymous'),('392db386-ada1-42a7-a6a2-22a7f722b2cb','rsa-generated','77ed64ab-5412-4324-afcf-146bfc77e1b5','rsa-generated','org.keycloak.keys.KeyProvider','77ed64ab-5412-4324-afcf-146bfc77e1b5',NULL),('400a8916-82dd-429c-8949-2369ecef6e42','Max Clients Limit','3929fd70-b926-4893-87ea-df1d4e547204','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3929fd70-b926-4893-87ea-df1d4e547204','anonymous'),('4256133c-30de-4fc1-a5bb-1f7d8e144bf7','rsa-enc-generated','b27e471f-0707-4dd7-8f2e-f6d21acecce8','rsa-enc-generated','org.keycloak.keys.KeyProvider','b27e471f-0707-4dd7-8f2e-f6d21acecce8',NULL),('4c65ef5a-c1bd-49c0-b07f-51cc5da4ad1d','hmac-generated','77ed64ab-5412-4324-afcf-146bfc77e1b5','hmac-generated','org.keycloak.keys.KeyProvider','77ed64ab-5412-4324-afcf-146bfc77e1b5',NULL),('6162e4e9-8408-4532-9c28-6c5f06386c20','aes-generated','3929fd70-b926-4893-87ea-df1d4e547204','aes-generated','org.keycloak.keys.KeyProvider','3929fd70-b926-4893-87ea-df1d4e547204',NULL),('685cab00-ff59-4652-b454-f2f94e6ec281','rsa-generated','3929fd70-b926-4893-87ea-df1d4e547204','rsa-generated','org.keycloak.keys.KeyProvider','3929fd70-b926-4893-87ea-df1d4e547204',NULL),('68a7112c-4d5d-41b6-bec6-9de653cc688e','Allowed Protocol Mapper Types','77ed64ab-5412-4324-afcf-146bfc77e1b5','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','authenticated'),('70138f68-d7fa-4a00-8122-5566ae19728b','hmac-generated','3929fd70-b926-4893-87ea-df1d4e547204','hmac-generated','org.keycloak.keys.KeyProvider','3929fd70-b926-4893-87ea-df1d4e547204',NULL),('8a3d95f6-1d3e-4125-8999-5721e128c4be','Allowed Client Scopes','b27e471f-0707-4dd7-8f2e-f6d21acecce8','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','anonymous'),('8d43c404-b67e-44d3-9fa5-1374977f2f0d','Full Scope Disabled','3929fd70-b926-4893-87ea-df1d4e547204','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3929fd70-b926-4893-87ea-df1d4e547204','anonymous'),('8d455a97-a460-4a3e-9e32-16035b525957','hmac-generated','b27e471f-0707-4dd7-8f2e-f6d21acecce8','hmac-generated','org.keycloak.keys.KeyProvider','b27e471f-0707-4dd7-8f2e-f6d21acecce8',NULL),('99e1747c-3992-44f9-a019-223ccbe64cda','Allowed Client Scopes','3929fd70-b926-4893-87ea-df1d4e547204','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3929fd70-b926-4893-87ea-df1d4e547204','anonymous'),('a50c7c5a-3a0b-460e-b91c-fa76b520e209','rsa-generated','b27e471f-0707-4dd7-8f2e-f6d21acecce8','rsa-generated','org.keycloak.keys.KeyProvider','b27e471f-0707-4dd7-8f2e-f6d21acecce8',NULL),('abea034a-519c-4821-ba35-ffe6ddc5820f','Trusted Hosts','b27e471f-0707-4dd7-8f2e-f6d21acecce8','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','anonymous'),('b00fdfc3-6cc6-4499-9e5f-8ddab8511867','Allowed Client Scopes','77ed64ab-5412-4324-afcf-146bfc77e1b5','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','authenticated'),('c0241407-294d-47cf-bb96-8406866833ee','Full Scope Disabled','77ed64ab-5412-4324-afcf-146bfc77e1b5','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','anonymous'),('c0942108-474e-4487-a749-87c97b279b5e','aes-generated','b27e471f-0707-4dd7-8f2e-f6d21acecce8','aes-generated','org.keycloak.keys.KeyProvider','b27e471f-0707-4dd7-8f2e-f6d21acecce8',NULL),('c217c1da-7eab-4c74-a6c9-9cef9078edeb','Consent Required','3929fd70-b926-4893-87ea-df1d4e547204','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3929fd70-b926-4893-87ea-df1d4e547204','anonymous'),('c3e97252-a3b4-44f4-8403-8b05e5e2c15a','Max Clients Limit','77ed64ab-5412-4324-afcf-146bfc77e1b5','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','anonymous'),('c8c33fd5-b2e4-4260-b742-fcd57ab4371a','aes-generated','77ed64ab-5412-4324-afcf-146bfc77e1b5','aes-generated','org.keycloak.keys.KeyProvider','77ed64ab-5412-4324-afcf-146bfc77e1b5',NULL),('d0643274-a432-492d-b8a0-74c461cdf567','Allowed Protocol Mapper Types','77ed64ab-5412-4324-afcf-146bfc77e1b5','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','anonymous'),('d2a78595-d631-447f-87af-28087f35e0d3','rsa-enc-generated','3929fd70-b926-4893-87ea-df1d4e547204','rsa-enc-generated','org.keycloak.keys.KeyProvider','3929fd70-b926-4893-87ea-df1d4e547204',NULL),('d4f495ce-cee2-4d29-ae7c-d8bd86843303','Full Scope Disabled','b27e471f-0707-4dd7-8f2e-f6d21acecce8','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','anonymous'),('d63839a7-5cca-4b77-afe9-c948eeeb2bfd','Allowed Client Scopes','3929fd70-b926-4893-87ea-df1d4e547204','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3929fd70-b926-4893-87ea-df1d4e547204','authenticated'),('dae37519-326f-434e-8bb9-8fcf863ae730','Trusted Hosts','3929fd70-b926-4893-87ea-df1d4e547204','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3929fd70-b926-4893-87ea-df1d4e547204','anonymous'),('e53bfa70-d0b7-4597-a310-56023b1796d4','Consent Required','b27e471f-0707-4dd7-8f2e-f6d21acecce8','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','anonymous'),('e8caf968-ee2a-478c-8f9b-cee3a7149beb','Allowed Protocol Mapper Types','3929fd70-b926-4893-87ea-df1d4e547204','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3929fd70-b926-4893-87ea-df1d4e547204','authenticated'),('fecfc855-e8c1-4bd5-a505-56373a7479d2','rsa-enc-generated','77ed64ab-5412-4324-afcf-146bfc77e1b5','rsa-enc-generated','org.keycloak.keys.KeyProvider','77ed64ab-5412-4324-afcf-146bfc77e1b5',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('00d32c39-e7b1-43db-ba24-3b0282602901','17748748-908b-4280-bdeb-8826cc09adef','allowed-protocol-mapper-types','saml-user-property-mapper'),('00deb642-33f2-4836-81ef-ea401363356e','c0942108-474e-4487-a749-87c97b279b5e','priority','100'),('01294e06-82e5-4a15-8525-dbf1e51c0f9c','6162e4e9-8408-4532-9c28-6c5f06386c20','kid','34573767-18cd-4a1b-a247-89d9e2eddde8'),('0263eecd-26fa-4738-911c-ceb02dbc2be4','8d455a97-a460-4a3e-9e32-16035b525957','secret','ltSPU25-X1s81vgZrYtsqaqN-YqvnSTKMjCBs6nKHurOJa7laz1QPOqkj-3O-fEeUDR4fLlMDkMM1srPIma_nQ'),('0730d3ab-9f8e-42d2-b42a-ff70262d6aa4','e8caf968-ee2a-478c-8f9b-cee3a7149beb','allowed-protocol-mapper-types','oidc-address-mapper'),('07f38bae-0dc7-4c92-8ec5-5abee7b96517','a50c7c5a-3a0b-460e-b91c-fa76b520e209','priority','100'),('08f5c895-3e0a-4c78-aa6b-0c85330f099d','1881bc78-ab53-414f-bba0-3f85d5072428','host-sending-registration-request-must-match','true'),('0b252b1f-7d60-430d-a04d-5c8dfde0543a','4256133c-30de-4fc1-a5bb-1f7d8e144bf7','certificate','MIIClzCCAX8CBgGTB2qNQDANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDAR0ZXN0MB4XDTI0MTEwNzE2MTU0M1oXDTM0MTEwNzE2MTcyM1owDzENMAsGA1UEAwwEdGVzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ3YA1ITHVnnhTvpwnkwjrllnEl2dOCrYg2vTA/5lkqsqKFfZi1rhI4qEmtQrhmCLQ5O/0b6cWdlQh2weAQkGPFAy7ocS+udWjLVAt9XdGqwiCY2lcYHeaL/Om48Td0uHEZqHs3UctGWv4V5YQO8ftyKyVmwPpIr/OHJ4lIpV/+WgB6PJu9dfkMXE+DzwjdU6UKa35dOKt6MptBoVIXyc5W/hO2FLjNnmaxLqWr/B8nOn77Qd1mOGTPqC/zZKmmZZRpZUtWpLMNg1ncrF6UVyRNTlhsbaoZQCsmfz88je2A82mplEvP/IvRUlpbjujJWfGZq0SIImMl7nafzv4DkDU8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAESw1xp6E4OZt33/4rWd4hH5eqXkcVi4S9U3d4ugqcwdVHQoX1/D4fADh+y1X1Eqw+nSF8rnyNvPiC/Lz7cH7A0AswWscE1YDhpfSDQ7e8wuW+uf18jzVa+iZCyU10I2lWswPq6GorYSrrZ6/TPaLtzupLzl2ooDFLg4tmO6mBdPQDwSFFivc3bbVq9LpIXNzSO0s7GWjwjlaqhWLcPm4+TBlV7EOtB+6QhyhCxaWOavtKEqGX8g8IV9/yQKgmtkIC3Jm58X/Q8Ldu1sL1+NBX66UZmQ824rMYV61lgTKsq1GBHD0jtFf1WqCt6FGf2in+QgT3A14oYIryMV9IlcM4w=='),('0b79c952-941d-40b2-a74d-e8b570073d82','17748748-908b-4280-bdeb-8826cc09adef','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('0c22eeda-a165-4ae7-bf47-c4112ad7edcd','d2a78595-d631-447f-87af-28087f35e0d3','certificate','MIICmzCCAYMCBgGS1+EdaTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMDI5MTA0MzI3WhcNMzQxMDI5MTA0NTA3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC9Nk5kH9+lB95x+z4LQI1zC8fsPdcdoeHrkZLfs1wrilx8/643HL8uTHso2XnMYwko1sNXW7WAi8I4TOjx29A6ZZPQ4MWPUWwBao8Zr6T3jWG3fioMfVYQFre9U23sDAU3DOsy1yXXf6buSj8NryolEAmOQMsm1emr8juMeuEl6xbgrGh1DNoEdJBYQuT/ZVK/Bdf2R8iGP5oefbKlHrTwB2l+R8XWX4aeFlr4pXmWU1Ou8fzSMQnZ/b7H2RZsRIxg6esMpWkrY34dmP3sF/uWGgrUewZmw/MlvKyjPpMmomvdAsz8m1mTAnpodXNtvw5CcQMF9vTneYvjtA/vjNQ9AgMBAAEwDQYJKoZIhvcNAQELBQADggEBACLpsF/0EKaYXp5ApAMb9DU7WRgemZbjKiZnfJus0ZDk4K3jkwLSPHWykpEmygoAABDSEUFBoGUzwJJTH1QzLvnJceVKIwyULp/nIC7JieBvloqSzuvioiA4DOwqHZGWOsSRf5ZYeq5kGxgqCaDjhsK1jMRqC9jsmVae1qMV7Lt4II34iha/Pz4rLLPWE9WtFFKdo4l/H16Fa76zvPAcsW5Ao96E5nZ11/oaRGkE2YQZZ+rWPT9dhHNGjzwHMQQtb1vswoXKsGome5BlNo6Y5TsDyNm4YEslBcJNBuy/hhbfbuEjyhjlxuP5qs8VEYWMBH5e5Tc356UYciNfNNQb0ko='),('0e62f9d7-2ea1-44f9-ba26-d6932f95f97c','fecfc855-e8c1-4bd5-a505-56373a7479d2','algorithm','RSA-OAEP'),('10034b72-b8c4-4e0a-a165-7a0977079601','b00fdfc3-6cc6-4499-9e5f-8ddab8511867','allow-default-scopes','true'),('10172fa4-226e-4083-890b-adc27b7826fc','fecfc855-e8c1-4bd5-a505-56373a7479d2','certificate','MIICqTCCAZECBgGTB3LBIDANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1mb29kLWRlbGl2ZXJ5MB4XDTI0MTEwNzE2MjQ0MVoXDTM0MTEwNzE2MjYyMVowGDEWMBQGA1UEAwwNZm9vZC1kZWxpdmVyeTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALNxwdPQHyuVQNQPwdZi1B0GiCWDlg4jirZUVBYmeSyyFivXduCGjZ83MbtFPPJZ6rSU70kLCwz8siGJrSa5z9qafjhE/2t3l0xYpV3nW2ChFiuWVfEFKcQp/b4MY+Z6R5R1Wf+/t8GaGBQIMr/LlUtPZgPHaMQNvjATn62DXCUOEgxj95fRWqs2oJtQxECWveh/hQttpJEs8MYTszTXarD1tew2FG6pfMVKQmlZgzL+SM6GP9RKTFd1zRf6+T3a5sfcnJuBqteGgRyCHAch9FQOzTYEhwOSzTwW0vR26js5HlM0tGWqsGiqosD3A9nlhIAr0VvE+lRXmGW9kvFD1uMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAWar8QWzodvyW8XCWs3JcouaWpoHPFhuLHph6mVlW1AJp5gZpdEwzipzidmxIbhMrAQD7K7xQHvlnXHY5Nhy9jCrM6MVqWuPcrrY52PKGhIf4k8qCp7l29bZMokyZprYsEzE1p/HgdbYwXF5WE2MLK3tSOaXLOCHFZ+dPqAyD9Ar3D/Hs++uoz/4OyhpoW2qZtWVplV7J+yGdAAbS/4jia2OTnFSUz2cHDs7yv1Lq6Hz325H8tJNFAfofhyCd6fX1E5KNIsoOVuMzt5Q+o+8bzd1nPqdzC1bpoKbFAz1MrVI0LZC+i3W+V2tnh8KgRltQJvqf3lojKHiMLIBU7tLljA=='),('130f293e-89f2-496b-a026-e1069e67aaef','8d455a97-a460-4a3e-9e32-16035b525957','kid','0dd6d9b0-64cf-454e-aeee-1fc334ae379d'),('16c88546-6145-4527-aa84-5f90c04f4390','6162e4e9-8408-4532-9c28-6c5f06386c20','priority','100'),('183c0800-c64c-4b77-bfd9-dafe1fc81362','6162e4e9-8408-4532-9c28-6c5f06386c20','secret','0427KorRn-xDVpUO6HKOeA'),('1b63afc4-6511-48a6-88c1-a5695f5cd012','68a7112c-4d5d-41b6-bec6-9de653cc688e','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('1c1cd80b-e1b2-4c81-80e4-643050ffcd23','c8c33fd5-b2e4-4260-b742-fcd57ab4371a','kid','c602c210-9ce4-45c2-b7d3-1c7b778d0a48'),('1c96d46b-a744-4276-8c2e-e3aa30c43a72','17748748-908b-4280-bdeb-8826cc09adef','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('20b850dd-2acf-4864-a7d0-91a3f69ae01c','d0643274-a432-492d-b8a0-74c461cdf567','allowed-protocol-mapper-types','oidc-address-mapper'),('23c43bf7-4639-4270-844d-4917207f1f41','400a8916-82dd-429c-8949-2369ecef6e42','max-clients','200'),('2409cd03-d223-41a5-8543-aefea7828be4','18270526-a150-48ed-bdc8-2291ea2cedf0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('2462ef57-070b-4ef4-aede-98a1730ce3be','e8caf968-ee2a-478c-8f9b-cee3a7149beb','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('25509809-f55b-4a81-8d67-42247299b2b0','99e1747c-3992-44f9-a019-223ccbe64cda','allow-default-scopes','true'),('270f4543-3296-4eb3-afb3-6fdd2b5f05a5','4c65ef5a-c1bd-49c0-b07f-51cc5da4ad1d','priority','100'),('282aa5e4-4fb7-4dc5-8bec-039391212bcd','abea034a-519c-4821-ba35-ffe6ddc5820f','client-uris-must-match','true'),('29096591-bdb7-4070-880d-d46d4d9fc560','4256133c-30de-4fc1-a5bb-1f7d8e144bf7','algorithm','RSA-OAEP'),('2983d8fb-dfd1-4183-8a11-f9f8600c30ea','392db386-ada1-42a7-a6a2-22a7f722b2cb','keyUse','SIG'),('2a68fdf7-c569-4db9-a655-d17e81622cbd','18270526-a150-48ed-bdc8-2291ea2cedf0','allowed-protocol-mapper-types','saml-role-list-mapper'),('2ce23d35-529b-4d27-a025-5dbce3c737f5','17748748-908b-4280-bdeb-8826cc09adef','allowed-protocol-mapper-types','saml-role-list-mapper'),('2fc2fc15-3634-40e2-bec9-7fa5b41d2338','c0942108-474e-4487-a749-87c97b279b5e','kid','26f59983-016c-4c51-9681-30b13a10865c'),('31bf76bf-f4ec-4327-8384-98d7cc7d4bcb','dae37519-326f-434e-8bb9-8fcf863ae730','host-sending-registration-request-must-match','true'),('327a72e9-1119-4567-8159-c5fa9c0602a7','8d455a97-a460-4a3e-9e32-16035b525957','priority','100'),('3630b0ed-7ed4-47a1-9b7d-f476044a5772','d0643274-a432-492d-b8a0-74c461cdf567','allowed-protocol-mapper-types','saml-user-property-mapper'),('369c65fa-c121-4b3d-b56c-6873a0edf50b','70138f68-d7fa-4a00-8122-5566ae19728b','secret','BjrNNHB1OSaw87kParftoiZr0g6qlabX2dWRvwcRpW70sgwa3tPbTJPskxXmw8tTGvR9doaF9TovYXsWJbstTA'),('376de549-281f-4e16-9ed9-252ea539a9f7','68a7112c-4d5d-41b6-bec6-9de653cc688e','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('397a6c92-f64b-4c5a-af87-b061e0b1c8a7','18270526-a150-48ed-bdc8-2291ea2cedf0','allowed-protocol-mapper-types','saml-user-property-mapper'),('3b9689bd-a578-4cd4-a9a8-f6763554bb54','0a7ba27e-4373-48c8-9e79-db0145360c65','allowed-protocol-mapper-types','oidc-full-name-mapper'),('3be59fa7-fe5a-4d54-8837-bb649664b2b3','d2a78595-d631-447f-87af-28087f35e0d3','priority','100'),('3e36f2e8-38e2-4f28-bd9c-1ca60637b8dc','a50c7c5a-3a0b-460e-b91c-fa76b520e209','certificate','MIIClzCCAX8CBgGTB2qMNzANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDAR0ZXN0MB4XDTI0MTEwNzE2MTU0M1oXDTM0MTEwNzE2MTcyM1owDzENMAsGA1UEAwwEdGVzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL32HtJ38c0ijYu5ZGIXF489wH44IMcno7/CdfpOhJcewiu4tfHQu4kJ9wGEm1wtEDZgcx6SKTyHlYOW0nTboyZngP0ctmoIS0TwrTQpbLVpD971mAVtPjymXXa+IBZuvoffvjx8zdRf7s80U2xumO6uFMbaexIbwRDcT120xcwE9vDfa+DwjDd1P6iqkwStkZYodR2UaRYhb0vXQD++aZgmOBToMVp6JKFaIElOmqJsiZ5Iwdm+ZKo1e2ZXwlBis7wA14cTMCd/C3J8nz2oRBOF9arjoN5NhmZ/gy/2Y1ym7td1A7dUytxoP4m9ITmDluX6oAYmoqL8vgpn5qtdjVMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAeJFxOI0P0Ng6ktDOwRcb0A1wy6LS7O2Ikb1RcyCZ4sggh71lqNyvAP8EtClVgSoyVKixtP49sfART09wmJN7Sc5RYmIhFE4Zic8C7I6rbRYlhAu8jddnyCuEcFvSXXsYpbBcTLsAJR9LlBcv+SV8dcZYndwJJ0tFx4xWATuHikxpKDgFv1/2yHMPKbmPjX7ncmmbs6tjuVTThlddNHfbvnhXtoOft35HIPxqjySK/q32NIHLt3iIWztO2HugKID0xH8IO3QqGOTEReFXNOqG67JIFQtnTpa5F3N9+hdsGF0WAOz/TGSvCq8X7h3StwUOBF3XJ3gKzwxer1on0djk0w=='),('44e2e401-9fef-41cf-aaff-9a8d72cd614f','17748748-908b-4280-bdeb-8826cc09adef','allowed-protocol-mapper-types','oidc-address-mapper'),('451b0c67-76e8-4a5e-9289-5e2d62d17ac5','18270526-a150-48ed-bdc8-2291ea2cedf0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('451bd661-0c21-4cec-a293-240071894bec','0a7ba27e-4373-48c8-9e79-db0145360c65','allowed-protocol-mapper-types','saml-user-property-mapper'),('478d2cf0-913d-4f6c-a266-75a148cdca4e','18270526-a150-48ed-bdc8-2291ea2cedf0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('490883e1-c0cc-4dfe-8429-71acfbdf81ba','fecfc855-e8c1-4bd5-a505-56373a7479d2','privateKey','MIIEpAIBAAKCAQEAs3HB09AfK5VA1A/B1mLUHQaIJYOWDiOKtlRUFiZ5LLIWK9d24IaNnzcxu0U88lnqtJTvSQsLDPyyIYmtJrnP2pp+OET/a3eXTFilXedbYKEWK5ZV8QUpxCn9vgxj5npHlHVZ/7+3wZoYFAgyv8uVS09mA8doxA2+MBOfrYNcJQ4SDGP3l9Faqzagm1DEQJa96H+FC22kkSzwxhOzNNdqsPW17DYUbql8xUpCaVmDMv5IzoY/1EpMV3XNF/r5Pdrmx9ycm4Gq14aBHIIcByH0VA7NNgSHA5LNPBbS9HbqOzkeUzS0ZaqwaKqiwPcD2eWEgCvRW8T6VFeYZb2S8UPW4wIDAQABAoIBAAiGY4B2Fz0BUrqgYwOV32DfohEyLqtOSfU+jV4eBsy2SzJbAqVJDypcu2qbr/kNh4Z7uuB7+1LrIGVSfpzj3/mRNGTk9kN7Q39XiMesyZ0OGhkJA9028xSEMC9atFZLQeJOLu/lAkxaz0EIYKzW9alFxOFyFEqYIoxzKjdakcKa06gmHvRun2FEGDbB2h3wSwby8kWrxV05lcakWPWobXTzipaL+Xrra4zVRf7QXByvg9g/dvpJQEWqHA2SI52APijU6+3i5kXiGRkYSENlIhP+saprCQwrj1sK4BQNixC8CyCesCXC571fWGtVvw987FTHsEXZvkDYzuG6/ucKvJUCgYEA16YbN5ltxh1MgYwlVCzDnw+FxSlHW7fVzPgPCNT37crOOGLcEHrPa3zf++32MG/zyhpSvcX5UM9lY3p5sNf1PtTU30VdzScagEBUvEmcWENgf/KUCk+QpM6AFVxkoSlfcHcWZH5txbDFnF6QDKVOnfKCHpDzlkPX53Q1mcy4JtUCgYEA1QVnNHUnNAjB1Xtzjq5zny1Wj4bhAlftHSBFkmf7L/1h3XuoCt4xwqhCk29lOHJpS4ozfU64CzOsH84/SKyexFniTo6upQO5VdI894I085SgL/ukfugBX+t+ZI2JdRO7g8ogeBK6t6KiEl/B6ZQNHETk73gkTcZUN76FqPj/UtcCgYEAtwblHMhc0gP19hHDcPDZSzv6dj81sFOT43Y6FG3ky28QnezSCC6jsv/2frUV+UBbcpHq3eSUWRDdZZQCiqSQIraywZj3JvLkXCu9f10elA8DbTSujx2+jxIwxXB4fAxIU4TPfZWMh3gkEDZ2HjWDRy0XYOf3xfZo3anVAGcveM0CgYBCXQGO/SRueH/ygxg4Di8lGtnJswpsUXokRcaG2vANPlH7zydF43z7GLJM/jo5gKM/DloGIr0BeGKaMgXTHTwFDb+MG7Va4TMfAnVN4nmenOHesPXJN3weJt5kcxesqq4TW6gL4EHdLcRyFvTxUNdYxDnSRMqClFPuXeOEBbZ9VwKBgQDTxn/+9zgMhxGaGV8hbX7yPKGNxztVoY4qTL8xdPp7Imr77WmbYUkYd+qge97aecPU60Xwh+i5kGr4bL4MGSuOMWcIMMKepOUqDisnBP9uk07AR4FgLhtOM+ZnAUDkubL9cToI5DGbPHxWhlJaw9wQzJrR6AD8qPvvQm+RTMLPmg=='),('4a3c633a-690d-4f16-873a-9b9c2839dd60','fecfc855-e8c1-4bd5-a505-56373a7479d2','priority','100'),('4f7f1683-74b3-4c4d-a4da-7d71bc607b91','e8caf968-ee2a-478c-8f9b-cee3a7149beb','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('500b3351-0ddb-449e-8f66-ba3b3231c655','68a7112c-4d5d-41b6-bec6-9de653cc688e','allowed-protocol-mapper-types','saml-role-list-mapper'),('532cfbc2-fa91-4aee-96ea-5c793af0649b','0a7ba27e-4373-48c8-9e79-db0145360c65','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5fd770ce-4421-45c9-9d3d-02b1a3664782','685cab00-ff59-4652-b454-f2f94e6ec281','keyUse','SIG'),('600589a6-5df5-4328-9393-23d82f7a5a98','70138f68-d7fa-4a00-8122-5566ae19728b','priority','100'),('6265bd13-1412-4089-a8b7-ad03348468e9','18270526-a150-48ed-bdc8-2291ea2cedf0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('647d1989-962d-4337-bbd7-01927e83fced','a50c7c5a-3a0b-460e-b91c-fa76b520e209','privateKey','MIIEowIBAAKCAQEAvfYe0nfxzSKNi7lkYhcXjz3Afjggxyejv8J1+k6Elx7CK7i18dC7iQn3AYSbXC0QNmBzHpIpPIeVg5bSdNujJmeA/Ry2aghLRPCtNClstWkP3vWYBW0+PKZddr4gFm6+h9++PHzN1F/uzzRTbG6Y7q4Uxtp7EhvBENxPXbTFzAT28N9r4PCMN3U/qKqTBK2Rlih1HZRpFiFvS9dAP75pmCY4FOgxWnokoVogSU6aomyJnkjB2b5kqjV7ZlfCUGKzvADXhxMwJ38LcnyfPahEE4X1quOg3k2GZn+DL/ZjXKbu13UDt1TK3Gg/ib0hOYOW5fqgBiaiovy+Cmfmq12NUwIDAQABAoIBAEClZKHdndVgv+jgA7B6CVN/AWYy9byw2cIljH7Nf8Pp/MxiRNDxZxDg6kWC+lgpIc5Pjn3F4fCud4xbpG2OXXxxVu1MeyukfPEOMvOAcXVfNr56t+yI29hKCZ6iX0sjDwYwd44gLu/qYdv0A7vv+22mon111tI3zcFOKFhMb8/Y/oa2E6U80dB3Ir3MUInYGqJsW/GpfqscktPis19TfFMNxrsr0ipYNS+2LOWRBltmxrMf+BFxMr18girroBePosoCtusVr4CwxMu5Pur1Y+GWqtF1m5kH4lZqr2uusbsTmXMSFipuc4U0ycM66oCTM2b/LC7+AW5s4w3baYlgHEECgYEA4oCZ2Jq9SGZJMTZp/Arcxqk6+dYPqSHSSG9MCtGNehik2FvrW+l8UIckjmyiTqJjMenO1fDvf72Z5eWh3aCyOYjDT2akJiqu7q/rkSuefsIVPXxQ+cS0eGuRfoQCoFg0UG9QvK47m9xkoeFcXb3i/A0VxoBiQWgrc27hO+aN8LMCgYEA1rNGaLtsLHGsZIXMlh/nlUItSPs3qG2qjdPt070PXZdsyMucTC6nfotS0iegiFM30SVzAmbwnYWBy9j1OAQ1AGKg3ZWzSygpzEqqAFoA4H+51Nd7d0kftqlXh0dd4pu0ZQ27jvbFn060pUpi1TAyDs9cQZI69+9AnR3GsylvAOECgYAY3r4FxpfaB0EqIito/VhYh+Rt4k895vTL90yGM5QxP9t51j31jaGUxgIBkXQQ5ku2A1Ius5HYmNz5HUm0qBxprNalNUP43N7wXmijPALfMDhc0/WgNzUJs+X52kzfhk/YNSDMVuU8q+pwy+n0cREnU9h8P0SKogGDXz1j8mDLeQKBgHIsJb4eJPlBfd569H/E+Z768SAFT+TGZNNFJwzZVil8FAJ3nGc6zCFUL7fIEOtN7bnPw2g8m6n4zDw95LFkM1dAG7GaIR1Pf2K/NcY4Fo1L/uN7r5GQlkfJp90ti3StPnIaqmntOsxry062zvX1yjjr9nB8NdWRKngi1H6EAx6hAoGBAJRQutv7Tm10BzjqJEVYf4wwJQwJLI2QKEGny2hgQ5SdHShpCi5fv81maRdO25eUrFeEsiTS7YRx47+NxgI4D2w6j8l+SQINV5lR6ErDV97WbRpG3o73um5bu3zMnnJTt9iqyl/POuUAL5jkzkFzwJAl8xTQiFviwD+mtdJAkk7o'),('65ad8590-3a20-4ed9-9707-90e76ef05430','4256133c-30de-4fc1-a5bb-1f7d8e144bf7','privateKey','MIIEowIBAAKCAQEAndgDUhMdWeeFO+nCeTCOuWWcSXZ04KtiDa9MD/mWSqyooV9mLWuEjioSa1CuGYItDk7/RvpxZ2VCHbB4BCQY8UDLuhxL651aMtUC31d0arCIJjaVxgd5ov86bjxN3S4cRmoezdRy0Za/hXlhA7x+3IrJWbA+kiv84cniUilX/5aAHo8m711+QxcT4PPCN1TpQprfl04q3oym0GhUhfJzlb+E7YUuM2eZrEupav8Hyc6fvtB3WY4ZM+oL/NkqaZllGllS1aksw2DWdysXpRXJE1OWGxtqhlAKyZ/PzyN7YDzaamUS8/8i9FSWluO6MlZ8ZmrRIgiYyXudp/O/gOQNTwIDAQABAoIBAE2p2Yhqq0hvKBkgnXVvtOn32vwycrOQ4AAHvo8lqRM4/QfZnra+bkxc2w8+dUtLx8uAhw5vb5kGM4/UIlk3QaaC0TrTbW+SzqywLmeh6kAMeBEFTpBPYUQX/LH8rfskEvl6gYmY/J2vZLDR1jA2cN0m1IdytnbJefXGlbsDaK7yomIoNvkfSLrQtKMJ78UFdp8VwzcH3OslxQf+9xwLH+2GpXOpJtdIXrQ2xZrDAgq5JEGyecFULe2+Kd8dWnjcF0RT3hmjvITF2ukTuRM2y6ckltaoB9+drH83KkzPFB3UJYLUeeNXY2KkhGV+VjdMHm2CFzYkZlf6APeWZamNX2ECgYEAzL8CmQu4OnEh3pfr9fBpEzkFzUNii/13K/sNhtvrUFtLcxb975UAZpaUBNGDRV34YOX0qu4JLd0Bup0TNESQyt7jtWnGYa+jnrrxt1Zg1UvIVYltwxZFuElvXoPl8phGCbkgStn8Sr2dhRMDcbudS1JDyb8wHBhs7iMHipR7s9kCgYEAxVtODLo73ku68MIUTaij4U5xHx5/mnkYBNSXs86PqAa38KqjCvryLeNbUG8uA8LWrqs0JdB4vy79V+PJ4vpxyvVVXQpRORtv3Ofyap7kNsjsZMLIKn85JTnF8/xEuDuqIUf3XvmoWbbFfkNXo8vr+LcKRKhATx50H02b5u5ymWcCgYA/73GvOwKndUZ/TO+JGC6nqwnNxDoUvuyk1juuHiSILkoMQWTAmMXMQz8rlgUo9yQllglmCvjg0n/Et2IU00hnoVx3/PTO8lrkqTnr51RLpuODGmwlHGJfHsdhO0zmCXjtdlrIJPPsnvN+Z6aOsGh46dJzQHmUfGgfoN6s/pr2WQKBgQCU6/H4XquAcarNs9W4SBHpmNR5g/0L5mZ+dqFGmA8E3pT8MPa4+WW3xMEJ7+tMAUEYKq49/pKuyVl4cbXM5ejqGrhgbcGekxqVGh1t4RoaUQE4g1ah4sCPW4oJMwnz72nQlUqPy1oC4I0kWtKOEfmtAwnnhwKH8VX0rQ6Actvc7wKBgFaC2z5VnkmIvTwd+Egc1U96RXYO31dauF16TkTL6eJuo/gbicqMjpVuCnSPeAiV5G6xat5eOkhsebG+NzS0reGnyVzOTjzI9V24QsLVSLvZiuEB6xZ4C34Tk+4JFB4Tw4mtXoxCYUwRwYaDmyUpA3wfCfyt7nX+eLd4MgLTqnfr'),('65edad2d-fc69-4d04-8127-98aa8edfb2ba','c0942108-474e-4487-a749-87c97b279b5e','secret','Ho-3-EyhkVRSrvs7n4OFEA'),('66e6c383-4ada-45e0-ad0f-06fc28fb4e94','685cab00-ff59-4652-b454-f2f94e6ec281','priority','100'),('676dd528-43c1-40be-a301-587ef78e1a5b','8d455a97-a460-4a3e-9e32-16035b525957','algorithm','HS256'),('68eaca6d-a69a-45e1-b5ce-4a7c6ff639c4','1881bc78-ab53-414f-bba0-3f85d5072428','client-uris-must-match','true'),('69ff9cef-db9f-4e57-ad92-3582d248d27d','d0643274-a432-492d-b8a0-74c461cdf567','allowed-protocol-mapper-types','oidc-full-name-mapper'),('69ffd9c5-510a-4fdc-af1a-76b37f38cdd7','18270526-a150-48ed-bdc8-2291ea2cedf0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('6b54b37b-91ae-4c97-bc24-c73c40a1dac9','68a7112c-4d5d-41b6-bec6-9de653cc688e','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('6c12b3ca-acff-457b-9535-f5d9ebbd720a','abea034a-519c-4821-ba35-ffe6ddc5820f','host-sending-registration-request-must-match','true'),('753a60a8-7656-45bf-b4b8-78b53845177a','dae37519-326f-434e-8bb9-8fcf863ae730','client-uris-must-match','true'),('757f859f-5256-4107-903d-d734d50b7d62','392db386-ada1-42a7-a6a2-22a7f722b2cb','certificate','MIICqTCCAZECBgGTB3K+8DANBgkqhkiG9w0BAQsFADAYMRYwFAYDVQQDDA1mb29kLWRlbGl2ZXJ5MB4XDTI0MTEwNzE2MjQ0MFoXDTM0MTEwNzE2MjYyMFowGDEWMBQGA1UEAwwNZm9vZC1kZWxpdmVyeTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJsKJRjtE4Ryl6296zE4ngTnWIxcEUYI94s9FvU1YxRS00nOQ3tNhKpMTZWZl89VfUTg2YO+gy4j01+ZWkV2h35Y9C4WFlQhbUzPY9KmA8ZZKtvaZilDJg6Mul5zIcorkMIKAGE+JWaXun2mZUUjY6olq7mM+Abaj0QHRIuzxWAxn54l0sHq59LZJeSZy+u+KAKI/1tD+2qU5Bv//JSPNMrtMdix8kwzY15Td3e+cfV9HSmcZnU2ufavKc9mvDeQ+YRDMRbpBHkY54GD/6cj2QYwKFg0N3o8C6mHlloVbyqnwXT6h1UMppv50wOWrM/t3TxvMxwB8pppw4VSgCceVjkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAkbduh3NYRLBhoy89zTayB93A2itYy55zDsHJsMQIT3za5cDVtD24mKitIZuxbKdRt9eh//oPNam0aDPRpkgunIsaglEkhb7wCxybyqX4cwQplF05/j30fHQEnq/5QNSTXPb/LnTnbkEbeCeKatjerITkZwDBghM2yFAO8Pv7KwgbLDmHUz4m/mutpkqALFNTWg2x2drau98tddEx9b0yrGFObH4u0z+irRZZ9Vg++EKYcD4EHCLPPcKY1Q0BLcy6czU32gDJNdegSe55UQghitvzBHB8OYih4XdFNC58d/4UM9EAl8KizurDhRCgw7WUrTHY9yWk6JxX2YML+ZdwrQ=='),('76a0c3a2-e38c-4d89-bbde-4bfd9827a1fa','e8caf968-ee2a-478c-8f9b-cee3a7149beb','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('781c5ab2-057e-42f1-87d3-244d0278b751','d2a78595-d631-447f-87af-28087f35e0d3','keyUse','ENC'),('7a14c1dc-1e98-4ad4-9cc3-66b0df57af5a','68a7112c-4d5d-41b6-bec6-9de653cc688e','allowed-protocol-mapper-types','oidc-address-mapper'),('7aaa7d44-6d1e-452a-b39a-aeef8ed0ae84','2a887884-f6c5-48e6-83b7-412d0f0956ed','allow-default-scopes','true'),('7b6b6f61-fd61-4c40-a0de-26fcdcc46b62','d0643274-a432-492d-b8a0-74c461cdf567','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('89cedc00-30b8-4944-b6aa-d8847756f2e6','e8caf968-ee2a-478c-8f9b-cee3a7149beb','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('8fd626aa-04e7-4fbe-9a03-61870f282bba','4256133c-30de-4fc1-a5bb-1f7d8e144bf7','priority','100'),('97f41b15-786d-4b85-8c03-0b7cfb14fedb','685cab00-ff59-4652-b454-f2f94e6ec281','privateKey','MIIEowIBAAKCAQEArLsgHm/V4Ycxy9nCsKn90EF6+0txswt0x20hD+4mSZSfMLzQc2U4HP0BecqvgLPWtV/I1QxsdtqZ85JDQlgWv7DfaEQPgipkyMCu6662rZyPW4mp3hjkcvGCsBjstUbrQ0jr3EqjEd9cGnE3hZ+ztIdgoVTTq8BIyUspQlA11932hkah6yyrNHJHhBAE1gg+lblEAeATEOIkmfyKTVqi9fvYpEacopONAkxP2QUURAEg1KNF5sRwr4fCl4P1zwVWC8pEPX2StzY7liKCv9w8hqvoX0TD1cuFP+zehWRiEXRk2B8sB3gWIpek2aw29Q6b15BYHA/vqG3HzprvAuA5BwIDAQABAoIBAA42bXujpx0iAyprVhY0PpKyuJxRxl69nBPGung1l8fpJzoa5yn/k6Dq/oKXd15nLc0JvxwspAYZkZ5VlBwy5FhMhO1u4DnNJDLSi/IPk69wWOlmx+fi83UzwxWbT2rRFY2ZQ/MB3y4ay1jPpQplLCO4Ge7cbHhO345UlWYD9JI46hOpxz8qXdK+RioAJ3HFrIa/ObZguCnuT4ej8oyj3hd5B+bFqIDJlYUMCWePxFLlxesJlEwPG8wQPSabV1P+X/96RZbGhv/P/O/7TF0n/8nn3s5racGSAj84q7tUhlpG5mp3ZrYwENGCzmBhfWOb4IldfjyRCKqFfV8yqs3Li50CgYEA5OBKWmPV7f4QiQzaQUQnPI1X+SbUwptKmbdamzVfIEOrFk1xtE20P+KmUpSxZp4NgY1eNhoaezyjXRHHu3QWpMKGQSOFJHLl4nu4sltfv+L24NuyS92c2ZribP6t4JE0NCLpGOwaXVKS5O8m/DMwCmJyr9Mjgn11Pr7neOvWq5MCgYEAwTN8lJSgQIrO/AyeBJygQ4y5SUKocvcfyvoDphlpHY/qSzzojGbocvQi6vABjgwDxZkvZeLEaIQZfD7nya9guVDxjDnX3+z2qLeoWACVyvOGqVxNIB7uhNkZZliguwxPEGKFdyEGp9BAAHJ9jL00UmbA9fje4q98O0RxKih9rT0CgYApdC5DXN28c03PZNKLC6sHnpoWeGAEt1e1q63veqU2FMuCCJjVjVVeVNDHGENhULMlidNMfUHanEsCalwAqbAIO2tRlPtidKUKdlong8E94f/RDjmm4AauqwzjrOUVTXdlEgWiC/Figbg1WtN2zlafKuGW0ukVk1+O88i88Ao7nQKBgQCXkqUyjEgNWtl4tQ1j4N17IXRcHYe6albvD6a9MUJehwHxdR+cxz+msBKU7ybJInPzGnMtI/Oja7/y0gdXG9huiyp2MQtECsyZIT1ZjVv3lYcYZ+m6QYovf4OF4BJ5rPZ6jFDZXXezQJZ1w1zshaP+4c6RK2bxwWtdtBx0TsAKoQKBgEAIx5lplzQOdSSup28IdAyaHW14244DfUdbLgAG5RBgKZB4kIXkBKQFjjJsoqZNtlW8LJCkcNPnxEXF+TazRfh9u8Hjq3WnnjUiecqfI3mzWgrcoqhdt1hq0LY2ywtT5Eb4OiiZe4jnf3BQdgUSxmW5zViLRsP/T4m7dlVTTUXu'),('993d030e-3228-4707-992a-b8a603928340','a50c7c5a-3a0b-460e-b91c-fa76b520e209','keyUse','SIG'),('99ae26c1-1b11-4f8c-9a02-42873e35dc24','d63839a7-5cca-4b77-afe9-c948eeeb2bfd','allow-default-scopes','true'),('a19c5763-e62f-4ad1-b374-a132f7846ae0','2d9cf364-3e62-429a-bd72-84bc0ce611f4','max-clients','200'),('a1ab1869-0776-4ba1-a24c-c924b2dec9f7','d0643274-a432-492d-b8a0-74c461cdf567','allowed-protocol-mapper-types','saml-role-list-mapper'),('a9560aa7-b3d5-4309-ae4d-052e3ee92cd8','68a7112c-4d5d-41b6-bec6-9de653cc688e','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('a9b51aca-8b7d-4e59-b5d6-a3ec9c6c0a43','68a7112c-4d5d-41b6-bec6-9de653cc688e','allowed-protocol-mapper-types','oidc-full-name-mapper'),('aa37637d-9b3d-46b1-b80c-ff8be030d410','d0643274-a432-492d-b8a0-74c461cdf567','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('b0323480-0183-41d3-94dc-ab3f961e596f','e8caf968-ee2a-478c-8f9b-cee3a7149beb','allowed-protocol-mapper-types','saml-role-list-mapper'),('b1579509-826d-49c5-af84-3754ca6325a5','0a7ba27e-4373-48c8-9e79-db0145360c65','allowed-protocol-mapper-types','oidc-address-mapper'),('b3a85a90-4050-4568-a102-62d05559a378','c8c33fd5-b2e4-4260-b742-fcd57ab4371a','priority','100'),('b8920771-75b0-4680-8991-577f8a6824b4','70138f68-d7fa-4a00-8122-5566ae19728b','algorithm','HS256'),('b8a8e776-3081-428b-b726-235c86f6739d','8a3d95f6-1d3e-4125-8999-5721e128c4be','allow-default-scopes','true'),('c42efddb-709c-4a45-8331-38eab67c894f','18270526-a150-48ed-bdc8-2291ea2cedf0','allowed-protocol-mapper-types','oidc-address-mapper'),('c8813c10-67c5-44e3-97f6-33315b3c56eb','392db386-ada1-42a7-a6a2-22a7f722b2cb','priority','100'),('cae01ce6-caaa-4269-bb40-b516057b3a80','e8caf968-ee2a-478c-8f9b-cee3a7149beb','allowed-protocol-mapper-types','saml-user-property-mapper'),('cbc60c1a-1759-45ad-88f5-23d98183562f','d2a78595-d631-447f-87af-28087f35e0d3','privateKey','MIIEpAIBAAKCAQEAvTZOZB/fpQfecfs+C0CNcwvH7D3XHaHh65GS37NcK4pcfP+uNxy/Lkx7KNl5zGMJKNbDV1u1gIvCOEzo8dvQOmWT0ODFj1FsAWqPGa+k941ht34qDH1WEBa3vVNt7AwFNwzrMtcl13+m7ko/Da8qJRAJjkDLJtXpq/I7jHrhJesW4KxodQzaBHSQWELk/2VSvwXX9kfIhj+aHn2ypR608AdpfkfF1l+GnhZa+KV5llNTrvH80jEJ2f2+x9kWbESMYOnrDKVpK2N+HZj97Bf7lhoK1HsGZsPzJbysoz6TJqJr3QLM/JtZkwJ6aHVzbb8OQnEDBfb053mL47QP74zUPQIDAQABAoIBAC0B/j8sYslRmB0SV7Wa/xqi7oU4R5ONpp0ftWl/c3kK8kmskx8aeDKV8ETtCF8xHqRng7NjxgakGAjG6LFhaYR+lZz93pijFFc45v3D7XCSYbBhczSh2sc8dCv1rMPVrybjbI4dJev/OjDcGegSJusGh9Nd/8UG5MzpM7eMokJfoo/lrjbv+3NuvAu/H66CxQl16Kcar4h/Yzkgnru7teR16pDrVS7L67jlcyyERncTbBpp4QDm8qGO1E+HgkrY3N1k3VtyVpTBca7YxpEtTx2atzbAH1rwrXnnYc2KBTl/8NEjOF+2c4HLJps0MGMVVyw3YQTUni/fZsOjPPaRJaECgYEA8o4ettvZmE+xqVCEsXmYunmsonQ0gBcfhIErk4jO2PfJLgijPRG5/E2PeUCGiOMn7M6ComIacvXTaqj/eP1v3SDB2+ypEOlqBDvW0mb0TqH171UP7ycI/8rzRmgktkNrBXVoOcbskaOKgrRX0yrHDMyzEYUHleTLdUDxunFJGeECgYEAx7M+a75EyM/XcS1SKje2GLI1PWPnQSPQLXNAVL7wl2+A+SO95Uwn37fLk3u5IHTNYJC3fIQl4rSZ1U6m8OCeEBz3I6JtYdeeqnKwEAGqiooiZPO0zjaFdnrEFWSSj6kie2C8INOKxelbcelEe2lFv9rVEsp0zvXpKrkLDAnjHd0CgYEAnSZhVf45C8rOg7GMV2Q+BMtig1qgzUCuBe6eqhbgVYitCqtEAAQlKQejZl7dC4GJU4806jp/gm4tDRTzeJNTT8SydWfu3ess6hNPCsDzlqKuseK90SfMV9ZJKhu9dW1WwJGh9pUgnveDfU2U/Vbg4jUZ68bx9Dbpb02lkDNntmECgYEApFBTuAtiRWjed/02cg5NApz/OXgOO4bgL8V41UIWbEQO9u/1u8mhtW5hTwSqGo6AvkfU8ds54QOA4AZLTj9DTzbGEsf/AFaN8ulS/JiiXkOycSYlSteJkScKWB/ch+A+ww2hPdFRie6sk1nAQ1snTOkeEMwMuI2WQNToxgsMmPECgYAdhq45aVor7240tmCcK9wpvgxgpZ4DZ+cMXY0qg5j+0XzkY8IsotHnlydzGX+ySBt13yy7P8SGnNGnf2CwX5omczAOb/qRMt96wHrSUX19PRplZ+GheW92kOcImqGUz2Z+cL/zwxFpU+u4IfJCGA4IaHotOxOVhQrOgWdvYwFZiA=='),('cc5e2bef-3043-441a-9224-bdc4f54723f4','0a7ba27e-4373-48c8-9e79-db0145360c65','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('cd041f73-666e-4467-89d5-682de80a3792','c3e97252-a3b4-44f4-8403-8b05e5e2c15a','max-clients','200'),('cf551388-ec4b-4528-a85e-42fbfb16bff2','0a7ba27e-4373-48c8-9e79-db0145360c65','allowed-protocol-mapper-types','saml-role-list-mapper'),('d1997070-68b1-486a-9ea3-e0dd5044fe34','d0643274-a432-492d-b8a0-74c461cdf567','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('dd51e6dc-045e-46f2-89a6-934feba5c83d','e8caf968-ee2a-478c-8f9b-cee3a7149beb','allowed-protocol-mapper-types','oidc-full-name-mapper'),('e0ff942e-fa72-4ff0-9096-aaa44191a466','4c65ef5a-c1bd-49c0-b07f-51cc5da4ad1d','algorithm','HS256'),('e1880a63-958f-4e10-820b-b231b735f331','c8c33fd5-b2e4-4260-b742-fcd57ab4371a','secret','rV3y7c41u0iOapXWwrRLDw'),('e691d1c5-ee98-4126-836f-5830fbb40806','4c65ef5a-c1bd-49c0-b07f-51cc5da4ad1d','kid','a74c45b0-841c-4238-8360-709e9686b756'),('e8b08d78-df3c-4d59-9523-257a80ffebf2','fecfc855-e8c1-4bd5-a505-56373a7479d2','keyUse','ENC'),('e97f5b07-25d1-4c26-828b-db971cf5cc66','0a7ba27e-4373-48c8-9e79-db0145360c65','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('eac41323-e54e-4db3-8934-6c7cfcb6bd97','17748748-908b-4280-bdeb-8826cc09adef','allowed-protocol-mapper-types','oidc-full-name-mapper'),('eb3ecb28-450c-4f24-a2ea-03465e4684d8','68a7112c-4d5d-41b6-bec6-9de653cc688e','allowed-protocol-mapper-types','saml-user-property-mapper'),('ec55120e-2409-4606-92b3-bc72ecbe8441','70138f68-d7fa-4a00-8122-5566ae19728b','kid','75027677-e835-402a-9ab9-fd62b1804f4f'),('f1f16382-1899-4932-b7f0-9ba376c39f73','17748748-908b-4280-bdeb-8826cc09adef','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f2026300-a772-4e50-bcae-5b881adb83e8','d0643274-a432-492d-b8a0-74c461cdf567','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f28fda34-f196-40fd-9975-b9aca402d707','4c65ef5a-c1bd-49c0-b07f-51cc5da4ad1d','secret','D-Z9wrD-mC12gf3_O7qWj7MS9Op7mVxxbdNcEaGiEKsUUqfLfueALL7bh2jwF8OOIVCdH5OA3fgchUbh5Ipzvg'),('f547ba5a-8519-4900-b544-230912ebdaa2','392db386-ada1-42a7-a6a2-22a7f722b2cb','privateKey','MIIEowIBAAKCAQEAmwolGO0ThHKXrb3rMTieBOdYjFwRRgj3iz0W9TVjFFLTSc5De02EqkxNlZmXz1V9RODZg76DLiPTX5laRXaHflj0LhYWVCFtTM9j0qYDxlkq29pmKUMmDoy6XnMhyiuQwgoAYT4lZpe6faZlRSNjqiWruYz4BtqPRAdEi7PFYDGfniXSwern0tkl5JnL674oAoj/W0P7apTkG//8lI80yu0x2LHyTDNjXlN3d75x9X0dKZxmdTa59q8pz2a8N5D5hEMxFukEeRjngYP/pyPZBjAoWDQ3ejwLqYeWWhVvKqfBdPqHVQymm/nTA5asz+3dPG8zHAHymmnDhVKAJx5WOQIDAQABAoIBAAJFsUp+uwD/bvKobGiBxGsc+uK/vK8SlZIwWIRKfoO/PQKBZ+LIPZADY0W0hRGQVrAqPXXdVm3YL5JgnH6VIKI86oM8ZqJgBQqRpYxiS37eMq8bMdEb/1RKQrb8p/ufDNWTMPM75m9s/No3lJdhT+Yf/DbRdpcfH+dm1d3YSiXBPpb/4PqAxE5sEKyqTb85ew2Lj0mHnQtdSmqUEyZSJuJxbTpUPpFSOH4GfGD5klIpn0ddLF48JapTsRGeO4wcc2/spAq5mn8+WlfXPq6AB6KW6nCUKU74JSnaZbSZjoQfiaRpcmMkoTdONULBffyZwteYt8RanpepKSG34lcA7fMCgYEAylCp/u1t16VJggdzB9aDVJiwpxyc/gwO6PZpzpCg2T7ixMa2cZZ8Q5nEW15kIobWxV+5qaCw3lLCexE69rWmnmKeFutnEPXDv1Ie+0TSY4xPz7tWLznaGAzX0TKA9Kl5jRmnvkQSpWzBG+XN55nfzcmJi1XI0XqJHEirFQN6UVsCgYEAxC4KsTaBYOKzdlwGRd/dET20aHqlxUVhZFOyxUw2iCpGe4cg+jqiyNBs4vB0N8g34fysCZ1Y+X+U47MHnOdUa9KZQC+ZnO6mbMOxo015AJJiIyzmDuE+me0HTxVi35qem8hxWzud0tNsRVGOeCjt02J9WJitWY3AuajcLO9UVvsCgYBjvsdBN1/bXNNT90ZATANt1uXpThMcsWc8dhiOTgHvebCl4W6bq9zSG2KSxYPK/f2vS9WmiuIIinb14/XVIpPmLKrSk/a5huGeVueNbE3p5IiI20zPdc9P4i0ZJ7Qqa8/QwCBSjw8+XdMLZQ5SLCwKMl3Mw1uB487rkew/LPrGVwKBgCgZkS3wCjoXnL9QyCd4PuPLTRkeGMxeBi5PvXb+wRbMLWQKlv8PBT8u+1LX+6l7T5Dt6Ox+MTWukmyIp8G2t1bi0ViBYlDlpzcMOT88EsO/KDgwcUYRXI5yGNBderxiCpGlQyZ25Se296ajqQ9+rj5LH3wAmU543zAUCA1XTlIJAoGBAIGj2YQMBVZiqRcUGgSv8U83qEiyz3EmWWq2neK+nhPKEtgPK0/v61Utsx6lpk89KG05gTz8tJ910UA2MCES21gSr+f2tnpnh+NAtQTmzTAT6DG4D8JFAc2XSs+6G4xVq1xJlIO2TTKHzD6MpZhpO8+g47tEVvbqmYjoWlt6+CJo'),('f5637041-d37a-4726-888f-4a08f3774b70','4256133c-30de-4fc1-a5bb-1f7d8e144bf7','keyUse','ENC'),('f644c6c7-5036-452d-8e07-770306dd3c72','d2a78595-d631-447f-87af-28087f35e0d3','algorithm','RSA-OAEP'),('f85daf4a-9b6d-4f53-825e-3ec0c7c14293','17748748-908b-4280-bdeb-8826cc09adef','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f8b8d1d2-e24c-4852-b20b-6500ec8d76f0','18e9271d-5858-4121-8491-665cc33e6b41','allow-default-scopes','true'),('faf07d74-6b04-47c2-9c08-749120ae3046','0a7ba27e-4373-48c8-9e79-db0145360c65','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('fde5275e-67a1-4b9f-b8ca-27ea40a283d1','685cab00-ff59-4652-b454-f2f94e6ec281','certificate','MIICmzCCAYMCBgGS1+EcyTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQxMDI5MTA0MzI3WhcNMzQxMDI5MTA0NTA3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCsuyAeb9XhhzHL2cKwqf3QQXr7S3GzC3THbSEP7iZJlJ8wvNBzZTgc/QF5yq+As9a1X8jVDGx22pnzkkNCWBa/sN9oRA+CKmTIwK7rrratnI9bianeGORy8YKwGOy1RutDSOvcSqMR31wacTeFn7O0h2ChVNOrwEjJSylCUDXX3faGRqHrLKs0ckeEEATWCD6VuUQB4BMQ4iSZ/IpNWqL1+9ikRpyik40CTE/ZBRREASDUo0XmxHCvh8KXg/XPBVYLykQ9fZK3NjuWIoK/3DyGq+hfRMPVy4U/7N6FZGIRdGTYHywHeBYil6TZrDb1DpvXkFgcD++obcfOmu8C4DkHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIghJFUPoAh05zRHHk47YOzsa+b0xnZ8OaOY9EcZgxEGIm7IOTxPopOp9X8lEkwJQfu6iV1rKe8nvnqQHeIzfKcOBmCXFy816fmn225DhPv2iar1RxVkfkoZNXE5AW/Bks4WbVPmQA6pEbPH+rUchq3Qx5ehO2LGmsG5ltOgmANAthi1Cql2JSw6s+IN2G7nyEfs943DESupv6CY567VZbzdGvOIxzjwgdwywvxOjtx9TSioQFXN2naHqODtx4KJqZZm+oHC3KRbq1QfCz9tiVt0QFKUkw0G6tUky9SoINr5nCUhqFaY2Hnm/KZM3DV6ryRdbfWva2gb33VPbSfGPBw=');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('181a6a4d-d6a5-4aa2-9877-87b5c9ffac53','68089158-4f6d-463a-89da-42234303f6ab'),('181a6a4d-d6a5-4aa2-9877-87b5c9ffac53','9f22515c-fa46-4255-b32c-b1adf12a72d3'),('181a6a4d-d6a5-4aa2-9877-87b5c9ffac53','aa4a414f-79d2-4210-a662-1eb51ccf2ee8'),('181a6a4d-d6a5-4aa2-9877-87b5c9ffac53','e06de8f7-b1ee-4104-b8fb-3c0ee4153964'),('25eaeae4-23a8-4b4f-897b-5d3404412e91','b4be4af8-e988-43ea-a468-8f32dd2c1870'),('26997de4-9f9d-445f-a6ab-3762b1621881','3f8c824a-9247-4b23-8e79-127335932f01'),('35a8343c-20e7-42d8-aaf9-d7c0e6804790','86441f55-bcf4-40cd-aecb-5b34983c6f67'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','22f596a6-b6ca-4f84-ac1f-a305ae062ab4'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','246bd9aa-66a4-4fd4-956f-73cfc3d81d17'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','40f989e1-5a2f-4e25-86d4-2107213faf55'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','41f40da5-85a6-4e94-99e0-cc0e9e79e58f'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','4f38114c-9c85-4df8-b6ad-071ef61f7630'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','59d40d4a-8973-446d-bc76-daf073165b5f'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','67dd0086-4112-4f37-abcc-60eb6fe4d7e5'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','690ff671-8bdb-4d0a-8432-a3379aa196cb'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','7312dbca-be9e-4169-9fcd-1fe6d7227a03'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','7a29e619-6931-49a9-80a4-41f78a8d2b4d'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','7e748adf-acf3-40e9-b062-17f417c26b11'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','88a45121-ee62-4168-9dc4-95ad656f5a56'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','8ff0de0b-3a4c-4566-85c2-260fc26abea7'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','918f744f-2911-4637-8363-ae4639779dde'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','a030ff56-ab2b-4c09-8329-ce3e6420fd2b'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','b8e659b8-d854-42c9-bd87-b0481cdaa555'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','d3377cbf-a3b0-4dd4-8160-21d1763f6a57'),('38134f3a-dec9-46f7-aad9-d6035f64fbda','ea716c9c-5dd3-4a26-9e35-89655f790114'),('3e1dfc6f-3879-4bd4-9cfb-e8603d6501df','aab97ed6-5ca3-4f99-866f-715722ed6232'),('44c1bb20-d47a-49a5-937c-de590b425ad6','0d79dd8a-1810-4674-8236-3d459636ee78'),('44c1bb20-d47a-49a5-937c-de590b425ad6','409be67b-e805-4009-862f-64efc9fea501'),('44c1bb20-d47a-49a5-937c-de590b425ad6','5bed8e8a-9098-4517-a765-c7a9255927c2'),('44c1bb20-d47a-49a5-937c-de590b425ad6','ab41ccae-c5ae-4a7d-98ba-2982e7c7c0c4'),('5b5fde94-7b18-41c6-a3ea-a3a0d972d97c','551bab76-9745-4b4a-b29e-c5c4f314341b'),('5b5fde94-7b18-41c6-a3ea-a3a0d972d97c','d7efc3c1-b94a-4e31-ba86-7739abe5fb24'),('88a45121-ee62-4168-9dc4-95ad656f5a56','7312dbca-be9e-4169-9fcd-1fe6d7227a03'),('88a45121-ee62-4168-9dc4-95ad656f5a56','918f744f-2911-4637-8363-ae4639779dde'),('89388cca-710b-451e-8c6d-331e7cbbc6ef','4d84c7dd-322d-4de8-8ac7-621b79da768a'),('89388cca-710b-451e-8c6d-331e7cbbc6ef','6338e11c-67c8-4a1a-a27e-451e2276163a'),('a7cd648f-1011-453c-8621-7704e3b57679','09773f60-de8a-4cee-aadf-54aeacd385ed'),('a7cd648f-1011-453c-8621-7704e3b57679','10623cd2-fcc5-49b9-a559-c510c801281a'),('a9aa07a2-a748-47f3-a4ea-b5fd1fde5dcd','f55b660b-2208-4741-9775-6f1d3cddeb46'),('aa4a414f-79d2-4210-a662-1eb51ccf2ee8','b5b8fa08-b1f5-4a4b-a34f-f2ffd446ad90'),('ab41ccae-c5ae-4a7d-98ba-2982e7c7c0c4','1faa92f4-af9d-4c9a-9c31-36f11d59851e'),('b3701d81-226b-473a-b6ef-ec78ef77e3e0','9a78119c-3345-42ca-ac30-63aea9d0b141'),('b8e659b8-d854-42c9-bd87-b0481cdaa555','7e748adf-acf3-40e9-b062-17f417c26b11'),('db431920-cf9b-4e0f-97f5-7e558179cbc3','139fb3cb-0cd5-418f-9b8c-2a059a608e59'),('db431920-cf9b-4e0f-97f5-7e558179cbc3','66256614-3005-48d7-8014-51cc14fbd9a3'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','02eb8bf8-7042-4e6e-8992-dc769662ca74'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','03386f43-5d31-4ce7-8e1f-a4bdccd4c669'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','09773f60-de8a-4cee-aadf-54aeacd385ed'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','0a8445c7-a1ff-4a4f-8f3c-fc0134c5e925'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','0b0a4f87-0c70-4df9-aa16-3bedf3672cf3'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','0e7deef6-33d0-4ab3-bf4d-94fd43b03ab5'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','10623cd2-fcc5-49b9-a559-c510c801281a'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','18c63545-75f1-4bfa-a4f9-5070389ad0ae'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','20f7d91e-4a70-4786-b1e5-70ef70d8cc72'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','22f9df23-ed07-4210-a865-dc0970795c83'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','25eaeae4-23a8-4b4f-897b-5d3404412e91'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','28a3d1a7-e7ac-42ad-b57b-616851b10ad8'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','28c9d304-3587-495a-b770-b10432ac8344'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','2a21d81b-af2d-46a7-a5ab-af1a5d1a89ed'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','39b8338f-1d75-4a03-9f94-aacf04ecb0bc'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','39d4d726-de60-40b0-96ab-2ecbfe12339e'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','3d0fbdea-9051-4971-97ab-afcdfb812e18'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','48016a8f-2db1-43d9-9155-08eb7f6816a6'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','4d84c7dd-322d-4de8-8ac7-621b79da768a'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','4e6f2ed5-3fd6-4d80-812d-0257a783dc9a'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','525ad30d-e09f-4207-a376-c86d02d5e3c3'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','551bab76-9745-4b4a-b29e-c5c4f314341b'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','573a17db-78dd-4a75-9856-f47f96b86b3d'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','589e0acf-0cc1-40ce-8857-a375855008e1'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','5af39ef9-58ee-4f82-a439-50ab4337ec3d'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','5b5fde94-7b18-41c6-a3ea-a3a0d972d97c'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','5cb68ed2-449b-4eea-a612-1f28c87710e0'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','5ccfcfcb-7feb-4376-9c48-46be08dcaa17'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','6338e11c-67c8-4a1a-a27e-451e2276163a'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','71034bcf-4802-490a-8340-c40d92f5858b'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','7d8ceb43-4a03-4d05-8b87-a3c6b72979de'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','7db4e59a-65d6-45d6-8e05-dd3060657d1a'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','89388cca-710b-451e-8c6d-331e7cbbc6ef'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','986d7ee3-3356-4546-b5c4-a86d67416736'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','9a78119c-3345-42ca-ac30-63aea9d0b141'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','9e60db59-3420-483b-b1ee-8ed77dc33d92'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','9fbb03ea-2d0c-4556-afe1-6fb898a8780c'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','a7cd648f-1011-453c-8621-7704e3b57679'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','a9aa07a2-a748-47f3-a4ea-b5fd1fde5dcd'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','acb23971-bdb3-4523-bc5f-2cb3402ba11c'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','b3701d81-226b-473a-b6ef-ec78ef77e3e0'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','b4be4af8-e988-43ea-a468-8f32dd2c1870'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','c0ba62c7-e448-4f67-9e57-bcbcaf3dc89c'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','c235536e-7db3-4006-a544-518b5d462e00'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','c559d0a3-2dc9-406e-8fd1-4db2885ca9bb'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','d7efc3c1-b94a-4e31-ba86-7739abe5fb24'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','d88012e9-6fa2-4c14-9358-f6ca7d03a195'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','dc3fb727-6754-4443-aaab-f9e41f9ad299'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','e0fb5cf7-f700-4fd8-aa62-97b3035bac47'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','e54e42ba-cc89-4511-bf7a-3dbc4f105cfc'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','ed2cd1f1-4171-4c22-95c1-5f6ca80df49c'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','f3445414-6536-4c94-9eb3-0e7481edd8ea'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','f55b660b-2208-4741-9775-6f1d3cddeb46'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','f5da18c4-bf45-46e9-81ab-97de214e7758'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','fe03a892-e40d-4627-bd3d-ed13429d5db3'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','15041204-f8b8-43e2-aebd-182ceecd78b1'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','35a8343c-20e7-42d8-aaf9-d7c0e6804790'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','a886c549-3066-4658-9357-e3fc30e9b15d'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','be3b6f73-220b-4df5-a6d2-ecb0cb5d6d93'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','de398b3f-c1b8-44fb-80d0-ba918f44e0f2'),('f4f68015-6955-4a29-92e7-6be73c26c718','6ddafbed-ea83-4524-b30e-da513c8a624b'),('f688be68-f57f-499c-a2dd-298ab3c56c9a','97c92d5f-fbe0-49c3-8a5d-191279ce220f'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','0371c547-fd6f-4185-9b2c-f528985c245f'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','0b40d9e2-6275-43bf-96ea-8bb398aacffc'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','139fb3cb-0cd5-418f-9b8c-2a059a608e59'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','19360427-7e7b-4f60-a800-ac5b186f653a'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','4cbc7f45-9239-428e-9ebc-da2fa1a406be'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','58375c4e-ed63-4d43-a01d-5159fd59dd78'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','66256614-3005-48d7-8014-51cc14fbd9a3'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','6ddafbed-ea83-4524-b30e-da513c8a624b'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','78663a59-45cd-41e9-afc0-6d4996117161'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','7d7149a8-e061-48c8-9270-24bee5a1f00e'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','98197118-5616-478d-9423-9806f1a6d420'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','a76e1c4b-e6fa-4d92-9ca6-42dbac87f4b2'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','c139ec20-af28-4faa-aea6-6808221340f2'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','d90ae608-3fff-4fa4-97d2-fc43b83c2fce'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','db431920-cf9b-4e0f-97f5-7e558179cbc3'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','e47d480a-12d1-4206-891d-5923be239846'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','ebe25b1a-0fb4-4e0d-b1f0-162b058a40fe'),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','f4f68015-6955-4a29-92e7-6be73c26c718');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('58c507ad-0b23-4e59-8471-2f077ec3457a',NULL,'password','ef9c9cd7-2d69-4f8c-8304-74224b5bcb29',1731198173011,NULL,'{\"value\":\"hgvOarHr1oGH95xE5i2OGvEBdez0LQKpTGIha+EUBfM=\",\"salt\":\"ftQjvUrwR/xralC+ZBzrxQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('dbf7c062-d69f-4b2c-af31-6982ed6c71ba',NULL,'password','8fa8147e-4f24-4beb-ab9d-cf7f131c5daa',1731161365707,NULL,'{\"value\":\"7wWKKcHIxonCoExAeb6voknT/UcoP1ZoZgjm3kb2u2g=\",\"salt\":\"XoRadnvgI/mwIHFmQoyQWg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('e0c8b067-caa7-437d-8eb9-03e853d26de4',NULL,'password','fa29708c-8d31-4435-9ca7-3ea8fcba181c',1731199258502,NULL,'{\"value\":\"QwDgtuybiLL6QG4vMZ1caKUpad/aHV3S72w37+MI14k=\",\"salt\":\"O1j6d+OLT0NtJrvW1dAaBQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('eb66bb96-18d0-4b5e-b26c-35a42a63bcfe',NULL,'password','6f2d44bb-fc31-4750-bf44-780dcaba2c30',1731271338886,NULL,'{\"value\":\"o1m2gZxH4014FlZfYy6tqgdTBXlQi9sh0AChHpQp4uk=\",\"salt\":\"niocJq3GKQJ3GEWIY7cy3g==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('ee38923a-af24-4cac-ba04-d0700dab4a33',NULL,'password','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c',1730198709096,NULL,'{\"value\":\"KGJBFUDeIiEGCTP7advTQhg73V5xMuZsft1/98IOYrE=\",\"salt\":\"DRDxVo3YOHxbbp8yoXQhlA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2024-10-29 10:44:24',1,'EXECUTED','9:6f1016664e21e16d26517a4418f5e3df','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2024-10-29 10:44:24',2,'MARK_RAN','9:828775b1596a07d1200ba1d49e5e3941','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2024-10-29 10:44:25',3,'EXECUTED','9:5f090e44a7d595883c1fb61f4b41fd38','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2024-10-29 10:44:25',4,'EXECUTED','9:c07e577387a3d2c04d1adc9aaad8730e','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2024-10-29 10:44:27',5,'EXECUTED','9:b68ce996c655922dbcd2fe6b6ae72686','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2024-10-29 10:44:27',6,'MARK_RAN','9:543b5c9989f024fe35c6f6c5a97de88e','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2024-10-29 10:44:29',7,'EXECUTED','9:765afebbe21cf5bbca048e632df38336','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2024-10-29 10:44:29',8,'MARK_RAN','9:db4a145ba11a6fdaefb397f6dbf829a1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2024-10-29 10:44:29',9,'EXECUTED','9:9d05c7be10cdb873f8bcb41bc3a8ab23','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2024-10-29 10:44:31',10,'EXECUTED','9:18593702353128d53111f9b1ff0b82b8','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2024-10-29 10:44:32',11,'EXECUTED','9:6122efe5f090e41a85c0f1c9e52cbb62','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2024-10-29 10:44:32',12,'MARK_RAN','9:e1ff28bf7568451453f844c5d54bb0b5','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2024-10-29 10:44:32',13,'EXECUTED','9:7af32cd8957fbc069f796b61217483fd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-10-29 10:44:32',14,'EXECUTED','9:6005e15e84714cd83226bf7879f54190','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-10-29 10:44:32',15,'MARK_RAN','9:bf656f5a2b055d07f314431cae76f06c','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-10-29 10:44:32',16,'MARK_RAN','9:f8dadc9284440469dcf71e25ca6ab99b','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2024-10-29 10:44:32',17,'EXECUTED','9:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2024-10-29 10:44:34',18,'EXECUTED','9:3368ff0be4c2855ee2dd9ca813b38d8e','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2024-10-29 10:44:35',19,'EXECUTED','9:8ac2fb5dd030b24c0570a763ed75ed20','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2024-10-29 10:44:35',20,'EXECUTED','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2024-10-29 10:44:35',21,'MARK_RAN','9:831e82914316dc8a57dc09d755f23c51','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2024-10-29 10:44:35',22,'MARK_RAN','9:f91ddca9b19743db60e3057679810e6c','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2024-10-29 10:44:35',23,'EXECUTED','9:bc3d0f9e823a69dc21e23e94c7a94bb1','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2024-10-29 10:44:35',24,'EXECUTED','9:c9999da42f543575ab790e76439a2679','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2024-10-29 10:44:35',25,'MARK_RAN','9:0d6c65c6f58732d81569e77b10ba301d','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.23.2',NULL,NULL,'0198660041'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2024-10-29 10:44:35',26,'EXECUTED','9:fc576660fc016ae53d2d4778d84d86d0','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2024-10-29 10:44:37',27,'EXECUTED','9:43ed6b0da89ff77206289e87eaa9c024','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2024-10-29 10:44:37',28,'EXECUTED','9:44bae577f551b3738740281eceb4ea70','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2024-10-29 10:44:37',29,'EXECUTED','9:bd88e1f833df0420b01e114533aee5e8','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2024-10-29 10:44:38',30,'EXECUTED','9:a7022af5267f019d020edfe316ef4371','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2024-10-29 10:44:38',31,'EXECUTED','9:fc155c394040654d6a79227e56f5e25a','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2024-10-29 10:44:38',32,'EXECUTED','9:eac4ffb2a14795e5dc7b426063e54d88','customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-10-29 10:44:38',33,'EXECUTED','9:54937c05672568c4c64fc9524c1e9462','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-10-29 10:44:39',34,'MARK_RAN','9:3a32bace77c84d7678d035a7f5a8084e','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-10-29 10:44:40',35,'EXECUTED','9:33d72168746f81f98ae3a1e8e0ca3554','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2024-10-29 10:44:40',36,'EXECUTED','9:61b6d3d7a4c0e0024b0c839da283da0c','addColumn tableName=REALM','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2024-10-29 10:44:40',37,'EXECUTED','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.23.2',NULL,NULL,'0198660041'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2024-10-29 10:44:40',38,'EXECUTED','9:a2b870802540cb3faa72098db5388af3','addColumn tableName=FED_USER_CONSENT','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2024-10-29 10:44:40',39,'EXECUTED','9:132a67499ba24bcc54fb5cbdcfe7e4c0','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-10-29 10:44:40',40,'MARK_RAN','9:938f894c032f5430f2b0fafb1a243462','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-10-29 10:44:40',41,'MARK_RAN','9:845c332ff1874dc5d35974b0babf3006','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2024-10-29 10:44:40',42,'EXECUTED','9:fc86359c079781adc577c5a217e4d04c','customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2024-10-29 10:44:42',43,'EXECUTED','9:59a64800e3c0d09b825f8a3b444fa8f4','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2024-10-29 10:44:42',44,'EXECUTED','9:d48d6da5c6ccf667807f633fe489ce88','addColumn tableName=USER_ENTITY','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-10-29 10:44:42',45,'EXECUTED','9:dde36f7973e80d71fceee683bc5d2951','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-10-29 10:44:42',46,'EXECUTED','9:b855e9b0a406b34fa323235a0cf4f640','customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-10-29 10:44:42',47,'MARK_RAN','9:51abbacd7b416c50c4421a8cabf7927e','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-10-29 10:44:43',48,'EXECUTED','9:bdc99e567b3398bac83263d375aad143','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2024-10-29 10:44:43',49,'EXECUTED','9:d198654156881c46bfba39abd7769e69','addColumn tableName=REALM','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2024-10-29 10:44:44',50,'EXECUTED','9:cfdd8736332ccdd72c5256ccb42335db','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2024-10-29 10:44:45',51,'EXECUTED','9:7c84de3d9bd84d7f077607c1a4dcb714','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2024-10-29 10:44:45',52,'EXECUTED','9:5a6bb36cbefb6a9d6928452c0852af2d','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2024-10-29 10:44:45',53,'EXECUTED','9:8f23e334dbc59f82e0a328373ca6ced0','update tableName=REALM','',NULL,'4.23.2',NULL,NULL,'0198660041'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2024-10-29 10:44:45',54,'EXECUTED','9:9156214268f09d970cdf0e1564d866af','update tableName=CLIENT','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-10-29 10:44:45',55,'EXECUTED','9:db806613b1ed154826c02610b7dbdf74','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-10-29 10:44:45',56,'EXECUTED','9:229a041fb72d5beac76bb94a5fa709de','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-10-29 10:44:45',57,'EXECUTED','9:079899dade9c1e683f26b2aa9ca6ff04','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2024-10-29 10:44:49',58,'EXECUTED','9:139b79bcbbfe903bb1c2d2a4dbf001d9','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2024-10-29 10:44:50',59,'EXECUTED','9:b55738ad889860c625ba2bf483495a04','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2024-10-29 10:44:51',60,'EXECUTED','9:e0057eac39aa8fc8e09ac6cfa4ae15fe','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-10-29 10:44:51',61,'EXECUTED','9:42a33806f3a0443fe0e7feeec821326c','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2024-10-29 10:44:51',62,'EXECUTED','9:9968206fca46eecc1f51db9c024bfe56','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2024-10-29 10:44:51',63,'EXECUTED','9:92143a6daea0a3f3b8f598c97ce55c3d','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2024-10-29 10:44:51',64,'EXECUTED','9:82bab26a27195d889fb0429003b18f40','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2024-10-29 10:44:51',65,'EXECUTED','9:e590c88ddc0b38b0ae4249bbfcb5abc3','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2024-10-29 10:44:52',66,'EXECUTED','9:5c1f475536118dbdc38d5d7977950cc0','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2024-10-29 10:44:52',67,'EXECUTED','9:e7c9f5f9c4d67ccbbcc215440c718a17','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2024-10-29 10:44:52',68,'EXECUTED','9:88e0bfdda924690d6f4e430c53447dd5','addColumn tableName=REALM','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2024-10-29 10:44:52',69,'EXECUTED','9:f53177f137e1c46b6a88c59ec1cb5218','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2024-10-29 10:44:53',70,'EXECUTED','9:a74d33da4dc42a37ec27121580d1459f','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.23.2',NULL,NULL,'0198660041'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2024-10-29 10:44:53',71,'EXECUTED','9:fd4ade7b90c3b67fae0bfcfcb42dfb5f','addColumn tableName=RESOURCE_SERVER','',NULL,'4.23.2',NULL,NULL,'0198660041'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-10-29 10:44:53',72,'EXECUTED','9:aa072ad090bbba210d8f18781b8cebf4','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'0198660041'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-10-29 10:44:53',73,'EXECUTED','9:1ae6be29bab7c2aa376f6983b932be37','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'0198660041'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-10-29 10:44:53',74,'MARK_RAN','9:14706f286953fc9a25286dbd8fb30d97','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.23.2',NULL,NULL,'0198660041'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-10-29 10:44:55',75,'EXECUTED','9:2b9cc12779be32c5b40e2e67711a218b','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2024-10-29 10:44:55',76,'EXECUTED','9:91fa186ce7a5af127a2d7a91ee083cc5','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-10-29 10:44:55',77,'EXECUTED','9:6335e5c94e83a2639ccd68dd24e2e5ad','addColumn tableName=CLIENT','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-10-29 10:44:55',78,'MARK_RAN','9:6bdb5658951e028bfe16fa0a8228b530','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-10-29 10:44:57',79,'EXECUTED','9:d5bc15a64117ccad481ce8792d4c608f','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2024-10-29 10:44:57',80,'MARK_RAN','9:077cba51999515f4d3e7ad5619ab592c','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-10-29 10:44:57',81,'EXECUTED','9:be969f08a163bf47c6b9e9ead8ac2afb','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-10-29 10:44:57',82,'MARK_RAN','9:6d3bb4408ba5a72f39bd8a0b301ec6e3','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-10-29 10:44:58',83,'EXECUTED','9:966bda61e46bebf3cc39518fbed52fa7','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-10-29 10:44:58',84,'MARK_RAN','9:8dcac7bdf7378e7d823cdfddebf72fda','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.23.2',NULL,NULL,'0198660041'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2024-10-29 10:44:58',85,'EXECUTED','9:7d93d602352a30c0c317e6a609b56599','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.23.2',NULL,NULL,'0198660041'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2024-10-29 10:44:58',86,'EXECUTED','9:71c5969e6cdd8d7b6f47cebc86d37627','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.23.2',NULL,NULL,'0198660041'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-10-29 10:44:58',87,'EXECUTED','9:a9ba7d47f065f041b7da856a81762021','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2024-10-29 10:44:59',88,'EXECUTED','9:fffabce2bc01e1a8f5110d5278500065','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.23.2',NULL,NULL,'0198660041'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-10-29 10:44:59',89,'EXECUTED','9:fa8a5b5445e3857f4b010bafb5009957','addColumn tableName=REALM; customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-10-29 10:44:59',90,'EXECUTED','9:67ac3241df9a8582d591c5ed87125f39','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.23.2',NULL,NULL,'0198660041'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-10-29 10:44:59',91,'EXECUTED','9:ad1194d66c937e3ffc82386c050ba089','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.23.2',NULL,NULL,'0198660041'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-10-29 10:44:59',92,'EXECUTED','9:d9be619d94af5a2f5d07b9f003543b91','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-10-29 10:44:59',93,'MARK_RAN','9:544d201116a0fcc5a5da0925fbbc3bde','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.23.2',NULL,NULL,'0198660041'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-10-29 10:45:00',94,'EXECUTED','9:43c0c1055b6761b4b3e89de76d612ccf','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.23.2',NULL,NULL,'0198660041'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-10-29 10:45:00',95,'MARK_RAN','9:8bd711fd0330f4fe980494ca43ab1139','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2024-10-29 10:45:00',96,'EXECUTED','9:e07d2bc0970c348bb06fb63b1f82ddbf','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.23.2',NULL,NULL,'0198660041'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-10-29 10:45:00',97,'EXECUTED','9:24fb8611e97f29989bea412aa38d12b7','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.23.2',NULL,NULL,'0198660041'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-10-29 10:45:00',98,'MARK_RAN','9:259f89014ce2506ee84740cbf7163aa7','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'0198660041'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-10-29 10:45:01',99,'MARK_RAN','9:04baaf56c116ed19951cbc2cca584022','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'0198660041'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-10-29 10:45:01',100,'EXECUTED','9:bd2bd0fc7768cf0845ac96a8786fa735','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'0198660041'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-10-29 10:45:01',101,'MARK_RAN','9:d3d977031d431db16e2c181ce49d73e9','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'0198660041'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-10-29 10:45:01',102,'EXECUTED','9:0b305d8d1277f3a89a0a53a659ad274c','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.23.2',NULL,NULL,'0198660041'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2024-10-29 10:45:01',103,'EXECUTED','9:2c374ad2cdfe20e2905a84c8fac48460','customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2024-10-29 10:45:01',104,'EXECUTED','9:47a760639ac597360a8219f5b768b4de','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2024-10-29 10:45:01',105,'EXECUTED','9:a6272f0576727dd8cad2522335f5d99e','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.23.2',NULL,NULL,'0198660041'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2024-10-29 10:45:01',106,'EXECUTED','9:015479dbd691d9cc8669282f4828c41d','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.23.2',NULL,NULL,'0198660041'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2024-10-29 10:45:02',107,'EXECUTED','9:9518e495fdd22f78ad6425cc30630221','customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-10-29 10:45:02',108,'EXECUTED','9:f2e1331a71e0aa85e5608fe42f7f681c','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.23.2',NULL,NULL,'0198660041'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-10-29 10:45:02',109,'MARK_RAN','9:1a6fcaa85e20bdeae0a9ce49b41946a5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.23.2',NULL,NULL,'0198660041'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2024-10-29 10:45:02',110,'EXECUTED','9:3f332e13e90739ed0c35b0b25b7822ca','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.23.2',NULL,NULL,'0198660041'),('21.0.2-17277','keycloak','META-INF/jpa-changelog-21.0.2.xml','2024-10-29 10:45:02',111,'EXECUTED','9:7ee1f7a3fb8f5588f171fb9a6ab623c0','customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('21.1.0-19404','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-10-29 10:45:03',112,'EXECUTED','9:3d7e830b52f33676b9d64f7f2b2ea634','modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER','',NULL,'4.23.2',NULL,NULL,'0198660041'),('21.1.0-19404-2','keycloak','META-INF/jpa-changelog-21.1.0.xml','2024-10-29 10:45:03',113,'MARK_RAN','9:627d032e3ef2c06c0e1f73d2ae25c26c','addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...','',NULL,'4.23.2',NULL,NULL,'0198660041'),('22.0.0-17484-updated','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-10-29 10:45:03',114,'EXECUTED','9:90af0bfd30cafc17b9f4d6eccd92b8b3','customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('22.0.5-24031','keycloak','META-INF/jpa-changelog-22.0.0.xml','2024-10-29 10:45:03',115,'MARK_RAN','9:a60d2d7b315ec2d3eba9e2f145f9df28','customChange','',NULL,'4.23.2',NULL,NULL,'0198660041'),('23.0.0-12062','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-10-29 10:45:03',116,'EXECUTED','9:2168fbe728fec46ae9baf15bf80927b8','addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG','',NULL,'4.23.2',NULL,NULL,'0198660041'),('23.0.0-17258','keycloak','META-INF/jpa-changelog-23.0.0.xml','2024-10-29 10:45:03',117,'EXECUTED','9:36506d679a83bbfda85a27ea1864dca8','addColumn tableName=EVENT_ENTITY','',NULL,'4.23.2',NULL,NULL,'0198660041');
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
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('3929fd70-b926-4893-87ea-df1d4e547204','04257960-1293-4dff-82b8-9847dab077ec',_binary ''),('3929fd70-b926-4893-87ea-df1d4e547204','1139643a-c891-4b58-9ac7-f308426a8cdb',_binary ''),('3929fd70-b926-4893-87ea-df1d4e547204','23c914b0-4609-4634-b091-9b2dfddacca1',_binary ''),('3929fd70-b926-4893-87ea-df1d4e547204','3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63',_binary '\0'),('3929fd70-b926-4893-87ea-df1d4e547204','443d6287-3f2d-4336-b3dd-324bcd29ec97',_binary ''),('3929fd70-b926-4893-87ea-df1d4e547204','57863503-288c-4200-88d2-08115588b2dc',_binary '\0'),('3929fd70-b926-4893-87ea-df1d4e547204','59442141-74b9-4689-ad1c-f6e4805b24d9',_binary '\0'),('3929fd70-b926-4893-87ea-df1d4e547204','6e966667-4c24-43d8-9ce1-436472a45c51',_binary ''),('3929fd70-b926-4893-87ea-df1d4e547204','ec8dbbd0-f009-4164-8969-dd7ddac7b84f',_binary '\0'),('3929fd70-b926-4893-87ea-df1d4e547204','f9d71f8b-b401-4ab2-96b1-60d63405c98e',_binary ''),('77ed64ab-5412-4324-afcf-146bfc77e1b5','0dd2fe09-9518-4eb0-ad84-8ed5ff1c754f',_binary ''),('77ed64ab-5412-4324-afcf-146bfc77e1b5','161c4e30-5f89-4319-aa31-547e7e7c9461',_binary '\0'),('77ed64ab-5412-4324-afcf-146bfc77e1b5','2286ca59-72d6-42f7-91a1-0c160c26cbd2',_binary ''),('77ed64ab-5412-4324-afcf-146bfc77e1b5','2a3c2ad0-9990-4d89-9c09-7198b606ed61',_binary ''),('77ed64ab-5412-4324-afcf-146bfc77e1b5','340c2443-3fb0-4eeb-af3f-5acfaa7596bc',_binary ''),('77ed64ab-5412-4324-afcf-146bfc77e1b5','365a8870-1ca9-47a0-8efa-1ca1467e0ea5',_binary ''),('77ed64ab-5412-4324-afcf-146bfc77e1b5','416d08e7-9e79-49d8-a35b-94e68c23d724',_binary '\0'),('77ed64ab-5412-4324-afcf-146bfc77e1b5','421d019b-2280-4f22-94b7-1c0b32eca846',_binary '\0'),('77ed64ab-5412-4324-afcf-146bfc77e1b5','b7eab178-63d4-45ac-8595-75d78d8ce841',_binary '\0'),('77ed64ab-5412-4324-afcf-146bfc77e1b5','f21b14c5-14d7-4ad2-b5bb-ee35b65ed119',_binary ''),('77ed64ab-5412-4324-afcf-146bfc77e1b5','ffd59b36-ff8a-4b66-b288-9f29f3b0dda1',_binary ''),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','216c9e1a-1803-48b3-a656-1fb82a601996',_binary ''),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','4a802a80-2f75-4c40-b92d-c91e7259f94d',_binary '\0'),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','54b4dac4-785e-4198-8e1d-c6f39fc603a7',_binary ''),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','575ec1fb-7509-4a92-ad36-b1b5badb2556',_binary '\0'),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','5d697c29-6221-4cc5-bb32-1ee94a320074',_binary '\0'),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','6c35aa83-e5a3-4c73-a0be-6b6924e47aff',_binary '\0'),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','8ff33e64-f231-4c61-9d7a-7ec23e63f579',_binary ''),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','aa7d075a-6135-4126-9cee-272e8a9b70e1',_binary ''),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','b8d8d8e2-ce52-421c-9b0b-2d6092cd295d',_binary ''),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','c061173a-1027-4333-9e09-3dd067ae7ab7',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON_LONG_VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('02eb8bf8-7042-4e6e-8992-dc769662ca74','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_manage-identity-providers}','manage-identity-providers','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('03386f43-5d31-4ce7-8e1f-a4bdccd4c669','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_manage-events}','manage-events','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('0371c547-fd6f-4185-9b2c-f528985c245f','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_view-realm}','view-realm','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('09773f60-de8a-4cee-aadf-54aeacd385ed','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_query-users}','query-users','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('0a8445c7-a1ff-4a4f-8f3c-fc0134c5e925','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_view-realm}','view-realm','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('0b0a4f87-0c70-4df9-aa16-3bedf3672cf3','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_view-events}','view-events','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('0b40d9e2-6275-43bf-96ea-8bb398aacffc','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_manage-clients}','manage-clients','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('0d79dd8a-1810-4674-8236-3d459636ee78','eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '','${role_view-profile}','view-profile','3929fd70-b926-4893-87ea-df1d4e547204','eaac4b3f-d750-4eed-aeea-18cc89692999',NULL),('0e7deef6-33d0-4ab3-bf4d-94fd43b03ab5','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_manage-identity-providers}','manage-identity-providers','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('10623cd2-fcc5-49b9-a559-c510c801281a','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_query-groups}','query-groups','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('139fb3cb-0cd5-418f-9b8c-2a059a608e59','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_query-groups}','query-groups','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('15041204-f8b8-43e2-aebd-182ceecd78b1','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '\0','${role_offline-access}','offline_access','77ed64ab-5412-4324-afcf-146bfc77e1b5',NULL,NULL),('181a6a4d-d6a5-4aa2-9877-87b5c9ffac53','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '\0','${role_default-roles}','default-roles-test','b27e471f-0707-4dd7-8f2e-f6d21acecce8',NULL,NULL),('18c63545-75f1-4bfa-a4f9-5070389ad0ae','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_view-identity-providers}','view-identity-providers','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('19360427-7e7b-4f60-a800-ac5b186f653a','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_manage-identity-providers}','manage-identity-providers','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('1955225e-081a-4f64-a381-54b315f1fc4d','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '','${role_view-groups}','view-groups','b27e471f-0707-4dd7-8f2e-f6d21acecce8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',NULL),('1faa92f4-af9d-4c9a-9c31-36f11d59851e','eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '','${role_manage-account-links}','manage-account-links','3929fd70-b926-4893-87ea-df1d4e547204','eaac4b3f-d750-4eed-aeea-18cc89692999',NULL),('1fd8a44f-fb30-4d3c-b4b4-0c34f4954ab0','7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '','${role_delete-account}','delete-account','77ed64ab-5412-4324-afcf-146bfc77e1b5','7a93f012-ffc0-4923-9609-1cc1d9a6d993',NULL),('20f7d91e-4a70-4786-b1e5-70ef70d8cc72','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_manage-authorization}','manage-authorization','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('22af446c-8926-4b8c-a5d5-ad523f9f19bf','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '','${role_view-applications}','view-applications','b27e471f-0707-4dd7-8f2e-f6d21acecce8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',NULL),('22d8898a-b1d4-4b0d-a7af-687838158e8b','eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '','${role_delete-account}','delete-account','3929fd70-b926-4893-87ea-df1d4e547204','eaac4b3f-d750-4eed-aeea-18cc89692999',NULL),('22f596a6-b6ca-4f84-ac1f-a305ae062ab4','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_manage-users}','manage-users','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('22f9df23-ed07-4210-a865-dc0970795c83','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_create-client}','create-client','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('246bd9aa-66a4-4fd4-956f-73cfc3d81d17','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_manage-clients}','manage-clients','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('25eaeae4-23a8-4b4f-897b-5d3404412e91','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_view-clients}','view-clients','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('26997de4-9f9d-445f-a6ab-3762b1621881','7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '','${role_manage-consent}','manage-consent','77ed64ab-5412-4324-afcf-146bfc77e1b5','7a93f012-ffc0-4923-9609-1cc1d9a6d993',NULL),('28a3d1a7-e7ac-42ad-b57b-616851b10ad8','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_manage-identity-providers}','manage-identity-providers','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('28c9d304-3587-495a-b770-b10432ac8344','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_view-authorization}','view-authorization','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('2a21d81b-af2d-46a7-a5ab-af1a5d1a89ed','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_manage-realm}','manage-realm','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('35a8343c-20e7-42d8-aaf9-d7c0e6804790','7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '','${role_manage-account}','manage-account','77ed64ab-5412-4324-afcf-146bfc77e1b5','7a93f012-ffc0-4923-9609-1cc1d9a6d993',NULL),('38134f3a-dec9-46f7-aad9-d6035f64fbda','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_realm-admin}','realm-admin','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('39b8338f-1d75-4a03-9f94-aacf04ecb0bc','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_manage-users}','manage-users','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('39d4d726-de60-40b0-96ab-2ecbfe12339e','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_manage-clients}','manage-clients','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('3d0fbdea-9051-4971-97ab-afcdfb812e18','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_manage-users}','manage-users','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('3e1dfc6f-3879-4bd4-9cfb-e8603d6501df','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '','${role_manage-consent}','manage-consent','b27e471f-0707-4dd7-8f2e-f6d21acecce8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',NULL),('3f8c824a-9247-4b23-8e79-127335932f01','7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '','${role_view-consent}','view-consent','77ed64ab-5412-4324-afcf-146bfc77e1b5','7a93f012-ffc0-4923-9609-1cc1d9a6d993',NULL),('409be67b-e805-4009-862f-64efc9fea501','3929fd70-b926-4893-87ea-df1d4e547204',_binary '\0','${role_uma_authorization}','uma_authorization','3929fd70-b926-4893-87ea-df1d4e547204',NULL,NULL),('40f989e1-5a2f-4e25-86d4-2107213faf55','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_create-client}','create-client','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('41f40da5-85a6-4e94-99e0-cc0e9e79e58f','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_view-identity-providers}','view-identity-providers','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('44c1bb20-d47a-49a5-937c-de590b425ad6','3929fd70-b926-4893-87ea-df1d4e547204',_binary '\0','${role_default-roles}','default-roles-master','3929fd70-b926-4893-87ea-df1d4e547204',NULL,NULL),('48016a8f-2db1-43d9-9155-08eb7f6816a6','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_manage-clients}','manage-clients','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('4cbc7f45-9239-428e-9ebc-da2fa1a406be','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_manage-users}','manage-users','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('4d84c7dd-322d-4de8-8ac7-621b79da768a','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_query-users}','query-users','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('4e6f2ed5-3fd6-4d80-812d-0257a783dc9a','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_manage-authorization}','manage-authorization','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('4f38114c-9c85-4df8-b6ad-071ef61f7630','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_view-events}','view-events','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('525ad30d-e09f-4207-a376-c86d02d5e3c3','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_view-authorization}','view-authorization','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('551bab76-9745-4b4a-b29e-c5c4f314341b','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_query-groups}','query-groups','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('573a17db-78dd-4a75-9856-f47f96b86b3d','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_view-realm}','view-realm','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('58375c4e-ed63-4d43-a01d-5159fd59dd78','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_query-realms}','query-realms','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('589e0acf-0cc1-40ce-8857-a375855008e1','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_impersonation}','impersonation','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('59d40d4a-8973-446d-bc76-daf073165b5f','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_manage-identity-providers}','manage-identity-providers','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('5af39ef9-58ee-4f82-a439-50ab4337ec3d','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_create-client}','create-client','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('5b5fde94-7b18-41c6-a3ea-a3a0d972d97c','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_view-users}','view-users','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('5bed8e8a-9098-4517-a765-c7a9255927c2','3929fd70-b926-4893-87ea-df1d4e547204',_binary '\0','${role_offline-access}','offline_access','3929fd70-b926-4893-87ea-df1d4e547204',NULL,NULL),('5c917b8d-f690-4275-aa9b-fa7f290085b8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '','${role_delete-account}','delete-account','b27e471f-0707-4dd7-8f2e-f6d21acecce8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',NULL),('5cb68ed2-449b-4eea-a612-1f28c87710e0','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_manage-users}','manage-users','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('5ccfcfcb-7feb-4376-9c48-46be08dcaa17','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_manage-realm}','manage-realm','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('603bc306-faf6-450c-87fa-17e796ccb145','375829ae-ea46-4150-ae1e-30e27d0c2079',_binary '','${role_read-token}','read-token','3929fd70-b926-4893-87ea-df1d4e547204','375829ae-ea46-4150-ae1e-30e27d0c2079',NULL),('6338e11c-67c8-4a1a-a27e-451e2276163a','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_query-groups}','query-groups','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('66256614-3005-48d7-8014-51cc14fbd9a3','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_query-users}','query-users','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('67dd0086-4112-4f37-abcc-60eb6fe4d7e5','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_impersonation}','impersonation','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('68089158-4f6d-463a-89da-42234303f6ab','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '','${role_view-profile}','view-profile','b27e471f-0707-4dd7-8f2e-f6d21acecce8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',NULL),('690ff671-8bdb-4d0a-8432-a3379aa196cb','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_query-realms}','query-realms','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('6ddafbed-ea83-4524-b30e-da513c8a624b','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_query-clients}','query-clients','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('70012e8b-90f2-49e7-9f98-66760ce50bcf','c9609d0d-e995-4c36-a6d0-0ac84ae85777',_binary '','${role_read-token}','read-token','77ed64ab-5412-4324-afcf-146bfc77e1b5','c9609d0d-e995-4c36-a6d0-0ac84ae85777',NULL),('71034bcf-4802-490a-8340-c40d92f5858b','3929fd70-b926-4893-87ea-df1d4e547204',_binary '\0','${role_create-realm}','create-realm','3929fd70-b926-4893-87ea-df1d4e547204',NULL,NULL),('7312dbca-be9e-4169-9fcd-1fe6d7227a03','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_query-groups}','query-groups','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('73d8f50c-9cb6-4a2c-9ed5-d1b98146efad','91f553a2-aa4e-45a7-81de-de44541e3787',_binary '','${role_read-token}','read-token','b27e471f-0707-4dd7-8f2e-f6d21acecce8','91f553a2-aa4e-45a7-81de-de44541e3787',NULL),('78663a59-45cd-41e9-afc0-6d4996117161','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_view-events}','view-events','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('7a29e619-6931-49a9-80a4-41f78a8d2b4d','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_manage-events}','manage-events','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('7d7149a8-e061-48c8-9270-24bee5a1f00e','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_manage-events}','manage-events','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('7d8ceb43-4a03-4d05-8b87-a3c6b72979de','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_view-identity-providers}','view-identity-providers','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('7db4e59a-65d6-45d6-8e05-dd3060657d1a','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_view-identity-providers}','view-identity-providers','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('7e748adf-acf3-40e9-b062-17f417c26b11','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_query-clients}','query-clients','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('86441f55-bcf4-40cd-aecb-5b34983c6f67','7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '','${role_manage-account-links}','manage-account-links','77ed64ab-5412-4324-afcf-146bfc77e1b5','7a93f012-ffc0-4923-9609-1cc1d9a6d993',NULL),('88a45121-ee62-4168-9dc4-95ad656f5a56','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_view-users}','view-users','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('89388cca-710b-451e-8c6d-331e7cbbc6ef','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_view-users}','view-users','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('8ff0de0b-3a4c-4566-85c2-260fc26abea7','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_manage-realm}','manage-realm','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('918f744f-2911-4637-8363-ae4639779dde','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_query-users}','query-users','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('96ec27d9-98d6-4bd6-822c-c1aae3a79028','eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '','${role_view-applications}','view-applications','3929fd70-b926-4893-87ea-df1d4e547204','eaac4b3f-d750-4eed-aeea-18cc89692999',NULL),('97c92d5f-fbe0-49c3-8a5d-191279ce220f','eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '','${role_view-consent}','view-consent','3929fd70-b926-4893-87ea-df1d4e547204','eaac4b3f-d750-4eed-aeea-18cc89692999',NULL),('98197118-5616-478d-9423-9806f1a6d420','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_manage-realm}','manage-realm','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('986d7ee3-3356-4546-b5c4-a86d67416736','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_query-realms}','query-realms','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('9a78119c-3345-42ca-ac30-63aea9d0b141','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_query-clients}','query-clients','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('9e60db59-3420-483b-b1ee-8ed77dc33d92','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_create-client}','create-client','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('9f22515c-fa46-4255-b32c-b1adf12a72d3','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '\0','${role_uma_authorization}','uma_authorization','b27e471f-0707-4dd7-8f2e-f6d21acecce8',NULL,NULL),('9fbb03ea-2d0c-4556-afe1-6fb898a8780c','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_manage-events}','manage-events','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('a030ff56-ab2b-4c09-8329-ce3e6420fd2b','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_manage-authorization}','manage-authorization','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('a76e1c4b-e6fa-4d92-9ca6-42dbac87f4b2','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_manage-authorization}','manage-authorization','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('a7cd648f-1011-453c-8621-7704e3b57679','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_view-users}','view-users','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('a886c549-3066-4658-9357-e3fc30e9b15d','7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '','${role_view-profile}','view-profile','77ed64ab-5412-4324-afcf-146bfc77e1b5','7a93f012-ffc0-4923-9609-1cc1d9a6d993',NULL),('a9aa07a2-a748-47f3-a4ea-b5fd1fde5dcd','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_view-clients}','view-clients','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('aa4a414f-79d2-4210-a662-1eb51ccf2ee8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '','${role_manage-account}','manage-account','b27e471f-0707-4dd7-8f2e-f6d21acecce8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',NULL),('aab97ed6-5ca3-4f99-866f-715722ed6232','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '','${role_view-consent}','view-consent','b27e471f-0707-4dd7-8f2e-f6d21acecce8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',NULL),('ab41ccae-c5ae-4a7d-98ba-2982e7c7c0c4','eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '','${role_manage-account}','manage-account','3929fd70-b926-4893-87ea-df1d4e547204','eaac4b3f-d750-4eed-aeea-18cc89692999',NULL),('ab6a42ce-c62f-48fc-8de1-736edaad6c34','fc71cc2e-b2cd-4118-b2fc-62880a15c51b',_binary '',NULL,'uma_protection','77ed64ab-5412-4324-afcf-146bfc77e1b5','fc71cc2e-b2cd-4118-b2fc-62880a15c51b',NULL),('acb23971-bdb3-4523-bc5f-2cb3402ba11c','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_view-events}','view-events','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('b3701d81-226b-473a-b6ef-ec78ef77e3e0','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_view-clients}','view-clients','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('b3e9cf1e-f993-4c20-84dc-d8b590c8159d','eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '','${role_view-groups}','view-groups','3929fd70-b926-4893-87ea-df1d4e547204','eaac4b3f-d750-4eed-aeea-18cc89692999',NULL),('b4be4af8-e988-43ea-a468-8f32dd2c1870','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_query-clients}','query-clients','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('b5b8fa08-b1f5-4a4b-a34f-f2ffd446ad90','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',_binary '','${role_manage-account-links}','manage-account-links','b27e471f-0707-4dd7-8f2e-f6d21acecce8','9b5853eb-6ecf-4a11-9956-1cf3e7e08b50',NULL),('b8e659b8-d854-42c9-bd87-b0481cdaa555','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_view-clients}','view-clients','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('be3b6f73-220b-4df5-a6d2-ecb0cb5d6d93','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '\0','${role_uma_authorization}','uma_authorization','77ed64ab-5412-4324-afcf-146bfc77e1b5',NULL,NULL),('c0ba62c7-e448-4f67-9e57-bcbcaf3dc89c','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_query-realms}','query-realms','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('c139ec20-af28-4faa-aea6-6808221340f2','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_view-authorization}','view-authorization','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('c235536e-7db3-4006-a544-518b5d462e00','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_manage-authorization}','manage-authorization','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('c559d0a3-2dc9-406e-8fd1-4db2885ca9bb','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_impersonation}','impersonation','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('d3377cbf-a3b0-4dd4-8160-21d1763f6a57','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_view-authorization}','view-authorization','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('d7efc3c1-b94a-4e31-ba86-7739abe5fb24','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_query-users}','query-users','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('d88012e9-6fa2-4c14-9358-f6ca7d03a195','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_manage-realm}','manage-realm','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('d90ae608-3fff-4fa4-97d2-fc43b83c2fce','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_view-identity-providers}','view-identity-providers','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('db431920-cf9b-4e0f-97f5-7e558179cbc3','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_view-users}','view-users','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('dc24511f-c308-4298-a8e3-2faf9354199a','7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '','${role_view-applications}','view-applications','77ed64ab-5412-4324-afcf-146bfc77e1b5','7a93f012-ffc0-4923-9609-1cc1d9a6d993',NULL),('dc3fb727-6754-4443-aaab-f9e41f9ad299','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_view-authorization}','view-authorization','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('de398b3f-c1b8-44fb-80d0-ba918f44e0f2','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '\0','','testrole','77ed64ab-5412-4324-afcf-146bfc77e1b5',NULL,NULL),('e06de8f7-b1ee-4104-b8fb-3c0ee4153964','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '\0','${role_offline-access}','offline_access','b27e471f-0707-4dd7-8f2e-f6d21acecce8',NULL,NULL),('e0fb5cf7-f700-4fd8-aa62-97b3035bac47','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_impersonation}','impersonation','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','3929fd70-b926-4893-87ea-df1d4e547204',_binary '\0','${role_admin}','admin','3929fd70-b926-4893-87ea-df1d4e547204',NULL,NULL),('e45f1c0a-43a3-41a9-b98a-fcd27ca993ee','7a93f012-ffc0-4923-9609-1cc1d9a6d993',_binary '','${role_view-groups}','view-groups','77ed64ab-5412-4324-afcf-146bfc77e1b5','7a93f012-ffc0-4923-9609-1cc1d9a6d993',NULL),('e47d480a-12d1-4206-891d-5923be239846','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_create-client}','create-client','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('e54e42ba-cc89-4511-bf7a-3dbc4f105cfc','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_view-events}','view-events','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('ea716c9c-5dd3-4a26-9e35-89655f790114','4055450d-9cf0-4643-9def-6f0fc139cd30',_binary '','${role_view-realm}','view-realm','77ed64ab-5412-4324-afcf-146bfc77e1b5','4055450d-9cf0-4643-9def-6f0fc139cd30',NULL),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '\0','${role_default-roles}','default-roles-food-delivery','77ed64ab-5412-4324-afcf-146bfc77e1b5',NULL,NULL),('ebe25b1a-0fb4-4e0d-b1f0-162b058a40fe','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_impersonation}','impersonation','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('ed2cd1f1-4171-4c22-95c1-5f6ca80df49c','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_manage-events}','manage-events','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('f3445414-6536-4c94-9eb3-0e7481edd8ea','172afcd0-ff68-4225-a747-b8df6de29acc',_binary '','${role_query-realms}','query-realms','3929fd70-b926-4893-87ea-df1d4e547204','172afcd0-ff68-4225-a747-b8df6de29acc',NULL),('f4f68015-6955-4a29-92e7-6be73c26c718','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_view-clients}','view-clients','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('f55b660b-2208-4741-9775-6f1d3cddeb46','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_query-clients}','query-clients','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL),('f5da18c4-bf45-46e9-81ab-97de214e7758','68b77aac-7ddd-443f-9446-c17429b2f48a',_binary '','${role_view-realm}','view-realm','3929fd70-b926-4893-87ea-df1d4e547204','68b77aac-7ddd-443f-9446-c17429b2f48a',NULL),('f688be68-f57f-499c-a2dd-298ab3c56c9a','eaac4b3f-d750-4eed-aeea-18cc89692999',_binary '','${role_manage-consent}','manage-consent','3929fd70-b926-4893-87ea-df1d4e547204','eaac4b3f-d750-4eed-aeea-18cc89692999',NULL),('f87578d4-0d7a-4cfe-9acd-e095755be2ba','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',_binary '','${role_realm-admin}','realm-admin','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1cbf543a-8fc4-4097-ac50-8b1dda5342aa',NULL),('fe03a892-e40d-4627-bd3d-ed13429d5db3','0e3a80af-5a82-4aa4-98d8-d862fece46be',_binary '','${role_manage-clients}','manage-clients','3929fd70-b926-4893-87ea-df1d4e547204','0e3a80af-5a82-4aa4-98d8-d862fece46be',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('gozmd','23.0.0',1730198704);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES ('4872c105-dd6c-48ac-bddb-17b193cf5c6b','defaultResourceType','urn:api-gateway:resources:default'),('a297f157-5bd2-4fb6-aa45-319a15c3ab9a','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n');
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('03fa8381-bdbb-4674-82a6-d330c0f435dc','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('050d04f6-1de3-418c-91eb-dacbc727b219','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('0572d25d-93a1-4874-94a8-996745df1fb5','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('0894ed95-d9bb-4fc6-8f5d-49702507deb9','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('09030d7c-9c97-4636-b1b8-33698fbbad9c','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6c35aa83-e5a3-4c73-a0be-6b6924e47aff'),('0aab1b59-a784-4883-b7ed-ce84830e1a40','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('15fef858-03f9-4776-bb0e-45bc3028e7e6','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('166934c9-9046-40c4-bf63-3a558dba833b','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('1885428e-5955-4769-8adc-c51b008ffbed','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'2a3c2ad0-9990-4d89-9c09-7198b606ed61'),('197a5f15-169d-4e53-a505-a1e7a9f20461','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('1a808960-a90f-4a65-98bc-6e4543bff5af','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a3c2ad0-9990-4d89-9c09-7198b606ed61'),('1af5fc4b-3d14-4a05-ba1d-c9e2476c5eda','full name','openid-connect','oidc-full-name-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('1d58f3d9-260e-407a-b182-ca9885c2cad9','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'575ec1fb-7509-4a92-ad36-b1b5badb2556'),('1f2fd634-c19e-4414-ab91-9d954eaaf8e7','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('202066a6-181a-423e-9e99-80342bd57204','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('22c0cabc-4267-4bb7-9a3e-2d088e6a7c0f','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'416d08e7-9e79-49d8-a35b-94e68c23d724'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','address','openid-connect','oidc-address-mapper',NULL,'b7eab178-63d4-45ac-8595-75d78d8ce841'),('246cd5b5-b2a9-4089-a3d8-88e3829fe047','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'f21b14c5-14d7-4ad2-b5bb-ee35b65ed119'),('25420f1b-18b1-4972-80df-3e94ef8b2a1f','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('277738a5-bed1-4fd1-81b7-fbb326d24b95','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('27afe043-d813-4ba9-8c78-6b8fa80e87fe','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'23c914b0-4609-4634-b091-9b2dfddacca1'),('27c4e190-9e41-4db2-a52c-41352e79c849','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'23c914b0-4609-4634-b091-9b2dfddacca1'),('27f1a15f-a8e2-43dc-aec5-3897f0368985','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63'),('2d38772e-8f8b-4ce8-a797-240989889bfd','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'6c35aa83-e5a3-4c73-a0be-6b6924e47aff'),('2dbd1661-cf8e-4d98-9359-641daa37e369','audience resolve','openid-connect','oidc-audience-resolve-mapper','911a5f29-a2ef-4a61-ba38-6921db6fff14',NULL),('2e6a4288-9b92-4de7-a2d0-f3eda3b508da','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('2f17655c-948f-4b16-a66a-8cbdcef23da8','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('337bae6a-1795-4ce3-bd8c-c9b261a3ed2e','upn','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3d8ad44e-eec9-4b48-a3e7-cd5ff2fcfe63'),('3667885f-4955-4e68-8e64-d2bdb573c76e','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('39b495db-880e-4fad-a6d8-a9f1510d0304','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','fc71cc2e-b2cd-4118-b2fc-62880a15c51b',NULL),('3cc1e96c-dc1c-4309-b785-65fdf7a6e1ff','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'aa7d075a-6135-4126-9cee-272e8a9b70e1'),('3d5fc786-c768-4914-ab8e-f99f2572ba71','audience resolve','openid-connect','oidc-audience-resolve-mapper','8883e639-1a69-43ef-8343-d80a7f1e7e86',NULL),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','address','openid-connect','oidc-address-mapper',NULL,'5d697c29-6221-4cc5-bb32-1ee94a320074'),('43a44077-79c3-4a9e-b086-a1b5cbfefe36','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('43ae9848-3173-421c-a74d-0383873fac34','locale','openid-connect','oidc-usermodel-attribute-mapper','bcd41309-62ab-4c60-b70a-716be700d744',NULL),('46ae2fd0-d9de-448c-a96a-5cebccfd9441','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('4c14078b-e0ba-4da4-bda4-4f0a989bcd2d','role list','saml','saml-role-list-mapper',NULL,'216c9e1a-1803-48b3-a656-1fb82a601996'),('4defd370-16ec-4935-8706-bb11c787b97d','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'f21b14c5-14d7-4ad2-b5bb-ee35b65ed119'),('4e2ee98a-1c53-465a-b1c5-87fae9ce9b66','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('56ffc3a3-7d22-44d0-bb98-f676a6896844','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('5701b1c3-b2c1-4ee4-9e40-9ff53c863b13','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('5726e013-cc7f-4d13-855b-01331e6e6011','full name','openid-connect','oidc-full-name-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('57865ec3-1c3f-4183-a1ba-5b8845dfd468','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'c061173a-1027-4333-9e09-3dd067ae7ab7'),('5e934fa4-ba77-42ab-9ed2-f0d96d140cf7','username','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('61c2c74e-7e9d-4215-b068-ffcab9491f2b','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'416d08e7-9e79-49d8-a35b-94e68c23d724'),('677766b9-24a2-4874-9175-94cbc5f5a55a','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('6911d7ef-7a15-48bf-94ad-9cdd9e53211d','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('6fdc38ff-c709-4174-825d-9cee83a47968','email','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6e966667-4c24-43d8-9ce1-436472a45c51'),('6fdfed36-8530-4ae7-9317-6bfc124540f3','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'54b4dac4-785e-4198-8e1d-c6f39fc603a7'),('72d3c619-a752-4393-8d28-036cc9492e7e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'23c914b0-4609-4634-b091-9b2dfddacca1'),('74fefa95-c611-4004-a975-6f0dafd2c2b7','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'54b4dac4-785e-4198-8e1d-c6f39fc603a7'),('7b788662-328f-498d-b5f9-93e9d81861c3','role list','saml','saml-role-list-mapper',NULL,'f9d71f8b-b401-4ab2-96b1-60d63405c98e'),('8055ed3f-b12b-44bd-b968-d23985d889c2','audience resolve','openid-connect','oidc-audience-resolve-mapper','f65759e0-3ac0-490d-8725-bd00e4103f2d',NULL),('8550963e-a8e9-4e65-9eeb-fcfaafa17a32','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('893c2033-c327-443b-9e56-65a699406019','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'59442141-74b9-4689-ad1c-f6e4805b24d9'),('89834cb1-f609-4719-b37a-bedb99af7c67','locale','openid-connect','oidc-usermodel-attribute-mapper','01c49ed9-27c5-4cd8-ba34-964d38455f13',NULL),('8e1839fc-1c54-4075-a8d6-1bb8723311e5','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'04257960-1293-4dff-82b8-9847dab077ec'),('923870d1-9bd8-41d5-874b-a9cced9ed002','role list','saml','saml-role-list-mapper',NULL,'340c2443-3fb0-4eeb-af3f-5acfaa7596bc'),('99a7bb8d-a226-4749-9253-cb8101b5a1e5','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'59442141-74b9-4689-ad1c-f6e4805b24d9'),('9c17999b-d7a0-48ce-ab3a-f5b46f479a4a','full name','openid-connect','oidc-full-name-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('9e64e051-c87e-4131-9023-e85512314aba','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'161c4e30-5f89-4319-aa31-547e7e7c9461'),('9fc4ce18-1f3d-4fb1-9161-4b96b609e2f7','acr loa level','openid-connect','oidc-acr-mapper',NULL,'ffd59b36-ff8a-4b66-b288-9f29f3b0dda1'),('9fe57a74-9478-453a-bf7d-6bd6ce7b7689','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('a2df6f9f-2761-4deb-85ce-2c34b725af11','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('ab7d4c73-a86f-450e-8f90-7f365bdd57c1','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('b1027342-58d3-4a1e-89a3-85e367dca6e6','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('b42208a0-7085-42aa-9f47-f19033f0352b','acr loa level','openid-connect','oidc-acr-mapper',NULL,'8ff33e64-f231-4c61-9d7a-7ec23e63f579'),('b43966ef-87a3-4f89-86a2-9f37b160bbdf','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('b49943d7-d081-463f-a082-957519cbfe98','address','openid-connect','oidc-address-mapper',NULL,'57863503-288c-4200-88d2-08115588b2dc'),('b6505333-7a3b-4c00-b9f1-6b80cdc03a72','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'161c4e30-5f89-4319-aa31-547e7e7c9461'),('b9495c1d-12f3-44d9-b1f7-16aaf7f1720c','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'575ec1fb-7509-4a92-ad36-b1b5badb2556'),('ba3da3d9-9c39-432b-b0a8-f915e4f87846','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'f21b14c5-14d7-4ad2-b5bb-ee35b65ed119'),('ba52ca56-d879-47d3-aa16-892b5846cf40','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('bbbaaf89-f011-4658-b6eb-839cc250b765','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'6e966667-4c24-43d8-9ce1-436472a45c51'),('c012d16b-735e-4868-afe7-b4df184e47b2','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b7eab178-63d4-45ac-8595-75d78d8ce841'),('c0e5ac45-eaa9-4e35-b284-eead4f9b676b','locale','openid-connect','oidc-usermodel-attribute-mapper','5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a',NULL),('c694eda7-a74c-4791-898a-f170b8489b8a','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('c92a770f-4145-4fef-a3ae-7dc27f2e6ebd','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','fc71cc2e-b2cd-4118-b2fc-62880a15c51b',NULL),('d04aeff0-8470-4c33-af73-0d6865f9ce1b','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'aa7d075a-6135-4126-9cee-272e8a9b70e1'),('d28fccab-10d8-487f-88bf-4c568acd2c1a','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'2286ca59-72d6-42f7-91a1-0c160c26cbd2'),('d9e8f7b3-dcce-4929-804a-0aaccd284ec5','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('e1f5bd72-82b5-4ad9-bb02-1720e40de310','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('ea24267e-5638-4b00-9ed0-3be54e91e872','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('ef43900c-d754-4239-a300-c90ff0fa119f','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1139643a-c891-4b58-9ac7-f308426a8cdb'),('ef714fe2-fad7-4613-a9f9-642abce4ee04','acr loa level','openid-connect','oidc-acr-mapper',NULL,'443d6287-3f2d-4336-b3dd-324bcd29ec97'),('f37a9f53-5a48-4b36-98c3-2c701ada63e5','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'54b4dac4-785e-4198-8e1d-c6f39fc603a7'),('f7946d43-0a4a-491d-8a61-a60df0ff107d','given name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('f8a2b9cb-0314-429e-8990-6764c2d633ce','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','fc71cc2e-b2cd-4118-b2fc-62880a15c51b',NULL),('f8ba2db6-9f5a-4523-938e-11536a4b8b6b','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5'),('fb8d86ea-3894-487e-9404-2216e289c07d','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b8d8d8e2-ce52-421c-9b0b-2d6092cd295d'),('ffcf3c59-a38d-4e46-ab99-36fa5c399080','family name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'365a8870-1ca9-47a0-8efa-1ca1467e0ea5');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('03fa8381-bdbb-4674-82a6-d330c0f435dc','true','access.token.claim'),('03fa8381-bdbb-4674-82a6-d330c0f435dc','profile','claim.name'),('03fa8381-bdbb-4674-82a6-d330c0f435dc','true','id.token.claim'),('03fa8381-bdbb-4674-82a6-d330c0f435dc','true','introspection.token.claim'),('03fa8381-bdbb-4674-82a6-d330c0f435dc','String','jsonType.label'),('03fa8381-bdbb-4674-82a6-d330c0f435dc','profile','user.attribute'),('03fa8381-bdbb-4674-82a6-d330c0f435dc','true','userinfo.token.claim'),('050d04f6-1de3-418c-91eb-dacbc727b219','true','access.token.claim'),('050d04f6-1de3-418c-91eb-dacbc727b219','zoneinfo','claim.name'),('050d04f6-1de3-418c-91eb-dacbc727b219','true','id.token.claim'),('050d04f6-1de3-418c-91eb-dacbc727b219','true','introspection.token.claim'),('050d04f6-1de3-418c-91eb-dacbc727b219','String','jsonType.label'),('050d04f6-1de3-418c-91eb-dacbc727b219','zoneinfo','user.attribute'),('050d04f6-1de3-418c-91eb-dacbc727b219','true','userinfo.token.claim'),('0572d25d-93a1-4874-94a8-996745df1fb5','true','access.token.claim'),('0572d25d-93a1-4874-94a8-996745df1fb5','picture','claim.name'),('0572d25d-93a1-4874-94a8-996745df1fb5','true','id.token.claim'),('0572d25d-93a1-4874-94a8-996745df1fb5','true','introspection.token.claim'),('0572d25d-93a1-4874-94a8-996745df1fb5','String','jsonType.label'),('0572d25d-93a1-4874-94a8-996745df1fb5','picture','user.attribute'),('0572d25d-93a1-4874-94a8-996745df1fb5','true','userinfo.token.claim'),('0894ed95-d9bb-4fc6-8f5d-49702507deb9','true','access.token.claim'),('0894ed95-d9bb-4fc6-8f5d-49702507deb9','preferred_username','claim.name'),('0894ed95-d9bb-4fc6-8f5d-49702507deb9','true','id.token.claim'),('0894ed95-d9bb-4fc6-8f5d-49702507deb9','true','introspection.token.claim'),('0894ed95-d9bb-4fc6-8f5d-49702507deb9','String','jsonType.label'),('0894ed95-d9bb-4fc6-8f5d-49702507deb9','username','user.attribute'),('0894ed95-d9bb-4fc6-8f5d-49702507deb9','true','userinfo.token.claim'),('09030d7c-9c97-4636-b1b8-33698fbbad9c','true','access.token.claim'),('09030d7c-9c97-4636-b1b8-33698fbbad9c','upn','claim.name'),('09030d7c-9c97-4636-b1b8-33698fbbad9c','true','id.token.claim'),('09030d7c-9c97-4636-b1b8-33698fbbad9c','true','introspection.token.claim'),('09030d7c-9c97-4636-b1b8-33698fbbad9c','String','jsonType.label'),('09030d7c-9c97-4636-b1b8-33698fbbad9c','username','user.attribute'),('09030d7c-9c97-4636-b1b8-33698fbbad9c','true','userinfo.token.claim'),('0aab1b59-a784-4883-b7ed-ce84830e1a40','true','access.token.claim'),('0aab1b59-a784-4883-b7ed-ce84830e1a40','website','claim.name'),('0aab1b59-a784-4883-b7ed-ce84830e1a40','true','id.token.claim'),('0aab1b59-a784-4883-b7ed-ce84830e1a40','true','introspection.token.claim'),('0aab1b59-a784-4883-b7ed-ce84830e1a40','String','jsonType.label'),('0aab1b59-a784-4883-b7ed-ce84830e1a40','website','user.attribute'),('0aab1b59-a784-4883-b7ed-ce84830e1a40','true','userinfo.token.claim'),('15fef858-03f9-4776-bb0e-45bc3028e7e6','true','access.token.claim'),('15fef858-03f9-4776-bb0e-45bc3028e7e6','zoneinfo','claim.name'),('15fef858-03f9-4776-bb0e-45bc3028e7e6','true','id.token.claim'),('15fef858-03f9-4776-bb0e-45bc3028e7e6','true','introspection.token.claim'),('15fef858-03f9-4776-bb0e-45bc3028e7e6','String','jsonType.label'),('15fef858-03f9-4776-bb0e-45bc3028e7e6','zoneinfo','user.attribute'),('15fef858-03f9-4776-bb0e-45bc3028e7e6','true','userinfo.token.claim'),('166934c9-9046-40c4-bf63-3a558dba833b','true','access.token.claim'),('166934c9-9046-40c4-bf63-3a558dba833b','profile','claim.name'),('166934c9-9046-40c4-bf63-3a558dba833b','true','id.token.claim'),('166934c9-9046-40c4-bf63-3a558dba833b','true','introspection.token.claim'),('166934c9-9046-40c4-bf63-3a558dba833b','String','jsonType.label'),('166934c9-9046-40c4-bf63-3a558dba833b','profile','user.attribute'),('166934c9-9046-40c4-bf63-3a558dba833b','true','userinfo.token.claim'),('1885428e-5955-4769-8adc-c51b008ffbed','true','access.token.claim'),('1885428e-5955-4769-8adc-c51b008ffbed','email_verified','claim.name'),('1885428e-5955-4769-8adc-c51b008ffbed','true','id.token.claim'),('1885428e-5955-4769-8adc-c51b008ffbed','true','introspection.token.claim'),('1885428e-5955-4769-8adc-c51b008ffbed','boolean','jsonType.label'),('1885428e-5955-4769-8adc-c51b008ffbed','emailVerified','user.attribute'),('1885428e-5955-4769-8adc-c51b008ffbed','true','userinfo.token.claim'),('197a5f15-169d-4e53-a505-a1e7a9f20461','true','access.token.claim'),('197a5f15-169d-4e53-a505-a1e7a9f20461','middle_name','claim.name'),('197a5f15-169d-4e53-a505-a1e7a9f20461','true','id.token.claim'),('197a5f15-169d-4e53-a505-a1e7a9f20461','true','introspection.token.claim'),('197a5f15-169d-4e53-a505-a1e7a9f20461','String','jsonType.label'),('197a5f15-169d-4e53-a505-a1e7a9f20461','middleName','user.attribute'),('197a5f15-169d-4e53-a505-a1e7a9f20461','true','userinfo.token.claim'),('1a808960-a90f-4a65-98bc-6e4543bff5af','true','access.token.claim'),('1a808960-a90f-4a65-98bc-6e4543bff5af','email','claim.name'),('1a808960-a90f-4a65-98bc-6e4543bff5af','true','id.token.claim'),('1a808960-a90f-4a65-98bc-6e4543bff5af','true','introspection.token.claim'),('1a808960-a90f-4a65-98bc-6e4543bff5af','String','jsonType.label'),('1a808960-a90f-4a65-98bc-6e4543bff5af','email','user.attribute'),('1a808960-a90f-4a65-98bc-6e4543bff5af','true','userinfo.token.claim'),('1af5fc4b-3d14-4a05-ba1d-c9e2476c5eda','true','access.token.claim'),('1af5fc4b-3d14-4a05-ba1d-c9e2476c5eda','true','id.token.claim'),('1af5fc4b-3d14-4a05-ba1d-c9e2476c5eda','true','introspection.token.claim'),('1af5fc4b-3d14-4a05-ba1d-c9e2476c5eda','true','userinfo.token.claim'),('1d58f3d9-260e-407a-b182-ca9885c2cad9','true','access.token.claim'),('1d58f3d9-260e-407a-b182-ca9885c2cad9','phone_number','claim.name'),('1d58f3d9-260e-407a-b182-ca9885c2cad9','true','id.token.claim'),('1d58f3d9-260e-407a-b182-ca9885c2cad9','true','introspection.token.claim'),('1d58f3d9-260e-407a-b182-ca9885c2cad9','String','jsonType.label'),('1d58f3d9-260e-407a-b182-ca9885c2cad9','phoneNumber','user.attribute'),('1d58f3d9-260e-407a-b182-ca9885c2cad9','true','userinfo.token.claim'),('1f2fd634-c19e-4414-ab91-9d954eaaf8e7','true','access.token.claim'),('1f2fd634-c19e-4414-ab91-9d954eaaf8e7','zoneinfo','claim.name'),('1f2fd634-c19e-4414-ab91-9d954eaaf8e7','true','id.token.claim'),('1f2fd634-c19e-4414-ab91-9d954eaaf8e7','true','introspection.token.claim'),('1f2fd634-c19e-4414-ab91-9d954eaaf8e7','String','jsonType.label'),('1f2fd634-c19e-4414-ab91-9d954eaaf8e7','zoneinfo','user.attribute'),('1f2fd634-c19e-4414-ab91-9d954eaaf8e7','true','userinfo.token.claim'),('202066a6-181a-423e-9e99-80342bd57204','true','access.token.claim'),('202066a6-181a-423e-9e99-80342bd57204','nickname','claim.name'),('202066a6-181a-423e-9e99-80342bd57204','true','id.token.claim'),('202066a6-181a-423e-9e99-80342bd57204','true','introspection.token.claim'),('202066a6-181a-423e-9e99-80342bd57204','String','jsonType.label'),('202066a6-181a-423e-9e99-80342bd57204','nickname','user.attribute'),('202066a6-181a-423e-9e99-80342bd57204','true','userinfo.token.claim'),('22c0cabc-4267-4bb7-9a3e-2d088e6a7c0f','true','access.token.claim'),('22c0cabc-4267-4bb7-9a3e-2d088e6a7c0f','upn','claim.name'),('22c0cabc-4267-4bb7-9a3e-2d088e6a7c0f','true','id.token.claim'),('22c0cabc-4267-4bb7-9a3e-2d088e6a7c0f','true','introspection.token.claim'),('22c0cabc-4267-4bb7-9a3e-2d088e6a7c0f','String','jsonType.label'),('22c0cabc-4267-4bb7-9a3e-2d088e6a7c0f','username','user.attribute'),('22c0cabc-4267-4bb7-9a3e-2d088e6a7c0f','true','userinfo.token.claim'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','true','access.token.claim'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','true','id.token.claim'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','true','introspection.token.claim'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','country','user.attribute.country'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','formatted','user.attribute.formatted'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','locality','user.attribute.locality'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','postal_code','user.attribute.postal_code'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','region','user.attribute.region'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','street','user.attribute.street'),('24633ba3-9e97-4cda-a263-3b3b3e6d6ecb','true','userinfo.token.claim'),('246cd5b5-b2a9-4089-a3d8-88e3829fe047','true','access.token.claim'),('246cd5b5-b2a9-4089-a3d8-88e3829fe047','true','introspection.token.claim'),('25420f1b-18b1-4972-80df-3e94ef8b2a1f','true','access.token.claim'),('25420f1b-18b1-4972-80df-3e94ef8b2a1f','picture','claim.name'),('25420f1b-18b1-4972-80df-3e94ef8b2a1f','true','id.token.claim'),('25420f1b-18b1-4972-80df-3e94ef8b2a1f','true','introspection.token.claim'),('25420f1b-18b1-4972-80df-3e94ef8b2a1f','String','jsonType.label'),('25420f1b-18b1-4972-80df-3e94ef8b2a1f','picture','user.attribute'),('25420f1b-18b1-4972-80df-3e94ef8b2a1f','true','userinfo.token.claim'),('277738a5-bed1-4fd1-81b7-fbb326d24b95','true','access.token.claim'),('277738a5-bed1-4fd1-81b7-fbb326d24b95','preferred_username','claim.name'),('277738a5-bed1-4fd1-81b7-fbb326d24b95','true','id.token.claim'),('277738a5-bed1-4fd1-81b7-fbb326d24b95','true','introspection.token.claim'),('277738a5-bed1-4fd1-81b7-fbb326d24b95','String','jsonType.label'),('277738a5-bed1-4fd1-81b7-fbb326d24b95','username','user.attribute'),('277738a5-bed1-4fd1-81b7-fbb326d24b95','true','userinfo.token.claim'),('27afe043-d813-4ba9-8c78-6b8fa80e87fe','true','access.token.claim'),('27afe043-d813-4ba9-8c78-6b8fa80e87fe','resource_access.${client_id}.roles','claim.name'),('27afe043-d813-4ba9-8c78-6b8fa80e87fe','true','introspection.token.claim'),('27afe043-d813-4ba9-8c78-6b8fa80e87fe','String','jsonType.label'),('27afe043-d813-4ba9-8c78-6b8fa80e87fe','true','multivalued'),('27afe043-d813-4ba9-8c78-6b8fa80e87fe','foo','user.attribute'),('27c4e190-9e41-4db2-a52c-41352e79c849','true','access.token.claim'),('27c4e190-9e41-4db2-a52c-41352e79c849','true','introspection.token.claim'),('27f1a15f-a8e2-43dc-aec5-3897f0368985','true','access.token.claim'),('27f1a15f-a8e2-43dc-aec5-3897f0368985','groups','claim.name'),('27f1a15f-a8e2-43dc-aec5-3897f0368985','true','id.token.claim'),('27f1a15f-a8e2-43dc-aec5-3897f0368985','true','introspection.token.claim'),('27f1a15f-a8e2-43dc-aec5-3897f0368985','String','jsonType.label'),('27f1a15f-a8e2-43dc-aec5-3897f0368985','true','multivalued'),('27f1a15f-a8e2-43dc-aec5-3897f0368985','foo','user.attribute'),('2d38772e-8f8b-4ce8-a797-240989889bfd','true','access.token.claim'),('2d38772e-8f8b-4ce8-a797-240989889bfd','groups','claim.name'),('2d38772e-8f8b-4ce8-a797-240989889bfd','true','id.token.claim'),('2d38772e-8f8b-4ce8-a797-240989889bfd','true','introspection.token.claim'),('2d38772e-8f8b-4ce8-a797-240989889bfd','String','jsonType.label'),('2d38772e-8f8b-4ce8-a797-240989889bfd','true','multivalued'),('2d38772e-8f8b-4ce8-a797-240989889bfd','foo','user.attribute'),('2e6a4288-9b92-4de7-a2d0-f3eda3b508da','true','access.token.claim'),('2e6a4288-9b92-4de7-a2d0-f3eda3b508da','nickname','claim.name'),('2e6a4288-9b92-4de7-a2d0-f3eda3b508da','true','id.token.claim'),('2e6a4288-9b92-4de7-a2d0-f3eda3b508da','true','introspection.token.claim'),('2e6a4288-9b92-4de7-a2d0-f3eda3b508da','String','jsonType.label'),('2e6a4288-9b92-4de7-a2d0-f3eda3b508da','nickname','user.attribute'),('2e6a4288-9b92-4de7-a2d0-f3eda3b508da','true','userinfo.token.claim'),('2f17655c-948f-4b16-a66a-8cbdcef23da8','true','access.token.claim'),('2f17655c-948f-4b16-a66a-8cbdcef23da8','updated_at','claim.name'),('2f17655c-948f-4b16-a66a-8cbdcef23da8','true','id.token.claim'),('2f17655c-948f-4b16-a66a-8cbdcef23da8','true','introspection.token.claim'),('2f17655c-948f-4b16-a66a-8cbdcef23da8','long','jsonType.label'),('2f17655c-948f-4b16-a66a-8cbdcef23da8','updatedAt','user.attribute'),('2f17655c-948f-4b16-a66a-8cbdcef23da8','true','userinfo.token.claim'),('337bae6a-1795-4ce3-bd8c-c9b261a3ed2e','true','access.token.claim'),('337bae6a-1795-4ce3-bd8c-c9b261a3ed2e','upn','claim.name'),('337bae6a-1795-4ce3-bd8c-c9b261a3ed2e','true','id.token.claim'),('337bae6a-1795-4ce3-bd8c-c9b261a3ed2e','true','introspection.token.claim'),('337bae6a-1795-4ce3-bd8c-c9b261a3ed2e','String','jsonType.label'),('337bae6a-1795-4ce3-bd8c-c9b261a3ed2e','username','user.attribute'),('337bae6a-1795-4ce3-bd8c-c9b261a3ed2e','true','userinfo.token.claim'),('3667885f-4955-4e68-8e64-d2bdb573c76e','true','access.token.claim'),('3667885f-4955-4e68-8e64-d2bdb573c76e','locale','claim.name'),('3667885f-4955-4e68-8e64-d2bdb573c76e','true','id.token.claim'),('3667885f-4955-4e68-8e64-d2bdb573c76e','true','introspection.token.claim'),('3667885f-4955-4e68-8e64-d2bdb573c76e','String','jsonType.label'),('3667885f-4955-4e68-8e64-d2bdb573c76e','locale','user.attribute'),('3667885f-4955-4e68-8e64-d2bdb573c76e','true','userinfo.token.claim'),('39b495db-880e-4fad-a6d8-a9f1510d0304','true','access.token.claim'),('39b495db-880e-4fad-a6d8-a9f1510d0304','client_id','claim.name'),('39b495db-880e-4fad-a6d8-a9f1510d0304','true','id.token.claim'),('39b495db-880e-4fad-a6d8-a9f1510d0304','true','introspection.token.claim'),('39b495db-880e-4fad-a6d8-a9f1510d0304','String','jsonType.label'),('39b495db-880e-4fad-a6d8-a9f1510d0304','client_id','user.session.note'),('3cc1e96c-dc1c-4309-b785-65fdf7a6e1ff','true','access.token.claim'),('3cc1e96c-dc1c-4309-b785-65fdf7a6e1ff','email','claim.name'),('3cc1e96c-dc1c-4309-b785-65fdf7a6e1ff','true','id.token.claim'),('3cc1e96c-dc1c-4309-b785-65fdf7a6e1ff','true','introspection.token.claim'),('3cc1e96c-dc1c-4309-b785-65fdf7a6e1ff','String','jsonType.label'),('3cc1e96c-dc1c-4309-b785-65fdf7a6e1ff','email','user.attribute'),('3cc1e96c-dc1c-4309-b785-65fdf7a6e1ff','true','userinfo.token.claim'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','true','access.token.claim'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','true','id.token.claim'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','true','introspection.token.claim'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','country','user.attribute.country'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','formatted','user.attribute.formatted'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','locality','user.attribute.locality'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','postal_code','user.attribute.postal_code'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','region','user.attribute.region'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','street','user.attribute.street'),('3e10fe5c-dc4a-45cb-8c8f-d062faf909c8','true','userinfo.token.claim'),('43a44077-79c3-4a9e-b086-a1b5cbfefe36','true','access.token.claim'),('43a44077-79c3-4a9e-b086-a1b5cbfefe36','locale','claim.name'),('43a44077-79c3-4a9e-b086-a1b5cbfefe36','true','id.token.claim'),('43a44077-79c3-4a9e-b086-a1b5cbfefe36','true','introspection.token.claim'),('43a44077-79c3-4a9e-b086-a1b5cbfefe36','String','jsonType.label'),('43a44077-79c3-4a9e-b086-a1b5cbfefe36','locale','user.attribute'),('43a44077-79c3-4a9e-b086-a1b5cbfefe36','true','userinfo.token.claim'),('43ae9848-3173-421c-a74d-0383873fac34','true','access.token.claim'),('43ae9848-3173-421c-a74d-0383873fac34','locale','claim.name'),('43ae9848-3173-421c-a74d-0383873fac34','true','id.token.claim'),('43ae9848-3173-421c-a74d-0383873fac34','true','introspection.token.claim'),('43ae9848-3173-421c-a74d-0383873fac34','String','jsonType.label'),('43ae9848-3173-421c-a74d-0383873fac34','locale','user.attribute'),('43ae9848-3173-421c-a74d-0383873fac34','true','userinfo.token.claim'),('46ae2fd0-d9de-448c-a96a-5cebccfd9441','true','access.token.claim'),('46ae2fd0-d9de-448c-a96a-5cebccfd9441','birthdate','claim.name'),('46ae2fd0-d9de-448c-a96a-5cebccfd9441','true','id.token.claim'),('46ae2fd0-d9de-448c-a96a-5cebccfd9441','true','introspection.token.claim'),('46ae2fd0-d9de-448c-a96a-5cebccfd9441','String','jsonType.label'),('46ae2fd0-d9de-448c-a96a-5cebccfd9441','birthdate','user.attribute'),('46ae2fd0-d9de-448c-a96a-5cebccfd9441','true','userinfo.token.claim'),('4c14078b-e0ba-4da4-bda4-4f0a989bcd2d','Role','attribute.name'),('4c14078b-e0ba-4da4-bda4-4f0a989bcd2d','Basic','attribute.nameformat'),('4c14078b-e0ba-4da4-bda4-4f0a989bcd2d','false','single'),('4defd370-16ec-4935-8706-bb11c787b97d','true','access.token.claim'),('4defd370-16ec-4935-8706-bb11c787b97d','resource_access.${client_id}.roles','claim.name'),('4defd370-16ec-4935-8706-bb11c787b97d','true','introspection.token.claim'),('4defd370-16ec-4935-8706-bb11c787b97d','String','jsonType.label'),('4defd370-16ec-4935-8706-bb11c787b97d','true','multivalued'),('4defd370-16ec-4935-8706-bb11c787b97d','foo','user.attribute'),('4e2ee98a-1c53-465a-b1c5-87fae9ce9b66','true','access.token.claim'),('4e2ee98a-1c53-465a-b1c5-87fae9ce9b66','birthdate','claim.name'),('4e2ee98a-1c53-465a-b1c5-87fae9ce9b66','true','id.token.claim'),('4e2ee98a-1c53-465a-b1c5-87fae9ce9b66','true','introspection.token.claim'),('4e2ee98a-1c53-465a-b1c5-87fae9ce9b66','String','jsonType.label'),('4e2ee98a-1c53-465a-b1c5-87fae9ce9b66','birthdate','user.attribute'),('4e2ee98a-1c53-465a-b1c5-87fae9ce9b66','true','userinfo.token.claim'),('56ffc3a3-7d22-44d0-bb98-f676a6896844','true','access.token.claim'),('56ffc3a3-7d22-44d0-bb98-f676a6896844','website','claim.name'),('56ffc3a3-7d22-44d0-bb98-f676a6896844','true','id.token.claim'),('56ffc3a3-7d22-44d0-bb98-f676a6896844','true','introspection.token.claim'),('56ffc3a3-7d22-44d0-bb98-f676a6896844','String','jsonType.label'),('56ffc3a3-7d22-44d0-bb98-f676a6896844','website','user.attribute'),('56ffc3a3-7d22-44d0-bb98-f676a6896844','true','userinfo.token.claim'),('5701b1c3-b2c1-4ee4-9e40-9ff53c863b13','true','access.token.claim'),('5701b1c3-b2c1-4ee4-9e40-9ff53c863b13','middle_name','claim.name'),('5701b1c3-b2c1-4ee4-9e40-9ff53c863b13','true','id.token.claim'),('5701b1c3-b2c1-4ee4-9e40-9ff53c863b13','true','introspection.token.claim'),('5701b1c3-b2c1-4ee4-9e40-9ff53c863b13','String','jsonType.label'),('5701b1c3-b2c1-4ee4-9e40-9ff53c863b13','middleName','user.attribute'),('5701b1c3-b2c1-4ee4-9e40-9ff53c863b13','true','userinfo.token.claim'),('5726e013-cc7f-4d13-855b-01331e6e6011','true','access.token.claim'),('5726e013-cc7f-4d13-855b-01331e6e6011','true','id.token.claim'),('5726e013-cc7f-4d13-855b-01331e6e6011','true','introspection.token.claim'),('5726e013-cc7f-4d13-855b-01331e6e6011','true','userinfo.token.claim'),('57865ec3-1c3f-4183-a1ba-5b8845dfd468','true','access.token.claim'),('57865ec3-1c3f-4183-a1ba-5b8845dfd468','true','introspection.token.claim'),('5e934fa4-ba77-42ab-9ed2-f0d96d140cf7','true','access.token.claim'),('5e934fa4-ba77-42ab-9ed2-f0d96d140cf7','preferred_username','claim.name'),('5e934fa4-ba77-42ab-9ed2-f0d96d140cf7','true','id.token.claim'),('5e934fa4-ba77-42ab-9ed2-f0d96d140cf7','true','introspection.token.claim'),('5e934fa4-ba77-42ab-9ed2-f0d96d140cf7','String','jsonType.label'),('5e934fa4-ba77-42ab-9ed2-f0d96d140cf7','username','user.attribute'),('5e934fa4-ba77-42ab-9ed2-f0d96d140cf7','true','userinfo.token.claim'),('61c2c74e-7e9d-4215-b068-ffcab9491f2b','true','access.token.claim'),('61c2c74e-7e9d-4215-b068-ffcab9491f2b','groups','claim.name'),('61c2c74e-7e9d-4215-b068-ffcab9491f2b','true','id.token.claim'),('61c2c74e-7e9d-4215-b068-ffcab9491f2b','true','introspection.token.claim'),('61c2c74e-7e9d-4215-b068-ffcab9491f2b','String','jsonType.label'),('61c2c74e-7e9d-4215-b068-ffcab9491f2b','true','multivalued'),('61c2c74e-7e9d-4215-b068-ffcab9491f2b','foo','user.attribute'),('677766b9-24a2-4874-9175-94cbc5f5a55a','true','access.token.claim'),('677766b9-24a2-4874-9175-94cbc5f5a55a','profile','claim.name'),('677766b9-24a2-4874-9175-94cbc5f5a55a','true','id.token.claim'),('677766b9-24a2-4874-9175-94cbc5f5a55a','true','introspection.token.claim'),('677766b9-24a2-4874-9175-94cbc5f5a55a','String','jsonType.label'),('677766b9-24a2-4874-9175-94cbc5f5a55a','profile','user.attribute'),('677766b9-24a2-4874-9175-94cbc5f5a55a','true','userinfo.token.claim'),('6911d7ef-7a15-48bf-94ad-9cdd9e53211d','true','access.token.claim'),('6911d7ef-7a15-48bf-94ad-9cdd9e53211d','website','claim.name'),('6911d7ef-7a15-48bf-94ad-9cdd9e53211d','true','id.token.claim'),('6911d7ef-7a15-48bf-94ad-9cdd9e53211d','true','introspection.token.claim'),('6911d7ef-7a15-48bf-94ad-9cdd9e53211d','String','jsonType.label'),('6911d7ef-7a15-48bf-94ad-9cdd9e53211d','website','user.attribute'),('6911d7ef-7a15-48bf-94ad-9cdd9e53211d','true','userinfo.token.claim'),('6fdc38ff-c709-4174-825d-9cee83a47968','true','access.token.claim'),('6fdc38ff-c709-4174-825d-9cee83a47968','email','claim.name'),('6fdc38ff-c709-4174-825d-9cee83a47968','true','id.token.claim'),('6fdc38ff-c709-4174-825d-9cee83a47968','true','introspection.token.claim'),('6fdc38ff-c709-4174-825d-9cee83a47968','String','jsonType.label'),('6fdc38ff-c709-4174-825d-9cee83a47968','email','user.attribute'),('6fdc38ff-c709-4174-825d-9cee83a47968','true','userinfo.token.claim'),('6fdfed36-8530-4ae7-9317-6bfc124540f3','true','access.token.claim'),('6fdfed36-8530-4ae7-9317-6bfc124540f3','realm_access.roles','claim.name'),('6fdfed36-8530-4ae7-9317-6bfc124540f3','true','introspection.token.claim'),('6fdfed36-8530-4ae7-9317-6bfc124540f3','String','jsonType.label'),('6fdfed36-8530-4ae7-9317-6bfc124540f3','true','multivalued'),('6fdfed36-8530-4ae7-9317-6bfc124540f3','foo','user.attribute'),('72d3c619-a752-4393-8d28-036cc9492e7e','true','access.token.claim'),('72d3c619-a752-4393-8d28-036cc9492e7e','realm_access.roles','claim.name'),('72d3c619-a752-4393-8d28-036cc9492e7e','true','introspection.token.claim'),('72d3c619-a752-4393-8d28-036cc9492e7e','String','jsonType.label'),('72d3c619-a752-4393-8d28-036cc9492e7e','true','multivalued'),('72d3c619-a752-4393-8d28-036cc9492e7e','foo','user.attribute'),('74fefa95-c611-4004-a975-6f0dafd2c2b7','true','access.token.claim'),('74fefa95-c611-4004-a975-6f0dafd2c2b7','resource_access.${client_id}.roles','claim.name'),('74fefa95-c611-4004-a975-6f0dafd2c2b7','true','introspection.token.claim'),('74fefa95-c611-4004-a975-6f0dafd2c2b7','String','jsonType.label'),('74fefa95-c611-4004-a975-6f0dafd2c2b7','true','multivalued'),('74fefa95-c611-4004-a975-6f0dafd2c2b7','foo','user.attribute'),('7b788662-328f-498d-b5f9-93e9d81861c3','Role','attribute.name'),('7b788662-328f-498d-b5f9-93e9d81861c3','Basic','attribute.nameformat'),('7b788662-328f-498d-b5f9-93e9d81861c3','false','single'),('8550963e-a8e9-4e65-9eeb-fcfaafa17a32','true','access.token.claim'),('8550963e-a8e9-4e65-9eeb-fcfaafa17a32','gender','claim.name'),('8550963e-a8e9-4e65-9eeb-fcfaafa17a32','true','id.token.claim'),('8550963e-a8e9-4e65-9eeb-fcfaafa17a32','true','introspection.token.claim'),('8550963e-a8e9-4e65-9eeb-fcfaafa17a32','String','jsonType.label'),('8550963e-a8e9-4e65-9eeb-fcfaafa17a32','gender','user.attribute'),('8550963e-a8e9-4e65-9eeb-fcfaafa17a32','true','userinfo.token.claim'),('893c2033-c327-443b-9e56-65a699406019','true','access.token.claim'),('893c2033-c327-443b-9e56-65a699406019','phone_number_verified','claim.name'),('893c2033-c327-443b-9e56-65a699406019','true','id.token.claim'),('893c2033-c327-443b-9e56-65a699406019','true','introspection.token.claim'),('893c2033-c327-443b-9e56-65a699406019','boolean','jsonType.label'),('893c2033-c327-443b-9e56-65a699406019','phoneNumberVerified','user.attribute'),('893c2033-c327-443b-9e56-65a699406019','true','userinfo.token.claim'),('89834cb1-f609-4719-b37a-bedb99af7c67','true','access.token.claim'),('89834cb1-f609-4719-b37a-bedb99af7c67','locale','claim.name'),('89834cb1-f609-4719-b37a-bedb99af7c67','true','id.token.claim'),('89834cb1-f609-4719-b37a-bedb99af7c67','true','introspection.token.claim'),('89834cb1-f609-4719-b37a-bedb99af7c67','String','jsonType.label'),('89834cb1-f609-4719-b37a-bedb99af7c67','locale','user.attribute'),('89834cb1-f609-4719-b37a-bedb99af7c67','true','userinfo.token.claim'),('8e1839fc-1c54-4075-a8d6-1bb8723311e5','true','access.token.claim'),('8e1839fc-1c54-4075-a8d6-1bb8723311e5','true','introspection.token.claim'),('923870d1-9bd8-41d5-874b-a9cced9ed002','Role','attribute.name'),('923870d1-9bd8-41d5-874b-a9cced9ed002','Basic','attribute.nameformat'),('923870d1-9bd8-41d5-874b-a9cced9ed002','false','single'),('99a7bb8d-a226-4749-9253-cb8101b5a1e5','true','access.token.claim'),('99a7bb8d-a226-4749-9253-cb8101b5a1e5','phone_number','claim.name'),('99a7bb8d-a226-4749-9253-cb8101b5a1e5','true','id.token.claim'),('99a7bb8d-a226-4749-9253-cb8101b5a1e5','true','introspection.token.claim'),('99a7bb8d-a226-4749-9253-cb8101b5a1e5','String','jsonType.label'),('99a7bb8d-a226-4749-9253-cb8101b5a1e5','phoneNumber','user.attribute'),('99a7bb8d-a226-4749-9253-cb8101b5a1e5','true','userinfo.token.claim'),('9c17999b-d7a0-48ce-ab3a-f5b46f479a4a','true','access.token.claim'),('9c17999b-d7a0-48ce-ab3a-f5b46f479a4a','true','id.token.claim'),('9c17999b-d7a0-48ce-ab3a-f5b46f479a4a','true','introspection.token.claim'),('9c17999b-d7a0-48ce-ab3a-f5b46f479a4a','true','userinfo.token.claim'),('9e64e051-c87e-4131-9023-e85512314aba','true','access.token.claim'),('9e64e051-c87e-4131-9023-e85512314aba','phone_number_verified','claim.name'),('9e64e051-c87e-4131-9023-e85512314aba','true','id.token.claim'),('9e64e051-c87e-4131-9023-e85512314aba','true','introspection.token.claim'),('9e64e051-c87e-4131-9023-e85512314aba','boolean','jsonType.label'),('9e64e051-c87e-4131-9023-e85512314aba','phoneNumberVerified','user.attribute'),('9e64e051-c87e-4131-9023-e85512314aba','true','userinfo.token.claim'),('9fc4ce18-1f3d-4fb1-9161-4b96b609e2f7','true','access.token.claim'),('9fc4ce18-1f3d-4fb1-9161-4b96b609e2f7','true','id.token.claim'),('9fc4ce18-1f3d-4fb1-9161-4b96b609e2f7','true','introspection.token.claim'),('9fe57a74-9478-453a-bf7d-6bd6ce7b7689','true','access.token.claim'),('9fe57a74-9478-453a-bf7d-6bd6ce7b7689','family_name','claim.name'),('9fe57a74-9478-453a-bf7d-6bd6ce7b7689','true','id.token.claim'),('9fe57a74-9478-453a-bf7d-6bd6ce7b7689','true','introspection.token.claim'),('9fe57a74-9478-453a-bf7d-6bd6ce7b7689','String','jsonType.label'),('9fe57a74-9478-453a-bf7d-6bd6ce7b7689','lastName','user.attribute'),('9fe57a74-9478-453a-bf7d-6bd6ce7b7689','true','userinfo.token.claim'),('a2df6f9f-2761-4deb-85ce-2c34b725af11','true','access.token.claim'),('a2df6f9f-2761-4deb-85ce-2c34b725af11','given_name','claim.name'),('a2df6f9f-2761-4deb-85ce-2c34b725af11','true','id.token.claim'),('a2df6f9f-2761-4deb-85ce-2c34b725af11','true','introspection.token.claim'),('a2df6f9f-2761-4deb-85ce-2c34b725af11','String','jsonType.label'),('a2df6f9f-2761-4deb-85ce-2c34b725af11','firstName','user.attribute'),('a2df6f9f-2761-4deb-85ce-2c34b725af11','true','userinfo.token.claim'),('ab7d4c73-a86f-450e-8f90-7f365bdd57c1','true','access.token.claim'),('ab7d4c73-a86f-450e-8f90-7f365bdd57c1','family_name','claim.name'),('ab7d4c73-a86f-450e-8f90-7f365bdd57c1','true','id.token.claim'),('ab7d4c73-a86f-450e-8f90-7f365bdd57c1','true','introspection.token.claim'),('ab7d4c73-a86f-450e-8f90-7f365bdd57c1','String','jsonType.label'),('ab7d4c73-a86f-450e-8f90-7f365bdd57c1','lastName','user.attribute'),('ab7d4c73-a86f-450e-8f90-7f365bdd57c1','true','userinfo.token.claim'),('b1027342-58d3-4a1e-89a3-85e367dca6e6','true','access.token.claim'),('b1027342-58d3-4a1e-89a3-85e367dca6e6','updated_at','claim.name'),('b1027342-58d3-4a1e-89a3-85e367dca6e6','true','id.token.claim'),('b1027342-58d3-4a1e-89a3-85e367dca6e6','true','introspection.token.claim'),('b1027342-58d3-4a1e-89a3-85e367dca6e6','long','jsonType.label'),('b1027342-58d3-4a1e-89a3-85e367dca6e6','updatedAt','user.attribute'),('b1027342-58d3-4a1e-89a3-85e367dca6e6','true','userinfo.token.claim'),('b42208a0-7085-42aa-9f47-f19033f0352b','true','access.token.claim'),('b42208a0-7085-42aa-9f47-f19033f0352b','true','id.token.claim'),('b42208a0-7085-42aa-9f47-f19033f0352b','true','introspection.token.claim'),('b43966ef-87a3-4f89-86a2-9f37b160bbdf','true','access.token.claim'),('b43966ef-87a3-4f89-86a2-9f37b160bbdf','middle_name','claim.name'),('b43966ef-87a3-4f89-86a2-9f37b160bbdf','true','id.token.claim'),('b43966ef-87a3-4f89-86a2-9f37b160bbdf','true','introspection.token.claim'),('b43966ef-87a3-4f89-86a2-9f37b160bbdf','String','jsonType.label'),('b43966ef-87a3-4f89-86a2-9f37b160bbdf','middleName','user.attribute'),('b43966ef-87a3-4f89-86a2-9f37b160bbdf','true','userinfo.token.claim'),('b49943d7-d081-463f-a082-957519cbfe98','true','access.token.claim'),('b49943d7-d081-463f-a082-957519cbfe98','true','id.token.claim'),('b49943d7-d081-463f-a082-957519cbfe98','true','introspection.token.claim'),('b49943d7-d081-463f-a082-957519cbfe98','country','user.attribute.country'),('b49943d7-d081-463f-a082-957519cbfe98','formatted','user.attribute.formatted'),('b49943d7-d081-463f-a082-957519cbfe98','locality','user.attribute.locality'),('b49943d7-d081-463f-a082-957519cbfe98','postal_code','user.attribute.postal_code'),('b49943d7-d081-463f-a082-957519cbfe98','region','user.attribute.region'),('b49943d7-d081-463f-a082-957519cbfe98','street','user.attribute.street'),('b49943d7-d081-463f-a082-957519cbfe98','true','userinfo.token.claim'),('b6505333-7a3b-4c00-b9f1-6b80cdc03a72','true','access.token.claim'),('b6505333-7a3b-4c00-b9f1-6b80cdc03a72','phone_number','claim.name'),('b6505333-7a3b-4c00-b9f1-6b80cdc03a72','true','id.token.claim'),('b6505333-7a3b-4c00-b9f1-6b80cdc03a72','true','introspection.token.claim'),('b6505333-7a3b-4c00-b9f1-6b80cdc03a72','String','jsonType.label'),('b6505333-7a3b-4c00-b9f1-6b80cdc03a72','phoneNumber','user.attribute'),('b6505333-7a3b-4c00-b9f1-6b80cdc03a72','true','userinfo.token.claim'),('b9495c1d-12f3-44d9-b1f7-16aaf7f1720c','true','access.token.claim'),('b9495c1d-12f3-44d9-b1f7-16aaf7f1720c','phone_number_verified','claim.name'),('b9495c1d-12f3-44d9-b1f7-16aaf7f1720c','true','id.token.claim'),('b9495c1d-12f3-44d9-b1f7-16aaf7f1720c','true','introspection.token.claim'),('b9495c1d-12f3-44d9-b1f7-16aaf7f1720c','boolean','jsonType.label'),('b9495c1d-12f3-44d9-b1f7-16aaf7f1720c','phoneNumberVerified','user.attribute'),('b9495c1d-12f3-44d9-b1f7-16aaf7f1720c','true','userinfo.token.claim'),('ba3da3d9-9c39-432b-b0a8-f915e4f87846','true','access.token.claim'),('ba3da3d9-9c39-432b-b0a8-f915e4f87846','realm_access.roles','claim.name'),('ba3da3d9-9c39-432b-b0a8-f915e4f87846','true','introspection.token.claim'),('ba3da3d9-9c39-432b-b0a8-f915e4f87846','String','jsonType.label'),('ba3da3d9-9c39-432b-b0a8-f915e4f87846','true','multivalued'),('ba3da3d9-9c39-432b-b0a8-f915e4f87846','foo','user.attribute'),('ba52ca56-d879-47d3-aa16-892b5846cf40','true','access.token.claim'),('ba52ca56-d879-47d3-aa16-892b5846cf40','locale','claim.name'),('ba52ca56-d879-47d3-aa16-892b5846cf40','true','id.token.claim'),('ba52ca56-d879-47d3-aa16-892b5846cf40','true','introspection.token.claim'),('ba52ca56-d879-47d3-aa16-892b5846cf40','String','jsonType.label'),('ba52ca56-d879-47d3-aa16-892b5846cf40','locale','user.attribute'),('ba52ca56-d879-47d3-aa16-892b5846cf40','true','userinfo.token.claim'),('bbbaaf89-f011-4658-b6eb-839cc250b765','true','access.token.claim'),('bbbaaf89-f011-4658-b6eb-839cc250b765','email_verified','claim.name'),('bbbaaf89-f011-4658-b6eb-839cc250b765','true','id.token.claim'),('bbbaaf89-f011-4658-b6eb-839cc250b765','true','introspection.token.claim'),('bbbaaf89-f011-4658-b6eb-839cc250b765','boolean','jsonType.label'),('bbbaaf89-f011-4658-b6eb-839cc250b765','emailVerified','user.attribute'),('bbbaaf89-f011-4658-b6eb-839cc250b765','true','userinfo.token.claim'),('c012d16b-735e-4868-afe7-b4df184e47b2','true','access.token.claim'),('c012d16b-735e-4868-afe7-b4df184e47b2','phone_number','claim.name'),('c012d16b-735e-4868-afe7-b4df184e47b2','true','id.token.claim'),('c012d16b-735e-4868-afe7-b4df184e47b2','true','introspection.token.claim'),('c012d16b-735e-4868-afe7-b4df184e47b2','String','jsonType.label'),('c012d16b-735e-4868-afe7-b4df184e47b2','phoneNumber','user.attribute'),('c012d16b-735e-4868-afe7-b4df184e47b2','true','userinfo.token.claim'),('c0e5ac45-eaa9-4e35-b284-eead4f9b676b','true','access.token.claim'),('c0e5ac45-eaa9-4e35-b284-eead4f9b676b','locale','claim.name'),('c0e5ac45-eaa9-4e35-b284-eead4f9b676b','true','id.token.claim'),('c0e5ac45-eaa9-4e35-b284-eead4f9b676b','true','introspection.token.claim'),('c0e5ac45-eaa9-4e35-b284-eead4f9b676b','String','jsonType.label'),('c0e5ac45-eaa9-4e35-b284-eead4f9b676b','locale','user.attribute'),('c0e5ac45-eaa9-4e35-b284-eead4f9b676b','true','userinfo.token.claim'),('c694eda7-a74c-4791-898a-f170b8489b8a','true','access.token.claim'),('c694eda7-a74c-4791-898a-f170b8489b8a','gender','claim.name'),('c694eda7-a74c-4791-898a-f170b8489b8a','true','id.token.claim'),('c694eda7-a74c-4791-898a-f170b8489b8a','true','introspection.token.claim'),('c694eda7-a74c-4791-898a-f170b8489b8a','String','jsonType.label'),('c694eda7-a74c-4791-898a-f170b8489b8a','gender','user.attribute'),('c694eda7-a74c-4791-898a-f170b8489b8a','true','userinfo.token.claim'),('c92a770f-4145-4fef-a3ae-7dc27f2e6ebd','true','access.token.claim'),('c92a770f-4145-4fef-a3ae-7dc27f2e6ebd','clientHost','claim.name'),('c92a770f-4145-4fef-a3ae-7dc27f2e6ebd','true','id.token.claim'),('c92a770f-4145-4fef-a3ae-7dc27f2e6ebd','true','introspection.token.claim'),('c92a770f-4145-4fef-a3ae-7dc27f2e6ebd','String','jsonType.label'),('c92a770f-4145-4fef-a3ae-7dc27f2e6ebd','clientHost','user.session.note'),('d04aeff0-8470-4c33-af73-0d6865f9ce1b','true','access.token.claim'),('d04aeff0-8470-4c33-af73-0d6865f9ce1b','email_verified','claim.name'),('d04aeff0-8470-4c33-af73-0d6865f9ce1b','true','id.token.claim'),('d04aeff0-8470-4c33-af73-0d6865f9ce1b','true','introspection.token.claim'),('d04aeff0-8470-4c33-af73-0d6865f9ce1b','boolean','jsonType.label'),('d04aeff0-8470-4c33-af73-0d6865f9ce1b','emailVerified','user.attribute'),('d04aeff0-8470-4c33-af73-0d6865f9ce1b','true','userinfo.token.claim'),('d28fccab-10d8-487f-88bf-4c568acd2c1a','true','access.token.claim'),('d28fccab-10d8-487f-88bf-4c568acd2c1a','true','introspection.token.claim'),('d9e8f7b3-dcce-4929-804a-0aaccd284ec5','true','access.token.claim'),('d9e8f7b3-dcce-4929-804a-0aaccd284ec5','gender','claim.name'),('d9e8f7b3-dcce-4929-804a-0aaccd284ec5','true','id.token.claim'),('d9e8f7b3-dcce-4929-804a-0aaccd284ec5','true','introspection.token.claim'),('d9e8f7b3-dcce-4929-804a-0aaccd284ec5','String','jsonType.label'),('d9e8f7b3-dcce-4929-804a-0aaccd284ec5','gender','user.attribute'),('d9e8f7b3-dcce-4929-804a-0aaccd284ec5','true','userinfo.token.claim'),('e1f5bd72-82b5-4ad9-bb02-1720e40de310','true','access.token.claim'),('e1f5bd72-82b5-4ad9-bb02-1720e40de310','given_name','claim.name'),('e1f5bd72-82b5-4ad9-bb02-1720e40de310','true','id.token.claim'),('e1f5bd72-82b5-4ad9-bb02-1720e40de310','true','introspection.token.claim'),('e1f5bd72-82b5-4ad9-bb02-1720e40de310','String','jsonType.label'),('e1f5bd72-82b5-4ad9-bb02-1720e40de310','firstName','user.attribute'),('e1f5bd72-82b5-4ad9-bb02-1720e40de310','true','userinfo.token.claim'),('ea24267e-5638-4b00-9ed0-3be54e91e872','true','access.token.claim'),('ea24267e-5638-4b00-9ed0-3be54e91e872','birthdate','claim.name'),('ea24267e-5638-4b00-9ed0-3be54e91e872','true','id.token.claim'),('ea24267e-5638-4b00-9ed0-3be54e91e872','true','introspection.token.claim'),('ea24267e-5638-4b00-9ed0-3be54e91e872','String','jsonType.label'),('ea24267e-5638-4b00-9ed0-3be54e91e872','birthdate','user.attribute'),('ea24267e-5638-4b00-9ed0-3be54e91e872','true','userinfo.token.claim'),('ef43900c-d754-4239-a300-c90ff0fa119f','true','access.token.claim'),('ef43900c-d754-4239-a300-c90ff0fa119f','picture','claim.name'),('ef43900c-d754-4239-a300-c90ff0fa119f','true','id.token.claim'),('ef43900c-d754-4239-a300-c90ff0fa119f','true','introspection.token.claim'),('ef43900c-d754-4239-a300-c90ff0fa119f','String','jsonType.label'),('ef43900c-d754-4239-a300-c90ff0fa119f','picture','user.attribute'),('ef43900c-d754-4239-a300-c90ff0fa119f','true','userinfo.token.claim'),('ef714fe2-fad7-4613-a9f9-642abce4ee04','true','access.token.claim'),('ef714fe2-fad7-4613-a9f9-642abce4ee04','true','id.token.claim'),('ef714fe2-fad7-4613-a9f9-642abce4ee04','true','introspection.token.claim'),('f37a9f53-5a48-4b36-98c3-2c701ada63e5','true','access.token.claim'),('f37a9f53-5a48-4b36-98c3-2c701ada63e5','true','introspection.token.claim'),('f7946d43-0a4a-491d-8a61-a60df0ff107d','true','access.token.claim'),('f7946d43-0a4a-491d-8a61-a60df0ff107d','given_name','claim.name'),('f7946d43-0a4a-491d-8a61-a60df0ff107d','true','id.token.claim'),('f7946d43-0a4a-491d-8a61-a60df0ff107d','true','introspection.token.claim'),('f7946d43-0a4a-491d-8a61-a60df0ff107d','String','jsonType.label'),('f7946d43-0a4a-491d-8a61-a60df0ff107d','firstName','user.attribute'),('f7946d43-0a4a-491d-8a61-a60df0ff107d','true','userinfo.token.claim'),('f8a2b9cb-0314-429e-8990-6764c2d633ce','true','access.token.claim'),('f8a2b9cb-0314-429e-8990-6764c2d633ce','clientAddress','claim.name'),('f8a2b9cb-0314-429e-8990-6764c2d633ce','true','id.token.claim'),('f8a2b9cb-0314-429e-8990-6764c2d633ce','true','introspection.token.claim'),('f8a2b9cb-0314-429e-8990-6764c2d633ce','String','jsonType.label'),('f8a2b9cb-0314-429e-8990-6764c2d633ce','clientAddress','user.session.note'),('f8ba2db6-9f5a-4523-938e-11536a4b8b6b','true','access.token.claim'),('f8ba2db6-9f5a-4523-938e-11536a4b8b6b','updated_at','claim.name'),('f8ba2db6-9f5a-4523-938e-11536a4b8b6b','true','id.token.claim'),('f8ba2db6-9f5a-4523-938e-11536a4b8b6b','true','introspection.token.claim'),('f8ba2db6-9f5a-4523-938e-11536a4b8b6b','long','jsonType.label'),('f8ba2db6-9f5a-4523-938e-11536a4b8b6b','updatedAt','user.attribute'),('f8ba2db6-9f5a-4523-938e-11536a4b8b6b','true','userinfo.token.claim'),('fb8d86ea-3894-487e-9404-2216e289c07d','true','access.token.claim'),('fb8d86ea-3894-487e-9404-2216e289c07d','nickname','claim.name'),('fb8d86ea-3894-487e-9404-2216e289c07d','true','id.token.claim'),('fb8d86ea-3894-487e-9404-2216e289c07d','true','introspection.token.claim'),('fb8d86ea-3894-487e-9404-2216e289c07d','String','jsonType.label'),('fb8d86ea-3894-487e-9404-2216e289c07d','nickname','user.attribute'),('fb8d86ea-3894-487e-9404-2216e289c07d','true','userinfo.token.claim'),('ffcf3c59-a38d-4e46-ab99-36fa5c399080','true','access.token.claim'),('ffcf3c59-a38d-4e46-ab99-36fa5c399080','family_name','claim.name'),('ffcf3c59-a38d-4e46-ab99-36fa5c399080','true','id.token.claim'),('ffcf3c59-a38d-4e46-ab99-36fa5c399080','true','introspection.token.claim'),('ffcf3c59-a38d-4e46-ab99-36fa5c399080','String','jsonType.label'),('ffcf3c59-a38d-4e46-ab99-36fa5c399080','lastName','user.attribute'),('ffcf3c59-a38d-4e46-ab99-36fa5c399080','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('3929fd70-b926-4893-87ea-df1d4e547204',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','0e3a80af-5a82-4aa4-98d8-d862fece46be',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','31f058cc-1cec-4a63-9655-0ebc8da045e5','a45b0871-d35e-49f5-8956-00a6477c4087','45c5197f-dc32-4a48-b609-5ec84341deea','012a0be1-59fd-44b4-a11e-efb3503fa645','985e9211-b955-4239-a055-40a8bcaf3799',2592000,_binary '\0',900,_binary '',_binary '\0','aaab7967-9306-4550-b61b-718518093adc',0,_binary '\0',0,0,'44c1bb20-d47a-49a5-937c-de590b425ad6'),('77ed64ab-5412-4324-afcf-146bfc77e1b5',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'food-delivery',0,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','172afcd0-ff68-4225-a747-b8df6de29acc',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','9603099b-df69-49e1-814a-f23667040195','f9a07c90-ce5d-448b-8a69-55c6d2da9b87','16aa05b2-6c24-42aa-bf3b-e5b606cecebe','50b96e03-b4c3-4a6a-87fa-d5ba51e6b57d','2a3bdb38-813c-4854-913a-733cc53f3b42',2592000,_binary '\0',900,_binary '',_binary '\0','a8ce0de3-2d2f-42d3-89db-74d8c2a1c4a8',0,_binary '\0',0,0,'ea7ac302-0dd8-482d-a3a6-0e6b829dab68'),('b27e471f-0707-4dd7-8f2e-f6d21acecce8',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'test',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','68b77aac-7ddd-443f-9446-c17429b2f48a',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','40b731a0-5049-4684-94ca-adab04fd1935','31431ce4-1395-47d3-a08f-315d95cbf6b9','8ac69963-18b8-4fff-bfd3-b801a7cc72ed','c9e33c61-cd0d-44ea-b723-9107d45cd733','fd5e2e98-3618-4f54-86db-ef8465e08dc6',2592000,_binary '\0',900,_binary '',_binary '\0','a469ef55-1683-474f-bd37-38b82c81442f',0,_binary '\0',0,0,'181a6a4d-d6a5-4aa2-9877-87b5c9ffac53');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','3929fd70-b926-4893-87ea-df1d4e547204','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','3929fd70-b926-4893-87ea-df1d4e547204',''),('_browser_header.contentSecurityPolicyReportOnly','77ed64ab-5412-4324-afcf-146bfc77e1b5',''),('_browser_header.contentSecurityPolicyReportOnly','b27e471f-0707-4dd7-8f2e-f6d21acecce8',''),('_browser_header.referrerPolicy','3929fd70-b926-4893-87ea-df1d4e547204','no-referrer'),('_browser_header.referrerPolicy','77ed64ab-5412-4324-afcf-146bfc77e1b5','no-referrer'),('_browser_header.referrerPolicy','b27e471f-0707-4dd7-8f2e-f6d21acecce8','no-referrer'),('_browser_header.strictTransportSecurity','3929fd70-b926-4893-87ea-df1d4e547204','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','77ed64ab-5412-4324-afcf-146bfc77e1b5','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','b27e471f-0707-4dd7-8f2e-f6d21acecce8','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','3929fd70-b926-4893-87ea-df1d4e547204','nosniff'),('_browser_header.xContentTypeOptions','77ed64ab-5412-4324-afcf-146bfc77e1b5','nosniff'),('_browser_header.xContentTypeOptions','b27e471f-0707-4dd7-8f2e-f6d21acecce8','nosniff'),('_browser_header.xFrameOptions','3929fd70-b926-4893-87ea-df1d4e547204','SAMEORIGIN'),('_browser_header.xFrameOptions','77ed64ab-5412-4324-afcf-146bfc77e1b5','SAMEORIGIN'),('_browser_header.xFrameOptions','b27e471f-0707-4dd7-8f2e-f6d21acecce8','SAMEORIGIN'),('_browser_header.xRobotsTag','3929fd70-b926-4893-87ea-df1d4e547204','none'),('_browser_header.xRobotsTag','77ed64ab-5412-4324-afcf-146bfc77e1b5','none'),('_browser_header.xRobotsTag','b27e471f-0707-4dd7-8f2e-f6d21acecce8','none'),('_browser_header.xXSSProtection','3929fd70-b926-4893-87ea-df1d4e547204','1; mode=block'),('_browser_header.xXSSProtection','77ed64ab-5412-4324-afcf-146bfc77e1b5','1; mode=block'),('_browser_header.xXSSProtection','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1; mode=block'),('actionTokenGeneratedByAdminLifespan','77ed64ab-5412-4324-afcf-146bfc77e1b5','43200'),('actionTokenGeneratedByAdminLifespan','b27e471f-0707-4dd7-8f2e-f6d21acecce8','43200'),('actionTokenGeneratedByUserLifespan','77ed64ab-5412-4324-afcf-146bfc77e1b5','300'),('actionTokenGeneratedByUserLifespan','b27e471f-0707-4dd7-8f2e-f6d21acecce8','300'),('bruteForceProtected','3929fd70-b926-4893-87ea-df1d4e547204','false'),('bruteForceProtected','77ed64ab-5412-4324-afcf-146bfc77e1b5','false'),('bruteForceProtected','b27e471f-0707-4dd7-8f2e-f6d21acecce8','false'),('cibaAuthRequestedUserHint','77ed64ab-5412-4324-afcf-146bfc77e1b5','login_hint'),('cibaAuthRequestedUserHint','b27e471f-0707-4dd7-8f2e-f6d21acecce8','login_hint'),('cibaBackchannelTokenDeliveryMode','77ed64ab-5412-4324-afcf-146bfc77e1b5','poll'),('cibaBackchannelTokenDeliveryMode','b27e471f-0707-4dd7-8f2e-f6d21acecce8','poll'),('cibaExpiresIn','77ed64ab-5412-4324-afcf-146bfc77e1b5','120'),('cibaExpiresIn','b27e471f-0707-4dd7-8f2e-f6d21acecce8','120'),('cibaInterval','77ed64ab-5412-4324-afcf-146bfc77e1b5','5'),('cibaInterval','b27e471f-0707-4dd7-8f2e-f6d21acecce8','5'),('client-policies.policies','77ed64ab-5412-4324-afcf-146bfc77e1b5','{\"policies\":[]}'),('client-policies.profiles','77ed64ab-5412-4324-afcf-146bfc77e1b5','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','77ed64ab-5412-4324-afcf-146bfc77e1b5','0'),('clientOfflineSessionMaxLifespan','77ed64ab-5412-4324-afcf-146bfc77e1b5','0'),('clientSessionIdleTimeout','77ed64ab-5412-4324-afcf-146bfc77e1b5','0'),('clientSessionMaxLifespan','77ed64ab-5412-4324-afcf-146bfc77e1b5','0'),('defaultSignatureAlgorithm','3929fd70-b926-4893-87ea-df1d4e547204','RS256'),('defaultSignatureAlgorithm','77ed64ab-5412-4324-afcf-146bfc77e1b5','RS256'),('defaultSignatureAlgorithm','b27e471f-0707-4dd7-8f2e-f6d21acecce8','RS256'),('displayName','3929fd70-b926-4893-87ea-df1d4e547204','Keycloak'),('displayNameHtml','3929fd70-b926-4893-87ea-df1d4e547204','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','3929fd70-b926-4893-87ea-df1d4e547204','30'),('failureFactor','77ed64ab-5412-4324-afcf-146bfc77e1b5','30'),('failureFactor','b27e471f-0707-4dd7-8f2e-f6d21acecce8','30'),('maxDeltaTimeSeconds','3929fd70-b926-4893-87ea-df1d4e547204','43200'),('maxDeltaTimeSeconds','77ed64ab-5412-4324-afcf-146bfc77e1b5','43200'),('maxDeltaTimeSeconds','b27e471f-0707-4dd7-8f2e-f6d21acecce8','43200'),('maxFailureWaitSeconds','3929fd70-b926-4893-87ea-df1d4e547204','900'),('maxFailureWaitSeconds','77ed64ab-5412-4324-afcf-146bfc77e1b5','900'),('maxFailureWaitSeconds','b27e471f-0707-4dd7-8f2e-f6d21acecce8','900'),('minimumQuickLoginWaitSeconds','3929fd70-b926-4893-87ea-df1d4e547204','60'),('minimumQuickLoginWaitSeconds','77ed64ab-5412-4324-afcf-146bfc77e1b5','60'),('minimumQuickLoginWaitSeconds','b27e471f-0707-4dd7-8f2e-f6d21acecce8','60'),('oauth2DeviceCodeLifespan','77ed64ab-5412-4324-afcf-146bfc77e1b5','600'),('oauth2DeviceCodeLifespan','b27e471f-0707-4dd7-8f2e-f6d21acecce8','600'),('oauth2DevicePollingInterval','77ed64ab-5412-4324-afcf-146bfc77e1b5','5'),('oauth2DevicePollingInterval','b27e471f-0707-4dd7-8f2e-f6d21acecce8','5'),('offlineSessionMaxLifespan','3929fd70-b926-4893-87ea-df1d4e547204','5184000'),('offlineSessionMaxLifespan','77ed64ab-5412-4324-afcf-146bfc77e1b5','5184000'),('offlineSessionMaxLifespan','b27e471f-0707-4dd7-8f2e-f6d21acecce8','5184000'),('offlineSessionMaxLifespanEnabled','3929fd70-b926-4893-87ea-df1d4e547204','false'),('offlineSessionMaxLifespanEnabled','77ed64ab-5412-4324-afcf-146bfc77e1b5','false'),('offlineSessionMaxLifespanEnabled','b27e471f-0707-4dd7-8f2e-f6d21acecce8','false'),('parRequestUriLifespan','77ed64ab-5412-4324-afcf-146bfc77e1b5','60'),('parRequestUriLifespan','b27e471f-0707-4dd7-8f2e-f6d21acecce8','60'),('permanentLockout','3929fd70-b926-4893-87ea-df1d4e547204','false'),('permanentLockout','77ed64ab-5412-4324-afcf-146bfc77e1b5','false'),('permanentLockout','b27e471f-0707-4dd7-8f2e-f6d21acecce8','false'),('quickLoginCheckMilliSeconds','3929fd70-b926-4893-87ea-df1d4e547204','1000'),('quickLoginCheckMilliSeconds','77ed64ab-5412-4324-afcf-146bfc77e1b5','1000'),('quickLoginCheckMilliSeconds','b27e471f-0707-4dd7-8f2e-f6d21acecce8','1000'),('realmReusableOtpCode','3929fd70-b926-4893-87ea-df1d4e547204','false'),('realmReusableOtpCode','77ed64ab-5412-4324-afcf-146bfc77e1b5','false'),('realmReusableOtpCode','b27e471f-0707-4dd7-8f2e-f6d21acecce8','false'),('waitIncrementSeconds','3929fd70-b926-4893-87ea-df1d4e547204','60'),('waitIncrementSeconds','77ed64ab-5412-4324-afcf-146bfc77e1b5','60'),('waitIncrementSeconds','b27e471f-0707-4dd7-8f2e-f6d21acecce8','60'),('webAuthnPolicyAttestationConveyancePreference','77ed64ab-5412-4324-afcf-146bfc77e1b5','not specified'),('webAuthnPolicyAttestationConveyancePreference','b27e471f-0707-4dd7-8f2e-f6d21acecce8','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8','not specified'),('webAuthnPolicyAuthenticatorAttachment','77ed64ab-5412-4324-afcf-146bfc77e1b5','not specified'),('webAuthnPolicyAuthenticatorAttachment','b27e471f-0707-4dd7-8f2e-f6d21acecce8','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','77ed64ab-5412-4324-afcf-146bfc77e1b5','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','b27e471f-0707-4dd7-8f2e-f6d21acecce8','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8','false'),('webAuthnPolicyCreateTimeout','77ed64ab-5412-4324-afcf-146bfc77e1b5','0'),('webAuthnPolicyCreateTimeout','b27e471f-0707-4dd7-8f2e-f6d21acecce8','0'),('webAuthnPolicyCreateTimeoutPasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5','0'),('webAuthnPolicyCreateTimeoutPasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8','0'),('webAuthnPolicyRequireResidentKey','77ed64ab-5412-4324-afcf-146bfc77e1b5','not specified'),('webAuthnPolicyRequireResidentKey','b27e471f-0707-4dd7-8f2e-f6d21acecce8','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8','not specified'),('webAuthnPolicyRpEntityName','77ed64ab-5412-4324-afcf-146bfc77e1b5','keycloak'),('webAuthnPolicyRpEntityName','b27e471f-0707-4dd7-8f2e-f6d21acecce8','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8','keycloak'),('webAuthnPolicyRpId','77ed64ab-5412-4324-afcf-146bfc77e1b5',''),('webAuthnPolicyRpId','b27e471f-0707-4dd7-8f2e-f6d21acecce8',''),('webAuthnPolicyRpIdPasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5',''),('webAuthnPolicyRpIdPasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8',''),('webAuthnPolicySignatureAlgorithms','77ed64ab-5412-4324-afcf-146bfc77e1b5','ES256'),('webAuthnPolicySignatureAlgorithms','b27e471f-0707-4dd7-8f2e-f6d21acecce8','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8','ES256'),('webAuthnPolicyUserVerificationRequirement','77ed64ab-5412-4324-afcf-146bfc77e1b5','not specified'),('webAuthnPolicyUserVerificationRequirement','b27e471f-0707-4dd7-8f2e-f6d21acecce8','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','77ed64ab-5412-4324-afcf-146bfc77e1b5','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('3929fd70-b926-4893-87ea-df1d4e547204','jboss-logging'),('77ed64ab-5412-4324-afcf-146bfc77e1b5','jboss-logging'),('b27e471f-0707-4dd7-8f2e-f6d21acecce8','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','3929fd70-b926-4893-87ea-df1d4e547204'),('password','password',_binary '',_binary '','77ed64ab-5412-4324-afcf-146bfc77e1b5'),('password','password',_binary '',_binary '','b27e471f-0707-4dd7-8f2e-f6d21acecce8');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('01c49ed9-27c5-4cd8-ba34-964d38455f13','/admin/test/console/*'),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','/admin/master/console/*'),('7a93f012-ffc0-4923-9609-1cc1d9a6d993','/realms/food-delivery/account/*'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','/realms/food-delivery/account/*'),('911a5f29-a2ef-4a61-ba38-6921db6fff14','/realms/test/account/*'),('9b5853eb-6ecf-4a11-9956-1cf3e7e08b50','/realms/test/account/*'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','*'),('bcd41309-62ab-4c60-b70a-716be700d744','/admin/food-delivery/console/*'),('eaac4b3f-d750-4eed-aeea-18cc89692999','/realms/master/account/*'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','/realms/master/account/*'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','http://localhost:4200');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0c38aaa8-90fb-4e60-a4e0-bc02c99255d9','UPDATE_PASSWORD','Update Password','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '',_binary '\0','UPDATE_PASSWORD',30),('100befaf-977d-471b-b2e8-c92e9952b76e','update_user_locale','Update User Locale','3929fd70-b926-4893-87ea-df1d4e547204',_binary '',_binary '\0','update_user_locale',1000),('13e7b188-67d0-4b1b-8926-7bedaa712490','TERMS_AND_CONDITIONS','Terms and Conditions','3929fd70-b926-4893-87ea-df1d4e547204',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('17e33b6c-9792-4448-b917-b4e4c300f095','UPDATE_PROFILE','Update Profile','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '',_binary '\0','UPDATE_PROFILE',40),('1a84999b-60ce-45c3-818b-f91c9caf440e','webauthn-register-passwordless','Webauthn Register Passwordless','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '',_binary '\0','webauthn-register-passwordless',80),('2db5ab1c-3d2c-480d-aacf-d130d7bf7234','CONFIGURE_TOTP','Configure OTP','3929fd70-b926-4893-87ea-df1d4e547204',_binary '',_binary '\0','CONFIGURE_TOTP',10),('3af34df8-59d1-4ee5-9646-63ecdd6c1bad','TERMS_AND_CONDITIONS','Terms and Conditions','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('49f43e03-afcd-479a-97bc-01df9bf8e436','webauthn-register','Webauthn Register','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '',_binary '\0','webauthn-register',70),('4b591601-d0fb-49fc-885d-605ee40d5591','delete_account','Delete Account','3929fd70-b926-4893-87ea-df1d4e547204',_binary '\0',_binary '\0','delete_account',60),('4b812f15-f140-4ff9-aff8-c0b308d4099e','CONFIGURE_TOTP','Configure OTP','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '',_binary '\0','CONFIGURE_TOTP',10),('5557ed0e-ce54-4b30-ba23-ca64ab471345','update_user_locale','Update User Locale','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '',_binary '\0','update_user_locale',1000),('631d74e9-44e8-4a98-b5e2-95f3a1954bd5','UPDATE_PASSWORD','Update Password','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '',_binary '\0','UPDATE_PASSWORD',30),('6984852f-193f-46fd-bbf5-420ac73911ff','webauthn-register-passwordless','Webauthn Register Passwordless','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '',_binary '\0','webauthn-register-passwordless',80),('78f319c1-2394-4a75-9e3f-346e29e780c4','webauthn-register','Webauthn Register','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '',_binary '\0','webauthn-register',70),('838b06bf-0d00-4bfd-aeec-8598220ace41','VERIFY_EMAIL','Verify Email','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '',_binary '\0','VERIFY_EMAIL',50),('90a775e4-4561-4cf3-9106-f1b3ef6b9fb3','VERIFY_EMAIL','Verify Email','3929fd70-b926-4893-87ea-df1d4e547204',_binary '',_binary '\0','VERIFY_EMAIL',50),('92b651de-3e71-4c79-8892-6e9641e7c815','CONFIGURE_TOTP','Configure OTP','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '',_binary '\0','CONFIGURE_TOTP',10),('97eb3d9b-40e9-49c6-ad81-2c2697542dde','webauthn-register-passwordless','Webauthn Register Passwordless','3929fd70-b926-4893-87ea-df1d4e547204',_binary '',_binary '\0','webauthn-register-passwordless',80),('ae9e3db2-a52d-4b54-a94f-4064b33683ef','delete_account','Delete Account','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '\0',_binary '\0','delete_account',60),('d29196c8-9f00-48ed-9108-fff772460e06','VERIFY_EMAIL','Verify Email','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '',_binary '\0','VERIFY_EMAIL',50),('d5fca48d-358d-45ce-aa72-16548707b0ec','update_user_locale','Update User Locale','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '',_binary '\0','update_user_locale',1000),('dd417f41-3299-479f-b191-d01e96b726b6','UPDATE_PROFILE','Update Profile','3929fd70-b926-4893-87ea-df1d4e547204',_binary '',_binary '\0','UPDATE_PROFILE',40),('de838aa3-3660-4f7a-b855-77362e944f8f','UPDATE_PROFILE','Update Profile','b27e471f-0707-4dd7-8f2e-f6d21acecce8',_binary '',_binary '\0','UPDATE_PROFILE',40),('e452e1d5-fa60-46b8-ab2a-340af7f37a2f','TERMS_AND_CONDITIONS','Terms and Conditions','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '\0',_binary '\0','TERMS_AND_CONDITIONS',20),('eae511ce-9c25-4dd6-9731-1e92e9d3530b','delete_account','Delete Account','77ed64ab-5412-4324-afcf-146bfc77e1b5',_binary '\0',_binary '\0','delete_account',60),('f57baa2b-2b0d-494f-8ba7-e633003b372f','UPDATE_PASSWORD','Update Password','3929fd70-b926-4893-87ea-df1d4e547204',_binary '',_binary '\0','UPDATE_PASSWORD',30),('fcb5719a-f723-43ce-babc-2878c3e7c320','webauthn-register','Webauthn Register','3929fd70-b926-4893-87ea-df1d4e547204',_binary '',_binary '\0','webauthn-register',70);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` tinyint DEFAULT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('fc71cc2e-b2cd-4118-b2fc-62880a15c51b',_binary '',0,1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` tinyint DEFAULT NULL,
  `LOGIC` tinyint DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('4872c105-dd6c-48ac-bddb-17b193cf5c6b','Default Permission','A permission that applies to the default resource type','resource',1,0,'fc71cc2e-b2cd-4118-b2fc-62880a15c51b',NULL),('a297f157-5bd2-4fb6-aa45-319a15c3ab9a','Default Policy','A policy that grants access only for users within this realm','js',0,0,'fc71cc2e-b2cd-4118-b2fc-62880a15c51b',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('c98f5d68-4199-4d9e-8c85-dd34de943c70','Default Resource','urn:api-gateway:resources:default',NULL,'fc71cc2e-b2cd-4118-b2fc-62880a15c51b','fc71cc2e-b2cd-4118-b2fc-62880a15c51b',_binary '\0',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES ('c98f5d68-4199-4d9e-8c85-dd34de943c70','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `ROLE_ATTRIBUTE` VALUES ('18c0743b-ab26-4f65-97aa-7da0977f09c5','de398b3f-c1b8-44fb-80d0-ba918f44e0f2','idk','tzst');
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('911a5f29-a2ef-4a61-ba38-6921db6fff14','1955225e-081a-4f64-a381-54b315f1fc4d'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','35a8343c-20e7-42d8-aaf9-d7c0e6804790'),('911a5f29-a2ef-4a61-ba38-6921db6fff14','aa4a414f-79d2-4210-a662-1eb51ccf2ee8'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','ab41ccae-c5ae-4a7d-98ba-2982e7c7c0c4'),('f65759e0-3ac0-490d-8725-bd00e4103f2d','b3e9cf1e-f993-4c20-84dc-d8b590c8159d'),('8883e639-1a69-43ef-8343-d80a7f1e7e86','e45f1c0a-43a3-41a9-b98a-fcd27ca993ee');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('formatted','123 Main Street','6f2d44bb-fc31-4750-bf44-780dcaba2c30','5c9c4350-4d4e-4356-a730-1644e16a7830'),('phoneNumber','9876615999','6f2d44bb-fc31-4750-bf44-780dcaba2c30','978a556d-4e39-4d2c-9a35-74027e3f166d');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('6f2d44bb-fc31-4750-bf44-780dcaba2c30','ahmed.touati@courzelo.com','ahmed.touati@courzelo.com',_binary '\0',_binary '',NULL,'Oussema','Ouakadd','77ed64ab-5412-4324-afcf-146bfc77e1b5','godyrex',1730998482399,NULL,0),('7e7480b0-2e80-4418-b42b-f01228d64ca6',NULL,'502851ef-4073-4da2-aa84-8d62bebbee9d',_binary '\0',_binary '',NULL,NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','service-account-api-gateway',1730997410343,'fc71cc2e-b2cd-4118-b2fc-62880a15c51b',0),('8fa8147e-4f24-4beb-ab9d-cf7f131c5daa','oussouakad@gmail.com','oussouakad@gmail.com',_binary '\0',_binary '',NULL,'Oussema','ouakad','77ed64ab-5412-4324-afcf-146bfc77e1b5','godyrexaa',1731161365573,NULL,0),('a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c',NULL,'d6e6e0b7-33eb-4354-8e01-c9690f86775e',_binary '\0',_binary '',NULL,NULL,NULL,'3929fd70-b926-4893-87ea-df1d4e547204','admin',1730198708321,NULL,0),('ef9c9cd7-2d69-4f8c-8304-74224b5bcb29','godyrex@gmail.com','godyrex@gmail.com',_binary '\0',_binary '',NULL,NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','godyrexa',1731198172941,NULL,0),('fa29708c-8d31-4435-9ca7-3ea8fcba181c','godyraaex@gmail.com','godyraaex@gmail.com',_binary '\0',_binary '',NULL,NULL,NULL,'77ed64ab-5412-4324-afcf-146bfc77e1b5','godyrexaaaaaa',1731199258134,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('de398b3f-c1b8-44fb-80d0-ba918f44e0f2','6f2d44bb-fc31-4750-bf44-780dcaba2c30'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','6f2d44bb-fc31-4750-bf44-780dcaba2c30'),('22f596a6-b6ca-4f84-ac1f-a305ae062ab4','7e7480b0-2e80-4418-b42b-f01228d64ca6'),('ab6a42ce-c62f-48fc-8de1-736edaad6c34','7e7480b0-2e80-4418-b42b-f01228d64ca6'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','7e7480b0-2e80-4418-b42b-f01228d64ca6'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','8fa8147e-4f24-4beb-ab9d-cf7f131c5daa'),('02eb8bf8-7042-4e6e-8992-dc769662ca74','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('03386f43-5d31-4ce7-8e1f-a4bdccd4c669','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('09773f60-de8a-4cee-aadf-54aeacd385ed','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('0a8445c7-a1ff-4a4f-8f3c-fc0134c5e925','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('0b0a4f87-0c70-4df9-aa16-3bedf3672cf3','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('10623cd2-fcc5-49b9-a559-c510c801281a','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('18c63545-75f1-4bfa-a4f9-5070389ad0ae','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('25eaeae4-23a8-4b4f-897b-5d3404412e91','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('28a3d1a7-e7ac-42ad-b57b-616851b10ad8','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('28c9d304-3587-495a-b770-b10432ac8344','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('2a21d81b-af2d-46a7-a5ab-af1a5d1a89ed','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('39d4d726-de60-40b0-96ab-2ecbfe12339e','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('3d0fbdea-9051-4971-97ab-afcdfb812e18','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('44c1bb20-d47a-49a5-937c-de590b425ad6','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('48016a8f-2db1-43d9-9155-08eb7f6816a6','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('4e6f2ed5-3fd6-4d80-812d-0257a783dc9a','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('551bab76-9745-4b4a-b29e-c5c4f314341b','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('5af39ef9-58ee-4f82-a439-50ab4337ec3d','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('5b5fde94-7b18-41c6-a3ea-a3a0d972d97c','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('5cb68ed2-449b-4eea-a612-1f28c87710e0','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('5ccfcfcb-7feb-4376-9c48-46be08dcaa17','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('7d8ceb43-4a03-4d05-8b87-a3c6b72979de','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('986d7ee3-3356-4546-b5c4-a86d67416736','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('9a78119c-3345-42ca-ac30-63aea9d0b141','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('9e60db59-3420-483b-b1ee-8ed77dc33d92','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('a7cd648f-1011-453c-8621-7704e3b57679','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('b3701d81-226b-473a-b6ef-ec78ef77e3e0','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('b4be4af8-e988-43ea-a468-8f32dd2c1870','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('c235536e-7db3-4006-a544-518b5d462e00','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('d7efc3c1-b94a-4e31-ba86-7739abe5fb24','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('dc3fb727-6754-4443-aaab-f9e41f9ad299','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('e23dd9aa-b933-4fb8-9f1b-72ca02fb2fbd','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('e54e42ba-cc89-4511-bf7a-3dbc4f105cfc','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('ed2cd1f1-4171-4c22-95c1-5f6ca80df49c','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('f3445414-6536-4c94-9eb3-0e7481edd8ea','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('f5da18c4-bf45-46e9-81ab-97de214e7758','a1ec724b-3c3d-4b91-8a7a-6b2296e85f6c'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','ef9c9cd7-2d69-4f8c-8304-74224b5bcb29'),('ea7ac302-0dd8-482d-a3a6-0e6b829dab68','fa29708c-8d31-4435-9ca7-3ea8fcba181c');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('01c49ed9-27c5-4cd8-ba34-964d38455f13','+'),('5bcc9c7f-ba38-4b0e-b26f-0d1c6dba983a','+'),('ba5076fa-3c75-4bab-a578-6ba4c3d99606','*'),('bcd41309-62ab-4c60-b70a-716be700d744','+'),('fc71cc2e-b2cd-4118-b2fc-62880a15c51b','http://localhost:4200');
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

-- Dump completed on 2024-11-14 18:38:37
