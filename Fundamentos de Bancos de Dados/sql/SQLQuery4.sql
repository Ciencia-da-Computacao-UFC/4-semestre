/* SELECT
	class,
	SUM(sepal_lenght) AS total_comprimento_sepalas,
	AVG(sepal_lenght) AS media_comprimento_sepalas,
	COUNT(sepal_lenght) AS quantidade_sepalas
FROM
	iris
GROUP BY
	class
*/

/* SELECT
	*
FROM
	iris
WHERE
	(class = 'Iris-setosa'
	OR class = 'Iris-virginica')
	AND petal_length >= 1.3
*/

/* SELECT
	*
FROM
	iris
WHERE
	class <> 'Iris-setosa'
*/

/*
SELECT
	*
FROM
	iris
WHERE
	class = 'Iris-virginica'
	AND (petal_width >= 2 OR sepal_lenght > 3) */


-- Criando tabelas e inserindo dados
