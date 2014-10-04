using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace RESTfulFlexCore.Services
{
    public class CBConnectionMSQL
    {
        public CBConnectionMSQL()
        {

        }

        public static void insertUpdateDeleteMSQL(string query)
        {
            /*   SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=json;" +
                                         "password=123456;server=JASON04;" +
                                         "Trusted_Connection=no;" +
                                         "database=FlexCoreDataBase; " +
                                         "connection timeout=30");
             */

            SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=daniel;" +
                                       "password=dcanessa;server=ENVY15-3040NR;" +
                                       "Trusted_Connection=no;" +
                                       "database=FlexCoreDataBase; " +
                                       "connection timeout=30");

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();

            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.ToString());
            }
            finally
            {
                connection.Close();
            }
        }

        public static DataTable retrieveMSQL(string query)
        {
            DataTable table = new DataTable();

            /*   SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=json;" +
                                      "password=123456;server=JASON04;" +
                                      "Trusted_Connection=no;" +
                                      "database=FlexCoreDataBase; " +
                                      "connection timeout=30");
          */

            SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=daniel;" +
                                       "password=dcanessa;server=ENVY15-3040NR;" +
                                       "Trusted_Connection=no;" +
                                       "database=FlexCoreDataBase; " +
                                       "connection timeout=30");

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                table.Load(reader);
            }
            catch (Exception e)
            {                    
                System.Diagnostics.Debug.WriteLine(e.ToString());
            }
            finally
            {
                connection.Close();
            }
            return table;

        }

        //Autoincrement
        public static String getAutoIncrement(String tabla, String columna)
        {
            try
            {
                DataTable table = CBConnectionMSQL.retrieveMSQL("select max(" + columna + ") as ID from " + tabla + "");
                return table.Rows[0]["ID"].ToString();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.ToString());
                return "";
            }
        }
    }
}

/*
 foreach (DataRow row in table.Rows)
 {
    System.Diagnostics.Debug.WriteLine(row["ID"].ToString());
    System.Diagnostics.Debug.WriteLine(row["Model"].ToString());
 }
*/

//SELECT IDENT_CURRENT('dbo.computer')-IDENT_INCR('dbo.computer')