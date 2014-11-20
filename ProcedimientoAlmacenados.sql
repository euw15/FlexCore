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
		where ClientesJuridicosView.CIF = @Dato 

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
	@TiempoAhorro int,
	@MontoAhorroPeriodico int,
	@NumeroCuentaOrigen int,
	@Moneda nvarchar(11),
	@dominioPeriodicidad nvarchar(11),
	@MontoAhorroDeseado int
AS
	
	declare @idNumeroCuentaDebito int,
			@FechaFinal datetime

	if @TiempoAhorro < 365
	begin
		set @FechaFinal = DATEADD(day,@TiempoAhorro,@FechaInicio)
		PRINT @FechaFinal
	end
	else
		set @FechaFinal = DATEADD(year,CAST(@TiempoAhorro/365 AS INT),@FechaInicio)
	
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
					begin
						set @id=0
						insert into BitacoraErrores (Mensaje,numeroError) values ('No tiene fondos suficientes', 2)
					end
			end
		else
			begin
				set @id=0
				insert into BitacoraErrores (Mensaje,numeroError) values ('Alguna de las cuentas esta inactiva', 1)
			end
		
		select @id as id;

/********************* Consultar Propositos ****************************************/

GO
CREATE PROCEDURE consultarPropositos
	AS
		SELECT TOP 100 P.idProposito,P.Proposito, P.TasaInteres from Proposito AS P

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
			@dominioPeriodicidad [nvarchar](100),
			@porcentajeInteres int,
			@montoInteresGanado float,
			@idCuentaAhorro int

	select @numeroCuenta = min(numeroCuenta) from CuentaAhorro

	while @numeroCuenta is not null
	begin
		/*Selecciona todas las variables de la cuenta actual */
	    select @idCuentaAhorro= idCuentaAhorro, @dominioPeriodicidad= dominioPeriodicidad , @FechaFinal=FechaFinal, @NumeroCuentaDebito=NumeroCuentaDebito , @FechaProximaPago=FechaProximoPago , @MontoAhorro=MontoAhorro ,@Periodicidad=Periodicidad , @MontoAhorroActual=MontoAhorroActual, @MontoAhorroDeseado=MontoAhorroDeseado, @TerminoAhorro=terminoAhorro
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

	    					/******* Se calcula el interes cobrado **********/
	    					select @porcentajeInteres = TasaInteres from Proposito 
	    						inner join CuentaAhorro on CuentaAhorro.idProposito = Proposito.idProposito
	    						where  numeroCuenta=@NumeroCuenta

	    					set @montoInteresGanado = (@porcentajeInteres*@MontoAhorro)/100

	    					PRINT @porcentajeInteres*@MontoAhorro
	    					PRINT @montoInteresGanado
	    					INSERT INTO InteresesObtenenidos (interesCobrado, montoCobrado, idCuentaAhorro) VALUES (@porcentajeInteres,@montoInteresGanado,@idCuentaAhorro)

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
		select count(*) as id from ClienteFisico

/*********************Obtener cantidad Clientes Juridicos ********************/
GO
CREATE PROCEDURE cantidadClientesJuridico
	as
		select count(*) as id from ClienteJuridico

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
		declare @idnumeroCuenta int

		select @idnumeroCuenta=idCuentaDebito from CuentaDebito where numeroCuenta=@idNumeroCuentaDebito
		insert into MetodoPago (NumeroCuentaDebito,idDispositivo,estado) values (@idnumeroCuenta,@idDispositivo,1)

	

/************************  Agregar Telefonos a CLientes ****************************************/
GO
CREATE PROCEDURE agregarTelefonoCliente 
	@telefono nvarchar(30),
	@CIF int
	as
		insert into Telefono (Telefono) values (@telefono)
		insert into TelefonoxCliente (CIF,idTelefono) values (@CIF,IDENT_CURRENT('Telefono'))
	
/*********************** Actualizar Cliente Fisico ************************************************/
GO
CREATE PROCEDURE actualizarClienteFisico
	@Nombre nvarchar(30), 
    @Cedula nvarchar(30),
    @Telefono nvarchar(30),
    @Direccion nvarchar(300),
    @Apellido nvarchar(200),
    @CIF int
    as
    	update ClienteFisico set Nombre= @Nombre ,Apellido=@Apellido , Cedula=@Cedula where CIF=@CIF

    	declare @idDireccion int,
    			@idTelefono int 

    	select @idDireccion=idDireccionPrincipal , @idTelefono=idTelefonoPrincipal from ClienteFisico where CIF=@CIF

    	update Direccion set Direccion=@Direccion where idDireccion=@idDireccion

    	update Telefono set Telefono=@Telefono where idTelefono=@idTelefono

