<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DepositList.aspx.cs" Inherits="DepositList" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<HeadTitle:HTitle ID="thead" runat="server" />
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css'>
    <!-- /GOOGLE FONTS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/mystyles.css">
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
    <link href="../css/ResponsiveTabel.css" rel="stylesheet" />
    <style type="text/css">
        .offset-1
        {
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
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
<body>
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
                                                <%--<input type="text" class="form-control" runat="server" id="DUR_Depart" />--%>
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
                                                <%-- <input type="text" class="form-control" id="DUR_Back" runat="server" />--%>
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
                    <div class=" row" style="margin-top: 50px;">
                        <div class=" col-md-12">
                            <h4 style="text-align: center;">
                                Deposit List</h4>
                        </div>
                        <table id="DepositList" style="width: 100%" border="2px">
                            <thead>
                                <tr bgcolor="#00BFFF" style="color: #FFFFFF">
                                    <td style="text-align: center;">
                                        <b>S.No.</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Agent Code</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Agency Name</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Distributer Name</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Distributer Code</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Updated Date </b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Deposit Date </b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Requested Amount</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Updated Amount</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Employee Agent code</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Bank Name</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Bank Narration</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Executive Name</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Deposit Ref. No.</b>
                                    </td>
                                    <td style="text-align: center;">
                                        <b>Remarks</b>
                                    </td>
                                </tr>
                            </thead>
                            <%                     
                                int count = 0;
                                int DepositAmt = 0;
                                int CreditedAmt = 0;
                                string SelectDates = "";
                                if (string.IsNullOrEmpty(Request.QueryString["SelectDates"]))
                                {
                                    SelectDates = System.DateTime.Today + "," + System.DateTime.Today;
                                }
                                else
                                {
                                    SelectDates = Request.QueryString["SelectDates"];
                                }
                                string[] txt1 = Regex.Split(SelectDates, ",");
                                if (txt1[0] == "" && txt1[1] == "")
                                {
                                    txt1[0] = System.DateTime.Now.ToString();
                                    txt1[1] = System.DateTime.Now.ToString()
                                        ;
                                }
                                string txt00 = "";
                                if (txt1[0] == "")
                                {
                                    string[] dtval1 = Regex.Split(txt1[0], "/");
                                    string day1 = dtval1[0];
                                    if (day1.Length == 1)
                                    {
                                        day1 = "0" + day1;
                                    }
                                    string mnth1 = dtval1[1];
                                    if (mnth1.Length == 1)
                                    {
                                        mnth1 = "0" + mnth1;
                                    }
                                    txt00 = dtval1[2] + mnth1 + day1;
                                }
                                string txt01 = "";
                                if (txt1[1] == "")
                                {
                                    string[] dtval2 = Regex.Split(txt1[1], "/");
                                    string day2 = dtval2[0];
                                    if (day2.Length == 1)
                                    {
                                        day2 = "0" + day2;
                                    }
                                    string mnth2 = dtval2[1];
                                    if (mnth2.Length == 1)
                                    {
                                        mnth2 = "0" + mnth2;
                                    }
                                    txt01 = dtval2[2] + mnth2 + day2;
                                }
                                string sql = "";
                                if (txt1[0] == "" && txt1[1] == "")
                                {
                                    sql = "select a.*, (select agencyname from AdminLogin b where b.Donecarduser = a.RefAgency) DistributerName from BankDeposit a where depositupdateflag=1 and convert(char(8),substring(UpdateDate,7,4) + substring(UpdateDate,4,2) + substring(UpdateDate,1,2)) between '" + txt00 + "' and '" + txt01 + "'";
                                }
                                else if (txt1[0] == "")
                                {
                                    sql = "select a.*, (select agencyname from AdminLogin b where b.Donecarduser = a.RefAgency) DistributerName from BankDeposit a where depositupdateflag=1 and convert(char(8),substring(UpdateDate,7,4) + substring(UpdateDate,4,2) + substring(UpdateDate,1,2)) >= '" + txt00 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select a.*, (select agencyname from AdminLogin b where b.Donecarduser = a.RefAgency) DistributerName from BankDeposit a where depositupdateflag=1 and convert(char(8),substring(UpdateDate,7,4) + substring(UpdateDate,4,2) + substring(UpdateDate,1,2)) <= '" + txt01 + "'";
                                }

                                if (Session["UserType"].ToString() != "OO")
                                {
                                    sql = sql + " and UserID='" + Session["loginVal"] + "' ";
                                }
                                System.Data.SqlClient.SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);

                                if (sdr.Read())
                                {
                                    while (sdr.Read())
                                    {
                                        DepositAmt = DepositAmt + Convert.ToInt32(DB.CommonDatabase.GetValue(sdr, "DepositAmt"));
                                        CreditedAmt = CreditedAmt + Convert.ToInt32(DB.CommonDatabase.GetValue(sdr, "CreditedAmt"));

                                        string agency_id = DB.CommonDatabase.GetValue(sdr, "UserID");
                            %>
                            <tr style="color: #333333; font-size: 13px;">
                                <td style="text-align: right;">
                                    <%=count%>
                                </td>
                                <td style="text-align: left;">
                                    <a class="txt_blue" href="javascript:var w= window.open('AgencyDetailsPopUp.aspx?AgencyID=<%=agency_id%>', '', 'width=580, height=220, scrollbars=yes, toolbar=no, menubar=no');">
                                        <%=DB.CommonDatabase.GetValue(sdr, "agentcode")%>
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "Description")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "DistributerName")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "RefAgency")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "Creationdate")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "depositdate")%>&nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "DepositAmt")%>&nbsp;
                                </td>
                                <td style="text-align: right;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "CreditedAmt")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "EmployeeEmtCode")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "BankName")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "banknarration")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "executivename")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "DepositRefno")%>&nbsp;
                                </td>
                                <td style="text-align: left;">
                                    <%=DB.CommonDatabase.GetValue(sdr, "ExecutiveRemarks")%>&nbsp;
                                </td>
                            </tr>
                            <%
}
                                } %>
                        </table>
                        <div style="width: 100%; height: 30px;">
                            <div class="col-md-12">
                                <h5 class="text-center" style="color: Red;">
                                    No Record Found !!!!!</h5>
                            </div>
                        </div>
                    </div>
                    <!-------------------List End--------------->
                </div>
            </div>
        </div>
        <!--------Main container end-------------------->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/slimmenu.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/bootstrap-timepicker.js"></script>
        <script src="js/nicescroll.js"></script>
        <script src="js/dropit.js"></script>
        <script src="js/ionrangeslider.js"></script>
        <script src="js/icheck.js"></script>
        <script src="js/fotorama.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
        <script src="js/typeahead.js"></script>
        <script src="js/card-payment.js"></script>
        <script src="js/magnific.js"></script>
        <script src="js/owl-carousel.js"></script>
        <script src="js/fitvids.js"></script>
        <script src="js/tweet.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/gridrotator.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/switcher.js"></script>
    </div>
</body>
</html>
