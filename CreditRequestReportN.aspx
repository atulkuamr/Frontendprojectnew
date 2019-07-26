<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CreditRequestReportN.aspx.cs" Inherits="CreditRequestReportN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="container">
            <form id="Form1" runat="server">
            <div class="row">
                <!-------------------Searrching start------------->
                <div class="container-fluid" id="div_show">
                    <div class="row" style="font-size: 13px; margin-top: 10px;">
                        <div style="margin-bottom: 20px;">
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>
                                        <b>From Date</b></label>
                                    <input type="text" id="datepicker" class="form-control" placeholder="DD/MM/YYYY" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>
                                        <b>To Date</b></label>
                                    <input type="text" id="datepicker1" class="form-control" placeholder="DD/MM/YYYY"
                                        runat="server" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <br />
                                    <asp:Button ID="Submit" runat="server" Text="Submit" class="btn btn-primary" />
                                </div>
                            </div>
                            <div class="col-md-2">
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
            <br />
            <div class=" row" style="margin-bottom: 20px;">
                <div class=" col-md-12">
                    <h4 style="text-align: center;">
                        Credit Request Report</h4>
                </div>
                <table id="deposit_table" style="width: 100%; font: 12px; border: 1px solid black"
                    class="table-responsive">
                    <thead>
                        <tr class="table_tr" style="background-color: #C0C0C0; color: #000000;">
                            <td style="text-align: left; border: 1px solid black;">
                                <b>&nbsp;&nbsp;S.No.</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp; Code</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp; Name</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp;Credit Requested</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp;Credit Pending</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp; Deposit Date</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp; Last Update Amount</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp; Last Update Date</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp; Delete</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp; Update</b>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
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
                                        //if (txt1[0] != "" && txt1[1] != "")
                                        //{
                                        //    sql = "select * from OfflineCreditLog WITH (NOWAIT) where depositupdateflag=0 and convert(char[8],substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2)) between '" + txt00 + "' and '" + txt01 + "'";
                                        //}
                                        //else if (txt1[0] != "")
                                        //{
                                        //    sql = "select * from OfflineCreditLog WITH (NOWAIT) where depositupdateflag=0 and convert(char(8),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2)) >= '" + txt00 + "'";
                                        //}
                                        //else if (txt1[1] != "")
                                        //{
                                        //    sql = "select * from OfflineCreditLog WITH (NOWAIT) where depositupdateflag=0 and convert(char(8),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2)) <= '" + txt01 + "'";
                                        //}
                                        //else
                                        //{
                                            sql = "select * from OfflineCreditLog";
                                        //}

                                        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand(sql, MyConnection);
                                        System.Data.SqlClient.SqlDataReader adoDR = command.ExecuteReader();
                                        if (adoDR.HasRows)
                                        {
                                            adoDR.Read();
                                            do
                                            {
                                                string referencr = Server.UrlEncode(adoDR["Description"].ToString() + "," + adoDR["Uid"].ToString() + "," + adoDR["CreditNeeded"].ToString() + "," + adoDR["Sid"].ToString());
                                            
                        %>
                        <tr style="color: #000000">
                            <td style="text-align: left; border: 1px solid black;">
                                <b>&nbsp;&nbsp;S.No.</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;
                                    <%=adoDR["AgentCode"].ToString()%></b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp;
                                    <%=adoDR["Description"].ToString()%></b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp;<%=adoDR["CreditNeeded"].ToString()%></b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp;<%=adoDR["CreditAvailable"].ToString()%></b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp;
                                    <%=adoDR["LastDepositDate"].ToString()%></b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp;
                                    <%=adoDR["LastDepositAmount"].ToString()%></b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;&nbsp;&nbsp;
                                    <%=adoDR["LastUpdateDate"].ToString()%></b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;<a href="CreditRequestReportN.aspx?delete=yes&idnow=<%=adoDR["Sid"].ToString()%>" onclick="javacript:return chkdel('<%=adoDR["Description"].ToString()%>')">
                                        <img src="img/delete_ico.gif" border="0" style="width: 25px !important; height: 25px !important;" alt="Delete" /></a>&nbsp;</b>
                            </td>
                            <td style="text-align: center; border: 1px solid black">
                                <b>&nbsp;<a href="javascript:var w= window.open('PopupCreditUpdate.aspx?AgencyID=<%=Server.UrlEncode(referencr)%>', '', 'width=1024, height=auto, scrollbars=yes, toolbar=no, menubar=no, margin=0 auto');">Update</a></b>
                            </td>
                        </tr>
                        <%   
}
                                            while (adoDR.Read());

                                        }
                                        else
                                        {
                        %>
                        <div style="width: 100%; height: 30px;">
                            <div class="col-md-12">
                                <h5 class="text-center" style="color: Red;">
                                    No Record Found !!!!!</h5>
                            </div>
                        </div>
                        <%}
                                    }
                                    catch (Exception ex)
                                    {

                                    }%>
                    </tbody>
                </table>
            </div>
            </form>
        </div>
        <script type="text/javascript">
            $(function () {
                $("#datepicker").datepicker();
            });
            $(function () {
                $("#datepicker1").datepicker();
            });
        </script>
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
</asp:Content>
