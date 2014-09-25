/*******************************************************************/
/*******************************************************************/
/**********************  Crear Tablas ******************************/
/*******************************************************************/
/*******************************************************************/

/*******************************************************************/
GO

CREATE TABLE [Cliente](
	[CIF] [int] NOT NULL,
	[idTipoCliente] [int] NOT NULL
)

/*******************************************************************/
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
CREATE TABLE [TelefonoxCliente](
	[CIF] [int] NOT NULL,
	[idTelefono] [int] NOT NULL
	)



/********************************************************************/
GO
CREATE TABLE [ClienteFisico](
	[CIF] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Apellido] [nvarchar](30) NOT NULL,
	[idImagenCliente] [int],
	[Direccion] [nvarchar](300) NOT NULL
	)


/********************************************************************/
GO
CREATE TABLE [ClienteJuridico](
	[CIF] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Direccion] [nvarchar](300) NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [DocumentoxCliente](
	[CIF] [int] NOT NULL,
	[idDocumento] [int] NOT NULL
	)

//FALTA POR HACER!!!!
/********************************************************************/
GO
CREATE TABLE [Documentos](
	[idDocumento] [int] NOT NULL,
	[Documento] VARBINARY(MAX) FILESTREAM NULL
	)

/********************************************************************/
GO
CREATE TABLE [TipoMoneda](
	[idTipoMoneda] [int] NOT NULL,
	[Moneda] [nvarchar](30) NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [CuentaDebito](
	[NumeroCuentaDebito] [int] NOT NULL,
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
	[idCuentaAhorro] [int] NOT NULL,
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

