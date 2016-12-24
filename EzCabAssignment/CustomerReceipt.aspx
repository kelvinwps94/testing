<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerReceipt.aspx.cs" Inherits="EzCabAssignment.CustomerReceipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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

    <!-- Import jquery to aspx -->
    <script src="jquery-3.1.0.min.js"></script>

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
                        
                        <li><a href="CustomerLogin.aspx"><span class="glyphicon glyphicon-log-in"></span> LOGOUT</a></li>
                    </ul>
                </div>
            </nav>
        </div>


        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
    
        <div id="content">
            Here&#39;s your receipt.<br />
            Ez Cab Online Receipt:<br />
            Customer Name:
            <asp:Label ID="lblCustName" runat="server"></asp:Label>
            <br />
            Payment ID:
            <asp:Label ID="lblID" runat="server"></asp:Label>
            <br />
            Reservation ID:
            <asp:Label ID="lblResID" runat="server"></asp:Label>
            <br />
            Total Charges:
        <asp:Label ID="lblTotal" runat="server"></asp:Label>
            <br />
            Date:
            <asp:Label ID="lblDate" runat="server"></asp:Label>
            <br />
            Time:
        <asp:Label ID="lblTime" runat="server"></asp:Label>
            <br />
            <br />
            Taxi Information:<br />
            Driver&#39;s Name:
            <asp:Label ID="lblDriverName" runat="server"></asp:Label>
            <br />
            Driver&#39;s Phone Number:
            <asp:Label ID="lblDriverPhoneNumber" runat="server"></asp:Label>
            <br />
            Car Plate Number:
            <asp:Label ID="lblCarPlateNo" runat="server"></asp:Label>
            <br />
            <br />
            Thank you for choosing us!<br />
            <br />
        </div>


    </form>
</body>
</html>
