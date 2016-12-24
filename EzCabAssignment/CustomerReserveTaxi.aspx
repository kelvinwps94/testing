<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerReserveTaxi.aspx.cs" Inherits="EzCabAssignment.CustomerReserveTaxi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function SelectRadiobutton(radio) {
            var rdBtn = document.getElementById(radio.id);
            var rdBtnList = document.getElementsByTagName("input");
            for (i = 0; i < rdBtnList.length; i++) {
                if (rdBtnList[i].type == "radio" && rdBtnList[i].id != rdBtn.id) {
                    rdBtnList[i].checked = false;
                }
            }

        }
    </script>

  <script type="text/javascript">
      function Confirm() {

          var rdBtnList = document.getElementsByTagName("input");
          var flag = 0;

          for (i = 0; i < rdBtnList.length; i++) {
              if (rdBtnList[i].type == "radio" && rdBtnList[i].checked == true) {
                  flag = 1;
              }
          }
          if (flag != 0) {
              var confirm_value = document.createElement("INPUT");
              confirm_value.type = "hidden";
              confirm_value.name = "confirm_value";

              if (confirm("Do you confirm with your selected taxi?")) {
                  confirm_value.value = "Confirm";
              } else {
                  confirm_value.value = "Cancel";
              }
              document.forms[0].appendChild(confirm_value);
          }
          else {
              alert("Please make a selection before pressing Confirm.");
          }
      }
    </script>

    <style type="text/css">
        .auto-style1 {
            width: 186px;
        }
        .auto-style2 {
            width: 186px;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }

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
            width: 100%;
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

        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="select * from driver where driverid not in (Select distinct driverid from schedule where date = @date and pickup = @pickup)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label4" Name="date" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Label12" Name="pickup" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />

            <asp:TextBox ID="txtEmail" runat="server" Visible="False"></asp:TextBox>

            <br />
            <table style="width:100%;">
                <tr>
                    <td class="auto-style2">Pick Up:</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Destination:</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Estimated Distance:</td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Pick Up Date:</td>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                   <tr>
                    <td class="auto-style1">Pick Up Time:</td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="Label10" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="Label12" runat="server" Visible="False"></asp:Label>
                       </td>
                </tr>
            </table>

            <br />
            <br />
            PLEASE SELECT A TAXI<br />
            <br />
            AVAILABLE TAXI:<br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="driverID" DataSourceID="SqlDataSource1" CellPadding="20" CellSpacing="5" ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="SELECT">

                        <ItemTemplate>
                            <asp:RadioButton ID="button" runat="server" onClick="javascript:SelectRadiobutton(this)" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="driverID" HeaderText="driverID" InsertVisible="False" ReadOnly="True" SortExpression="driverID" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                    <asp:BoundField DataField="ICNo" HeaderText="ICNo" SortExpression="ICNo" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                    <asp:BoundField DataField="TaxiCompany" HeaderText="TaxiCompany" SortExpression="TaxiCompany" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                    <asp:BoundField DataField="ExpiredDrivingLicense" HeaderText="ExpiredDrivingLicense" SortExpression="ExpiredDrivingLicense" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                    <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" SortExpression="ContactNo" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                    <asp:BoundField DataField="CarPlateNo" HeaderText="CarPlateNo" SortExpression="CarPlateNo" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="center" HeaderStyle-CssClass="header-center"/>
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

            <br />

            <asp:Label ID="Label7" runat="server"></asp:Label>

            <asp:Label ID="Label13" runat="server" Text="Label" Visible="False"></asp:Label>

            <br />
            <br />


            <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn btn-default" PostBackUrl="~/CustomerReserve.aspx"/>
&nbsp;


            <asp:Button ID="btnConfirm" runat="server" OnClick="OnConfirm" Text="Confirm" OnClientClick="Confirm()" CssClass="btn btn-success"/>

            <br />

        </div>
    </form>
</body>
</html>
 