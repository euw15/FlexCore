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
    public class CBDocumentosController : ApiController
    {
        private CBDocumentosAbstract instanceDocumentosAbstract;

        public CBDocumentosController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceDocumentosAbstract = instanceConcreteFactory.CreateCBDocumentosAbstract();
        }
    }
}
