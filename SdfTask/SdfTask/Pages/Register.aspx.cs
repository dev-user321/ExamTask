using SdfTask.Data;
using SdfTask.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SdfTask.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string surname = txtSurname.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(email) || !IsValidEmail(email))
            {
                Response.Write("Email @ ve . den istifade olunmalidir");
                return;
            }

            if (string.IsNullOrEmpty(password) || password.Length < 8)
            {
                Response.Write("Parol 8 simvoldan az olmamalidir !");
                return;
            }

            User user = new User()
            {
                Name = name,
                Surname = surname,
                Email = email,
                Password = password
            };

            using (var context = new AppDbContext())
            {
                context.Users.Add(user);
                context.SaveChanges();
            }

           
            Response.Redirect("Login.aspx");
        }

        private bool IsValidEmail(string email)
        {
            string emailPattern = @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
            return Regex.IsMatch(email, emailPattern);
        }
    }
}