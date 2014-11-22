/********************Crea vistas *******************************************************/
USE FlexCoreDataBase2;

go
CREATE VIEW ClientesFisicosView
AS select Cliente.CIF,Cliente.Estado,ClienteFisico.Nombre,ClienteFisico.Apellido,ClienteFisico.Cedula, Telefono.Telefono, Direccion.Direccion
	from ClienteFisico
		INNER JOIN Cliente   on Cliente.CIF = ClienteFisico.CIF
		INNER JOIN Telefono  on Telefono.idTelefono = ClienteFisico.idTelefonoPrincipal
		INNER JOIN Direccion on Direccion.idDireccion = ClienteFisico.idDireccionPrincipal
		where Cliente.Estado = 1

go
CREATE VIEW ClientesJuridicosView
AS select Cliente.CIF,Cliente.Estado,ClienteJuridico.Nombre,ClienteJuridico.Cedula, Telefono.Telefono, Direccion.Direccion
	from ClienteJuridico 
		INNER JOIN Cliente   on Cliente.CIF = ClienteJuridico.CIF
		INNER JOIN Telefono  on Telefono.idTelefono = ClienteJuridico.idTelefonoPrincipal
		INNER JOIN Direccion on Direccion.idDireccion = ClienteJuridico.idDireccionPrincipal
		where Cliente.Estado = 1

CREATE VIEW TranssaccionesVuelo
AS 
select FlexCoreDataBase2.dbo.TranssacionesVuelo.Fecha, FlexCoreDataBase2.dbo.TranssacionesVuelo.idTranssacion, FlexCoreDataBase2.dbo.TranssacionesVuelo.MontoTransferido,
	    FlexCoreDataBase2.dbo.TranssacionesVuelo.TipoTranssacion from FlexCoreDataBase2.dbo.TranssacionesVuelo

union 
	select FlexCoreDataBase.dbo.TranssacionesVuelo.Fecha, FlexCoreDataBase.dbo.TranssacionesVuelo.idTranssacion, FlexCoreDataBase.dbo.TranssacionesVuelo.MontoTransferido,
	    FlexCoreDataBase.dbo.TranssacionesVuelo.TipoTranssacion from FlexCoreDataBase.dbo.TranssacionesVuelo