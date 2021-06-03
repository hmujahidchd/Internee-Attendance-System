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
            var supervisortables = db.supervisortables.Include(s => s.usertable);
            return View(supervisortables.ToList());
        }

        // GET: supervisor/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            supervisortable supervisortable = db.supervisortables.Find(id);
            if (supervisortable == null)
            {
                return HttpNotFound();
            }
            return View(supervisortable);
        }

        // GET: supervisor/Create
        public ActionResult Create()
        {
            ViewBag.userid = new SelectList(db.usertables, "id", "username");
            return View();
        }

        // POST: supervisor/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,userid")] supervisortable supervisortable)
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

        // GET: supervisor/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            supervisortable supervisortable = db.supervisortables.Find(id);
            if (supervisortable == null)
            {
                return HttpNotFound();
            }
            ViewBag.userid = new SelectList(db.usertables, "id", "username", supervisortable.userid);
            return View(supervisortable);
        }

        // POST: supervisor/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,userid")] supervisortable supervisortable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(supervisortable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.userid = new SelectList(db.usertables, "id", "username", supervisortable.userid);
            return View(supervisortable);
        }

        // GET: supervisor/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            supervisortable supervisortable = db.supervisortables.Find(id);
            if (supervisortable == null)
            {
                return HttpNotFound();
            }
            return View(supervisortable);
        }

        // POST: supervisor/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            supervisortable supervisortable = db.supervisortables.Find(id);
            db.supervisortables.Remove(supervisortable);
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
