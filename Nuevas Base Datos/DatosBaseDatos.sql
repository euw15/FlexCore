USE [FlexCoreDataBase]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([CIF], [idTipoCliente]) VALUES (1000000000, 0)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([idDireccion], [Direccion]) VALUES (1, N'200 metros este')
SET IDENTITY_INSERT [dbo].[Direccion] OFF
INSERT [dbo].[DireccionXCliente] ([idDireccion], [CIF]) VALUES (1, 1000000000)
SET IDENTITY_INSERT [dbo].[Telefono] ON 

INSERT [dbo].[Telefono] ([idTelefono], [Telefono]) VALUES (1, N'456575')
SET IDENTITY_INSERT [dbo].[Telefono] OFF
INSERT [dbo].[TelefonoxCliente] ([CIF], [idTelefono]) VALUES (1000000000, 1)
SET IDENTITY_INSERT [dbo].[ClienteFisico] ON 

INSERT [dbo].[ClienteFisico] ([idCLienteFisico], [CIF], [Nombre], [Apellido], [idImagenCliente], [Cedula], [idDireccionPrincipal], [idTelefonoPrincipal]) VALUES (1, 1000000000, N'Edward', N'umana', NULL, N'115260530', 1, 1)
SET IDENTITY_INSERT [dbo].[ClienteFisico] OFF
SET IDENTITY_INSERT [dbo].[TipoMoneda] ON 

INSERT [dbo].[TipoMoneda] ([idTipoMoneda], [Moneda]) VALUES (1, N'Colones')
INSERT [dbo].[TipoMoneda] ([idTipoMoneda], [Moneda]) VALUES (2, N'Dolares')
SET IDENTITY_INSERT [dbo].[TipoMoneda] OFF
SET IDENTITY_INSERT [dbo].[CuentaDebito] ON 

INSERT [dbo].[CuentaDebito] ([idCuentaDebito], [idCliente], [Desripcion], [idTipoMoneda], [Estado], [SaldoReal], [SaldoFlotante]) VALUES (100000000, 1000000000, N'Lavado dinero', 1, 1, 40000.0000, 36000.0000)
INSERT [dbo].[CuentaDebito] ([idCuentaDebito], [idCliente], [Desripcion], [idTipoMoneda], [Estado], [SaldoReal], [SaldoFlotante]) VALUES (100000001, 1000000000, N'prestamos', 1, 1, 80000.0000, 73895.0000)
SET IDENTITY_INSERT [dbo].[CuentaDebito] OFF
SET IDENTITY_INSERT [dbo].[Proposito] ON 

INSERT [dbo].[Proposito] ([idProposito], [Proposito], [TasaInteres]) VALUES (1, N'MAtrimonio', 0)
SET IDENTITY_INSERT [dbo].[Proposito] OFF
SET IDENTITY_INSERT [dbo].[CuentaAhorro] ON 

INSERT [dbo].[CuentaAhorro] ([idCuentaAhorro], [CIF], [NumeroCuentaDebito], [idProposito], [Periodicidad], [FechaInicio], [DuracionAhorro], [FechaFinal], [MontoAhorro], [idTipoMoneda], [MontoAhorroActual], [MontoAhorroDeseado], [FechaProximoPago], [terminoAhorro], [dominioPeriodicidad]) VALUES (2, 1000000000, 100000000, 1, 20, CAST(N'2014-01-01 00:00:00.000' AS DateTime), 30, CAST(N'2013-01-01 00:00:00.000' AS DateTime), 1000.0000, 1, 5000.0000, 8000.0000, CAST(N'2014-01-01 00:01:40.000' AS DateTime), 1, N'segundos')
INSERT [dbo].[CuentaAhorro] ([idCuentaAhorro], [CIF], [NumeroCuentaDebito], [idProposito], [Periodicidad], [FechaInicio], [DuracionAhorro], [FechaFinal], [MontoAhorro], [idTipoMoneda], [MontoAhorroActual], [MontoAhorroDeseado], [FechaProximoPago], [terminoAhorro], [dominioPeriodicidad]) VALUES (5, 1000000000, 100000001, 1, 2, CAST(N'2014-01-01 00:00:00.000' AS DateTime), 30, CAST(N'2014-12-12 00:00:00.000' AS DateTime), 555.0000, 1, 6105.0000, 5588.0000, CAST(N'2014-01-01 00:22:00.000' AS DateTime), 1, N'minutos')
SET IDENTITY_INSERT [dbo].[CuentaAhorro] OFF

