CREATE DATABASE IF NOT EXISTS agencia_gato;
USE agencia_gato;

CREATE TABLE gerente (
    idGerente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE condicion (
    idCondicion INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE distrito (
    idDistrito INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE provincia (
    idProvincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE sede (
    idSede INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    idDistrito INT,
    FOREIGN KEY (idDistrito) REFERENCES distrito(idDistrito)
);

CREATE TABLE hospitals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age >= 1),
    district VARCHAR(255) NOT NULL,
    venue TEXT NOT NULL,
    manager VARCHAR(255) NOT NULL,
    condicion VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

