using absensi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace absensi.Controllers
{
    public class LaporanController : Controller
    {
        absensiDataContext db = new absensiDataContext();
        public ActionResult JamkerjaIndex()
        {
            var data = db.absensi_karyawans.ToList();
            return View(data);
        }

        public ActionResult JamKerjaDetails(int id)
        {
            var data = db.absensi_absensis.Where(x => x.id_karyawan == id).OrderBy(x => x.tanggal).ToList();
            ViewBag.karyawan = db.absensi_karyawans.Where(x => x.id == id).First();
            return View(data);
        }

        public ActionResult UpahIndex()
        {
            var data = db.absensi_karyawans.ToList();
            return View(data);
        }

        public ActionResult UpahDetails(int id)
        {
            //var data = (from p in db.absensi_absensis where p.id_karyawan == id
            //            group p by new { month = p.tanggal.Month, year = p.tanggal.Year} into d
            //            select new { dt = string.Format("{0} - {1}", d.Key.year, d.Key.month), count = d.Count()});
            //select new { dt = string.Format("{0}/{1}", d.Key.month, d.Key.year), count = d.Count() }).OrderByDescending(g => g.dt);
            var data = db.absensi_absensis.Where(p => p.id_karyawan == id).GroupBy(p => new { month = p.tanggal.Month, year = p.tanggal.Year }).Select(p => new { dt = string.Format("{0}/{1}", p.Key.year, p.Key.month), data = string.Format("{0}", p.Sum(x=> x.jam_keluar.TotalHours - x.jam_masuk.TotalHours))}).ToList();
            //foreach (var x in data)
            //{
            //    System.Diagnostics.Debug.WriteLine("{0} - {1}",x.dt.ToString(), x.data);
            //}
            //var data = db.absensi_absensis.Where(x => x.id_karyawan == id).GroupBy()
            //Console.WriteLine("Okay disini");
            //System.Diagnostics.Debug.WriteLine("Okay disini");
            var karyawan = db.absensi_karyawans.Where(x => x.id == id).First();
            ViewBag.data = data;
            var upah = db.absensi_upahs.Where(x => x.id == karyawan.id_upah).First();
            ViewBag.upah = upah;
            ViewBag.karyawan = karyawan;
            return View(data);
        }


    }
}
