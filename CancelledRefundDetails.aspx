<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CancelledRefundDetails.aspx.cs" Inherits="CancelledRefundDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="frmProduct" class="backgroundcolor" runat="server">
    <div class="infl_comm_wrap">
        <div>
        </div>
        <div id="serch_div1" class="col-md-12 serch_div">
            <div id="Div2" class="infl_search_btn serch_div1" style="float: right;">
                <a onclick="Show();">
                    <img src=""  /></a></div>
            <div style="clear: both;">
            </div>
        </div>
        <table class="ui-widget-content ui-corner-all" id="table3" cellspacing="0" cellpadding="0"
            width="100%">
            <tr>
                <td>
                    <table class="" border="0" cellpadding="0">
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="container-fluid" id="showdiv">
                        <div class="row" style="margin-top: 30px; font-size: 13px;">
                            <div class="col-md-3 col-sm-6">
                                From Date:
                                <asp:TextBox CssClass="form-control cal" ID="CRD_Depart" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                To Date:
                                <asp:TextBox CssClass="form-control cal" ID="CRD_Back" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                Reservation Id:
                                <asp:TextBox CssClass="form-control" ID="Rid" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                Agent Code:
                                <asp:TextBox CssClass="form-control" ID="Dcard" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                            </div>
                            <div class="col-md-3 ">
                                <div class="col-md-4">
                                    <br />
                                    <asp:Button ID="Button1" Class="btn" runat="server" Text="Search" OnClientClick="return valSubmit();" />
                                </div>
                                <div class="col-md-8">
                                    <br />
                                    <asp:Button ID="Button2" Class="btn" runat="server" Text="Export to excel" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="top_head_txt">
                        Refund List</div>
                </td>
            </tr>
            <table id="cancelRefund" width="100%" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <td class="ui-border-all" align="right">
                            <b>S.No.</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Reference ID</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Airline</b>
                        </td>
                        <%if (Session["usertype"].ToString() == "O" || Session["usertype"] == "OO" || Session["usertype"] == "OOU" || Session["usertype"] == "D")
                          {%>
                        <td class="ui-border-all" align="left">
                            <b>Agency Name</b>
                        </td>
                        <%
                            }%>
                        <td class="ui-border-all" align="left">
                            <b>Airline PNR</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Cancelled Date</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Refund Date</b>
                        </td>
                        <td class="ui-border-all" align="right">
                            <b>Amount</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Status</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Remarks</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Executive Name</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Airlines</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>GDS PNR</b>
                        </td>
                        <td class="ui-border-all" align="right">
                            <b>Accounts Reference number</b>
                        </td>
                        <td class="ui-border-all" align="right">
                            <b>No of passengers</b>
                        </td>
                        <td class="ui-border-all" align="right">
                            <b>Cancellation charges</b>
                        </td>
                        <td class="ui-border-all" align="right">
                            <b>Refunded Amount</b>
                        </td>
                        <td class="ui-border-all" align="left">
                            <b>Voucher</b>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <%                                      
                        string curr = "";
                        int count = 1;
                        //int Comm = 0;
                        //int CBalance = 0;
                        int Sales = 0;
                        int CancelledSales = 0;
                        int RejectedSales = 0;
                        int BalanceSales = 0;
                        string RefAgency = Session["RefAgency"].ToString();
                        string AgentID = Session["BookUserID"].ToString();
                        string rid = "";
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

                        string don = "";
                        if (!string.IsNullOrEmpty(Request.QueryString["SelectDates"]))
                        {
                            string[] tdata = Regex.Split(Request.QueryString["SelectDates"], ",");
                            if (!string.IsNullOrEmpty(tdata[2]))
                            {
                                string[] Ddd = Regex.Split(Request.QueryString["SelectDates"], ",");
                                rid = Ddd[2];
                            }
                            else if (!string.IsNullOrEmpty(tdata[3]))
                            {
                                string[] Ddd = Regex.Split(Request.QueryString["SelectDates"], ",");
                                don = Ddd[3];
                            }
                        }

                        string sql = "";
                        if (Session["UserType"] == "OO" || Session["UserType"] == "OOU")
                        {
                            if (string.IsNullOrEmpty(rid) & string.IsNullOrEmpty(don))
                            {
                                if (!string.IsNullOrEmpty(txt1[0]) & !string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a, Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.MerchantURL = '" + Session["sURL"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) between '" + txt00 + "' and '" + txt01 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[0]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.MerchantURL = '" + Session["sURL"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) >= '" + txt00 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.MerchantURL = '" + Session["sURL"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) <= '" + txt01 + "'";
                                }
                                else
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.MerchantURL = '" + Session["sURL"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded')";
                                }
                            }
                            else if (string.IsNullOrEmpty(don))
                            {
                                sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.MerchantURL = '" + Session["sURL"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.ReservationId= '" + rid + "'";
                            }
                            else
                            {
                                sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.MerchantURL = '" + Session["sURL"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.DoneCardUser= '" + don + "'";
                            }
                        }
                        else if (Session["UserType"] == "O" || Session["UserType"] == "OU")
                        {
                            if (string.IsNullOrEmpty(rid) & string.IsNullOrEmpty(don))
                            {
                                if (!string.IsNullOrEmpty(txt1[0]) & !string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) between '" + txt00 + "' and '" + txt01 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[0]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) >= '" + txt00 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) <= '" + txt01 + "'";
                                }
                                else
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded')";
                                }
                            }
                            else if (string.IsNullOrEmpty(don))
                            {
                                sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.ReservationId= '" + rid + "'";
                            }
                            else
                            {
                                sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.DoneCardUser= '" + don + "'";
                            }
                        }
                        else if ((Session["UserType"] == "D" || Session["UserType"] == "DU"))
                        {
                            if (string.IsNullOrEmpty(rid) & string.IsNullOrEmpty(don))
                            {
                                if (!string.IsNullOrEmpty(txt1[0]) & !string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (b.CreationID='" + AgentID + "' Or b.AgentCode='" + AgentID + "') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) between '" + txt00 + "' and '" + txt01 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[0]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (b.CreationID='" + AgentID + "' Or b.AgentCode='" + AgentID + "') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) >= '" + txt00 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (b.CreationID='" + AgentID + "' Or b.AgentCode='" + AgentID + "') and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) <= '" + txt01 + "'";
                                }
                                else
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (b.CreationID='" + AgentID + "' Or b.AgentCode='" + AgentID + "')";
                                }
                            }
                            else if (string.IsNullOrEmpty(don))
                            {
                                sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (b.CreationID='" + AgentID + "' Or b.AgentCode='" + AgentID + "') and b.ReservationId= '" + rid + "'";
                            }
                            else
                            {
                                sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and b.Merchantid = '" + Session["UserMerchantID"] + "' and a.merchantid=b.merchantid and c.merchantid=b.merchantid and b.MerchantURL = '" + Session["sURL"] + "' and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and (b.CreationID='" + AgentID + "' Or b.AgentCode='" + AgentID + "') and b.DoneCardUser= '" + don + "'";
                            }
                        }
                        else
                        {
                            if (string.IsNullOrEmpty(rid) && string.IsNullOrEmpty(don))
                            {
                                if (!string.IsNullOrEmpty(txt1[0]) && !string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.AgentCode='" + AgentID + "' and b.CreationID='" + RefAgency + "' and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) between '" + txt00 + "' and '" + txt01 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[0]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.AgentCode='" + AgentID + "' and b.CreationID='" + RefAgency + "' and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) >= '" + txt00 + "'";
                                }
                                else if (!string.IsNullOrEmpty(txt1[1]))
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.AgentCode='" + AgentID + "' and b.CreationID='" + RefAgency + "' and (SUBSTRING(c.RefundDate,7,4)+SUBSTRING(c.RefundDate,4,2)+SUBSTRING(c.RefundDate,1,2)) <= '" + txt01 + "'";
                                }
                                else
                                {
                                    sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.AgentCode='" + AgentID + "' and b.CreationID='" + RefAgency + "'";
                                }
                            }
                            else if (string.IsNullOrEmpty(don))
                            {
                                sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.AgentCode='" + AgentID + "' and b.CreationID='" + RefAgency + "' and b.ReservationId= '" + rid + "'";
                            }
                            else
                            {
                                sql = "select c.RefundDate,b.CancelDate,b.CurrencyCode, b.ReservationID,c.ID,c.Paxname,c.AgencyCode,b.Description,b.ReservationDate,b.ReservationTime,b.TxnMedium,b.TotalFare,b.CreationID,b.Aircode,b.Depdate,b.AgentCode,b.Status,b.Reservation_Status,b.TicketNo,b.TicketNo_Inbound,b.Flight_No,b.GDS_Code,b.Adultfare,b.Childfare,b.Infantfare,b.Adults,b.Children,b.Infants,b.AgencyName,b.ValidationCode,b.DistAgencyName,c.R_Remarks,c.R_ExecutiveName,c.R_Charges,c.Airlines,c.AirlinesPnr,c.CancellationCharges,c.CancelledPax,c.Account_Ref_Num,a.txnamt,a.discount from bookingtxndata a,Reservation b ,CancelledRequests c where a.referenceid=b.ReservationID and b.ReservationID = c.ReservationId and (b.Status='Cancelled' or b.Status_Inbound='Cancelled' or b.Status='Partial Cancelled' or b.Status_Inbound='Partial Cancelled') and c.status=1 and (b.Reservation_Status='Refunded' or b.Reservation_Status='Partial Refunded') and b.AgentCode='" + AgentID + "' and b.CreationID='" + RefAgency + "' and b.DoneCardUser= '" + don + "'";
                            }
                        }
                        sql = sql + " order by c.RefundDate";
                        System.Data.SqlClient.SqlDataReader sdr = default(System.Data.SqlClient.SqlDataReader);
                        sdr = DB.CommonDatabase.DataReader(sql);
                        if (sdr.Read())
                        {
                            while (sdr.Read())
                            {
                                curr = DB.CommonDatabase.GetValue(sdr, "CurrencyCode");
                                string Amt = DB.CommonDatabase.GetValue(sdr, "TotalFare");
                                string CreationID = "";
                                if (DB.CommonDatabase.GetValue(sdr, "ValidationCode") == "D")
                                {
                                    CreationID = DB.CommonDatabase.GetValue(sdr, "DistAgencyName");
                                }
                                string tno = null;
                                string checkticketed = "";
                                if (DB.CommonDatabase.GetValue(sdr, "Flight_No").Contains("DN") || DB.CommonDatabase.GetValue(sdr, "Flight_No").Contains("6E") || DB.CommonDatabase.GetValue(sdr, "Flight_No").Contains("SG") || DB.CommonDatabase.GetValue(sdr, "Flight_No").Contains("G8"))
                                {
                                    checkticketed = "";
                                }
                                else
                                {
                                    if (!string.IsNullOrEmpty(DB.CommonDatabase.GetValue(sdr, "TicketNo")))
                                    {
                                        tno = DB.CommonDatabase.GetValue(sdr, "TicketNo");
                                        bool number = Convert.ToBoolean(tno);
                                        if (number == true)
                                        {
                                            checkticketed = "T";
                                        }
                                    }
                                }
                                int net_farre = Convert.ToInt32(DB.CommonDatabase.GetValue(sdr, "txnamt")) - Convert.ToInt32(DB.CommonDatabase.GetValue(sdr, "discount"));
                                int refunded_amt = 0;
                                if (!string.IsNullOrEmpty(DB.CommonDatabase.GetValue(sdr, "R_Charges")))
                                {
                                    refunded_amt = Convert.ToInt32(DB.CommonDatabase.GetValue(sdr, "R_Charges"));
                                }
                    %>
                    <tr>
                        <td class="ui-border-wo-topleft" align="right">
                            <%=count%>
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <a class="txt_blue" href="PNRCheckStatus.aspx?RefNo=<%=DB.CommonDatabase.GetValue(sdr, "ReservationID")%>">
                                <%=DB.CommonDatabase.GetValue(sdr, "ReservationID")%>&nbsp;</a>
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <%= DB.CommonDatabase.GetValue(sdr, "AirCode").Replace("#", " ")%><%if (DB.CommonDatabase.GetValue(sdr, "AirCode_Inbound") != "")
                                                                                                {%>#<%=DB.CommonDatabase.GetValue(sdr, "AirCode_Inbound")%>&nbsp;<%}%>
                        </td>
                        <%if (Session["UserType"] == "O" || Session["UserType"] == "OO" || Session["UserType"] == "OOU" || Session["UserType"] == "D")
                          {%>
                        <%if (DB.CommonDatabase.GetValue(sdr, "TxnMedium").Contains("Card"))
                          {%>
                        <td class="ui-border-wo-topleft" align="left">
                            <a class="txt_blue" href="javascript:var w= window.open('PopUpAgency.aspx?AgencyID=<%=(DB.CommonDatabase.GetValue(sdr, "AgentCode"))%>', '', 'width=580, height=auto, scrollbars=yes, toolbar=no, menubar=no');">
                                <%=DB.CommonDatabase.GetValue(sdr, "AgencyName")%>
                                <%if (CreationID != "")
                                  {%>(
                                <%=CreationID%>
                                )&nbsp;<%}%></a>
                        </td>
                        <%}
                          else
                          {%>
                        <td class="ui-border-wo-topleft" align="left">
                            <font face="Verdana, Arial, Helvetica, sans-serif">
                                <%=DB.CommonDatabase.GetValue(sdr, "TxnMedium")%>&nbsp;<%if (CreationID != "")
                                                                                         {%>(
                                <%=CreationID%>
                                )&nbsp;<%}%></font>
                        </td>
                        <%}
                          }%>
                        <td class="ui-border-wo-topleft" align="left">
                            <%= DB.CommonDatabase.GetValue(sdr, "GDS_Code")%>&nbsp;
                            <%if (checkticketed != "")
                              {%>
                            <%=checkticketed%>&nbsp;<%}%>
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <%=DB.CommonDatabase.GetValue(sdr, "CancelDate")%>&nbsp;
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <%=DB.CommonDatabase.GetValue(sdr, "RefundDate")%>&nbsp;
                        </td>
                        <td class="ui-border-wo-topleft" style="" align="right">
                            &nbsp;<%=curr%>&nbsp;<%=amt%>
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <%=DB.CommonDatabase.GetValue(sdr, "Reservation_Status")%>&nbsp;
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <%=DB.CommonDatabase.GetValue(sdr, "R_Remarks")%>&nbsp;
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <%=DB.CommonDatabase.GetValue(sdr, "R_ExecutiveName")%>&nbsp;
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <%= DB.CommonDatabase.GetValue(sdr, "Airlines").Replace("#", " ")%>&nbsp;
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <%=DB.CommonDatabase.GetValue(sdr, "AirlinesPnr")%>&nbsp;
                        </td>
                        <td class="ui-border-wo-topleft" align="right">
                            &nbsp;<%=DB.CommonDatabase.GetValue(sdr, "Account_Ref_Num")%>
                        </td>
                        <td class="ui-border-wo-topleft" align="right" height="auto">
                            &nbsp;<%=DB.CommonDatabase.GetValue(sdr, "CancelledPax")%>
                        </td>
                        <td class="ui-border-wo-topleft" align="right">
                            &nbsp;<%=DB.CommonDatabase.GetValue(sdr, "CancellationCharges")%>
                        </td>
                        <td class="ui-border-wo-topleft" align="right">
                            &nbsp;<%=refunded_amt%>
                        </td>
                        <td class="ui-border-wo-topleft" align="left">
                            <a class="txt_blue" href="Refund_invoce.aspx?refID=<%=DB.CommonDatabase.GetValue(sdr, "ReservationID")%>">
                                Refund</a>&nbsp;
                        </td>
                    </tr>
                    <% 
                            count = count + 1;
                            }
                            sdr.Close();
                            sdr.Dispose();
                        }

                        else
                        {
                                    
                    %>
                </tbody>
            </table>
            <%if (Session["UserType"] == "O" || Session["UserType"] == "OO" || Session["UserType"] == "OOU")
              {%>
            <div style="width: 100%; height: 30px;">
                <div class="col-md-12">
                    <h5 class="text-center" style="color: Red;">
                        No Record Found !!!!!</h5>
                </div>
            </div>
            <%}
              else
              {%>
            <div style="width: 100%; height: 30px;">
                <div class="col-md-12">
                    <h5 class="text-center" style="color: Red;">
                        No Record Found !!!!!</h5>
                </div>
            </div>
            <%}
}%>
        </table>
        <table>
            <tbody>
                <tr>
                    <td style="margin-left: 10px;">
                        <table cellspacing="5" style="margin-top: 15px; padding: 5px" width="300">
                            <tr>
                                <td style="padding-left: 10px; font-size: 14px" colspan="2">
                                    <b>Summary</b>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px;">
                                    <b>Total Sales:</b>
                                </td>
                                <td style="padding-right: 10px;" align="right">
                                    <b>
                                        <%=curr%>&nbsp;<%=Sales%>.00</b>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px;">
                                    <b>Cancelled Sales:</b>
                                </td>
                                <td style="padding-right: 10px;" align="right">
                                    <b>
                                        <%=curr%>&nbsp;<%=CancelledSales%>.00</b>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px;">
                                    <b>Rejected Sales:</b>
                                </td>
                                <td style="padding-right: 10px;" align="right">
                                    <b>
                                        <%=curr%>&nbsp;<%=RejectedSales%>.00</b>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px;">
                                    <b>Balance Sales:</b>
                                </td>
                                <td style="padding-right: 10px;" align="right">
                                    <b>
                                        <%=curr%>&nbsp;<%=BalanceSales%>.00</b>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
        </div>
    </div>
    </form>
</asp:Content>
