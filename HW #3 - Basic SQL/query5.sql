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
-- Insert information about the planet Mars which has a population of 2,
-- language as "Binary" and "Olympus Mons" as Capital, in bsg_planets. Then
-- list the row(s), with all the information for that planet. - 12 points

-- Write your query BELOW this line.

INSERT INTO  bsg_planets (name, population, language, capital)
VALUE        ('Mars',2,'Binary','Olympus Mons');

SELECT       *
FROM         bsg_planets
WHERE        name = 'Mars';
