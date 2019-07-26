<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Credit.aspx.cs" Inherits="Credit" %>
<%@ Register Src="~/header.ascx" TagPrefix="user" TagName="head" %>
<%@ Register Src="~/footer.ascx" TagPrefix="user" TagName="h1" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <HeadTitle:HTitle ID="thead" runat="server" />
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600'
        rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/icomoon.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/mystyles.css" />
    <script type="text/javascript" src="js/modernizr.js"></script>
    <link rel="stylesheet" href="css/switcher.css" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/bright-turquoise.css"
        title="bright-turquoise" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/turkish-rose.css"
        title="turkish-rose" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/salem.css" title="salem"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/hippie-blue.css"
        title="hippie-blue" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/mandy.css" title="mandy"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/green-smoke.css"
        title="green-smoke" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/horizon.css" title="horizon"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/cerise.css" title="cerise"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/brick-red.css"
        title="brick-red" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/de-york.css" title="de-york"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/shamrock.css"
        title="shamrock" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/studio.css" title="studio"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/leather.css" title="leather"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/denim.css" title="denim"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/scarlet.css" title="scarlet"
        media="all" />
</head>
<body id="scroll">
<user:head ID="header" runat="server" />
    <!-- FACEBOOK WIDGET -->
    <div id="fb-root">
    </div>
    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));
    </script>
    <!-- /FACEBOOK WIDGET -->
    <div class="global-wrap">
        
        <form runat="server" id="form1">
        <div class="container">
            <div style="width: 100%; background-color: #D3D3D3;
                height: auto;">
                <div class="col-md-3 col-sm-6">
                    <span>Type</span>
                    <asp:DropDownList ID="ddlType" runat="server" class="form-control">
                        <asp:ListItem Text="ALL" Value="ALL" />
                        <asp:ListItem Text="Distributor" Value="D" />
                        <asp:ListItem Text="Agents" Value="A" />
                        <asp:ListItem Text="Corporate" Value="Cr" />
                    </asp:DropDownList>
                </div>
            <div class="col-md-3 col-sm-6">
                <span>Credit Limit</span>
                <asp:DropDownList ID="ddlType2" runat="server" class="form-control">
                    <asp:ListItem Text="Select" Value="S" />
                    <asp:ListItem Text="Non-Zero" Value="Nz" />
                    <asp:ListItem Text="Zero" Value="Z" />
                    <asp:ListItem Text="Negative" Value="Ne" />
                </asp:DropDownList>
            </div>
            <div class="col-md-2 col-sm-6" style="margin-top: 20px;">
                <asp:Button ID="BtnSearch" runat="server" class="btn" Text="Search" Style="cursor: pointer" />
            </div>
            <div class="col-md-2 col-sm-6 " style="margin-top: 20px;">
                <asp:Button ID="Button2" runat="server" class="btn" Text="Add Limits" Style="cursor: pointer" />
            </div>
            <div class="col-md-2 col-sm-6" style="margin-top: 20px;">
                <asp:Button ID="export2Excel" runat="server" class="btn" Text=" Export To Excel"
                    Style="cursor: pointer" />
            </div>
            <div class="gap">
            </div>
            <div class="gap">
            </div>
            </div>
            <table width="100%">
                    <tr>
                        <div class="top_head_txt">
                            Franchisee/Agents Available Credit List</div>
                    </tr>
                    <tr>
                        <td>
                            <table id="table3" border="0" cellspacing="0" cellpadding="0" width="100%">
                                <tbody>
                                    <table id="definecreditmain">
                                        <thead>
                                            <tr>
                                                <td align="right" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>SNo.</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 6px; font-size: 12px;">
                                                    <a href=""><font color="#000"><b>Agent/ Franchisee/ CCY</b></font></a>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Active</b>
                                                </td>
                                                <td align="right" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Book Bal</b>
                                                </td>
                                                <td align="right" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Cash Bal</b>
                                                </td>
                                                <td align="right" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Acct Bal</b>
                                                </td>
                                                <td align="right" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Credit</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Check Log</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Intl PLB</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Dom PLB</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Hotel MarkUp</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Schedule</b>
                                                </td>
                                                <td align="center" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Intl PLB</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Agency Detail</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Hotel MarkUp</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Agents List</b>
                                                </td>
                                                <td align="left" style="border-left: 1px solid #ccc; border-bottom: 1px solid #ccc; border-right: 1px solid #ccc; border-top: 1px solid #ccc; line-height: 25px; padding-left: 3px; padding-right: 4px; font-size: 12px;">
                                                    <b>Details</b>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%--<tr>
                                                <td class="ui-border-wo-top" align="right">
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a class="txt_blue" href=""></a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a class="txt_blue" href=""></a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                </td>
                                                <td class="ui-border-wo-topleft" align="right">
                                                </td>
                                                <td class="ui-border-wo-topleft" align="right">
                                                </td>
                                                <td class="ui-border-wo-topleft" align="right">
                                                </td>
                                                <td class="ui-border-wo-topleft" align="right">
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a class="txt_blue" href="">Check Log</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a class="txt_blue" href="">Intl PLB</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a class="txt_blue" href="">Dom PLB</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a class="txt_blue" href="">Hotel Markup</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a class="txt_blue" href="">Schedule</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a href="">Intl PLB</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a href="">Check Detail</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a href="">Hotel Markup</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a href="">View List</a>
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    View List
                                                </td>
                                                <td class="ui-border-wo-topleft" align="left">
                                                    <a class="txt_blue" href="">Agency Details</a>
                                                </td>
                                            </tr>--%>
                                    </table>
                                    <div style="width: 100%; height: 30px;">
                                        <div class="col-md-12">
                                            <h5 class="text-center" style="color: Red;">
                                                No Record Found !!!!!</h5>
                                        </div>
                                    </div>
                                </tbody>
                        </td>
                    </tr>
                </table>
        </div>
        </form>
        
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
        <script src="js/PageDivision.js" type="text/javascript"></script>
    </div>
    <user:h1 ID="H1" runat="server" />
</body>
</html>
