<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="citysightseeinglist.aspx.cs" Inherits="citysightseeinglist" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
    <div class="gap">
    </div>
    <div class="container" style="border: 2px solid #ccc;">
        <div class="gap-small">
        </div>
        <div class="row"><div class="col-md-12" style="height: 40px; font-size: xx-large; font-weight: bold;"
            align="center">
            City SightSeeing Booking List
        </div>
        </div>
        <hr />                
        <div class="row" style="margin-top: 7px">
            <div class="col-md-3">
                <input type="text" class="form-control" id="bid" placeholder="Booking Id" runat="server" /></div>
            <div class="col-md-3">
                <input type="text" id="datepicker" placeholder="dd-MM-yyyy" runat="server" class="datepicker form-control" />
            </div>
            <div class="col-md-3">
                <input type="text" class="form-control" id="px" placeholder="Pax Name" runat="server" /></div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddl" runat="server" class="form-control">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Confirmed</asp:ListItem>
                    <asp:ListItem>Cancelled</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="gap">
        </div>
        <div class="row">
            <div class="col-md-6" align="right">
                <asp:Button ID="srch" runat="server" Text="search" class="btn-primary" OnClick="btn_Click"
                    Width="116px" /></div>
            <div class="col-md-6" align="left">
               <asp:Button ID="ete" runat="server" Text="Export To Excel" class="btn-primary"/></div>
        </div>
        <br />
        <div class="row" style="border-bottom: 2px solid #ccc; border-top: 2px solid #ccc;">
            <div class="col-md-2" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                Booking Id</div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                Agency Name</div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                Booking Date</div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                Country</div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                City</div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                Status</div>
            <div class="col-md-2" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                Pax Name</div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                Total Pax</div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 45px;" align="center">
                Amount</div>
            <div class="col-md-1" style="min-height: 45px;" align="center">
            </div>
        </div>
        <%
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    string agencynm = sdr.GetString(2).Split('!')[5];
                    string bid = sdr.GetString(1);
                    string bdate = sdr.GetString(3);
                    string country = sdr.GetString(2).Split('~')[0].Split('/')[4];
                    string city = sdr.GetString(2).Split('~')[1];
                    string status = sdr.GetString(4);
                    var total = 0;
                    var grandtot = 0;
                    var tax = 100;
                    string dayinfo = sdr.GetString(2).Split('!')[1].Split('$')[0].TrimEnd('~');
                    for (int i = 0; i < dayinfo.Split('~').Length; i = i + 2)
                    {
                        total += Convert.ToInt32(dayinfo.Split('~')[i]);
                    }
                    grandtot = (Convert.ToInt32(total) + Convert.ToInt32(tax));                                        
                    string totpax = (Convert.ToInt32(sdr.GetString(2).Split('~')[2]) + Convert.ToInt32(sdr.GetString(2).Split('~')[3]) + Convert.ToInt32(sdr.GetString(2).Split('~')[4]) + Convert.ToInt32(sdr.GetString(2).Split('~')[5].Split('!')[0])).ToString();
                    
                    int senlenghth = Convert.ToInt16(sdr.GetString(2).Split('~')[5].Split('!')[0]);
                    string[] arr = sdr.GetString(2).Split('/');
                    string name = "";
                    for (int i = 0; i < arr.Length - 2; i++)
                    {
                        name += arr[i].Split(',')[senlenghth] + " ";
                    }
    
        %>
        <div class="row" style="border-bottom: 2px solid #ccc;">
            <div class="col-md-2" style="border-right: 2px solid #ccc; min-height: 110px;">
                <%=bid%></div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 110px;" align="center">
                <%=agencynm%></div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 110px;" align="center">
                <%=bdate%></div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 110px;" align="center">
                <%=country%></div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 110px;" align="center">
                <%=city%></div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 110px;" align="center">
                <%=status%></div>
            <div class="col-md-2" style="border-right: 2px solid #ccc; min-height: 110px;" align="center">
                <%=name%></div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 110px;" align="center">
                <%=totpax%></div>
            <div class="col-md-1" style="border-right: 2px solid #ccc; min-height: 110px;" align="center">
                <%=grandtot%></div>
            <div class="col-md-1" style="min-height: 110px;">
                <div class="col-md-12" style="margin-top: 10px;">
                    <input id="Submit1" type="button" value="Print" class="btn-primary"
                        title="Print Voucher" onclick="print('<%=bid %>');" style="width: 60px;" />
                </div>
                <div class="col-md-12" style="margin-top: 20px;">
                    <input id="Submit2" type="button" value="Cancel" class="btn-primary" title="Cancel Ticket" />
                </div>
            </div>
        </div>
        <%
            }
    } %>
    </div>
    <div class="gap">
    </div>
    <script type="text/javascript">
        $(function () {
            debugger;
            $(".datepicker").datepicker({
                format: 'dd-mm-yyyy',
                autoclose: true
            });
        });        
    </script>
    <script type="text/javascript">
        function print(bookingref) {
            debugger;
            var url = "citysightvoucherN.aspx?RID=" + bookingref + "";
            var w = window.open(url, '', 'width=700,height=350,scrollbars=yes,resizable=1,toolbar=no,menubar=no');
        }
            
    </script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/slimmenu.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="js/bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="js/nicescroll.js"></script>
    <script type="text/javascript" src="js/dropit.js"></script>
    <script type="text/javascript" src="js/ionrangeslider.js"></script>
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
    <script type="text/javascript" src="common-show.js"></script>
    <script type="text/javascript" src="js/switcher.js"></script>
    </form>
</asp:Content>
