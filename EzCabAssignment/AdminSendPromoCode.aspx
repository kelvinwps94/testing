<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminSendPromoCode.aspx.cs" Inherits="EzCabAssignment.AdminSendPromoCode" %>

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

                <h4 style="text-align: center">Promotion Code</h4>

                <p />
                <hr />
                
                
                <h4 style="text-align: center">Create Promotion Code</h4>
                <div align="center">
                    <asp:Label ID="lblExist" runat="server" Text=""></asp:Label>
                </div>
                <div class="form-group" align="center">
                        <label for="name">Promotion Code (Must be 5 characters):</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCode" Display="Dynamic" ErrorMessage="Promotion Code is required!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCode" Display="Dynamic" ErrorMessage="Promotion Code must be 5 characters!" ForeColor="Red" ValidationExpression="^[\s\S]{5,5}$">*</asp:RegularExpressionValidator>
                    <p />
                        <asp:TextBox ID="txtCode" runat="server" CssClass="inputText2"></asp:TextBox>
                        </div>
                <div class="form-group" align="center">
                        <label for="name">Description:</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="Description is required!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtDesc" runat="server" CssClass="inputText"></asp:TextBox>
                        
                        </div>




                <div align="center">
                        <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="btn btn-success" OnClick="btnCreate_Click" />
                    </div>

                
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" HeaderText="The following problems have been encountered" />

                <br />

                <p />
                
                <hr />
                

                <h4 style="text-align: center">Available Promotion Code</h4>
                
                <p />
                <div align="center"><asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PromoCode" DataValueField="PromoCode" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"></asp:RadioButtonList></div>


                <div align="center">
                        <asp:Button ID="btnCheck" runat="server" Text="Check" CssClass="btn btn-primary" OnClick="btnCheck_Click" CausesValidation="false" />
                    </div>
                
                    <div align="center"><asp:Label ID="lblPromotionDesc" runat="server" Text="Please click check after selecting a code."></asp:Label></div>
                



                <br />

                <hr />
                <br />
                <h4 style="text-align: center">Send Promotion Code</h4>
                <p />
                <div align="center">
                    




                        <asp:GridView ID="grEmp" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                   DataKeyNames="memberID" CellPadding="20" CellSpacing="5" ForeColor="#333333" GridLines="None" Width="50%" HorizontalAlign="Center">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                        <asp:BoundField DataField="Name" HeaderText="Customer Name"  />
                        <asp:BoundField DataField="Email" HeaderText="Customer Email" />                                          
                     <asp:TemplateField HeaderText="Check">
                        <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server"/>
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
            <asp:Button ID="btnSendMail" runat="server" Text="Send Email" OnClick="btnSendMail_Click" CausesValidation="false" CssClass="btn btn-success"/> 
        
                
                
                <br />
                    <br />
                    <br />
                
                </div>
                <div align="center">
                    </div>
            </div>
            
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT [Id], [PromoCode], [Description] FROM [Promotion]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT [memberID], [Name], [Email] FROM [Members]"></asp:SqlDataSource>
            
            



                
            



            </form>