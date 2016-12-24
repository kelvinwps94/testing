<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerReserve.aspx.cs" Inherits="EzCabAssignment.CustomerReserve" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style type="text/css">
        .Background {
            position: fixed;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            overflow: hidden;
            padding: 0;
            margin: 0;
            background-color: #F0F0F0;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 100000;
        }

        .Progress {
            position: fixed;
            top: 10%;
            left: 10%;
            height: 80%;
            width: 80%;
            background-image: url('scripts/ajax_loader_gray_350.gif');
            background-repeat: no-repeat;
            background-position: center;
            z-index: 100001;
        }

        .auto-style1 {
            width: 253px;
        }

        .auto-style2 {
            width: 253px;
            height: 20px;
        }

        .auto-style3 {
            height: 20px;
            width: 627px;
        }

        .auto-style4 {
            width: 627px;
        }

        .modalBackground {
            background-color: Grey;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }

        .auto-style5 {
            width: 253px;
            height: 27px;
        }

        .auto-style6 {
            height: 27px;
            width: 627px;
        }

        .auto-style7 {
            width: 253px;
            height: 225px;
        }

        .auto-style8 {
            width: 627px;
            height: 225px;
        }
        .auto-style9 {
            width: 253px;
            height: 48px;
        }
        .auto-style10 {
            width: 627px;
            height: 48px;
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
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>

        <div>
            RESERVATION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            
         
&nbsp;
            <button type="button" onclick="loadDoc2()" class="btn btn-default">New Reservation</button>&nbsp;
            <script>
                function loadDoc2() {
                    location.reload();
                }
</script>
            <button type="button" onclick="loadDoc()" class="btn btn-default">Favourite</button>&nbsp;
            <script>
                function loadDoc() {
                    //2) get memberid from the new label
                    var id = document.getElementById("Label2").innerText;
                    var urlToGo = "favourite.aspx?memberid=" + id;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState == 4 && xhttp.status == 200) {
                            document.getElementById("UpdatePanel7").innerHTML = xhttp.responseText;
                            document.getElementById("UpdatePanel7").style.display = "inline";
                            document.getElementById("UpdatePanel8").style.display = "none";
                            document.getElementById("UpdatePanel5").style.display = "none";
                        }
                    };
                    
                    xhttp.open("GET", urlToGo, true);
                    xhttp.send();
                }
</script>
            <button type="button" onclick="loadDoc1()" class="btn btn-default">History</button>&nbsp;
            <script>
                function loadDoc1() {
                    //2) get memberid from the new label
                    var id = document.getElementById("Label2").innerText;
                    var urlToGo = "history.aspx?memberid=" + id;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState == 4 && xhttp.status == 200) {
                            document.getElementById("UpdatePanel8").innerHTML = xhttp.responseText;
                            document.getElementById("UpdatePanel8").style.display = "inline";
                            document.getElementById("UpdatePanel7").style.display = "none";
                            document.getElementById("UpdatePanel5").style.display = "none";
                        }
                    };
                    xhttp.open("GET", urlToGo, true);
                    xhttp.send();
                }
</script>
            
            <br />
            <br />

                 
                
  <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>

                           
            <table style="width: 100%;">
                <tr>
                    <td colspan="2">OUR TAXI CURRENTLY IS AVAILABLE IN KUALA LUMPUR AREA ONLY.<br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">PICK-UP:</td>
                    <td class="auto-style3">

                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" Height="21px" Width="131px" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="depart" DataValueField="depart" OnDataBound="MyListDataBound" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT DISTINCT [depart] FROM [Route]"></asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">DROP-OFF:</td>
                    <td class="auto-style4">

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" Height="23px" Width="131px" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="destination" DataValueField="destination" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EzCabConnectionString %>" SelectCommand="SELECT DISTINCT [destination] FROM [Route] WHERE ([depart] = @depart)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList2" Name="depart" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">ESTIMATED DISTANCE:
                     
                   </td>

                    <td class="auto-style6">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" >
                            <ContentTemplate>
                                &nbsp;<asp:Label ID="Label1" runat="server" Visible="False">distance</asp:Label>&nbsp;KM
                         
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>

                </tr>
              
                <tr>
                    <td class="auto-style7">PICK-UP DATE:</td>
                    <td class="auto-style8">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/scripts/calendar-128.png" Width="26px" OnClick="ImageButton1_Click" />
                                <br />
                                </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender"></asp:Calendar>
                        <br />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">PICK-UP TIME:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem Value="05"></asp:ListItem>
                            <asp:ListItem Value="07"></asp:ListItem>
                            <asp:ListItem Value="09"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;
                        <asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>45</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;
                        <asp:DropDownList ID="DropDownList6" runat="server">
                            <asp:ListItem>A.M.</asp:ListItem>
                            <asp:ListItem>P.M.</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style10">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="Button2" runat="server" Text="Check" OnClick="Button2_Click" CssClass="btn btn-primary" />
                               
                                &nbsp;
                                <asp:Button ID="Button3" runat="server" Enabled="False" Text="Next" PostBackUrl="~/CustomerReserveTaxi.aspx" CssClass="btn btn-success"/>
                               
                          
                               
                                <br />
                            </ContentTemplate>
                        </asp:UpdatePanel>        
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel6">
                          <ProgressTemplate>    
                              <div class="Background"><//div>
                              <div class="Progress"><h3><p style="text-align:center"><b>Reservation is in process, Please wait for a moment...<br/></b></p></h3></div>
                              </ProgressTemplate>
                                </asp:UpdateProgress>

                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                   
                                 <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                   
                                 </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
            </table>
                           
      </ContentTemplate>
                        </asp:UpdatePanel>   
            <asp:UpdatePanel ID="UpdatePanel7" runat="server"></asp:UpdatePanel> 
            <asp:UpdatePanel ID="UpdatePanel8" runat="server"></asp:UpdatePanel> 
        </div>
    </form>
</body>
</html>
