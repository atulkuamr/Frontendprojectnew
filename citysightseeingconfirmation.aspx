<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="citysightseeingconfirmation.aspx.cs" Inherits="citysightseeingconfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="Form1" runat="server">
    <div style="height: 25px;">
    </div>
    <div class="row" align="center" style="font-size: x-large; font-weight: bold">
        SightSeeing Confirmation</div>
    <div style="height: 15px;">
    </div>
    <div class="container" style="border: 2px solid #ccc; max-width: 850px; min-height: 30px;
        font-size: large;">
        <div class="row">
            <div class="col-md-6" style="border-right: 2px solid #ccc;">
                <div class="col-md-12" style="height:15px;"></div>
                <div class="col-md-6">
                    <b>Booking ID :</b></div>
                <div class="col-md-6">
                    <%=bookingid%></div>
                <div class="col-md-6">
                    <b>Booking Date :</b></div>
                <div class="col-md-6">
                    <%=bookingdate%></div>
                <div class="col-md-6">
                    <b>Status :</b></div>
                <div class="col-md-6">
                    <%=status %></div>
                <div class="col-md-12" style="height:15px;"></div>  
            </div>
            <div class="col-md-6" align="right">
                <b>Travstarz Holiday & Destinations Pvt.Ltd<br />61-C Kalu Sarai, hauz Khas,<br />Delhi-110016<br />47050000</b></div>
        </div>
        <div class="row" align="center" style="background-color: #808080; color: #000000;
            min-height: 35px; margin-bottom: 5px; border-top: 2px solid #ccc;
            border-bottom: 2px solid #ccc;">
            <b>SightSeeing Details:</b></div>
        <div class="row">
            <div class="col-md-3">
                <b>Country :</b></div>
            <div class="col-md-3">
                <%=arr[0].Split('/')[4] %></div>
            <div class="col-md-3">
                <b>City :</b></div>
            <div class="col-md-3">
                <%=arr[1]%></div>
        </div>
        <div class="row" style="margin-top: 10px; min-height: 30px;">
            <div class="col-md-3">
                <b>SightSeeing Name:</b></div>
            <div class="col-md-3">
                <%=arr[1]%></div>
        </div>
        <%  for (int i = 0; i < dayinfo.Split('~').Length; i = i + 2)
            {
        %>
        <div class="row" style="margin-top: 3px">
            <div class="col-md-6">
                <%=dayinfo.Split('~')[i+1] %>:</div>
            <div class="col-md-6">INR
                <%=dayinfo.Split('~')[i] %></div>
        </div>
        <% }%>
        <div class="row" align="center" style="background-color: #808080; color: #000000;
            border-top: 2px solid #ccc; min-height: 35px; margin-top: 5px; margin-bottom: 5px">
            <b>Passenger Details:</b></div>
        <%for (int j = 0; j < passinfo.Split('/')[0].Split(',').Length - 1; j++)
          {
        %>
        <div class="row" style="margin-top: 3px; min-height: ">
            <div class="col-md-4">
                <%=passinfo.Split('/')[0].Split(',')[j]%></div>
            <div class="col-md-4">
                <%=passinfo.Split('/')[1].Split(',')[j]%></div>
            <div class="col-md-4">
                <%=passinfo.Split('/')[2].Split(',')[j]%></div>
        </div>
        <%} %>
        <div class="row" align="center" style="background-color: #808080; color: #000000;
            border-top: 2px solid #ccc; min-height: 35px">
            <b>Fare Details:</b></div>
        <% var total = 0;
           var tax = 100;
           var grandtot = 0;
           for (int i = 0; i < dayinfo.Split('~').Length; i = i + 2)
           {

               total += Convert.ToInt16(dayinfo.Split('~')[i]);
           }
           grandtot = (Convert.ToInt16(total) + Convert.ToInt16(tax));
        %>
        <div class="row" style="border-top: 2px solid #ccc;">
        <div class="col-md-6">
        </div>
            <div class="col-md-6" align="right">
                <b>Total Amount:</b></div>
            <%--<div class="col-md-4" style="border-right: 2px solid #ccc;">
                <b>Service Tax/Other Tax</b></div>
            <div class="col-md-4" style="border-right: 2px solid #ccc;">
                <b>Grand Total</b></div>--%>
        </div>
        <div class="row" style="border-top: 2px solid #ccc;">
        <div class="col-md-6">
        </div>
            <div class="col-md-6" align="right">
                INR
                <%=total %></div>
            <%--<div class="col-md-4" style="border-right: 2px solid #ccc;">
                INR
                <%=tax %></div>--%>
            <%--<div class="col-md-4" style="border-right: 2px solid #ccc;">
                INR
                <%=grandtot %></div>--%>
        </div>
    </div>
    <div class="gap">
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
</asp:Content>
