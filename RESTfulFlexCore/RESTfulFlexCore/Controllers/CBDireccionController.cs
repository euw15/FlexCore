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
    public class CBDireccionController : ApiController
    {        
        private CBDireccionAbstract instanceDireccionAbstract;

        public CBDireccionController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceDireccionAbstract = instanceConcreteFactory.CreateCBDireccionAbstract();
        }
    }
}
