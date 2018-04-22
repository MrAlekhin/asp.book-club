using SheridanBookClub.BookService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SheridanBookClub
{
    public partial class AddBook : System.Web.UI.Page
    {
        private Dictionary<int, Book> bookCollection;
        BookServiceClient client;

        protected void Page_Load(object sender, EventArgs e)
        {
            client = new BookServiceClient();
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
            add.ServerClick += new EventHandler(this.add_click);
        }

        private void add_click(object sender, EventArgs e)
        {
            if (!name.Value.Equals(string.Empty) && !releaseDate.Value.Equals(string.Empty) && !isbn.Value.Equals(string.Empty))
            {

                if (client.AddBook(name.Value, DateTime.Parse(releaseDate.Value), isbn.Value) > 0)
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('Successful!');</script>");
                    listBook.InnerHtml = "";
                    client = new BookServiceClient();
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
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('Something went wrong :(');</script>");
                }
            }   
        }
    }
}