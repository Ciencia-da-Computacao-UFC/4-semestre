-- gravadora (codigo_gravadora, nome, endereco, url_website)
insert into gravadora values (1, 'Universal', '458 Boulervard St.', 'universal.com');
insert into gravadora values (2, 'Sony Music', '641 5 Avenue', 'sonymusic.com');
insert into gravadora values (3, 'Pop Music', '123 El Monte St.', 'popmusic.com');
insert into gravadora values (4, 'Warner Music', '12 Griffith St. ', 'warner.com');
insert into gravadora values (5, 'MGM', '4588 Wall St. ', 'mgm.com');


-- telefone (numero_telefone, codigo_gravadora)

Insert into telefone values ('+15891256598', 1);
Insert into telefone values ('+4588912585', 1);
Insert into telefone values ('+7854856598', 2);
Insert into telefone values ('+644464645767', 2);
Insert into telefone values ('+6342345455', 3);
Insert into telefone values ('+85961256598', 3);
Insert into telefone values ('+15891256598', 4);
Insert into telefone values ('+92756282348', 4);
Insert into telefone values ('+995891256598', 5);
Insert into telefone values ('+84348623755', 5);


-- album (codigo_album, tipo_compra, descricao, preco_compra, data_compra, data_gravacao, codigo_gravadora)

insert into album values (1, 'download', 'After Hours', 49.99, '2020-01-25', '2019-06-28', 2);
insert into album values (2, 'download', 'Classicos Vivaldi', 69.99, '2020-01-25', '2019-06-28', 1);
insert into album values (3, 'fisica', 'The Beethoven Album', 39.99, '2012-08-14', '1801-09-21', 1);
insert into album values (4, 'download', 'The Chopin Album', 69.99, '2021-01-25', '2013-06-28', 1);
insert into album values (5, 'fisica', 'Queen II', 39.99, '2012-08-14', '1973-03-08', 2);
insert into album values (6, 'fisica', 'Piano Trios', 19.99, '2011-08-14', '1801-09-21', 1);

-- composicao (codigo_composicao, descricao, tipo(sinfonia, opera, sonata, concerto etc))

insert into composicao values (1, 'Muito Elegante', 'Sinfonia');
insert into composicao values (2, 'Theatrical', 'opera');
insert into composicao values (3, 'Muito Bonito', 'Sonata');
insert into composicao values (4, 'Live in London', 'Concerto');
insert into composicao values (5, 'Italian Classics', 'Acapella');


-- faixa (codigo_album, numero_faixa, descricao, tipo_gravacao, tempo_execucao, codigo_composicao)

-- faixas do codigo_composicao = 4 e 

insert into faixa values (1, 1, 'Alone Again', 'ADD', 3450, 1);
insert into faixa values (1, 2, 'Too Late', 'DDD', 3450, 2);
insert into faixa values (1, 3, 'Hardest To Love', 'DDD', 3450, 3);
insert into faixa values (1, 4, 'Scared to Live', 'ADD', 3450, 4);
insert into faixa values (1, 5, 'Snowchild', 'ADD', 3450, 1);
insert into faixa values (1, 6, 'Escape From LA', 'ADD', 3450, 1);
insert into faixa values (1, 7, 'Heartless', 'ADD', 3450, 4);
insert into faixa values (1, 8, 'Faith', 'ADD', 3450, 3);
insert into faixa values (1, 9, 'Blinding Lights', 'DDD', 3450, 2);
insert into faixa values (1, 10, 'In Your Eyes', 'ADD', 3450, 2);
insert into faixa values (1, 11, 'Save Your Tears', 'DDD', 3450, 5);
insert into faixa values (1, 12, 'Repeat After Me', 'DDD', 3450, 3);
insert into faixa values (1, 13, 'After Hours', 'ADD', 3450, 4);
insert into faixa values (1, 14, 'Until I Bleed', 'ADD', 3450, 1);


