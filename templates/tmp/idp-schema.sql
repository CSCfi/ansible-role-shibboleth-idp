# DROP DATABASE IF EXISTS `idp`;
CREATE DATABASE IF NOT EXISTS `idp`;

USE idp;

# DROP TABLE IF EXISTS `StorageRecords`;
CREATE TABLE IF NOT EXISTS `StorageRecords` (
	 `context` varchar(255) NOT NULL,
	 `id` varchar(255) NOT NULL,
	 `expires` bigint(20) DEFAULT NULL,
	 `value` longtext NOT NULL,
	 `version` bigint(20) NOT NULL,
	 PRIMARY KEY (`context`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# DROP TABLE IF EXISTS `shibpid`;
CREATE TABLE IF NOT EXISTS `shibpid` (
	    localEntity VARCHAR(255) NOT NULL,
	    peerEntity VARCHAR(255) NOT NULL,
	    persistentId VARCHAR(50) NOT NULL,
	    principalName VARCHAR(50) NOT NULL,
	    localId VARCHAR(50) NOT NULL,
	    peerProvidedId VARCHAR(50) NULL,
	    creationDate TIMESTAMP NOT NULL,
	    deactivationDate TIMESTAMP NULL,
	    PRIMARY KEY (localEntity, peerEntity, persistentId)
);

# DROP TABLE IF EXISTS `tb_st`;
CREATE TABLE IF NOT EXISTS tb_st (
	    uid VARCHAR(100) NOT NULL,
	    sharedToken VARCHAR(50),
	    PRIMARY KEY (uid)
);

GRANT ALL ON idp.* TO '{{ shibbolethidp_dbuser }}'@'localhost' IDENTIFIED BY '{{ shibbolethidp_dbpassword }}';
FLUSH PRIVILEGES;