/*********************** Actualizar Cliente Fisico ************************************************/
GO
CREATE PROCEDURE actualizarClienteJuridico
	@Nombre nvarchar(30), 
    @Cedula nvarchar(30),
    @Telefono nvarchar(30),
    @Direccion nvarchar(300),
    @CIF int
    as
    	update ClienteJuridico set Nombre= @Nombre , Cedula=@Cedula where CIF=@CIF

    	declare @idDireccion int,
    			@idTelefono int 

    	select @idDireccion=idDireccionPrincipal , @idTelefono=idTelefonoPrincipal from ClienteJuridico where CIF=@CIF

    	update Direccion set Direccion=@Direccion where idDireccion=@idDireccion

    	update Telefono set Telefono=@Telefono where idTelefono=@idTelefono


/********************** Eliminar Cliente Fisico *********************************************************/

GO
CREATE PROCEDURE eliminarCliente
	@CIF int
	as
		update Cliente set Estado=0 where CIF=@CIF


/******************Agregar beneficiarios a cuenta de debito ********************************************/
GO
CREATE PROCEDURE agregarBeneficiarosCuentaDebito
	@CIF int,
	@numeroCuentaDebito int
	as
		declare @idnumeroCuenta int

		select @idnumeroCuenta=idCuentaDebito from CuentaDebito where numeroCuenta=@numeroCuentaDebito
		insert into Beneficiarios (idCliente,NumeroCuentaDebito) values (@CIF,@idnumeroCuenta)

/*************** Obtener todos los clientes *************************************************************/
GO
CREATE PROCEDURE obtenerTodosLosClientes
	/*Paramatros de entrada*/
	@Cantidad int,
	@Inicio int
	AS
		/*Consulta los clientes fisico en el rago deseado */
		SELECT CIF,Nombre,Cedula, Telefono, Direccion FROM ( 
	  	SELECT CIF,Nombre,Cedula, Telefono, Direccion, ROW_NUMBER() OVER (ORDER BY CIF) as row FROM ClientesFisicosView
	  	union 
	 	 SELECT CIF,Nombre,Cedula, Telefono, Direccion, ROW_NUMBER() OVER (ORDER BY CIF) as row FROM ClientesJuridicosView
	 ) a WHERE a.row > @Inicio and a.row <= @Inicio+@Cantidad

/************* Obtener Intereses Obtenenidos *************************************************************/
GO
CREATE PROCEDURE obtenerInteresesObtenenidos
	as
		select interesCobrado,montoCobrado,idCuentaAhorro,Fecha from InteresesObtenenidos


/***********Obtiene la bitacora de errores **************************************************************/
GO
CREATE PROCEDURE obtenerBitacoraErrores
	as
		select Mensaje,numeroError,Fecha from BitacoraErrores

/***********Buscar cuentas DEbito********************************************************************/

GO
CREATE PROCEDURE obtenerCuentasDebito
	as
		SELECT TOP 100 idCuentaDebito,idCliente,Desripcion,idTipoMoneda,Estado,SaldoReal,SaldoFlotante,numeroCuenta
  			FROM CuentaDebito

 /********Buscar Cuenta Ahorro **********************************************/

 GO
 CREATE PROCEDURE obtenerCuentaAhorro
 	as
 		SELECT TOP 100 [idCuentaAhorro],[CIF],[NumeroCuentaDebito],[idProposito],[Periodicidad],[FechaInicio],[DuracionAhorro],[FechaFinal],[MontoAhorro],[idTipoMoneda],[MontoAhorroActual]
      ,[MontoAhorroDeseado],[FechaProximoPago],[terminoAhorro],[dominioPeriodicidad],[numeroCuenta]
  FROM [CuentaAhorro]



  go
  CREATE PROCEDURE verTransEnVuelo
  	as
  		select * from TranssacionesVuelo 

  go
  	CREATE PROCEDURE verHistorico
  	as
  		select * from Historico



GO
CREATE PROCEDURE crearClienteCuentaAhorroCuentaAutomatica
  	/*Parametros de entrada */
    @Nombre nvarchar(30), 
    @Cedula nvarchar(30),
    @Telefono nvarchar(30),
    @Direccion nvarchar(300),
    @Apellidos nvarchar(200),
    /*para la cuenta*/
    @Descripcion nvarchar(200),
	@Moneda nvarchar(10),
	/*para cuenta de ahorro */
	@idProposito int,
	@Periodicidad int,
	@FechaInicio nvarchar(11),
	@TiempoAhorro int,
	@MontoAhorroPeriodico int,
	@dominioPeriodicidad nvarchar(11),
	@MontoAhorroDeseado int
