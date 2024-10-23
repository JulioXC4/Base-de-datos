-- tabla tecnologia
create table tecnologiaa (
    codigo_tecnologia int primary key identity(1,1),
    nombre_tecnologia varchar(100),
    descripcion varchar(255),
);

insert into tecnologia (nombre_tecnologia, descripcion)
values 
('python', 'lenguaje de programación de alto nivel'),
('java', 'lenguaje de programación orientado a objetos'),
('aws', 'plataforma de servicios en la nube'),
('react', 'librería de javascript para construir interfaces de usuario'),
('docker', 'plataforma de contenedores'),
('kubernetes', 'sistema de orquestación de contenedores'),
('sql server', 'sistema de gestión de bases de datos'),
('tensorflow', 'biblioteca de aprendizaje automático'),
('azure', 'plataforma de servicios en la nube de microsoft'),
('node.js', 'entorno de ejecución de javascript en el servidor');

select * from tecnologia

create table empresaa (
    codigo_empresa int primary key identity(1,1),
    nombre varchar(100),
    sector varchar(50),
    correo_electronico varchar(100),
    telefono varchar(20),
    ubicacion varchar(100)
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

select * from empresa

-- tabla oferta
create table oferta (
    codigo_oferta int primary key identity(1,1),
    codigo_empresa int,
    titulo varchar(100),
    descripcion varchar(255),
    fecha_publicacion date,
    fecha_limite date,
    constraint fk_oferta_empresa foreign key (codigo_empresa) 
    references empresa(codigo_empresa)
);

-- tabla vacante
create table vacante (
    codigo_vacante int primary key identity(1,1),
    codigo_oferta int,
    puesto varchar(100),
    descripcion varchar(255),
    salario varchar(50),
    constraint fk_vacante_oferta foreign key (codigo_oferta) 
    references oferta(codigo_oferta)
);

-- tabla requerimientotecnico
create table requerimientotecnico (
    codigo_requerimiento_tecnico int primary key identity(1,1),
    codigo_vacante int,
    constraint fk_requerimientotecnico_vacante foreign key (codigo_vacante) 
    references vacante(codigo_vacante)
);

select * from requerimientotecnico

insert into requerimientotecnico (codigo_vacante) values
(1),  -- Relacionado con "Backend Developer"
(1),  -- Relacionado con "Senior Backend Developer"
(2),  -- Relacionado con "UI Designer"
(2),  -- Relacionado con "UX Designer"
(3),  -- Relacionado con "Data Analyst"
(3),  -- Relacionado con "Senior Data Analyst"
(4),  -- Relacionado con "Project Manager"
(5),  -- Relacionado con "Frontend Developer"
(6),  -- Relacionado con "Digital Marketing Specialist"
(7);  -- Relacionado con "Systems Administrator"

select * from requerimientotecnico

-- tabla tecnologiasrequerimientostecnicos
create table tecnologiasrequerimientostecnicos (
    codigo_requerimiento_tecnico int,
    codigo_tecnologia int,
    constraint fk_tecnologias_requerimientos foreign key (codigo_requerimiento_tecnico) 
    references requerimientotecnico(codigo_requerimiento_tecnico),
    constraint fk_tecnologias_tecnologia foreign key (codigo_tecnologia) 
    references tecnologia(codigo_tecnologia)
);

insert into tecnologiasrequerimientostecnicos (codigo_requerimiento_tecnico, codigo_tecnologia) values
(1, 1),  -- Backend Developer requiere tecnología 1
(1, 2),  -- Senior Backend Developer requiere tecnología 2
(2, 3),  -- UI Designer requiere tecnología 3
(2, 4),  -- UX Designer requiere tecnología 4
(3, 5),  -- Data Analyst requiere tecnología 5
(3, 6),  -- Senior Data Analyst requiere tecnología 6
(4, 7),  -- Project Manager requiere tecnología 7
(5, 8),  -- Frontend Developer requiere tecnología 8
(6, 9),  -- Digital Marketing Specialist requiere tecnología 9
(7, 10); -- Systems Administrator requiere tecnología 10

select * from tecnologiasrequerimientostecnicos

insert into oferta (codigo_empresa, titulo, descripcion, fecha_publicacion, fecha_limite) values
(1, 'Desarrollador Backend', 'Buscamos un desarrollador backend con experiencia en .NET.', '2024-01-15', '2024-02-15'),
(2, 'Diseñador UI/UX', 'Se necesita diseñador UI/UX para mejorar la experiencia de usuario.', '2024-01-20', '2024-02-20'),
(3, 'Analista de Datos', 'Buscamos un analista de datos para ayudar en la toma de decisiones.', '2024-01-25', '2024-02-25'),
(4, 'Gerente de Proyecto', 'Se busca gerente de proyecto con habilidades de liderazgo.', '2024-02-01', '2024-03-01'),
(5, 'Desarrollador Frontend', 'Necesitamos un desarrollador frontend con experiencia en React.', '2024-02-05', '2024-03-05'),
(6, 'Especialista en Marketing Digital', 'Se busca especialista en marketing digital para campaña de lanzamiento.', '2024-02-10', '2024-03-10'),
(7, 'Administrador de Sistemas', 'Buscamos un administrador de sistemas para nuestra infraestructura.', '2024-02-15', '2024-03-15'),
(8, 'Desarrollador Móvil', 'Necesitamos un desarrollador móvil con experiencia en iOS y Android.', '2024-02-20', '2024-03-20'),
(9, 'Científico de Datos', 'Buscamos un científico de datos con habilidades en Machine Learning.', '2024-02-25', '2024-03-25'),
(10, 'Soporte Técnico', 'Se busca personal para soporte técnico a usuarios.', '2024-03-01', '2024-04-01');

insert into vacante (codigo_oferta, puesto, descripcion, salario) values
(1, 'Backend Developer', 'Desarrollo de aplicaciones backend en .NET.', '$3000 - $4000'),
(1, 'Senior Backend Developer', 'Desarrollo avanzado de backend en .NET.', '$4000 - $5000'),
(2, 'UI Designer', 'Diseño de interfaces de usuario para aplicaciones web.', '$2500 - $3500'),
(2, 'UX Designer', 'Mejora de la experiencia de usuario mediante pruebas de usabilidad.', '$3000 - $4000'),
(3, 'Data Analyst', 'Análisis de datos para la optimización de procesos.', '$3500 - $4500'),
(3, 'Senior Data Analyst', 'Análisis avanzado de datos con herramientas de BI.', '$4000 - $5000'),
(4, 'Project Manager', 'Gestión de proyectos tecnológicos de principio a fin.', '$4500 - $5500'),
(5, 'Frontend Developer', 'Desarrollo de interfaces de usuario con React.', '$3000 - $4000'),
(6, 'Digital Marketing Specialist', 'Desarrollo de estrategias de marketing digital.', '$2500 - $3500'),
(7, 'Systems Administrator', 'Administración y mantenimiento de servidores.', '$3000 - $4000');
go
-- Vista para obtener el nombre de la empresa, vacante, y el número de tecnologías requeridas
create view VVacanciesByCompanyAndTechnology
as
select e.nombre as Nombre_Empresa, v.puesto as Vacante, count(trt.codigo_tecnologia) as Total_Tecnologias
from empresa as e
    inner join oferta as o on e.codigo_empresa = o.codigo_empresa
    inner join vacante as v on o.codigo_oferta = v.codigo_oferta
    inner join requerimientotecnico as rt on v.codigo_vacante = rt.codigo_vacante
    inner join tecnologiasrequerimientostecnicos as trt on rt.codigo_requerimiento_tecnico = trt.codigo_requerimiento_tecnico
group by e.nombre, v.puesto
go

-- Selección de la vista para ver los resultados
select * from VVacanciesByCompanyAndTechnology
go

-- Vista para obtener las vacantes por empresa y año
create view VVacanciesByCompanyByYear
as
select e.nombre as Nombre_Empresa, Year(o.fecha_publicacion) as Año, count(v.codigo_vacante) as Total_Vacantes
from empresa as e
    inner join oferta as o on e.codigo_empresa = o.codigo_empresa
    inner join vacante as v on o.codigo_oferta = v.codigo_oferta
group by e.nombre, Year(o.fecha_publicacion)
go

-- Función para obtener la empresa con más vacantes en un año específico
create function FCompanyWithMostVacanciesByYear
(@Year int)
returns table
return (
    select Nombre_Empresa, Total_Vacantes from VVacanciesByCompanyByYear
    where Año = @Year
    and Total_Vacantes = (
        select max(Total_Vacantes) from VVacanciesByCompanyByYear
        where Año = @Year
    )
)
go

-- Ejemplo de uso de la función
select * from dbo.FCompanyWithMostVacanciesByYear(2024)
go

-- Procedimiento almacenado para insertar una nueva vacante
create procedure USPInsertVacancy
    @codigo_oferta int,
    @puesto varchar(100),
    @descripcion varchar(255),
    @salario varchar(50)
as
begin
    if not exists (select * from oferta where codigo_oferta = @codigo_oferta)
    begin
        print 'Error: La oferta especificada no existe.'
    end
    else
    begin
        insert into vacante (codigo_oferta, puesto, descripcion, salario)
        values (@codigo_oferta, @puesto, @descripcion, @salario)
        print 'Vacante insertada exitosamente.'
    end
end
go

-- Ejemplo de uso del procedimiento almacenado
exec USPInsertVacancy @codigo_oferta = 1, 
                      @puesto = 'Desarrollador Full Stack',
                      @descripcion = 'Desarrollo full stack en proyectos web.',
                      @salario = '$3500 - $4500'
go
          