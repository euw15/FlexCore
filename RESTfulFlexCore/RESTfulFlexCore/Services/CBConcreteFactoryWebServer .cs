﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Services
{
    public class CBConcreteFactoryWebServer : CBAbstractFactoryWebServer
    {
        private static CBConcreteFactoryWebServer instanceCBConcreteFactoryWebServer;

        private CBConcreteFactoryWebServer() {        
        }

        public static CBConcreteFactoryWebServer initInstanceCBConcreteFactoryWebServer
        {
            get
            {
                if (instanceCBConcreteFactoryWebServer == null)
                {
                    instanceCBConcreteFactoryWebServer = new CBConcreteFactoryWebServer();
                }
                return instanceCBConcreteFactoryWebServer;
            }
        }

        public override CBClientAbstract CreateCBClientAbstract()
        {
            return new CBClientConcrete();
        }

        public override CBImageAbstract CreateCBImageAbstract()
        {
            return new CBImageConcrete();
        }


    }
}