using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Services
{
    public class CBHistoricoConcrete : CBHistoricoAbstract
    {

        public const string CacheKey = "CBHistorico";

        public CBHistoricoConcrete() { }

        public List<Historico> getTableGetHistorico (DataTable table)
        {
            List<Historico> listHistorico = new List<Historico>();
            foreach (DataRow row in table.Rows)
            {
                String Fecha = " ";
                int NumeroCuenta = -1;
                int TipoTranssacion = -1;
                int MontoTransferido = -1;
                int idTranssacion = -1;

                if (table.Columns.Contains("NumeroCuenta") && row["NumeroCuenta"] != DBNull.Value) { NumeroCuenta = Convert.ToInt32(row["NumeroCuenta"]); }
                if (table.Columns.Contains("TipoTranssacion") && row["TipoTranssacion"] != DBNull.Value) { TipoTranssacion = Convert.ToInt32(row["TipoTranssacion"]); }
                if (table.Columns.Contains("MontoTransferido") && row["MontoTransferido"] != DBNull.Value) { MontoTransferido = Convert.ToInt32(row["MontoTransferido"]); }
                if (table.Columns.Contains("idTranssacion") && row["idTranssacion"] != DBNull.Value) { idTranssacion = Convert.ToInt32(row["idTranssacion"]); }
                if (table.Columns.Contains("Fecha") && row["Fecha"] != DBNull.Value) { Fecha = row["Fecha"].ToString(); }
              
      
                listHistorico.Add(new Historico
                {
                    Fecha = Fecha,
                    NumeroCuenta = NumeroCuenta,
                    TipoTranssacion = TipoTranssacion,
                    MontoTransferido = MontoTransferido,
                    idTranssacion = idTranssacion                    
                });
            }
            return listHistorico;
        }

        public Historico[] loadCache(List<Historico> dataToLoad)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    ctx.Cache[CacheKey] = dataToLoad.ToArray();
                    return (Historico[])ctx.Cache[CacheKey];
                }
            }
            return null;
        }
    }
}