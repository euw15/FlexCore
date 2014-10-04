using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Services
{
    public abstract  class CBClientAbstract
    {
        public abstract Client[] getClienteJuridicoPorConcepto(String concepto, String dato);

        public abstract Client[] getClienteFisicoPorConcepto(String concepto, String dato);

        public abstract Client[] getClientesFisicosPorPaginacion(String concepto, String dato);

        public abstract Client[] getClientesJuridicosPorPaginacion(String concepto, String dato);               

        public abstract String crearClienteJuridico(String nombre, String cedula, String telefono, String direccion);

        public abstract String crearClienteFisico(String nombre, String apellidos, String cedula, String telefono, String direccion);

        
        public abstract String eliminarClienteFisico(int CIF);
        
        public abstract String eliminarClienteJuridico(int CIF);
    
        public abstract String actualizarClienteJuridico(int CIF);
        
        public abstract String actualizarClienteFisico(int CIF);
       
    }
}