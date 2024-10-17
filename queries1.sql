-- tabla empresa
create table empresa (
    codigo_empresa int primary key identity(1,1),
    nombre nvarchar(100),
    sector nvarchar(50),
    correo_electronico nvarchar(100),
    telefono nvarchar(20),
    ubicacion nvarchar(100)
);

-- tabla tecnologia
create table tecnologia (
    codigo_tecnologia int primary key identity(1,1),
    nombre_tecnologia nvarchar(100),
    descripcion nvarchar(255),
    requerimientos_tecnicos nvarchar(255)
);

-- tabla requerimientotecnico
create table requerimientotecnico (
    codigo_requerimiento_tecnico int primary key identity(1,1),
    codigo_vacante int, -- asegúrate de que la tabla vacante existe o la puedes agregar
    constraint fk_requerimientotecnico_vacante foreign key (codigo_vacante) 
    references vacante(codigo_vacante)
);

-- tabla tecnologiasrequerimientostecnicos
create table tecnologiasrequerimientostecnicos (
    codigo_requerimiento_tecnico int,
    codigo_tecnologia int,
    constraint fk_tecnologias_requerimientos foreign key (codigo_requerimiento_tecnico) 
    references requerimientotecnico(codigo_requerimiento_tecnico),
    constraint fk_tecnologias_tecnologia foreign key (codigo_tecnologia) 
    references tecnologia(codigo_tecnologia)
);

insert into empresa (nombre, sector, correo_electronico, telefono, ubicacion)
values 
('tech solutions', 'tecnología', 'contacto@techsolutions.com', '555-1234', 'madrid, españa'),
('innovate corp', 'consultoría', 'info@innovatecorp.com', '555-5678', 'barcelona, españa'),
('healthplus', 'salud', 'info@healthplus.com', '555-4321', 'sevilla, españa'),
('green energy', 'energía', 'contacto@greenenergy.com', '555-8765', 'valencia, españa'),
('data insight', 'big data', 'info@datainsight.com', '555-3456', 'bilbao, españa'),
('cloudnet', 'tecnología', 'soporte@cloudnet.com', '555-7890', 'málaga, españa'),
('ai innovations', 'inteligencia artificial', 'ai@innovations.com', '555-0987', 'zaragoza, españa'),
('biotech labs', 'biotecnología', 'biotech@labs.com', '555-5432', 'alicante, españa'),
('secureit', 'ciberseguridad', 'support@secureit.com', '555-2109', 'murcia, españa'),
('ecologica', 'medio ambiente', 'info@ecologica.com', '555-6789', 'granada, españa');

insert into tecnologia (nombre_tecnologia, descripcion, requerimientos_tecnicos)
values 
('python', 'lenguaje de programación de alto nivel', 'conocimiento en librerías de datos'),
('java', 'lenguaje de programación orientado a objetos', 'experiencia en desarrollo backend'),
('aws', 'plataforma de servicios en la nube', 'certificación aws solutions architect'),
('react', 'librería de javascript para construir interfaces de usuario', 'experiencia con javascript y jsx'),
('docker', 'plataforma de contenedores', 'conocimientos de virtualización y microservicios'),
('kubernetes', 'sistema de orquestación de contenedores', 'experiencia con docker y gestión de clusters'),
('sql server', 'sistema de gestión de bases de datos', 'conocimientos de consultas sql y optimización'),
('tensorflow', 'biblioteca de aprendizaje automático', 'experiencia en modelos de deep learning'),
('azure', 'plataforma de servicios en la nube de microsoft', 'certificación en azure solutions architect'),
('node.js', 'entorno de ejecución de javascript en el servidor', 'experiencia en desarrollo full-stack');

/* insert into requerimientotecnico (codigo_vacante)
values 
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

 /* insert into tecnologiasrequerimientostecnicos (codigo_requerimiento_tecnico, codigo_tecnologia)
values 
(1, 1), -- python requerido en la vacante 1
(2, 2), -- java requerido en la vacante 2
(3, 3), -- aws requerido en la vacante 3
(4, 4), -- react requerido en la vacante 4
(5, 5), -- docker requerido en la vacante 5
(6, 6), -- kubernetes requerido en la vacante 6
(7, 7), -- sql server requerido en la vacante 7
(8, 8), -- tensorflow requerido en la vacante 8
(9, 9), -- azure requerido en la vacante 9
(10, 10); -- node.js requerido en la vacante 10 */
