/********************Crea vistas *******************************************************/
USE FlexCoreDataBase;

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