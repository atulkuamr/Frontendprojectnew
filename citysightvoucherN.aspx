<%@ Page Language="C#" AutoEventWireup="true" CodeFile="citysightvoucherN.aspx.cs"
    Inherits="citysightvoucherN" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">   
<HeadTitle:HTitle ID="thead" runat="server" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/icomoon.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/mystyles.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
        <br />
        <div class="col-md-12">
            <div class="col-md-8">
                <br />
                <br />
                <img src="img/log.jpg"  style="width:30%;"/></div>
            <div class="col-md-4" style="float:right;">
                <b>Address : </b><br />
                Unit 303 – 304, Vipul Agora, MG Road,<br />
                Sector – 28, Gurugram - 122002, INDIA<br />
                Ph: +91–124–4705300
                <br />
                Mail : info@travstarz.com<br /></div>
        </div>
    </div>
        <table style="width:100%; border:2px solid #ccc; color:Black;">
            <thead>
                <tr style="height:50px; border-bottom:2px solid #ccc;">
                    <td align="center" colspan="2" style="width:60%; border-right:2px solid #ccc; color: #FFFFFF; font-size: x-large;" bgcolor="Black"><b>VOUCHER</b></td>
                    <td style="color: #000; font-size: large;" bgcolor="#999999">&nbsp;&nbsp;Number : </td>
                    <td style="color: #000; font-size: large;" bgcolor="#999999">&nbsp;&nbsp;<b><%=number%></b></td>
                </tr>
            </thead>
            <tbody style="font-size: medium">
                <tr style="height:10px;"><td></td><td style="border-right:2px solid #ccc;"></td><td></td><td></td></tr>
                <tr>
                    <td style="width:20%;">&nbsp;&nbsp;Service Type :</td>
                    <td style="border-right:2px solid #ccc;"><b>The voucher is for the City Sightseeing
                    <%=city%>-<%=day%></b></td>
                    <td>&nbsp;&nbsp;Country :</td>
                    <td><b><%=country%></b></td>
                </tr>
                <tr style="height:10px;"><td></td><td style=" border-right:2px solid #ccc;"></td><td></td><td></td></tr>
                <tr style="min-height:40px;">
                    <td>&nbsp;&nbsp;City :</td>
                    <td style=" border-right:2px solid #ccc;"><b><%=city %></b></td>
                    <td>&nbsp;&nbsp;Day :</td>
                    <td><b><%=day %></b></td>
                </tr>
                <tr style="height:10px;"><td></td><td style=" border-right:2px solid #ccc;"></td><td></td><td></td></tr>
                <tr style="min-height:40px;">
                    <td>&nbsp;&nbsp;Date :</td>
                    <td style=" border-right:2px solid #ccc;"><b><%=date%> (The validity is 3 months from the date of issuance and valid only for 1 use)</b></td>
                    <%--<td>&nbsp;&nbsp;Time :</td>
                    <td><b>10.00 Hrs</b></td>--%>
                </tr>
                <tr style="height:10px;"><td></td><td style=" border-right:2px solid #ccc;"></td><td></td><td></td></tr>
                <tr style="min-height:40px;">
                    <td>&nbsp;&nbsp;Confirmation No :</td>
                    <td style=" border-right:2px solid #ccc;"><b><%=confirmation %></b></td>
                    <td>&nbsp;&nbsp;Tour Name :</td>
                    <td><b><%=city %></b></td>
                </tr>
                <tr style="height:10px;"><td></td><td style=" border-right:2px solid #ccc;"></td><td></td><td></td></tr>
                <tr style="min-height:60px;">
                    <td>&nbsp;&nbsp;Supplier Name :</td>
                    <td style=" border-right:2px solid #ccc;"><b>City Sightseeing Worldwide</b></td>
                    <td style="min-width:115px;">&nbsp;&nbsp;Client Name :</td>
                    <td><b><%=cname %></b></td>
                </tr>
                <tr style="height:10px;"><td></td><td style=" border-right:2px solid #ccc;"></td><td></td><td></td></tr>
                <tr>
                    <td style="min-width:200px;">&nbsp;&nbsp;Supplier Address :</td>
                    <%--<td style=" border-right:2px solid #ccc;"><b><%=agencydetails.Split('!')[5] %></b></td>--%>
                    <td style="border-right:2px solid #ccc;"><b>Dnata India & paid to City Sightseeing Ltd,<br /> Stanley House, 49a High Street,<br /> Henley in Arden,<br /> Warwickshire, B95 5AA</b></td>
                    <td>&nbsp;&nbsp;Supplier Tel :</td>
                    <td><b><%=agencydetails.Split('!')[6] %></b></td>
                </tr>
                <tr style="height:10px; border-bottom:2px solid #ccc; "><td></td><td style="border-right:2px solid #ccc;"></td><td></td><td></td></tr>
                <tr style="height:10px;"><td></td><td style=" border-right:2px solid #ccc;"></td><td></td><td></td></tr>
                <tr>
                    <td>&nbsp;&nbsp;Total Passenger :</td>
                    <td style=" border-right:2px solid #ccc;"><b><%=tpax %></b></td>
                    <td>
                        &nbsp;&nbsp;Seniors :<br />
                        &nbsp;&nbsp;Adults :<br />
                        &nbsp;&nbsp;Childs :<br />
                        &nbsp;&nbsp;Infants :
                    </td>
                    <td>
                        <b><%=tsen %></b><br />
                        <b><%=tadt %></b><br />
                        <b><%=tchd %></b><br />
                        <b><%=tinf %></b>
                    </td>
                </tr>
                <tr style="height:10px;"><td></td><td style=" border-right:2px solid #ccc;"></td><td></td><td></td></tr>
            </tbody>
        </table>
    </div>
    <div class="gap"></div>

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/slimmenu.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="js/nicescroll.js"></script>
    <script type="text/javascript" src="js/dropit.js"></script>
    <script type="text/javascript" src="js/ionrangeslider.js"></script>
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
    <script type="text/javascript" src="common-show.js"></script>
    <script type="text/javascript" src="js/switcher.js"></script>
    <script type="text/javascript">
        //window.print();
    </script>
    </form>
</body>
</html>
