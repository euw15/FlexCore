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
        [ActionName("getClient")]
        public Client[] getClient()
        {
            //api/cbclient/getclient            
            return instanceClientAbstract.getClient();
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
            return instanceClientAbstract.crearClienteFisico(nombre,apellidos, cedula, telefono, direccion);
        }
    }
   
}
