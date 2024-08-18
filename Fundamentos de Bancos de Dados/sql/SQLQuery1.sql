USE Aulas_SQL_2020

DROP TABLE IF EXISTS tbl_Pessoas

CREATE TABLE tbl_Pessoas (
	idPessoa INT,
	nomePessoa VARCHAR(50),
	dataNascimento DATE
)


INSERT INTO tbl_Pessoas (idPessoa, nomePessoa, dataNascimento)
VALUES 
	(1, 'Zurubabel', '1987-11-15'),
	(2, 'Marcos','1987-11-22'),
	(3, 'Fer','1987-12-05' ),
	(4, 'qualuqew', '1987-11-15')

SELECT * FROM tbl_Pessoas