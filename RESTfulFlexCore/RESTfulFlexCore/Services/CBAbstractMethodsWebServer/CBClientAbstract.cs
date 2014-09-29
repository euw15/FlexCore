using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;

namespace RESTfulFlexCore.Services
{
    public abstract  class CBClientAbstract
    {
        public abstract Client[] getClient();
    }
}