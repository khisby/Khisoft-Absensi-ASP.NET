using absensi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace absensi.Controllers
{
    public class AbsensiController : Controller
    {
        absensiDataContext db = new absensiDataContext();

        // GET: Absensi
        public ActionResult Index()
        {
            var data = db.absensi_absensis.ToList();
            return View(data);
        }

        // GET: Absensi/Create
        public ActionResult Create()
        {
            ViewBag.id_karyawan = new SelectList(db.absensi_karyawans.Select(c => new { idnya = c.id, nama = c.nama}).ToList(), "idnya", "nama");
            return View();
        }

        // POST: Absensi/Create
        [HttpPost]
        public ActionResult Create(absensi_absensi collection)
        {
            try
            {
                // TODO: Add insert logic here
                db.absensi_absensis.InsertOnSubmit(collection);
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
