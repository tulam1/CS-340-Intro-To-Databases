-- Given the bsg_people table created by using the following definition query :
--
-- CREATE TABLE `bsg_people` (
--  `id` int(11) NOT NULL AUTO_INCREMENT,
--  `fname` varchar(255) NOT NULL,
--  `lname` varchar(255) DEFAULT NULL,
--  `homeworld` int(11) DEFAULT NULL,
--  `age` int(11) DEFAULT NULL,
--  PRIMARY KEY (`id`),
--  KEY `homeworld` (`homeworld`),
--  CONSTRAINT `bsg_people_ibfk_1` FOREIGN KEY (`homeworld`) REFERENCES `bsg_planets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
-- ) ENGINE=InnoDB
--
-- Delete all people whose age is NULL.  
-- Then, list all such people whose age is NOT NULL.

DELETE FROM  bsg_people
WHERE        age IS NULL;

SELECT       *
FROM         bsg_people
WHERE        age IS NOT NULL;
 

