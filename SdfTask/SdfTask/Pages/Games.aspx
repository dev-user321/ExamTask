<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="SdfTask.Pages.Games" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Game</title>
    <style>
        /* Main styles and variables */
        :root {
            --primary-color: #3498db;
            --primary-hover: #2980b9;
            --accent-color: #27ae60;
            --accent-hover: #219955;
            --text-color: #333;
            --text-light: #666;
            --bg-color: #f8f9fa;
            --border-color: #ddd;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            padding: 20px;
            line-height: 1.6;
        }
        
        /* Form container styling */
        .form-container {
            width: 400px;
            margin: 20px auto;
            padding: 25px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            background-color: white;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }
        
        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        
        /* Headings */
        h2 {
            color: var(--primary-color);
            margin-top: 0;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--border-color);
            font-weight: 600;
        }
        
        /* Form controls: input, select, button */
        .form-container input,
        .form-container select,
        .form-container button {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            font-size: 16px;
            transition: var(--transition);
        }
        
        .form-container input:focus,
        .form-container select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        
        .form-container input::placeholder {
            color: var(--text-light);
        }
        
        /* Button styling */
        button,
        input[type="submit"] {
            background-color: var(--primary-color);
            color: white;
            border: none;
            cursor: pointer;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: background-color 0.2s, transform 0.1s;
        }
        
        button:hover,
        input[type="submit"]:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
        }
        
        button:active,
        input[type="submit"]:active {
            transform: translateY(0);
        }
        
        /* ASP.NET Button styling */
        #btnAddTeam {
            background-color: var(--accent-color);
        }
        
        #btnAddTeam:hover {
            background-color: var(--accent-hover);
        }
        
        #btnBack {
            background-color: #95a5a6;
        }
        
        #btnBack:hover {
            background-color: #7f8c8d;
        }
        
        #btnAddGame {
            margin-bottom: 10px;
        }
        
        /* Group related fields with visual spacing */
        .form-container select,
        .form-container input[type="text"] {
            margin-bottom: 15px;
        }
        
        /* Media queries for responsive design */
        @media (max-width: 480px) {
            .form-container {
                width: 90%;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Add New Team</h2>
            <!-- Team Name Input -->
            <asp:TextBox ID="txtTeamName" runat="server" placeholder="Enter Team Name" />
            <!-- Add Team Button -->
            <asp:Button ID="btnAddTeam" runat="server" Text="Add Team" OnClick="btnAddTeam_Click" />
        </div>
        <div class="form-container">
            <h2>Add New Game</h2>
            
            <!-- Team 1 Input -->
            <asp:DropDownList ID="ddlTeam1" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Select Team" Value="0" />
                <asp:ListItem Text="Team A" Value="1" />
                <asp:ListItem Text="Team B" Value="2" />
                <asp:ListItem Text="Team C" Value="3" />
            </asp:DropDownList>
            
            <!-- Team 2 Input -->
            <asp:DropDownList ID="ddlTeam2" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Select Team" Value="0" />
                <asp:ListItem Text="Team A" Value="1" />
                <asp:ListItem Text="Team B" Value="2" />
                <asp:ListItem Text="Team C" Value="3" />
            </asp:DropDownList>
            <!-- Team 1 Score -->
            <asp:TextBox ID="txtTeam1Score" runat="server" placeholder="Enter Team 1 Score" />
            <!-- Team 2 Score -->
            <asp:TextBox ID="txtTeam2Score" runat="server" placeholder="Enter Team 2 Score" />
            <!-- Add Game Button -->
            <asp:Button ID="btnAddGame" runat="server" Text="Add Game" OnClick="btnAddGame_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>