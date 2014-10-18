using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Services
{
    public abstract class CBAbstractFactoryWebServer
    {
        public abstract CBClientAbstract CreateCBClientAbstract();

        public abstract CBImageAbstract CreateCBImageAbstract();

        public abstract CBBeneficiarioAbstract CreateCBBeneficiarioAbstract();

        public abstract CBCuentaAbstract CreateCBCuentaAbstract();       

        public abstract CBDocumentosAbstract CreateCBDocumentosAbstract();

        public abstract CBMetodoPagoAbstract CreateCBMetodoPagoAbstract();

        public abstract CBTranssacionesVueloAbstract CreateCBTransaccionesVueloAbstract();

        public abstract CBCierresAbstract CreateCBCierresAbstract();

        public abstract CBHistoricoAbstract CreateCBHistoricoAbstract();

        public abstract CBInteresObtenidosAbstract CreateCBInteresesObtenidosAbstract();
      

    }
}