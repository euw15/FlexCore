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



