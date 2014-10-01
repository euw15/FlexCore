/*******************************************************************/
/*******************************************************************/
/************* Crear Procedimientos  Almacenados********************/
/*******************************************************************/
/*******************************************************************/
GO
USE FlexCoreDataBase;

/**********************Crea un Empleado Juridico *******************/
GO
CREATE PROCEDURE crearEmpleadoJuridico
	/*Parametros de entrada */
    @Nombre nvarchar(30), 
    @Cedula [int],
    @Telefono nvarchar(30),
    @Direccion nvarchar(300)
AS 
	declare @CIFGenerado [int] ,  		    /*Contiene CIF Generado */
	        @idDireccionGenerado [int],		/*Contiene id Direccion Generado */
		    @idTelefonoGenerado [int]		/*Contiene id Telefono generado */

	/*Inserta el clienteGenerico y obtiene el CIF*/
	INSERT INTO Cliente (idTipoCliente) values (1)
	SET @CIFGenerado = IDENT_CURRENT('Cliente')

	/*Inserta la direccion */
	INSERT INTO Direccion (Direccion) values (@Direccion)
	SET @idDireccionGenerado = IDENT_CURRENT('Direccion')

	/*Inserta el Telefono */
	INSERT INTO Telefono (Telefono) VALUES (@Telefono)
	SET @idTelefonoGenerado = IDENT_CURRENT('Telefono')

	/*Relaciona la Direccion con El Cliente */
	INSERT INTO DireccionXCliente (idDireccion,CIF) values (@idDireccionGenerado,@CIFGenerado)

	/*Relaciona el telefono con el cliente*/
	INSERT INTO TelefonoxCliente (idTelefono,CIF) values (@idTelefonoGenerado,@CIFGenerado)

	/*inserta en cliente juridico */
	INSERT INTO ClienteJuridico (CIF, Nombre,Cedula,idDireccionPrincipal,idTelefonoPrincipal) values (@CIFGenerado,@Nombre,@Cedula,@idDireccionGenerado,@idTelefonoGenerado);



/**********************Crea un Empleado Fisico *******************/

GO
CREATE PROCEDURE crearEmpleadoFisico
	/*Parametros de entrada */
    @Nombre nvarchar(30), 
    @Cedula [int],
    @Telefono nvarchar(30),
    @Direccion nvarchar(300),
    @Apellidos nvarchar(200)
AS 
	declare @CIFGenerado [int] ,  		    /*Contiene CIF Generado */
	        @idDireccionGenerado [int],		/*Contiene id Direccion Generado */
		    @idTelefonoGenerado [int]		/*Contiene id Telefono generado */

	/*Inserta el clienteGenerico y obtiene el CIF*/
	INSERT INTO Cliente (idTipoCliente) values (0)
	SET @CIFGenerado = IDENT_CURRENT('Cliente')

	/*Inserta la direccion */
	INSERT INTO Direccion (Direccion) values (@Direccion)
	SET @idDireccionGenerado = IDENT_CURRENT('Direccion')

	/*Inserta el Telefono */
	INSERT INTO Telefono (Telefono) VALUES (@Telefono)
	SET @idTelefonoGenerado = IDENT_CURRENT('Telefono')

	/*Relaciona la Direccion con El Cliente */
	INSERT INTO DireccionXCliente (idDireccion,CIF) values (@idDireccionGenerado,@CIFGenerado)

	/*Relaciona el telefono con el cliente*/
	INSERT INTO TelefonoxCliente (idTelefono,CIF) values (@idTelefonoGenerado,@CIFGenerado)

	/*inserta en cliente juridico */
	INSERT INTO ClienteFisico (CIF, Nombre,Apellidos,Cedula,idDireccionPrincipal,idTelefonoPrincipal) values (@CIFGenerado,@Nombre,@Apellidos,@Cedula,@idDireccionGenerado,@idTelefonoGenerado);


/*******************Consultar CLientes por concepto******************************/

CREATE PROCEDURE consultarClienteJuridicoPorConcepto
	/*Paramatros de entrada*/
	@Concepto nvarchar(200),
	@Dato 	  nvarchar(200)
AS
	IF @Concepto = 'Nombre'
		select 





