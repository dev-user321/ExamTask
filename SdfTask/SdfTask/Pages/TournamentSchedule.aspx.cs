using SdfTask.Data;
using SdfTask.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SdfTask.Pages
{
    public partial class TournamentSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Helper.Helper.IncreaseSessionTime();
            if (!IsPostBack)
            {
                BindTeams();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        private void BindTeams()
        {
            using (var context = new AppDbContext())
            {
                var teams = context.Teams
                    .OrderByDescending(t => t.Score) 
                    .ToList();

                string tableHtml = "";
                foreach (var team in teams)
                {
                    tableHtml += $"<tr><td>{team.Name}</td><td>{team.Score}</td></tr>";
                }

               
                teamTable.InnerHtml = tableHtml; 
            }
        }
        protected void btnGames_Click(object sender, EventArgs e)
        {
            Response.Redirect("Games.aspx");
        }
    }
}