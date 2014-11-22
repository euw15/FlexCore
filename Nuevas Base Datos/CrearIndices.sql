GO
USE FlexCoreDataBase2;

GO
CREATE NONCLUSTERED INDEX IDC_CIF ON Cliente (CIF)

GO
CREATE NONCLUSTERED INDEX IDC_TipoCliento on TipoCliente (idTipoCliente)

GO
CREATE NONCLUSTERED INDEX IDC_CIFClienteFisico on ClienteFisico (CIF)

GO
CREATE NONCLUSTERED INDEX IDC_NombreClienteFisico on ClienteFisico (Nombre)

GO
CREATE NONCLUSTERED INDEX IDC_CIFClienteJuridico on ClienteJuridico (CIF)

GO
CREATE NONCLUSTERED INDEX IDC_NombreClienteJuridico on ClienteJuridico (Nombre)

GO
CREATE NONCLUSTERED INDEX IDC_idClienteCuentaDebito on CuentaDebito (idCliente)


GO
CREATE NONCLUSTERED INDEX IDC_SaldoRealCuentaDebito on CuentaDebito (SaldoReal)


GO
CREATE NONCLUSTERED INDEX IDC_SaldoFlotanteCuentaDebito on CuentaDebito (SaldoFlotante)


GO
CREATE NONCLUSTERED INDEX IDC_NumeroCuentaDebitoMetodoPago on MetodoPago (NumeroCuentaDebito)

GO
CREATE NONCLUSTERED INDEX IDC_idDispositivoMetodoPago on MetodoPago (idDispositivo)

GO
CREATE NONCLUSTERED INDEX IDC_CIFCuentaAhorro on CuentaAhorro (CIF)

GO
CREATE NONCLUSTERED INDEX IDC_NumeroCuentaDebitoCuentaAhorro on CuentaAhorro (NumeroCuentaDebito)

GO
CREATE NONCLUSTERED INDEX IDC_MontoAhorroCuentaAhorro on CuentaAhorro (MontoAhorro)
