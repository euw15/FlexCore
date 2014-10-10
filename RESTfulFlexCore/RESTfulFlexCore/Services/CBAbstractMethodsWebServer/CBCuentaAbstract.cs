using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Services
{
    public abstract class CBCuentaAbstract
    {
        public abstract String crearCuentaDebito(int CIF, String descripcion, int moneda);

        public abstract String crearCuentaAhorro(String CIF, int idProposito, int Periodicidad, String FechaInicio, String FechaFinal,
            int TiempoAhorro, int MontoAhorroPeriodico, int NumeroCuentaOrigen, String Moneda, String dominioPeriodicidad, int MontoAhorroDeseado);

        public abstract String realizarPago(String cuentaPago, String cuentaDestino, String monto);

        public abstract String crearCierreBancario();

        public abstract String agregarMetodoPago(int idDispositivo, int idNumeroCuentaDebito);

        public abstract String realizarPagoDispositivo(int idDispositivo, int NumeroCuentaDestino, int MontoPago);

        public abstract Cuenta[] getObtenerPropositos();

        public abstract Cuenta[] consultarCuentaDebitoCliente(int CIF);

        public abstract Cuenta[] consultarCuentaAhorroCliente(int CIF);


    }
}