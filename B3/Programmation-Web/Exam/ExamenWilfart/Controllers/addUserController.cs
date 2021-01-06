using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using ExamenWilfart.Models;
namespace ExamenWilfart.Controllers
{
    public class addUserController : Controller
    {
        public ActionResult addUser()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ListStudents()
        {
            ExamenWilfartQ1Entities MyEntity = new ExamenWilfartQ1Entities();
            var LstStd = (from std in MyEntity.UsersTable select std).ToList();
            return View(LstStd);
        }
        [HttpGet]
        public ActionResult CreateStudent()
        {   return View(new Models.userModel {UserID= Guid.NewGuid() });
        }
        
        [HttpPost]
        public ActionResult CreateStudent(Models.userModel usr)
        {
            if (ModelState.IsValid)
            {
                ExamenWilfartQ1Entities MyEntity = new ExamenWilfartQ1Entities();
                MyEntity.UsersTable.Add(new UsersTable
                {
                    UserName = usr.UserName,
                    UserPasswd = GetHashPass(usr.UserPasswd),
            });
                MyEntity.SaveChanges();
                return View(new Models.userModel());
            }
            else
            { 
                ModelState.AddModelError("CustomError", "Champs requis non complétés");  
                return View(usr);
            }
        }
        private string GetHashPass(string pass)
        {
            SHA256 sha256Hash = SHA256.Create();
            var bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(pass));
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < bytes.Length; i++)
            {
                builder.Append(bytes[i].ToString("x2"));
            }
            return builder.ToString();
        }
    }
}