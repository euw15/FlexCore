/*******************************************************************/
/*******************************************************************/
/**********************  Crear Tablas y PK**************************/
/*******************************************************************/
/*******************************************************************/
/* Crear la base primero con el mismo nombre                        */
/*******************************************************************/
USE FlexCoreDataBase;

GO

CREATE TABLE [Cliente](
	[CIF] [int] Identity(1000000000,1) constraint pk_CIF_Cliente primary key,
	[idTipoCliente] [int] NOT NULL
)

/*******************************************************************/
GO
CREATE TABLE [Telefono](
	[idTelefono] [int] Identity(1,1) constraint pk_idTelefono_Telefono primary key,
	[Telefono] [nvarchar](15) NOT NULL,
)

/*******************************************************************/
GO
CREATE TABLE [TipoCliente](
	[idTipoCliente] [int] Identity(1,1) constraint pk_idTipoCliente_TipoCliente primary key,	
	[Nombre] [nvarchar](200)
)

/*******************************************************************/
GO
CREATE TABLE [TelefonoxCliente](
	[CIF] [int] not null,
	[idTelefono] [int] not null,
	CONSTRAINT pk_TelefonoXCliente PRIMARY KEY (CIF,idTelefono)
	)

/********************************************************************/
GO
CREATE TABLE [ClienteFisico](
	[idCLienteFisico] [int] Identity(1,2) constraint pk_idCliente_ClienteFisico primary key,
	[CIF] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Apellido] [nvarchar](30) NOT NULL,
	[idImagenCliente] [int],
	[Cedula] [nvarchar](30) NOT NULL,
	[idDireccionPrincipal] [int] NOT NULL,
	[idTelefonoPrincipal]  [int] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [ClienteJuridico](
	[idCLienteJuridico] [int] Identity(0,2) constraint pk_idCliente_ClienteJuridico primary key,
	[CIF] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Cedula] [nvarchar](30) NOT NULL,
	[idDireccionPrincipal] [int] NOT NULL,
	[idTelefonoPrincipal]  [int] NOT NULL
	)


/*******************************************************************/
GO
CREATE TABLE [Direccion](
	[idDireccion] [int] Identity(1,1) constraint pk_idDireccion_Direccion primary key,
	[Direccion] [nvarchar] (400) 
	)

/*******************************************************************/
GO
CREATE TABLE [DireccionXCliente](
	[idDireccion] [int] not null,
	[CIF] [int] not null,
	CONSTRAINT pk_DireccionXCliente PRIMARY KEY (idDireccion,CIF)
	)


/********************************************************************/
GO
CREATE TABLE [DocumentoxCliente](
	[CIF] [int] not null,
	[idDocumento] [int] not null,
	CONSTRAINT pk_DocumentosxCliente PRIMARY KEY (CIF,idDocumento)
	)

