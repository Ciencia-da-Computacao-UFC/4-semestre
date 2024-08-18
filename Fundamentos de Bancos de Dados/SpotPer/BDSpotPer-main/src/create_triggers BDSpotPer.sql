	-- Questão 3
	/*
	drop trigger barroco_DDD
	create trigger barroco_DDD
	on faixa
	after insert
	as	
	begin
	declare @codigo_album int, @numero_faixa int, @test varchar(10)
	declare @temp_table table(tipo_gravacao varchar(10), periodo_musical varchar(20))
	
	set @codigo_album = (select codigo_album from inserted)
	set @numero_faixa = (select numero_faixa from inserted)

	insert into @temp_table (tipo_gravacao, periodo_musical) (select f.tipo_gravacao as tipo_gravacao, pm.descricao as periodo_muscal from 
	(((faixa f join compositor_faixa cf on cf.codigo_album = f.codigo_album and cf.numero_faixa = f.numero_faixa)
	join compositor c on c.id_compositor = cf.id_compositor)
	join compositor_periodoM cpm on cpm.id_compositor = c.id_compositor)
	join periodo_musical pm on pm.codigo_periodo_musical = cpm.codigo_periodo_musical
	where f.codigo_album = @codigo_album and f.numero_faixa = @numero_faixa
	)
	--print (select * from @temp_table)

	set @test = (select tipo_gravacao from @temp_table)
	print @test
	if((select tipo_gravacao from @temp_table) = 'ADD' 
	and (select periodo_musical from @temp_table) = 'Barroco')
	begin
	raiserror('Faixas do tipo Barroco precisam ter tipo de gravação DDD', 1, 1);
	rollback transaction;
	end
	
	end

	go
	*/
	create trigger associa_compositor_periodoM
	on compositor 
	after insert
	as

	if not exists (select * from periodo_musical)
		begin
		insert into periodo_musical values (1, 'Idade Média', '1464-02-05', '1625-03-12');
		end

	insert into compositor_periodoM values (1, (select id_compositor from inserted));

	go

	create trigger album_tamanho_maximo
	on faixa 
	after insert
	as

	if((select count(*) from faixa f where f.codigo_album = (select codigo_album from inserted)) > 64 )
	begin
	raiserror('Álbum cheio. Álbum já contém 64 faixas.', 1, 1);
	rollback transaction;
	end

	go

	create trigger preco_compra_album_maximo
	on album 
	for insert
	as
	declare 
	@preco_compra decimal(9,2), @media_precos_albums_ddd_vezes_3 decimal(9,2);
	set @preco_compra = (select preco_compra from inserted);
	set @media_precos_albums_ddd_vezes_3 = (select cast(avg(f.preco_compra)*3 as Decimal(9,2)) from(
										select a.preco_compra from album a 
										join faixa f on a.codigo_album = f.codigo_album
										where f.tipo_gravacao = 'DDD'
										group by a.codigo_album, a.preco_compra
										) as f)

	if(@preco_compra > @media_precos_albums_ddd_vezes_3)
	begin
	raiserror('Preço de compra maior que 3 vezes a média de preços dos álbums DDD.', 1,1);
	rollback transaction;
	end


	-- Questão 05-)
	/*
	create view playlist_albums_view (nome_playlist, quantidade_albums)
	with schemabinding
	as
	select p.nome as 'Nome Playlist', count_big(distinct pf.codigo_album) as 'Número Álbums' from
	dbo.playlist_faixa pf join dbo.playlist p on p.codigo_playlist = pf.codigo_playlist
	group by pf.codigo_playlist, p.nome


	go

	create unique clustered index I_playlist_albums_view
	on playlist_albums_view(nome_playlist);
*/

	go

	create function buscar_albuns_por_compositor(@nome_compositor varchar(40))
	returns table
	as
	return
	select a.codigo_album, a.descricao from
	((album a join faixa f on a.codigo_album = f.codigo_album)
	join compositor_faixa cf on cf.codigo_album = f.codigo_album and cf.numero_faixa = f.numero_faixa )
	join compositor c on c.id_compositor = cf.id_compositor
	where c.nome like '%' + @nome_compositor+ '%'

	go

	-- consultas questao 8
	-- a)
	select a.codigo_album, a.descricao from
	album a 
	where a.preco_compra >
	(select avg(a.preco_compra) from album a)

	go

	--b)
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
	-- c)
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
	
	--d)
	go

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
	-- a ideia é listar todas as playlits com numero de faixas
	-- depois, fazer intersecção com as playlists filtradas
	go


	-- Questão 04-)
	drop index faixa_pk on faixa
	--go
	create clustered index faixa_cod_album_index
	on faixa(codigo_album) 
	with fillfactor = 100

	go
	create nonclustered index faixa_composicao_index
	on faixa(codigo_composicao) 
	with fillfactor = 100