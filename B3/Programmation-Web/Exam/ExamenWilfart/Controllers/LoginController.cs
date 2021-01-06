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
    //connect
    [Authorize]
    public class LoginController : Controller
    {
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Authentification()
        {
            return View(new AuthInfo());
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
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Authentification(AuthInfo LogInfo, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                ExamenWilfartQ1Entities MyEntity = new ExamenWilfartQ1Entities();
                var hashstr = GetHashPass(LogInfo.pwd);
                var result = (from usr in MyEntity.UsersTable where usr.UserName== LogInfo.pwd && usr.UserPasswd == hashstr select usr).FirstOrDefault();
                if (result == null)
                {
                    ModelState.AddModelError("CustomError", "Authentification erronée");
                }
                else
                {
                    var loginClaim = new Claim(ClaimTypes.NameIdentifier, LogInfo.userid);
                    var NameClaim = new Claim(ClaimTypes.Name, LogInfo.userid);
                    var claimsIdentity = new ClaimsIdentity(new[] { loginClaim, NameClaim }, DefaultAuthenticationTypes.ApplicationCookie);
                    var ctx = Request.GetOwinContext();
                    var authenticationManager = ctx.Authentication;
                    authenticationManager.SignIn(claimsIdentity);
                    if (Url.IsLocalUrl(returnUrl))
                        return Redirect(returnUrl);
                    return RedirectToAction("Index", "Home");
                }
                return View(LogInfo);
            }
            else
            {
                ModelState.AddModelError("CustomError", "Les données transmises sont incomplètes");
                return View(new AuthInfo());
            }
        }
        //disconnect
        [HttpGet]
        public ActionResult Deconnecter()
        {
            var ctx = Request.GetOwinContext();
            var authenticationManager = ctx.Authentication;
            authenticationManager.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}