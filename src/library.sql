-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `books`
--
UNLOCK TABLES;
CREATE DATABASE IF NOT EXISTS library;
USE library;

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `year` int NOT NULL,
  `quantity` INT not null,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES 
(1,'The Hitchhikers Guide to the Galaxy','Douglas Adams',1979,1),
(2,'The Lord of the Rings','J.R.R. Tolkien',1954,1),
(3,'The Hobbit','J.R.R. Tolkien',1937,1),
(4,'Pride and Prejudice','Jane Austen',1813,1),
(5,'To Kill a Mockingbird','Harper Lee',1960,1),
(6,'1984','George Orwell',1949,1),
(7,'Animal Farm','George Orwell',1945,1),
(8,'The Catcher in the Rye','J.D. Salinger',1951,1),
(9,'The Stranger','Albert Camus',1942,1),
(10,'The Metamorphosis','Franz Kafka',1915,1),
(11,'Lolita','Vladimir Nabokov',1955,1),
(12,'The Canterbury Tales','Geoffrey Chaucer',1387,1),
(13,'Don Quixote','Miguel de Cervantes',1605,1),
(14,'The Odyssey','Homer',100,1),
(15,'The Iliad','Homer',115,1),
(16,'The Great Gatsby','F. Scott Fitzgerald',1925,1),
(17,'One Hundred Years of Solitude','Gabriel García Márquez',1967,1),
(18,'Invisible Man','Ralph Ellison',1952,1),
(19,'Mrs. Dalloway','Virginia Woolf',1925,1),
(20,'Hamlet','William Shakespeare',1603,1),
(21,'The Adventures of Sherlock Holmes','Arthur Conan Doyle',1892,1),
(22,'Brave New World','Aldous Huxley',1932,1),
(23,'Lord of the Flies','William Golding',1954,1),
(24,'Heart of Darkness','Joseph Conrad',1902,1),
(25,'The Picture of Dorian Gray','Oscar Wilde',1891,1),
(26,'Ulysses','James Joyce',1922,1),
(27,'The Sound and the Fury','William Faulkner',1929,1),
(28,'As I Lay Dying','William Faulkner',1939,1),
(29,'Absalom, Absalom!','William Faulkner',1936,1),
(30,'The Sun Also Rises','Ernest Hemingway',1926,1),
(31,'A Farewell to Arms','Ernest Hemingway',1929,1),
(32,'For Whom the Bell Tolls','Ernest Hemingway',1940,1),
(33,'The Grapes of Wrath','John Steinbeck',1939,1),
(34,'Of Mice and Men','John Steinbeck',1937,1),
(35,'East of Eden','John Steinbeck',1955,1),
(36,'The Silmarillion','J.R.R. Tolkien',1977,1),
(37,'The House in the Cerulean Sea','T.J. Klune',2020,1),
(38,'Circe','Madeline Miller',2018,1),
(39,'The Song of Achilles','Madeline Miller',2012,1),
(40,'Hamnet','Maggie OFarrell',2020,1),
(41,'The Testaments','Margaret Atwood',2019,1),
(42,'The Handmaids Tale','Margaret Atwood',1985,1),
(43,'Klara and the Sun','Kazuo Ishiguro',2021,1),
(44,'The Remains of the Day','Kazuo Ishiguro',1989,1),
(45,'Never Let Me Go','Kazuo Ishiguro',2005,1),
(46,'The Lincoln Highway','Amor Towles',2021,1),
(47,'Leave the World Behind','Rumaan Alam',2020,1),
(48,'The Nickel Boys','Colson Whitehead',2019,1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed_books`
--

DROP TABLE IF EXISTS `borrowed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed_books` (
  `borrow_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `borrowed_date` date NOT NULL,
  `returned_date` date DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrowed_books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `borrowed_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed_books`
--

LOCK TABLES `borrowed_books` WRITE;
/*!40000 ALTER TABLE `borrowed_books` DISABLE KEYS */;
INSERT INTO `borrowed_books` VALUES (1,15,18,'2024-07-18','2024-07-25'),(2,5,18,'2024-07-17','2024-07-25'),(3,5,3,'2024-07-17','2024-07-25'),(4,8,19,'2024-07-17','2024-07-25'),(5,9,22,'2024-07-17','2024-07-31');
/*!40000 ALTER TABLE `borrowed_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Olivia Jones','olivia.jones@hotmail.com','321-098-7654','2425 Spruce St, Neverland, OR 97234'),(2,'William Lee','william.lee@library.org',NULL,'2627 Birch St, Narnia, CO 80201'),(3,'Jessica Davis','jessica.davis@gmail.com','654-321-0987','2829 Cedar St, Wonderland, WA 98007'),(4,'Ryan Hernandez','ryan.hernandez@yahoo.com','987-123-4560','3031 Willow St, Oz, KS 67560'),(5,'Sophia Garcia','sophia.garcia@outlook.com',NULL,'3233 Maple St, Middle-earth, AL 35401'),(6,'Matthew Miller','matthew.miller@gmail.com','210-987-6543','3435 Oak St, Camelot, GA 30301'),(7,'Elizabeth Brown','elizabeth.brown@hotmail.com','432-109-8765','3637 Pine St, Eldorado, FL 33139'),(8,'Daniel Johnson','daniel.johnson@library.org',NULL,'3839 Elm St, Asgard, TX 78654'),(9,'Isabella Garcia','isabella.garcia@yahoo.com','654-789-0123','4041 Spruce St, Atlantis, CA 90291'),(10,'Benjamin Thomas','benjamin.thomas@gmail.com','987-456-1230','4243 Birch St, Xanadu, NY 10003'),(11,'Alice White',NULL,'555-123-4567','789 Oak St, Sometown, TX 34567'),(12,'Bob Garcia','bob.garcia@library.com','987-654-3210','1011 Maple St, Yetanothertown, FL 89012'),(13,'Emily Johnson','emily.johnson@gmail.com',NULL,'1213 Pine St, Bigtown, PA 17654'),(14,'David Miller','david.miller@yahoo.com','456-789-0123','1415 Elm St, Megalopolis, IL 60606'),(15,'Sarah Thomas','sarah.thomas123@hotmail.com','234-567-8901','1617 Oak St, Metropolis, CA 94107'),(16,'Michael Brown','michael.brown@library.org',NULL,'1819 Maple St, Cosmopolis, NY 10001'),(17,'Ashley Hernandez','ashley.hernandez@outlook.com','789-012-3456','2021 Pine St, Utopia, TX 78765'),(18,'Christopher Taylor','christopher.taylor@gmail.com','567-890-1234','2223 Elm St, Shangri-La, CA 90210');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-17 15:16:40