insert into faixa values (2, 1, 'Dorilla in Tempe', 'ADD', 3250, 1);
insert into faixa values (2, 2, 'Griselda', 'ADD', 3450, 1);
insert into faixa values (2, 3, 'Di due rai languir costante', 'DDD', 3450,4);
insert into faixa values (2, 4, 'L Orlando Finto Pazzo', 'ADD', 8450, 2);
insert into faixa values (2, 5, 'Ercole sul Termodonte', 'ADD', 5450, 4);
insert into faixa values (2, 6, 'La Fida Ninfa', 'ADD', 3450, 4);
insert into faixa values (2, 7, 'Il Giustino / Act 2 Scene 13', 'ADD', 2450, 2);
insert into faixa values (2, 8, 'Il Farnace', 'ADD', 3450, 1);
insert into faixa values (2, 9, 'Il Bajazet', 'ADD', 3450, 2);

insert into faixa values (3, 1, 'Rage Over A Lost Penny, Op.129', 'ADD', 3450, 1);
insert into faixa values (3, 2, 'Vivace', 'DDD', 30450, 2);
insert into faixa values (3, 3, 'Thema. Allegretto', 'DDD', 3450, 3);
insert into faixa values (3, 4, 'Variation I', 'ADD', 13450, 4);
insert into faixa values (3, 5, 'Variation II', 'DDD', 40450, 1);
insert into faixa values (3, 6, 'Variation III', 'DDD', 1250, 1);
insert into faixa values (3, 7, 'Variation IV', 'ADD', 3450, 4);
insert into faixa values (3, 8, 'Variation V', 'ADD', 3450, 3);

insert into faixa values (4, 1, 'No. 1 in A-flat major', 'ADD', 3450, 2);
insert into faixa values (4, 2, 'op. 25: No. 2 in F minor', 'ADD', 3450, 2);
insert into faixa values (4, 3, 'No. 3 in F major', 'ADD', 3450, 2);
insert into faixa values (4, 4, 'op. 25: No. 4 in A minor', 'ADD', 3450, 2);
insert into faixa values (4, 5, 'op. 25: No. 5 in E minor', 'ADD', 3450, 2);
insert into faixa values (4, 6, 'op. 25: No. 6 in G-sharp minor Thirds', 'ADD', 3450, 2);
insert into faixa values (4, 7, 'No. 7 in C-sharp minor', 'ADD', 3450, 2);
insert into faixa values (4, 8, 'No. 8 in D-flat major', 'ADD', 3450, 2);



insert into faixa values (5, 1, 'Procession', 'DDD', 8450, 1);
insert into faixa values (5, 2, 'Father To Son', 'ADD', 3450, 2);
insert into faixa values (5, 3, 'White Queen', 'DDD', 3450, 3);
insert into faixa values (5, 4, 'Some Day One Day', 'DDD', 3450, 2);
insert into faixa values (5, 5, 'The Loser In The End', 'ADD', 3450, 1);
insert into faixa values (5, 6, 'Ogre Battle', 'ADD', 13450, 2);
insert into faixa values (5, 7, 'The Fairy Fellers', 'DDD', 3450, 4);
insert into faixa values (5, 8, 'Nevermore', 'ADD', 43450, 3);
insert into faixa values (5, 9, 'The March Of The Black Queen', 'DDD', 3450, 2);
insert into faixa values (5, 10, 'Funny How Love Is', 'ADD', 1850, 2);
insert into faixa values (5, 11, 'Save Your Tears', 'DDD', 1470, 5);


insert into faixa values (6, 1, 'Sinfonia n.º 9', 'DDD', 3450, 1);
insert into faixa values (6, 2, 'Cello Concerto', 'DDD', 3450, 1);
insert into faixa values (6, 3, 'Rusalka', 'DDD', 3450, 2);
insert into faixa values (6, 4, 'Symphony No. 8', 'DDD', 3450, 2);
insert into faixa values (6, 5, 'Serenade for Strings', 'DDD', 3450, 1);
insert into faixa values (6, 6, 'String Quartet No. 12', 'DDD', 3450, 4);
insert into faixa values (6, 7, 'Humoresques', 'DDD', 3450, 1);
insert into faixa values (6, 8, 'Stabat Mater', 'DDD', 3450, 3);
insert into faixa values (6, 9, 'Violin Concerto in A minor, Op. 53', 'DDD', 3450, 1);
insert into faixa values (6, 10, 'Piano Trio No. 4', 'DDD', 3450, 1);






-- compositor (id_compositor, nome, data_nascimento, data_morte, cidade, pais)

