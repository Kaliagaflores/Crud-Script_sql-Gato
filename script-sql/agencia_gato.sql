-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para agencia_gato
CREATE DATABASE IF NOT EXISTS `agencia_gato` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agencia_gato`;

-- Volcando estructura para tabla agencia_gato.condicion
CREATE TABLE IF NOT EXISTS `condicion` (
  `idCondicion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idCondicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_gato.condicion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_gato.distrito
CREATE TABLE IF NOT EXISTS `distrito` (
  `idDistrito` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idDistrito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_gato.distrito: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_gato.gerente
CREATE TABLE IF NOT EXISTS `gerente` (
  `idGerente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idGerente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_gato.gerente: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_gato.hospitals
CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `district` varchar(255) NOT NULL,
  `venue` text NOT NULL,
  `manager` varchar(255) NOT NULL,
  `condicion` varchar(50) NOT NULL,
  `registration_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  CONSTRAINT `hospitals_chk_1` CHECK ((`age` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_gato.hospitals: ~0 rows (aproximadamente)
INSERT INTO `hospitals` (`id`, `code`, `name`, `age`, `district`, `venue`, `manager`, `condicion`, `registration_date`, `created_at`, `updated_at`) VALUES
	(1, 'H001', 'DANIEL ALCIDES CARRION', 23, 'YANACANCHA', 'Pasco Chaupimarca', 'Dr. Gabriel Martinelli', 'Normal', '2025-03-18', '2025-03-19 04:28:48', '2025-03-19 04:28:48'),
	(2, 'H002', 'HEMILIO VALDIZAN', 32, 'AMARILLIS', 'HHUANUCO', 'Dr. GENARO SANTILLAN', 'Normal', '2025-03-18', '2025-03-19 04:29:24', '2025-03-19 04:29:24'),
	(3, 'H003', 'ESSALUD HUARIACA', 34, 'HUARIACA', 'HUARIACA PASCO', 'Dr. MARIA LLANOS', 'Normal', '2025-03-18', '2025-03-19 04:31:03', '2025-03-19 04:31:03'),
	(4, 'H004', 'AUXILIADORA LIMA', 12, 'LIMA', 'LIMA LA VICTORIA', 'Dr. MARIO PRADO', 'MODERNO', '2025-03-18', '2025-03-19 04:32:00', '2025-03-19 04:32:00'),
	(5, 'H005', 'MARIA CASTILLA', 34, 'HUANCA', 'HUANCAYO CALLE 4 ESQUINAS', 'Dr. MARTA JUAREZ', 'Normal', '2025-03-18', '2025-03-19 04:32:54', '2025-03-19 04:38:10');

-- Volcando estructura para procedimiento agencia_gato.hospital_actualizar
DELIMITER //
CREATE PROCEDURE `hospital_actualizar`(
    IN p_id INT,
    IN p_code VARCHAR(10),
    IN p_name VARCHAR(255),
    IN p_age INT,
    IN p_district VARCHAR(255),
    IN p_venue TEXT,
    IN p_manager VARCHAR(255),
    IN p_condicion VARCHAR(50),
    IN p_registration_date DATE
)
BEGIN
    UPDATE hospitals 
    SET code = p_code, 
        name = p_name, 
        age = p_age, 
        district = p_district, 
        venue = p_venue, 
        manager = p_manager, 
        condicion = p_condicion, 
        registration_date = p_registration_date
    WHERE id = p_id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento agencia_gato.hospital_eliminar
DELIMITER //
CREATE PROCEDURE `hospital_eliminar`(
    IN p_id INT
)
BEGIN
    DELETE FROM hospitals WHERE id = p_id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento agencia_gato.hospital_listar
DELIMITER //
CREATE PROCEDURE `hospital_listar`()
BEGIN
    SELECT 
        id, 
        code, 
        name, 
        age, 
        district, 
        venue, 
        manager, 
        condicion, 
        registration_date
    FROM hospitals;
END//
DELIMITER ;

-- Volcando estructura para procedimiento agencia_gato.hospital_registrar
DELIMITER //
CREATE PROCEDURE `hospital_registrar`(
    IN p_code VARCHAR(10),
    IN p_name VARCHAR(255),
    IN p_age INT,
    IN p_district VARCHAR(255),
    IN p_venue TEXT,
    IN p_manager VARCHAR(255),
    IN p_condicion VARCHAR(50),
    IN p_registration_date DATE
)
BEGIN
    INSERT INTO hospitals (code, name, age, district, venue, manager, condicion, registration_date) 
    VALUES (p_code, p_name, p_age, p_district, p_venue, p_manager, p_condicion, p_registration_date);
END//
DELIMITER ;

-- Volcando estructura para tabla agencia_gato.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agencia_gato.migrations: ~0 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Volcando estructura para tabla agencia_gato.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla agencia_gato.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_gato.provincia
CREATE TABLE IF NOT EXISTS `provincia` (
  `idProvincia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_gato.provincia: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_gato.sede
CREATE TABLE IF NOT EXISTS `sede` (
  `idSede` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `idDistrito` int DEFAULT NULL,
  PRIMARY KEY (`idSede`),
  KEY `idDistrito` (`idDistrito`),
  CONSTRAINT `sede_ibfk_1` FOREIGN KEY (`idDistrito`) REFERENCES `distrito` (`idDistrito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_gato.sede: ~0 rows (aproximadamente)

-- Volcando estructura para tabla agencia_gato.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla agencia_gato.users: ~1 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
	(1, 'Kenelin', 'kenelinaliaga@gmail.com', '$2y$12$5VLaxjQ1lFfC7ZjigaJXvuX4/sGWgO5L/B6mBT6lnW3eUhTYrwk2S', '2025-03-19 09:27:06', '2025-03-19 09:27:06');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
