using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using RESTfulCoreBancario.Models;
using RESTfulCoreBancario.Services;

namespace RESTfulCoreBancario.Controllers
{
    public class CBClientController : ApiController
    {
        private CBClientAbstract instanceClientAbstract;

        public CBClientController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceClientAbstract = instanceConcreteFactory.CreateCBClientAbstract();
        }

        [HttpGet]
        [ActionName("getClient")]
        public Client[] getClient()
        {
            //http://localhost:62830/api/cbclient/getclient
            return instanceClientAbstract.getClient();
        }


    }
}
