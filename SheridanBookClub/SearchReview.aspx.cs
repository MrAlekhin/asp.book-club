using SheridanBookClub.BookService;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SheridanBookClub
{
    public partial class SearchReview : System.Web.UI.Page
    {
        List<Book> bookList;
        protected void Page_Load(object sender, EventArgs e)
        {
            BookService.BookServiceClient client = new BookService.BookServiceClient();

            bookList = client.GetBook(-1);
            Dictionary<string, Book> bookCollection = new Dictionary<string, Book>();
            foreach (Book book in bookList)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes.Add("value", book.Id + "-" + book.Name + "-" + book.ISBN);
                li.InnerText=book.Name;
                listBook.Controls.Add(li);

                bookCollection.Add(book.Id+"-"+book.Name, book);
            }
            search.ServerClick += new EventHandler(this.search_Click);
        }

        protected void search_Click(object sender, EventArgs e)
        {
            foreach (Book book in bookList)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes.Add("value", book.Id + "-" + book.Name + "-" + book.ISBN);
                li.InnerText = book.Name;
                listBook.Controls.Add(li);

               
            }
            //SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Reviews;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Alert", "Data has been saved", true);
            //try
            //{
            //    con.Open();
            //    SqlCommand command = new SqlCommand("INSERT INTO Book(Name, ReleaseDate, ISBN) values (@N, @R, @I)", con);
            //    command.Parameters.AddWithValue("@N", Name);
            //    command.Parameters.AddWithValue("@R", ReleaseDate);
            //    command.Parameters.AddWithValue("@I", ISBN);
            //    return command.ExecuteNonQuery();
            //}
            //catch (SqlException ex)
            //{
            //    return -1;
            //}
            //finally
            //{
            //    if (con.State == System.Data.ConnectionState.Open)
            //    {
            //        con.Close();
            //    }
            //}
        }


    }
}