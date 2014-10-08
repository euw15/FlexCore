using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Services
{
    public abstract class CBImageAbstract
    {
        public abstract String insertImage(String clientAccount);

        public abstract Image[] getImage(int CIF);
    }
}