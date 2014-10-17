using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using RESTfulFlexCore.Services;

namespace RESTfulFlexCore.Controllers
{
    public class CBHistoricoController : ApiController
    {
    
        
        private CBHistoricoAbstract instanceClientAbstract;

        public CBHistoricoController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceClientAbstract = instanceConcreteFactory.CreateCBHistoricoAbstract();
        }
    
    }

}
