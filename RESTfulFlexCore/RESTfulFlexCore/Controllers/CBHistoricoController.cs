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
    public class CBHistoricoController : ApiController
    {
    
        
        private CBHistoricoAbstract instanceHistoricoAbstract;

        public CBHistoricoController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceHistoricoAbstract = instanceConcreteFactory.CreateCBHistoricoAbstract();
        }

        [HttpGet]
        [ActionName("obtenerBitacoraErrores")]
        public Historico[] obtenerBitacoraErrores()
        {
            //api/cbhistorico/obtenerBitacoraErrores
            return instanceHistoricoAbstract.obtenerBitacoraErrores();
        }

        [HttpGet]
        [ActionName("verHistorico")]
        public Historico[] verHistorico()
        {
            //api/cbhistorico/verHistorico
            return instanceHistoricoAbstract.verHistorico();
        }
    
    }

}
