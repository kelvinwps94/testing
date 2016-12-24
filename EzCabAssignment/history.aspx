<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="EzCabAssignment.history" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="select distinct  [reservation].[reservationid], [route].[depart], [route].[destination], [reservation].[driverid], [driver].[carplateno] from [route],[reservation],[driver] where [route].[routeid]=[reservation].[routeid] and [reservation].[driverid]=[driver].[driverid] and [reservation].[memberid]=@memberid">
            <SelectParameters>
                <asp:QueryStringParameter Name="memberid" QueryStringField="memberId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        HISTORY:<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="reservationid" DataSourceID="SqlDataSource1" >
            <Columns>
                <asp:BoundField DataField="reservationid" HeaderText="reservationid" InsertVisible="False" ReadOnly="True" SortExpression="reservationid" />
                <asp:BoundField DataField="depart" HeaderText="depart" SortExpression="depart" />
                <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination" />
                <asp:BoundField DataField="driverid" HeaderText="driverid" SortExpression="driverid" />
                <asp:BoundField DataField="carplateno" HeaderText="carplateno" SortExpression="carplateno" />
            </Columns>
        </asp:GridView>
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
    
    </div>
    </form>
</body>
</html>
