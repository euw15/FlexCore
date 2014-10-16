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

        [HttpPost]
        [ActionName("agregarBeneficiarosCuentaDebito")]
        public String agregarBeneficiarosCuentaDebito(int CIF, int numCuenta)
        {
            //api/CBBeneficiario/agregarBeneficiarosCuentaDebito?CIF=1000000000&numCuenta=900000000
            return instanceBeneficiarioAbstract.agregarBeneficiarosCuentaDebito(CIF, numCuenta);
        }
    }
}
