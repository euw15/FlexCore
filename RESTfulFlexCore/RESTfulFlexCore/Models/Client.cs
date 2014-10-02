using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Models
{
    public class Client
    {
        public int CIF { get; set; }

        public int idTipoCliente { get; set; }

        public String tipoCliente { get; set; }

        public String Nombre { get; set; }

        public String Apellido { get; set; }
        
        public String Cedula { get; set; }
       
    }
}