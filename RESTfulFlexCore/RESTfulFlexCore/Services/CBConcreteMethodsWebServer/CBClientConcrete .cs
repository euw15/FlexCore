using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;
using System.Data;

namespace RESTfulFlexCore.Services
{
    public class CBClientConcrete : CBClientAbstract
    {

        public const string CacheKey = "CBClient";

        //Constructor
        public CBClientConcrete()
        {

        }

        //POST
        public override String crearClienteJuridico(String nombre, String cedula, String telefono, String direccion)
        {
            try
            {
                return CBConnectionMSQL.insertMSQL("EXEC crearEmpleadoJuridico @Nombre = '" + nombre + "',@Cedula ='" + cedula + "',@Telefono='" + telefono + "',@Direccion='" + direccion + "';");
            
            }
            catch
            {
                return "fail";
            }
        }


        //POST
        public override String crearClienteFisico(String nombre, String apellidos, String cedula, String telefono, String direccion)
        {
            try
            {
                return CBConnectionMSQL.insertMSQL("EXEC crearEmpleadoFisico @Nombre = '" + nombre + "',@Apellidos='" + apellidos + "' ,@Cedula ='" + cedula + "' ,@Telefono = '" + telefono + "' ,@Direccion = '" + direccion + "';");
            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String eliminarClienteFisico(int CIF)
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("");
                
            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String eliminarClienteJuridico(int CIF)
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("");
                 
            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String actualizarClienteJuridico(String nombre, String cedula, String telefono, String direccion, int CIF)
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("EXEC actualizarClienteJuridico @Nombre = '" + nombre + "',  @Cedula = '" + cedula + "', @Telefono = '" + telefono + "', @Direccion = '" + direccion + "', @CIF = " + CIF + "");
                
            }
            catch
            {
                return "fail";
            }
        }

       
        //POST
        public override String actualizarClienteFisico(String nombre, String cedula, String telefono, String direccion, String apellido, int CIF)
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("EXEC actualizarClienteFisico @Nombre = '" + nombre + "',  @Cedula = '" + cedula + "', @Telefono = '" + telefono + "', @Direccion = '" + direccion + "', @Apellido = '" + apellido + "', @CIF = " + CIF + "");
                 
            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String agregarDireccionCliente(int CIF,String direccion)
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("EXEC  agregarDireccionCliente @CIF = " + CIF + ", @Direccion = '" + direccion + "'");

            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String agregarTelefonoCliente(int CIF,int telefono)
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("EXEC agregarTelefonoCliente @telefono = " + telefono + ",@CIF =" + CIF + " ");

            }
            catch
            {
                return "fail";
            }
        }

        //GET
        public override Client[] cantidadClientesJuridico()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC cantidadClientesJuridico");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] cantidadClientesFisicos()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC cantidadClientesFisicos");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] getClienteJuridicoPorConcepto(String concepto, String dato)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarClienteJuridicoPorConcepto @Concepto = '" + concepto + "', @Dato = '" + dato + "'");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] getClientesFisicosPorPaginacion(String cantidad, String inicio)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarClientesFisicos @Cantidad = '" + cantidad + "', @Inicio = '" + inicio + "'");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] getClientesJuridicosPorPaginacion(String cantidad, String inicio)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarClientesJuridicos  @Cantidad = '" + cantidad + "', @Inicio = '" + inicio + "'");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] getClienteFisicoPorConcepto(String concepto, String dato)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarClienteFisicosPorConcepto @Concepto = '" + concepto + "', @Dato = '" + dato + "'");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] getDireccionesClienteJuridico(int CIF)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC  obtenerDireccionesClienteJuridico @CIF = " + CIF + "");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] getDireccionesClienteFisico(int CIF)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC obtenerDireccionesClienteFisico @CIF =" + CIF + "");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] getTelefonosClienteJuridico(int CIF)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC obtenerTelefonosClienteJuridico @CIF = "+CIF+"");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        //GET
        public override Client[] getTelefonosClienteFisico(int CIF)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC obtenerTelefonosClienteFisico  @CIF = " + CIF + "");
            List<Client> clientSelected = getTableGetCliente(table);
            return loadCache(clientSelected);
        }

        public List<Client> getTableGetCliente(DataTable table)
        {

            List<Client> listClient = new List<Client>();
            foreach (DataRow row in table.Rows)
            {
                int CIF = -1;
                String nombre = " ";
                String apellido = " ";
                String cedula = " ";
                String telefono = " ";
                String direccion = " ";
                int cantClientes = -1;

                if (table.Columns.Contains("CIF") && row["CIF"] != DBNull.Value) { CIF = Convert.ToInt32(row["CIF"]); }
                if (table.Columns.Contains("Nombre") && row["Nombre"] != DBNull.Value) { nombre = row["Nombre"].ToString(); }
                if (table.Columns.Contains("Cedula") && row["Cedula"] != DBNull.Value) { cedula = row["Cedula"].ToString(); }
                if (table.Columns.Contains("Telefono") && row["Telefono"] != DBNull.Value) { telefono = row["Telefono"].ToString(); }
                if (table.Columns.Contains("Direccion") && row["Direccion"] != DBNull.Value) { direccion = row["Direccion"].ToString(); }
                if (table.Columns.Contains("Apellido") && row["Apellido"] != DBNull.Value) { apellido = row["Apellido"].ToString(); }
                if (table.Columns.Contains("id") && row["id"] != DBNull.Value) { cantClientes = Convert.ToInt32(row["id"]); }
                listClient.Add(new Client
                {
                    CIF = CIF,
                    nombre = nombre,
                    apellido = apellido,
                    cedula = cedula,
                    telefono = telefono,
                    direccion = direccion,
                    cantClientes = cantClientes
                });
            }
            return listClient;
        }

        public Client[] loadCache(List<Client> dataToLoad)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    ctx.Cache[CacheKey] = dataToLoad.ToArray();
                    return (Client[])ctx.Cache[CacheKey];
                }
            }
            return null;
        }

    }
}