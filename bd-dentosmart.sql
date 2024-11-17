USE dentosmart_bd;

CREATE TABLE dentosmart_bd.materiales_dentales (
	id_materiales_dentales INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100),
    precio DECIMAL (10,2),
    unidad_medida VARCHAR (200),
    fecha_vencimiento DATE,
    stock INT
);

CREATE TABLE dentosmart_bd.proveedores (
	id_proveedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100),
    email VARCHAR (200) UNIQUE,
    persona_encargada VARCHAR (200)
);

CREATE TABLE dentosmart_bd.paciente (
	id_paciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100),
    distrito VARCHAR (200),
    numero_telefono INT,
    documento_identidad INT,
    edad INT
);

CREATE TABLE dentosmart_bd.dentista (
	id_dentista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100),
	numero_telefono INT
);

CREATE TABLE dentosmart_bd.citas_agendadas (
	id_citas_agendadas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_dentista INT,
    tipo_pago ENUM ("yape", "plin", "efectivo", "transferencia"),
    fecha_cita VARCHAR(200),
    hora_cita VARCHAR(200)
);

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


