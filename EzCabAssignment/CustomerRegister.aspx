<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegister.aspx.cs" Inherits="EzCabAssignment.CustomerRegister" %>

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

                <h4>Registration</h4>

                <form role="form" runat="server">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtName" runat="server" CssClass="inputText"></asp:TextBox>

                    </div>

                    <div class="form-group">
                        <label for="name">Email:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid email format (example@gmail.com)" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>

                        <asp:TextBox ID="txtEmail" runat="server" CssClass="inputText"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="name">Contact No:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Contact No. is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Invalid Contact No. format (01123456789)" ForeColor="Red" ValidationExpression="\d{10,11}">*</asp:RegularExpressionValidator>

                        <asp:TextBox ID="txtMobile" runat="server" CssClass="inputText"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password can not be less than 6 or more than 16 characters" ForeColor="Red" ValidationExpression="^[\s\S]{6,16}$">*</asp:RegularExpressionValidator>

                        <asp:TextBox ID="txtPassword" runat="server" CssClass="inputText" TextMode="Password"></asp:TextBox>
                    </div>

                    

                    <div class="form-group">
                        <label for="name">Gender:</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="Gender is required to be select" ForeColor="Red" ControlToValidate="rblGender" SetFocusOnError="True">*</asp:RequiredFieldValidator>

                        <asp:RadioButtonList ID="rblGender" runat="server">
                            <asp:ListItem Value="Male"></asp:ListItem>
                            <asp:ListItem Value="Female"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <label for="name">Date of Birth:</label>
                    <br />

                    <div class="form-group" style="display: inline-block">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDobDay" Display="Dynamic" ErrorMessage="Birth day is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtDobDay" Display="Dynamic" ErrorMessage="Invalid birth day" ForeColor="Red" MaximumValue="31" MinimumValue="1" Type="Integer">*</asp:RangeValidator>


                        <asp:TextBox ID="txtDobDay" runat="server" CssClass="inputText"></asp:TextBox>
                    </div>
                    <div class="form-group" style="display: inline-block">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDobMonth" Display="Dynamic" ErrorMessage="Birth month is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtDobMonth" Display="Dynamic" ErrorMessage="Invalid birth month" ForeColor="Red" MaximumValue="12" MinimumValue="1" Type="Integer">*</asp:RangeValidator>


                        <asp:TextBox ID="txtDobMonth" runat="server" CssClass="inputText"></asp:TextBox>
                    </div>
                    <div class="form-group" style="display: inline-block">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDobYear" ErrorMessage="Birth year is required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>

                        <asp:TextBox ID="txtDobYear" runat="server" CssClass="inputText"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtDobYear" Display="Dynamic" ErrorMessage="Invalid birth year" ForeColor="Red" MaximumValue="2016" MinimumValue="1900" Type="Integer">*</asp:RangeValidator>

                    </div>
                    <div />

                    <asp:TextBox ID="txtRole" runat="server" Visible="False">Member</asp:TextBox>



                    <div style="float: left; display: inline-block">
                        <a href="CustomerLogin.aspx">
                            <button type="button" class="btn btn-default">Back</button></a>

                    </div>

                    <div style="float: right; display: inline-block">
                        <a href="CustomerRegister.aspx">
                            <button type="button" class="btn btn-default">Clear</button></a>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success" OnClick="btnRegister_Click" />


                    </div>

                    <br />
                    <br />
                    <asp:Label ID="lblExisted" runat="server" ForeColor="Red"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" HeaderText="The following problems have been encountered" />




                </form>