GO
CREATE TABLE [TipoMoneda](
	[idTipoMoneda] [int] Identity(1,1) constraint pk_idTipoMoneda_TipoMoneda primary key,
	[Moneda] [nvarchar](30) NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [CuentaDebito](
	[idCuentaDebito] [int] Identity(100000000,1) constraint pk_idCuentaDebito_CuentaDebito primary key,
	[idCliente] [int] NOT NULL,
	[Desripcion] [nvarchar](300) NOT NULL,
	[idTipoMoneda] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[SaldoReal] [money] NOT NULL,
	[SaldoFlotante] [money] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [Beneficiarios](
	[idCliente] [int] not null,
	[NumeroCuentaDebito] [int] NOT NULL,
	CONSTRAINT pk_Beneficiarios PRIMARY KEY (idCliente,NumeroCuentaDebito)
	)

/********************************************************************/
GO
CREATE TABLE [MetodoPago](
	[idMetodoPago] [int] Identity(1,1) constraint pk_PKMetogoPago_MetodoPago primary key,
	[NumeroCuentaDebito] [int] NOT NULL,
	[idDispositivo] [int] NOT NULL,
	[estado] [bit] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [Proposito](
	[idProposito] [int] Identity(1,1) constraint pk_idProposito_Proposito primary key,
	[Proposito] [nvarchar](200) NOT NULL,
	[TasaInteres] [int]
	)

/********************************************************************/
GO
CREATE TABLE [CuentaAhorro](
	[idCuentaAhorro] [int] Identity(1,1) constraint pk_idCuentaAhorro_CuentaAhorro primary key,
	[CIF] [int] NOT NULL,
	[NumeroCuentaDebito] [int] NOT NULL,
	[idProposito] [int] NOT NULL,
	[Periodicidad] [int] NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[DuracionAhorro] [int] NOT NULL,
	[FechaFinal] [datetime] NOT NULL,
	[MontoAhorro] [money] NOT NULL,
	[idTipoMoneda] [int] NOT NULL,
	[MontoAhorroActual] [money] NOT NULL,
	[MontoAhorroDeseado] [money] NOT NULL,
	[FechaProximoPago] [datetime] NOT NULL,
	[terminoAhorro] [bit] NOT NULL,
	[dominioPeriodicidad] [nvarchar](20)
	)

/********************************************************************/
GO
CREATE TABLE [TranssacionesVuelo](
	[idTranssacion] [int] Identity(1,1) constraint pk_idTranssacion_TranssacionesVuelo primary key,
	[NumeroCuenta] [int] NOT NULL,
	[TipoTranssacion] [nvarchar](100) NOT NULL,
	[MontoTransferido] [int]
	)

/********************************************************************/
GO
CREATE TABLE [Historico](
	[idTranssacion] [int] Identity(1,1) constraint pk_idTranssacion_Historico primary key,
	[NumeroCuenta] [int] NOT NULL,
	[TipoTranssacion] [nvarchar](100) NOT NULL,
	[MontoTransferido] [int]
	)

/********************************************************************/
GO
CREATE TABLE [Cierres](
	[idCierre] [int] Identity(1,1) constraint pk_idCierre_Cierres primary key,
	[FechaFinal] [datetime] NOT NULL
	)
/*********************************************************************/
GO
CREATE TABLE [Imagen] (
	[idImagen] [int] Identity(1,1) constraint pk_Imagen_idImagen primary key,
	[imagen] varchar(max)
	)


/*******************************************************************/
/*******************************************************************/
/**********************  Crear Llaves Primarias ********************/
/*******************************************************************/
/*******************************************************************/

/****************Crea funcion para numeroCuentas *******************/
/* Verifica el tipo de moneda en la insercion y le agrega el digito correspondiente */
go
create function GeneradorNumeroCuenta (@id int, @tipoMoneda int) 
returns int
	as begin 
		if @tipoMoneda = 2
			 return cast('8' + right('00000000' + convert(varchar(10), @id), 8) as int) 
		else
			 return cast('9' + right('00000000' + convert(varchar(10), @id), 8) as int)
	return 0;
	end

/* Agrega la funcion a numeroCuenta */
go
alter table CuentaDebito add numeroCuenta as dbo.GeneradorNumeroCuenta(idCuentaDebito,idTipoMoneda) 

/*Agrega la funcion a numeroCuenta */
go
alter table CuentaAhorro add numeroCuenta as dbo.GeneradorNumeroCuenta(idCuentaAhorro,idTipoMoneda) 


/********************Llaves Foraneas y demas ***********************/

/****Para Telefonos x Cliente *********/
GO
ALTER TABLE TelefonoxCliente 
ADD CONSTRAINT FK_TelefonoXCliente_idTelefono FOREIGN KEY (idTelefono) 
    REFERENCES Telefono (idTelefono) 

 ALTER TABLE TelefonoxCliente 
ADD CONSTRAINT FK_TelefonoXCLiente_CIF FOREIGN KEY (CIF) 
    REFERENCES Cliente (CIF) 


/******Para CLientes Juridicos ********************************/
GO
ALTER TABLE ClienteJuridico 
ADD CONSTRAINT FK_ClienteJuridico_CIF FOREIGN KEY (CIF) 
    REFERENCES Cliente (CIF) 

go
ALTER TABLE ClienteJuridico 
ADD CONSTRAINT FK_ClienteJuridico_DireccionPrincipal FOREIGN KEY (idDireccionPrincipal) 
    REFERENCES Direccion (idDireccion) 

go
ALTER TABLE ClienteJuridico 
ADD CONSTRAINT FK_ClienteJuridico_TelefonoPrincipal FOREIGN KEY (idTelefonoPrincipal) 
    REFERENCES Telefono (idTelefono) 


/******Para CLientes Fisico ********************************/
go
ALTER TABLE ClienteFisico 
ADD CONSTRAINT FK_ClienteFisico_DireccionPrincipal FOREIGN KEY (idDireccionPrincipal) 
    REFERENCES Direccion (idDireccion) 

go
ALTER TABLE ClienteFisico 
ADD CONSTRAINT FK_ClienteFisico_TelefonoPrincipal FOREIGN KEY (idTelefonoPrincipal) 
    REFERENCES Telefono (idTelefono) 

go
 ALTER TABLE ClienteFisico 
ADD CONSTRAINT FK_ClienteFisico_CIF FOREIGN KEY (CIF) 
    REFERENCES Cliente (CIF) 




/*******FK Para Cuenta de Debito ***********************************/

GO
ALTER TABLE CuentaDebito
ADD CONSTRAINT FK_CuentaDebito_idTipoMoneda FOREIGN KEY (idTipoMoneda) 
    REFERENCES TipoMoneda (idTipoMoneda) 

go
ALTER TABLE CuentaDebito
ADD CONSTRAINT FK_CuentaDebito_idCliente FOREIGN KEY (idCliente) 
    REFERENCES Cliente (CIF) 

/*******FK Beneficiarios ********************************************/

GO
ALTER TABLE Beneficiarios
ADD CONSTRAINT FK_Beneficiarios_idCliente FOREIGN KEY (idCliente) 
    REFERENCES Cliente (CIF) 

go
ALTER TABLE Beneficiarios
ADD CONSTRAINT FK_Beneficiarios_NumeroCuentaDebito FOREIGN KEY (NumeroCuentaDebito) 
    REFERENCES CuentaDebito (idCuentaDebito) 

/***********************FK Metodo de Pago *******************************/

GO
ALTER TABLE MetodoPago
ADD CONSTRAINT FK_MetodoPago_NumeroCuenta FOREIGN KEY (NumeroCuentaDebito)
	REFERENCES CuentaDebito (idCuentaDebito)


/***********************Cuenta de Ahorro *******************************/

GO
ALTER TABLE CuentaAhorro
ADD CONSTRAINT FK_CuentaAhorro_Proposito FOREIGN KEY (idProposito)
	REFERENCES Proposito (idProposito)

go
ALTER TABLE CuentaAhorro
ADD CONSTRAINT FK_CuentaAhorro_idCliente FOREIGN KEY (CIF)
	REFERENCES Cliente (CIF)

go
ALTER TABLE CuentaAhorro
ADD CONSTRAINT FK_CuentaAhorro_NumeroCuentaDebito FOREIGN KEY (NumeroCuentaDebito)
	REFERENCES CuentaDebito (idCuentaDebito)

/***********************Direccion por Cliente ******************************/

GO
ALTER TABLE DireccionXCliente
ADD CONSTRAINT FK_DireccionXCliente_CIF FOREIGN KEY (CIF)
	REFERENCES Cliente (CIF)

go
ALTER TABLE DireccionXCliente
ADD CONSTRAINT FK_DireccionXCliente_idDireccion FOREIGN KEY (idDireccion)
	REFERENCES Direccion (idDireccion)


/********************Crea vistas *******************************************************/

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


/*******************************************************************/
/*******************************************************************/
/************* Crear Procedimientos  Almacenados********************/
/*******************************************************************/
/*******************************************************************/

/**********************Crea un Empleado Juridico *******************/
GO
CREATE PROCEDURE crearEmpleadoJuridico
	/*Parametros de entrada */
    @Nombre nvarchar(30), 
    @Cedula nvarchar(30),
    @Telefono nvarchar(30),
    @Direccion nvarchar(300)
AS 
	declare @id [int] ,  		    /*Contiene CIF Generado */
	        @idDireccionGenerado [int],		/*Contiene id Direccion Generado */
		    @idTelefonoGenerado [int]		/*Contiene id Telefono generado */

	/*Inserta el clienteGenerico y obtiene el CIF*/
	INSERT INTO Cliente (idTipoCliente) values (1)
	SET @id = IDENT_CURRENT('Cliente')

	/*Inserta la direccion */
	INSERT INTO Direccion (Direccion) values (@Direccion)
	SET @idDireccionGenerado = IDENT_CURRENT('Direccion')

	/*Inserta el Telefono */
	INSERT INTO Telefono (Telefono) VALUES (@Telefono)
	SET @idTelefonoGenerado = IDENT_CURRENT('Telefono')

	/*Relaciona la Direccion con El Cliente */
	INSERT INTO DireccionXCliente (idDireccion,CIF) values (@idDireccionGenerado,@id)

	/*Relaciona el telefono con el cliente*/
	INSERT INTO TelefonoxCliente (idTelefono,CIF) values (@idTelefonoGenerado,@id)

	/*inserta en cliente juridico */
	INSERT INTO ClienteJuridico (CIF, Nombre,Cedula,idDireccionPrincipal,idTelefonoPrincipal) values (@id,@Nombre,@Cedula,@idDireccionGenerado,@idTelefonoGenerado);

	return @id;

/**********************Crea un Empleado Fisico *******************/

GO
CREATE PROCEDURE crearEmpleadoFisico
	/*Parametros de entrada */
    @Nombre nvarchar(30), 
    @Cedula nvarchar(30),
    @Telefono nvarchar(30),
    @Direccion nvarchar(300),
    @Apellidos nvarchar(200)
AS 
	declare @id [int] ,  		    /*Contiene CIF Generado */
	        @idDireccionGenerado [int],		/*Contiene id Direccion Generado */
		    @idTelefonoGenerado [int]		/*Contiene id Telefono generado */

	/*Inserta el clienteGenerico y obtiene el CIF*/
	INSERT INTO Cliente (idTipoCliente) values (0)
	SET @id = IDENT_CURRENT('Cliente')

	/*Inserta la direccion */
	INSERT INTO Direccion (Direccion) values (@Direccion)
	SET @idDireccionGenerado = IDENT_CURRENT('Direccion')

	/*Inserta el Telefono */
	INSERT INTO Telefono (Telefono) VALUES (@Telefono)
	SET @idTelefonoGenerado = IDENT_CURRENT('Telefono')

	/*Relaciona la Direccion con El Cliente */
	INSERT INTO DireccionXCliente (idDireccion,CIF) values (@idDireccionGenerado,@id)

	/*Relaciona el telefono con el cliente*/
	INSERT INTO TelefonoxCliente (idTelefono,CIF) values (@idTelefonoGenerado,@id)

	/*inserta en cliente juridico */
	INSERT INTO ClienteFisico (CIF, Nombre,Apellido,Cedula,idDireccionPrincipal,idTelefonoPrincipal) values (@id,@Nombre,@Apellidos,@Cedula,@idDireccionGenerado,@idTelefonoGenerado);

	return @id;

/*******************Consultar CLientes Juridicos por concepto******************************/
go
CREATE PROCEDURE consultarClienteJuridicoPorConcepto
	/*Paramatros de entrada*/
	@Concepto nvarchar(200),
	@Dato 	  nvarchar(200)
AS
	/*Dependiendo del Concepto por el cual se quiera realizar la consulta se busca */
	IF @Concepto = 'Nombre'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicos 
		where ClientesJuridicos.Nombre = @Dato
	IF @Concepto = 'Cedula'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicos 
		where ClientesJuridicos.Cedula = @Dato
	IF @Concepto = 'Direccion'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicos 
		where ClientesJuridicos.Direccion = @Dato
	IF @Concepto = 'Telefono'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicos 
		where ClientesJuridicos.Telefono = @Dato
	IF @Concepto = 'CIF'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicos 
		where ClientesJuridicos.CIF = @Dato;

/*******************Consultar CLientes Fisicos por concepto******************************/

Go
CREATE PROCEDURE consultarClienteFisicosPorConcepto
	/*Paramatros de entrada*/
	@Concepto nvarchar(200),
	@Dato 	  nvarchar(200)
AS
	/*Dependiendo del Concepto por el cual se quiera realizar la consulta se busca */
	IF @Concepto = 'Nombre'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicos 
		where ClientesFisicos.Nombre = @Dato
	IF @Concepto = 'Cedula'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicos 
		where ClientesFisicos.Cedula = @Dato
	IF @Concepto = 'Direccion'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicos 
		where ClientesFisicos.Direccion = @Dato
	IF @Concepto = 'Telefono'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicos 
		where ClientesFisicos.Telefono = @Dato
	IF @Concepto = 'CIF'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicos 
		where ClientesFisicos.CIF = @Dato;

/*********************** ver Clientes   Fisico ******************************/

go
CREATE PROCEDURE consultarClientesFisicos
	/*Paramatros de entrada*/
	@Cantidad int,
	@Inicio int
AS
	/*Consulta los clientes fisico en el rago deseado */
	SELECT CIF,Nombre,Apellido,Cedula, Telefono, Direccion FROM ( 
	  SELECT *, ROW_NUMBER() OVER (ORDER BY CIF) as row FROM ClientesFisico
	 ) a WHERE a.row > @Inicio and a.row <= @Inicio+@Cantidad


/*********************** ver Clientes   Juridico ******************************/
go
CREATE PROCEDURE consultarClientesJuridicos
	/*Paramatros de entrada*/
	@Cantidad int,
	@Inicio int
AS
	/*Consulta los clientes fisico en el rago deseado */
	SELECT CIF,Nombre,Cedula, Telefono, Direccion FROM ( 
	  SELECT *, ROW_NUMBER() OVER (ORDER BY CIF) as row FROM ClientesJuridicosView
	 ) a WHERE a.row > @Inicio and a.row <= @Inicio+@Cantidad

	
/********************* Crear Cuenta Debito ****************************************/
go
CREATE PROCEDURE crearCuentaDebito
	/****Parametros de entrada *****/
	@ClienteCIF nvarchar(11),
	@Descripcion nvarchar(200),
	@Moneda nvarchar(10)
AS
	/*Inserta la nueva cuenta de debito*/
	INSERT INTO CuentaDebito (idCliente,Desripcion,idTipoMoneda,Estado,SaldoReal,SaldoFlotante) values (@ClienteCIF,@Descripcion,@Moneda,1,0,0)

	declare @id int

	select @id=numeroCuenta from CuentaDebito where idCuentaDebito = IDENT_CURRENT('CuentaDebito')

	return @id;

/********************* Crear Cuenta Ahorro ****************************************/

go
CREATE PROCEDURE crearCuentaAhorro
	/****Parametros de entrada **********/
	@ClienteCIF nvarchar(11),
	@idProposito int,
	@Periodicidad int,
	@FechaInicio nvarchar(11),
	@FechaFinal nvarchar(11),
	@TiempoAhorro int,
	@MontoAhorro int,
	@NumeroCuentaOrigen int,
	@Moneda nvarchar(10),
	@DuracionAhorro int
AS
	
	
	/*Inserta la informacion de la cuenta de Ahorro */
	insert into CuentaAhorro (CIF, NumeroCuentaDebito,idProposito,Periodicidad,FechaInicio,FechaFinal,DuracionAhorro,MontoAhorro,idTipoMoneda)
		values (@ClienteCIF,@NumeroCuentaOrigen,@idProposito,@Periodicidad,@FechaInicio,@FechaFinal,@DuracionAhorro,@MontoAhorro,@Moneda)

	declare @id int

	select @id=numeroCuenta from CuentaAhorro where idCuentaAhorro = IDENT_CURRENT('CuentaAhorro')

	return @id;

/********************* Realizar Pago ****************************************/
go
CREATE PROCEDURE realizarPago
	/*Parametros de entrada *******/
	@NumeroCuentaDebito int,
	@NumeroCuentaDestino int,
	@MontoPago money
AS
		declare 
			@EstadoCuentaDebito bit,
			@EstadoCuentaDestino bit,
			@SaldoActualCuentaDebito money,
			@SaldoActualCuentaDestino money

		/*Pregunta por el estado de las cuentas */
		SELECT @EstadoCuentaDebito=Estado from CuentaDebito  where numeroCuenta= @NumeroCuentaDebito;
		SELECT @EstadoCuentaDestino=Estado from CuentaDebito  where numeroCuenta= @NumeroCuentaDestino;

		/*Si ambas cuentas estan activas realiza la operacion */
		IF (@EstadoCuentaDebito=1 and @EstadoCuentaDestino=1)
			begin
				select  @SaldoActualCuentaDebito=SaldoFlotante from CuentaDebito where numeroCuenta=@NumeroCuentaDebito
				select  @SaldoActualCuentaDestino=SaldoFlotante from CuentaDebito where numeroCuenta=@NumeroCuentaDestino
				/*Si tiene fondos suficientes realiza el pago*/
				IF(@SaldoActualCuentaDebito >= @MontoPago)
					begin
							update CuentaDebito set SaldoFlotante=@SaldoActualCuentaDebito-@MontoPago from CuentaDebito where numeroCuenta=@NumeroCuentaDebito
							update CuentaDebito set SaldoFlotante=@SaldoActualCuentaDestino+@MontoPago from CuentaDebito where numeroCuenta=@NumeroCuentaDestino
							return 1;
					end
				else
					return 0;
			end
		else
			return 0;

/********************* Consultar Propositos ****************************************/

GO
CREATE PROCEDURE consultarPropositos
	AS
		SELECT TOP 100 P.Proposito, P.TasaInteres from Proposito AS P

/********************* Agregar Imagenes USuario ***********************************/
GO 
CREATE PROCEDURE agregarImagenCliente
		@imagen varchar(max),
		@CIF int
	AS
		insert into Imagen (imagen) values (@imagen)

		update ClienteFisico set idImagenCliente= IDENT_CURRENT('Imagen') from ClienteFisico where CIF= @CIF;
