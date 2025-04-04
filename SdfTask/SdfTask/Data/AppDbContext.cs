using SdfTask.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SdfTask.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext() : base("ExamDbContext") { }
        public DbSet<User> Users { get; set; }
        public DbSet<Team> Teams { get; set; }
        public DbSet<Game> Games { get; set; }
    }
}