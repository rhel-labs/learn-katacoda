DROP DATABASE IF EXISTS `sampleDB`;

CREATE DATABASE sampleDB;

USE sampleDB;

CREATE TABLE `t1` (
`id` int(11) NOT NULL AUTO_INCREMENT ,
`c1` int(11) NOT NULL DEFAULT '0',
`c2` int(11) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`),
KEY `idx_c1` (`c1`)
) ENGINE=InnoDB;

CREATE TABLE `t2` (
`id` int(11) NOT NULL AUTO_INCREMENT ,
`c1` int(11) NOT NULL DEFAULT '0',
`c2` int(11) NOT NULL DEFAULT '0',
PRIMARY KEY (`id`),
KEY `idx_c1` (`c1`)
) ENGINE=InnoDB;

DELIMITER $$
CREATE PROCEDURE generate_data_t1()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 50000 DO
    INSERT INTO `t1` (`c1`,`c2`) VALUES (
      ROUND(RAND()*100,2),
      ROUND(RAND()*100,2)
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE generate_data_t2()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 1000 DO
    INSERT INTO `t2` (`c1`,`c2`) VALUES (
      ROUND(RAND()*100,2),
      ROUND(RAND()*100,2)
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

CALL generate_data_t1();
CALL generate_data_t2();
