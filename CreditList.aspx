<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="CreditList.aspx.cs" Inherits="CreditList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600'
        rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/icomoon.css" />
    <%--<link rel="stylesheet" href="css/styles.css" />--%>
    <link rel="stylesheet" href="css/mystyles.css" />
    <script type="text/javascript" src="js/modernizr.js"></script>
    <link rel="stylesheet" href="css/switcher.css" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/bright-turquoise.css"
        title="bright-turquoise" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/turkish-rose.css"
        title="turkish-rose" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/salem.css" title="salem"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/hippie-blue.css"
        title="hippie-blue" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/mandy.css" title="mandy"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/green-smoke.css"
        title="green-smoke" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/horizon.css" title="horizon"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/cerise.css" title="cerise"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/brick-red.css"
        title="brick-red" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/de-york.css" title="de-york"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/shamrock.css"
        title="shamrock" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/studio.css" title="studio"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/leather.css" title="leather"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/denim.css" title="denim"
        media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/scarlet.css" title="scarlet"
        media="all" />
    <style type="text/css">
        .ui-border-wo-topleft
        {
            border-bottom: 1px solid #ccc;
            border-right: 1px solid #ccc;
            font-size: 13px;
            line-height: 25px;
            padding-left: 3px;
            padding-right: 3px;
        }
        .ui-border-wo-left
        {
            border-color: #ccc;
            border-style: solid;
            border-width: 1px;
            font-size: 13px;
            line-height: 25px;
            padding-left: 3px;
            padding-right: 3px;
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
    </style>
    <form id="form1" runat="server">
    <div class="global-wrap">
        <div class="container_new" style="margin-top: 20px; height: auto; background-color: White;
            box-shadow: 1px 5px 10px -3px #666666, -1px 5px 10px -3px #666666;">
            <div class="row">
                <div class="col-md-3 col-sm-6 ">
                    <span>Type</span>
                    <asp:DropDownList ID="ddlType" runat="server" class="form-control">
                        <asp:ListItem Text="ALL" Value="ALL" />
                        <asp:ListItem Text="Distributor" Value="D" />
                        <asp:ListItem Text="Agents" Value="A" />
                        <asp:ListItem Text="Corporate" Value="Cr" />
                    </asp:DropDownList>
                </div>
                <%--<div class="col-md-3 col-sm-6">
                    <span>Credit Limit</span>
                    <asp:DropDownList ID="ddlType2" runat="server" class="form-control">
                        <asp:ListItem Text="Select" Value="S" />
                        <asp:ListItem Text="Non-Zero" Value="Nz" />
                        <asp:ListItem Text="Zero" Value="Z" />
                        <asp:ListItem Text="Negative" Value="Ne" />
                    </asp:DropDownList>
                </div>--%>
                <div class="col-md-2 col-sm-6" style="margin-top: 23px;">
                    <asp:Button ID="BtnSearch" runat="server" class="btn btn-primary" Text="Search" Style="cursor: pointer"
                        OnClick="BtnSearch_Click" />
                </div>
                <%--<div class="col-md-2 col-sm-6 " style="margin-top: 23px;">
                    <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="Add Limits"
                        Style="cursor: pointer" />
                </div>--%>
                <div class="col-md-2 col-sm-6" style="margin-top: 23px;">
                    <asp:Button ID="export2Excel" runat="server" class="btn btn-primary" Text=" Export To Excel"
                        Style="cursor: pointer" OnClick="ExportCSV" />
                </div>
            </div>
            <div class="gap">
            </div>
            <% 
            %>
            <table class="ui-widget-content ui-corner-all ezeetable" border="0" cellpadding="0"
                cellspacing="0" align="center">
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
                                        Franchisee/ Agents Available Credit List</div>
                                </tr>
                            </table>
                            <tr>
                                <td>
                                    <table id="table3" border="0" cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <table id="definecreditmain">
                                                <thead>
                                                    <tr>
                                                        <td align="right" class="ui-border-wo-left">
                                                            <b>SNo.</b>
                                                        </td>
                                                        <td align="left" class="ui-border-wo-left" style="width: 380px;">
                                                            <a href=""><font color="#000"><b>Agent/ Franchisee/ CCY</b></font></a>
                                                        </td>
                                                        <td align="left" class="ui-border-wo-left">
                                                            <b>Active&nbsp;&nbsp;</b>
                                                        </td>
                                                        <td align="right" class="ui-border-wo-left">
                                                            <b>Book Bal&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                                        </td>
                                                        <td align="right" class="ui-border-wo-left">
                                                            <b>Acc Bal&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                                        </td>
                                                        <td align="right" class="ui-border-wo-left">
                                                            <b>Credit&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                                        </td>
                                                        <td align="right" class="ui-border-wo-left">
                                                            <b>Misc Bal&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                                        </td>
                                                        <td align="left" class="ui-border-wo-left">
                                                            <b>Maintain Rule</b>
                                                        </td>
                                                        <%--<td align="left" class="ui-border-wo-left">
                                                            <b>Dom PLB</b>
                                                        </td>--%>
                                                        <td align="left" class="ui-border-wo-left">
                                                            <b>Hotel MarkUp</b>
                                                        </td>
                                                        <td align="left" class="ui-border-wo-left">
                                                            <b>Agents List</b>
                                                        </td>
                                                        <td align="left" class="ui-border-wo-left">
                                                            <b>Details</b>
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
                                                            decimal CreditBal = Convert.ToDecimal(sdr["AvailableCredit"].ToString()) -Convert.ToDecimal(sdr["StatementBalance"].ToString());
                                                %>
                                                <tr>
                                                    <td class="ui-border-wo-left" align="right">
                                                        <a>
                                                            <%=sid %></a>
                                                    </td>
                                                    <td class="ui-border-wo-topleft" align="left">
                                                        <a class="" href="EditCredit.aspx?idnow=<%=sdr["sid"].ToString()%>">
                                                            <%=sdr["agencyName"].ToString()%>
                                                            /
                                                            <%=sdr["Agentcode"].ToString()%>&nbsp;/&nbsp;<%=sdr["Currency"].ToString()%>
                                                        </a>
                                                    </td>
                                                    <td class="ui-border-wo-topleft" align="left">
                                                        <%=Airline %>
                                                    </td>
                                                    <td class="ui-border-wo-topleft" align="right">
                                                        <%=sdr["AvailableCredit"].ToString()%>
                                                    </td>
                                                    <td class="ui-border-wo-topleft" align="right">
                                                        <%=sdr["AvailableCash"].ToString()%>
                                                    </td>
                                                    <td class="ui-border-wo-topleft" align="right">
                                                        <%=sdr["StatementBalance"].ToString()%>
                                                    </td>
                                                    <td class="ui-border-wo-topleft" align="right">
                                                        <%=CreditBal%>
                                                    </td>
                                                   <%-- <%if (UserType == "OO" || UserType == "OOU")
                                                      {%>--%>
                                                    <td class="ui-border-wo-topleft" align="left">
                                                        <a class="txt_blue" href="MaintainMarkup.aspx?idnow=<%=sdr["Uid"].ToString()%>&Edit=Yes">
                                                            Maintain Rule</a>
                                                    </td>
                                                    <%--<%} %>--%>
                                                    <%--<td class="ui-border-wo-topleft" align="left">
                                                        <a class="txt_blue" href="AgencyDetail.aspx?idnow=<%=sdr["Uid"].ToString()%>&Edit=Yes">
                                                            Dom PLB</a>
                                                    </td>--%>
                                                    <td class="ui-border-wo-topleft" align="left">
                                                        <a href="ShowHotelMarkup.aspx?idnow=<%=sdr["Uid"].ToString() + "," + sdr["Usertype"].ToString() + "," + sdr["agencyName"].ToString()%>">
                                                            Hotel Markup</a>
                                                    </td>
                                                    <td class="ui-border-wo-topleft" align="left">
                                                        <a href="">View List</a>
                                                    </td>
                                                    <td class="ui-border-wo-topleft" align="left">
                                                        <a class="txt_blue" href="javascript:var w= window.open('AgencyDetailsPopUp.aspx?AgencyID=<%=sdr["Uid"].ToString()%>', '', 'width=680, height=300, scrollbars=yes, toolbar=no, menubar=no');">
                                                            Agency Details</a>
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
            </table>
            <tr style="padding: 5px;">
                <td align="left">
                    <br />
                    <br />
                    <table cellspacing="5" class="ui-border-all ui-widget-content ui-corner-all" style="margin-top: 20px;
                        padding: 5px;">
                        <tr style="margin-left: 10px;">
                            <td class="ui-widget-header" colspan="2" style="padding-left: 5px; font-size: 14px;">
                                <b><u>Summary</u></b>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px;">
                                <b>TOTAL DISTRIBUTOR'S CREDIT:</b>
                            </td>
                            <td align="right" style="padding-right: 5px;">
                                <%=curSymbol %>
                                <b><span class="Webrupee1">s<%=DisBalance%></span></b>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 5px;">
                                <b>TOTAL AGENT'S CREDIT:</b>
                            </td>
                            <td align="right" style="padding-right: 5px;">
                                <%=curSymbol %>
                                <b><span class="Webrupee1">
                                    <%=AgntBalance%></span></b>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <div class="gap">
            </div>
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
    </form>
</asp:Content>
