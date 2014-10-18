using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RESTfulFlexCore.Models;
using System.Data;

namespace RESTfulFlexCore.Services
{
    public class CBCuentaConcrete : CBCuentaAbstract
    {

        public const string CacheKey = "CBCuenta";


        public CBCuentaConcrete()
        {

        }

        //POST
        public override String crearCuentaDebito(int CIF, String descripcion, int moneda)
        {
            try
            {
                return CBConnectionMSQL.insertMSQL("EXEC crearCuentaDebito @ClienteCIF = '" + CIF + "', @Descripcion = '" + descripcion + "', @Moneda = '" + moneda + "'");

            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String crearCuentaAhorro(String CIF, int idProposito, int Periodicidad, String FechaInicio,
            int TiempoAhorro, int MontoAhorroPeriodico, int NumeroCuentaOrigen, String Moneda, String dominioPeriodicidad, int MontoAhorroDeseado)
        {
           
            try
            {
                return CBConnectionMSQL.insertMSQL("EXEC crearCuentaAhorro @ClienteCIF = N'" + CIF + "', @idProposito = " + idProposito + "," +
                "@Periodicidad = " + Periodicidad + ", @FechaInicio = N'" + FechaInicio + "', @TiempoAhorro = " + TiempoAhorro + ", "+
                "@MontoAhorroPeriodico = " + MontoAhorroPeriodico + ", @NumeroCuentaOrigen = " + NumeroCuentaOrigen + "," +
                " @Moneda = N'" + Moneda + "', @dominioPeriodicidad = N'" + dominioPeriodicidad + "', @MontoAhorroDeseado = " + MontoAhorroDeseado + "");
            }
            catch
            {
                return "fail";
            }
        }

        //POST
        public override String realizarPago(String cuentaPago, String cuentaDestino, String monto)
        {
            try
            {
                return CBConnectionMSQL.insertMSQL("EXEC realizarPago @NumeroCuentaDebito =" + cuentaPago + " , @NumeroCuentaDestino = " + cuentaDestino + ", @MontoPago =" + monto + "");
            }
            catch
            {
                return "fail";
            }
        }
       

        //POST
        public override String agregarMetodoPago(int idDispositivo, int idNumeroCuentaDebito )
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("EXEC agregarMetodoPago @idDispositivo = " + idDispositivo + ", @idNumeroCuentaDebito = " + idNumeroCuentaDebito + "");
            }
            catch
            {
                return "fail";
            }

        }

        //POST
        public override String pagosAutomaticos()
        {
            try
            {
                return CBConnectionMSQL.UpdateDeleteMSQL("EXEC pagosAutomaticos");
            }
            catch
            {
                return "fail";
            }

        }


        //POST
        public override String realizarPagoDispositivo(int idDispositivo, int NumeroCuentaDestino, int MontoPago)
        {
            try
            {
                return CBConnectionMSQL.insertMSQL("EXEC realizarPagoDispositivo @idDispositivo = " + idDispositivo + ", @NumeroCuentaDestino = " + NumeroCuentaDestino + " , @MontoPago = " + MontoPago + "");
            }
            catch
            {
                return "fail";
            }

        }

        //GET
        public override Cuenta[] getObtenerPropositos()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarPropositos");
            List<Cuenta> cuentaSelected = getTableGetCuenta(table);
            return loadCache(cuentaSelected);
        }

