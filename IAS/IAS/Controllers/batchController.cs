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
    public class batchController : Controller
    {
        private IASDBEntities db = new IASDBEntities();

        // GET: batch
        public ActionResult Index()
        {
            return View(db.batchtables.ToList());
        }

        // GET: batch/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            batchtable batchtable = db.batchtables.Find(id);
            if (batchtable == null)
            {
                return HttpNotFound();
            }
            return View(batchtable);
        }

        // GET: batch/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: batch/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,batch,sponsor")] batchtable batchtable)
        {
            if (ModelState.IsValid)
            {
                db.batchtables.Add(batchtable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(batchtable);
        }

        // GET: batch/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            batchtable batchtable = db.batchtables.Find(id);
            if (batchtable == null)
            {
                return HttpNotFound();
            }
            return View(batchtable);
        }

        // POST: batch/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,batch,sponsor")] batchtable batchtable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(batchtable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(batchtable);
        }

        // GET: batch/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            batchtable batchtable = db.batchtables.Find(id);
            if (batchtable == null)
            {
                return HttpNotFound();
            }
            return View(batchtable);
        }

        // POST: batch/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            batchtable batchtable = db.batchtables.Find(id);
            db.batchtables.Remove(batchtable);
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
