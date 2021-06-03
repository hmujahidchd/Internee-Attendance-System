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
            if (Session["managerid"] != null)
            {
                return View(db.batchtables.ToList());
            }
            else
            {
                return RedirectToAction("Index","Home");
            }
        }


        // GET: batch/Create
        public ActionResult Create()
        {

            if (Session["managerid"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: batch/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,batch,sponsor")] batchtable batchtable)
        {
            if (Session["managerid"] != null)
            {
                if (ModelState.IsValid)
                {
                    db.batchtables.Add(batchtable);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(batchtable);

            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: batch/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["managerid"] != null)
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
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: batch/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,batch,sponsor")] batchtable batchtable)
        {

            if (Session["managerid"] != null)
            {
                if (ModelState.IsValid)
                {
                    db.Entry(batchtable).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(batchtable);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: batch/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["managerid"] != null)
            {
                batchtable batchtable = db.batchtables.Find(id);
                db.batchtables.Remove(batchtable);
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
