using DataAccessLayer;
using IAS.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IAS.Helper_Class
{
    public static class Cls_Supervisor
    {
        static IASDBEntities DB = new IASDBEntities();
        public static List<SupervisorViewModel> SupervisorList()
        {
            List<SupervisorViewModel> supervisorslist = new List<SupervisorViewModel>();
            foreach(var supervisor in DB.supervisortables.ToList())
            {
                supervisorslist.Add(
                    new SupervisorViewModel
                    {
                        id = supervisor.id,
                        userid = supervisor.userid,
                        username = supervisor.usertable.username,
                        user = supervisor.usertable
                    });
            }
            return supervisorslist;
        }
    }
}