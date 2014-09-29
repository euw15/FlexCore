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

        public CBClientConcrete()
        {

        }

        public override Client[] getClient()
        {
            System.Diagnostics.Debug.WriteLine("Data base");
            DataTable table = CBConnectionMSQL.retrieveMSQL("SELECT [ID] ,[Model] FROM [Envy].[dbo].[computer]");
            List<Client> clientSelected = getTableGetClient(table);
            return loadCache(clientSelected);
            
        }

        /*        
         * Auxiliar method that return a dataSet with the data that  is need in the method getClient
         */
        public List<Client> getTableGetClient(DataTable table)
        {
            int CIF = -1;
            int idTipoCliente = -1;

            List<Client> listClient = new List<Client>();

            foreach (DataRow row in table.Rows)
            {
                if (row["ID"] != DBNull.Value) { CIF = Convert.ToInt32(row["ID"]); }
                if (row["Model"] != DBNull.Value) { idTipoCliente = Convert.ToInt32(row["Model"]); }
                listClient.Add(new Client
                {
                    CIF = CIF,
                    idTipoCliente = idTipoCliente
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