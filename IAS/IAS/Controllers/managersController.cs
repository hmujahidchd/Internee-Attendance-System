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
    public class managersController : Controller
    {
        private IASDBEntities db = new IASDBEntities();

        // GET: managers
        public ActionResult Index()
        {
            if (Session["managerid"] != null)
            {
                var managerstables = db.managerstables.Include(m => m.usertable);
                return View(managerstables.ToList());
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }


        // GET: managers/Create
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

        // POST: managers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,userid,designation")] managerstable managerstable)
        {
            if (Session["managerid"] != null)
            {
                if (ModelState.IsValid)
                {
                    db.managerstables.Add(managerstable);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.userid = new SelectList(db.usertables, "id", "username", managerstable.userid);
                return View(managerstable);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: managers/Edit/5
        public ActionResult Edit(int? id)
        {

            if (Session["managerid"] != null)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                managerstable managerstable = db.managerstables.Find(id);
                if (managerstable == null)
                {
                    return HttpNotFound();
                }
                ViewBag.userid = new SelectList(db.usertables, "id", "username", managerstable.userid);
                return View(managerstable);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }

        }

        // POST: managers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,userid,designation")] managerstable managerstable)
        {
            if (Session["managerid"] != null)
            {
                if (ModelState.IsValid)
                {
                    db.Entry(managerstable).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                ViewBag.userid = new SelectList(db.usertables, "id", "username", managerstable.userid);
                return View(managerstable);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            
        }

        // POST: managers/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["managerid"] != null)
            {
                managerstable managerstable = db.managerstables.Find(id);
                db.managerstables.Remove(managerstable);
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
