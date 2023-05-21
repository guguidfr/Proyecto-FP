-- Crear una tabla llamada "usuarios"
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    email VARCHAR(100)
);

-- Insertar datos aleatorios en la tabla
INSERT INTO usuarios (nombre, edad, email)
SELECT
    md5(random()::text) AS nombre,
    floor(random() * 100) AS edad,
    md5(random()::text || '@example.com') AS email
FROM generate_series(1, 10);
