using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulCoreBancario.Models;

namespace RESTfulCoreBancario.Services
{
    public class CBClientConcrete : CBClientAbstract
    {

        public const string CacheKey = "CBClient";

        public CBClientConcrete()
        {

        }

        public override  void getClient()
        {
            System.Diagnostics.Debug.WriteLine("Entre a client correctamente");
        }



        /* 
         *  GET Method for post in the cache a json array of elements
         */
        public Client[] GetClient()
        {
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                return (Client[])ctx.Cache[CacheKey];
            }
            return null;
        }

    }
}