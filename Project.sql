UNLOCK TABLES;
DROP DATABASE IF EXISTS project;

CREATE DATABASE project CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE project;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `manager`
--
#管理員資料表
DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_ID` 		int NOT NULL AUTO_INCREMENT, 						  #管理員ID
  `chinese_name` 	varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #管理員姓名
  `phone` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #管理員電話
  `email` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #管理員信箱
  `m_account` 		varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #管理員帳號
  `m_password` 		varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #管理員密碼
  PRIMARY KEY (`manager_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` VALUES (1, '蔡皓羽', '0987654321', 'caihaoyu@gmail.com', 'CHY', 'chy');
INSERT INTO `manager` VALUES (2, '吳郁儒', '0912345678', 'wuyuru@gmail.com', 'WYR', 'wyr');
INSERT INTO `manager` VALUES (3, '王韻禎', '0946781325', 'wangyunzhen@gmail.com', 'WYZ', 'wyz');
INSERT INTO `manager` VALUES (4, '李函諭', '0985274163', 'lihanyuail.com', 'LHY', 'lhy');

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

#會員資料表
--
-- Table structure for table `member`
--
DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_ID` 			int NOT NULL AUTO_INCREMENT, 						  #會員編號/志工/提供者/認證者
  `unit_name` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #單位名稱
  `chinese_name` 		varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #會員姓名
  `phone` 				varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #會員電話
  `email` 				varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #會員信箱
  `m_account` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #會員帳號
  `m_password` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #會員密碼
  `member_class` 		varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員類別
  `english_name` 		varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #會員英文姓名
  `ID` 					varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #身分證字號
  `student_ID` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #學生學號
  `pictuers` 			varbinary(8000) DEFAULT NULL,  						  #大頭貼
  `handbook` 			varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #是否有志工手冊
  `account_status` 		varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #帳號開通狀態
  `registration_date`   datetime DEFAULT CURRENT_TIMESTAMP, 				  #註冊日期
  PRIMARY KEY (`member_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'課外活動指導組','課指組負責人','0963852741','kezhizu@gmail.com','KZZ','kzz','時數認證者',NULL,NULL,NULL,NULL,NULL,'Y',NOW());
INSERT INTO `member` VALUES (2,'中原大學行政單位','行政負責人','0914725836','xingzheng@yahoo.com','XZDW','xzdw','時數認證者',NULL,NULL,NULL,NULL,NULL,'Y',NOW());
INSERT INTO `member` VALUES (3,'校外非營利組織','非營利組織負責人','0978456123','feiyingli@kimo.com','FYLZZ','fylzz','時數認證者',NULL,NULL,NULL,NULL,NULL,'Y',NOW());
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--
#志工時數申請資料表&服務紀錄總表
#時數認證者核准紀錄&服務提供者核准紀錄
DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `application_ID` 		int NOT NULL AUTO_INCREMENT,							#申請編號
  `member_ID` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員編號/志工
  `sing_up_ID` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #報名編號
  `service_ID` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #服務編號
  `chinese_name` 		 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #志工姓名
  `ID` 					 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #身分證字號
  `unit_name` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #單位名稱
  `service_name` 		 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #服務名稱
  `service_class` 		 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #服務類別
  `service_date` 		 date DEFAULT NULL,										#服務日期
  `service_sdate` 		 date DEFAULT NULL,										#服務開始日期
  `service_edate` 		 date DEFAULT NULL,										#服務結束日期
  `service_time1` 		 time DEFAULT NULL,										#服務開始時間
  `service_time2` 		 time DEFAULT NULL,										#服務結束時間
  `hours` 				 float(4,1) DEFAULT NULL,	#服務時數
  `service_content` 	 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#服務內容
  `time_description` 	 varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#說明為何時數填寫不同
  `audit_status` 		 varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,   #服務提供者審核狀態
  `certification_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,   #時數認證者認證狀態
  `Rejection` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #拒絕原因 
  `apply_date` 			 datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `certification_ID` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員編號/認證者
  `s_member_ID` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員編號/提供者
  PRIMARY KEY (`application_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;


#服務總表
--
-- Table structure for table `service`
--
DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_ID` 			 int NOT NULL AUTO_INCREMENT,							#服務編號
  `unit_name` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #單位名稱
  `phone`     			 varchar(255)  DEFAULT NULL, 							#連絡電話
  `service_content` 	 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#服務內容
  `service_name` 		 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #服務名稱
  `service_class` 		 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #服務類別
  `service_sdate` 		 date DEFAULT NULL,										#服務開始日期
  `service_edate` 		 date DEFAULT NULL,										#服務結束日期
  `up_date` 			 datetime DEFAULT CURRENT_TIMESTAMP, 					#輸入資料時的當前日期
  `service_date` 		 date DEFAULT NULL,										#服務日期
  `service_time1` 		 time DEFAULT NULL,										#服務開始時間
  `service_time2` 		 time DEFAULT NULL,										#服務結束時間
  `people_number` 		 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #服務需求人數
  `success_people` 		 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #服務報名成功人數(報名確定有成功der志工)
  `address` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #活動地址
  `volunteers_condition` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL, #志工條件
  `member_ID` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員編號/提供者
  `certification_ID` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員編號/認證者

  PRIMARY KEY (`service_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

#系統公告資料表
--
-- Table structure for table `system_note`
--
DROP TABLE IF EXISTS `system_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_note` (
  `system_ID` 		int NOT NULL AUTO_INCREMENT,							#公告編號
  `system_content`  varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#公告內容
  `system_date` 	date DEFAULT NULL,										#公告日期
  PRIMARY KEY (`system_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_note`
--

LOCK TABLES `system_note` WRITE;
/*!40000 ALTER TABLE `system_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_note` ENABLE KEYS */;
UNLOCK TABLES;

#近期訓練公告
--
-- Table structure for table `training_data`
--
DROP TABLE IF EXISTS `training_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_data` (
  `training_ID` int NOT NULL AUTO_INCREMENT,
  `training_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `training_more` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`training_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_data`
--

LOCK TABLES `training_data` WRITE;
/*!40000 ALTER TABLE `training_data` DISABLE KEYS */;
INSERT INTO `training_data` VALUES (1,'教育訓練','社福類特殊訓練報名','2022-06-18','https://cv101.gov.taipei/Announcement/index.aspx?NID=1510'),(2,'教育訓練','志願服務基礎訓練','2022-06-15','https://cv101.gov.taipei/Announcement/index.aspx?NID=1479'),(3,'活動資訊','臺北市111年銀髮志工天使代言徵選活動','2022-05-04','https://cv101.gov.taipei/Announcement/index.aspx?NID=1577'),(4,'教育訓練','【特殊訓練】111年10月22日(六)社福類特殊訓練報名','2022-09-27','https://cv101.gov.taipei/Announcement/index.aspx?NID=1510'),(5,'教育訓練','人生樂章-心理健康主題系列','2022-10-07','https://cv101.gov.taipei/Announcement/index.aspx?NID=1933'),(6,'教育訓練','「疫情之下，建立心關係」─111年志工在職訓練','2022-09-30','https://cv101.gov.taipei/Announcement/index.aspx?NID=1928');
/*!40000 ALTER TABLE `training_data` ENABLE KEYS */;
UNLOCK TABLES;

#志工手冊資料表
--
-- Table structure for table `volunteer_book`
--
DROP TABLE IF EXISTS `volunteer_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer_book` (
  `ID`			 int NOT NULL,											#身分證字號
  `chinese_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員名稱
  `english_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員英文名稱
  `phone`		 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員電話
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer_book`
--

LOCK TABLES `volunteer_book` WRITE;
/*!40000 ALTER TABLE `volunteer_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteer_book` ENABLE KEYS */;
UNLOCK TABLES;

#服務提供者的志工報名資料表
--
-- Table structure for table `sing_up`
--
DROP TABLE IF EXISTS `sing_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sing_up` (
  `sing_up_ID` 			int NOT NULL AUTO_INCREMENT,							#報名編號
  `member_ID` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#會員編號
  `service_ID` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#服務編號
  `service_name` 		varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#服務名稱
  `unit_name` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#單位名稱
  `service_class` 		varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#服務類別
  `service_content` 	varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#服務內容
  `service_date` 		date DEFAULT NULL,										#服務日期
  `service_sdate` 		date DEFAULT NULL,										#服務開始日期
  `service_edate` 		date DEFAULT NULL,										#服務結束日期
  `chinese_name` 		varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,   #會員名稱
  `student_ID` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,   #學生學號
  `ID` 					varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,   #身分證字號
  `phone` 				varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#會員電話
  `service_time1` 		time DEFAULT NULL,										#服務開始時間
  `service_time2` 		time DEFAULT NULL,										#服務開始時間
  `Rejection` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#拒絕原因
  `sing_up_status` 		varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#報名狀態
  `s_member_ID` 			varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,	#會員編號/提供者
  `certification_ID` 			 varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,  #會員編號/認證者
  PRIMARY KEY (`sing_up_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sing_up`
--

LOCK TABLES `sing_up` WRITE;
/*!40000 ALTER TABLE `sing_up` DISABLE KEYS */;
INSERT INTO `sing_up` VALUES (1,'1','1','資料及文書處理志工','新北市新莊區衛生所','醫療衛生/資訊服務/健康與福祉','資料鍵入及文書處理','2022-05-26','2022-05-26','2022-05-27','方之涵','10844166','E223011021','0958366966','14:00:00','17:00:00',NULL,'報名成功'),(2,'1','1','資料及文書處理志工','新北市新莊區衛生所','醫療衛生/資訊服務/健康與福祉','資料鍵入及文書處理','2022-05-27','2022-05-26','2022-05-27','方之涵','10844166','E223011021','0958366966','14:00:00','17:00:00',NULL,'報名成功'),(3,'1','2','奏會來淨灘','黑潮海洋文教基金會','環境保護/保護及維護海洋資源','淨灘','2022-05-28','2022-05-27','2022-05-28','方之涵','10844166','E223011021','0958366966','13:00:00','15:00:00','','報名失敗');
/*!40000 ALTER TABLE `sing_up` ENABLE KEYS */;
UNLOCK TABLES;


#瀏覽人數
--
-- Table structure for table `counter`
--
DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE counter(
  count                 int NOT NULL, #計數
  PRIMARY KEY (count)
)ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `counter` VALUES (6054);

--
-- Dumping data for table `counter`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



















