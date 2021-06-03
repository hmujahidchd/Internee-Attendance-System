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
    public class interneeController : Controller
    {
        private IASDBEntities db = new IASDBEntities();

        // GET: internee
        public ActionResult Index()
        {
            var interneetables = db.interneetables.Include(i => i.batchtable).Include(i => i.supervisortable).Include(i => i.usertable);
            return View(interneetables.ToList());
        }

        // GET: internee/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            interneetable interneetable = db.interneetables.Find(id);
            if (interneetable == null)
            {
                return HttpNotFound();
            }
            return View(interneetable);
        }

        // GET: internee/Create
        public ActionResult Create()
        {
            ViewBag.batchid = new SelectList(db.batchtables, "id", "batch");
            ViewBag.supervisorid = new SelectList(db.supervisortables, "id", "id");
            ViewBag.userid = new SelectList(db.usertables, "id", "username");
            return View();
        }

        // POST: internee/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,batchid,userid,supervisorid")] interneetable interneetable)
        {
            if (ModelState.IsValid)
            {
                db.interneetables.Add(interneetable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.batchid = new SelectList(db.batchtables, "id", "batch", interneetable.batchid);
            ViewBag.supervisorid = new SelectList(db.supervisortables, "id", "id", interneetable.supervisorid);
            ViewBag.userid = new SelectList(db.usertables, "id", "username", interneetable.userid);
            return View(interneetable);
        }

        // GET: internee/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            interneetable interneetable = db.interneetables.Find(id);
            if (interneetable == null)
            {
                return HttpNotFound();
            }
            ViewBag.batchid = new SelectList(db.batchtables, "id", "batch", interneetable.batchid);
            ViewBag.supervisorid = new SelectList(db.supervisortables, "id", "id", interneetable.supervisorid);
            ViewBag.userid = new SelectList(db.usertables, "id", "username", interneetable.userid);
            return View(interneetable);
        }

        // POST: internee/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,batchid,userid,supervisorid")] interneetable interneetable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(interneetable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.batchid = new SelectList(db.batchtables, "id", "batch", interneetable.batchid);
            ViewBag.supervisorid = new SelectList(db.supervisortables, "id", "id", interneetable.supervisorid);
            ViewBag.userid = new SelectList(db.usertables, "id", "username", interneetable.userid);
            return View(interneetable);
        }

        // GET: internee/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            interneetable interneetable = db.interneetables.Find(id);
            if (interneetable == null)
            {
                return HttpNotFound();
            }
            return View(interneetable);
        }

        // POST: internee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            interneetable interneetable = db.interneetables.Find(id);
            db.interneetables.Remove(interneetable);
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
