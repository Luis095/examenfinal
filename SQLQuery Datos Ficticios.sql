USE [BibliotecaUniversitaria];  

INSERT INTO Categorias (NombreCategoria)
VALUES 
('Filosof�a'),
('Psicolog�a'),
('Derecho'),
('Biolog�a'),
('Arte'),
('Econom�a');
GO

INSERT INTO Libros (Codigo, Titulo, Autor, Editorial, AnioPublicacion, Categoria)
VALUES 
('B012', 'F�sica Cu�ntica', 'Mar�a Gonz�lez', 'Editorial J', 2021, 'Ciencia'),
('B013', 'La Trilog�a de la Ciencia', 'Carlos Rodr�guez', 'Editorial K', 2022, 'Ciencia'),
('B014', 'La Odisea', 'Homero', 'Editorial L', 2020, 'Literatura'),
('B015', 'El Quijote', 'Miguel de Cervantes', 'Editorial M', 2018, 'Literatura'),
('B016', 'La Gu�a de la Ingenier�a', 'Felipe L�pez', 'Editorial N', 2021, 'Ingenier�a'),
('B017', '�lgebra Lineal', 'Santiago Herrera', 'Editorial O', 2019, 'Ingenier�a'),
('B018', 'Neurociencia para Todos', 'Julia Fern�ndez', 'Editorial P', 2022, 'Psicolog�a'),
('B019', 'Historia del Derecho', 'Luis Mart�nez', 'Editorial Q', 2019, 'Derecho'),
('B020', 'Estrategias en Biolog�a', 'Andrea P�rez', 'Editorial R', 2020, 'Biolog�a'),
('B021', 'Escuelas de Pintura', 'Gabriela Ruiz', 'Editorial S', 2021, 'Arte');
GO


INSERT INTO Estudiantes (CarnetNumero, Nombre, Carrera, FechaInscripcion)
VALUES 
('E009', 'Pedro Garc�a', 'Derecho', '2022-11-01'),
('E010', 'Luis Mart�nez', 'Filosof�a', '2023-02-20'),
('E011', 'Camila S�nchez', 'Ingenier�a Civil', '2022-06-15'),
('E012', 'Javier Ram�rez', 'Ciencias Sociales', '2023-04-05'),
('E013', 'Elena Torres', 'Psicolog�a', '2021-09-10'),
('E014', 'Rosa D�az', 'Biolog�a', '2023-01-18'),
('E015', 'Gabriel Ruiz', 'Arte', '2022-07-30'),
('E016', 'Marta G�mez', 'Econom�a', '2022-12-20'),
('E017', 'Manuel L�pez', 'Filosof�a', '2023-03-25'),
('E018', 'Sof�a Mart�nez', 'Ingenier�a El�ctrica', '2021-08-10');
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
('Carlos P�rez', 'Ingenier�a', '2022-08-10', 'C12345'),
('Ana L�pez', 'Derecho', '2023-02-15', 'D12346'),
('Luis Hern�ndez', 'Medicina', '2021-11-20', 'M12347'),
('Mar�a Gonz�lez', 'Literatura', '2020-06-30', 'L12348'),
('Jos� Fern�ndez', 'Arquitectura', '2024-01-12', 'A12349');
GO

