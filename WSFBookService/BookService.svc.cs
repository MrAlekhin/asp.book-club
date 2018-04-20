using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace BookService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class BookService : IBookService
    {
        public int AddBook(string Name, DateTime ReleaseDate, string ISBN)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Books;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand("INSERT INTO Book(Name, ReleaseDate, ISBN) values (@N, @R, @I)", con);
                command.Parameters.AddWithValue("@N", Name);
                command.Parameters.AddWithValue("@R", ReleaseDate);
                command.Parameters.AddWithValue("@I", ISBN);
                return command.ExecuteNonQuery();
            }catch(SqlException ex)
            {
                return -1;
            }finally{
                if(con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
            
        }

        public SqlDataReader GetBook (int id)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Books;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            try
            {
                con.Open();
                SqlCommand command;
                if (id == -1)
                {
                    command = new SqlCommand("SELECT Id, Name, ReleaseDate, ISBN FROM Book", con);
                }
                else
                {
                    command = new SqlCommand("SELECT Id, Name, ReleaseDate, ISBN FROM Book WHERE Id=@I", con);
                }
                command.Parameters.AddWithValue("@I", id);
                SqlDataReader r = command.ExecuteReader();
                return r;
            }
            catch (SqlException ex)
            {
                return null;
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}
