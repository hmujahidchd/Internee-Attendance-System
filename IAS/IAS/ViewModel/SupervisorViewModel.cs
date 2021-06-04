using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.ViewModel
{
    public class SupervisorViewModel
    {
        public int id { get; set; }
        public int userid { get; set; }
        public usertable user { get; set; }
        public string username { get; set; }
    }
}