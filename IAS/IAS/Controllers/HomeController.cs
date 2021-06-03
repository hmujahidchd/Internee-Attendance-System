
using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IAS.Controllers
{
    public class HomeController : Controller
    {
        IASDBEntities DB = new IASDBEntities();
        public ActionResult Index()
        {
            if(Session["email"]!=null)
            {
                if (Session["managerid"] != null)
                {
                    return RedirectToAction("index", "internee");
                }
                else if (Session["supervisorid"] != null)
                {
                    return RedirectToAction("index", "internee");
                }
                else if (Session["interneeid"] != null)
                {
                    return View();
                }
            }
            return RedirectToAction("LogIn");
        }
        public ActionResult LogIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LogIn(FormCollection form)
        {
            if (Session["email"] != null)
            {
                return RedirectToAction("Index");
            }
            var user = DB.usertables.ToList().FirstOrDefault(e => e.email.ToUpper() == form["email"].ToUpper());
            if(user == null)
            {
                ViewBag.Message = "Invalid email address.";
                return View();
            }
            else if(user.password != form["password"])
            {
                ViewBag.Message = "Wrong password.";
                return View();
            }
            var internee = DB.interneetables.ToList().FirstOrDefault(e => e.userid == user.id);
            var Supervisor = DB.supervisortables.ToList().FirstOrDefault(e => e.userid == user.id);
            var Manager = DB.managerstables.ToList().FirstOrDefault(e => e.userid == user.id);
            if (Manager !=null)
            {
                Session["managerid"] = Manager.id;
            }
            else if(Supervisor != null)
            {
                Session["supervisorid"] = Supervisor.id;
            }
            else if(internee !=null)
            {
                Session["interneeid"] = internee.id;
            }
            else
            {
                ViewBag.Message = "No role has been assynged to this email, Please contact manager.";
                return View();
            }
            Session["email"] = user.email;
            return RedirectToAction("index");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult LogOut()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }
    }
}