insert into compositor values (1, 'Louis S.T', '1864-01-28', NULL, 'London', 'England');
insert into compositor values (2, 'Chopin', '1864-01-28', '1930-02-23', 'Wellington', 'New Zealand');
insert into compositor values (3, 'Dvorack', '1995-02-12', NULL, 'Los Angeles', 'USA');
insert into compositor values (4, 'Barbra', '1965-01-28', NULL, 'New York', 'USA');
insert into compositor values (5, 'Vivaldi', '1975-07-25', '2002-08-12', 'Sao Paulo', 'Brazil');
insert into compositor values (6, 'Barth', '1864-01-28', '1930-02-23', 'London', 'England');
insert into compositor values (7, 'Beethoven', '1864-01-28', '1940-02-23', 'Milan', 'Italy');

-- compositor_faixa (id_compositor, codigo_album, numero_faixa)

-- compositores 1 e 3
insert into compositor_faixa values (1, 1, 1);
insert into compositor_faixa values (2, 1, 2);
insert into compositor_faixa values (3, 1, 3);
insert into compositor_faixa values (3, 1, 4);
insert into compositor_faixa values (4, 1, 5);
insert into compositor_faixa values (4, 1, 6);
insert into compositor_faixa values (5, 1, 7);
insert into compositor_faixa values (5, 1, 8);
insert into compositor_faixa values (6, 1, 9);
insert into compositor_faixa values (7, 1, 10);
insert into compositor_faixa values (6, 1, 11);
insert into compositor_faixa values (1, 1, 12);
insert into compositor_faixa values (2, 1, 13);
insert into compositor_faixa values (2, 1, 14);

insert into compositor_faixa values (1, 2, 1);
insert into compositor_faixa values (2, 2, 2);
insert into compositor_faixa values (3, 2, 3);
insert into compositor_faixa values (2, 2, 4);
insert into compositor_faixa values (1, 2, 5);
insert into compositor_faixa values (3, 2, 6);
insert into compositor_faixa values (2, 2, 7);
insert into compositor_faixa values (7, 2, 8);
insert into compositor_faixa values (2, 2, 9);

insert into compositor_faixa values (2, 3, 1);
insert into compositor_faixa values (3, 3, 2);
insert into compositor_faixa values (3, 3, 3);
insert into compositor_faixa values (2, 3, 4);
insert into compositor_faixa values (4, 3, 5);
insert into compositor_faixa values (4, 3, 6);
insert into compositor_faixa values (2, 3, 7);
insert into compositor_faixa values (7, 3, 8);

insert into compositor_faixa values (1, 4, 1);
insert into compositor_faixa values (2, 4, 2);
insert into compositor_faixa values (3, 4, 3);
insert into compositor_faixa values (4, 4, 4);
insert into compositor_faixa values (5, 4, 5);
insert into compositor_faixa values (6, 4, 6);
insert into compositor_faixa values (7, 4, 7);


insert into compositor_faixa values (1, 5, 1);
insert into compositor_faixa values (2, 5, 2);
insert into compositor_faixa values (3, 5, 3);
insert into compositor_faixa values (3, 5, 4);
insert into compositor_faixa values (4, 5, 5);
insert into compositor_faixa values (4,5, 6);
insert into compositor_faixa values (5, 5, 7);
insert into compositor_faixa values (5, 5, 8);
insert into compositor_faixa values (6, 5, 9);
insert into compositor_faixa values (7, 5, 10);
insert into compositor_faixa values (6, 5, 11);

insert into compositor_faixa values (1, 6, 1);
insert into compositor_faixa values (1, 6, 2);
insert into compositor_faixa values (3, 6, 3);
insert into compositor_faixa values (2, 6, 4);
insert into compositor_faixa values (5, 6, 5);
insert into compositor_faixa values (5, 6, 6);
insert into compositor_faixa values (5, 6, 7);
insert into compositor_faixa values (5, 6, 8);
insert into compositor_faixa values (7, 6, 9);
insert into compositor_faixa values (7, 6, 10);




-- interprete (codigo_interprete, nome, tipo(orquestra, trio, quarteto, ensemble, soprano, tenor, etc...))

