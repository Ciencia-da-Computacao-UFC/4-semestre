-- Questão 08-)

-- a-) Listar os álbum com preço de compra maior que a média de preços de compra
-- de todos os álbuns.

select a.codigo_album, a.descricao from
	album a 
	where a.preco_compra >
	(select avg(a.preco_compra) from album a)

	go

-- b) Listar nome da gravadora com maior número de playlists que possuem pelo
-- uma faixa composta pelo compositor Dvorack.

	select nome_gravadora as 'Nome Gravadora' from (
	select g.nome as nome_gravadora, count(*) as num_playlists from
	(((((gravadora g join album a on g.codigo_gravadora = a.codigo_gravadora)
	join faixa f on f.codigo_album = a.codigo_album)
	join playlist_faixa pf on pf.numero_faixa = f.numero_faixa and pf.codigo_album = f.codigo_album)
	join playlist p on p.codigo_playlist = pf.codigo_playlist)
	join compositor_faixa cf on cf.codigo_album = f.codigo_album and cf.numero_faixa = f.numero_faixa)
	join compositor c on c.id_compositor = cf.id_compositor
	where c.nome = 'Dvorack'
	group by g.codigo_gravadora, g.nome
	) as f1
	where num_playlists = (

	select max(num_playlists) from(
	select g.nome as nome_gravadora, count(*) as num_playlists from
	(((((gravadora g join album a on g.codigo_gravadora = a.codigo_gravadora)
	join faixa f on f.codigo_album = a.codigo_album)
	join playlist_faixa pf on pf.numero_faixa = f.numero_faixa and pf.codigo_album = f.codigo_album)
	join playlist p on p.codigo_playlist = pf.codigo_playlist)
	join compositor_faixa cf on cf.codigo_album = f.codigo_album and cf.numero_faixa = f.numero_faixa)
	join compositor c on c.id_compositor = cf.id_compositor
	where c.nome = 'Dvorack'
	group by g.codigo_gravadora, g.nome
	) as f
	)

	go

    -- c-) Listar nome do compositor com maior número de faixas nas playlists
    -- existentes.

    select nome_compositor as 'Nome Compositor' from (
	select c.nome as nome_compositor, count(*) as num_faixas from
	(((compositor c join compositor_faixa cf on cf.id_compositor = c.id_compositor)
	join faixa f on f.codigo_album = cf.codigo_album and f.numero_faixa = cf.numero_faixa)
	join playlist_faixa pf on pf.codigo_album = f.codigo_album and pf.numero_faixa = f.numero_faixa)
	group by c.id_compositor, c.nome
	) as f2
	where num_faixas =(
	select max(num_faixas) from (
	select count(*) as num_faixas from
	(((compositor c join compositor_faixa cf on cf.id_compositor = c.id_compositor)
	join faixa f on f.codigo_album = cf.codigo_album and f.numero_faixa = cf.numero_faixa)
	join playlist_faixa pf on pf.codigo_album = f.codigo_album and pf.numero_faixa = f.numero_faixa)
	group by c.id_compositor, c.nome
	) as f1
	)
    go


-- d-) Listar playlists, cujas faixas (todas) têm tipo de composição “Concerto” e
-- período “Barroco”.


	select codigo_playlist, nome from
	(select codigo_playlist, nome, count(*) as num_faixas from
	(select p.codigo_playlist, p.nome from
	((((((composicao ca join faixa f on f.codigo_composicao = ca.codigo_composicao)
	join compositor_faixa cf on cf.codigo_album = f.codigo_album and cf.numero_faixa = f.numero_faixa)
	join compositor co on co.id_compositor = cf.id_compositor)
	join compositor_periodoM cpm on cpm.id_compositor = co.id_compositor)
	join periodo_musical pm on pm.codigo_periodo_musical = cpm.codigo_periodo_musical)
	right outer join playlist_faixa pf on pf.codigo_album = f.codigo_album and pf.numero_faixa = f.numero_faixa)
	right outer join playlist p on p.codigo_playlist = pf.codigo_playlist
	group by p.codigo_playlist, p.nome, pf.codigo_album, pf.numero_faixa) as f1
	group by codigo_playlist, nome

	intersect 

	select codigo_playlist, nome, count(*) as num_faixas from
	(select p.codigo_playlist, p.nome from
	((((((composicao ca join faixa f on f.codigo_composicao = ca.codigo_composicao)
	join compositor_faixa cf on cf.codigo_album = f.codigo_album and cf.numero_faixa = f.numero_faixa)
	join compositor co on co.id_compositor = cf.id_compositor)
	join compositor_periodoM cpm on cpm.id_compositor = co.id_compositor)
	join periodo_musical pm on pm.codigo_periodo_musical = cpm.codigo_periodo_musical)
	right outer join playlist_faixa pf on pf.codigo_album = f.codigo_album and pf.numero_faixa = f.numero_faixa)
	right outer join playlist p on p.codigo_playlist = pf.codigo_playlist
	where ca.tipo = 'Concerto' and pm.descricao = 'Barroco'
	group by p.codigo_playlist, p.nome, f.codigo_album, f.numero_faixa) as b
	group by codigo_playlist, nome
	) as a
	go
