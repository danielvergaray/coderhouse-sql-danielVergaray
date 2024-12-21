DROP DATABASE IF EXISTS dentosmart_bd;
CREATE DATABASE dentosmart_bd;
USE dentosmart_bd;

CREATE TABLE dentosmart_bd.materiales_dentales (
	id_materiales_dentales INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100),
    precio DECIMAL (10,2),
    unidad_medida VARCHAR (200),
    fecha_vencimiento DATE,
    stock INT
);


INSERT INTO dentosmart_bd.materiales_dentales (nombre, precio, unidad_medida, fecha_vencimiento, stock) 
VALUES
('Guantes de látex', 25.50, 'caja de 100 unidades', '2025-12-15', 50),
('Algodón dental', 10.75, 'bolsa de 500 gramos', '2024-11-30', 200),
('Resina compuesta', 80.00, 'jeringa de 4 gramos', '2025-08-20', 30),
('Anestésico local', 120.00, 'frasco de 10 ml', '2024-05-10', 15),
('Hilo dental', 15.90, 'caja de 50 unidades', '2026-01-25', 100);






CREATE TABLE dentosmart_bd.proveedores (
	id_proveedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100),
    email VARCHAR (200) UNIQUE,
    persona_encargada VARCHAR (200)
);

INSERT INTO dentosmart_bd.proveedores (nombre, email, persona_encargada) 
VALUES
('DentalCare Supplies', 'contacto@dentalcare.com', 'María Torres'),
('BioDental Inc.', 'ventas@biodental.com', 'Andrés Martínez'),
('OdontoPlus S.A.', 'soporte@odontoplus.com', 'Laura Pérez'),
('DentalMaster', 'info@dentalmaster.com', 'Roberto Sánchez'),
('MediDent Solutions', 'clientes@medidentsol.com', 'Elena Fernández'),
('ProOdont Health', 'ventas@proodont.com', 'Jorge Vega'),
('WhiteSmile Distributors', 'consultas@whitesmile.com', 'Paola Herrera');

CREATE TABLE dentosmart_bd.paciente (
	id_paciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100),
    distrito VARCHAR (200),
    numero_telefono INT,
    documento_identidad INT,
    edad INT
);

INSERT INTO dentosmart_bd.paciente (nombre, distrito, numero_telefono, documento_identidad, edad) 
VALUES 
('Carlos Pérez', 'Miraflores', '987654321', 12345678, 34),
('María López', 'San Isidro', '945678901', 23456789, 29),
('Ana Rodríguez', 'Surco', '956789012', 34567890, 42),
('Luis González', 'Barranco', '967890123', 45678901, 37),
('Jorge Vega', 'Pueblo Libre', '978901234', 56789012, 50),
('Sofía Ramos', 'La Molina', '989012345', 67890123, 25),
('Diego Castro', 'Magdalena', '990123456', 78901234, 31),
('Elena Herrera', 'Jesús María', '991234567', 89012345, 40);

INSERT INTO dentosmart_bd.paciente (nombre, distrito, numero_telefono, documento_identidad, edad) 
VALUES 
('Paola Fernández', 'Miraflores', '992345678', 90123456, 28),
('Andrés Salas', 'San Isidro', '993456789', 12345098, 45),
('Lucía Mendoza', 'Surco', '994567890', 23456087, 36),
('Mario Alvarado', 'Barranco', '995678901', 34567076, 39),
('Gabriela Vargas', 'Miraflores', '996789012', 45678065, 33),
('Sebastián Cruz', 'Jesús María', '997890123', 56789054, 52);


CREATE TABLE dentosmart_bd.dentista (
	id_dentista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100),
	numero_telefono INT
);

ALTER TABLE dentosmart_bd.dentista ADD COLUMN sexo VARCHAR(100);


DELIMITER //
INSERT INTO dentista (id_dentista, nombre, numero_telefono, sexo)
VALUES
(1, 'MONICA VERGARAY', '123456789', 'femenino'),
(2, 'LUIS VERGARAY', '987654321', 'masculino');

