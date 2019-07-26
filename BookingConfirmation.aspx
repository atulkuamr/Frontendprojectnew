<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookingConfirmation.aspx.cs" Inherits="BookingConfirmation" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <HeadTitle:HTitle ID="thead" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-style:italic; color:Gray;">
    <center><span><h2>Hotel Confirmation</h2></span></center>
    <h3 style="margin-bottom: 3px">Booking Reference :</h3>
    <asp:Label ID="lblBk" runat="server" Font-Size="Large"></asp:Label>
    <hr />
    <span>Booking-ID :</span>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="BookingID" runat="server" Font-Size="Large" Text="Booking-ID"></asp:Label><br /><br />
    <span>HotelName :</span>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="HotelName" runat="server" Font-Size="Large" Text="HotelName"></asp:Label><br /><br />
    <span>Total Price :</span>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="TotalPrice" runat="server" Font-Size="Large" Text="Total Price"></asp:Label><br /><br />
    <span>Check-in-Date :</span>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="CheckinDate" runat="server" Font-Size="Large" Text="Check-in-Date"></asp:Label><br /><br />
    <span>Check-out-Date :</span>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="CheckoutDate" runat="server" Font-Size="Large" Text="Check-out-Date"></asp:Label><br /><br />
    <span>Pax Details :</span>
    <br />
    <asp:Label ID="PaxDetails" runat="server" Font-Size="Large" Text="Pax Details"></asp:Label><br /><br />
    <asp:Label ID="Label6" runat="server" Font-Size="Large" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
