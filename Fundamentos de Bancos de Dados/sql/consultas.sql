--CREATE DATABASE lojas_exemplo

/* CREATE TABLE filiais
	(cod SMALLINT NOT NULL,
	nome CHAR(50) NOT NULL,
	ender VARCHAR(50),
	CONSTRAINT pk_filiais
	PRIMARY KEY(cod)
	) */

/* CREATE TABLE vendedores
	(matr SMALLINT NOT NULL,
	nome VARCHAR(60) NOT NULL,
	cpf INT NOT NULL,
	ender VARCHAR(55) NOT NULL,
	salario DEC(11,2) NOT NULL,
	gerencia SMALLINT NULL,
	lotacao SMALLINT NOT NULL,
	CONSTRAINT pk_vendedores
	PRIMARY KEY(matr),
	CONSTRAINT cpf_unico
	UNIQUE(cpf),
	CONSTRAINT fk_gerencia
	FOREIGN KEY(gerencia)
	REFERENCES filiais
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT fk_lotacao
	FOREIGN KEY (lotacao)
	REFERENCES filiais
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT sal_minimo
	CHECK (salario > 1000)
) */

/*

ALTER TABLE filiais
ADD cnpj INT NOT NULL
CONSTRAINT cnpj_unico_filiais
UNIQUE (cnpj)
--,
-- contato VARCHAR (50)
*/

/* ALTER TABLE filiais
DROP CONSTRAINT cnpj_unico,
COLUMN cnpj,contato */

/* ALTER TABLE vendedores
ADD rg INT NOT NULL
CONSTRAINT rg_unico
UNIQUE (rg) */

/* CREATE TABLE fornecedores
	(cnpj INT NOT NULL,
	CONSTRAINT cnpj_unico
	UNIQUE(cnpj)
	) */


--select * from filiais
-- iNSERINDO TUPLAS
--INSERT INTO filiais VALUES ( 5, 'Pici', 'Campus do Pici', 2919)
--INSERT INTO filiais VALUES (2,'Recife', 'Rua X, 159', 33333)

--INSERT INTO vendedores
--VALUES (912, 'Maria', 93599, 'Rua W, 320', 6100, NULL,5, 92443416)


SELECT * FROM vendedores



INSERT INTO vendedores
VALUES(1313,'Fran',776, 'Rua U, 335', 2200, NULL, 5, 678)

--atualizar salario
UPDATE vendedores
SET salario=salario*1.15
WHERE lotacao=5

-- remover tuplas



create table historico
	(coditem smallint not null,
	matr smallint not null,
	qtde int not null,
	prven dec(10,2) not null,
	prcompra dec(10,2) not null,
	dthoraven datetime not null default getdate(),
	constraint pk_historico
	primary key (coditem, matr, dthoraven),
	constraint fk_historico_estoque
	foreign key (coditem) references estoque
	on delete no action on update cascade,
	constraint fk_historico_vendedores
	foreign key (matr) references vendedores
	on delete no action on update cascade
	)

select nome,lotacao, salario *1.15 from vendedores

select * from estoque
insert into estoque	
VALUES(4,'Skate Long Board',3,399.99,89.90,2)

INSERT INTO fornecedores
	VALUES (2,'Mercado C','Av Senador Pompeu',5573,'Sobral','CE',' Mãe Joana')
insert into historico values (4,912,2,34,getdate())
/*update estoque
set ref = 'Blusa'
where
cod=1
*/



select * from fornecedores
select * from vendedores



/*
ex slide 136
delete from estoque
where coditem =3

insert into historico values(3,13,1,399.90,getdate())
*/

alter table fornecedores add contato varchar(40) null
delete from fornecedores where cod <= 10

insert into fornecedores values(1,'asdad', 'Alameda dos maracatis',3535435, 'City satar', 'zs','Mr alf')
insert into filiais values (1,'sul','safddf',1313123)
insert into vendedores values (14,'ze',754654,'rua v',1340,1,4,124524)
select * from filiais
delete from filiais where cod=1


select * from fornecedores
insert into estoque values (7,1,5,1,1,2)


insert into historico values (2,912,1,1,getdate())

select filiais.nome from filiais, fornecedores as f where f.cidade = 'City satar'

select fi.nome
from filiais fi, vendedores v, historico h, estoque e, fornecedores f
where fi.cod = v.lotacao 
	and v.matr=h.matr 
	and h.coditem=e.coditem 
	and e.codforn=f.cod
	and f.cidade like '%C_'

	select * from filiais

select f.nome from fornecedores f, estoque e, historico h, vendedores v
where f.cod = e.codforn and h.matr=v.matr and v.salario > 4500


-- Matricula de vendedores que não venderam
SELECT matr FROM vendedores
EXCEPT
SELECT matr FROM historico

 -- (checar)Matrícula de vendedores que venderam:
select distinct matr from historico

-- A interseção entre as duas tabelas mostra os vendedores que realizaram vendas
SELECT matr FROM vendedores
INTERSECT
SELECT matr FROM historico

-- Listar Cód de forneced que não tiveram vendas
SELECT cod FROM fornecedores 
EXCEPT
--INTERSECT
SELECT codforn FROM historico h, estoque e
WHERE e.coditem = h.coditem
--Para checar:
SELECT distinct codforn FROM historico h, estoque e
WHERE e.coditem = h.coditem


-- Listar matríc de vendedores q n venderam produ de forn de SP

