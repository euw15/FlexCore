USE [msdb]
GO

/****** Object:  Job [pagosAutomaticos]    Script Date: 07/10/2014 17:23:26 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 07/10/2014 17:23:26 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'pagosAutomaticos', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [consultarPagosPendientes]    Script Date: 07/10/2014 17:23:26 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'consultarPagosPendientes', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'GO
USE FlexCoreDataBase

go
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
	    					if(@dominioPeriodicidad = ''segundos'')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(second,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    					if(@dominioPeriodicidad = ''minutos'')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(minute,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    					if(@dominioPeriodicidad = ''horas'')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(hour,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    					if(@dominioPeriodicidad = ''dias'')
	    						update CuentaAhorro set FechaProximoPago= DATEADD(day,@Periodicidad,@FechaProximaPago) where numeroCuenta = @numeroCuenta
	    					if(@dominioPeriodicidad = ''meses'')
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
	    

	end', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'revisarCuentasPago', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=2, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20141007, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'ad1da3fd-8b63-4c2c-ad82-077c1c8c3a74'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO





USE [msdb]
GO

/****** Object:  Job [cierreBancario]    Script Date: 08/10/2014 22:17:54 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 08/10/2014 22:17:54 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'cierreBancario', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]',
		 @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [realizarCierreBancario]    Script Date: 08/10/2014 22:17:55 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'realizarCierreBancario', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'/***********Cambia los saldos reales a los cambios flotantes **********************/
		use FlexCoreDataBase

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
		@NumeroCuenta int,
		@TipoTranssacion nvarchar(100),
		@MontoTransferido int

		select @idTranssacion = min(idTranssacion) from TranssacionesVuelo

		while @idTranssacion is not null
		begin
			select @NumeroCuenta= NumeroCuenta, @TipoTranssacion= TipoTranssacion, @MontoTransferido= MontoTransferido from TranssacionesVuelo  where idTranssacion=@idTranssacion

			insert into Historico (NumeroCuenta, TipoTranssacion, MontoTransferido) values (@NumeroCuenta,@TipoTranssacion,@MontoTransferido)

			delete from TranssacionesVuelo where idTranssacion=@idTranssacion

			select @idTranssacion = min( idTranssacion ) from TranssacionesVuelo where idTranssacion > @idTranssacion
		end', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'revisar', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20141009, 
		@active_end_date=99991231, 
		@active_start_time=235958, 
		@active_end_time=235959, 
		@schedule_uid=N'0e89041e-8287-40f4-8d7e-0ebf1cdf8160'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO





