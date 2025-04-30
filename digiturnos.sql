CREATE DATABASE digiturnos;
USE digiturnos;
CREATE TABLE Administradores (
    id_admin INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_creacion DATETIME DEFAULT GETDATE(),
    activo BIT DEFAULT 1
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    documento VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20),
    fecha_registro DATETIME DEFAULT GETDATE()
);

CREATE TABLE EstadosTurno (
    id_estado INT PRIMARY KEY IDENTITY(1,1),
    nombre_estado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS turnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    atencion VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado VARCHAR(20) DEFAULT 'Pendiente'
);

-- Insertar estados de turno básicos
INSERT INTO EstadosTurno (nombre_estado, descripcion) VALUES
    ('Pendiente', 'Turno programado pendiente de atención'),
    ('En Proceso', 'Cliente siendo atendido'),
    ('Completado', 'Turno finalizado correctamente'),
    ('Cancelado', 'Turno cancelado'),
    ('No Asistió', 'Cliente no se presentó al turno');