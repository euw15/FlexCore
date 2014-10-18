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
    public class CBInteresesObtenidosController : ApiController
    {
        private CBInteresObtenidosAbstract instanceInteresesObtenidos;

        public CBInteresesObtenidosController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceInteresesObtenidos = instanceConcreteFactory.CreateCBInteresesObtenidosAbstract();
        }

        [HttpGet]
        [ActionName("obtenerInteresesObtenenidos")]
        public InteresesObtenidos[] obtenerInteresesObtenenidos()
        {
            //api/cbInteresesObtenidos/obtenerInteresesObtenenidos
            return instanceInteresesObtenidos.obtenerInteresesObtenenidos();
        }
    }
}
