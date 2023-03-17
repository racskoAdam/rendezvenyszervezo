using System;

namespace Rendezvenyszervezo.Models
{
    public class Rendezveny
    {
        public int Id { get; set; }
        public string Nev { get; set; }
        public DateTime Datum { get; set; }
        public string Helyszin { get; set; }
        public string Leiras { get; set; }
    }
}
