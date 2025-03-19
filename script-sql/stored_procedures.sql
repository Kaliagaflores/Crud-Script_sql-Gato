DELIMITER $$

CREATE PROCEDURE hospital_registrar(
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
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE hospital_actualizar(
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
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE hospital_eliminar(
    IN p_id INT
)
BEGIN
    DELETE FROM hospitals WHERE id = p_id;
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE hospital_listar()
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
END$$

DELIMITER ;

