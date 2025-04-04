using SdfTask.Data;
using SdfTask.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SdfTask.Pages
{
    public partial class Games : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Helper.Helper.IncreaseSessionTime();
            if (!IsPostBack)
            {
                BindTeams();
            }

        }
        private void BindTeams()
        {
            using (var context = new AppDbContext())
            {
                var teams = context.Teams.Where(t => !t.IsDelete).ToList();

                ddlTeam1.DataSource = teams;
                ddlTeam1.DataTextField = "Name";  
                ddlTeam1.DataValueField = "Id";  
                ddlTeam1.DataBind();

          
                ddlTeam2.DataSource = teams;
                ddlTeam2.DataTextField = "Name";
                ddlTeam2.DataValueField = "Id";
                ddlTeam2.DataBind();

                ddlTeam1.Items.Insert(0, new ListItem("Select Team", "0"));
                ddlTeam2.Items.Insert(0, new ListItem("Select Team", "0"));
            }
        }

        protected void btnAddTeam_Click(object sender, EventArgs e)
        {
            string teamName = txtTeamName.Text;
            Team team = new Team()
            {
                Name = teamName,
                Score = 0
            };
            using (var context = new AppDbContext()) 
            {
                context.Teams.Add(team);    
                context.SaveChanges();
            }
            BindTeams();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("TournamentSchedule.aspx");
        }
        protected void btnAddGame_Click(object sender, EventArgs e)
        {
            int team1Id = int.Parse(ddlTeam1.SelectedValue);
            int team2Id = int.Parse(ddlTeam2.SelectedValue);

            int team1Score = int.Parse(txtTeam1Score.Text);
            int team2Score = int.Parse(txtTeam2Score.Text);

            if (team1Id == team2Id)
            {
                Response.Write("Eyni komandalar oynaya bilmez !");
                return;
            }

            int team1Points = 0;
            int team2Points = 0;

            if (team1Score > team2Score)
            {
                team1Points = 3;
            }
            else if (team2Score > team1Score)
            {
                team2Points = 3;
            }
            else
            {
                team1Points = 1;
                team2Points = 1;
            }

            using (var context = new AppDbContext())
            {
                var game = new Game
                {
                    Team1Id = team1Id,
                    Team2Id = team2Id,
                    Team1Score = team1Score,
                    Team2Score = team2Score,
                    DatePlayed = DateTime.Now
                };

                context.Games.Add(game);

                var team1 = context.Teams.FirstOrDefault(t => t.Id == team1Id);
                var team2 = context.Teams.FirstOrDefault(t => t.Id == team2Id);

                if (team1 != null)
                {
                    team1.Score += team1Points; 
                }

                if (team2 != null)
                {
                    team2.Score += team2Points;
                }

                
                context.SaveChanges();
            }

            // İstifadəçiyə oyunun uğurla əlavə edildiyini bildiririk
            Response.Write("Game Added Successfully");
        }

    }
}