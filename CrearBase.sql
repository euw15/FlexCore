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
	[idTipoCliente] [int] NOT NULL,
	[Estado] [bit]
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
	[idDispositivo] [bigint] NOT NULL,
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
	[MontoTransferido] [int],
	[Fecha] [datetime] DEFAULT GETDATE()
	)

/********************************************************************/
GO
CREATE TABLE [Historico](
	[idTranssacion] [int] Identity(1,1) constraint pk_idTranssacion_Historico primary key,
	[NumeroCuenta] [int] NOT NULL,
	[TipoTranssacion] [nvarchar](100) NOT NULL,
	[MontoTransferido] [int],
	[Fecha] [datetime]
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

ALTER TABLE ClienteJuridico 
ADD CONSTRAINT FK_ClienteJuridico_DireccionPrincipal FOREIGN KEY (idDireccionPrincipal) 
    REFERENCES Direccion (idDireccion) 

ALTER TABLE ClienteJuridico 
ADD CONSTRAINT FK_ClienteJuridico_TelefonoPrincipal FOREIGN KEY (idTelefonoPrincipal) 
    REFERENCES Telefono (idTelefono) 


/******Para CLientes Fisico ********************************/
ALTER TABLE ClienteFisico 
ADD CONSTRAINT FK_ClienteFisico_DireccionPrincipal FOREIGN KEY (idDireccionPrincipal) 
    REFERENCES Direccion (idDireccion) 

ALTER TABLE ClienteFisico 
ADD CONSTRAINT FK_ClienteFisico_TelefonoPrincipal FOREIGN KEY (idTelefonoPrincipal) 
    REFERENCES Telefono (idTelefono) 

 ALTER TABLE ClienteFisico 
ADD CONSTRAINT FK_ClienteFisico_CIF FOREIGN KEY (CIF) 
    REFERENCES Cliente (CIF) 




/*******FK Para Cuenta de Debito ***********************************/

GO
ALTER TABLE CuentaDebito
ADD CONSTRAINT FK_CuentaDebito_idTipoMoneda FOREIGN KEY (idTipoMoneda) 
    REFERENCES TipoMoneda (idTipoMoneda) 


ALTER TABLE CuentaDebito
ADD CONSTRAINT FK_CuentaDebito_idCliente FOREIGN KEY (idCliente) 
    REFERENCES Cliente (CIF) 

/*******FK Beneficiarios ********************************************/

GO
ALTER TABLE Beneficiarios
ADD CONSTRAINT FK_Beneficiarios_idCliente FOREIGN KEY (idCliente) 
    REFERENCES Cliente (CIF) 


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


ALTER TABLE CuentaAhorro
ADD CONSTRAINT FK_CuentaAhorro_idCliente FOREIGN KEY (CIF)
	REFERENCES Cliente (CIF)


ALTER TABLE CuentaAhorro
ADD CONSTRAINT FK_CuentaAhorro_NumeroCuentaDebito FOREIGN KEY (NumeroCuentaDebito)
	REFERENCES CuentaDebito (idCuentaDebito)

/***********************Direccion por Cliente ******************************/

GO
ALTER TABLE DireccionXCliente
ADD CONSTRAINT FK_DireccionXCliente_CIF FOREIGN KEY (CIF)
	REFERENCES Cliente (CIF)

ALTER TABLE DireccionXCliente
ADD CONSTRAINT FK_DireccionXCliente_idDireccion FOREIGN KEY (idDireccion)
	REFERENCES Direccion (idDireccion)

/**********************Imagenes por Cliente ********************************/

GO
ALTER TABLE ClienteFisico
	ADD CONSTRAINT FK_IdImagen_ClienteFisico FOREIGN KEY (idImagenCliente)
		REFERENCES Imagen (idImagen)



/********************Crea vistas *******************************************************/
USE FlexCoreDataBase;

go
CREATE VIEW ClientesFisicosView
AS select Cliente.CIF,ClienteFisico.Nombre,ClienteFisico.Apellido,ClienteFisico.Cedula, Telefono.Telefono, Direccion.Direccion
	from ClienteFisico
		INNER JOIN Cliente   on Cliente.CIF = ClienteFisico.CIF
		INNER JOIN Telefono  on Telefono.idTelefono = ClienteFisico.idTelefonoPrincipal
		INNER JOIN Direccion on Direccion.idDireccion = ClienteFisico.idDireccionPrincipal

go
CREATE VIEW ClientesJuridicosView
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

	select @id as id;

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

	select @id as id;

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
		from ClientesJuridicosView 
		where ClientesJuridicosView.Nombre = @Dato
	IF @Concepto = 'Cedula'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicosView 
		where ClientesJuridicosView.Cedula = @Dato
	IF @Concepto = 'Direccion'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicosView 
		where ClientesJuridicosView.Direccion = @Dato
	IF @Concepto = 'Telefono'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicosView 
		where ClientesJuridicosView.Telefono = @Dato
	IF @Concepto = 'CIF'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesJuridicosView 
		where ClientesJuridicosView.CIF = @Dato;

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
		from ClientesFisicosView 
		where ClientesFisicosView.Nombre = @Dato
	IF @Concepto = 'Cedula'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicosView 
		where ClientesFisicosView.Cedula = @Dato
	IF @Concepto = 'Direccion'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicosView 
		where ClientesFisicosView.Direccion = @Dato
	IF @Concepto = 'Telefono'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicosView 
		where ClientesFisicosView.Telefono = @Dato
	IF @Concepto = 'CIF'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicosView 
		where ClientesFisicosView.CIF = @Dato;
	IF @Concepto = 'Apellido'
		select CIF,Nombre,Cedula, Telefono, Direccion
		from ClientesFisicosView 
		where ClientesFisicosView.Apellido = @Dato;

/*********************** ver Clientes   Fisico ******************************/

go
CREATE PROCEDURE consultarClientesFisicos
	/*Paramatros de entrada*/
	@Cantidad int,
	@Inicio int
AS
	/*Consulta los clientes fisico en el rago deseado */
	SELECT CIF,Nombre,Apellido,Cedula, Telefono, Direccion FROM ( 
	  SELECT *, ROW_NUMBER() OVER (ORDER BY CIF) as row FROM ClientesFisicosView
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

	select numeroCuenta as id from CuentaDebito where idCuentaDebito = IDENT_CURRENT('CuentaDebito')


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
	@MontoAhorroPeriodico int,
	@NumeroCuentaOrigen int,
	@Moneda nvarchar(11),
	@dominioPeriodicidad nvarchar(11),
	@MontoAhorroDeseado int
AS
	
	declare @idNumeroCuentaDebito int

	select @idNumeroCuentaDebito=idCuentaDebito from CuentaDebito where numeroCuenta= @NumeroCuentaOrigen
	/*Inserta la informacion de la cuenta de Ahorro */
	insert into CuentaAhorro (CIF, NumeroCuentaDebito,idProposito,Periodicidad,FechaInicio,FechaFinal,FechaProximoPago,DuracionAhorro,
		MontoAhorro,idTipoMoneda,MontoAhorroActual,dominioPeriodicidad,terminoAhorro,MontoAhorroDeseado)
		values (@ClienteCIF,@idNumeroCuentaDebito,@idProposito,@Periodicidad,@FechaInicio,@FechaFinal,@FechaInicio,@TiempoAhorro,
			@MontoAhorroPeriodico,@Moneda,0,@dominioPeriodicidad,0,@MontoAhorroDeseado)

	declare @id int

	select numeroCuenta as id from CuentaAhorro where idCuentaAhorro = IDENT_CURRENT('CuentaAhorro')


/********************* Realizar Pago ****************************************/
go
CREATE PROCEDURE realizarPago
	/*Parametros de entrada *******/
	@NumeroCuentaDebito int,
	@NumeroCuentaDestino int,
	@MontoPago money
AS
		declare
			@id int,
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
							insert into TranssacionesVuelo (NumeroCuenta,TipoTranssacion,MontoTransferido) values (@NumeroCuentaDebito,'Debito',@MontoPago)
							insert into TranssacionesVuelo (NumeroCuenta,TipoTranssacion,MontoTransferido) values (@NumeroCuentaDestino,'Credito',@MontoPago)
							set @id=1
					end
				else
					set @id=0
			end
		else
			set @id=0
		
		select @id as id;

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

/******************* Crear Job que revisa saldos **********************************/
GO
CREATE PROCEDURE pagosAutomaticos
as
	declare @numeroCuenta int,
			@FechaProximaPago datetime,
			@MontoAhorro money,
			@Periodicidad int,
			@MontoAhorroActual money,
			@MontoAhorroDeseado money,
			@TerminoAhorro bit,
			@NumeroCuentaDebito int,
			@FechaFinal dateTime,
			@dominioPeriodicidad [nvarchar](100)

	select @numeroCuenta = min(numeroCuenta) from CuentaAhorro

	while @numeroCuenta is not null
	begin
		/*Selecciona todas las variables de la cuenta actual */
	    select @dominioPeriodicidad= dominioPeriodicidad , @FechaFinal=FechaFinal, @NumeroCuentaDebito=NumeroCuentaDebito , @FechaProximaPago=FechaProximoPago , @MontoAhorro=MontoAhorro ,@Periodicidad=Periodicidad , @MontoAhorroActual=MontoAhorroActual, @MontoAhorroDeseado=MontoAhorroDeseado, @TerminoAhorro=terminoAhorro
	    		 from CuentaAhorro where numeroCuenta = @numeroCuenta
	    
	    /*Pregunta si ya debe hacer el pago y que la cuenta no haya finalizado su tiempo*/
	    IF(GETDATE()>=@FechaProximaPago and @TerminoAhorro=0)
	    	begin
	    		declare @fondosCuentaDebito int
	    		select @fondosCuentaDebito=SaldoFlotante from CuentaDebito where idCuentaDebito = @NumeroCuentaDebito
	    			/*Si tiene fondos suficientes */
	    			if(@fondosCuentaDebito>=@MontoAhorro)
	    				begin
	    					update CuentaAhorro set MontoAhorroActual= @MontoAhorroActual+@MontoAhorro where numeroCuenta = @numeroCuenta
	    					update CuentaDebito set SaldoFlotante = @fondosCuentaDebito-@MontoAhorro where idCuentaDebito = @NumeroCuentaDebito
	    					if(@dominioPeriodicidad = 'segundos')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(second,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    					if(@dominioPeriodicidad = 'minutos')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(minute,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    					if(@dominioPeriodicidad = 'horas')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(hour,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    					if(@dominioPeriodicidad = 'dias')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(day,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    					if(@dominioPeriodicidad = 'meses')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(month,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    				end

	    			/***Verifica si ya termino ya sea por fecha y por que alcanzo objetivo *******/
	    			if(GETDATE()>@FechaFinal or (@MontoAhorroActual+@MontoAhorro)>=@MontoAhorroDeseado)
	    				begin
	    					update CuentaAhorro set terminoAhorro= 1 where numeroCuenta = @numeroCuenta;
	    				end

				select @numeroCuenta = min( numeroCuenta ) from CuentaAhorro where numeroCuenta > @numeroCuenta
	    	end
	    else
	    	begin
	    		select @numeroCuenta = min( numeroCuenta ) from CuentaAhorro where numeroCuenta > @numeroCuenta
	    	end
	    

	end

/**************** Obtener Imagen Cliente ***************************************/
GO
CREATE PROCEDURE obtenerImagenCliente
	@CIF int 

	as
		select I.imagen from ClienteFisico as C 
		inner join Imagen as I on I.idImagen=C.idImagenCliente
		where C.CIF= @CIF

/************** obtener direcciones cliente fisico ****************************/
GO
CREATE PROCEDURE obtenerDireccionesClienteFisico
	@CIF int
	as
		select D.Direccion from DireccionXCliente as DirCli
		inner join Direccion as D on DirCli.idDireccion = D.idDireccion
		inner join ClienteFisico as Cli on DirCli.CIF = Cli.CIF
		where Cli.CIF = @CIF


/************** obtener direcciones cliente juridico ****************************/
GO
CREATE PROCEDURE obtenerDireccionesClienteJuridico
	@CIF int
	as
		select D.Direccion from DireccionXCliente as DirCli
		inner join Direccion as D on DirCli.idDireccion = D.idDireccion
		inner join ClienteJuridico as Cli on DirCli.CIF = Cli.CIF
		where Cli.CIF = @CIF

/*********** obtener telefonos cliente fisico *******************************/
GO
CREATE PROCEDURE obtenerTelefonosClienteFisico
	@CIF int 
	as
		select Tel.Telefono from TelefonoxCliente as TelCli
		inner join ClienteFisico as Cli on TelCli.CIF=Cli.CIF
		inner join Telefono as Tel on TelCli.idTelefono= Tel.idTelefono
		where Cli.CIF = @CIF

/********** obtener telefonos cliente juridico ****************************/

GO
CREATE PROCEDURE obtenerTelefonosClienteJuridico
	@CIF int 
	as
		select Tel.Telefono from TelefonoxCliente as TelCli
		inner join ClienteJuridico as Cli on TelCli.CIF=Cli.CIF
		inner join Telefono as Tel on TelCli.idTelefono= Tel.idTelefono
		where Cli.CIF = @CIF

/***************** Agregar direcciones cliente ***************************/
GO
CREATE PROCEDURE agregarDireccionCliente
	@CIF int ,
	@Direccion nvarchar(300)
	as
		insert into Direccion (Direccion) values (@Direccion)

		insert into DireccionXCliente (idDireccion, CIF) values (IDENT_CURRENT('Direccion'),@CIF)


/****************** Crear Cerrar Cuentas ************************************/

GO
CREATE PROCEDURE crearCierreBancario
	as
		/***********Cambia los saldos reales a los cambios flotantes **********************/
		declare @numeroCuenta int 

		select @numeroCuenta = min(numeroCuenta) from CuentaDebito

		while @numeroCuenta is not null
		begin
			/* Cambia los flotatente a la cuenta real */
			declare @saldoFlotante int

			select @saldoFlotante=SaldoFlotante from CuentaDebito where numeroCuenta=@NumeroCuenta 
			update CuentaDebito set SaldoReal= @saldoFlotante where numeroCuenta= @NumeroCuenta

			/*Cambia la tabla de de varas en vuelo y lo mete en el historial en el historial */
			select @numeroCuenta = min( numeroCuenta ) from CuentaDebito where numeroCuenta > @numeroCuenta
		end

		/**************Hace las transsacciones en vuelo ****************************************/

		declare @idTranssacion int,
		@TipoTranssacion nvarchar(100),
		@MontoTransferido int,
		@FechaTrans datetime

		select @idTranssacion = min(idTranssacion) from TranssacionesVuelo

		while @idTranssacion is not null
		begin
			select @NumeroCuenta= NumeroCuenta, @TipoTranssacion= TipoTranssacion, @MontoTransferido= MontoTransferido, @FechaTrans=Fecha from TranssacionesVuelo  where idTranssacion=@idTranssacion

			insert into Historico (NumeroCuenta, TipoTranssacion, MontoTransferido, Fecha) values (@NumeroCuenta,@TipoTranssacion,@MontoTransferido,@FechaTrans)

			delete from TranssacionesVuelo where idTranssacion=@idTranssacion

			select @idTranssacion = min( idTranssacion ) from TranssacionesVuelo where idTranssacion > @idTranssacion

		end

		/************Guarda el cierre bancario ********************/
		insert into Cierres (FechaFinal) values (GETDATE ())

/*********************** Consultar Cierres Bancarios ************************/

GO
CREATE PROCEDURE consultarCierresBancarios
	as
		select top 100 idCierre , FechaFinal from Cierres 

/*********************Obtener cantidad Clientes Fisicos ********************/
GO
CREATE PROCEDURE cantidadClientesFisicos
	as
		select count(*) as cantClientes from ClienteFisico

/*********************Obtener cantidad Clientes Juridicos ********************/
GO
CREATE PROCEDURE cantidadClientesJuridico
	as
		select count(*) as cantClientes from ClienteJuridico

/******************** Consultar Transsacciones para un cliente ***************/
Go
CREATE PROCEDURE consultarTranssaccionesCliente
	@CIF int
	as
		(select TransVuelo.NumeroCuenta, TipoTranssacion, MontoTransferido, TransVuelo.Fecha from TranssacionesVuelo as TransVuelo
		inner join CuentaDebito on TransVuelo.NumeroCuenta= CuentaDebito.NumeroCuenta 
		where TransVuelo.NumeroCuenta in (select numeroCuenta from CuentaDebito where CuentaDebito.idCliente=@CIF)
union

select H.NumeroCuenta, H.TipoTranssacion, H.MontoTransferido, H.Fecha from Historico as H
		inner join CuentaDebito on H.NumeroCuenta= CuentaDebito.NumeroCuenta
		where  H.NumeroCuenta in (select numeroCuenta from CuentaDebito where CuentaDebito.idCliente=@CIF)
		)
		
 order by Fecha

 /**************** Consultar Cuentas Debito Cliente *************************************/
GO
CREATE PROCEDURE consultarCuentaDebitoCliente
	@CIF int 
	as
		select numeroCuenta from CuentaDebito where CuentaDebito.idCliente=@CIF


 /**************** Consultar Cuentas Ahorro Cliente *************************************/
GO
CREATE PROCEDURE consultarCuentaAhorroCliente
	@CIF int 
	as
		select numeroCuenta from CuentaAhorro where CuentaAhorro.CIF=@CIF

/*********************** Realizar Pago con cuenta Dispositovo ************************************/
GO
CREATE PROCEDURE realizarPagoDispositivo
	@idDispositivo bigint,
	@NumeroCuentaDestino int,
	@MontoPago int
	as
			declare @idNumeroCuentaDebito int,
			@numeroCuentaDebito int

			select @idNumeroCuentaDebito = NumeroCuentaDebito from MetodoPago where idDispositivo = @idDispositivo
			select @numeroCuentaDebito = numeroCuenta from CuentaDebito where idCuentaDebito= @idNumeroCuentaDebito

			EXEC realizarPago @NumeroCuentaDebito = @numeroCuentaDebito, @NumeroCuentaDestino =@NumeroCuentaDestino , @MontoPago =@MontoPago

			
/************************ Agregar un metodo de Pago **********************************************/
GO
CREATE PROCEDURE agregarMetodoPago
	@idDispositivo bigint,
	@idNumeroCuentaDebito int
	as
		insert into MetodoPago (NumeroCuentaDebito,idDispositivo,estado) values (@idNumeroCuentaDebito,@idDispositivo,1)

	

/************************  Agregar Telefonos a CLientes ****************************************/
GO
CREATE PROCEDURE agregarTelefonoCliente 
	@telefono nvarchar(30),
	@CIF int
	as
		insert into Telefono (Telefono) values (@telefono)
		insert into TelefonoxCliente (CIF,idTelefono) values (@CIF,IDENT_CURRENT('Telefono'))
	


GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([CIF], [idTipoCliente]) VALUES (1000000000, 0)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([idDireccion], [Direccion]) VALUES (1, N'200 metros este')
SET IDENTITY_INSERT [dbo].[Direccion] OFF
INSERT [dbo].[DireccionXCliente] ([idDireccion], [CIF]) VALUES (1, 1000000000)
SET IDENTITY_INSERT [dbo].[Telefono] ON 

INSERT [dbo].[Telefono] ([idTelefono], [Telefono]) VALUES (1, N'456575')
SET IDENTITY_INSERT [dbo].[Telefono] OFF
INSERT [dbo].[TelefonoxCliente] ([CIF], [idTelefono]) VALUES (1000000000, 1)
SET IDENTITY_INSERT [dbo].[ClienteFisico] ON 

INSERT [dbo].[ClienteFisico] ([idCLienteFisico], [CIF], [Nombre], [Apellido], [idImagenCliente], [Cedula], [idDireccionPrincipal], [idTelefonoPrincipal]) VALUES (1, 1000000000, N'Edward', N'umana', NULL, N'115260530', 1, 1)
SET IDENTITY_INSERT [dbo].[ClienteFisico] OFF
SET IDENTITY_INSERT [dbo].[TipoMoneda] ON 

INSERT [dbo].[TipoMoneda] ([idTipoMoneda], [Moneda]) VALUES (1, N'Colones')
INSERT [dbo].[TipoMoneda] ([idTipoMoneda], [Moneda]) VALUES (2, N'Dolares')
SET IDENTITY_INSERT [dbo].[TipoMoneda] OFF
SET IDENTITY_INSERT [dbo].[CuentaDebito] ON 

INSERT [dbo].[CuentaDebito] ([idCuentaDebito], [idCliente], [Desripcion], [idTipoMoneda], [Estado], [SaldoReal], [SaldoFlotante]) VALUES (100000000, 1000000000, N'Lavado dinero', 1, 1, 40000.0000, 36000.0000)
INSERT [dbo].[CuentaDebito] ([idCuentaDebito], [idCliente], [Desripcion], [idTipoMoneda], [Estado], [SaldoReal], [SaldoFlotante]) VALUES (100000001, 1000000000, N'prestamos', 1, 1, 80000.0000, 73895.0000)
SET IDENTITY_INSERT [dbo].[CuentaDebito] OFF
SET IDENTITY_INSERT [dbo].[Proposito] ON 

INSERT [dbo].[Proposito] ([idProposito], [Proposito], [TasaInteres]) VALUES (1, N'MAtrimonio', 0)
SET IDENTITY_INSERT [dbo].[Proposito] OFF
SET IDENTITY_INSERT [dbo].[CuentaAhorro] ON 

INSERT [dbo].[CuentaAhorro] ([idCuentaAhorro], [CIF], [NumeroCuentaDebito], [idProposito], [Periodicidad], [FechaInicio], [DuracionAhorro], [FechaFinal], [MontoAhorro], [idTipoMoneda], [MontoAhorroActual], [MontoAhorroDeseado], [FechaProximoPago], [terminoAhorro], [dominioPeriodicidad]) VALUES (2, 1000000000, 100000000, 1, 20, CAST(N'2014-01-01 00:00:00.000' AS DateTime), 30, CAST(N'2013-01-01 00:00:00.000' AS DateTime), 1000.0000, 1, 5000.0000, 8000.0000, CAST(N'2014-01-01 00:01:40.000' AS DateTime), 1, N'segundos')
INSERT [dbo].[CuentaAhorro] ([idCuentaAhorro], [CIF], [NumeroCuentaDebito], [idProposito], [Periodicidad], [FechaInicio], [DuracionAhorro], [FechaFinal], [MontoAhorro], [idTipoMoneda], [MontoAhorroActual], [MontoAhorroDeseado], [FechaProximoPago], [terminoAhorro], [dominioPeriodicidad]) VALUES (5, 1000000000, 100000001, 1, 2, CAST(N'2014-01-01 00:00:00.000' AS DateTime), 30, CAST(N'2014-12-12 00:00:00.000' AS DateTime), 555.0000, 1, 6105.0000, 5588.0000, CAST(N'2014-01-01 00:22:00.000' AS DateTime), 1, N'minutos')
SET IDENTITY_INSERT [dbo].[CuentaAhorro] OFF
