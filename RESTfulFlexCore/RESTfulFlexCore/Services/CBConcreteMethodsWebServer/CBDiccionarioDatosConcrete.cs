using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;
using System.Data;

namespace RESTfulFlexCore.Services
{
    public class CBDiccionarioDatosConcrete : CBDiccionarioDatosAbstract
    {


        public const string CacheKey = "CBDiccionarioDatos";

        public CBDiccionarioDatosConcrete()
        {

        }

        //GET
        public override DiccionarioDatos[] getDiccionarioDatos()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC diccionaroDeDatos");
            List<DiccionarioDatos> diccionarioDatosSelect = getTableGetDiccionarioDatose(table);
            return loadCache(diccionarioDatosSelect);
        }

        public List<DiccionarioDatos> getTableGetDiccionarioDatose(DataTable table)
        {

            List<DiccionarioDatos> listDiccionarioDatos = new List<DiccionarioDatos>();
            foreach (DataRow row in table.Rows)
            {
                int object_id = -1;
                String tableBase = "";
                String column = "";
                String type = "";
                int max_lenght = -1;
                String PermiteNulls = "";
                String EsAutonumerico = "";
                String Descripcion = "";
                String ForeignKey = "";
                String ReferenceTableName = "";
                String ReferenceColumnName = "";

                if (table.Columns.Contains("object_id") && row["object_id"] != DBNull.Value) { object_id = Convert.ToInt32(row["object_id"]); }
                if (table.Columns.Contains("max_lenght") && row["max_lenght"] != DBNull.Value) { object_id = Convert.ToInt32(row["max_lenght"]); }
                if (table.Columns.Contains("Table") && row["Table"] != DBNull.Value) { tableBase = row["Table"].ToString(); }
                if (table.Columns.Contains("column") && row["column"] != DBNull.Value) { column = row["column"].ToString(); }
                if (table.Columns.Contains("type") && row["type"] != DBNull.Value) { type = row["type"].ToString(); }
                if (table.Columns.Contains("PermiteNulls") && row["PermiteNulls"] != DBNull.Value) { PermiteNulls = row["PermiteNulls"].ToString(); }
                if (table.Columns.Contains("EsAutonumerico") && row["EsAutonumerico"] != DBNull.Value) { EsAutonumerico = row["EsAutonumerico"].ToString(); }
                if (table.Columns.Contains("Descripcion") && row["Descripcion"] != DBNull.Value) { Descripcion = row["Descripcion"].ToString(); }
                if (table.Columns.Contains("ForeignKey") && row["ForeignKey"] != DBNull.Value) { ForeignKey = row["ForeignKey"].ToString(); }
                if (table.Columns.Contains("ReferenceTableName") && row["ReferenceTableName"] != DBNull.Value) { ReferenceTableName = row["ReferenceTableName"].ToString(); }
                if (table.Columns.Contains("ReferenceColumnName") && row["ReferenceColumnName"] != DBNull.Value) { ReferenceColumnName = row["ReferenceColumnName"].ToString(); }

                listDiccionarioDatos.Add(new DiccionarioDatos
                {
                    object_id = object_id,
                    tableBase = tableBase,
                    column = column,
                    type = type,
                    max_lenght = max_lenght,
                    PermiteNulls = PermiteNulls,
                    EsAutonumerico = EsAutonumerico,
                    Descripcion = Descripcion,
                    ForeignKey = ForeignKey,
                    ReferenceTableName = ReferenceTableName,
                    ReferenceColumnName = ReferenceColumnName
                });
            }
            return listDiccionarioDatos;
        }

        public DiccionarioDatos[] loadCache(List<DiccionarioDatos> dataToLoad)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    ctx.Cache[CacheKey] = dataToLoad.ToArray();
                    return (DiccionarioDatos[])ctx.Cache[CacheKey];
                }
            }
            return null;
        }

    }
}