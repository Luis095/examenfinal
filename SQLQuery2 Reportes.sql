CREATE PROCEDURE reporte_estudiante (@EstudianteID INT)
AS
BEGIN
    -- Información personal del estudiante
    SELECT 
        Nombre, 
        Carrera, 
        FechaInscripcion
    FROM Estudiantes
    WHERE EstudianteID = @EstudianteID;

    -- Libros que ha tomado en préstamo y su estado
    SELECT 
        L.Titulo, 
        P.FechaPrestamo, 
        P.FechaDevolucion,
        CASE 
            WHEN P.FechaDevolucion IS NULL THEN 'No Devuelto'
            ELSE 'Devuelto'
        END AS Estado
    FROM Prestamos P
    INNER JOIN Libros L ON P.LibroID = L.LibroID
    WHERE P.EstudianteID = @EstudianteID;

    -- Cantidad total de libros prestados
    SELECT 
        COUNT(*) AS TotalLibrosPrestados
    FROM Prestamos
    WHERE EstudianteID = @EstudianteID;

    -- Número de multas activas
    SELECT 
        COUNT(*) AS TotalMultasActivas
    FROM Multas
    WHERE EstudianteID = @EstudianteID AND Estado = 'Activa';
END;
GO


CREATE PROCEDURE top_libros_prestados (@FechaInicio DATE, @FechaFin DATE)
AS
BEGIN
    -- Libros más prestados en el rango de fechas
    SELECT 
        L.Titulo,
        COUNT(P.PrestamoID) AS NumeroDePrestamos,
        (COUNT(P.PrestamoID) * 100.0 / (SELECT COUNT(*) FROM Prestamos WHERE FechaPrestamo BETWEEN @FechaInicio AND @FechaFin)) AS PorcentajePrestamos
    FROM Prestamos P
    INNER JOIN Libros L ON P.LibroID = L.LibroID
    WHERE P.FechaPrestamo BETWEEN @FechaInicio AND @FechaFin
    GROUP BY L.Titulo
    ORDER BY NumeroDePrestamos DESC;
END;
GO

CREATE PROCEDURE reporte_multas_estudiantes
AS
BEGIN
    -- Estudiantes con multas activas y total de deuda
    SELECT 
        E.Nombre, 
        SUM(M.Monto) AS TotalDeuda
    FROM Multas M
    INNER JOIN Estudiantes E ON M.EstudianteID = E.EstudianteID
    WHERE M.Estado = 'Activa'
    GROUP BY E.Nombre;

    -- Promedio de multas entre todos los estudiantes
    SELECT 
        AVG(M.Monto) AS PromedioDeMultas
    FROM Multas M
    WHERE M.Estado = 'Activa';

    -- Estudiantes con multas por encima del promedio
    SELECT 
        E.Nombre,
        SUM(M.Monto) AS TotalDeuda
    FROM Multas M
    INNER JOIN Estudiantes E ON M.EstudianteID = E.EstudianteID
    WHERE M.Estado = 'Activa'
    GROUP BY E.Nombre
    HAVING SUM(M.Monto) > (SELECT AVG(Monto) FROM Multas WHERE Estado = 'Activa');
END;
GO
