<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EzCabSelect.aspx.cs" Inherits="EzCabAssignment.EzCabSelect" %>

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
        <div class="col-sm-2"></div>
    </div>

    <div class="row">
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <h4 style="text-align: center">Login as</h4>



            &nbsp;<form role="form">
                <table align="center">
                    <tr>
                        <td>
                            <a href="CustomerLogin.aspx">
                                <img src="scripts/photo/CustomerLoginUnselected.png" onmouseover="this.src='scripts/photo/CustomerLoginSelected.png';" onmouseout="this.src='scripts/photo/CustomerLoginUnselected.png';" height="267" width="227" /></a>
                        </td>
                        <td>
                            <a href="DriverLogin.aspx">
                                <img src="scripts/photo/DriverLoginUnselected.png" onmouseover="this.src='scripts/photo/DriverLoginSelected.png';" onmouseout="this.src='scripts/photo/DriverLoginUnselected.png';" height="267" width="227" /></a>
                        </td>
                        <td>
                            <a href="AdminLogin.aspx">
                                <img src="scripts/photo/AdminLoginUnselected.png" onmouseover="this.src='scripts/photo/AdminLoginSelected.png';" onmouseout="this.src='scripts/photo/AdminLoginUnselected.png';" height="267" width="227" /></a>
                        </td>



                </table>

                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                    </div>
                    <div class="col-sm-2"></div>
                </div>
</body>
</html>
