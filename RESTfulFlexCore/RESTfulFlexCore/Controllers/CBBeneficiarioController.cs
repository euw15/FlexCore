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
    public class CBBeneficiarioController : ApiController
    {
        private CBBeneficiarioAbstract instanceBeneficiarioAbstract;

        public CBBeneficiarioController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceBeneficiarioAbstract = instanceConcreteFactory.CreateCBBeneficiarioAbstract();
        }
    }
}
