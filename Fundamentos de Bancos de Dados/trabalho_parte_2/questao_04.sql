-- Questão 04-)

-- Defina um índice primário para a tabela de Faixas sobre o atributo código do
-- álbum. Defina um índice secundário para a mesma tabela sobre o atributo tipo de
-- composição. Os dois com taxas de preenchimento máxima.

	create clustered index faixa_cod_album_index
	on faixa(codigo_album) 
	with fillfactor = 100

	go
	
	create nonclustered index faixa_composicao_index
	on faixa(codigo_composicao) 
	with fillfactor = 100