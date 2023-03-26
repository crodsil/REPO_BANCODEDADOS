-- PARTE 1

-- CLIENTES E PRODUTOS

-- 1

SELECT * FROM  categorias;

-- 2

SELECT CategoriaNombre, Descripcion FROM categorias;

-- 3

SELECT * FROM  productos;

-- 4

SELECT * FROM  productos WHERE Discontinuado <> 0;

-- 5

SELECT * FROM  productos WHERE ProveedorID = 8;

-- 6

SELECT * FROM  productos WHERE PrecioUnitario BETWEEN 10 AND 22;

-- 7

SELECT productoNombre, proveedorID, UnidadesStock, NivelReorden FROM productos
WHERE UnidadesStock < NivelReorden;

-- 8

SELECT productoNombre, proveedorID, UnidadesPedidas,UnidadesStock, NivelReorden FROM productos
WHERE UnidadesStock < NivelReorden AND UnidadesPedidas = 0;


-- CLIENTES

-- 1

SELECT Compania, Contacto, Titulo, Pais FROM clientes ORDER BY Pais ASC;

-- 2

SELECT * FROM clientes WHERE Titulo LIKE '%Owner%';

-- 3

SELECT * FROM clientes WHERE Compania LIKE 'C%';

-- CONTAS

-- 1

SELECT * FROM facturas ORDER BY FechaFactura ASC;

-- 2
SELECT * FROM facturas WHERE PaisEnvio = 'USA' AND EnvioVia <> 3;

-- 3

SELECT * FROM facturas WHERE ClienteID LIKE '%GOURL%';

-- 4

SELECT * FROM facturas
WHERE EmpleadoID IN(2, 3, 5, 8, 9);


-- PARTE 2

-- PRODUTOS

-- 1

SELECT * FROM  productos ORDER BY PrecioUnitario DESC;

-- 2

SELECT * FROM  productos ORDER BY PrecioUnitario DESC LIMIT 5;

-- 3

SELECT * FROM  productos ORDER BY UnidadesStock DESC LIMIT 5;

-- FATURA DETALHE

-- 1

SELECT facturaID, ProductoID, Cantidad FROM facturadetalle;

-- 2

SELECT facturaID, ProductoID, Cantidad FROM facturadetalle ORDER BY Cantidad DESC;

-- 3
  
SELECT facturaID, ProductoID, Cantidad FROM facturadetalle WHERE Cantidad BETWEEN 50 AND 100;

-- 4 

SELECT facturaID, ProductoID AS Product, (PrecioUnitario*Cantidad) AS Total
FROM facturadetalle;

-- EXTRAS

-- 1

SELECT * FROM clientes WHERE Pais = 'Brazil' OR  Pais = 'Mexico' OR Titulo LIKE 'Sales%';

-- 2

SELECT * FROM clientes WHERE Compania LIKE 'A%';

-- 3 

SELECT Ciudad AS Sobrenome, Contacto AS Nome FROM clientes;

-- 4

SELECT * FROM facturas
WHERE FacturaID IN(10000,10500);

-- 5

SELECT * FROM facturas
WHERE FacturaID IN(10000,10500) OR ClienteID LIKE 'B%';

-- 6

SELECT * FROM facturas
WHERE CiudadEnvio = 'Vancouver' OR EnvioVia = 3 ;

-- 7

SELECT * FROM empleados
WHERE Apellido LIKE 'Buchanan';

-- 8

SELECT FacturaID  FROM facturas
WHERE EmpleadoID = (SELECT EmpleadoID FROM empleados
					WHERE Apellido LIKE 'Buchanan');