/*

	Nome: Alexandre Solano Correia
	RA: 2102532

*/

/*
	Exercicio A
*/

SELECT * FROM Veiculo where idVeiculo = (210 - 32) / 2


/*
	Exercicio B
*/


CREATE TABLE VeiculoBackup
( 
  idVeiculo          smallint
, descricao          varchar(50) not null
, valor              decimal(9,2)not null
, dataCompra date not null
, idModelo           smallint null 
, idFabricante       tinyint  null 
, idAnoFabricacao    tinyint  null 
, constraint pkVeiculoBackup primary key (idVeiculo)
)

go

CREATE TABLE VendasAnuaisBackup
( 
  idVendas           int
, qtd                smallint not null 
, idVeiculo          smallint  null 
, idAnodaVenda       tinyint  null 
, idMesdaVenda       tinyint  null 
, constraint pkVendasAnuaisBackup primary key (idVendas)
, constraint fkVendasAnuais_idVeiculoBackup foreign key (idVeiculo) references VeiculoBackup(idVeiculo)
)

/*
	Exercicio C
*/


INSERT INTO VeiculoBackup
SELECT * FROM Veiculo

go

INSERT INTO VendasAnuaisBackup
SELECT * FROM VendasAnuais


/*
	Exercicio D
*/


/*Excluindo dados*/
SELECT * FROM VendasAnuais where idVeiculo = (210 - 32) / 2
go

DELETE VendasAnuais where idVeiculo = (210 - 32) / 2
go

SELECT * FROM Veiculo where idVeiculo = (210 - 32) / 2
go

DELETE Veiculo where idVeiculo = (210 - 32) / 2
go

/*Mostrando que os dados foram removidos*/
SELECT * FROM VendasAnuais where idVeiculo = (210 - 32) / 2
go

SELECT * FROM Veiculo where idVeiculo = (210 - 32) / 2



/*
	Exercicio E
*/


/*Adicionando o backup dos dados de volta na tabela*/
SET IDENTITY_INSERT [Veiculo] ON
 INSERT INTO [Veiculo] (idVeiculo,descricao, valor, dataCompra, idModelo , idFabricante, idAnoFabricacao) 
 SELECT  * FROM VeiculoBackup
 WHERE idVeiculo= (210 - 32) / 2
SET IDENTITY_INSERT [Veiculo] OFF

go


SET IDENTITY_INSERT [VendasAnuais] ON
 INSERT INTO [VendasAnuais] (idVendas, qtd, idVeiculo, idAnodaVenda, idMesdaVenda) 
 SELECT  * FROM VendasAnuaisBackup
 WHERE idVeiculo= (210 - 32) / 2
SET IDENTITY_INSERT [VendasAnuais] OFF

go

/*Mostrando que os dados foram inseridos novamente*/
SELECT * FROM VendasAnuais where idVeiculo = (210 - 32) / 2
go

SELECT * FROM Veiculo where idVeiculo = (210 - 32) / 2


/*
	Exercicio F
*/

drop table VendasAnuaisBackup
drop table VeiculoBackup
