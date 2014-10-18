using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;
using System.Data;

namespace RESTfulFlexCore.Services
{
    public class CBTranssacionesVueloConcrete : CBTranssacionesVueloAbstract
    {
        public const string CacheKey = "CBTranssacionesVuelo";

        public CBTranssacionesVueloConcrete()
        {
        }

        //GET
        public override TranssacionesVuelo[] consultarCuentaAhorroCliente(int CIF)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarTranssaccionesCliente @CIF= "+CIF+"");
            List<TranssacionesVuelo> cuentaSelected = getTableGetTranssacionesVuelo(table);
            return loadCache(cuentaSelected);
        }

        public override TranssacionesVuelo[] consultarTransaccionesVuelo()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC verTransEnVuelo");
            List<TranssacionesVuelo> cuentaSelected = getTableGetTranssacionesVuelo(table);
            return loadCache(cuentaSelected);
        }


        public List<TranssacionesVuelo> getTableGetTranssacionesVuelo(DataTable table)
        {
            List<TranssacionesVuelo> listTranssacionesVuelo = new List<TranssacionesVuelo>();
            foreach (DataRow row in table.Rows)
            {
                int NumeroCuenta = -1;
                int MontoTransferido = -1;
                String TipoTranssacion = " ";
                String Fecha = " ";

                if (table.Columns.Contains("NumeroCuenta") && row["NumeroCuenta"] != DBNull.Value) { NumeroCuenta = Convert.ToInt32(row["NumeroCuenta"]); }
                if (table.Columns.Contains("MontoTransferido") && row["MontoTransferido"] != DBNull.Value) { MontoTransferido = Convert.ToInt32(row["MontoTransferido"]); }
                if (table.Columns.Contains("TipoTranssacion") && row["TipoTranssacion"] != DBNull.Value) { TipoTranssacion = row["TipoTranssacion"].ToString(); }
                if (table.Columns.Contains("Fecha") && row["Fecha"] != DBNull.Value) { Fecha = row["Fecha"].ToString(); }


                listTranssacionesVuelo.Add(new TranssacionesVuelo
                {
                    NumeroCuenta = NumeroCuenta,
                    MontoTransferido = MontoTransferido,
                    TipoTranssacion = TipoTranssacion,
                    Fecha = Fecha

                });
            }
            return listTranssacionesVuelo;
        }

        public TranssacionesVuelo[] loadCache(List<TranssacionesVuelo> dataToLoad)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    ctx.Cache[CacheKey] = dataToLoad.ToArray();
                    return (TranssacionesVuelo[])ctx.Cache[CacheKey];
                }
            }
            return null;
        }
    }
}