select * from fornecedores

SELECT v.matr FROM vendedores v
EXCEPT
SELECT v.matr FROM vendedores v, historico h, estoque e, fornecedores f
WHERE
	f.cod=e.codforn
	AND e.coditem=h.coditem
	AND h.matr=v.matr
	AND f.cidade like '%City satar'

-- Order By
--Listar vendedores ordenados por salário na ordem decrescentee por nome na ordem crescente
SELECT nome, salario FROM vendedores
ORDER BY salario DESC, nome

--Exercícios
-- Encontre o número de vendedores lotados na filial Recife
SELECT COUNT(*) FROM filiais f, vendedores v
WHERE 
	f.cod=v.lotacao
	AND f.nome = 'Recife'

select * from filiais
-- Encontre o montante na folha de pagamento da empresa
SELECT SUM(salario) FROM vendedores

-- Encontre o salário médio pago pela empresa
SELECT CAST(AVG(salario) as DECIMAL(6,2)) as 'Salário Médio'FROM vendedores

--Desafio
-- Encontre o número de vendedores que venderam itens de forn localizados na cidade Sobral
SELECT Count(v.matr) FROM vendedores v, historico h, estoque e, fornecedores f
WHERE
	f.cod=e.codforn
	AND e.coditem=h.coditem
	AND h.matr=v.matr
	AND f.cidade like '%Sobral'

-- Encontre a quant de itens vendidos que são fornecidos por fornecedores localizados na cidade de Sobral
SELECT sum(h.qtde) FROM  historico h, estoque e, fornecedores f
WHERE
	f.cod=e.codforn
	AND e.coditem=h.coditem

	AND f.cidade like '%Sobral'

	

	--Aula 18 Group by
	SELECT lotacao as 'Filial',
	COUNT(*) AS 'Número de vendedores'
	FROM vendedores
	GROUP BY lotacao

	SELECT lotacao, matr
	FROM vendedores
	ORDER BY lotacao

	SELECT f.nome as 'Filiail',
	COUNT(matr) as 'Número de Vendedores'
	FROM  vendedores v, filiais f
	WHERE lotacao = f.cod
	GROUP BY f.cod, f.nome

	/*Exercício: Listar maior e menor salário de cada filial. Deve aparecer o nome da filial, o maior sal e o menor*/
	SELECT f.nome AS 'Filial',
	MAX(salario) AS 'Maior salário',
	MIN(salario) AS 'Menor salário'
	FROM filiais f, vendedores v
	GROUP BY f.cod,f.nome
	ORDER BY 2 DESC

	/*Mostrar a quantidade de itens vendidos e o num de vendas por vendedor e por item
	O resultado deve estar associado pelo nome do vendedor*/
	SELECT v.nome as 'Vendedor', coditem,
	SUM(qtde) AS 'Quantidade vendida',
	COUNT(*) AS 'Número de Vendas'
	FROM  vendedores v, historico h
	WHERE v.matr=h.matr
	GROUP BY h.matr,v.nome,coditem 
	ORDER BY v.nome

	-- Cláusula Having

	/* Listar nome das filiais com média salarial maior que 2000, em ordem decrescente de média salarial*/
	SELECT f.nome AS 'Nome',
	AVG(salario) AS 'Média salarial'
	FROM filiais f, vendedores v
	WHERE f.cod=v.lotacao
	GROUP BY f.cod, f.nome  --média tds grupos ate aqui
		HAVING AVG(salario) >1260
	ORDER BY AVG(salario) desc

/*Listar nome e média salarial das filiais que possuem mais de 4 vendedores*/
SELECT f.nome,
CAST(AVG(salario) AS DECIMAL (11,2)) AS 'Média Salarial'
FROM filiais f, vendedores v
WHERE f.cod=v.lotacao
GROUP BY f.cod, f.nome
	HAVING COUNT(matr) > 4

/*Listar nome da filial e quantidade de vendedores das filiais cuja média sal é > 4000*/
SELECT f.nome as 'Nome da filial',
COUNT(*) as 'Qtd de Vendedores'
FROM filiais f, vendedores v
WHERE f.cod=v.lotacao
GROUP BY f.cod, f.nome
	HAVING AVG(salario) > 2000

/*Gerar relatorio com nome do vendedor que efetuou vendas, a qtd de vendas efetuadas
por ele e a qtd de itens vendidos, em ordem decrescente de qtd de vendas.
Só devem aparecer no relatório vendedores com volume de vendas superior a 1000*/
SELECT v.nome,
COUNT(*) AS 'Total de vendas'
FROM vendedores v, historico h
WHERE h.matr = v.matr
GROUP BY v.matr,v.nome
	HAVING SUM(h.qtde * h.prven) > 10
ORDER BY 2 desc


/*Listar nome dos fornecedores cujos itens foram vendidos em mais de duas filiais.
*/
SELECT fo.nome
FROM fornecedores fo,historico h
WHERE h.

/*Para cada item vendido, mostrar referencia do item, qtd vendida, valor total das vendas, 
num de vendas e nome do fornecedor. Só devem aparecer no relatório itens vendidos por mais 
de um vendedor.Resultado deve estar ordenado em ordem decrescente por valor total de vendas
e ordem crescente por referencia*/


select cod, nome, ender, tel, cidade, estado, isnull(Contato, 'Não informado') as 'Contato' from fornecedores


