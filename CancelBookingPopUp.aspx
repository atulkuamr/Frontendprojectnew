<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CancelBookingPopUp.aspx.cs"
    Inherits="CancelBookingPopUp" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<HeadTitle:HTitle ID="thead" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <table class="" width="500px" align="center" style="border: 4px solid #0B75A3; background-color: #F5F5F5;">
        <tr>
            <td runat="server" id="Btbody" align="center" width="100%" valign="top" style="height: 260px">
                <table id="Table1" cellspacing="2" cellpadding="2" width="100%" align="center" border="0"
                    style="font-size: 12px;">
                    <tbody>
                        <tr>
                            <td align="center">
                                <b>Booking Cancellation</b>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <%=cancellationPolicy %>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center" style="">
                                <table id="Table2" cellspacing="2" cellpadding="2" border="0" width="73%" align="center">
                                    <tr>
                                        <td class="style1" align="left">
                                            <b>Hotel Name:</b>
                                        </td>
                                        <td class="" align="left">
                                            <%=Hname%>
                                        </td>
                                        <td class="style1" align="left">
                                            <b>Confirmation&nbsp;ID:</b>
                                        </td>
                                        <td class="style2">
                                            <%=ConfirmationID%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1" align="left">
                                            <b>Booking&nbsp;ID:</b>
                                        </td>
                                        <td class="">
                                            <%=BookingID%>
                                        </td>
                                        <td class="style1" align="left" valign="top">
                                            <b>Contact&nbsp;No:</b>
                                        </td>
                                        <td class="style2" valign="top">
                                            <%=Contactno%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1" align="left" valign="top">
                                            <b>Email&nbsp;:</b>
                                        </td>
                                        <td class="" valign="top">
                                            <%=Email%>
                                        </td>
                                        <td class="style1" align="left">
                                            <b>Check-In&nbsp;Date:</b>
                                        </td>
                                        <td class="style2">
                                            <%=CheckIndate%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1" align="left">
                                            <b>Check-Out&nbsp;Date:</b>
                                        </td>
                                        <td class="">
                                            <%=CheckOutdate %>
                                        </td>
                                        <td class="style1" align="left">
                                            <b>Reservation&nbsp;Date:</b>
                                        </td>
                                        <td class="" colspan="3">
                                            <%=Bookingdate%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1" align="left">
                                            <b>Remarks:</b>
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="Remarks" runat="server" MaxLength="2000" TextMode="MultiLine" Width="350px"
                                                Height="40px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="" colspan="4" align="center" height="30px">
                                            <asp:Button ID="Submit" runat="server" Text="Cancel Booking" Width="150px" Style="cursor: pointer;
                                                border-radius: 3px; height: 30px" OnClick="Submit_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="ErrorMsg" runat="server" Style="color: Red;"></asp:Label>
                            </td>
                        </tr>
                        <%--<div id="divWaitPopUp" runat="server" class="modal fade in" aria-hidden="false" style="width: 600px;
                            left: 44%; display: none">
                            <div class="modal-header">
                                <h3 id="H1" style="text-align: center; color: Black;">
                                    Your Cancellation is in Process.....</h3>
                            </div>
                        </div>--%>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
