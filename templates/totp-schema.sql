CREATE DATABASE IF NOT EXISTS `{{ shibbolethidp_dbname }}` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `{{ shibbolethidp_dbname }}`;

--
-- Table structure for table `ga`
--
/* DROP TABLE IF EXISTS `ga`; */
CREATE TABLE IF NOT EXISTS `ga` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(1024) NOT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `target` varchar(4096) DEFAULT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`(255))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

GRANT ALL ON {{ shibbolethidp_dbname }}.* TO '{{ shibbolethidp_dbuser }}'@'{{ shibbolethidp_fqdn }}' IDENTIFIED BY '{{ shibbolethidp_dbpassword }}';
GRANT ALL ON {{ shibbolethidp_dbname }}.* TO '{{ shibbolethidp_dbuser }}'@'localhost' IDENTIFIED BY '{{ shibbolethidp_dbpassword }}';
FLUSH PRIVILEGES;
