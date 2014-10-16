using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Services
{
    public class CBBeneficiarioConcrete : CBBeneficiarioAbstract
    {
        public CBBeneficiarioConcrete() { 

        }

        //POST
        public override String agregarBeneficiarosCuentaDebito(int CIF, int numCuenta)
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("EXEC agregarBeneficiarosCuentaDebito @CIF = "+CIF+", @numeroCuentaDebito = "+numCuenta+"");

            }
            catch
            {
                return "fail";
            }
        }

    }
}