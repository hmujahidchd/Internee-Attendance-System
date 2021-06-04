using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DataAccessLayer;
using IAS.Helper_Class;

namespace IAS.Controllers
{
    public class interneeController : Controller
    {
        private IASDBEntities db = new IASDBEntities();

        // GET: internee
        public ActionResult Index()
        {
            if (Session["managerid"] != null || Session["supervisor"] != null)
            {
                var interneetables = db.interneetables.Include(i => i.batchtable).Include(i => i.supervisortable).Include(i => i.usertable);
                return View(interneetables.ToList());
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: internee/Create
        public ActionResult Create()
        {

            if (Session["managerid"] != null)
            {
                var usertables = db.usertables.ToList();
                var interneetables = db.interneetables.ToList();
                foreach(var internee in interneetables)
                {
                    var user = usertables.FirstOrDefault(e => e.id == internee.userid);
                    if(user !=null)
                    {
                        usertables.Remove(user);
                    }
                }
                ViewBag.batchid = new SelectList(db.batchtables, "id", "batch");
                ViewBag.supervisorid = new SelectList(Cls_Supervisor.SupervisorList(), "id", "username");
                ViewBag.userid = new SelectList(usertables, "id", "username");
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: internee/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,batchid,userid,supervisorid")] interneetable interneetable)
        {
            if (Session["managerid"] != null)
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
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: internee/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["managerid"] != null)
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
                ViewBag.supervisorid = new SelectList(Cls_Supervisor.SupervisorList(), "id", "username", interneetable.supervisorid);
                ViewBag.userid = new SelectList(db.usertables.ToList().Where(e=>e.id == interneetable.userid), "id", "username", interneetable.userid);
                return View(interneetable);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: internee/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,batchid,userid,supervisorid")] interneetable interneetable)
        {
            if (Session["managerid"] != null || Session["supervisor"] != null)
            {
                if (ModelState.IsValid)
                {
                    db.Entry(interneetable).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                ViewBag.batchid = new SelectList(db.batchtables, "id", "batch", interneetable.batchid);
                ViewBag.supervisorid = new SelectList(Cls_Supervisor.SupervisorList(), "id", "username", interneetable.supervisorid);
                ViewBag.userid = new SelectList(db.usertables.ToList().Where(e => e.id == interneetable.userid), "id", "username", interneetable.userid);
                return View(interneetable);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // POST: internee/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["managerid"] != null)
            {
                interneetable interneetable = db.interneetables.Find(id);
                db.interneetables.Remove(interneetable);
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