USE [FlexCoreDataBase]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([CIF], [idTipoCliente]) VALUES (1000000000, 0)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Direccion] ON 

INSERT [dbo].[Direccion] ([idDireccion], [Direccion]) VALUES (1, N'200 metros este')
SET IDENTITY_INSERT [dbo].[Direccion] OFF
INSERT [dbo].[DireccionXCliente] ([idDireccion], [CIF]) VALUES (1, 1000000000)
SET IDENTITY_INSERT [dbo].[Telefono] ON 

INSERT [dbo].[Telefono] ([idTelefono], [Telefono]) VALUES (1, N'456575')
SET IDENTITY_INSERT [dbo].[Telefono] OFF
INSERT [dbo].[TelefonoxCliente] ([CIF], [idTelefono]) VALUES (1000000000, 1)
SET IDENTITY_INSERT [dbo].[ClienteFisico] ON 

INSERT [dbo].[ClienteFisico] ([idCLienteFisico], [CIF], [Nombre], [Apellido], [idImagenCliente], [Cedula], [idDireccionPrincipal], [idTelefonoPrincipal]) VALUES (1, 1000000000, N'Edward', N'umana', NULL, N'115260530', 1, 1)
SET IDENTITY_INSERT [dbo].[ClienteFisico] OFF
SET IDENTITY_INSERT [dbo].[TipoMoneda] ON 

INSERT [dbo].[TipoMoneda] ([idTipoMoneda], [Moneda]) VALUES (1, N'Colones')
INSERT [dbo].[TipoMoneda] ([idTipoMoneda], [Moneda]) VALUES (2, N'Dolares')
SET IDENTITY_INSERT [dbo].[TipoMoneda] OFF
SET IDENTITY_INSERT [dbo].[CuentaDebito] ON 

INSERT [dbo].[CuentaDebito] ([idCuentaDebito], [idCliente], [Desripcion], [idTipoMoneda], [Estado], [SaldoReal], [SaldoFlotante]) VALUES (100000000, 1000000000, N'Lavado dinero', 1, 1, 40000.0000, 36000.0000)
INSERT [dbo].[CuentaDebito] ([idCuentaDebito], [idCliente], [Desripcion], [idTipoMoneda], [Estado], [SaldoReal], [SaldoFlotante]) VALUES (100000001, 1000000000, N'prestamos', 1, 1, 80000.0000, 73895.0000)
SET IDENTITY_INSERT [dbo].[CuentaDebito] OFF
SET IDENTITY_INSERT [dbo].[Proposito] ON 

INSERT [dbo].[Proposito] ([idProposito], [Proposito], [TasaInteres]) VALUES (1, N'MAtrimonio', 10)
SET IDENTITY_INSERT [dbo].[Proposito] OFF
SET IDENTITY_INSERT [dbo].[CuentaAhorro] ON 

INSERT [dbo].[CuentaAhorro] ([idCuentaAhorro], [CIF], [NumeroCuentaDebito], [idProposito], [Periodicidad], [FechaInicio], [DuracionAhorro], [FechaFinal], [MontoAhorro], [idTipoMoneda], [MontoAhorroActual], [MontoAhorroDeseado], [FechaProximoPago], [terminoAhorro], [dominioPeriodicidad]) VALUES (2, 1000000000, 100000000, 1, 20, CAST(N'2014-01-01 00:00:00.000' AS DateTime), 30, CAST(N'2013-01-01 00:00:00.000' AS DateTime), 1000.0000, 1, 5000.0000, 8000.0000, CAST(N'2014-01-01 00:01:40.000' AS DateTime), 1, N'segundos')
INSERT [dbo].[CuentaAhorro] ([idCuentaAhorro], [CIF], [NumeroCuentaDebito], [idProposito], [Periodicidad], [FechaInicio], [DuracionAhorro], [FechaFinal], [MontoAhorro], [idTipoMoneda], [MontoAhorroActual], [MontoAhorroDeseado], [FechaProximoPago], [terminoAhorro], [dominioPeriodicidad]) VALUES (5, 1000000000, 100000001, 1, 2, CAST(N'2014-01-01 00:00:00.000' AS DateTime), 30, CAST(N'2014-12-12 00:00:00.000' AS DateTime), 555.0000, 1, 6105.0000, 5588.0000, CAST(N'2014-01-01 00:22:00.000' AS DateTime), 1, N'minutos')
SET IDENTITY_INSERT [dbo].[CuentaAhorro] OFF
