using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenWilfart.Controllers
{
    public class CustomErrorController : Controller
    {
        public ActionResult NotFound(string Message)
        {
            return View(new Models.ErrorMessage { Message = Message });
        }

        public ActionResult ServerError(string Message)
        {
            return View(new Models.ErrorMessage { Message = Message });
        }
    }
}