using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace BookService
{
    [DataContract]
    public class Book
    {
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        public string Name { get; set;}
        [DataMember]
        public DateTime ReleaseDate { get; set; }
        [DataMember]
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