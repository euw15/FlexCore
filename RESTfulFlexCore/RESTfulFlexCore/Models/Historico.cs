using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Models
{
    public class Historico
    {
        public int idBitacora { get; set; }

        public String Mensaje { get; set; }

        public int numeroError { get; set; }

        public String Fecha { get; set; }
  
    }
}