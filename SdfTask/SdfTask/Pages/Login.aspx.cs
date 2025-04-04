using SdfTask.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SdfTask.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            using (var context = new AppDbContext())
            {
                var user = context.Users
                    .FirstOrDefault(u => u.Email == email && u.Password == password);

                if (user != null)
                {
                    Session["Email"] = user.Email;
                    Response.Redirect("TournamentSchedule.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Login UnSuccesful!');</script>");
                }
            }
        }
    }
}