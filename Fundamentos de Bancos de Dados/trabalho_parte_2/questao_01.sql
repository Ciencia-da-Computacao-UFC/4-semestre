-- Questão 01-)

-- Crie o banco de dados BDSpotPer, considerando o seguinte: o banco de dados
-- deve possuir três filegroups (tablespaces) e o arquivo de log. O filegroup primário
-- deve conter apenas o arquivo primário do banco de dados. Um segundo filegroup
-- deve conter dois arquivos e um terceiro deve conter apenas um arquivo

create database BDSpotPer
ON
	primary(
	name = 'BDSpotPer',
	filename = 'C:\SpotPer\BDSpotPer.mdf',
	size = 5120KB,
	filegrowth = 1024KB
	),

	filegroup pl_faixas_fg01(
	name = 'pl_faixas_001',
	filename = 'C:\SpotPer\pl_faixas_001.ndf',
	size = 1024KB,
	filegrowth = 15%
	),

	filegroup spot_fg02(
	name = 'spot_001',
	filename = 'C:\SpotPer\spot_001.ndf',
	size = 1024KB,
	filegrowth = 15%
	),
	(
	name = 'spot_002',
	filename = 'C:\SpotPer\spot_002.ndf',
	size = 1024KB,
	filegrowth = 15%
	)
	
	log on(
	name = 'BDSpotPer_log',
	filename = 'C:\SpotPer\BDSpotPer_log.ldf',
	size = 1024KB,
	filegrowth = 10%
	);