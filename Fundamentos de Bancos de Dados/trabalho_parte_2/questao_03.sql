-- Questão 03-)

    -- a) Um álbum, com faixas de músicas do período barroco, só pode ser adquirido,
    -- caso o tipo de gravação seja DDD.

	-- drop trigger barroco_DDD
	-- create trigger barroco_DDD
	-- on faixa
	-- after insert
	-- as	
	-- begin
	-- declare @codigo_album int, @numero_faixa int, @test varchar(10)
	-- declare @temp_table table(tipo_gravacao varchar(10), periodo_musical varchar(20))
	
	-- set @codigo_album = (select codigo_album from inserted)
	-- set @numero_faixa = (select numero_faixa from inserted)

	-- insert into @temp_table (tipo_gravacao, periodo_musical) (select f.tipo_gravacao as tipo_gravacao, pm.descricao as periodo_muscal from 
	-- (((faixa f join compositor_faixa cf on cf.codigo_album = f.codigo_album and cf.numero_faixa = f.numero_faixa)
	-- join compositor c on c.id_compositor = cf.id_compositor)
	-- join compositor_periodoM cpm on cpm.id_compositor = c.id_compositor)
	-- join periodo_musical pm on pm.codigo_periodo_musical = cpm.codigo_periodo_musical
	-- where f.codigo_album = @codigo_album and f.numero_faixa = @numero_faixa
	-- )

	-- set @test = (select tipo_gravacao from @temp_table)
	-- print @test
	-- if((select tipo_gravacao from @temp_table) = 'ADD' 
	-- and (select periodo_musical from @temp_table) = 'Barroco')
	-- begin
	-- raiserror('Faixas do tipo Barroco precisam ter tipo de gravação DDD', 1, 1);
	-- rollback transaction;
	-- end
	-- end

	-- go

    -- b) Um álbum não pode ter mais que 64 faixas (músicas)

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



    -- c) No caso de remoção de um álbum do banco de dados, todas as suas faixas
    -- devem ser removidas. Lembre-se que faixas podem apresentar, por sua vez,
    -- outras associações.

    -- Na criação da tabela Faixa, a constraint faixa_codigo_album_fk garante que se um
    -- álbum for deletado, todas as suas faixas serão deletadas, pois cada faixa possui
    -- on delete cascade para a chave estrangeira codigo_album.

    -- constraint faixa_codigo_album_fk
    -- 		foreign key(codigo_album)
    -- 			references album
    -- 				on delete cascade
    -- 				on update cascade,