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
    public class userController : Controller
    {
        private IASDBEntities db = new IASDBEntities();

        // GET: user
        public ActionResult Index()
        {
            return View(db.usertables.ToList());
        }

        // GET: user/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            usertable usertable = db.usertables.Find(id);
            if (usertable == null)
            {
                return HttpNotFound();
            }
            return View(usertable);
        }

        // GET: user/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: user/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,username,email,password,fname,cnic")] usertable usertable)
        {
            if (ModelState.IsValid)
            {
                db.usertables.Add(usertable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(usertable);
        }

        // GET: user/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            usertable usertable = db.usertables.Find(id);
            if (usertable == null)
            {
                return HttpNotFound();
            }
            return View(usertable);
        }

        // POST: user/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,username,email,password,fname,cnic")] usertable usertable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usertable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(usertable);
        }

        // GET: user/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            usertable usertable = db.usertables.Find(id);
            if (usertable == null)
            {
                return HttpNotFound();
            }
            return View(usertable);
        }

        // POST: user/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            usertable usertable = db.usertables.Find(id);
            db.usertables.Remove(usertable);
            db.SaveChanges();
            return RedirectToAction("Index");
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
