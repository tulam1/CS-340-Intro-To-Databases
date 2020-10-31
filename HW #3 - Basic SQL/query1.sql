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
-- Write a SQL query to find the population of the planet named 'Caprica' -- 10 points
-- Write your query BELOW this line.

SELECT  population
FROM    bsg_planets
WHERE   name = 'Caprica';
