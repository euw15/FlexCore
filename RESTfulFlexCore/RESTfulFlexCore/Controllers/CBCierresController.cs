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
    public class CBCierresController : ApiController
    {
        private CBCierresAbstract instanceCierresAbstract;

        public CBCierresController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceCierresAbstract = instanceConcreteFactory.CreateCBCierresAbstract();
        }

        [HttpPost]
        [ActionName("crearCierreBancario")]
        public String crearCierreBancario()
        {
            //api/cbcierres/crearCierreBancario
            return instanceCierresAbstract.crearCierreBancario();
        }

        [HttpGet]
        [ActionName("consultarCierresBancarios")]
        public Cierres[] consultarCierresBancarios()
        {
            //api/cbcierres/consultarCierresBancarios  
            return instanceCierresAbstract.consultarCierresBancarios();
        }


    }
}
