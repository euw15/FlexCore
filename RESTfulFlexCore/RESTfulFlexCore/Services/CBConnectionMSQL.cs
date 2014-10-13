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

        public static String insertMSQL(string query)
        {
            SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=daniel;" +
                                        "password=dcanessa;server=ENVY15-3040NR;" +
                                        "Trusted_Connection=no;" +
                                        "database=FlexCoreDataBase; " +
                                        "connection timeout=30");

          /*  SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=json;" +
                                        "password=123456;server=JASON04;" +
                                        "Trusted_Connection=no;" +
                                        "database=FlexCoreDataBase; " +
                                        "connection timeout=30");
           */

            DataTable table = new DataTable();
            SqlTransaction transaccion = null;
            SqlCommand command = null;
            try
            {
                connection.Open();
                transaccion = connection.BeginTransaction();
                command = connection.CreateCommand();
                command.Transaction = transaccion;
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();
                table.Load(reader);
                transaccion.Commit();
                return table.Rows[0][0].ToString();
            }
            catch (Exception e)
            {
                if (transaccion != null)
                {
                    transaccion.Rollback();
                }
                System.Diagnostics.Debug.WriteLine(e.ToString());
                return "fail";
            }
            finally
            {
                connection.Close();
                transaccion.Dispose();
                command.Dispose();
                connection.Dispose();
            }
        }

        public static String UpdateDeleteMSQL(string query)
        {
               /* SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=json;" +
                                          "password=123456;server=JASON04;" +
                                          "Trusted_Connection=no;" +
                                          "database=FlexCoreDataBase; " +
                                          "connection timeout=30");*/

                SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=daniel;" +
                                            "password=dcanessa;server=ENVY15-3040NR;" +
                                            "Trusted_Connection=no;" +
                                            "database=FlexCoreDataBase; " +
                                            "connection timeout=30"); 
                SqlTransaction transaccion = null;
            SqlCommand command = null;
            try
            {
                connection.Open();
                transaccion = connection.BeginTransaction();
                command = connection.CreateCommand();
                command.Transaction = transaccion;
                command.CommandText = query;
                command.ExecuteNonQuery();
                transaccion.Commit();
                return "sucess";
            }
            catch (Exception e)
            {
                if (transaccion != null)
                {
                    transaccion.Rollback();
                }
                System.Diagnostics.Debug.WriteLine(e.ToString());
                return "fail";
            }
            finally
            {
                connection.Close();
                transaccion.Dispose();
                command.Dispose();
                connection.Dispose();
            }
        }

        public static DataTable retrieveMSQL(string query)
        {

              /*SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=json;" +
                                      "password=123456;server=JASON04;" +
                                      "Trusted_Connection=no;" +
                                      "database=FlexCoreDataBase; " +
                                      "connection timeout=30");*/



              SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=daniel;" +
                                         "password=dcanessa;server=ENVY15-3040NR;" +
                                         "Trusted_Connection=no;" +
                                         "database=FlexCoreDataBase; " +
                                         "connection timeout=30");

              DataTable table = new DataTable();
            SqlTransaction transaccion = null;
            SqlCommand command = null;
            try
            {
                connection.Open();
                transaccion = connection.BeginTransaction();
                command = connection.CreateCommand();
                command.Transaction = transaccion;
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();
                table.Load(reader);
                transaccion.Commit();
            }
            catch (Exception e)
            {
                if (transaccion != null)
                {
                    transaccion.Rollback();
                }
                System.Diagnostics.Debug.WriteLine(e.ToString());
            }
            finally
            {
                connection.Close();
                transaccion.Dispose();
                command.Dispose();
                connection.Dispose();
            }
            return table;

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

/*  public static String insertMSQL(string query)
  {
      SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=daniel;" +
                                  "password=dcanessa;server=ENVY15-3040NR;" +
                                  "Trusted_Connection=no;" +
                                  "database=FlexCoreDataBase; " +
                                  "connection timeout=30");
      DataTable table = new DataTable();
      try
      {
          connection.Open();
          SqlCommand command = new SqlCommand(query, connection);
          SqlDataReader reader = command.ExecuteReader();
          table.Load(reader);
          return table.Rows[0][0].ToString();
      }
      catch (Exception e)
      {
          System.Diagnostics.Debug.WriteLine(e.ToString());
          return "fail";
      }
      finally
      {

          connection.Close();

      }
  }*/

/*
public static DataTable retrieveMSQL(string query)
        {
            DataTable table = new DataTable();        

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

    }
}
*/