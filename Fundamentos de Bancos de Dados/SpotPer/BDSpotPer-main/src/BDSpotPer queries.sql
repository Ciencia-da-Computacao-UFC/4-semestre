/*
select cast(avg(f.preco_compra)*3 as Decimal(9,2)) from(
select a.preco_compra from album a 
join faixa f on a.codigo_album = f.codigo_album
where f.tipo_gravacao = 'DDD'
group by a.codigo_album, a.preco_compra
) as f


select * from album a 
join faixa f on a.codigo_album = f.codigo_album
where f.tipo_gravacao = 'DDD'
*/

delete from album where codigo_album = 1;

delete from faixa where codigo_album = 1 and numero_faixa = 1;



select * from faixa;
select * from composicao;

select * from compositor;

insert into compositor values (9, 'Michael', '1321-05-28', '1405-08-25', 'Rome', 'Italy');

select * from compositor_periodoM;

select * from periodo_musical;

drop table periodo_musical;

drop table compositor_periodoM;

select count(*) from faixa f where f.codigo_album = 2;

select * from (playlist_faixa pf join faixa f on f.codigo_album = pf.codigo_album and f.numero_faixa = pf.numero_faixa) join album a on a.codigo_album = f.codigo_album where codigo_playlist = 1