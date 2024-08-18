-- Quest�o 01)
create database BDSpotPer
ON
	primary(
	name = 'BDSpotPer',
	filename = '/Users/douglasgondim/Documents/apps/BDSpotPer/BDSpotPer.mdf',
	size = 5120KB,
	filegrowth = 1024KB
	),

	filegroup pl_faixas_fg01(
	name = 'pl_faixas_001',
	filename = '/Users/douglasgondim/Documents/apps/BDSpotPer/pl_faixas_001.ndf',
	size = 1024KB,
	filegrowth = 15%
	),

	filegroup spot_fg02(
	name = 'spot_001',
	filename = '/Users/douglasgondim/Documents/apps/BDSpotPer/spot_001.ndf',
	size = 1024KB,
	filegrowth = 15%
	),
	(
	name = 'spot_002',
	filename = '/Users/douglasgondim/Documents/apps/BDSpotPer/spot_002.ndf',
	size = 1024KB,
	filegrowth = 15%
	)
	
	log on(
	name = 'BDSpotPer_log',
	filename = '/Users/douglasgondim/Documents/apps/BDSpotPer/BDSpotPer_log.ldf',
	size = 1024KB,
	filegrowth = 10%
	);
go