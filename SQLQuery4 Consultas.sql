CREATE PROCEDURE reporte_estudiante
    @EstudianteID INT
AS
BEGIN
    -- Información personal del estudiante
    SELECT Nombre, Carrera, FechaInscripcion, CarnetNumero
    FROM Estudiantes
    WHERE EstudianteID = @EstudianteID;

    -- Libros prestados por el estudiante y su estado
    SELECT L.Titulo, P.FechaPrestamo, P.FechaDevolucion, 
           CASE 
               WHEN P.FechaDevolucion < GETDATE() THEN 'No Devuelto'
               ELSE 'Devuelto'
           END AS Estado
    FROM Prestamos P
    INNER JOIN Libros L ON P.LibroID = L.LibroID
    WHERE P.EstudianteID = @EstudianteID;

    -- Cantidad total de libros prestados
    SELECT COUNT(*) AS TotalLibrosPrestados
    FROM Prestamos
    WHERE EstudianteID = @EstudianteID;

    -- Número de multas activas
    SELECT COUNT(*) AS TotalMultasActivas
    FROM Multas
    WHERE EstudianteID = @EstudianteID AND Monto > 0;
END
GO





CREATE PROCEDURE top_libros_prestados
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    -- Libros más prestados en el rango de fechas
    SELECT L.Titulo, COUNT(*) AS NumeroDePrestamos,
           (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Prestamos WHERE FechaPrestamo BETWEEN @FechaInicio AND @FechaFin) AS PorcentajePrestamos
    FROM Prestamos P
    INNER JOIN Libros L ON P.LibroID = L.LibroID
    WHERE P.FechaPrestamo BETWEEN @FechaInicio AND @FechaFin
    GROUP BY L.Titulo
    ORDER BY NumeroDePrestamos DESC;
END
GO


CREATE PROCEDURE reporte_multas_estudiantes
AS
BEGIN
    -- Estudiantes con multas activas y total de la deuda
    SELECT E.Nombre, SUM(M.Monto) AS TotalDeuda
    FROM Multas M
    INNER JOIN Estudiantes E ON M.EstudianteID = E.EstudianteID
    WHERE M.Monto > 0
    GROUP BY E.Nombre
    ORDER BY TotalDeuda DESC;

    -- Promedio de multas entre todos los estudiantes
    SELECT AVG(Monto) AS PromedioMultas
    FROM Multas
    WHERE Monto > 0;

    -- Estudiantes con multas por encima del promedio
    SELECT E.Nombre, SUM(M.Monto) AS TotalDeuda
    FROM Multas M
    INNER JOIN Estudiantes E ON M.EstudianteID = E.EstudianteID
    GROUP BY E.Nombre
    HAVING SUM(M.Monto) > (SELECT AVG(Monto) FROM Multas WHERE Monto > 0)
    ORDER BY TotalDeuda DESC;
END
GO


1

EXEC reporte_estudiante @EstudianteID = 1;

2

EXEC top_libros_prestados @FechaInicio = '2023-01-01', @FechaFin = '2023-12-31'

EXEC reporte_multas_estudiantes;

