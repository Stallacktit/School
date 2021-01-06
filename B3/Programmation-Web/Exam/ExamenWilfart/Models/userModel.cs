using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExamenWilfart.Models
{
    //Classe servant de modèle à un formulaire pour créer un nouvel étudiant
    public class userModel
    {
        //Champ caché userID
        [HiddenInput(DisplayValue = false)]
        public Guid UserID { get; set; }
        //Champ requis nom utilisateur

        [Required(ErrorMessage = "Le nom est obligatoire")]
        public string UserName { get; set; }
        //champ mdp
        [Required(ErrorMessage = "Le mot de passe est obligatoire")]
        public string UserPasswd { get; set; }
    } 
}
