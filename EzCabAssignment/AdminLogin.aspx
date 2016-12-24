<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="EzCabAssignment.AdminLogin" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style>
        .container {
            padding: 80px 120px;
        }

        .person {
            border: 10px solid transparent;
            margin-bottom: 25px;
            width: 80%;
            height: 80%;
            opacity: 0.7;
        }

            .person:hover {
                border-color: #f1f1f1;
            }

        .inputText {
            width: 100%;
            padding: 7px 20px;
            margin: 3px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <img src="scripts/photo/Logo.png" class="auto-style9" height="60" width="194" />
                    </div>
                </div>
            </nav>
        </div>


        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">

                <h4><span class="glyphicon glyphicon-log-in"></span> Login as Administrator</h4>
                <form role="form" runat="server">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="inputText"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <asp:TextBox ID="txtPw" runat="server" CssClass="inputText" TextMode="Password"></asp:TextBox>
                    </div>

                    <div style="float: left; display: inline-block">
                        <a href="EzCabSelect.aspx">
                            <button type="button" class="btn btn-default">Back</button></a>

                    </div>

                    <div style="float: right; display: inline-block">
                        <asp:Button ID="Button1" runat="server" Text="Clear" CssClass="btn btn-default" />
                        <asp:Button ID="loginBtn" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="loginBtn_Click" />
                    </div>

                </form>


            </div>
            <div class="col-sm-3"></div>
        </div>