AS 
	declare @ClienteCIF [int] ,  		    /*Contiene CIF Generado */
	        @idDireccionGenerado [int],		/*Contiene id Direccion Generado */
		    @idTelefonoGenerado [int]		/*Contiene id Telefono generado */

	/*Inserta el clienteGenerico y obtiene el CIF*/
	INSERT INTO Cliente (idTipoCliente) values (0)
	SET @ClienteCIF = IDENT_CURRENT('Cliente')

	/*Inserta la direccion */
	/*INSERT INTO Direccion (Direccion) values (@Direccion)*/
	SET @idDireccionGenerado = 1

	/*Inserta el Telefono */
	/*INSERT INTO Telefono (Telefono) VALUES (@Telefono)*/
	SET @idTelefonoGenerado = 1

	/*Relaciona la Direccion con El Cliente */
	INSERT INTO DireccionXCliente (idDireccion,CIF) values (@idDireccionGenerado,@ClienteCIF)

	/*Relaciona el telefono con el cliente*/
	INSERT INTO TelefonoxCliente (idTelefono,CIF) values (@idTelefonoGenerado,@ClienteCIF)

	/*inserta en cliente juridico */
	INSERT INTO ClienteFisico (CIF, Nombre,Apellido,Cedula,idDireccionPrincipal,idTelefonoPrincipal) values (@ClienteCIF,@Nombre,@Apellidos,@Cedula,@idDireccionGenerado,@idTelefonoGenerado);


	/* Parte de cuenta debito */

	/*Inserta la nueva cuenta de debito*/
	INSERT INTO CuentaDebito (idCliente,Desripcion,idTipoMoneda,Estado,SaldoReal,SaldoFlotante) values (@ClienteCIF,@Descripcion,@Moneda,1,0,0)

	DECLARE @NumeroCuentaOrigen [int]

	SET @NumeroCuentaOrigen = IDENT_CURRENT('CuentaDebito')

	
	declare @idNumeroCuentaDebito int,
			@FechaFinal datetime

	if @TiempoAhorro < 365
	begin
		set @FechaFinal = DATEADD(day,@TiempoAhorro,@FechaInicio)
	end
	else
		set @FechaFinal = DATEADD(year,CAST(@TiempoAhorro/365 AS INT),@FechaInicio)
	
	/*select @idNumeroCuentaDebito=idCuentaDebito from CuentaDebito where numeroCuenta= @NumeroCuentaOrigen*/
	/*Inserta la informacion de la cuenta de Ahorro */
	insert into CuentaAhorro (CIF, NumeroCuentaDebito,idProposito,Periodicidad,FechaInicio,FechaFinal,FechaProximoPago,DuracionAhorro,
		MontoAhorro,idTipoMoneda,MontoAhorroActual,dominioPeriodicidad,terminoAhorro,MontoAhorroDeseado)
		values (@ClienteCIF,@NumeroCuentaOrigen,@idProposito,@Periodicidad,@FechaInicio,@FechaFinal,@FechaInicio,@TiempoAhorro,
			@MontoAhorroPeriodico,@Moneda,0,@dominioPeriodicidad,0,@MontoAhorroDeseado)


GO
CREATE PROCEDURE diccionaroDeDatos
	select 
	d.object_id,
	a.name [table], 
	--schema_name(a.schema_id) schema_name, 
	--a.create_date,
	b.name [column], 
	c.name [type], 
	CASE	
		WHEN c.name = 'numeric' OR  c.name = 'decimal' OR c.name = 'float'  THEN b.precision
		ELSE null
	END [Precision], 
	b.max_length, 
	CASE 
		WHEN b.is_nullable = 0 THEN 'NO'
		ELSE 'SI'
	END [Permite Nulls],
	CASE 
		WHEN b.is_identity = 0 THEN 'NO'
		ELSE 'SI'
	END [Es Autonumerico],	
	ep.value [Descripcion],
	f.ForeignKey,
	f.ReferenceTableName,
	f.ReferenceColumnName
from sys.tables a 
	inner join sys.columns b on a.object_id= b.object_id 
	inner join sys.systypes c on b.system_type_id= c.xtype 
	inner join sys.objects d on a.object_id= d.object_id 
	LEFT JOIN sys.extended_properties ep ON d.object_id = ep.major_id AND b.column_Id = ep.minor_id
	LEFT JOIN (SELECT 
				f.name AS ForeignKey,
				OBJECT_NAME(f.parent_object_id) AS TableName,
				COL_NAME(fc.parent_object_id,fc.parent_column_id) AS ColumnName,
				OBJECT_NAME (f.referenced_object_id) AS ReferenceTableName,
				COL_NAME(fc.referenced_object_id,fc.referenced_column_id) AS ReferenceColumnName
				FROM sys.foreign_keys AS f
				INNER JOIN sys.foreign_key_columns AS fc ON f.OBJECT_ID = fc.constraint_object_id) 	f ON f.TableName =a.name AND f.ColumnName =b.name
WHERE a.name <> 'sysdiagrams' 
ORDER BY a.name,b.column_Id


