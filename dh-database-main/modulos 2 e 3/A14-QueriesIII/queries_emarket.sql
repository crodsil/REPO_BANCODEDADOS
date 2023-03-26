/*1. Liste os clientes que fizeram compras durante 1996.
A lista deve conter as seguintes colunas:
Nome e inicial do sobrenome. Por exemplo, em vez de Mario Pontes; você deveria dizer Mario P;.
O título é todo maiúsculo.*/

USE `emarket`;

SELECT * FROM clientes;
SELECT * FROM facturas;

SELECT clientes.Compania AS NOME_CLIENTE, 
FROM clientes
JOIN facturas ON facturas.id = clientes.id 
GROUP BY FechaFactura
HAVING (SELECT EXTRACT(YEAR FROM '2014-02-13 08:44:21'));