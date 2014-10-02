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
    public class CBMetodoPagoController : ApiController
    {
        private CBMetodoPagoAbstract instanceMetodoPagoAbstract;

        public CBMetodoPagoController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceMetodoPagoAbstract = instanceConcreteFactory.CreateCBMetodoPagoAbstract();
        }
    }
}
