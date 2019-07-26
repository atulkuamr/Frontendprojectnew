<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckLogs.aspx.cs" Inherits="CheckLogs" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <HeadTitle:HTitle ID="thead" runat="server" />
</head>
<body>
    <script language="javascript" type="text/javascript">
        function Show() {
            var a = document.getElementById('showdiv');
            if (a.style.display == "none") {
                a.style.display = 'block';
            }
            else {
                a.style.display = 'none';
            }
        }
    </script>

    <form id="FrmProduct" class="backgroundcolor" runat="server">
    <div class="infl_comm_wrap">
        <script language="javascript" type="text/javascript">
            function chkdel(vnow) {
                vret = confirm('Delete ' + vnow + '?')
                return vret;
            }
        </script>
        <%
            if (!string.IsNullOrEmpty(Request.QueryString["gusername"].ToString()) | !string.IsNullOrEmpty(Request.QueryString["gusertype"].ToString()))
            {
                string gusername = Request.QueryString["gusername"].ToString();
                string usertype = Request.QueryString["gusertype"].ToString();
            }
        %>
        <div id="serch_div1" class="col-md-12 serch_div">
            <div class="infl_search_btn serch_div1" style="float: right;">
                <a onclick="Show();">
                    <img src=""  /></a></div>
            <div style="clear: both;">
            </div>
        </div>
        <div class=" col-md-12" id="showdiv" style="margin-top: 30px; margin-bottom: 10px;">
            <div class="row">
                <div class="col-md-3 mgn">
                    From Date:<asp:TextBox class="form-control cal" ID="Depart" runat="server"></asp:TextBox>
                    <div style="clear: both;">
                    </div>
                </div>
                <div class="col-md-3 mgn">
                    To Date:<asp:TextBox class="form-control cal" ID="Back" runat="server"></asp:TextBox>
                    <div style="clear: both;">
                    </div>
                </div>
                <div class="col-md-3 mgn">
                    Type :<asp:DropDownList ID="updatetype" runat="server" class="form-control">
                        <asp:ListItem Value="">ALL</asp:ListItem>
                        <asp:ListItem Value="Deposit">Deposit</asp:ListItem>
                        <asp:ListItem Value="Credit">Credit</asp:ListItem>
                        <asp:ListItem Value="Incentive">Incentive</asp:ListItem>
                        <asp:ListItem Value="Refund">Refund</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3 mgn">
                    <div class="col-md-4 mgn">
                        <br /><asp:Button ID="Button1" class="btn" runat="server" Text="Search" Style="cursor: pointer"
                            OnClientClick="return valSubmit();" />
                        <div style="clear: both;">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <br /><asp:Button ID="Button4" class="btn" runat="server" Text="Export to Excel" Style="cursor: pointer"
                            OnClientClick="return valSubmit();" />
                        <div style="clear: both;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin-bottom: 20px;" class="text-center">
            <h4>
                <b>User Credit Log List</b></h4>
        </div>
        <%  
            string stDate = "";
            string uid = Request.QueryString["idnow"];

            string SelectDates = "";
            if (Request.QueryString["SelectDates"].ToString() != "")
            {
                SelectDates = System.DateTime.Today + "," + System.DateTime.Today;
            }
            else
            {
                SelectDates = Request.QueryString["SelectDates"];
            }
            string[] txt1 = Regex.Split(SelectDates, ",");
            if (string.IsNullOrEmpty(txt1[0]) & string.IsNullOrEmpty(txt1[1]))
            {
                txt1[0] = System.DateTime.Today.ToString();
                txt1[1] = System.DateTime.Today.ToString();
            }
            string txt00 = "";
            if (!string.IsNullOrEmpty(txt1[0]))
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
            if (!string.IsNullOrEmpty(txt1[1]))
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

            string sSQL = "";
            if (!string.IsNullOrEmpty(txt1[0]) & !string.IsNullOrEmpty(txt1[1]))
            {
                sSQL = "select * from AdminCreditLimit_log where userid = '" + uid + "' and rtrim(convert(char(14),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2) )) between '" + txt00 + "' and '" + txt01 + "'";
            }
            else if (!string.IsNullOrEmpty(txt1[0]))
            {
                sSQL = "select * from AdminCreditLimit_log where userid = '" + uid + "' and convert(char(14),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2) ) >= '" + txt00 + "'";
            }
            else if (!string.IsNullOrEmpty(txt1[1]))
            {
                sSQL = "select * from AdminCreditLimit_log where userid = '" + uid + "' and convert(char(14),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2) ) >= '" + txt01 + "'";
            }
            if (!string.IsNullOrEmpty(Request.QueryString["Session"]))
            {
                sSQL = sSQL + " and credittype='" + Request.QueryString["Session"] + "'";
            }

            string vSorted = GetParam("Sorted_By");
            if (((vSorted == "0")))
            {
                sSQL = sSQL + " Order By " + func_Form_Sorted(GetParam("Form_Sorted")) + " desc ";
                vSorted = "1";
            }
            else if ((string.IsNullOrEmpty(vSorted)))
            {
                sSQL = sSQL + " order by convert(char(14),substring(LastUpdateDate,7,4) + substring(LastUpdateDate,4,2) + substring(LastUpdateDate,1,2) + substring(LastUpdateDate,12,2) + substring(LastUpdateDate,15,2) + substring(LastUpdateDate,18,2)) desc";
                vSorted = "1";
            }
            else
            {
                sSQL = sSQL + " Order By " + func_Form_Sorted(GetParam("Form_Sorted")) + " asc ";
                vSorted = "0";
            }
        
        %>
        <div style="width: 100%;">
            <table id="CheckLogReport" width="100%" class="ui-widget-content ui-corner-all" cellspacing="0"
                cellpadding="0" border="0" align="center">
                <thead>
                    <tr>
                        <td align="left" class="ui-border-wo-left">
                            <b>Agency ID</b>
                        </td>
                        <td align="right" class="ui-border-wo-left">
                            <b>Updated Limit</b>
                        </td>
                        <td align="right" class="ui-border-wo-left">
                            <b>Deposit Amount</b>
                        </td>
                        <td align="right" class="ui-border-wo-left">
                            <b>Credit Amount</b>
                        </td>
                        <td align="left" class="ui-border-wo-left">
                            <a href="CheckLogReport.aspx?<%--<%=func_Sorted_By(4,vSorted)%>--%>"><b>Last Update Date</b></a>
                        </td>
                        <td align="left" class="ui-border-wo-left">
                            <b>Comments</b>
                        </td>
                        <td align="left" class="ui-border-wo-left">
                            <b>Status</b>
                        </td>
                        <td align="left" class="ui-border-wo-left">
                            <b>Type</b>
                        </td>
                        <td align="left" class="ui-border-wo-left">
                            <b>Executive name</b>
                        </td>
                    </tr>
                </thead>
                <% 
                    string Airline = null;
                    sdr = DB.CommonDatabase.DataReader(sSQL);
                    if (sdr.HasRows)
                    {
                        while (sdr.Read())
                        {
                            string Msg = "";
                            if (sdr["ApproveFlag"].ToString() == "A")
                            {
                                Msg = "Approved";
                            }
                            else
                            {
                                Msg = "Not Approved";
                            }                          
                %>
                <tr>
                    <td class="ui-border-wo-left" align="left">
                        <%=sdr["userid"].ToString()%>&nbsp;
                    </td>
                    <td class="ui-border-wo-left" align="right">
                        &nbsp;<%=sdr["LimitUpdate"].ToString()%>
                    </td>
                    <td class="ui-border-wo-left" align="right">
                        &nbsp;<%=sdr["depositamount"].ToString()%>
                    </td>
                    <td class="ui-border-wo-left" align="right">
                        &nbsp;<%=sdr["creditamount"].ToString()%>
                    </td>
                    <td class="ui-border-wo-left" align="left">
                        <%=sdr["LastUpdateDate"].ToString()%>&nbsp;
                    </td>
                    <td class="ui-border-wo-left" align="left">
                        <%=sdr["Comments"].ToString()%>&nbsp;
                    </td>
                    <td class="ui-border-wo-left" align="left">
                        <%=Msg%>&nbsp;
                    </td>
                    <td class="ui-border-wo-left" align="left">
                        <%=sdr["credittype"].ToString()%>&nbsp;
                    </td>
                    <td class="ui-border-wo-left" align="left" colspan="2">
                        <%=sdr["Executivename"].ToString()%>&nbsp;
                    </td>
                </tr>
                <%}
                        sdr.Close();
                        sdr = null;
                    }
                    else
                    {
                %>
            </table>
        </div>
        <div class="col-md-12">
            <h5 class="text-center" style="color: Red; text-align: center">
                No Record Found !!!!!</h5>
        </div>
        <%}%>
        <table>
            <div class="col-md-12" style="text-align: center;">
                </br><input type="button" id="Button2" class="btn" runat="server" name="Back" style="cursor: pointer"
                    value="<<Back" />
                <div style="clear: both;">
                </div>
            </div>
        </table>
    </div>
    </form>
</body>
</html>
