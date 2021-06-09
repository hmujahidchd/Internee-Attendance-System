using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.Models
{
    public class attendance
    {
        public int id { get; set; }
        public int interneeid { get; set; }
        public System.DateTime reportDatetime { get; set; }
        public System.DateTime leaveDatetime { get; set; }
        public int statusid { get; set; }
    }
}