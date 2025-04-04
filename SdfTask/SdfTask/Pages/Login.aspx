<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SdfTask.Pages.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        /* Base styles and variables */
        :root {
            --primary-color: #4CAF50;
            --primary-hover: #45a049;
            --secondary-color: #3498db;
            --secondary-hover: #2980b9;
            --text-color: #333;
            --text-light: #666;
            --bg-color: #f8f9fa;
            --border-color: #ddd;
            --error-color: #e74c3c;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            padding: 20px;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Form container styling */
        .form-container {
            width: 320px;
            padding: 30px;
            background-color: white;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        /* Heading styles */
        h2 {
            color: var(--primary-color);
            margin-top: 0;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 600;
        }

        /* Input field styling */
        .form-container input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            font-size: 16px;
            transition: var(--transition);
            box-sizing: border-box;
        }

        .form-container input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
        }

        .form-container input::placeholder {
            color: var(--text-light);
        }

        /* Button styling */
        .form-container button,
        .form-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 15px 0 5px 0;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
        }

        .form-container button:hover,
        .form-container input[type="submit"]:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
        }

        .form-container button:active,
        .form-container input[type="submit"]:active {
            transform: translateY(0);
        }

        /* Register button - secondary style */
        #btnRegister {
            background-color: var(--secondary-color);
            margin-top: 10px;
        }

        #btnRegister:hover {
            background-color: var(--secondary-hover);
        }

        /* Error message styling */
        #lblMessage {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: var(--error-color);
            font-size: 14px;
        }

        /* Spacing utility */
        br {
            display: none;
        }

        /* Responsive adjustments */
        @media (max-width: 380px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Login</h2>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control" />
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" CssClass="form-control" />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            <br />
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>