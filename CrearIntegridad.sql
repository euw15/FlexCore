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

/*******FK Para Cuenta de Debito ***********************************/

GO
ALTER TABLE CuentaDebito
ADD CONSTRAINT FK_CuentaDebito_idTipoMoneda FOREIGN KEY (idTipoMoneda) 
    REFERENCES TipoMoneda (idTipoMoneda) 
    ON DELETE CASCADE
    ON UPDATE CASCADE

ALTER TABLE CuentaDebito
ADD CONSTRAINT FK_CuentaDebito_idCliente FOREIGN KEY (idCliente) 
    REFERENCES Cliente (CIF) 
    ON DELETE CASCADE
    ON UPDATE CASCADE

/*******FK Beneficiarios ********************************************/

GO
ALTER TABLE Beneficiarios
ADD CONSTRAINT FK_Beneficiarios_idCliente FOREIGN KEY (idCliente) 
    REFERENCES Cliente (CIF) 
    ON DELETE CASCADE
    ON UPDATE CASCADE

ALTER TABLE Beneficiarios
ADD CONSTRAINT FK_Beneficiarios_NumeroCuentaDebito FOREIGN KEY (NumeroCuentaDebito) 
    REFERENCES CuentaDebito (idCuentaDebito) 

/***********************FK Metodo de Pago *******************************/

GO
ALTER TABLE MetodoPago
ADD CONSTRAINT FK_MetodoPago_NumeroCuenta FOREIGN KEY (NumeroCuentaDebito)
	REFERENCES CuentaDebito (idCuentaDebito)
	ON DELETE CASCADE
	ON UPDATE CASCADE

/***********************Cuenta de Ahorro *******************************/

GO
ALTER TABLE CuentaAhorro
ADD CONSTRAINT FK_CuentaAhorro_Proposito FOREIGN KEY (idProposito)
	REFERENCES Proposito (idProposito)
	ON DELETE CASCADE
	ON UPDATE CASCADE

ALTER TABLE CuentaAhorro
ADD CONSTRAINT FK_CuentaAhorro_idCliente FOREIGN KEY (CIF)
	REFERENCES Cliente (CIF)
	ON DELETE CASCADE
	ON UPDATE CASCADE

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

