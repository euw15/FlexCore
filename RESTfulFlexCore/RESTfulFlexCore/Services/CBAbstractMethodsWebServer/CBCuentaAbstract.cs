using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Services
{
    public abstract class CBCuentaAbstract
    {
        public abstract String crearCuentaDebito(int CIF, String descripcion, int moneda);

        public abstract String crearCuentaAhorro(String ClienteCIF, String idProposito, String Periodicidad, String FechaInicio, String FechaFinal,
            String TiempoAhorro, String MontoAhorro, String NumeroCuentaOrigen, String Moneda, String DuracionAhorro);
    }
}