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
	[CIF] [int] Identity(1000000000,1) constraint pk_CIF_Cliente primary key,
	[idTipoCliente] [int] NOT NULL,
	[Estado] [bit] DEFAULT 1
)

/*******************************************************************/
GO
CREATE TABLE [Telefono](
	[idTelefono] [int] Identity(1,1) constraint pk_idTelefono_Telefono primary key,
	[Telefono] [nvarchar](15) NOT NULL,
)

/*******************************************************************/
GO
CREATE TABLE [TipoCliente](
	[idTipoCliente] [int] Identity(1,1) constraint pk_idTipoCliente_TipoCliente primary key,	
	[Nombre] [nvarchar](200)
)

/*******************************************************************/
GO
CREATE TABLE [TelefonoxCliente](
	[CIF] [int] not null,
	[idTelefono] [int] not null,
	CONSTRAINT pk_TelefonoXCliente PRIMARY KEY (CIF,idTelefono)
	)

/********************************************************************/
GO
CREATE TABLE [ClienteFisico](
	[idCLienteFisico] [int] Identity(1,2) constraint pk_idCliente_ClienteFisico primary key,
	[CIF] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Apellido] [nvarchar](30) NOT NULL,
	[idImagenCliente] [int],
	[Cedula] [nvarchar](30) NOT NULL,
	[idDireccionPrincipal] [int] NOT NULL,
	[idTelefonoPrincipal]  [int] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [ClienteJuridico](
	[idCLienteJuridico] [int] Identity(0,2) constraint pk_idCliente_ClienteJuridico primary key,
	[CIF] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Cedula] [nvarchar](30) NOT NULL,
	[idDireccionPrincipal] [int] NOT NULL,
	[idTelefonoPrincipal]  [int] NOT NULL
	)


/*******************************************************************/
GO
CREATE TABLE [Direccion](
	[idDireccion] [int] Identity(1,1) constraint pk_idDireccion_Direccion primary key,
	[Direccion] [nvarchar] (400) 
	)

/*******************************************************************/
GO
CREATE TABLE [DireccionXCliente](
	[idDireccion] [int] not null,
	[CIF] [int] not null,
	CONSTRAINT pk_DireccionXCliente PRIMARY KEY (idDireccion,CIF)
	)


/********************************************************************/
GO
CREATE TABLE [DocumentoxCliente](
	[CIF] [int] not null,
	[idDocumento] [int] not null,
	CONSTRAINT pk_DocumentosxCliente PRIMARY KEY (CIF,idDocumento)
	)

GO
CREATE TABLE [TipoMoneda](
	[idTipoMoneda] [int] Identity(1,1) constraint pk_idTipoMoneda_TipoMoneda primary key,
	[Moneda] [nvarchar](30) NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [CuentaDebito](
	[idCuentaDebito] [int] Identity(100000000,1) constraint pk_idCuentaDebito_CuentaDebito primary key,
	[idCliente] [int] NOT NULL,
	[Desripcion] [nvarchar](300) NOT NULL,
	[idTipoMoneda] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[SaldoReal] [money] NOT NULL,
	[SaldoFlotante] [money] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [Beneficiarios](
	[idCliente] [int] not null,
	[NumeroCuentaDebito] [int] NOT NULL,
	CONSTRAINT pk_Beneficiarios PRIMARY KEY (idCliente,NumeroCuentaDebito)
	)

/********************************************************************/
GO
CREATE TABLE [MetodoPago](
	[idMetodoPago] [int] Identity(1,1) constraint pk_PKMetogoPago_MetodoPago primary key,
	[NumeroCuentaDebito] [int] NOT NULL,
	[idDispositivo] [bigint] NOT NULL,
	[estado] [bit] NOT NULL
	)

/********************************************************************/
GO
CREATE TABLE [Proposito](
	[idProposito] [int] Identity(1,1) constraint pk_idProposito_Proposito primary key,
	[Proposito] [nvarchar](200) NOT NULL,
	[TasaInteres] [int]
	)

/********************************************************************/
GO
CREATE TABLE [CuentaAhorro](
	[idCuentaAhorro] [int] Identity(1,1) constraint pk_idCuentaAhorro_CuentaAhorro primary key,
	[CIF] [int] NOT NULL,
	[NumeroCuentaDebito] [int] NOT NULL,
	[idProposito] [int] NOT NULL,
	[Periodicidad] [int] NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[DuracionAhorro] [int] NOT NULL,
	[FechaFinal] [datetime] NOT NULL,
	[MontoAhorro] [money] NOT NULL,
	[idTipoMoneda] [int] NOT NULL,
	[MontoAhorroActual] [money] NOT NULL,
	[MontoAhorroDeseado] [money] NOT NULL,
	[FechaProximoPago] [datetime] NOT NULL,
	[terminoAhorro] [bit] NOT NULL,
	[dominioPeriodicidad] [nvarchar](20)
	)

/********************************************************************/
GO
CREATE TABLE [TranssacionesVuelo](
	[idTranssacion] [int] Identity(1,1) constraint pk_idTranssacion_TranssacionesVuelo primary key,
	[NumeroCuenta] [int] NOT NULL,
	[TipoTranssacion] [nvarchar](100) NOT NULL,
	[MontoTransferido] [int],
	[Fecha] [datetime] DEFAULT GETDATE()
	)

/********************************************************************/
GO
CREATE TABLE [Historico](
	[idTranssacion] [int] Identity(1,1) constraint pk_idTranssacion_Historico primary key,
	[NumeroCuenta] [int] NOT NULL,
	[TipoTranssacion] [nvarchar](100) NOT NULL,
	[MontoTransferido] [int],
	[Fecha] [datetime]
	)

/********************************************************************/
GO
CREATE TABLE [Cierres](
	[idCierre] [int] Identity(1,1) constraint pk_idCierre_Cierres primary key,
	[FechaFinal] [datetime] NOT NULL
	)
/*********************************************************************/
GO
CREATE TABLE [Imagen] (
	[idImagen] [int] Identity(1,1) constraint pk_Imagen_idImagen primary key,
	[imagen] varchar(max)
	)

/************************************************************************/
GO
CREATE TABLE [InteresesObtenenidos](
	[idInteresesObtenidos] [int] Identity(1,1) constraint pk_InteresesObtenidos primary key,
	[interesCobrado] [int] not null,
	[montoCobrado] [float] not null,
	[idCuentaAhorro] [int] not null,
	[Fecha] [datetime] DEFAULT GETDATE()
	)

/**********************************************************************************/
GO
CREATE TABLE [BitacoraErrores](
	[idBitacora] [int] Identity(1,1) constraint pk_BitacoraErrores primary key,
	[Mensaje] [nvarchar](300),
	[numeroError] [int] not null,
	[Fecha] [datetime] DEFAULT GETDATE()
	)

