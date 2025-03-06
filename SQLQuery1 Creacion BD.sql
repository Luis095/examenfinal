CREATE DATABASE BibliotecaUniversitaria;
GO


USE BibliotecaUniversitaria;
GO

CREATE TABLE Libros (
    LibroID INT IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(20) UNIQUE NOT NULL,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(255) NOT NULL,
    Editorial VARCHAR(100),
    AnioPublicacion INT,
    Categoria VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Estudiantes (
    EstudianteID INT IDENTITY(1,1) PRIMARY KEY,
    CarnetNumero VARCHAR(20) UNIQUE NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Carrera VARCHAR(100),
    FechaInscripcion DATE
);
GO

CREATE TABLE Prestamos (
    PrestamoID INT IDENTITY(1,1) PRIMARY KEY,
    EstudianteID INT,
    LibroID INT,
    FechaPrestamo DATE NOT NULL,
    FechaDevolucion DATE,
    FechaLimiteDevolucion DATE NOT NULL,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (LibroID) REFERENCES Libros(LibroID)
);
GO

CREATE TABLE Multas (
    MultaID INT IDENTITY(1,1) PRIMARY KEY,
    EstudianteID INT,
    Monto DECIMAL(10, 2) NOT NULL,
    FechaGeneracion DATE NOT NULL,
    Estado VARCHAR(50) NOT NULL,  -- 'Activa' o 'Pagada'
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID)
);
GO


CREATE TABLE Categorias (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCategoria VARCHAR(100) NOT NULL
);
GO




SELECT L.Titulo
FROM Libros L
LEFT JOIN Prestamos P ON L.LibroID = P.LibroID
WHERE P.PrestamoID IS NULL;
GO
