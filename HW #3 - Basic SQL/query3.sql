-- Given the bsg_planets table created by using the following definition query :
--
-- CREATE TABLE `bsg_planets` (
-- `id` int(11) NOT NULL AUTO_INCREMENT,
-- `name` varchar(255) NOT NULL,
-- `population` bigint(20) DEFAULT NULL,
-- `language` varchar(255) DEFAULT NULL,
-- `capital` varchar(255) DEFAULT NULL,
-- PRIMARY KEY (`id`),
-- UNIQUE KEY `name` (`name`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1
--
-- Find the name and population of the planets with a population larger than
-- 2,600,000,000 - 10 points
-- Write your query BELOW this line.

SELECT  name, population
FROM    bsg_planets
WHERE   population > 2600000000;