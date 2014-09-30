/*******************************************************************/
/*******************************************************************/
/**********************  Crear Llaves Primarias ********************/
/*******************************************************************/
/*******************************************************************/


USE FlexCoreDataBase;

/****************Crea funcion para numeroCuentas *******************/
/* Verifica el tipo de moneda en la insercion y le agrega el digito correspondiente */
go
create function GeneradorNumeroCuenta (@id int, @tipoMoneda int) 
returns int
	as begin 
		if @tipoMoneda = 1
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
    ON DELETE CASCADE
    ON UPDATE CASCADE

 ALTER TABLE TelefonoxCliente 
ADD CONSTRAINT FK_TelefonoXCLiente_CIF FOREIGN KEY (CIF) 
    REFERENCES Cliente (CIF) 
    ON DELETE CASCADE
    ON UPDATE CASCADE
;


/******Para CLientes Juridicos y Fisicos ***************************/
GO
ALTER TABLE ClienteJuridico 
ADD CONSTRAINT FK_ClienteJuridico_CIF FOREIGN KEY (CIF) 
    REFERENCES Cliente (CIF) 
    ON DELETE CASCADE
    ON UPDATE CASCADE

 ALTER TABLE ClienteFisico 
ADD CONSTRAINT FK_ClienteFisico_CIF FOREIGN KEY (CIF) 
    REFERENCES Cliente (CIF) 
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
