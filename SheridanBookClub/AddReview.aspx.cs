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
    public partial class AddReview : System.Web.UI.Page
    {
        int reviewCounter;
        private Dictionary<int, Book> bookCollection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["reviewCounter"] != null)
            {
                reviewCounter = (int)Session["reviewCounter"];
            }
            else
            {
                Session["reviewCounter"] = 0;
            }
            BookService.BookServiceClient client = new BookService.BookServiceClient();

            List<Book> bookList = client.GetBook(-1);
            bookCollection = new Dictionary<int, Book>();
            foreach (Book book in bookList)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes.Add("value", book.Id + "-" + book.Name);
                li.InnerText = book.Name;
                listBook.Controls.Add(li);

                bookCollection.Add(book.Id, book);
            }
            add.ServerClick += new EventHandler(this.add_Click);
        }

        protected void add_Click(object sender, EventArgs e)
        {
            int id = -1;
            string Reviewer = reviewer.Value;
            string Review = review.Value;
            if (!Bookid.Value.Equals(string.Empty) && !Reviewer.Equals(string.Empty) && !Review.Equals(string.Empty))
            {
                try
                {
                    id = int.Parse(Bookid.Value);
                    
                    Book myValue;
                    if (bookCollection.TryGetValue(id, out myValue))
                    {
                        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Reviews;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                        try
                        {
                            con.Open();
                            SqlCommand command;
                            if (!rate.Value.Equals(string.Empty))
                            {
                                command = new SqlCommand("INSERT INTO Review(Reviewer, Review, Date, Raiting, BookID) values (@Reviewer, @Review, @Date, @Raiting, @BookID)", con);
                                command.Parameters.AddWithValue("@Raiting", rate.Value);
                            }
                            else
                            {
                                command = new SqlCommand("INSERT INTO Review(Reviewer, Review, Date, BookID) values (@Reviewer, @Review, @Date, @BookID)", con);
                            }
                            command.Parameters.AddWithValue("@Date", DateTime.Now);
                            command.Parameters.AddWithValue("@Reviewer", Reviewer);
                            command.Parameters.AddWithValue("@Review", Review);
                            command.Parameters.AddWithValue("@BookID", myValue.Id);
                            int res = command.ExecuteNonQuery();
                            if(res > 0)
                            {
                                reviewCounter++;
                                Session["reviewCounter"] = reviewCounter;
                                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>" +
                               "alert('Successfuly Added! You added: " +
                                +reviewCounter+
                               " reviews')" +
                               "</SCRIPT>");
                            }
                            else
                            {
                                HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>" +
                              "alert('Something went wrong!')" +
                              "</SCRIPT>");
                            }
                        }
                        catch (Exception ex)
                        {


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
                catch(Exception ex)
                {

                }
            }
               
        }
    }
}