using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;
using System.Data;

namespace RESTfulFlexCore.Services
{
    public class CBInteresesObtenidosConcrete : CBInteresObtenidosAbstract
    {
        public const string CacheKey = "CBInteresesObtenidos";

        public CBInteresesObtenidosConcrete() { }

        //GET
        public override InteresesObtenidos[] obtenerInteresesObtenenidos()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC obtenerInteresesObtenenidos");
            List<InteresesObtenidos> InteresesObtenidosSelected = getTableGetInteresesObtenidos(table);
            return loadCache(InteresesObtenidosSelected);
        }

        public List<InteresesObtenidos> getTableGetInteresesObtenidos(DataTable table)
        {
            List<InteresesObtenidos> listInteresesObtenidos = new List<InteresesObtenidos>();
            foreach (DataRow row in table.Rows)
            {
                int idInteresesObtenidos = -1;
                int interesCobrado = -1;
                int idCuentaAhorro = -1;
                double montoCobrado = -1;
                String Fecha = " ";


                if (table.Columns.Contains("idInteresesObtenidos") && row["idInteresesObtenidos"] != DBNull.Value) { idInteresesObtenidos = Convert.ToInt32(row["idInteresesObtenidos"]); }
                if (table.Columns.Contains("interesCobrado") && row["interesCobrado"] != DBNull.Value) { interesCobrado = Convert.ToInt32(row["interesCobrado"]); }
                if (table.Columns.Contains("idCuentaAhorro") && row["idCuentaAhorro"] != DBNull.Value) { idCuentaAhorro = Convert.ToInt32(row["idCuentaAhorro"]); }
                if (table.Columns.Contains("montoCobrado") && row["montoCobrado"] != DBNull.Value) { montoCobrado = Convert.ToDouble(row["montoCobrado"]); }
                if (table.Columns.Contains("Fecha") && row["Fecha"] != DBNull.Value) { Fecha = row["Fecha"].ToString(); }



                listInteresesObtenidos.Add(new InteresesObtenidos
                {
                    idInteresesObtenidos = idInteresesObtenidos,
                    interesCobrado = interesCobrado,
                    idCuentaAhorro = idCuentaAhorro,
                    montoCobrado = montoCobrado,
                    Fecha = Fecha
                });
            }
            return listInteresesObtenidos;
        }

        public InteresesObtenidos[] loadCache(List<InteresesObtenidos> dataToLoad)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    ctx.Cache[CacheKey] = dataToLoad.ToArray();
                    return (InteresesObtenidos[])ctx.Cache[CacheKey];
                }
            }
            return null;
        }
    }
}