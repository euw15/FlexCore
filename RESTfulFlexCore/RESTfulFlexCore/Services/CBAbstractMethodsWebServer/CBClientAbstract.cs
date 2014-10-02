using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Services
{
    public abstract  class CBClientAbstract
    {
        public abstract Client[] getClient();

        public abstract String crearClienteJuridico(String nombre, String cedula, String telefono, String direccion);

        public abstract String crearClienteFisico(String nombre, String apellidos, String cedula, String telefono, String direccion);
    }
}