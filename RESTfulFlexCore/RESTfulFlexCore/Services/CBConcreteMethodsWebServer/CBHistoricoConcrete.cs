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

        //GET
        public override Historico[] obtenerBitacoraErrores()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC obtenerBitacoraErrores");
            List<Historico> HistoricoSelected = getTableGetHistorico(table);
            return loadCache(HistoricoSelected);
        }

        //GET
        public override Historico[] verHistorico()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC verHistorico");
            List<Historico> HistoricoSelected = getTableGetHistorico(table);
            return loadCache(HistoricoSelected);
        }

        public List<Historico> getTableGetHistorico(DataTable table)
        {
            List<Historico> listHistorico = new List<Historico>();
            foreach (DataRow row in table.Rows)
            {
                String Mensaje = " ";
                int idBitacora = -1;
                String Fecha = " ";
                int numeroError = -1;
                int idTranssacion = -1;
                int NumeroCuenta = -1;
                String TipoTranssacion = " ";
                int MontoTransferido = -1;




                if (table.Columns.Contains("idBitacora") && row["idBitacora"] != DBNull.Value) { idBitacora = Convert.ToInt32(row["idBitacora"]); }
                if (table.Columns.Contains("numeroError") && row["numeroError"] != DBNull.Value) { numeroError = Convert.ToInt32(row["numeroError"]); }
                if (table.Columns.Contains("numeroError") && row["numeroError"] != DBNull.Value) { numeroError = Convert.ToInt32(row["numeroError"]); }
                if (table.Columns.Contains("idTranssacion") && row["idTranssacion"] != DBNull.Value) { idTranssacion = Convert.ToInt32(row["idTranssacion"]); }
                if (table.Columns.Contains("NumeroCuenta") && row["NumeroCuenta"] != DBNull.Value) { NumeroCuenta = Convert.ToInt32(row["NumeroCuenta"]); }
                if (table.Columns.Contains("MontoTransferido") && row["MontoTransferido"] != DBNull.Value) { MontoTransferido = Convert.ToInt32(row["MontoTransferido"]); }
                if (table.Columns.Contains("Mensaje") && row["Mensaje"] != DBNull.Value) { Mensaje = row["Mensaje"].ToString(); }
                if (table.Columns.Contains("TipoTranssacion") && row["TipoTranssacion"] != DBNull.Value) { TipoTranssacion = row["TipoTranssacion"].ToString(); }
                if (table.Columns.Contains("Fecha") && row["Fecha"] != DBNull.Value) { Fecha = row["Fecha"].ToString(); }


                listHistorico.Add(new Historico
                {
                    Mensaje = Mensaje,
                    idBitacora = idBitacora,
                    Fecha = Fecha,
                    numeroError = numeroError,
                    idTranssacion = idTranssacion,
                    NumeroCuenta = NumeroCuenta,
                    TipoTranssacion = TipoTranssacion,
                    MontoTransferido = MontoTransferido
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