INSERT INTO dentista (sexo)
VALUES
('femenino'),
('masculino');


CREATE TABLE dentosmart_bd.citas_agendadas (
	id_citas_agendadas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_dentista INT,
    tipo_pago ENUM ("yape", "plin", "efectivo", "transferencia"),
    fecha_cita VARCHAR(200),
    hora_cita VARCHAR(200)
);


INSERT INTO dentosmart_bd.citas_agendadas (id_paciente, id_dentista, tipo_pago, fecha_cita, hora_cita) 
VALUES 
(1, 1, 'efectivo', '2024-12-22', '10:00'),
(2, 2, 'yape', '2024-12-22', '11:30'),
(3, 1, 'plin', '2024-12-22', '12:30'),
(4, 2, 'transferencia', '2024-12-23', '09:00'),
(5, 1, 'efectivo', '2024-12-23', '10:30'),
(6, 2, 'yape', '2024-12-23', '11:00'),
(7, 1, 'plin', '2024-12-24', '08:00'),
(8, 2, 'transferencia', '2024-12-24', '09:30'),
(9, 1, 'efectivo', '2024-12-24', '10:00'),
(10, 2, 'yape', '2024-12-24', '12:00');




ALTER table
	dentosmart_bd.citas_agendadas
    ADD CONSTRAINT fk_citas_agendadas_paciente
    FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);
    
    ALTER table
	dentosmart_bd.citas_agendadas
    ADD CONSTRAINT fk_citas_agendadas_dentista
    FOREIGN KEY (id_dentista) REFERENCES dentista (id_dentista);

CREATE TABLE dentosmart_bd.proveedores_materiales_dentales (
	id_proveedores_materiales_dentales INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_materiales_dentales INT,
    id_proveedores INT,
    fecha_compra DATE
);

ALTER table
	dentosmart_bd.proveedores_materiales_dentales
    ADD CONSTRAINT fk_proveedores_materiales_dentales_materiales_dentales
    FOREIGN KEY (id_materiales_dentales) REFERENCES materiales_dentales (id_materiales_dentales);
    
    
ALTER table
	dentosmart_bd.proveedores_materiales_dentales
    ADD CONSTRAINT fk_proveedores_materiales_dentales_proveedores
    FOREIGN KEY (id_proveedores) REFERENCES proveedores (id_proveedores);
    

CREATE TABLE dentosmart_bd.materiales_dentales_citas_agendadas (
	id_materiales_dentales_citas_agendadas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_materiales_dentales INT,
    id_citas_agendadas INT,
    materiales_usados VARCHAR (200)
);

ALTER table
	dentosmart_bd.materiales_dentales_citas_agendadas
    ADD CONSTRAINT fk_materiales_dentales_citas_agendadas_materiales_dentales
    FOREIGN KEY (id_materiales_dentales) REFERENCES materiales_dentales (id_materiales_dentales);

ALTER table
	dentosmart_bd.materiales_dentales_citas_agendadas
    ADD CONSTRAINT fk_materiales_dentales_citas_agendadas_citas_agendadas
    FOREIGN KEY (id_citas_agendadas) REFERENCES citas_agendadas (id_citas_agendadas);
    
    
    


USE dentosmart_bd;




DELETE FROM dentosmart_bd.dentista
where id_dentista = 8;

SELECT * FROM dentosmart_bd.materiales_dentales;
SELECT * FROM dentosmart_bd.dentista;
SELECT * FROM dentosmart_bd.paciente;





-- FUNCIONES

DELIMITER //

CREATE FUNCTION obtener_dentista_por_sexo(sexo_param VARCHAR(10))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(255);

    SET resultado = CASE
        WHEN sexo_param = 'femenino' THEN 
            (SELECT nombre FROM dentista WHERE sexo = 'femenino' LIMIT 1)
        WHEN sexo_param = 'masculino' THEN 
            (SELECT nombre FROM dentista WHERE sexo = 'masculino' LIMIT 1)
        ELSE 
            'Sexo no válido'
    END;

    RETURN resultado;
END;
//

