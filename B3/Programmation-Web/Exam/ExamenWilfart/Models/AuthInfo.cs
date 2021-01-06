using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ExamenWilfart.Models
{
    //Modèle contenant les informations d'authentification d'un utilisateur
    public class AuthInfo
    {
        //Champ identifiant requis
        [Required]
        public string userid { get; set; }
        //Champ mot de passe requis
        [Required]
        public string pwd { get; set; }
        //Champ mémoriser optionnel
        public bool save { get; set; }
    }
}