        //GET
        public override Cuenta[] consultarCuentaDebitoCliente(int CIF)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarCuentaDebitoCliente @CIF=" + CIF + "");
            List<Cuenta> cuentaSelected = getTableGetCuenta(table);
            return loadCache(cuentaSelected);
        }

        //GET
        public override Cuenta[] consultarCuentaAhorroCliente(int CIF)
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC consultarCuentaAhorroCliente @CIF=" + CIF + "");
            List<Cuenta> cuentaSelected = getTableGetCuenta(table);
            return loadCache(cuentaSelected);
        }

        //GET
        public override Cuenta[] obtenerCuentasDebito()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC obtenerCuentasDebito");
            List<Cuenta> cuentaSelected = getTableGetCuenta(table);
            return loadCache(cuentaSelected);
        }

        //GET
        public override Cuenta[] obtenerCuentasAhorro()
        {
            DataTable table = CBConnectionMSQL.retrieveMSQL("EXEC obtenerCuentaAhorro");
            List<Cuenta> cuentaSelected = getTableGetCuenta(table);
            return loadCache(cuentaSelected);
        }

       
        public List<Cuenta> getTableGetCuenta(DataTable table)
        {
            List<Cuenta> listCuenta = new List<Cuenta>();
            foreach (DataRow row in table.Rows)
            {
                int idCliente = -1;
                int Estado = -1;
                int CIF = -1;
                int numeroCuenta = -1;
                int TasaInteres = -1;
                int Periodicidad = -1;
                int DuracionAhorro = -1;
                int MontoAhorro = -1;
                String FechaInicio = " ";
                String FechaFinal = " ";
                String Desripcion = " ";
                String Moneda = " ";
                String Proposito = " ";
                double SaldoReal = -1;
                double SaldoFlotante = -1;
                int idProposito = -1;
                int idCuentaDebito = -1;
                int idTipoMoneda = -1;
                int idCuentaAhorro = -1;
                int NumeroCuentaDebito = -1;
                double MontoAhorroActual = -1;
                double MontoAhorroDeseado = -1;
                String FechaProximoPago = " ";
                int terminoAhorro = -1;
                String dominioPeriodicidad = " ";               
               

                if (table.Columns.Contains("idCliente") && row["idCliente"] != DBNull.Value) { idCliente = Convert.ToInt32(row["idCliente"]); }
                if (table.Columns.Contains("Estado") && row["Estado"] != DBNull.Value) { Estado = Convert.ToInt32(row["Estado"]); }
                if (table.Columns.Contains("CIF") && row["CIF"] != DBNull.Value) { CIF = Convert.ToInt32(row["CIF"]); }
                if (table.Columns.Contains("numeroCuenta") && row["numeroCuenta"] != DBNull.Value) { numeroCuenta = Convert.ToInt32(row["numeroCuenta"]); }
                if (table.Columns.Contains("TasaInteres") && row["TasaInteres"] != DBNull.Value) { TasaInteres = Convert.ToInt32(row["TasaInteres"]); }
                if (table.Columns.Contains("Periodicidad") && row["Periodicidad"] != DBNull.Value) { Periodicidad = Convert.ToInt32(row["Periodicidad"]); }
                if (table.Columns.Contains("DuracionAhorro") && row["DuracionAhorro"] != DBNull.Value) { DuracionAhorro = Convert.ToInt32(row["DuracionAhorro"]); }
                if (table.Columns.Contains("MontoAhorro") && row["MontoAhorro"] != DBNull.Value) { MontoAhorro = Convert.ToInt32(row["MontoAhorro"]); }
                if (table.Columns.Contains("FechaInicio") && row["FechaInicio"] != DBNull.Value) { FechaInicio = row["FechaInicio"].ToString(); }
                if (table.Columns.Contains("FechaFinal") && row["FechaFinal"] != DBNull.Value) { FechaFinal = row["FechaFinal"].ToString(); }
                if (table.Columns.Contains("Desripcion") && row["Desripcion"] != DBNull.Value) { Desripcion = row["Desripcion"].ToString(); }
                if (table.Columns.Contains("Moneda") && row["Moneda"] != DBNull.Value) { Moneda = row["Moneda"].ToString(); }
                if (table.Columns.Contains("Proposito") && row["Proposito"] != DBNull.Value) { Proposito = row["Proposito"].ToString(); }
                if (table.Columns.Contains("SaldoReal") && row["SaldoReal"] != DBNull.Value) { SaldoReal = Convert.ToDouble(row["SaldoReal"]); }
                if (table.Columns.Contains("SaldoFlotante") && row["SaldoFlotante"] != DBNull.Value) { SaldoFlotante = Convert.ToDouble(row["SaldoFlotante"]); }
                if (table.Columns.Contains("idProposito") && row["idProposito"] != DBNull.Value) { idProposito = Convert.ToInt32(row["idProposito"]); }
                if (table.Columns.Contains("idCuentaDebito") && row["idCuentaDebito"] != DBNull.Value) { idCuentaDebito = Convert.ToInt32(row["idCuentaDebito"]); }
                if (table.Columns.Contains("idTipoMoneda") && row["idTipoMoneda"] != DBNull.Value) { idTipoMoneda = Convert.ToInt32(row["idTipoMoneda"]); }

                if (table.Columns.Contains("idCuentaAhorro") && row["idCuentaAhorro"] != DBNull.Value) { idCuentaAhorro = Convert.ToInt32(row["idCuentaAhorro"]); }
                if (table.Columns.Contains("NumeroCuentaDebito") && row["NumeroCuentaDebito"] != DBNull.Value) { NumeroCuentaDebito = Convert.ToInt32(row["NumeroCuentaDebito"]); }
                if (table.Columns.Contains("MontoAhorroActual") && row["MontoAhorroActual"] != DBNull.Value) { MontoAhorroActual = Convert.ToDouble(row["MontoAhorroActual"]); }
                if (table.Columns.Contains("MontoAhorroDeseado") && row["MontoAhorroDeseado"] != DBNull.Value) { MontoAhorroDeseado = Convert.ToDouble(row["MontoAhorroDeseado"]); }
                if (table.Columns.Contains("terminoAhorro") && row["terminoAhorro"] != DBNull.Value) { terminoAhorro = Convert.ToInt32(row["terminoAhorro"]); }
                if (table.Columns.Contains("dominioPeriodicidad") && row["dominioPeriodicidad"] != DBNull.Value) { dominioPeriodicidad = row["dominioPeriodicidad"].ToString(); }
                if (table.Columns.Contains("FechaProximoPago") && row["FechaProximoPago"] != DBNull.Value) { FechaProximoPago = row["FechaProximoPago"].ToString(); }

                listCuenta.Add(new Cuenta
                {
                    idCliente = idCliente,
                    Estado = Estado,
                    CIF = CIF,
                    numeroCuenta = numeroCuenta,
                    TasaInteres = TasaInteres,
                    Periodicidad = Periodicidad,
                    DuracionAhorro = DuracionAhorro,
                    MontoAhorro = MontoAhorro,
                    FechaInicio = FechaInicio,
                    FechaFinal = FechaFinal,
                    Desripcion = Desripcion,
                    Moneda = Moneda,
                    Proposito = Proposito,
                    SaldoReal = SaldoReal,
                    SaldoFlotante = SaldoFlotante,
                    idProposito = idProposito,
                    idCuentaDebito = idCuentaDebito,
                    idTipoMoneda = idTipoMoneda,
                    idCuentaAhorro = idCuentaAhorro,
                    NumeroCuentaDebito = NumeroCuentaDebito,
                    MontoAhorroActual = MontoAhorroActual,
                    MontoAhorroDeseado = MontoAhorroDeseado,
                    FechaProximoPago = FechaProximoPago,
                    terminoAhorro = terminoAhorro,
                    dominioPeriodicidad = dominioPeriodicidad   

                });
            }
            return listCuenta;
        }

        public Cuenta[] loadCache(List<Cuenta> dataToLoad)
        {
            HttpContext.Current.Cache.Remove(CacheKey);
            var ctx = HttpContext.Current;
            if (ctx != null)
            {
                if (ctx.Cache[CacheKey] == null)
                {
                    ctx.Cache[CacheKey] = dataToLoad.ToArray();
                    return (Cuenta[])ctx.Cache[CacheKey];
                }
            }
            return null;
        }

    }
}