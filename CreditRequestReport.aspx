<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreditRequestReport.aspx.cs" Inherits="CreditRequestReport" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Src="~/header.ascx" TagPrefix="user" TagName="head" %>
<%@ Register Src="~/footer.ascx" TagPrefix="user" TagName="h1" %>
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
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/scarlet.css" title="scarlet" media="all" />
    <link href="css/ResponsiveTabel.css" rel="stylesheet" />
    <style type="text/css">
        .offset-1 {
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
</head>

<body id="scroll">
<user:head ID="header" runat="server" />
    <!-- FACEBOOK WIDGET Start-->
    <div>
    <div id="fb-root"></div>
    <!-- /FACEBOOK WIDGET End-->
    <div class="global-wrap">
        <div class="gap"></div>

        <!--------Main container Start------------------>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-1"></div>

                    <div class="col-md-10 offset-1">

                        <form id="Form1" runat="server">
                            <div class="row">
                                <!-------------------Searrching start------------->
                                <div class="container-fluid" id="div_show">
                                    <div class="row" style="font-size: 13px; margin-top: 10px;">

                                        <div style="border: 1px solid #CCC; margin-bottom: 20px;">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label><b>From Date</b></label>
                                                    <input type="text" class="form-control" runat="server"
                                                        id="datepicker" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label><b>To Date</b></label>
                                                    <input type="text" class="form-control" id="datepickerto"
                                                        runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                <br />
                                                    <asp:Button ID="Submit" runat="server" Text="Submit" class="btn btn-primary" OnClick="Submit_Click" OnClientClick="return valSubmit();" />
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>

                                    </div>
                                </div>
                                <!-------------------Searrching End--------------->

                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-1"></div>

                    <!-------------------List start------------->
                    <div class=" row" style="margin-top: 50px; margin-bottom: 20px;">
                        <div class=" col-md-12">
                            <h4 style="text-align: center;">Credit Request Report</h4>
                        </div>
                        <%  int count = 1; %>
                        <table id="deposit_table" style="width: 100%; font: 12px">
                            <thead>
                                <tr class="table_tr">
                                    <td style="text-align: center;"><b>Delete</b></td>
                                    <td style="text-align: left;">&nbsp;<b>S.No.</b></td>
                                    <td style="text-align: left;">&nbsp;<b>Code</b></td>
                                    <td style="text-align: left;">&nbsp;<b>Name</b></td>
                                    <td style="text-align: left;">&nbsp;<b>Credit Requested</b></td>
                                    <td style="text-align: left;">&nbsp;<b>Credit Pending</b></td>
                                    <td style="text-align: left;">&nbsp;<b>Deposit Date</b></td>
                                    <td style="text-align: left;">&nbsp;<b>Last Update Amount</b></td>
                                    <td style="text-align: left;">&nbsp;<b>Last Update Date</b></td>
                                    <td style="text-align: left;">&nbsp;<b>Update</b></td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    // DateTime.ParseExact(DT, "dd-MM-yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd");
                                    string SelectDates = "";
                                    if (Request.QueryString["SelectDates"] == null)
                                    {
                                        SelectDates = DateTime.Now + "," + DateTime.Now;
                                    }
                                    else
                                    {
                                        SelectDates = Request.QueryString["SelectDates"];
                                    }
                                    string[] txt1 = SelectDates.Split(',');
                                    if (txt1[0] == "" && txt1[1] == "")
                                    {
                                        txt1[0] = DateTime.Now.ToString();
                                        txt1[1] = DateTime.Now.ToString();
                                    }
                                    string txt00 = "";
                                    if (txt1[0] != "")
                                    {
                                        string[] dtval1 = txt1[0].Split('-','/');
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
                                    if (txt1[1] != "")
                                    {
                                        string[] dtval2 = txt1[1].Split('-','/');
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

                                    try
                                    {
                                        String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");
                                        String sConn = "Server=" + ConnectionServer + ";" + ((ConfigurationManager.AppSettings.Get("ConnectionString")));
                                        System.Data.SqlClient.SqlConnection MyConnection = new System.Data.SqlClient.SqlConnection(sConn);
                                        MyConnection.Open(); string sql = "";
                                        if (txt1[0] != "" && txt1[1] != "")
                                        {
                                            sql = "select * from OfflineCreditLog WITH (NOWAIT) where depositupdateflag=0 and convert(char[8],substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2)) between '" + txt00 + "' and '" + txt01 + "'";
                                        }
                                        else if (txt1[0] != "")
                                        {
                                            sql = "select * from OfflineCreditLog WITH (NOWAIT) where depositupdateflag=0 and convert(char(8),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2)) >= '" + txt00 + "'";
                                        }
                                        else if (txt1[1] != "")
                                        {
                                            sql = "select * from OfflineCreditLog WITH (NOWAIT) where depositupdateflag=0 and convert(char(8),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2)) <= '" + txt01 + "'";
                                        }

                                        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand(sql, MyConnection);
                                        System.Data.SqlClient.SqlDataReader adoDR = command.ExecuteReader();
                                        if (adoDR.HasRows)
                                        {
                                            adoDR.Read();
                                            do
                                            {
                                                string referencr = Server.UrlEncode(adoDR["Description"].ToString() + "," + adoDR["Uid"].ToString() + "," + adoDR["CreditNeeded"].ToString() + "," + adoDR["Sid"].ToString());
                                %>
                                <tr class="table_tr">

                                    <td style="text-align: center;"><a href="CreditRequestReport.aspx?delete=yes&idnow=<%=adoDR["Sid"].ToString()%>" onclick="javacript:return chkdel('<%=adoDR["Description"].ToString()%>')">
                                        <img src="img/delete_ico.gif" border="0" style="width: 25px !important; height: 25px !important;" alt="Delete Record"></a>&nbsp;</td>
                                    <td style="text-align: left;">&nbsp;<%=count%></td>
                                    <td style="text-align: left;">&nbsp;<%=adoDR["AgentCode"].ToString() %></td>
                                    <td style="text-align: left;">&nbsp;<%=adoDR["Description"].ToString() %></td>
                                    <td style="text-align: left;">&nbsp;<%=adoDR["CreditNeeded"].ToString()%></td>
                                    <td style="text-align: left;">&nbsp;<%=adoDR["CreditAvailable"].ToString()%></td>
                                    <td style="text-align: left;">&nbsp;<%=adoDR["LastDepositDate"].ToString()%></td>
                                    <td style="text-align: left;">&nbsp;<%=adoDR["LastDepositAmount"].ToString()%></td>
                                    <td style="text-align: left;">&nbsp;<%=adoDR["LastUpdateDate"].ToString()%></td>
                                    <td style="text-align: center;">&nbsp;<a href="javascript:var w= window.open('PopupCreditUpdate.aspx?AgencyID=<%=Server.UrlEncode(referencr)%>', '', 'width=1024, height=auto, scrollbars=yes, toolbar=no, menubar=no, margin=0 auto');">Update</a></td>
                                </tr>
                                <%   count = count + 1;
                                            }
                                            while (adoDR.Read());

                                        }
                                        else
                                        {
                                %>
                            </tbody>
                        </table>
                        <div style="width: 100%; height: 30px;">
                            <div class="col-md-12">
                                <h5 class="text-center" style="color: Red;">No Record Found !!!!!</h5>
                            </div>
                        </div>
                        <%} %>
                        <%}
                                    catch (Exception ex)
                                    {  %>
                        <div style="width: 100%; height: 30px;">
                            <div class="col-md-12">
                                <h5 class="text-center" style="color: Red;">No Record Found !!!!!</h5>
                            </div>
                        </div>
                    </div>
                    <%} %>
                    <!-------------------List End--------------->

                </div>
            </div>
        </div>
        <!--------Main container end-------------------->

        <script src="js/jquery.js"></script>
        <link href="jquery-ui-1.12.0/jquery-ui.css" rel="stylesheet"
            type="text/css" />
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="jquery-ui-1.12.0/jquery-ui.js"
            type="text/javascript"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/slimmenu.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/bootstrap-timepicker.js"></script>
        <script src="js/nicescroll.js"></script>
        <script src="js/dropit.js"></script>
        <script src="js/ionrangeslider.js"></script>
        <script src="js/icheck.js"></script>
        <script src="js/fotorama.js"></script>

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

    <script language="javascript">
        $(document).ready(function () {

        });
        $("#datepicker").datepicker({
            inline: true
        });
        $("#datepickerto").datepicker({
            inline: true
        });
    </script>
    <script type="text/javascript">
        // Declaring valid date character, minimum year and maximum year
        var dtCh = "/";
        var minYear = 1900;
        var maxYear = 2100;
        function isInteger(s) {
            var i;
            for (i = 0; i < s.length; i++) {
                // Check that current character is number.
                var c = s.charAt(i);
                if (((c < "0") || (c > "9"))) return false;
            }
            // All characters are numbers.
            return true;
        }

        function stripCharsInBag(s, bag) {
            var i;
            var returnString = "";
            // Search through string's characters one by one.
            // If character is not in bag, append to returnString.
            for (i = 0; i < s.length; i++) {
                var c = s.charAt(i);
                if (bag.indexOf(c) == -1) returnString += c;
            }
            return returnString;
        }

        function daysInFebruary(year) {
            // February has 29 days in any year evenly divisible by four,
            // EXCEPT for centurial years which are not also divisible by 400.
            return (((year % 4 == 0) && ((!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28);
        }
        function DaysArray(n) {
            for (var i = 1; i <= n; i++) {
                this[i] = 31
                if (i == 4 || i == 6 || i == 9 || i == 11) { this[i] = 30 }
                if (i == 2) { this[i] = 29 }
            }
            return this
        }

        function isDate(dtStr) {
            var daysInMonth = DaysArray(12)
            var pos1 = dtStr.indexOf(dtCh)
            var pos2 = dtStr.indexOf(dtCh, pos1 + 1)
            var strDay = dtStr.substring(0, pos1)
            var strMonth = dtStr.substring(pos1 + 1, pos2)
            var strYear = dtStr.substring(pos2 + 1)
            strYr = strYear
            if (strDay.charAt(0) == "0" && strDay.length > 1) strDay = strDay.substring(1)
            if (strMonth.charAt(0) == "0" && strMonth.length > 1) strMonth = strMonth.substring(1)
            for (var i = 1; i <= 3; i++) {
                if (strYr.charAt(0) == "0" && strYr.length > 1) strYr = strYr.substring(1)
            }
            month = parseInt(strMonth)
            day = parseInt(strDay)
            year = parseInt(strYr)
            if (pos1 == -1 || pos2 == -1) {
                //alert("The date format should be : dd/mm/yyyy")
                return false
            }
            if (strMonth.length < 1 || month < 1 || month > 12) {
                //alert("Please enter a valid month")
                return false
            }
            if (strDay.length < 1 || day < 1 || day > 31 || (month == 2 && day > daysInFebruary(year)) || day > daysInMonth[month]) {
                //alert("Please enter a valid day")
                return false
            }
            if (strYear.length != 4 || year == 0 || year < minYear || year > maxYear) {
                //alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
                return false
            }
            if (dtStr.indexOf(dtCh, pos2 + 1) != -1 || isInteger(stripCharsInBag(dtStr, dtCh)) == false) {
                //alert("Please enter a valid date")
                return false
            }
            return true
        }
    </script>
    <script type="text/javascript">
        function valSubmit() {
            var doc = document.frmProduct;
            var msg = "";
            if (document.getElementById('datepicker').value != "") {
                if (isDate(document.getElementById('datepicker').value) == false) {
                    msg += " \n* Invalid From Date";
                }
            }
            else {
                msg += " \n* Please Enter From Date";
            }

            if (document.getElementById('datepickerto').value != "") {
                if (isDate(document.getElementById('datepickerto').value) == false) {
                    msg += " \n* Invalid To Date";
                }
            }
            else {
                msg += " \n* Please Enter To Date";
            }
            if (msg == "") {
                return true;
                //            doc.submit();
            }
            else {
                alert(msg);
                return false;
            }
        }
    </script>
    
    </div>
    <user:h1 ID="H1" runat="server" />
    </div>
</body>
</html>
