<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyReport.aspx.cs" Inherits="EzCabAssignment.DailyReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Daily Reservation Report"></asp:Label>
&nbsp;-
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT * FROM [Reservation] WHERE ([reservationDate] = @reservationDate)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label2" Name="reservationDate" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="reservationID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="reservationID" HeaderText="reservationID" InsertVisible="False" ReadOnly="True" SortExpression="reservationID" />
                <asp:BoundField DataField="driverID" HeaderText="driverID" SortExpression="driverID" />
                <asp:BoundField DataField="memberID" HeaderText="memberID" SortExpression="memberID" />
                <asp:BoundField DataField="routeID" HeaderText="routeID" SortExpression="routeID" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
