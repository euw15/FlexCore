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
	[CIF] [int] Identity(1000000000,1),
	[idTipoCliente] [int] NOT NULL
)

/*******************************************************************/
GO
CREATE TABLE [Telefono](
	[idTelefono] [int] NOT NULL,
	[Telefono] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[idTelefono] ASC
)
)

/*******************************************************************/
GO
CREATE TABLE [TipoCliente](
	[idTipoCliente] [int] Identity(1,1),	
	[Nombre] [nvarchar](200)
)

/*******************************************************************/
GO
CREATE TABLE [TelefonoxCliente](
	[CIF] [int] NOT NULL,
	[idTelefono] [int] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [ClienteFisico](
	[idCLienteFisico] [int] Identity(1,2),
	[CIF] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Apellido] [nvarchar](30) NOT NULL,
	[idImagenCliente] [int],
	[Cedula] [int] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [ClienteJuridico](
	[idCLienteJuridico] [int] Identity(0,2),
	[CIF] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Cedula] [int] NOT NULL
	)


/*******************************************************************/
GO
CREATE TABLE [Direccion](
	[idDireccion] [int] Identity(1,1),
	[Direccion] [nvarchar] (400) 
	)

/*******************************************************************/
GO
CREATE TABLE [DireccionXCliente](
	[idDireccion] [int] NOT NULL,
	[CIF] [int] NOT NULL 
	)


/********************************************************************/
GO
CREATE TABLE [DocumentoxCliente](
	[CIF] [int] NOT NULL,
	[idDocumento] [int] NOT NULL
	)

/*FALTA POR HACER!!!!
/********************************************************************/
/*GO
CREATE TABLE [Documentos](
	[idDocumento] [int] Identity(1,1),
	[Documento] VARBINARY(MAX) FILESTREAM NULL
	)

/********************************************************************/
GO
CREATE TABLE [TipoMoneda](
	[idTipoMoneda] [int] Identity(1,1),
	[Moneda] [nvarchar](30) NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [CuentaDebito](
	[idCuentaDebito] [int] Identity(100000000,1),
	[idCliente] [int] NOT NULL,
	[Desripcion] [nvarchar](300) NOT NULL,
	[idTipoMoneda] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[SaldoReal] [int] NOT NULL,
	[SaldoFlotante] [int] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [Beneficiarios](
	[idCliente] [int] NOT NULL,
	[NumeroCuentaDebito] [int] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [MetodoPago](
	[NumeroCuentaDebito] [int] NOT NULL,
	[idDispositivo] [int] NOT NULL,
	[estado] [bit] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [Proposito](
	[idProposito] [int] NOT NULL,
	[Proposito] [nvarchar](200) NOT NULL,
	[TasaInteres] [int]
	)

/********************************************************************/
GO
CREATE TABLE [CuentaAhorro](
	[idCuentaAhorro] [bigint] NOT NULL,
	[CIF] [nvarchar](200) NOT NULL,
	[NumeroCuentaDebito] [int] NOT NULL,
	[idProposito] [int] NOT NULL,
	[Periodicidad] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[DuracionAhorro] [int] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[MontoAhorro] [int] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [TranssacionesVuelo](
	[idTranssacion] [int] NOT NULL,
	[NumeroCuenta] [int] NOT NULL,
	[TipoTranssacion] [nvarchar](100) NOT NULL,
	[MontoTransferido] [int]
	)

/********************************************************************/
GO
CREATE TABLE [Historico](
	[idTranssacion] [int] NOT NULL,
	[NumeroCuenta] [int] NOT NULL,
	[TipoTranssacion] [nvarchar](100) NOT NULL,
	[MontoTransferido] [int]
	)

/********************************************************************/
GO
CREATE TABLE [Cierres](
	[idCierre] [int] NOT NULL,
	[FechaFinal] [datetime] NOT NULL
	)

