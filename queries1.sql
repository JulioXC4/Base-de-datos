-- Tabla Empresa
CREATE TABLE Empresa (
    codigo_empresa INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Sector NVARCHAR(50),
    Correo_electronico NVARCHAR(100),
    Telefono NVARCHAR(20),
    Ubicacion NVARCHAR(100)
);

-- Tabla Tecnologia
CREATE TABLE Tecnologia (
    codigo_tecnologia INT PRIMARY KEY IDENTITY(1,1),
    Nombre_tecnologia NVARCHAR(100),
    Descripcion NVARCHAR(255),
    Requerimientos_Tecnicos NVARCHAR(255)
);

-- Tabla RequerimientoTecnico
CREATE TABLE RequerimientoTecnico (
    codigo_requerimiento_tecnico INT PRIMARY KEY IDENTITY(1,1),
    codigo_vacante INT, -- Asegúrate de que la tabla Vacante existe o la puedes agregar
    CONSTRAINT FK_RequerimientoTecnico_Vacante FOREIGN KEY (codigo_vacante) 
    REFERENCES Vacante(codigo_vacante)
);

-- Tabla TecnologiasRequerimientosTecnicos
CREATE TABLE TecnologiasRequerimientosTecnicos (
    codigo_requerimiento_tecnico INT,
    codigo_tecnologia INT,
    CONSTRAINT FK_Tecnologias_Requerimientos FOREIGN KEY (codigo_requerimiento_tecnico) 
    REFERENCES RequerimientoTecnico(codigo_requerimiento_tecnico),
    CONSTRAINT FK_Tecnologias_Tecnologia FOREIGN KEY (codigo_tecnologia) 
    REFERENCES Tecnologia(codigo_tecnologia)
);

INSERT INTO Empresa (Nombre, Sector, Correo_electronico, Telefono, Ubicacion)
VALUES 
('Tech Solutions', 'Tecnología', 'contacto@techsolutions.com', '555-1234', 'Madrid, España'),
('Innovate Corp', 'Consultoría', 'info@innovatecorp.com', '555-5678', 'Barcelona, España'),
('HealthPlus', 'Salud', 'info@healthplus.com', '555-4321', 'Sevilla, España'),
('Green Energy', 'Energía', 'contacto@greenenergy.com', '555-8765', 'Valencia, España'),
('Data Insight', 'Big Data', 'info@datainsight.com', '555-3456', 'Bilbao, España'),
('CloudNet', 'Tecnología', 'soporte@cloudnet.com', '555-7890', 'Málaga, España'),
('AI Innovations', 'Inteligencia Artificial', 'ai@innovations.com', '555-0987', 'Zaragoza, España'),
('BioTech Labs', 'Biotecnología', 'biotech@labs.com', '555-5432', 'Alicante, España'),
('SecureIT', 'Ciberseguridad', 'support@secureit.com', '555-2109', 'Murcia, España'),
('EcoLogica', 'Medio Ambiente', 'info@ecologica.com', '555-6789', 'Granada, España');

INSERT INTO Tecnologia (Nombre_tecnologia, Descripcion, Requerimientos_Tecnicos)
VALUES 
('Python', 'Lenguaje de programación de alto nivel', 'Conocimiento en librerías de datos'),
('Java', 'Lenguaje de programación orientado a objetos', 'Experiencia en desarrollo backend'),
('AWS', 'Plataforma de servicios en la nube', 'Certificación AWS Solutions Architect'),
('React', 'Librería de JavaScript para construir interfaces de usuario', 'Experiencia con JavaScript y JSX'),
('Docker', 'Plataforma de contenedores', 'Conocimientos de virtualización y microservicios'),
('Kubernetes', 'Sistema de orquestación de contenedores', 'Experiencia con Docker y gestión de clusters'),
('SQL Server', 'Sistema de gestión de bases de datos', 'Conocimientos de consultas SQL y optimización'),
('TensorFlow', 'Biblioteca de aprendizaje automático', 'Experiencia en modelos de deep learning'),
('Azure', 'Plataforma de servicios en la nube de Microsoft', 'Certificación en Azure Solutions Architect'),
('Node.js', 'Entorno de ejecución de JavaScript en el servidor', 'Experiencia en desarrollo full-stack');

/* INSERT INTO RequerimientoTecnico (codigo_vacante)
VALUES 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);
 */

/* INSERT INTO TecnologiasRequerimientosTecnicos (codigo_requerimiento_tecnico, codigo_tecnologia)
VALUES 
(1, 1), -- Python requerido en la vacante 1
(2, 2), -- Java requerido en la vacante 2
(3, 3), -- AWS requerido en la vacante 3
(4, 4), -- React requerido en la vacante 4
(5, 5), -- Docker requerido en la vacante 5
(6, 6), -- Kubernetes requerido en la vacante 6
(7, 7), -- SQL Server requerido en la vacante 7
(8, 8), -- TensorFlow requerido en la vacante 8
(9, 9), -- Azure requerido en la vacante 9
(10, 10); -- Node.js requerido en la vacante 10 */
