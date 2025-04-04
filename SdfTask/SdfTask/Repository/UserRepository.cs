using SdfTask.Data;
using SdfTask.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SdfTask.Repository
{
    public class UserRepository : IRepository<User>
    {
        private readonly AppDbContext _context;
        public UserRepository(AppDbContext context)
        {
            _context = context;
        }
        public void Add(User t)
        {
            _context.Users.Add(t);  
        }

        public void Delete(int id)
        {
            var item = GetById(id);
            if (item != null)
            {
                _context.Users.Remove(item);
            }
        }

        public List<User> GetAll()
        {
            return _context.Users.ToList();
        }

        public User GetById(int id)
        {
            return _context.Users.FirstOrDefault(x => x.Id == id);
        }

        public void Update(int id, User t)
        {
            var item = GetById(id);
            if (item != null)
            {
                item.Name = t.Name;
                item.Surname = t.Surname;
                item.Email = t.Email;
                item.Password = t.Password; 

                _context.SaveChanges();
            }
        }
    }
}