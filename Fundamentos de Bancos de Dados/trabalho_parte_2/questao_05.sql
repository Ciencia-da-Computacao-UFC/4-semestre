-- Questão 05-)

-- Criar uma visão materializada que tem como atributos o nome da playlist e a
-- quantidade de álbuns que a compõem.

	create view playlist_albums_view (nome_playlist, quantidade_albums)
	with schemabinding
	as
	select p.nome as 'Nome Playlist', count_big(distinct pf.codigo_album) as 'Número Albums' from
	dbo.playlist_faixa pf join dbo.playlist p on p.codigo_playlist = pf.codigo_playlist
	group by pf.codigo_playlist, p.nome


	go

	create unique clustered index I_playlist_albums_view
	on playlist_albums_view(nome_playlist);