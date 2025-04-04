using SdfTask.Data;
using SdfTask.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SdfTask.Repository
{
    public class GameRepository : IRepository<Game>
    {
        private readonly AppDbContext _context;
        public GameRepository(AppDbContext context)
        {
            _context = context;
        }
        public void Add(Game t)
        {
            _context.Games.Add(t);
        }

        public void Delete(int id)
        {
            var item = GetById(id);
            if (item != null)
            {
                _context.Games.Remove(item);
            }
        }

        public List<Game> GetAll()
        {
            return _context.Games.ToList();
        }

        public Game GetById(int id)
        {
            return _context.Games.FirstOrDefault(x => x.Id == id);
        }

        public void Update(int id, Game t)
        {
            var item = GetById(id);
            if (item != null)
            {
                item.Team1Id = t.Team1Id; 
                item.Team2Id = t.Team2Id; 
                item.Team1Score = t.Team1Score;
                item.Team2Score = t.Team2Score;
                item.DatePlayed = t.DatePlayed;


                _context.SaveChanges();
            }
        }
    }
}