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
    public class CBTelefonoController : ApiController
    {
        private CBTelefonoAbstract instanceTelefonoAbstract;

        public CBTelefonoController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceTelefonoAbstract = instanceConcreteFactory.CreateCBTelefonoAbstract();
        }
    }
}
