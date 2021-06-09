using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataAccessLayer;

namespace IAS.Controllers
{
    public class supervisorController : Controller
    {
        private IASDBEntities db = new IASDBEntities();

        // GET: supervisor
        public ActionResult Index()
        {
            if (Session["managerid"] != null)
            {
                var supervisortables = db.supervisortables.Include(s => s.usertable);
                return View(supervisortables.ToList());
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: supervisor/Create
        public ActionResult Create()
        {
            if (Session["managerid"] != null)
            {
                ViewBag.userid = new SelectList(db.usertables, "id", "username");
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: supervisor/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,userid")] supervisortable supervisortable)
        {
            if (Session["managerid"] != null)
            {
                if (ModelState.IsValid)
                {
                    db.supervisortables.Add(supervisortable);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.userid = new SelectList(db.usertables, "id", "username", supervisortable.userid);
                return View(supervisortable);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: supervisor/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["managerid"] != null)
            {
                supervisortable supervisortable = db.supervisortables.Find(id);
                db.supervisortables.Remove(supervisortable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
