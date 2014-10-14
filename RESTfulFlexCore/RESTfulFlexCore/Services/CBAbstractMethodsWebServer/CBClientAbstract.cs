using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Services
{
    public abstract class CBClientAbstract
    {
        public abstract Client[] getClienteJuridicoPorConcepto(String concepto, String dato);

        public abstract Client[] getClienteFisicoPorConcepto(String concepto, String dato);

        public abstract Client[] getClientesFisicosPorPaginacion(String concepto, String dato);

        public abstract Client[] getClientesJuridicosPorPaginacion(String concepto, String dato);

        public abstract Client[] getDireccionesClienteJuridico(int CIF);

        public abstract Client[] getDireccionesClienteFisico(int CIF);

        public abstract Client[] getTelefonosClienteJuridico(int CIF);

        public abstract Client[] getTelefonosClienteFisico(int CIF);

        public abstract Client[] cantidadClientesFisicos();

        public abstract Client[] cantidadClientesJuridico();

        public abstract String crearClienteJuridico(String nombre, String cedula, String telefono, String direccion);

        public abstract String crearClienteFisico(String nombre, String apellidos, String cedula, String telefono, String direccion);

        public abstract String eliminarCliente(int CIF);     

        public abstract String actualizarClienteJuridico(String nombre, String cedula, String telefono, String direccion, int CIF);

        public abstract String actualizarClienteFisico(String nombre, String cedula, String telefono, String direccion, String apellido, int CIF);

        public abstract String agregarDireccionCliente(int CIF, String direccion);

        public abstract String agregarTelefonoCliente(int CIF, int telefono);



    }
}