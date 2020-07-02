using absensi.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace absensi.Controllers
{
    public class UpahController : Controller
    {
        absensiDataContext db = new absensiDataContext();
        // GET: Upah
        public ActionResult Index()
        {
            var data = db.absensi_upahs.ToList();
            return View(data);
        }

        // GET: Upah/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Upah/Create
        [HttpPost]
        public ActionResult Create(absensi_upah collection)
        {
            try
            {
                // TODO: Add insert logic here
                db.absensi_upahs.InsertOnSubmit(collection);
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Upah/Edit/5
        public ActionResult Edit(int id)
        {
            var data = db.absensi_upahs.FirstOrDefault(x => x.id == id);
            return View(data);
        }

        // POST: Upah/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, absensi_upah collection)
        {
            try
            {
                // TODO: Add update logic here
                var data = db.absensi_upahs.FirstOrDefault(x => x.id == id);
                data.nama_golongan = collection.nama_golongan;
                data.gaji = collection.gaji;
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Upah/Delete/5
        public ActionResult Delete(int id)
        {
            var data = db.absensi_upahs.FirstOrDefault(x => x.id == id);
            return View(data);
        }

        // POST: Upah/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, absensi_upah collection)
        {
            try
            {
                // TODO: Add delete logic here
                var data = db.absensi_upahs.FirstOrDefault(x => x.id == id);
                db.absensi_upahs.DeleteOnSubmit(data);
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
