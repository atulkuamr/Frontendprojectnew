<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="AgentsList.aspx.cs" Inherits="AgentsList" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
            font-size: 20px;
        }
        
        .rows
        {
            background-color: #fff;
            font-family: Calibri;
            font-size: 15px;
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
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <div class="container" style="border: 2px solid #ccc;">
            <div class="gap-small">
            </div>
            <div class="container" style="border: 1px solid #ccc; width: 900px;">
                <center>
                    <h2>
                        Agents List</h2>
                </center>
                <div class="gap-small">
                </div>
                <center>
                    <div class="col-md-3">
                        From Date
                        <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Start Date" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True"
                            CssClass=" cal_Theme1" TargetControlID="TextBox1">
                        </asp:CalendarExtender>
                        &nbsp;</div>
                    <div class="col-md-3">
                        <asp:Label ID="Label1" runat="server" Text="To Date"></asp:Label>
                        <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="End Date" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Enabled="True"
                            CssClass=" cal_Theme1" TargetControlID="TextBox2">
                        </asp:CalendarExtender>
                    </div>
                    <div class="col-md-3">
                        Agency/ Corporate Name
                        <input id="agencyname" runat="server" type="text" placeholder="Agency Name" class="form-control"
                            style="border-radius: 4px;" />
                    </div>
                </center>
                <center>
                    <div class="col-md-3" align="center">
                        <asp:Button ID="search" runat="server" Text="Search" CssClass="btn-info" Style="border-radius: 4px;
                            height: 35px; width: 120px;" OnClick="search_Click" BackColor="#3C763D" /><br />
                        <br />
                        <asp:Button ID="excel" runat="server" Text="Excel" CssClass="btn-info" OnClick="Exel_Click"
                            Style="border-radius: 4px; height: 35px; width: 120px;" BackColor="#3C763D" />
                    </div>
                </center>
            </div>
            <center>
                <div class="gap-small">
                </div>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="false" CssClass="mydatagrid"
                    PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                    DataKeyNames="username" OnRowDeleting="GridView1_RowDeleting" AllowSorting="True"
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AgencyName" HeaderText="Agency Name" SortExpression="AgencyName"
                            ItemStyle-Width="150px">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="usertype" HeaderText="User Type" SortExpression="usertype"
                            ItemStyle-Width="100px">
                            <ItemStyle Width="100px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="username" HeaderText="Email" SortExpression="username">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" ItemStyle-Width="130px">
                            <ItemStyle Width="100px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
                        <asp:BoundField DataField="JoingDate" HeaderText="Joining Date" SortExpression="JoingDate" />
                        <asp:BoundField DataField="DCarduser" HeaderText="Code" SortExpression="DCarduser"
                            ItemStyle-Width="130px">
                            <ItemStyle Width="100px"></ItemStyle>
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" HeaderText="Delete Agent" ShowDeleteButton="True">
                            <ControlStyle BackColor="#3C763D" BorderStyle="Double" BorderWidth="2px" Font-Bold="False"
                                ForeColor="White" Height="40px" Width="90px" />
                            <ItemStyle Width="80px" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="header" BackColor="#3C763D" Font-Bold="True"></HeaderStyle>
                    <PagerStyle CssClass="pager"></PagerStyle>
                    <RowStyle CssClass="rows" BackColor="#F8F8F8" Font-Bold="False" ForeColor="Black">
                    </RowStyle>
                </asp:GridView>
                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:troprivConnectionString %>" 
            SelectCommand="SELECT [username], [AgencyName], [usertype], [ContactPerson], [Mobile], [Email], [city], [country], [JoingDate], [DCarduser] FROM [adminLogin]">
           <%-- DeleteCommand="Delete from adminLogin where DCarduser=@DCarduser">
           
       <UpdateParameters><asp:Parameter Name="DCarduser" Type="String" /> </UpdateParameters>
        </asp:SqlDataSource>--%>
            </center>
        </div>
    </div>
    <div class="gap-small">
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
