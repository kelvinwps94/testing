<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReport.aspx.cs" Inherits="EzCabAssignment.AdminReport" %>

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
    <form role="form" runat="server">
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

                
                
                <h4 style="text-align: center">Generate Report</h4>



                &nbsp;
                    <table align="center">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton2" runat="server" src="scripts/photo/PickupReportUnselected.png" onmouseover="this.src='scripts/photo/PickupReportSelected.png';" onmouseout="this.src='scripts/photo/PickupReportUnselected.png';" height="267" width="227" OnClick="ImageButton2_Click"/>
                            
                            </td>

                            <td>
                                <asp:ImageButton ID="ImageButton3" runat="server" src="scripts/photo/TransactionReportUnselected.png" onmouseover="this.src='scripts/photo/TransactionReportSelected.png';" onmouseout="this.src='scripts/photo/TransactionReportUnselected.png';" height="267" width="227" OnClick="ImageButton3_Click"/>
                            
                            </td>
                            



                    </table>

                    <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </form>
</body>
</html>
