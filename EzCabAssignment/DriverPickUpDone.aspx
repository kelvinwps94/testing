<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverPickUpDone.aspx.cs" Inherits="EzCabAssignment.DriverPickUpDone" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <img src="scripts/photo/Logo.png" class="auto-style9" height="60" width="194" />
                        </div>
                        <ul class="nav navbar-nav navbar-right">

                            <li><a href="DriverLogin.aspx"><span class="glyphicon glyphicon-log-in"></span>LOGOUT</a></li>
                        </ul>
                    </div>
                </nav>
            </div>

            <asp:TextBox ID="txtEmail" runat="server" Visible="false"></asp:TextBox>
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <h4 style="text-align: center">You've reached your destination.</h4>
                    <br />
                    <table align="center">
                        <tr>
                            <td style="padding-right:10px">
                                <asp:Button ID="btnAgain" runat="server" Text="Again" CssClass="btn btn-primary" OnClick="btnAgain_Click"/>
                            </td>
                            <td style="padding-left:10px">
                                <asp:Button ID="brnClose" runat="server" Text="Home" CssClass="btn btn-default" OnClick="brnClose_Click"/>
                            </td>
                        </tr>
                    </table>
                    
                    
    </form>
</body>
</html>
