using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SheridanBookClub
{
    public class Book
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime ReleaseDate { get; set; }
        public string ISBN { get; set; }

        public Book(int id, string name, DateTime releaseDate, string iSBN)
        {
            Id = id;
            Name = name;
            ReleaseDate = releaseDate;
            ISBN = iSBN;
        }
    }
}