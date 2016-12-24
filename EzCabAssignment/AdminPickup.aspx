<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPickup.aspx.cs" Inherits="EzCabAssignment.AdminPickup" %>

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

                <h4 style="text-align: center">Pickup Information</h4>
    
    <div>
    
        <div align="center">
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="20" CellSpacing="5" ForeColor="#333333" GridLines="None" Width="600px" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="TaxiNo" HeaderText="Taxi Plate No." SortExpression="TaxiNo" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                <asp:BoundField DataField="Depart" HeaderText="Depart" SortExpression="Depart" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                <asp:BoundField DataField="Arrival" HeaderText="Arrival" SortExpression="Arrival" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                <asp:BoundField DataField="startTime" HeaderText="Start Time" SortExpression="startTime" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                <asp:BoundField DataField="endTime" HeaderText="End Time" SortExpression="endTime" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                
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
        </div>

        <br />
        <br />
        <hr />
        <br />
        <h4 style="text-align: center">Search Pickup Information</h4>
        <div align="center">

            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="inputText" Width="246px"/>
                    </td>
                    <td style="padding-left:20px">
                        <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary"/>
                    </td>
                </tr>
            </table>
        
            
        <br />
        
        
        
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="20" CellSpacing="5" ForeColor="#333333" GridLines="None" Width="600px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="TaxiNo" HeaderText="Taxi Plate No." SortExpression="TaxiNo" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                <asp:BoundField DataField="Depart" HeaderText="Depart" SortExpression="Depart" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                <asp:BoundField DataField="Arrival" HeaderText="Arrival" SortExpression="Arrival" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                <asp:BoundField DataField="startTime" HeaderText="Start Time" SortExpression="startTime" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                <asp:BoundField DataField="endTime" HeaderText="End Time" SortExpression="endTime" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center" />
                
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
            </div>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT [TaxiNo], [Depart], [Arrival], [Price], [startTime], [endTime] FROM [PickUp]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT [TaxiNo], [Depart], [Arrival], [Price], [startTime], [endTime] FROM [PickUp] WHERE ([TaxiNo] = @TaxiNo)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="TaxiNo" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
