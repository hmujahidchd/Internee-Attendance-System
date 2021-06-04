using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.ViewModel
{
    public class AttendanceReportModel
    {
        public usertable User { get; set; }
        public usertable Supervisor { get; set; }
        public MonthViewModel Month { get; set; }
    }
}