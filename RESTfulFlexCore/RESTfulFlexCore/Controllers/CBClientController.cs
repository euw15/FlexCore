using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using RESTfulFlexCore.Models;
using RESTfulFlexCore.Services;

namespace RESTfulFlexCore.Controllers
{
    public class CBClientController : ApiController
    {
        private CBClientAbstract instanceClientAbstract;

        public CBClientController()
        {
            CBConcreteFactoryWebServer instanceConcreteFactory = CBConcreteFactoryWebServer.initInstanceCBConcreteFactoryWebServer;
            instanceClientAbstract = instanceConcreteFactory.CreateCBClientAbstract();
        }

        [HttpGet]
        [ActionName("getClienteJuridicoPorConcepto")]
        public Client[] getClienteJuridicoPorConcepto(String concepto, String dato)
        {
            //api/cbclient/getClienteJuridicoPorConcepto?concepto=Nombre&dato=Daniel    
            return instanceClientAbstract.getClienteJuridicoPorConcepto(concepto, dato);
        }

        [HttpGet]
        [ActionName("getClienteFisicoPorConcepto")]
        public Client[] getClienteFisicoPorConcepto(String concepto, String dato)
        {
            //api/cbclient/getClienteFisicoPorConcepto?concepto=Nombre&dato=Daniel    
            return instanceClientAbstract.getClienteFisicoPorConcepto(concepto, dato);
        }

        [HttpGet]
        [ActionName("getClientesFisicosPorPaginacion")]
        public Client[] getClientesFisicosPorPaginacion(String cantidad, String inicio)
        {
            //api/cbclient/getClientesFisicosPorPaginacion?cantidad=1&inicio=1    
            return instanceClientAbstract.getClientesFisicosPorPaginacion(cantidad, inicio);
        }

        [HttpGet]
        [ActionName("getClientesJuridicosPorPaginacion")]
        public Client[] getClientesJuridicosPorPaginacion(String cantidad, String inicio)
        {
            //api/cbclient/getClientesJuridicosPorPaginacion?cantidad=1&inicio=1    
            return instanceClientAbstract.getClientesJuridicosPorPaginacion(cantidad, inicio);
        }

        [HttpGet]
        [ActionName("getDireccionesClienteJuridico")]
        public Client[] getDireccionesClienteJuridico(int CIF)
        {
            //api/cbclient/getDireccionesClienteJuridico?CIF= 
            return instanceClientAbstract.getDireccionesClienteJuridico(CIF);
        }

        [HttpGet]
        [ActionName("getDireccionesClienteFisico")]
        public Client[] getDireccionesClienteFisico(int CIF)
        {
            //api/cbclient/getDireccionesClienteFisico?CIF= 
            return instanceClientAbstract.getDireccionesClienteFisico(CIF);
        }

        [HttpGet]
        [ActionName("getTelefonosClienteFisico")]
        public Client[] getTelefonosClienteFisico(int CIF)
        {
            //api/cbclient/getTelefonosClienteFisico?CIF= 
            return instanceClientAbstract.getTelefonosClienteFisico(CIF);
        }

        [HttpGet]
        [ActionName("getTelefonosClienteJuridico")]
        public Client[] getTelefonosClienteJuridico(int CIF)
        {
            //api/cbclient/getTelefonosClienteJuridico?CIF= 
            return instanceClientAbstract.getTelefonosClienteJuridico(CIF);
        }

        [HttpGet]
        [ActionName("cantidadClientesFisicos")]
        public Client[] cantidadClientesFisicos()
        {
            //api/cbclient/cantidadClientesFisicos 
            return instanceClientAbstract.cantidadClientesFisicos();
        }

        [HttpGet]
        [ActionName("cantidadClientesJuridico")]
        public Client[] cantidadClientesJuridico()
        {
            //api/cbclient/cantidadClientesJuridico 
            return instanceClientAbstract.cantidadClientesJuridico();
        }     

        [HttpPost]
        [ActionName("crearClienteJuridico")]
        public String crearClienteJuridico(String nombre, String cedula, String telefono, String direccion)
        {
            //api/cbclient/crearClienteJuridico?nombre=Daniel&cedula=304720959&telefono=83416438&direccion=Paraiso
            return instanceClientAbstract.crearClienteJuridico(nombre, cedula, telefono, direccion);
        }

        [HttpPost]
        [ActionName("crearClienteFisico")]
        public String crearClienteFisico(String nombre, String apellidos, String cedula, String telefono, String direccion)
        {
            //api/cbclient/crearClienteFisico?nombre=Daniel&apellidos=Canessa&cedula=3044720959&telefono=83416438&direccion=Paraiso
            return instanceClientAbstract.crearClienteFisico(nombre, apellidos, cedula, telefono, direccion);
        }
        
        [HttpPost]
        [ActionName("actualizarClienteFisico")]
        public String actualizarClienteFisico(int CIF)
        {
            //api/cbclient/actualizarClienteFisico?CIF=54652345
            return instanceClientAbstract.actualizarClienteFisico(CIF);
        }

        [HttpPost]
        [ActionName("actualizarClienteJuridico")]
        public String actualizarClienteJuridico(int CIF)
        {
            //api/cbclient/actualizarClienteJuridico?CIF=54652345
            return instanceClientAbstract.actualizarClienteJuridico(CIF);
        }

        [HttpPost]
        [ActionName("eliminarClienteFisico")]
        public String eliminarClienteFisico(int CIF)
        {
            //api/cbclient/eliminarClienteFisico?CIF=54652345
            return instanceClientAbstract.eliminarClienteFisico(CIF);
        }

        [HttpPost]
        [ActionName("eliminarClienteJuridico")]
        public String eliminarClienteJuridico(int CIF)
        {
            //api/cbclient/eliminarClienteJuridico?CIF=54652345
            return instanceClientAbstract.eliminarClienteJuridico(CIF);
        }

        [HttpPost]
        [ActionName("agregarDireccionCliente")]
        public String agregarDireccionCliente(int CIF, String direccion)
        {
            //api/cbclient/agregarDireccionCliente?CIF=1000000001&direccion=Paraiso
            return instanceClientAbstract.agregarDireccionCliente(CIF, direccion);
        }

        [HttpPost]
        [ActionName("agregarTelefonoCliente")]
        public String agregarTelefonoCliente(int CIF, int telefono)
        {
            //api/cbclient/agregarTelefonoCliente?CIF=1000000000&telefono=1234567
            return instanceClientAbstract.agregarTelefonoCliente(CIF, telefono);
        }
     
    }

}