insert into interprete values (1, 'John', 'Trio');
insert into interprete values (2, 'Daniel', 'Tenor');
insert into interprete values (3, 'Ricardo', 'Trio');
insert into interprete values (4, 'Rodrigo', 'Trio');
insert into interprete values (5, 'Arabell', 'Soprano');
insert into interprete values (6, 'Douglas', 'Tenor');
insert into interprete values (7, 'Fernanda', 'Soprano');
insert into interprete values (8, 'Marcos', 'Tenor');

-- faixa_interprete (codigo_album, numero_faixa, codigo_interprete)

insert into faixa_interprete values (1, 1, 1);
insert into faixa_interprete values (1, 2, 5);
insert into faixa_interprete values (2, 1, 2);
insert into faixa_interprete values (2, 2, 2);
insert into faixa_interprete values (2, 2, 4);
insert into faixa_interprete values (3, 1, 1);
insert into faixa_interprete values (3, 2, 2);
insert into faixa_interprete values (4, 1, 1);
insert into faixa_interprete values (5, 1, 3);

-- periodo_musical (codigo_periodo_musical, descricao, data_inicio, data_termino)
--(idade media, renascenca, barroco, classico, romantico e moderno)

insert into periodo_musical values (1, 'Idade Media', '1464-02-05', '1625-03-12');
insert into periodo_musical values (2, 'Classico', '1994-02-21', '1725-07-10');
insert into periodo_musical values (3, 'Barroco', '1964-04-15', '1825-08-11');
insert into periodo_musical values (4, 'Classico', '1464-02-05', '1625-07-12');
insert into periodo_musical values (5, 'Romantico', '1860-01-01', '1925-04-08');
insert into periodo_musical values (6, 'Moderno', '1960-09-15', NULL);

-- compositor_periodoM (codigo_periodo_musical, id_compositor)

insert into compositor_periodoM values (3, 1);
insert into compositor_periodoM values (2, 2);
insert into compositor_periodoM values (3, 3);
insert into compositor_periodoM values (4, 4);
insert into compositor_periodoM values (5, 5);
insert into compositor_periodoM values (6, 6);

-- playlist (codigo_playlist, nome, data_criacao, tempo_total_execucao)

insert into playlist values ('The Best Of Classic', '2020-05-08', NULL);
insert into playlist values ('Pop Songs', '2021-01-04', NULL);
insert into playlist values ('Vivaldi Favorites', '2018-10-17', NULL);
insert into playlist values ('Rock Music', '2021-03-01', NULL);
insert into playlist values ('Melhores do Concerto Barroco', '2021-03-01', NULL);

-- playlist_faixa (codigo_playlist, codigo_album, numero_faixa, numero_reproducoes,data_ultima_reproducao)

insert into playlist_faixa values (1, 2, 1, 25, '2021-02-03');
insert into playlist_faixa values (1, 2, 4, 25, '2021-02-03');
insert into playlist_faixa values (1, 2, 5, 25, '2021-02-03');
insert into playlist_faixa values (1, 3, 2, 25, '2021-02-03');
insert into playlist_faixa values (1, 4, 3, 25, '2021-02-03');
insert into playlist_faixa values (1, 4, 5, 25, '2021-02-03');


insert into playlist_faixa values (2, 1, 1, 25, '2021-02-03');
insert into playlist_faixa values (2, 1, 6, 25, '2021-02-03');
insert into playlist_faixa values (2, 1, 7, 25, '2021-02-03');
insert into playlist_faixa values (2, 1, 11, 25, '2021-02-03');
insert into playlist_faixa values (2, 1, 12, 25, '2021-02-03');


insert into playlist_faixa values (3, 2, 1, 25, '2021-02-03');
insert into playlist_faixa values (3, 2, 3, 25, '2021-02-03');
insert into playlist_faixa values (3, 2, 5, 25, '2021-02-03');
insert into playlist_faixa values (3, 2, 6, 25, '2021-02-03');
insert into playlist_faixa values (3, 2, 8, 25, '2021-02-03');


insert into playlist_faixa values (4, 5, 5, 25, '2021-02-03');
insert into playlist_faixa values (4, 5, 8, 25, '2021-02-03');
insert into playlist_faixa values (4, 5, 9, 25, '2021-02-03');

insert into playlist_faixa values (5, 2, 3, 25, '2021-02-03');
insert into playlist_faixa values (5, 2, 5, 25, '2021-02-03');
insert into playlist_faixa values (5, 2, 6, 25, '2021-02-03');






