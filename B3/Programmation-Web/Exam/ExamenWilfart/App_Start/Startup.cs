using System;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;

//Déclaration de l'utilisation d'OWIN
[assembly: OwinStartup(typeof(ExamenWilfart.App_Start.Startup))]

namespace ExamenWilfart.App_Start
{
    public class Startup
    {
        //Configuration de l'utilisation de l'authentification
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Login/Authentification"),
            });
            
        }
    }
}
