using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Models
{
    public class Historico
    {
        public String Fecha { get; set; }

        public int NumeroCuenta { get; set; }

        public int TipoTranssacion { get; set; }

        public int MontoTransferido { get; set; }

        public int idTranssacion { get; set; }
    }
}