<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerPayment.aspx.cs" Inherits="EzCabAssignment.CustomerPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- Import jquery to aspx -->
    <script src="jquery-3.1.0.min.js"></script>

    <!-- Import javascript for validation credit card to aspx -->
    <script src="ccvalidate.js"></script>

    <!-- Import javascript for validation to aspx -->
    <script src="jquery.validate.min.js"></script>

    <script type="text/javascript">

        $(function () {
            //Validate Credit Card
            $('.div').ccvalidate({
                onvalidate: function (isValid) {
                    if (isValid) {
                        // Setup form validation on the #form1 element
                        $('#form1').validate({
                            // Specify the validation rules
                            rules: {
                                txtCVV: {
                                    required: true,
                                    number: true,
                                    minlength: 3
                                }
                            },
                            // Specify the validation error messages
                            messages: {
                                txtCVV: {
                                    required: " Credit card security code required.",
                                    number: " Please enter number only.",
                                    minlength: " Please enter exactly 3 number."
                                }
                            },
                        });
                    }
                    if (!isValid) {
                        //Display alert message
                        alert('Invalid Credit Card. Please try again!');
                        return false;
                    }
                }
            });

        });
    </script>

    <style type="text/css">
        .auto-style1 {
        }

        .auto-style2 {
            width: 171px;
        }

        .auto-style3 {
            width: 171px;
            height: 29px;
        }

        .auto-style4 {
            height: 29px;
        }

        .auto-style5 {
            width: 171px;
            height: 32px;
        }

        .auto-style6 {
            height: 32px;
        }

        .auto-style7 {
            width: 171px;
            height: 26px;
        }

        .auto-style8 {
            height: 26px;
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
    <form id="form1" runat="server" method="post" action="CustomerReceipt.aspx">
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
    
        <div class="div">

            <table style="width: 100%;">
                <tr>
                    <td class="auto-style7">Total ride fare: </td>
                    <td class="auto-style8">
                        <asp:Label ID="lblFare" runat="server"></asp:Label>

                        &nbsp;</td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">Please fill in your credit card information.</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">Credit card type: </td>
                    <td class="auto-style6">
                        <select class="ddlCCtype">
                            <option value="mcd">Master Card</option>
                            <option value="vis">Visa Card</option>
                            <option value="amx">American Express</option>
                            <option value="dnr">Diner Club</option>
                            <option value="dis">Discover</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Credit card number:</td>
                    <td class="auto-style4">
                        <input type="text" id="card-number" class="txtCCNumber" maxlength="16" />

                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Expiry Date:</td>
                    <td class="auto-style4">

                        <asp:DropDownList ID="ddlMonth" runat="server">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;/&nbsp;
                        <asp:DropDownList ID="ddlYear" runat="server">
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">CVV:</td>
                    <td>
                        <asp:TextBox ID="txtCVV" runat="server" Width="77px" TextMode="Password" MaxLength="3"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <input type="submit" value="Confirm" class="btnConfirm"/>&nbsp;

                    </td>
                    <td><asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td>
                </tr>
            </table>
            <br />

        </div>
    </form>
</body>
</html>
