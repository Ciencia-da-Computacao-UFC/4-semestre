-- Questão 06-)

-- Defina uma função que tem como parâmetro de entrada o nome (ou parte do)
-- nome do compositor e o parâmetro de saída todos os álbuns com obras
-- compostas pelo compositor.

	create function buscar_albuns_por_compositor(@nome_compositor varchar(40))
	returns table
	as
	return
	select a.codigo_album, a.descricao from
	((album a join faixa f on a.codigo_album = f.codigo_album)
	join compositor_faixa cf on cf.codigo_album = f.codigo_album and cf.numero_faixa = f.numero_faixa )
	join compositor c on c.id_compositor = cf.id_compositor
	where c.nome like '%' + @nome_compositor+ '%'