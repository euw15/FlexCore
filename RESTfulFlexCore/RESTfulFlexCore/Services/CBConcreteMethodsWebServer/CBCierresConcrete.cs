using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;
using System.Data;

namespace RESTfulFlexCore.Services
{
    public class CBCierresConcrete : CBCierresAbstract
    {
        public const string CacheKey = "CBCierres";

        public CBCierresConcrete() { 
        
        }

        //POST
        public override String crearCierreBancario()
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("EXEC crearCierreBancario;");
            }
            catch
            {
                return "fail";
            }

        }
        
        //GET
        public override Cierres[] consultarCierresBancarios()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarCierresBancarios");
            List<Cierres> cierresSelected = getTableGetCierres(table);
            return loadCache(cierresSelected);
        }


        public List<Cierres> getTableGetCierres(DataTable table)
        {
            List<Cierres> listCierres = new List<Cierres>();
            foreach (DataRow row in table.Rows)
            {
                int idCierre = -1;
                String FechaFinal = " ";


                if (table.Columns.Contains("idCierre") && row["idCierre"] != DBNull.Value) { idCierre = Convert.ToInt32(row["idCierre"]); }
                if (table.Columns.Contains("FechaFinal") && row["FechaFinal"] != DBNull.Value) { FechaFinal = row["FechaFinal"].ToString(); }    
                listCierres.Add(new Cierres
                {
                    FechaFinal = FechaFinal,
                    idCierre = idCierre,
                   
                });
            }
            return listCierres;
        }
       
        public Cierres[] loadCache(List<Cierres> dataToLoad)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    ctx.Cache[CacheKey] = dataToLoad.ToArray();
                    return (Cierres[])ctx.Cache[CacheKey];
                }
            }
            return null;
        }
    }
}