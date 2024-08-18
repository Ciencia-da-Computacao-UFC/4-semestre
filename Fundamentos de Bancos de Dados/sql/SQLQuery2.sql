USE Aulas_SQL_2020

DROP TABLE IF EXISTS tbl_Clientes, tbl_Carros

CREATE TABLE tbl_Clientes (
	idCliente INT PRIMARY KEY,
	nomeCliente VARCHAR(50),
	dataNascimeto DATE,
	sexo CHAR(1)
)

CREATE TABLE tbl_Carros (
	nomeFabricante VARCHAR(50),
	nomeModelo VARCHAR(50),
	anoModelo INT,
	nomeCliente VARCHAR(50),
	idCliente INT FOREIGN KEY REFERENCES tbl_Clientes(idCliente)
)


-- Inserindo dados
INSERT INTO tbl_Clientes (
	idCliente,
	nomeCliente,
	dataNascimeto,
	sexo
) VALUES (
	1,
	'Zé',
	'1890-01-13',
	'M'
), (
	2,
	'Jailson',
	'2006',
	'M'
)


INSERT INTO tbl_Carros (
	nomeFabricante,
	nomeModelo,
	anoModelo,
	idCliente
) VALUES (
	'Volkswagen',
	'Fox',
	2008,
	1
), (
	'Hyundai',
	'Tucson',
	2013,
	2
)

SELECT * FROM tbl_Clientes 
SELECT * FROM tbl_Carros WHERE idCliente=1

-- Junção

SELECT 
	C.nomeCliente,
	CA.anoModelo, 
	CA.anoModelo

FROM 
	tbl_Clientes AS C, tbl_Carros AS CA
WHERE
	C.idCliente = CA.idCliente
