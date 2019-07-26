<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="AddMarkup.aspx.cs" Inherits="AddMarkup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <form id="form1" runat="server">
        <div style="width: 80%; margin-left: 10%; margin-right: 10%;">
            <script language="javascript" type="text/javascript">
        // <![CDATA[
//                function val() {
//                    debugger;
//                    var supp = '';
//                    var sql = "";
//                    var val = "";
//                    var arr = supp.split(',');
//                    for (var i = 0; i < arr.length; i++) {
//                        var sup = ""; var price = ""; var percent = "";
//                        sup = arr[i];
//                        price = document.getElementById("Fixed" + i).value;
//                        percent = document.getElementById("Per" + i).value;
//                        if (val == "") {
//                            val = sup + "~" + price + "~" + percent;
//                        }
//                        else {
//                            val += ";" + sup + "~" + price + "~" + percent;
//                        }
//                    }
//                    sql = "Update Markup set hotelmarkup='" + val + "'";
//                    debugger;
//                    document.getElementById("hidden").Value = sql;
//                    window.location.href = ("AddMarkup.aspx?query=" + val);
//                    return true;
//                }
            // ]]>
            </script>
            <div class="col-md-12">
                <center>
                    <span style="font-size: large; font-style: italic; text-decoration: underline;">Manage
                        MarkUp Value</span></center>
            </div>
            <div class="gap">
            </div>
            <div class="col-md-12" style="border: 2px solid #ccc;">
                <div class="col-md-12" style="margin-top: 10px;">
                    <center>
                        <span style="font-size: large; font-style: italic; text-decoration: underline;">Hotel
                            MarkUp</span></center>
                </div>
                <div class="col-md-12" style="margin: 15px;">
                    <table style="width: 90%; background-color: White;">
                        <tr style="height: 50px; font-size: medium;">
                            <td align="left" style="text-decoration: underline; width: 200px;">
                                Supplier
                            </td>
                            <td align="center" style="text-decoration: underline">
                                Markup Amt
                            </td>
                            <td align="center" style="text-decoration: underline">
                                Markup (%)age
                            </td>
                        </tr>   
                                            
                        <tr>
                            <td align="left">
                                TBO
                            </td>
                            <td align="center">
                                 <input id="Text1" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                  <input id="Text2" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                DOTW
                            </td>
                            <td align="center">
                                <input id="Text3" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                  <input id="Text4" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                TRAVELBULLZ
                            </td>
                            <td align="center">
                                 <input id="Text5" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                  <input id="Text6" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                DESIYA
                            </td>
                            <td align="center">
                                 <input id="Text7" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                  <input id="Text8" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                HOTELBEDS
                            </td>
                            <td align="center">
                                 <input id="Text9" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                  <input id="Text10" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                ABREU
                            </td>
                            <td align="center">
                                 <input id="Text11" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                  <input id="Text12" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                EZEEGO1
                            </td>
                            <td align="center">
                                 <input id="Text13" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                  <input id="Text14" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                JACTRAVEL
                            </td>
                            <td align="center">
                                 <input id="Text15" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                  <input id="Text16" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                    </table>
                    <center>
                        <asp:Button ID="btn" runat="server" Height="35px" Width="100px" Text="Submit" OnClick="btn_Click" /></center>
                </div>
                <div class="gap">
                </div>
                <hr />
                <div class="col-md-12" style="margin-top: 10px;">
                    <center>
                        <span style="font-size: large; font-style: italic; text-decoration: underline;">Sightseeing
                            MarkUp</span></center>
                </div>
                <div class="col-md-12" style="margin: 15px;">
                    <table style="width: 90%; background-color: White;">
                        <tr style="height: 50px; font-size: medium;">
                            <td align="left" style="text-decoration: underline; width: 200px;">
                                Supplier
                            </td>
                            <td align="center" style="text-decoration: underline">
                                Markup Amt
                            </td>
                            <td align="center" style="text-decoration: underline">
                                Markup (%)age
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                HOTELBEDS
                            </td>
                            <td align="center">
                                <input id="SSmarkup" runat="server" type="text" class="form-control" style="width: 200px;"
                                   align="middle" />
                            </td>
                            <td align="center">
                                <input id="SSmarkupPer" runat="server" type="text" class="form-control" style="width: 200px;"
                                    align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 10px">
                        </tr>
                    </table>
                    <center>
                        <asp:Button ID="Button1" Height="35px" Width="100px" runat="server" 
                            Text="Submit" onclick="Button1_Click" /></center>
                </div>
                <div class="gap">
                </div>
                <hr />
                <div class="col-md-12" style="margin-top: 10px;">
                    <center>
                        <span style="font-size: large; font-style: italic; text-decoration: underline;">Transfer
                            MarkUp</span></center>
                </div>
                <div class="col-md-12" style="margin: 15px;">
                    <table style="width: 90%; background-color: White;">
                        <tr style="height: 50px; font-size: medium;">
                            <td align="left" style="text-decoration: underline; width: 200px;">
                                Supplier
                            </td>
                            <td align="center" style="text-decoration: underline">
                                Markup Amt
                            </td>
                            <td align="center" style="text-decoration: underline">
                                Markup (%)age
                            </td>
                        </tr>
                        <tr style="height: 5px">
                        </tr>
                        <tr>
                            <td align="left">
                                HOTELBEDS
                            </td>
                            <td align="center">
                                <input id="Tmarkup" runat="server" type="text" class="form-control" style="width: 200px;"
                                    align="middle" />
                            </td>
                            <td align="center">
                                <input id="TmarkupPer" runat="server" type="text" class="form-control" style="width: 200px;"
                                    align="middle" />
                            </td>
                        </tr>
                        <tr style="height: 10px">
                        </tr>
                    </table>
                    <center>
                        <asp:Button ID="Button2" Height="35px" Width="100px" runat="server" 
                            Text="Submit" onclick="Button2_Click" /></center>
                </div>
                <div class="gap">
                </div>
            </div>
        </div>
        </form>
    </div>
        <div class="gap-small"></div>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/slimmenu.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="js/nicescroll.js"></script>
    <script type="text/javascript" src="js/dropit.js"></script>
    <script type="text/javascript" src="js/ionrangeslider.js"></script>
    <script type="text/javascript" src="js/icheck.js"></script>
    <script type="text/javascript" src="js/fotorama.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script type="text/javascript" src="js/typeahead.js"></script>
    <script type="text/javascript" src="js/card-payment.js"></script>
    <script type="text/javascript" src="js/magnific.js"></script>
    <script type="text/javascript" src="js/owl-carousel.js"></script>
    <script type="text/javascript" src="js/fitvids.js"></script>
    <script type="text/javascript" src="js/tweet.js"></script>
    <script type="text/javascript" src="js/countdown.js"></script>
    <script type="text/javascript" src="js/gridrotator.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <script type="text/javascript" src="js/switcher.js"></script>
</asp:Content>
