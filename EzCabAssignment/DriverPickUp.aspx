<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverPickUp.aspx.cs" Inherits="EzCabAssignment.DriverPickUp" %>

<!DOCTYPE html>

<html lang="en">

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

                        <li><a href="DriverLogin.aspx"><span class="glyphicon glyphicon-log-in"></span> LOGOUT</a></li>
                    </ul>
                </div>
            </nav>
        </div>


        <div class="row">
            <div class="col-sm-3"></div>

            <div class="col-sm-6">

                <asp:ImageButton ID="ImageButton1" runat="server" src="scripts/photo/BackButtonSelected.png" onmouseover="this.src='scripts/photo/BackButtonSelected.png';" onmouseout="this.src='scripts/photo/BackButtonUnselected.png';" height="50" width="50" OnClick="ImageButton1_Click" />

                <asp:TextBox ID="txtEmail" runat="server" Visible="false"></asp:TextBox>
                <asp:Label ID="lblDate" runat="server" Visible="false"></asp:Label>

                




                <html xmlns="http://www.w3.org/1999/xhtml">



                <head runat="server">


                    <style type="text/css">
                        .auto-style1 {
                            height: 20px;
                        }

                        .auto-style2 {
                            width: 127px;
                        }

                        .auto-style3 {
                            width: 149px;
                        }

                        .auto-style4 {
                            height: 20px;
                            width: 127px;
                        }

                        .auto-style5 {
                            width: 394px;
                        }
                    </style>



                </head>
                <body>
                    
                        <div>
                            <table align="center">
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label1" runat="server" Text="Driver Name:"></asp:Label>
                                    </td>
                                    <td style="margin-left: 60px">

                                        <asp:TextBox ID="txtName" runat="server" BorderWidth="0px" EnableTheming="True" ReadOnly="True" Text="TEST"></asp:TextBox>


                                    </td>
                                </tr>

                                <tr>
                                    <td class="auto-style3">
                                        <br />
                                        <asp:Label ID="Label7" runat="server" Text="Taxi Number Plate:"></asp:Label>
                                    </td>
                                    <td>
                                        <br />
                                        <asp:TextBox ID="txtTaxi" runat="server" BorderWidth="0" ReadOnly="True" Text="TEST"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Departure Location:"></asp:Label>
                                    </td>
                                    <td style="margin-left: 60px">
                                        <br />
                                        <asp:DropDownList ID="ddlDeparture" runat="server" DataSourceID="depart" DataTextField="depart" DataValueField="depart">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="depart" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT DISTINCT [depart] FROM [Route]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="Arrival Location:"></asp:Label>
                                    </td>
                                    <td style="margin-left: 60px">
                                        <br />
                                        <asp:DropDownList ID="ddlArrival" runat="server" DataSourceID="arrival" DataTextField="destination" DataValueField="destination">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="arrival" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT DISTINCT [destination] FROM [Route]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Text="Price:"></asp:Label>
                                    </td>
                                    <td style="margin-left: 60px">
                                        <br />
                                        <asp:TextBox ID="txtPrice" runat="server" Enabled="False"></asp:TextBox>
                                        <asp:Button ID="btnPrice" runat="server" OnClick="btnPrice_Click" Text="Check Price" CssClass="btn btn-default" />
                                        <asp:Label ID="lblError" runat="server"></asp:Label>
                                    </td>
                                </tr>

                            </table>


                            <br />
                            <br />
                            <hr />
                            <br />


                            <h4 style="text-align: center">Timer</h4>
                            <br />


                            <table align="center">
                                <tr>
                                    <td class="auto-style1" align="center">
                                        <asp:Label ID="Label5" runat="server" Text="Start Time: "></asp:Label>
                                    </td>

                                    <td class="auto-style4" align="center">
                                        <asp:Label ID="Label6" runat="server" Text="End Time: "></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style1" align="center">

                                        <br />
                                        <asp:Label ID="lblStart" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                    </td>
                                    <td class="auto-style4" align="center">
                                        <br />
                                        <asp:Label ID="lblEnd" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style2" align="center">
                                        <asp:Button ID="btnStart" runat="server" Text="Start" OnClick="btnStart_Click" CssClass="btn btn-default" />
                                    </td>
                                    <td class="auto-style2" align="center">
                                        <asp:Button ID="btnEnd" runat="server" Text="End" OnClick="btnEnd_Click" CssClass="btn btn-default" />
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <br />
                                        <br />
                                        <asp:Button ID="btnDone" runat="server" OnClick="btnDone_Click" Text="Done" CssClass="btn btn-primary" />

                                    </td>
                                </tr>
                            </table>

                        </div>

                    </form>
                </body>
                </html>
