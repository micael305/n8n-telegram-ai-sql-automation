-- tabla de departamentos
CREATE TABLE IF NOT EXISTS departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- tabla de empleados
CREATE TABLE IF NOT EXISTS empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    fecha_contratacion DATE NOT NULL,
    departamento_id INT REFERENCES departamentos(id)
);

-- datos de prueba 
INSERT INTO departamentos (nombre) VALUES 
('IT'), 
('Recursos Humanos'), 
('Ventas'), 
('Marketing');

-- datos de prueba 
INSERT INTO empleados (nombre, apellido, email, fecha_contratacion, departamento_id) VALUES
('Ana', 'García', 'ana.garcia@empresa.com', '2015-03-10', 2),
('Luis', 'Rodríguez', 'luis.rodriguez@empresa.com', '2018-06-15', 1),
('Marta', 'López', 'marta.lopez@empresa.com', '2020-01-20', 1),
('Carlos', 'Sánchez', 'carlos.sanchez@empresa.com', '2021-11-05', 3),
('Sofía', 'Martínez', 'sofia.martinez@empresa.com', '2019-02-12', 1),
('Jorge', 'Pérez', 'jorge.perez@empresa.com', '2023-05-22', 4);