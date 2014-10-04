using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Services
{
    public class CBCuentaConcrete : CBCuentaAbstract
    {
        public CBCuentaConcrete()
        {

        }

        //POST
        public override String crearCuentaDebito(int CIF, String descripcion, int moneda)
        {
            try
            {
                String flag = CBConnectionMSQL.insertUpdateDeleteMSQL("EXEC crearCuentaDebito @ClienteCIF = '" + CIF + "', @Descripcion = '" + descripcion + "', @Moneda = '" + moneda + "'");
                if (flag == "sucess")
                {
                    return CBConnectionMSQL.getAutoIncrement("CuentaDebito", "idCuentaDebito");
                }
                else
                {
                    return "fail";
                }
            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String crearCuentaAhorro(String ClienteCIF, String idProposito, String Periodicidad, String FechaInicio, String FechaFinal,
            String TiempoAhorro, String MontoAhorro, String NumeroCuentaOrigen, String Moneda, String DuracionAhorro)
        {
            try
            {
                String flag = CBConnectionMSQL.insertUpdateDeleteMSQL("@ClienteCIF = '" + ClienteCIF + "',	@idProposito = '" + idProposito + "',	@Periodicidad = '" + Periodicidad + "',	@FechaInicio = '" + FechaInicio + "',	" +
                    "@FechaFinal = '" + FechaFinal + "',	@TiempoAhorro = '" + TiempoAhorro + "',	@MontoAhorro = '" + MontoAhorro + "',	@NumeroCuentaOrigen = '" + NumeroCuentaOrigen + "',	" +
                    "@Moneda = '" + Moneda + "',	@DuracionAhorro = '" + DuracionAhorro + "'");
                if (flag == "sucess")
                { 
                    return CBConnectionMSQL.getAutoIncrement("CuentaAhorro", "idCuentaAhorro"); 
                }
                else
                {
                    return "fail";
                }
            }
            catch
            {
                return "fail";
            }
        }

    }
}