using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using RESTfulFlexCore.Models;
using RESTfulFlexCore.Services;

namespace RESTfulFlexCore.Controllers
{
    public class CBCuentaController : ApiController
    {
        private CBCuentaAbstract instanceCuentaAbstract;

        public CBCuentaController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceCuentaAbstract = instanceConcreteFactory.CreateCBCuentaAbstract();
        }

        [HttpPost]
        [ActionName("crearCuentaDebito")]
        public String crearCuentaDebito(int CIF, String descripcion, int moneda)
        {
            //api/cbcuenta/crearCuentaDebito?CIF=1000000006&descripcion=pagos&moneda=1
            return instanceCuentaAbstract.crearCuentaDebito(CIF, descripcion, moneda);
        }

        [HttpPost]
        [ActionName("crearCuentaAhorro")]
        public String crearCuentaAhorro(String CIF, int idProposito, int Periodicidad, String FechaInicio, String FechaFinal,
            int TiempoAhorro, int MontoAhorroPeriodico, int NumeroCuentaOrigen, String Moneda, String dominioPeriodicidad, int MontoAhorroDeseado)
        {
            //api/cbcuenta/crearCuentaAhorro?CIF = & idProposito = & Periodicidad = & FechaInicio = & FechaFinal = & TiempoAhorro = & MontoAhorroPeriodico = & NumeroCuentaOrigen = & Moneda = & dominioPeriodicidad = & MontoAhorroDeseado
            return instanceCuentaAbstract.crearCuentaAhorro(CIF, idProposito, Periodicidad, FechaInicio, FechaFinal,
                TiempoAhorro, MontoAhorroPeriodico, NumeroCuentaOrigen, Moneda, dominioPeriodicidad, MontoAhorroDeseado);
        }

        [HttpPost]
        [ActionName("realizarPago")]
        public String realizarPago(String cuentaPago, String cuentaDestino, String monto)
        {
            //api/cbcuenta/realizarPago?cuentaPago=1000000006&cuentaDestino=524513241&monto=1000
            return instanceCuentaAbstract.realizarPago(cuentaPago, cuentaDestino, monto);
        }

        [HttpGet]
        [ActionName("getObtenerPropositos")]
        public Cuenta[] getObtenerPropositos()
        {
            //api/cbcuenta/getObtenerPropositos
            return instanceCuentaAbstract.getObtenerPropositos();
        }


    }
}
