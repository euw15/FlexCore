using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Models
{
    public class DiccionarioDatos
    {
        public int object_id { get; set; }

        public String tableBase { get; set; }

        public String column { get; set; }

        public String type { get; set; }

        public int max_lenght { get; set; }

        public String PermiteNulls { get; set; }

        public String EsAutonumerico { get; set; }

        public String Descripcion { get; set; }

        public String ForeignKey { get; set; }

        public String ReferenceTableName { get; set; }

        public String ReferenceColumnName { get; set; }

    }
}