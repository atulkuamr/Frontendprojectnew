<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ClearReservationtbl.aspx.cs" Inherits="ClearReservationtbl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            min-height: 20px;
            text-align: center;
            font-size: 15px;
        }
        
        .rows
        {
            background-color: #fff;
            font-family: Calibri;
            font-size: 14px;
            color: #000;
            min-height: 20px;
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
            width: 188px;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
    <div class="container">
        <div class=" row" style="margin-top: 50px; margin-bottom: 20px;">
            <div class=" col-md-12">
                <h4 style="text-align: center;">
                    Flight Testing Details</h4>
            </div>
            <div class="row">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="false" CssClass="mydatagrid"
                    PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                    DataKeyNames="reservationid" OnRowDeleting="GridView1_RowDeleting" AllowSorting="True"
                    AutoGenerateColumns="False">
                    <Columns>
                    <%--a.reservationid, a.AgencyName, b.firstName, b.LastName, a.Airlinepnr, a.GdsPNR, a.TicketNo, a.BookStatus, a.ReservationDate, a.totalAmount--%>
                        <asp:BoundField DataField="reservationid" HeaderText="Reservation ID" SortExpression="ContactPerson"></asp:BoundField>
                        <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" SortExpression="AgencyName" ItemStyle-Width="150px"></asp:BoundField>
                        <asp:BoundField DataField="AgentID" HeaderText="AgentID" SortExpression="AgencyName" ItemStyle-Width="150px"></asp:BoundField>
                        <%--<asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="AgencyName"></asp:BoundField>--%>
                        <asp:BoundField DataField="Airlinepnr" HeaderText="Air PNR" SortExpression="AgencyName"></asp:BoundField>
                        <asp:BoundField DataField="GdsPNR" HeaderText="GDS PNR" SortExpression="AgencyName"></asp:BoundField>
                        <asp:BoundField DataField="TicketNo" HeaderText="TicketNo" SortExpression="AgencyName"></asp:BoundField>
                        <asp:BoundField DataField="BookStatus" HeaderText="Status" SortExpression="AgencyName"></asp:BoundField>
                        <asp:BoundField DataField="ReservationDate" HeaderText="Bk Date" SortExpression="AgencyName"></asp:BoundField>
                        <asp:BoundField DataField="totalAmount" HeaderText="Total" SortExpression="AgencyName"></asp:BoundField>
                        
                        <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True">
                            <ControlStyle BackColor="#3C763D" BorderStyle="Double" BorderWidth="2px" Font-Bold="False"
                                ForeColor="White" Height="30px" Width="55px" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="header" BackColor="#3C763D" Font-Bold="True"></HeaderStyle>
                    <PagerStyle CssClass="pager"></PagerStyle>
                    <RowStyle CssClass="rows" BackColor="#F8F8F8" Font-Bold="False" ForeColor="Black">
                    </RowStyle>
                </asp:GridView>
            </div>
        </div>
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
