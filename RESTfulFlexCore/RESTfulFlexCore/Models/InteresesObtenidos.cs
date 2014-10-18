using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Models
{
    public class InteresesObtenidos
    {
        public int idInteresesObtenidos { get; set; }

        public int interesCobrado { get; set; }

        public int idCuentaAhorro { get; set; }

        public double montoCobrado { get; set; }

        public String Fecha { get; set; }
    }
}