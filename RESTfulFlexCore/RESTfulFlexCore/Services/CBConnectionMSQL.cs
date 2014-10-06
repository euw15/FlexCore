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

       

        public static String insertUpdateDeleteMSQL(string query,int getAutoIncrement)
        {
               SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=json;" +
                                         "password=123456;server=JASON04;" +
                                         "Trusted_Connection=no;" +
                                         "database=FlexCoreDataBase; " +
                                         "connection timeout=30");


               /*SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=daniel;" +
                                          "password=dcanessa;server=ENVY15-3040NR;" +
                                          "Trusted_Connection=no;" +
                                          "database=FlexCoreDataBase; " +
                                          "connection timeout=30");*/

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
            
                
                if (getAutoIncrement == 1)
                {
                    return command.Parameters["ID"].Value.ToString();
                }
                else
                {
                    return "sucess";
                }

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
        }

        public static DataTable retrieveMSQL(string query)
        {
            DataTable table = new DataTable();

               SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=json;" +
                                      "password=123456;server=JASON04;" +
                                      "Trusted_Connection=no;" +
                                      "database=FlexCoreDataBase; " +
                                      "connection timeout=30");


               /*SqlConnection connection = new SqlConnection("Data Source=localhost;Network Library=DBMSSOCN; user id=daniel;" +
                                          "password=dcanessa;server=ENVY15-3040NR;" +
                                          "Trusted_Connection=no;" +
                                          "database=FlexCoreDataBase; " +
                                          "connection timeout=30");  */

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

/*
 foreach (DataRow row in table.Rows)
 {
    System.Diagnostics.Debug.WriteLine(row["ID"].ToString());
    System.Diagnostics.Debug.WriteLine(row["Model"].ToString());
 }
*/

//SELECT IDENT_CURRENT('dbo.computer')-IDENT_INCR('dbo.computer')