<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerEditProfile.aspx.cs" Inherits="EzCabAssignment.CustomerEditProfile" %>

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
            padding: 7px 20px;
            margin: 3px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

            .header-center{
        text-align:center;
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
                        
                        <li><a href="AdminLogin.aspx"><span class="glyphicon glyphicon-log-in"></span> LOGOUT</a></li>
                    </ul>
                </div>
            </nav>
        </div>


        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <asp:ImageButton ID="ImageButton1" runat="server" src="scripts/photo/BackButtonSelected.png" onmouseover="this.src='scripts/photo/BackButtonSelected.png';" onmouseout="this.src='scripts/photo/BackButtonUnselected.png';" height="50" width="50" OnClick="ImageButton1_Click" />

    <asp:TextBox ID="txtEmail" runat="server" Visible="false"></asp:TextBox>

    
        <h4 style="text-align: center"><asp:Label ID="lblEdit" runat="server" Text="Profile Edit"></asp:Label></h4>
    <div align="center">
        <br />
        <table>
            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="lblName" runat="server" CssClass="inputText" ReadOnly="true"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="lblEmail" runat="server" CssClass="inputText" ReadOnly="true"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Mobile No:</td>
                <td>
                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="inputText"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <asp:TextBox ID="lblGender" runat="server" CssClass="inputText" ReadOnly="true"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Date Of Birth:</td>
                <td>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="inputText"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">
                    <center><asp:Button ID="Button1" runat="server" Text="Confirm" OnClick="Button1_Click" CssClass="btn btn-primary"/></center>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
