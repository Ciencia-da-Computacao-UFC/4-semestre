-- Quest�o 2-)

create table gravadora(
	codigo_gravadora int,
	nome varchar(50),
	endereco varchar(100),
	URL_website varchar(1000),
	constraint gravadora_pk
		primary key(codigo_gravadora)
	) on spot_fg02;

	create table telefone(
	numero_telefone varchar(20),
	codigo_gravadora int,
	constraint gravadora_tel_fk
		foreign key (codigo_gravadora) 
		references gravadora
		on delete cascade
		on update cascade
	) on spot_fg02;

	create table album(
	codigo_album int,
	tipo_compra varchar(10),
	descricao varchar(100),
	preco_compra decimal(9,2),
	data_compra date,
	data_gravacao date,
	codigo_gravadora int,
	constraint data_compra_check
		check(data_compra > '2000-01-01' ),
	constraint tipo_compra_check
		check(tipo_compra in ('fisica', 'download')),
	constraint album_pk
		primary key (codigo_album),
	constraint album_grav_fk
		foreign key (codigo_gravadora)
			references gravadora
				on delete cascade
				on update cascade
	) on spot_fg02;

	create table composicao(
	codigo_composicao int,
	descricao varchar(100) not null,
	tipo varchar(20) not null,
	constraint composicao_pk
		primary key(codigo_composicao)
	) on spot_fg02;

	create table faixa(
	codigo_album int,
	numero_faixa int,
	descricao varchar(100),
	tipo_gravacao varchar(5),
	tempo_execucao int,
	codigo_composicao int not null,
	constraint tipo_gravacao_check
		check(tipo_gravacao in ('ADD', 'DDD')),
	constraint faixa_pk
		primary key(codigo_album, numero_faixa),
	constraint faixa_codigo_album_fk
		foreign key(codigo_album)
			references album
				on delete cascade
				on update cascade,
	constraint composicao_faixa_fk
		foreign key(codigo_composicao)
			references composicao
				on delete cascade
				on update cascade

) on pl_faixas_fg01;

	create table compositor(
	id_compositor int,
	nome varchar(50),
	data_nascimento date,
	data_morte date,
	cidade varchar(50),
	pais varchar(30),
	constraint compositor_pk
		primary key (id_compositor)	
	) on spot_fg02;

	create table compositor_faixa(
	id_compositor int,
	codigo_album int,
	numero_faixa int,
	constraint compositor_faixa_pk
		primary key(id_compositor, codigo_album, numero_faixa),
	constraint album_faixa_fk
		foreign key(codigo_album, numero_faixa)
			references faixa(codigo_album, numero_faixa)
				on delete cascade
				on update cascade,
	constraint compositor_faixa_compositor_fk
		foreign key (id_compositor)
			references compositor
			on delete cascade
			on update cascade
			
	) on spot_fg02;

	
	create table interprete(
	codigo_interprete int,
	nome varchar(50),
	tipo varchar(20),
	constraint interprete_pk
		primary key(codigo_interprete)
	) on spot_fg02;

	create table faixa_interprete(
	codigo_album int,
	numero_faixa int,
	codigo_interprete int,
	constraint faixa_interprete_pk
		primary key(codigo_album, numero_faixa, codigo_interprete),
	constraint faixa_interprete_interprete_fk
		foreign key(codigo_interprete)
			references interprete
				on delete cascade
				on update cascade
			,
	constraint faixa_interprete_faixa_fk
		foreign key (codigo_album, numero_faixa)
			references faixa(codigo_album, numero_faixa)
				on delete cascade
				on update cascade
	) on spot_fg02;

	create table periodo_musical(
	codigo_periodo_musical int,
	descricao varchar(100),
	data_inicio date,
	data_termino date,
	constraint periodo_musical_pk
		primary key(codigo_periodo_musical)
	) on spot_fg02;

	create table compositor_periodoM(
	codigo_periodo_musical int default 1,
	id_compositor int,
	constraint compositor_periodoM_pk
		primary key(codigo_periodo_musical, id_compositor),
	constraint compositor_periodoM_cpm_fk
		foreign key (codigo_periodo_musical)
			references periodo_musical
				on delete cascade
				on update cascade
			,
	constraint compositor_periodoM_compositor_fk
		foreign key(id_compositor)
			references compositor
				on delete cascade
				on update cascade
	) on spot_fg02;

	create table playlist(
	codigo_playlist int IDENTITY(1,1),
	nome varchar(50),
	data_criacao date,
	tempo_total_execucao int,
	constraint playlist_pk
		primary key(codigo_playlist)
	) on pl_faixas_fg01;

	create table playlist_faixa(
	codigo_playlist int,
	codigo_album int,
	numero_faixa int,
	numero_reproducoes int,
	data_ultima_reproducao date,
	constraint playlist_faixa_pk
		primary key(codigo_playlist, codigo_album, numero_faixa),
	constraint playlist_faixa_playlist_fk
		foreign key(codigo_playlist)
			references playlist
				on delete cascade
				on update cascade,
	constraint playlist_faixa_faixa_fk
		foreign key(codigo_album, numero_faixa)
			references faixa(codigo_album, numero_faixa)
				on delete cascade
				on update cascade
	) on pl_faixas_fg01;