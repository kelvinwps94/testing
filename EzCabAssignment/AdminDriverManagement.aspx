<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDriverManagement.aspx.cs" Inherits="EzCabAssignment.AdminDriverManagement" %>

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
    <form runat="server">
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
                <asp:ImageButton CausesValidation="false" ID="ImageButton1" runat="server" src="scripts/photo/BackButtonSelected.png" onmouseover="this.src='scripts/photo/BackButtonSelected.png';" onmouseout="this.src='scripts/photo/BackButtonUnselected.png';" height="50" width="50" OnClick="ImageButton1_Click" />

                <asp:TextBox ID="txtEmail" runat="server" Visible="false"></asp:TextBox>

                <h4 style="text-align: center">Driver Information Management</h4>
    
        <center>
            
    <div>




        <fieldset>
            
            <table>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="inputText"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>IC No:</td>
                    <td>
                        <asp:TextBox ID="txtICNo" runat="server" CssClass="inputText"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtICNo" Display="Dynamic" ErrorMessage="IC No. is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtICNo" Display="Dynamic" ErrorMessage="Invalid IC No. (XXXXXX-XX-XXXX)" ForeColor="Red" ValidationExpression="\d{6}\-\d{2}\-\d{4}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmaill" runat="server" CssClass="inputText"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><asp:TextBox ID="txtPassword" runat="server" CssClass="inputText"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rblGender" Display="Dynamic" ErrorMessage="Gender is required to be selected" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Contact No:</td>
                    <td>
                        <asp:TextBox ID="txtContactNo" runat="server" CssClass="inputText"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContactNo" Display="Dynamic" ErrorMessage="Contact No. is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtContactNo" Display="Dynamic" ErrorMessage="Invalid Contact No. (0123456789) or (01123456789)" ForeColor="Red" ValidationExpression="\d{10,11}">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Expired Driving License:</td>
                    <td>
                        <asp:TextBox ID="txtDrivingL" runat="server" CssClass="inputText"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDrivingL" Display="Dynamic" ErrorMessage="Expired Driving License is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDrivingL" Display="Dynamic" ErrorMessage="Invalid Expired Driving License format (dd/mm/yyyy)" ForeColor="Red" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Taxi Company:</td>
                    <td>
                        <asp:TextBox ID="txtTCompany" runat="server" CssClass="inputText"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTCompany" Display="Dynamic" ErrorMessage="Taxi Company is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Car Plate No:</td>
                    <td>
                        <asp:TextBox ID="txtCarPlateNo" runat="server" CssClass="inputText"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCarPlateNo" Display="Dynamic" ErrorMessage="Car Plate No. is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:TextBox ID="txtRole" runat="server" Visible="False">Driver</asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <center><asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-primary"/></center>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="lblDrvExisted" runat="server"></asp:Label></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" PageSize="6" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting"  CellPadding="20" CellSpacing="5" ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="IC Number" ItemStyle-Font-Size="Smaller" HeaderStyle-Font-Size="Smaller">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ICNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" ItemStyle-Font-Size="Smaller" HeaderStyle-Font-Size="Smaller">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" ItemStyle-Font-Size="Smaller" HeaderStyle-Font-Size="Smaller">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender" ItemStyle-Font-Size="Smaller" HeaderStyle-Font-Size="Smaller">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Taxi Company" ItemStyle-Font-Size="Smaller" HeaderStyle-Font-Size="Smaller">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TaxiCompany") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("TaxiCompany") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Expired Driving License" ItemStyle-Font-Size="Smaller" HeaderStyle-Font-Size="Smaller">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ExpiredDrivingLicense") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ExpiredDrivingLicense") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact No" ItemStyle-Font-Size="Smaller" HeaderStyle-Font-Size="Smaller">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ContactNo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Car Plate No" ItemStyle-Font-Size="Smaller" HeaderStyle-Font-Size="Smaller">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CarPlateNo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("CarPlateNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
        </fieldset>
    </div>
            
            </center>
    </form>
                

</body>
</html>
