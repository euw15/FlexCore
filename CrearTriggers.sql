/*******************************************************************/
/*******************************************************************/
/*********************** Crear Triggers ****************************/
/*******************************************************************/
/*******************************************************************/

CREATE TRIGGERS crearTransacciones on CuentaDebito
	after INSERT,UPDATE
	as 
		if exists 
			(
				declare
				@NumeroCuenta int ,
				@TipoTranssacion nvarchar(100)

				select @NumeroCuenta=numeroCuenta, @TipoTranssacion=TipoTranssacion from inserted 
				insert into TranssacionesVuelo (NumeroCuenta,TipoTranssacion,MontoTransferido) values (1,1,1)



			)
