/********************Crea vistas *******************************************************/
USE FlexCoreDataBase;

go
CREATE VIEW ClientesFisicos
AS select Cliente.CIF,ClienteFisico.Nombre,ClienteFisico.Cedula, Telefono.Telefono, Direccion.Direccion
	from ClienteFisico 
		INNER JOIN Cliente   on Cliente.CIF = ClienteFisico.CIF
		INNER JOIN Telefono  on Telefono.idTelefono = ClienteFisico.idTelefonoPrincipal
		INNER JOIN Direccion on Direccion.idDireccion = ClienteFisico.idDireccionPrincipal

go
CREATE VIEW ClientesJuridicos
AS select Cliente.CIF,ClienteJuridico.Nombre,ClienteJuridico.Cedula, Telefono.Telefono, Direccion.Direccion
	from ClienteJuridico 
		INNER JOIN Cliente   on Cliente.CIF = ClienteJuridico.CIF
		INNER JOIN Telefono  on Telefono.idTelefono = ClienteJuridico.idTelefonoPrincipal
		INNER JOIN Direccion on Direccion.idDireccion = ClienteJuridico.idDireccionPrincipal