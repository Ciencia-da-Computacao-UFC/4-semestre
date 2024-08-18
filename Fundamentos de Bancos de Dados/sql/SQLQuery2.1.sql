-- Matricula de vendedores que n�o venderam
SELECT matr FROM vendedores
EXCEPT
SELECT matr FROM historico

 -- (checar)Matr�cula de vendedores que venderam:
select distinct matr from historico

-- A interse��o entre as duas tabelas mostra os vendedores que realizaram vendas
SELECT matr FROM vendedores
INTERSECT
SELECT matr FROM historico

-- Listar C�d de forneced que n�o tiveram vendas
SELECT cod FROM fornecedores 
EXCEPT
--INTERSECT
SELECT codforn FROM historico h, estoque e
WHERE e.coditem = h.coditem
--Para checar:
SELECT distinct codforn FROM historico h, estoque e
WHERE e.coditem = h.coditem


-- Listar matr�c de vendedores q n venderam produ de forn de SP

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
--Listar vendedores ordenados por sal�rio na ordem decrescentee por nome na ordem crescente
SELECT nome, salario FROM vendedores
ORDER BY salario DESC, nome

--Exerc�cios
-- Encontre o n�mero de vendedores lotados na filial Recife
SELECT COUNT(*) FROM filiais f, vendedores v
WHERE 
	f.cod=v.lotacao
	AND f.nome = 'Recife'

select * from filiais
-- Encontre o montante na folha de pagamento da empresa
SELECT SUM(salario) FROM vendedores

-- Encontre o sal�rio m�dio pago pela empresa
SELECT CAST(AVG(salario) as DECIMAL(6,2)) as 'Sal�rio M�dio'FROM vendedores

--Desafio
-- Encontre o n�mero de vendedores que venderam itens de forn localizados na cidade Sobral


-- Encontre a quant de itens vendidos que s�o fornecidos por fornecedores localizados na cidade de Sobral
