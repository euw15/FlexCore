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
    public class CBDiccionarioDatosController : ApiController
    {
        private CBDiccionarioDatosAbstract instanceDiccionarioAbstract;

        public CBDiccionarioDatosController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceDiccionarioAbstract = instanceConcreteFactory.CreateCBDiccionarioDatosAbstract();
        }

        [HttpGet]
        [ActionName("getDiccionarioDatos")]
        public DiccionarioDatos[] getDiccionarioDatos()
        {
            //api/cbdiccionariodatos/getDiccionarioDatos
            return instanceDiccionarioAbstract.getDiccionarioDatos();
        }

    }
}
