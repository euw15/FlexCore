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
                CBConnectionMSQL.insertUpdateDeleteMSQL("EXEC crearEmpleadoJuridico @Nombre = '" + nombre + "',@Cedula ='" + cedula + "',@Telefono='" + telefono + "',@Direccion='" + direccion + "';");
                return "sucess";
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
                CBConnectionMSQL.insertUpdateDeleteMSQL("EXEC crearEmpleadoFisico @Nombre = '" + nombre + "',@Apellidos='" + apellidos + "' ,@Cedula ='" + cedula + "' ,@Telefono = '" + telefono + "' ,@Direccion = '" + direccion + "';");
                return "sucess";
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
                CBConnectionMSQL.insertUpdateDeleteMSQL("");
                return "sucess";
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
                CBConnectionMSQL.insertUpdateDeleteMSQL("");
                return "sucess";
            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String actualizarClienteJuridico(int CIF)
        {
            try
            {
                CBConnectionMSQL.insertUpdateDeleteMSQL("");
                return "sucess";
            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String actualizarClienteFisico(int CIF)
        {
            try
            {
                CBConnectionMSQL.insertUpdateDeleteMSQL("");
                return "sucess";
            }
            catch
            {
                return "fail";
            }
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



        public List<Client> getTableGetCliente(DataTable table)
        {

            List<Client> listClient = new List<Client>();
            foreach (DataRow row in table.Rows)
            {
                int CIF = -1;
                String nombre = "";
                String apellido = "";
                String cedula = "";
                String telefono = "";
                String direccion = "";

                if (row["CIF"] != DBNull.Value) { CIF = Convert.ToInt32(row["CIF"]); }
                if (row["Nombre"] != DBNull.Value) { nombre = row["Nombre"].ToString(); }
                if (row["Cedula"] != DBNull.Value) { cedula = row["Cedula"].ToString(); }
                if (row["Telefono"] != DBNull.Value) { telefono = row["Telefono"].ToString(); }
                if (row["Direccion"] != DBNull.Value) { direccion = row["Direccion"].ToString(); }
                // if (row["Model"] != DBNull.Value) { apellido = row["Model"].ToString(); }
                listClient.Add(new Client
                {
                    CIF = CIF,
                    nombre = nombre,
                    apellido = apellido,
                    cedula = cedula,
                    telefono = telefono,
                    direccion = direccion
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