DELIMITER ;


DELIMITER //

CREATE FUNCTION buscar_proveedor_por_encargado(encargado_param VARCHAR(200))
RETURNS VARCHAR(400)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(400);

    SELECT CONCAT('Proveedor: ', nombre, ', Email: ', email)
    INTO resultado
    FROM dentosmart_bd.proveedores
    WHERE persona_encargada = encargado_param;

    IF resultado IS NULL THEN
        RETURN 'No se encontró ningún proveedor para la persona encargada proporcionada.';
    END IF;

    RETURN resultado;
END;
//

DELIMITER ;











SELECT obtener_dentista_por_sexo('femenino');

SELECT buscar_proveedor_por_encargado('María Torres');



-- STORED PROCEDURES

DELIMITER //

CREATE PROCEDURE obtener_materiales_bajo_stock()
BEGIN
    SELECT 
        nombre AS NombreMaterial, 
        precio AS Precio, 
        unidad_medida AS Unidad, 
        fecha_vencimiento AS FechaVencimiento, 
        stock AS Stock 
    FROM dentosmart_bd.materiales_dentales
    WHERE stock < 50
    ORDER BY stock DESC;
END;
//

DELIMITER ;

-- agrupa pacientes por distritos

DELIMITER //

CREATE PROCEDURE agrupar_pacientes_por_distrito()
BEGIN
    SELECT 
        distrito, 
        COUNT(*) AS cantidad_pacientes
    FROM 
        dentosmart_bd.paciente
    GROUP BY 
        distrito
    ORDER BY 
        cantidad_pacientes DESC;
END;
//

DELIMITER ;







CALL obtener_materiales_bajo_stock();

CALL agrupar_pacientes_por_distrito();


-- TRIGGERS

DELIMITER //

CREATE TRIGGER verificar_fecha_hora BEFORE INSERT ON dentosmart_bd.citas_agendadas
FOR EACH ROW
BEGIN
    IF STR_TO_DATE(NEW.fecha_cita, '%Y-%m-%d') < CURDATE() OR (STR_TO_DATE(NEW.fecha_cita, '%Y-%m-%d') = CURDATE() AND STR_TO_DATE(NEW.hora_cita, '%H:%i') < CURTIME()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede agendar una cita en el pasado.';
    END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER actualizar_dentista AFTER UPDATE ON dentosmart_bd.citas_agendadas
FOR EACH ROW
BEGIN
    DECLARE nuevo_nombre_dentista VARCHAR(200);

    -- Obtener el nuevo nombre del dentista
    SELECT nombre INTO nuevo_nombre_dentista 
    FROM dentosmart_bd.dentista
    WHERE id_dentista = NEW.id_dentista;
    
END;
//

DELIMITER ;


-- VISTAS

CREATE VIEW vista_resumen_citas AS
SELECT 
    p.nombre AS paciente_nombre,
    p.distrito AS paciente_distrito,
    d.nombre AS dentista_nombre,
    c.fecha_cita,
    c.hora_cita,
    c.tipo_pago
FROM 
    dentosmart_bd.citas_agendadas c
JOIN 
    dentosmart_bd.paciente p ON c.id_paciente = p.id_paciente
JOIN 
    dentosmart_bd.dentista d ON c.id_dentista = d.id_dentista
ORDER BY 
    c.fecha_cita, c.hora_cita;


CREATE VIEW vista_materiales_y_proveedores AS
SELECT 
    m.nombre AS material_nombre,
    m.precio,
    m.unidad_medida,
    m.stock,
    m.fecha_vencimiento,
    p.nombre AS proveedor_nombre,
    p.email AS proveedor_email,
    p.persona_encargada AS proveedor_persona_encargada
FROM 
    dentosmart_bd.materiales_dentales m
JOIN 
    dentosmart_bd.proveedores p ON m.id_materiales_dentales = p.id_proveedores
WHERE 
    m.stock < 50
ORDER BY 
    m.stock DESC;


SELECT * FROM vista_resumen_citas;

SELECT * FROM vista_materiales_y_proveedores;