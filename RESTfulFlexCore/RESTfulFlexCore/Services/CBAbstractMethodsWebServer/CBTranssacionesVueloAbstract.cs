using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Services
{
    public abstract class CBTranssacionesVueloAbstract
    {
        public abstract TranssacionesVuelo[] consultarCuentaAhorroCliente(int CIF);

        public abstract TranssacionesVuelo[] consultarTransaccionesVuelo();
    }
}