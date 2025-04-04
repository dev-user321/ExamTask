<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TournamentSchedule.aspx.cs" Inherits="SdfTask.Pages.TournamentSchedule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teams</title>
    <style>
        /* Base styles and variables */
        :root {
            --primary-color: #3498db;
            --primary-hover: #2980b9;
            --accent-color: #4CAF50;
            --accent-hover: #45a049;
            --danger-color: #e74c3c;
            --danger-hover: #c0392b;
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
            line-height: 1.6;
            margin: 0;
            padding: 20px;
        }

        /* Table container styling */
        .table-container {
            width: 70%;
            max-width: 900px;
            margin: 30px auto;
            padding: 25px;
            background-color: white;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            box-shadow: var(--shadow);
        }

        /* Heading styles */
        h2 {
            color: var(--primary-color);
            margin-top: 0;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--border-color);
            font-weight: 600;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid var(--border-color);
        }

        th {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
        }

        td {
            padding: 12px 15px;
            text-align: left;
            transition: var(--transition);
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }

        /* Button styling */
        button, 
        input[type="submit"] {
            padding: 10px 20px;
            margin-right: 10px;
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 500;
            transition: background-color 0.2s, transform 0.1s;
        }

        button:hover, 
        input[type="submit"]:hover {
            background-color: var(--accent-hover);
            transform: translateY(-2px);
        }

        button:active, 
        input[type="submit"]:active {
            transform: translateY(0);
        }

        /* Specific button styling */
        #btnGames {
            background-color: var(--primary-color);
        }

        #btnGames:hover {
            background-color: var(--primary-hover);
        }

        #btnLogout {
            background-color: var(--danger-color);
        }

        #btnLogout:hover {
            background-color: var(--danger-hover);
        }

        /* Empty state styling */
        .empty-table {
            padding: 30px;
            text-align: center;
            color: var(--text-light);
            font-style: italic;
        }

        /* Button container */
        .button-group {
            display: flex;
            margin-top: 20px;
        }

        .button-group button,
        .button-group input[type="submit"] {
            margin-right: 10px;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .table-container {
                width: 90%;
                padding: 15px;
            }
            
            th, td {
                padding: 8px 10px;
            }
            
            button, 
            input[type="submit"] {
                width: 100%;
                margin-bottom: 10px;
                margin-right: 0;
            }
            
            .button-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="table-container">
            <h2>Teams</h2>
            <table>
                <thead>
                    <tr>
                        <th>Team Name</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody id="teamTable" runat="server">
                    <!-- Dinamik olaraq bu yerə komandalar əlavə ediləcək -->
                </tbody>
            </table>
            <br />
            <asp:Button ID="btnGames" runat="server" Text="Oyunlar" OnClick="btnGames_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>