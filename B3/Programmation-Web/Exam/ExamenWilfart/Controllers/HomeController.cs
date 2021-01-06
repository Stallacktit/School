using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ExamenWilfart.Models;
using System.Text.Json;
using System.Configuration;

namespace ExamenWilfart.Controllers
{
    public class HomeController : Controller
    {
        [Authorize(Roles = "Client, Admin")]

        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        [Authorize (Roles="Admin")]
        public ActionResult Admin()
        {
            return View();
        }

    }
}