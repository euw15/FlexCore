using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Models
{
    public class Client
    {
        public int CIF { get; set; }      

        public String tipoCliente { get; set; }

        public String nombre { get; set; }

        public String apellido { get; set; }
        
        public String cedula { get; set; }

        public String telefono { get; set; }

        public String direccion { get; set; }

        public int cantClientes { get; set; }      


       
    }
}