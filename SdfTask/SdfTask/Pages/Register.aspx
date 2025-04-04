<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SdfTask.Pages.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-container {
            width: 350px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            animation: fade-in 0.8s ease;
        }

        @keyframes fade-in {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .form-container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        .form-container input:focus {
            outline: none;
            border-color: #4a90e2;
            box-shadow: 0 0 5px rgba(74, 144, 226, 0.3);
        }

        .form-container input[type="submit"] {
            background: linear-gradient(135deg, #4a90e2 0%, #2c6dd5 100%);
            color: white;
            border: none;
            padding: 14px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .form-container input[type="submit"]:hover {
            background: linear-gradient(135deg, #5a9ae6 0%, #3c7de5 100%);
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(44, 109, 213, 0.3);
        }

        .form-container input[type="submit"]:active {
            transform: translateY(0);
            box-shadow: 0 2px 5px rgba(44, 109, 213, 0.3);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Register</h2>
            <asp:TextBox ID="txtName" runat="server" placeholder="Name" required="true" />
            <asp:TextBox ID="txtSurname" runat="server" placeholder="Surname" required="true" />
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" required="true" />
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" required="true" />
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        </div>
    </form>
</body>
</html>