using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using MVC_mcs_Ajax.DAL;

namespace MVC_mcs_Ajax.Controllers
{
    public class NewEquipmentsController : Controller
    {
        private MCSEntities db = new MCSEntities();

        // GET: newEquipments
        public ActionResult Index()
        {
            var newEquipments = db.newEquipments.Include(n => n.TablesManufacturer).Include(n => n.TablesModel);
            return View(newEquipments.ToList());
        }

        // GET: newEquipments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            newEquipment newEquipment = db.newEquipments.Find(id);
            if (newEquipment == null)
            {
                return HttpNotFound();
            }
            return View(newEquipment);
        }

        public PartialViewResult GetTrackMeterByEquipmentId(int equipmentId)
        {
            List<TrackMeter> query = db.newEquipments.FirstOrDefault(w => w.intEquipmentID == equipmentId)?.TrackMeters.ToList();
            Thread.Sleep(4000);
            return PartialView("NewEquipmentPartial", query);
        }

        // GET: newEquipments/Create
        public ActionResult Create()
        {
            ViewBag.intManufacturerID = new SelectList(db.TablesManufacturers, "intManufacturerID", "strManufacturerChecklistId");
            ViewBag.intModelID = new SelectList(db.TablesModels, "intModelID", "strName");
            return View();
        }

        // POST: newEquipments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "intEquipmentID,intGarageRoom,intManufacturerID,intModelID,strManufYear,intSNPrefixID,strSerialNo,intEquipmentTypeID,intSMCSFamilyID,intSizeID,CreateDate,intMetered,LastDate,intLastMetered,intTotalMetered,intlimitDay,intlimitWeek,bitActive,bitPreservation,bitMeter,bitKTG,isDelete,intLocationId,strDescription,floatCostTires,intCostTiresCurrency,floatAverageDivergence,floatFullPrice,intFullPriceCurrency,dateStartUpDate,intServiceLife,intHoweverOddsAcceleration,bitMethodAmortization")] newEquipment newEquipment)
        {
            if (ModelState.IsValid)
            {
                db.newEquipments.Add(newEquipment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.intManufacturerID = new SelectList(db.TablesManufacturers, "intManufacturerID", "strManufacturerChecklistId", newEquipment.intManufacturerID);
            ViewBag.intModelID = new SelectList(db.TablesModels, "intModelID", "strName", newEquipment.intModelID);
            return View(newEquipment);
        }

        // GET: newEquipments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            newEquipment newEquipment = db.newEquipments.Find(id);
            if (newEquipment == null)
            {
                return HttpNotFound();
            }
            ViewBag.intManufacturerID = new SelectList(db.TablesManufacturers, "intManufacturerID", "strManufacturerChecklistId", newEquipment.intManufacturerID);
            ViewBag.intModelID = new SelectList(db.TablesModels, "intModelID", "strName", newEquipment.intModelID);
            return View(newEquipment);
        }

        // POST: newEquipments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "intEquipmentID,intGarageRoom,intManufacturerID,intModelID,strManufYear,intSNPrefixID,strSerialNo,intEquipmentTypeID,intSMCSFamilyID,intSizeID,CreateDate,intMetered,LastDate,intLastMetered,intTotalMetered,intlimitDay,intlimitWeek,bitActive,bitPreservation,bitMeter,bitKTG,isDelete,intLocationId,strDescription,floatCostTires,intCostTiresCurrency,floatAverageDivergence,floatFullPrice,intFullPriceCurrency,dateStartUpDate,intServiceLife,intHoweverOddsAcceleration,bitMethodAmortization")] newEquipment newEquipment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(newEquipment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.intManufacturerID = new SelectList(db.TablesManufacturers, "intManufacturerID", "strManufacturerChecklistId", newEquipment.intManufacturerID);
            ViewBag.intModelID = new SelectList(db.TablesModels, "intModelID", "strName", newEquipment.intModelID);
            return View(newEquipment);
        }

        // GET: newEquipments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            newEquipment newEquipment = db.newEquipments.Find(id);
            if (newEquipment == null)
            {
                return HttpNotFound();
            }
            return View(newEquipment);
        }

        // POST: newEquipments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            newEquipment newEquipment = db.newEquipments.Find(id);
            db.newEquipments.Remove(newEquipment);
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
