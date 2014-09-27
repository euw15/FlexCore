using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace RESTfulCoreBancario.Services
{
    public abstract class CBAbstractFactoryWebServer
    {
        public abstract CBClientAbstract CreateCBClientAbstract();
    }
}