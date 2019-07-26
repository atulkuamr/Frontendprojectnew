<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgencyDetailsPopUp.aspx.cs"
    Inherits="AgencyDetailsPopUp" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <HeadTitle:HTitle ID="header" runat="server" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/icomoon.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/mystyles.css" />
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
</head>
<body>
    <form id="FrmProduct" runat="server">
    <div class="container">
        <div class="col-md-12" style="border-bottom: 1px solid #ccc;">
            <center>
                <h3>
                    Agency Details</h3>
            </center>
        </div>
        <div style="width: 100%; height: auto; margin: 0 auto;">
            <div class="col-md-12">
                <div class="row" style="background-color: #EFF3F0;">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>Agency Name :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="Agency" runat="server"></asp:Label></div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>ContactPerson:</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="Label1" runat="server"></asp:Label></div>
                    </div>
                    <div class="gap">
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>Address :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="Address" runat="server"></asp:Label></div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>City :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="City" runat="server"></asp:Label></div>
                    </div>
                    <div class="gap">
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="row" style="background-color: #EFF3F0;">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>State :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="State" runat="server"></asp:Label></div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>Country :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="Country" runat="server"></asp:Label></div>
                    </div>
                    <div class="gap">
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>PinCode :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="PinCode" runat="server"></asp:Label></div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>Phone :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="Phone" runat="server"></asp:Label></div>
                    </div>
                    <div class="gap">
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="row" style="background-color: #EFF3F0;">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <strong>Mobile :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="Mobile" runat="server"></asp:Label></div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="col-md-6 col-sm-6 col-xs-6t">
                            <strong>Email :</strong></div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <asp:Label ID="Label2" runat="server"></asp:Label></div>
                    </div>
                    <div class="gap">
                    </div>
                </div>
            </div>
            <div class="gap">
            </div>
        </div>
    </div>
    <br />
    </form>
</body>
</html>
