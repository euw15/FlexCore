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
    }
}
