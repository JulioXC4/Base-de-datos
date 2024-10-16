-- Crear una tabla llamada "Empleados"
CREATE TABLE Empleados (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    Edad INT,
    Cargo NVARCHAR(50),
    FechaContratacion DATE
);

-- Insertar datos en la tabla "Empleados"
INSERT INTO Empleados (Nombre, Apellido, Edad, Cargo, FechaContratacion)
VALUES 
('Juan', 'Pérez', 30, 'Desarrollador', '2020-01-15'),
('Ana', 'García', 28, 'Analista', '2021-05-10'),
('Pedro', 'Martínez', 35, 'Gerente', '2018-07-23');

-- Consultar todos los datos de la tabla "Empleados"
SELECT * FROM Empleados;

-- Consultar empleados con más de 30 años
SELECT Nombre, Apellido, Edad 
FROM Empleados
WHERE Edad > 30;

-- Actualizar el cargo de un empleado
UPDATE Empleados
SET Cargo = 'Desarrollador Senior'
WHERE Id = 1;

-- Eliminar un empleado con un Id específico
DELETE FROM Empleados
WHERE Id = 3;
