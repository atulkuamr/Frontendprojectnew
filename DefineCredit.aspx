<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DefineCredit.aspx.cs" Inherits="DefineCredit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .back_color
        {
            background: aliceblue;
        }
        tr:hover
        {
            background: #b2dbda;
        }
        a 
        {
          color: Black;
          text-decoration: none;
        }
        a:hover {
          color: #1f7ff0;
          text-decoration: none;
        }
        .ui-border-wo-topleft
        {
            border-bottom: 1px solid #ccc;
            border-right: 1px solid #ccc;
            font-size: 13px;
            line-height: 25px;
            padding-left: 3px;
            padding-right: 3px;
            font-weight: 600;
        }
        .ui-border-wo-left
        {
            border-color: #ccc;
            border-style: solid;
            border-width: 1px;
            font-size: 13px;
            line-height: 35px;
            padding-left: 3px;
            padding-right: 3px;
            color: black;
        }
        .top_head_txt
        {
            font-family: arial;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            margin-top: 10px;
            text-align: center;
        }
        .scrollit
        {
            overflow: scroll;
            width: 100%;
            min-width: 50px;
        }
    </style>
    <form id="form1" runat="server">
    <div class="container" style="margin-top: 12px;">
        <h2 align="center">
            Agents Available Balance</h2>
        <div style="border: 2px solid #ccc; margin-top: 17px; margin-left: 50px; height: auto;
            background-color: White; margin-right: 10%;">
            <div id="ddlTypelbl" style="padding: 20px;">
                <legend>Type</legend>
                <div class="input-control info-state select" data-role="input-control">
                    <asp:DropDownList type="text" ID="ddlType" runat="server" CssClass="form-control"
                        Width="100%">
                        <asp:ListItem Text="ALL" Value="ALL" />
                        <asp:ListItem Text="Agents" Value="A" />
                        <asp:ListItem Text="Admin Staff" Value="OOU" />
                        <asp:ListItem Text="Distributor" Value="D" />
                        <asp:ListItem Text="Corporates" Value="C" />
                    </asp:DropDownList>
                </div>
            </div>
            <div id="ddlType2lbl" style="padding-left: 20px; padding-right: 20px;">
                <legend>Credit Limit</legend>
                <div class="input-control info-state select" data-role="input-control">
                    <asp:DropDownList type="text" ID="ddlType2" runat="server" CssClass="form-control"
                        Width="100%">
                        <asp:ListItem Text="Select" Value="S" />
                        <asp:ListItem Text="Non-Zero" Value="Nz" />
                        <asp:ListItem Text="Zero" Value="Z" />
                    </asp:DropDownList>
                    <button class="btn-clear" style="display: none" tabindex="-1">
                    </button>
                </div>
                <br />
                <legend>Agency Name</legend>
                <div class="input-control info-state text" data-effect="fade">
                    <asp:TextBox ID="txtAgencyName" runat="server" type="text" placeholder="Enter Agency Name"
                        CssClass="form-control" Width="100%"></asp:TextBox>
                </div>
                <div class="col-md-2" style="margin-top: 20px;" align="center">
                    <asp:Button ID="BtnSearch" CssClass="btn btn-primary" runat="server" Text="Search" Width="80px" Style="cursor: pointer"
                        OnClick="BtnSearch_Click" />
                </div>
                <div class="col-md-4" style="margin-top: 20px;" align="center">
                    <asp:Button ID="export2Excel" CssClass="btn btn-primary" runat="server" Text="Export To Excel" Width="150px"
                        Style="cursor: pointer" OnClick="export2Excel_Click" />
                </div>
                <div class="gap">
                </div>
                <table style="width: 100%;" align="center" border="0" cellpadding="0">
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
                            <div class="">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <table width="100%">
                                    <tr>
                                        <td align="center" class="text_red">
                                            <asp:Label ID="lblError" CssClass="text_red" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <div class="top_head_txt">
                                            Credit List Display</div>
                                    </tr>
                                </table>
                                <tr>
                                    <td>
                                        <table id="table3" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <table id="definecreditmain" width="100%" class="scrollit">
                                                    <thead>
                                                        <tr>
                                                            <td align="center" class="ui-border-wo-left back_color">
                                                                <b>SNo.</b>
                                                            </td>
                                                            <td align="center" class="ui-border-wo-left back_color">
                                                                <b>Agent/ Franchisee </b>
                                                            </td>
                                                            <td align="center" class="ui-border-wo-left back_color">
                                                                <b>Active&nbsp;&nbsp;</b>
                                                            </td>
                                                            <td align="center" class="ui-border-wo-left back_color">
                                                                <b>Book Bal&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                                            </td>
                                                            <td align="center" class="ui-border-wo-left back_color">
                                                                <b>Acc Bal&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                                            </td>
                                                            <td align="center" class="ui-border-wo-left back_color">
                                                                <b>Credit Bal&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                                            </td>
                                                            <%--<td align="left" class="ui-border-wo-left back_color">
                                                                <b>Flight Markup</b>
                                                            </td>
                                                            <td align="center" class="ui-border-wo-left back_color">
                                                                <b>Hotel MarkUp</b>
                                                            </td>--%>
                                                            <td align="center" class="ui-border-wo-left back_color">
                                                                <b>Agents Detail</b>
                                                            </td>
                                                        </tr>
                                                    </thead>
                                                    <%  int sid = 1;
                                                        decimal DisBalance = 0;
                                                        decimal AgntBalance = 0;
                                                        string Airline = string.Empty;
                                                        if (sdr.HasRows)
                                                        {
                                                            while (sdr.Read())
                                                            {
                                                                curSymbol = sdr["Currency"].ToString();
                                                                if (sdr["ActiveFlag"].ToString() == "1")
                                                                {
                                                                    Airline = "Active";
                                                                }
                                                                else
                                                                {
                                                                    Airline = "In-Active";
                                                                }
                                                                if (sdr["Usertype"].ToString() == "D")
                                                                {
                                                                    DisBalance = DisBalance + Convert.ToDecimal(sdr["AvailableCredit"].ToString());
                                                                }
                                                                else
                                                                {
                                                                    AgntBalance = AgntBalance + Convert.ToDecimal(sdr["AvailableCredit"].ToString());
                                                                }
                                                                string strValues = sdr["Uid"].ToString();
                                                                string utype = sdr["Usertype"].ToString();
                                                                decimal CreditBal = Convert.ToDecimal(sdr["AvailableCredit"].ToString());// -Convert.ToDecimal(sdr["StatementBalance"].ToString());
                                                    %>
                                                    <tr>
                                                        <td class="ui-border-wo-left" align="center">
                                                            <a>
                                                                <%=sid %></a>
                                                        </td>
                                                        <td class="ui-border-wo-topleft" align="center">
                                                            <a class="" href="EditCredit.aspx?idnow=<%=sdr["Uid"].ToString()%>">
                                                                <%=sdr["agencyName"].ToString()%>
                                                                /
                                                                <%=sdr["Agentcode"].ToString()%>
                                                            </a>
                                                        </td>
                                                        <td class="ui-border-wo-topleft" align="center">
                                                            <%=Airline %></a>
                                                        </td>
                                                        <td class="ui-border-wo-topleft" align="center">
                                                            <%=sdr["AvailableCredit"].ToString()%>
                                                        </td>
                                                        <td class="ui-border-wo-topleft" align="center">
                                                            <%=sdr["AvailableCash"].ToString()%>
                                                        </td>
                                                        <td class="ui-border-wo-topleft" align="center">
                                                            <%=sdr["StatementBalance"].ToString()%>
                                                        </td>
                                                        <%--<td class="ui-border-wo-topleft" align="left">
                                                            <a class="txt_blue" href="MaintainMarkup.aspx?idnow=<%=sdr["Uid"].ToString()%>&Edit=Yes">
                                                                Maintain Rule</a>
                                                        </td>
                                                        <td class="ui-border-wo-topleft" align="center">
                                                            <a href="ShowHotelMarkup.aspx?idnow=<%=sdr["Uid"].ToString() + "," + sdr["Usertype"].ToString() + "," + sdr["agencyName"].ToString()%>">
                                                                Hotel Markup</a>
                                                        </td>--%>
                                                        <td class="ui-border-wo-topleft" align="center">
                                                            <a class="txt_blue" href="AgencyDetailsPopUp.aspx?AgencyID=<%=sdr["Uid"].ToString()%>">
                                                                View Detail</a>
                                                        </td>
                                                    </tr>
                                                    <%sid = sid + 1;
                                                            }
                                                        }%>
                                                    <%else
{ %>
                                                </table>
                                                <div style="width: 100%; height: 30px;">
                                                    <div class="col-md-12">
                                                        <h5 class="text-center" style="color: Red;">
                                                            No Record Found !!!!!</h5>
                                                    </div>
                                                </div>
                                                <%} %>
                                            </tbody>
                                    </td>
                                </tr>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="gap">
            </div>
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
        </div>
        <div class="gap">
        </div>
    </form>
</asp:Content>
