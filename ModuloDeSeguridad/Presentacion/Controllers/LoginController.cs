using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Presentacion.Controllers
{
    public class LoginController : Controller
    {
        public LoginController()
        {
            //Falta instalar Unity e Inyectar Service del Login
        }
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoginCheck()
        {
            return RedirectToAction("Index", "Login");
        }
    }
}