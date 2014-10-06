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
        public String crearCuentaAhorro(String CIF, String idProposito, String Periodicidad, String FechaInicio, String FechaFinal,
            String TiempoAhorro, String MontoAhorro, String NumeroCuentaOrigen, String Moneda, String DuracionAhorro)
        {
            //api/cbcuenta/crearCuentaAhorro?CIF=1000000006&idProposito=1&Periodicidad=1&FechaInicio=1&FechaFinal=1&TiempoAhorro=1&MontoAhorro=1&NumeroCuentaOrigen=1&Moneda=1&DuracionAhorro=1
            return instanceCuentaAbstract.crearCuentaAhorro(CIF, idProposito, Periodicidad, FechaInicio, FechaFinal,
             TiempoAhorro, MontoAhorro, NumeroCuentaOrigen, Moneda, DuracionAhorro);
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
