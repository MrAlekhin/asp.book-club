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
        Dictionary<int, Book> bookCollection;
        protected void Page_Load(object sender, EventArgs e)
        {
            BookService.BookServiceClient client = new BookService.BookServiceClient();

            List<Book> bookList = client.GetBook(-1);
            bookCollection = new Dictionary<int, Book>();
            foreach (Book book in bookList)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.Attributes.Add("value", book.Id + "-" + book.Name);
                li.InnerText=book.Name;
                listBook.Controls.Add(li);

                bookCollection.Add(book.Id, book);
            }
            search.ServerClick += new EventHandler(this.search_Click);
        }

        protected void search_Click(object sender, EventArgs e)
        {
            int id=-1;
            string reviewer = Reviewer.Value;
            if (!Bookid.Value.Equals(string.Empty))
            {
                try
                {
                    id = int.Parse(Bookid.Value);
                    Book myValue;
                    if (bookCollection.TryGetValue(id, out myValue)) {
                        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Reviews;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                        try
                        {
                            con.Open();
                            SqlCommand command;
                            if (!reviewer.Equals(string.Empty))
                            {
                                command = new SqlCommand("SELECT * FROM Review WHERE BookID=@BookID OR UPPER(Reviewer)=UPPER(@Reviewer)", con);
                                command.Parameters.AddWithValue("@Reviewer", reviewer);
                            }
                            else
                            {
                                command = new SqlCommand("SELECT * FROM Review WHERE BookID=@BookID", con);
                            }
                            command.Parameters.AddWithValue("@BookID", myValue.Id);
                            SqlDataReader r = command.ExecuteReader();
                            Reviews.InnerHtml = "";
                            if (r.HasRows)
                            {
                                while (r.Read()) {
                                    HtmlGenericControl review = new HtmlGenericControl("div");
                                    HtmlGenericControl reviewHeader = new HtmlGenericControl("div");
                                    HtmlGenericControl reviewContent = new HtmlGenericControl("div");
                                    review.Attributes.Add("class", "review");
                                    reviewHeader.Attributes.Add("class", "header");
                                    reviewContent.Attributes.Add("class", "content");
                                    reviewHeader.InnerText = r.GetString(1) + " - " + r.GetDateTime(3);
                                    reviewContent.InnerText = r.GetString(2);
                                    review.Controls.Add(reviewHeader);
                                    review.Controls.Add(reviewContent);
                                    Reviews.Controls.Add(review);
                                }
                            }
                            else
                            {
                                Reviews.InnerHtml = "No Results";
                            }

                            r.Close();
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