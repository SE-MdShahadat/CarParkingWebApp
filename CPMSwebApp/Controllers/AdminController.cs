using CPMSDAL;
using CPMSDBModel.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CPMSwebApp.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        AdminList objList;
        [HttpPost]
        public JsonResult SaveAdmin(AdminDBModel _dbModel)
        {
            int _result = 0;
            objList = new AdminList();
            _result = objList.SaveAdmin(_dbModel);
            if (_result > 0)
                return Json(new { success = true });
            else
                return Json(new { success = false });
        }
        [HttpGet]
        public JsonResult LoadAllAdmin()
        {
            objList = new AdminList();
            List<AdminDBModel> _dbModelList = new List<AdminDBModel>();
            _dbModelList = objList.LoadAllAdmin();
            return this.Json(_dbModelList, JsonRequestBehavior.AllowGet);
        }
    }
}