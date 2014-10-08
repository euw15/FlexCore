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

/******************* Crear Job que revisa saldos **********************************/

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

/*********** Agregar direcciones cliente juridico ***********************/
GO
CREATE PROCEDURE agregarDireccionClienteJuridico
	@CIF int 
	as
		insert into 



	


