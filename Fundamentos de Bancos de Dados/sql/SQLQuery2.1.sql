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


-- Encontre a quant de itens vendidos que são fornecidos por fornecedores localizados na cidade de Sobral
