﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RESTfulFlexCore.Models
{
    public class Cuenta
    {

        public int idCliente { get; set; }

        public String Desripcion { get; set; }
        
        public String Moneda { get; set; }

        public int Estado { get; set; }

        public double SaldoReal { get; set; }

        public double SaldoFlotante { get; set; }

        public int CIF { get; set; }

        public int numeroCuenta { get; set; }

        public String Proposito { get; set; }

        public int TasaInteres { get; set; }

        public int Periodicidad { get; set; }

        public int DuracionAhorro { get; set; }

        public int MontoAhorro { get; set; }

        public String FechaInicio { get; set; }

        public String FechaFinal { get; set; }

        public int idProposito { get; set; }

        public int idCuentaDebito { get; set; }

        public int idTipoMoneda { get; set; }

        public int idCuentaAhorro { get; set; }

        public int NumeroCuentaDebito { get; set; }

        public double MontoAhorroActual { get; set; }

        public double MontoAhorroDeseado { get; set; }

        public String FechaProximoPago { get; set; }

        public int terminoAhorro { get; set; }

        public String dominioPeriodicidad { get; set; }
	
    }
}