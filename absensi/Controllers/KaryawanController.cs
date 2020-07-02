using absensi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace absensi.Controllers
{
    public class KaryawanController : Controller
    {
        absensiDataContext db = new absensiDataContext();

        // GET: Karyawan
        public ActionResult Index()
        {
            var data = db.absensi_karyawans.ToList();
            return View(data);
        }

        // GET: Karyawan/Create
        public ActionResult Create()
        {
            ViewBag.id_upah = new SelectList(db.absensi_upahs.Select(c => new { idnya = c.id, nama = c.nama_golongan }).ToList(), "idnya", "nama");
            return View();
        }

        // POST: Karyawan/Create
        [HttpPost]
        public ActionResult Create(absensi_karyawan collection)
        {
            try
            {
                // TODO: Add insert logic here
                db.absensi_karyawans.InsertOnSubmit(collection);
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Karyawan/Edit/5
        public ActionResult Edit(int id)
        {
            ViewBag.id_upah = new SelectList(db.absensi_upahs.Select(c => new { idnya = c.id, nama = c.nama_golongan }).ToList(), "idnya", "nama");
            var data = db.absensi_karyawans.FirstOrDefault(x => x.id == id);
            return View(data);
        }

        // POST: Karyawan/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, absensi_karyawan collection)
        {
            try
            {
                // TODO: Add update logic here
                var data = db.absensi_karyawans.FirstOrDefault(x => x.id == id);
                data.nama = collection.nama;
                data.alamat = collection.alamat;
                data.nip = collection.nip;
                data.id_upah = collection.id_upah;
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Karyawan/Delete/5
        public ActionResult Delete(int id)
        {
            var data = db.absensi_karyawans.FirstOrDefault(x => x.id == id);
            return View(data);
        }

        // POST: Karyawan/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, absensi_karyawan collection)
        {
            try
            {
                // TODO: Add delete logic here
                var data = db.absensi_karyawans.FirstOrDefault(x => x.id == id);
                db.absensi_karyawans.DeleteOnSubmit(data);
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
