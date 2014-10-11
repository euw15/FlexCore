using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;
using System.Data;
using System.IO;

namespace RESTfulFlexCore.Services
{
    public class CBImageConcrete : CBImageAbstract
    {
        public const string CacheKey = "CBImage";

        public override String insertImage(String clientAccount)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var conecction = HttpContext.Current;
            var inputStream = new StreamReader(conecction.Request.InputStream);
            string postData = inputStream.ReadToEnd();           
            if (!postData.Equals(""))
            {
                CBConnectionMSQL.UpdateDeleteMSQL(" EXEC agregarImagenCliente @imagen = '" + postData + "', @CIF ='" + clientAccount + "'");
                return "sucess";
            }
            else
            {
                return "fail";
            }           
        }

        public override Image[] getImage(int CIF)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC obtenerImagenCliente @CIF = "+CIF+"");
            List<Image> ImageSelected = getTableGetImage(table);
            return loadCache(ImageSelected);

        }

        /*        
         * Auxiliar method that return a dataSet with the data that  is need in the method getImage
         */
        public List<Image> getTableGetImage(DataTable table)
        {           
            String string64Image = "";

            List<Image> listImage = new List<Image>();

            foreach (DataRow row in table.Rows)
            {               
                if (row["imagen"] != DBNull.Value) { string64Image = row["imagen"].ToString(); }
                listImage.Add(new Image
                {                    
                    string64Image = string64Image
                });
            }
            return listImage;
        }

        public Image[] loadCache(List<Image> dataToLoad)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    ctx.Cache[CacheKey] = dataToLoad.ToArray();
                    return (Image[])ctx.Cache[CacheKey];
                }
            }
            return null;
        }      


    }
}