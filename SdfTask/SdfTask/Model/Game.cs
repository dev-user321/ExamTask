using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SdfTask.Model
{
    public class Game
    {
        public int Id { get; set; }
        public int Team1Id { get; set; }
        public int Team2Id { get; set; }
        public int Team1Score { get; set; }
        public int Team2Score { get; set; }
        public DateTime DatePlayed {  get; set; }
    }
}