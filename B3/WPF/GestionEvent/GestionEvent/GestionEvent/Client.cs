using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionEvent
{
    class Client
    {
        public Client(string nom, string prenom, string rue, string localite, string codePostale)
        {
            _Nom = nom;
            _Prenom = prenom;
            _Rue = rue;
            _Localite = localite;
            _CodePostale = codePostale;
        }

        string _Nom { get; set; }
        string _Prenom{ get; set;    }
        string _Rue{ get; set; }
        string _Localite { get; set; }
        string _CodePostale { get; set; }

        public string GetName()
        {
            return _Nom;
        }
        public string GetFirstName()
        {
            return _Prenom;
        }



    }
}
