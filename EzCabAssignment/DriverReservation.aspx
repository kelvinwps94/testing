<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverReservation.aspx.cs" Inherits="EzCabAssignment.DriverReservation" %>

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
            .inputText {
            width: 100%;
            padding: 7px 20px;
            margin: 3px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

            .inputText2 {
            width: 20%;
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
                <asp:ImageButton ID="ImageButton1" runat="server" src="scripts/photo/BackButtonSelected.png" onmouseover="this.src='scripts/photo/BackButtonSelected.png';" onmouseout="this.src='scripts/photo/BackButtonUnselected.png';" height="50" width="50" OnClick="ImageButton1_Click" CausesValidation="false" />

                <asp:TextBox ID="txtEmail" runat="server" Visible="false"></asp:TextBox>

 

                <h4 style="text-align: center">Reservation List</h4>








                <asp:GridView ID="grEmp" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                   DataKeyNames="Id" CellPadding="20" CellSpacing="5" ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Center" DataSourceID="SqlDataSource1">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                          
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="false" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                        <asp:BoundField DataField="driverName" HeaderText="Driver Name" SortExpression="driverName" Visible="false" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                        <asp:BoundField DataField="memberName" HeaderText="Customer Name" SortExpression="memberName" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                        <asp:BoundField DataField="memberContact" HeaderText="Customer Contact No" SortExpression="memberContact" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                        <asp:BoundField DataField="memberEmail" HeaderText="Customer Email" SortExpression="memberEmail" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                        <asp:BoundField DataField="routeDepart" HeaderText="Depart" SortExpression="routeDepart" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                        <asp:BoundField DataField="routeDestination" HeaderText="Destination" SortExpression="routeDestination" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                        <asp:BoundField DataField="reservationDate" HeaderText="Reservation Date" SortExpression="reservationDate" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                    </Columns>
                          
                    <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT * FROM [ReservationView]"></asp:SqlDataSource>

                </form>