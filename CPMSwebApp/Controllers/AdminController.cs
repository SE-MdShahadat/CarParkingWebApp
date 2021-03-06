﻿using CPMSDAL;
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
        [HttpGet]
        public JsonResult LoadDDLMasterData()
        {
            objList = new AdminList();
            List<DDLCountryDBModel> _dbModelList = new List<DDLCountryDBModel>();
            _dbModelList = objList.LoadDDLMasterData();
            return this.Json(_dbModelList, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult LoadDDLCityData(DDLCityDBModel _dbModel)
        {
            objList = new AdminList();
            List<DDLCityDBModel> _dbModelList = new List<DDLCityDBModel>();
            _dbModelList = objList.LoadDDLCityData(_dbModel);
            return this.Json(_dbModelList, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult DeleteAdmin(AdminDBModel _dbModel)
        {
            int _result = 0;
            objList = new AdminList();
            _result = objList.DeleteAdmin(_dbModel);
            if (_result > 0)
                return Json(new { success = true });
            else
                return Json(new { success = false });
        }
        [HttpPost]
        public JsonResult LoadSelectedAdmin(AdminDBModel _dbModel)
        {
            objList = new AdminList();
            List<AdminDBModel> _dbModelList = new List<AdminDBModel>();
            _dbModelList = objList.LoadSelectedAdmin(_dbModel);
            return this.Json(_dbModelList, JsonRequestBehavior.AllowGet);
        }
    }
}