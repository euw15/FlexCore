using System;
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

        public override CBBeneficiarioAbstract CreateCBBeneficiarioAbstract()
        {
            return new CBBeneficiarioConcrete();
        }
        public override CBCuentaAbstract CreateCBCuentaAbstract()
        {
            return new CBCuentaConcrete();
        }      
        public override CBDocumentosAbstract CreateCBDocumentosAbstract()
        {
            return new CBDocumentosConcrete();
        }
        public override CBMetodoPagoAbstract CreateCBMetodoPagoAbstract()
        {
            return new CBMetodoPagoConcrete();
        }
        public override CBTranssacionesVueloAbstract CreateCBTransaccionesVueloAbstract()
        {
            return new CBTranssacionesVueloConcrete();
        }
        public override CBCierresAbstract CreateCBCierresAbstract()
        {
            return new CBCierresConcrete();
        }
        public override CBHistoricoAbstract CreateCBHistoricoAbstract()
        {
            return new CBHistoricoConcrete();
        }
        public override CBInteresObtenidosAbstract CreateCBInteresesObtenidosAbstract()
        {
            return new CBInteresesObtenidosConcrete();
        }
        public override CBDiccionarioDatosAbstract CreateCBDiccionarioDatosAbstract()
        {
            return new CBDiccionarioDatosConcrete();
        }
   
     
        
    }
}