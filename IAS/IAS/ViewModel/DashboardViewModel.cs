using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.ViewModel
{
    public class DashboardViewModel
    {
        public usertable User { get; set; }
        public usertable Supervisor { get; set; }
        public List<MonthViewModel> Attendance { get; set; }
    }
}