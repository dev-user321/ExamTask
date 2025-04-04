using SdfTask.Data;
using SdfTask.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;

namespace SdfTask.Repository
{
    public class TeamRepository : IRepository<Team>
    {
        private readonly AppDbContext _context;
        public TeamRepository(AppDbContext context)
        {
            _context = context;
        }
        public void Add(Team t)
        {
            _context.Teams.Add(t);
            _context.SaveChanges();
        }

        public void Delete(int id)
        {
            var item = GetById(id);
            if (item != null)
            {
                _context.Teams.Remove(item);
            }
        }

        public List<Team> GetAll()
        {
            return _context.Teams.Where(m=>m.IsDelete == false).ToList();
        }

        public Team GetById(int id)
        {
            return _context.Teams.FirstOrDefault(x => x.Id == id);
        }

        public void Update(int id, Team t)
        {
            var item = GetById(id);
            if (item != null)
            {
                item.Name = t.Name;
                item.Score = t.Score;

                _context.SaveChanges();
            }
        }
        public List<Team> OrderByDescending()
        {
            return _context.Teams
                    .OrderByDescending(t => t.Score)
                    .ToList();
        }
    }
}