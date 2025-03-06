USE [BibliotecaUniversitaria];  

INSERT INTO Categorias (NombreCategoria)
VALUES 
('Filosofía'),
('Psicología'),
('Derecho'),
('Biología'),
('Arte'),
('Economía');
GO

INSERT INTO Libros (Codigo, Titulo, Autor, Editorial, AnioPublicacion, Categoria)
VALUES 
('B012', 'Física Cuántica', 'María González', 'Editorial J', 2021, 'Ciencia'),
('B013', 'La Trilogía de la Ciencia', 'Carlos Rodríguez', 'Editorial K', 2022, 'Ciencia'),
('B014', 'La Odisea', 'Homero', 'Editorial L', 2020, 'Literatura'),
('B015', 'El Quijote', 'Miguel de Cervantes', 'Editorial M', 2018, 'Literatura'),
('B016', 'La Guía de la Ingeniería', 'Felipe López', 'Editorial N', 2021, 'Ingeniería'),
('B017', 'Álgebra Lineal', 'Santiago Herrera', 'Editorial O', 2019, 'Ingeniería'),
('B018', 'Neurociencia para Todos', 'Julia Fernández', 'Editorial P', 2022, 'Psicología'),
('B019', 'Historia del Derecho', 'Luis Martínez', 'Editorial Q', 2019, 'Derecho'),
('B020', 'Estrategias en Biología', 'Andrea Pérez', 'Editorial R', 2020, 'Biología'),
('B021', 'Escuelas de Pintura', 'Gabriela Ruiz', 'Editorial S', 2021, 'Arte');
GO


INSERT INTO Estudiantes (CarnetNumero, Nombre, Carrera, FechaInscripcion)
VALUES 
('E009', 'Pedro García', 'Derecho', '2022-11-01'),
('E010', 'Luis Martínez', 'Filosofía', '2023-02-20'),
('E011', 'Camila Sánchez', 'Ingeniería Civil', '2022-06-15'),
('E012', 'Javier Ramírez', 'Ciencias Sociales', '2023-04-05'),
('E013', 'Elena Torres', 'Psicología', '2021-09-10'),
('E014', 'Rosa Díaz', 'Biología', '2023-01-18'),
('E015', 'Gabriel Ruiz', 'Arte', '2022-07-30'),
('E016', 'Marta Gómez', 'Economía', '2022-12-20'),
('E017', 'Manuel López', 'Filosofía', '2023-03-25'),
('E018', 'Sofía Martínez', 'Ingeniería Eléctrica', '2021-08-10');
GO



INSERT INTO Prestamos (EstudianteID, LibroID, FechaPrestamo, FechaLimiteDevolucion)
VALUES 
(7, 1, '2024-03-18', '2024-04-01'),
(8, 2, '2024-03-19', '2024-04-02'),
(9, 3, '2024-03-20', '2024-04-03'),
(10, 4, '2024-03-21', '2024-04-04'),
(1, 5, '2024-03-22', '2024-04-05'),
(2, 6, '2024-03-23', '2024-04-06'),
(3, 7, '2024-03-24', '2024-04-07'),
(4, 8, '2024-03-25', '2024-04-08'),
(5, 9, '2024-03-26', '2024-04-09'),
(6, 10, '2024-03-27', '2024-04-10');
GO


INSERT INTO Prestamos (EstudianteID, LibroID, FechaPrestamo, FechaLimiteDevolucion)
VALUES 
(1, 1, '2024-03-01', '2024-03-15'),
(2, 2, '2024-03-03', '2024-03-17'),
(3, 3, '2024-03-05', '2024-03-19'),
(4, 4, '2024-03-07', '2024-03-21'),
(5, 5, '2024-03-09', '2024-03-23');
GO

INSERT INTO Estudiantes (Nombre, Carrera, FechaInscripcion, CarnetNumero)
VALUES
('Carlos Pérez', 'Ingeniería', '2022-08-10', 'C12345'),
('Ana López', 'Derecho', '2023-02-15', 'D12346'),
('Luis Hernández', 'Medicina', '2021-11-20', 'M12347'),
('María González', 'Literatura', '2020-06-30', 'L12348'),
('José Fernández', 'Arquitectura', '2024-01-12', 'A12349');
GO

