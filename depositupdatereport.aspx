<%@ Page Language="C#" AutoEventWireup="true" CodeFile="depositupdatereport.aspx.cs"
    Inherits="depositupdatereport" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<%@ Register Src="~/header.ascx" TagPrefix="user" TagName="head" %>
<%@ Register Src="~/footer.ascx" TagPrefix="user" TagName="h1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<HeadTitle:HTitle ID="thead" runat="server" />
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet'
        type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600'
        rel='stylesheet' type='text/css'>
    <!-- /GOOGLE FONTS -->
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/icomoon.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/mystyles.css" />
    <script src="js/modernizr.js"></script>
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
    <style type="text/css">
        .offset-1
        {
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
    <script type="text/javascript">

        function chkdel(vnow) {
            vret = confirm('Delete ' + vnow + ' Deposit Information?')
            return vret;
        }
    </script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <style>
        .mydatagrid
        {
            width: 100%;
            border: solid 2px black;
            min-width: 80%;
        }
        .header
        {
            background-color: #6a6a6a;
            font-family: Calibri;
            color: White;
            height: 25px;
            text-align: center;
            font-size: 25px;
        }
        
        .rows
        {
            background-color: #fff;
            font-family: Calibri;
            font-size: 20px;
            color: #000;
            min-height: 25px;
            text-align: left;
        }
        .rows:hover
        {
            background-color: #fadd7a;
            color: #000;
        }
        
        .mydatagrid a /** FOR THE PAGING ICONS  **/
        {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #ffa500;
            text-decoration: none;
            font-weight: bold;
        }
        
        .mydatagrid a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
        {
            background-color: #fff;
            color: #000;
        }
        .mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
        {
            padding: 5px 5px 5px 5px;
            background-color: #000;
            color: #fff;
        }
        .pager
        {
            background-color: #fadd7a;
            font-family: Calibri;
            color: White;
            height: 30px;
            text-align: left;
        }
        
        .mydatagrid td
        {
            padding: 5px;
        }
        .mydatagrid th
        {
            padding: 5px;
        }
    </style>
    <style type="text/css">
        /*Calendar Control CSS*/
        .cal_Theme1 .ajax__calendar_container
        {
            background-color: #00BFFF;
            border: solid 1px #77D5F7;
            width: 210px;
            height: 200px;
        }
        
        .cal_Theme1 .ajax__calendar_header
        {
            background-color: #ffffff;
            margin-bottom: 4px;
        }
        
        .cal_Theme1 .ajax__calendar_title, .cal_Theme1 .ajax__calendar_next, .cal_Theme1 .ajax__calendar_prev
        {
            color: #0059b3;
            padding-top: 1px;
        }
        
        .cal_Theme1 .ajax__calendar_body
        {
            background-color: #ffffff;
            border: solid 1px #77D5F7;
        }
        
        .cal_Theme1 .ajax__calendar_dayname
        {
            text-align: center;
            font-weight: bold;
            margin-bottom: 4px;
            margin-top: 2px;
            color: #0000FF;
        }
        
        .cal_Theme1 .ajax__calendar_day
        {
            color: #0000FF;
            text-align: center;
        }
        
        .cal_Theme1 .ajax__calendar_hover .ajax__calendar_day, .cal_Theme1 .ajax__calendar_hover .ajax__calendar_month, .cal_Theme1 .ajax__calendar_hover .ajax__calendar_year, .cal_Theme1 .ajax__calendar_active
        {
            color: #004080;
            font-weight: bold;
            background-color: #DEF1F4;
        }
        
        .cal_Theme1 .ajax__calendar_today
        {
            font-weight: bold;
        }
        
        
        .cal_Theme1 .ajax__calendar_other, .cal_Theme1 .ajax__calendar_hover .ajax__calendar_today, .cal_Theme1 .ajax__calendar_hover .ajax__calendar_title
        {
            color: #bbbbbb;
        }
    </style>
</head>
<body id="scroll">
    <user:head ID="header" runat="server" />
    <!-- FACEBOOK WIDGET Start-->
    <div id="fb-root">
    </div>
    <!-- /FACEBOOK WIDGET End-->
    <div class="global-wrap">
        <div class="gap">
        </div>
        <!--------Main container Start------------------>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-10 offset-1">
                        <form id="Form1" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <div class="row">
                            <!-------------------Searrching start------------->
                            <div class=" container-fluid" id="div_show">
                                <div class="row" style="font-size: 13px; margin-top: 10px;">
                                    <div style="border: 1px solid #CCC; margin-bottom: 20px;">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>
                                                    <b>From Date</b></label>
                                                <asp:TextBox ID="DUR_Depart" CssClass="form-control" placeholder="From Date" runat="server"
                                                    Height="35px" Width="210px" BorderColor="Gray"></asp:TextBox>
                                                <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True"
                                                    CssClass="cal_Theme1" TargetControlID="DUR_Depart" PopupPosition="BottomLeft"
                                                    Format="dd-MM-yyyy">
                                                </asp:CalendarExtender>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>
                                                    <b>To Date</b></label>
                                                <asp:TextBox ID="DUR_Back" CssClass="form-control" placeholder="To Date" runat="server"
                                                    Height="35px" Width="210px" BorderColor="Gray"></asp:TextBox>
                                                <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Enabled="True"
                                                    CssClass="cal_Theme1" TargetControlID="DUR_Back" PopupPosition="BottomLeft" Format="dd-MM-yyyy">
                                                </asp:CalendarExtender>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="submit" class="btn btn-primary" value="Search" style="margin-top: 30px;
                                                    width: 150px;" />
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-------------------Searrching End--------------->
                            <div class="clearfix">
                            </div>
                        </div>
                        </form>
                    </div>
                    <div class="col-md-1">
                    </div>
                    <!-------------------List start------------->
                    <div class=" row" style="margin-top: 50px; margin-bottom: 20px;">
                        <div class=" col-md-12">
                            <h4 style="text-align: center;">
                                Deposit Update Report</h4>
                        </div>
                        <%  int count = 1;
                        %>
                        <table id="deposit_table" style="width: 100%; font: 12px" border="2px">
                            <thead>
                                <tr style="color:Black; background-color:#ccc;">
                                    <td style="text-align: center;">
                                        <b>S.No.</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Code</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Agency Name</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Date Deposit Update</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Type</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Amount</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Employee Name</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Receipt Number</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Transaction Id</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Cheque No.</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Bank Name</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Remarks</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Update</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Del</b>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    try
                                    {
                                        String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");
                                        String sConn = "Server=" + ConnectionServer + ";" + ((ConfigurationManager.AppSettings.Get("ConnectionString")));
                                        System.Data.SqlClient.SqlConnection MyConnection = new System.Data.SqlClient.SqlConnection(sConn);
                                        MyConnection.Open(); string sql = "";
                                        sql = "select * from BankDeposit WITH (NOWAIT) ";
                                        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand(sql, MyConnection);
                                        System.Data.SqlClient.SqlDataReader adoDR = command.ExecuteReader();
                                        if (adoDR.HasRows)
                                        {
                                            adoDR.Read();
                                            do
                                            {
                                                string referencr = Server.UrlEncode(adoDR["Description"].ToString() + "," + adoDR["UserID"].ToString() + "," + adoDR["DepositAmt"].ToString() + "," + adoDR["ID"].ToString() + "," + adoDR["Typeofdeposit"].ToString());
                                %>
                                <tr style="color: #333333; font-size: 13px;">
                                    <td style="text-align: right;">
                                        <%=count%>.
                                    </td>
                                    <td style="text-align: left;">
                                        <%=adoDR["AgentCode"].ToString() %>
                                    </td>
                                    <td style="text-align: left;">
                                        <%=adoDR["Description"].ToString() %>
                                    </td>
                                    <td style="text-align: center;">
                                        <%=adoDR["DepositDate"].ToString() %>
                                    </td>
                                    <td style="text-align: center;">
                                        <%=adoDR["Typeofdeposit"].ToString() %>
                                    </td>
                                    <td style="text-align: right;">
                                        <%=adoDR["DepositAmt"].ToString() %>
                                    </td>
                                    <td style="text-align: center;">
                                        <%=adoDR["Empname"].ToString() %>
                                    </td>
                                    <td style="text-align: right;">
                                        <%=adoDR["receiptno"].ToString() %>
                                    </td>
                                    <td style="text-align: right;">
                                        <%=adoDR["TransactionId"].ToString() %>
                                    </td>
                                    <td style="text-align: right;">
                                        <%=adoDR["ChequeorDDno"].ToString() %>
                                    </td>
                                    <td style="text-align: center;">
                                        <%=adoDR["BankName"].ToString() %>
                                    </td>
                                    <td style="text-align: center;">
                                        <%=adoDR["Remarks"].ToString() %>
                                    </td>
                                    <td style="text-align: left;">
                                        <a href="javascript:var w= window.open('popupdepositupdate.aspx?AgencyID=<%=Server.UrlEncode(referencr)%>', '', 'width=1024, height=auto, scrollbars=yes, toolbar=no, menubar=no, margin=0 auto');">
                                            Update</a>
                                    </td>
                                    <td style="text-align: center;">
                                        <a href="depositupdatereport.aspx?delete=yes&idnow=<%=adoDR["ID"].ToString()%>" onclick="javacript:return chkdel('<%=adoDR["Description"].ToString()%>')">
                                            <img src="img/images.png" style="width: 20px !important; height: 20px !important; margin-top: 5px;"
                                                alt="Delete Record" /></a>&nbsp;
                                    </td>
                                </tr>
                                <% count = count + 1;
                                            }
                                            while (adoDR.Read());
                                        }
                                %>
                            </tbody>
                        </table>
                        <%}
                                    catch (Exception ex)
                                    {  %>
                        <div style="width: 100%; height: 30px;">
                            <div class="col-md-12">
                                <h5 class="text-center" style="color: Red;">
                                    No Record Found !!!!!</h5>
                            </div>
                        </div>
                    </div>
                    <%} %>
                    <!-------------------List End--------------->
                </div>
            </div>
        </div>
        <!--------Main container end-------------------->
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
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
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
    </div>
    <user:h1 ID="H1" runat="server" />
</body>
</html>
