using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Services
{
    public abstract class CBBeneficiarioAbstract
    {
        public abstract String agregarBeneficiarosCuentaDebito(int CIF, int numCuenta);
    }
}