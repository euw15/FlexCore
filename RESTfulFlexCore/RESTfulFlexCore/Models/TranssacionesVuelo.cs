using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Models
{
    public class TranssacionesVuelo
    {
        public int NumeroCuenta { get; set; }

        public int MontoTransferido { get; set; }

        public String TipoTranssacion { get; set; }

        public String Fecha { get; set; }
    }
    
}