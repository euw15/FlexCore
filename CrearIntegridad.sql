/*******************************************************************/
/*******************************************************************/
/**********************  Crear Llaves Primarias ********************/
/*******************************************************************/
/*******************************************************************/


USE FlexCoreDataBase;



create function GeneradorNumeroCuenta (@id int, @tipoMoneda int) 
returns int
	as begin 
		if @tipoMoneda = 1
			 return cast('8' + right('00000000' + convert(varchar(10), @id), 8) as int) 
		else
			 return cast('9' + right('00000000' + convert(varchar(10), @id), 8) as int)
	return 0;
	end

alter table CuentaDebito add CIF as dbo.GeneradorNumeroCuenta(idCuentaDebito,idTipoMoneda) 