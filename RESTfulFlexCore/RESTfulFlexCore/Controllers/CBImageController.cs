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
    public class CBImageController : ApiController
    {
        private CBImageAbstract instanceImageAbstract;

        public CBImageController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceImageAbstract = instanceConcreteFactory.CreateCBImageAbstract();
        }

        [HttpPost]
        [ActionName("insertImage")]
        public String insertImage(String clientAccount)
        {
            //api/cbimage/insertImage?clientAccount=45453121TYFJTY
            return instanceImageAbstract.insertImage(clientAccount);
        }

        [HttpGet]
        [ActionName("getImage")]
        public Image[] getImage(int ID)
        {
            //api/cbimage/getImage?ID=21
            return instanceImageAbstract.getImage(ID);
        }
    }
}
