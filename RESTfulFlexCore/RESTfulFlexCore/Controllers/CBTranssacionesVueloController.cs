using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using RESTfulFlexCore.Services;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Controllers
{
    public class CBTranssacionesVueloController : ApiController
    {
        private CBTranssacionesVueloAbstract instanceTranssacionesVueloAbstract;

        public CBTranssacionesVueloController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceTranssacionesVueloAbstract = instanceConcreteFactory.CreateCBTransaccionesVueloAbstract();
        }

        [HttpGet]
        [ActionName("consultarCuentaAhorroCliente")]
        public TranssacionesVuelo[] consultarCuentaAhorroCliente(int CIF)
        {
            //api/cbtranssacionesvuelo/consultarCuentaAhorroCliente?CIF=1000000000  
            return instanceTranssacionesVueloAbstract.consultarCuentaAhorroCliente(CIF);
        }


    }
}
