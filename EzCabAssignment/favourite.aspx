<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="favourite.aspx.cs" Inherits="EzCabAssignment.favourite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="select distinct [route].[depart], [route].[destination] from [route],[favourite] where [route].[routeid]=[favourite].[routeid] and [favourite].[memberid]=@memberid">
            <SelectParameters>
                <asp:QueryStringParameter Name="memberid" QueryStringField="memberId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        FAVOURITE ROUTE:<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="depart" HeaderText="depart" SortExpression="depart" />
                <asp:BoundField DataField="destination" HeaderText="destination" SortExpression="destination" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
