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
        public String crearCuentaAhorro(String CIF, int idProposito, int Periodicidad, String FechaInicio,
            int TiempoAhorro, int MontoAhorroPeriodico, int NumeroCuentaOrigen, String Moneda, String dominioPeriodicidad, int MontoAhorroDeseado)
        {
            //api/cbcuenta/crearCuentaAhorro?CIF = & idProposito = & Periodicidad = & FechaInicio = &  TiempoAhorro = & MontoAhorroPeriodico = & NumeroCuentaOrigen = & Moneda = & dominioPeriodicidad = & MontoAhorroDeseado
            return instanceCuentaAbstract.crearCuentaAhorro(CIF, idProposito, Periodicidad, FechaInicio, 
                TiempoAhorro, MontoAhorroPeriodico, NumeroCuentaOrigen, Moneda, dominioPeriodicidad, MontoAhorroDeseado);
        }

        [HttpPost]
        [ActionName("realizarPago")]
        public String realizarPago(String cuentaPago, String cuentaDestino, String monto)
        {
            //api/cbcuenta/realizarPago?cuentaPago=1000000006&cuentaDestino=524513241&monto=1000
            return instanceCuentaAbstract.realizarPago(cuentaPago, cuentaDestino, monto);
        }

        [HttpPost]
        [ActionName("pagosAutomaticos")]
        public String pagosAutomaticos()
        {
            //api/cbcuenta/pagosAutomaticos
            return instanceCuentaAbstract.pagosAutomaticos();
        }

        [HttpPost]
        [ActionName("agregarMetodoPago")]
        public String agregarMetodoPago(int idDispositivo, int idNumeroCuentaDebito)
        {
            //api/cbcuenta/agregarMetodoPago?idDispositivo=1000000006&idNumeroCuentaDebito=524513241
            return instanceCuentaAbstract.agregarMetodoPago(idDispositivo, idNumeroCuentaDebito);
        }
        
        [HttpPost]
        [ActionName("realizarPagoDispositivo")]
        public String realizarPagoDispositivo(int idDispositivo, int NumeroCuentaDestino, int MontoPago)
        {
            //api/cbcuenta/realizarPagoDispositivo?idDispositivo=1000000006&NumeroCuentaDestino=524513241&MontoPago=20000
            return instanceCuentaAbstract.realizarPagoDispositivo(idDispositivo, NumeroCuentaDestino, MontoPago);
        }

        [HttpGet]
        [ActionName("getObtenerPropositos")]
        public Cuenta[] getObtenerPropositos()
        {
            //api/cbcuenta/getObtenerPropositos
            return instanceCuentaAbstract.getObtenerPropositos();
        }

        [HttpGet]
        [ActionName("obtenerCuentasDebito")]
        public Cuenta[] obtenerCuentasDebito()
        {
            //api/cbcuenta/obtenerCuentasDebito
            return instanceCuentaAbstract.obtenerCuentasDebito();
        }

        [HttpGet]
        [ActionName("obtenerCuentasAhorro")]
        public Cuenta[] obtenerCuentasAhorro()
        {
            //api/cbcuenta/obtenerCuentasAhorro
            return instanceCuentaAbstract.obtenerCuentasAhorro();
        }
    

        [HttpGet]
        [ActionName("consultarCuentaAhorroCliente")]
        public Cuenta[] consultarCuentaAhorroCliente(int CIF)
        {
            //api/cbcuenta/consultarCuentaAhorroCliente?CIF=1000000000
            return instanceCuentaAbstract.consultarCuentaAhorroCliente(CIF);
        }

        [HttpGet]
        [ActionName("consultarCuentaDebitoCliente")]
        public Cuenta[] consultarCuentaDebitoCliente(int CIF)
        {
            //api/cbcuenta/consultarCuentaDebitoCliente?CIF=1000000000
            return instanceCuentaAbstract.consultarCuentaDebitoCliente(CIF);
        }


    }
}
