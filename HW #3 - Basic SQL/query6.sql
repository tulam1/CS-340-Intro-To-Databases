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
-- Update age of all those people whose last name is 'Adama' and first name is
-- 'William' to 62 and then print all rows with all the columns which match the
-- same criteria, in a separate query. 

UPDATE  bsg_people
SET     age = 62
WHERE   lname = 'Adama' AND fname = 'William';

SELECT  *
FROM    bsg_people
WHERE   age = 62;