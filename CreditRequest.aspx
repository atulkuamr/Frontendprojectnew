<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="CreditRequest.aspx.cs" Inherits="CreditRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function Numeric(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || k == 8 || k == 32 || (k >= 48 && k <= 57));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .offset-1
        {
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
    <!-- /FACEBOOK WIDGET -->
    <div class="global-wrap">
        <div class="gap">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <!-- adition details start!-->
                                  <div class="col-md-1">
                    </div>
                    <div class="col-md-10 offset-1">
                        <h2 align="center" style="font-weight: bold;">
                            Credit Request
                        </h2>
                        <form id="Form1" runat="server">
                        
                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>
                                        Agent ID
                                    </label>
                                    <input type="text" class="form-control" runat="server" id="txtagentID" readonly="readonly" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>
                                        Agent Deposit Code
                                    </label>
                                    <input type="text" class="form-control" id="txtAgentCode" runat="server" readonly="readonly" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>
                                        Credit Amount Needed
                                    </label>
                                    <input type="text" runat="server" class="form-control" id="txtcramount" onkeypress="return Numeric(event)" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>
                                        Mobile Number
                                    </label>
                                    <input type="text" runat="server" class="form-control" id="txtmobile" maxlength="10" onkeypress="return Numeric(event)"/>
                                </div>
                            </div>
                            <%--<div class="col-md-6 input-daterange">
                                <div class="form-group">
                                    <label>
                                        Last Deposit Date
                                    </label>
                                    <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                    <input type="text" runat="server" class="form-control" id="txtdepdate" />
                                </div>
                            </div>--%>
                            <div class="input-daterange" data-date-format="dd M yyyy">
                                <div class="col-md-6">
                                    <div class="form-group form-group-md form-group-icon-left">
                                        <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                        <label>
                                            Last Deposit Date</label>
                                        <input id="depdate" class="form-control" name="start" type="text" />
                                    </div>
                                </div>
                            </div>
                            <%--<asp:HiddenField runat="server" ID="txtdepdate" /> --%>
                            <input id="txtdepdate" runat="server" type="hidden" />
                            <script type="text/javascript">
                                $(document).ready(function () {

                                    $("#depdate").change(function () {
                                        debugger;
                                        var asas = document.getElementById("depdate").value;
                                        document.getElementById("txtdepdate").value = asas;
                                    });
                              });
                            </script>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>
                                        Last Deposit Amount
                                    </label>
                                    <input type="text" runat="server" class="form-control" id="txtlstdepdate"  onkeypress="return Numeric(event)" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>
                                        Credit Already Pending
                                    </label>
                                    <input id="txtpending" runat="server" type="text" class="form-control" readonly="readonly"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>
                                        Remarks
                                    </label>
                                    <input id="txtRemarks" runat="server" type="text" class="form-control" />
                                </div>
                            </div>
                            <div style="width: 10%; height: auto; padding: 5px; margin: 0 auto;">
                                <asp:Button ID="submit" runat="server" Text="Submit" class="btn btn-primary" OnClick="submit_Click" />
                            </div>
                        </div>
                        </form>
                    </div>
                    <div class="col-md-1">
                    </div>
                    <!-- adition details end!-->
                </div>
            </div>
            <!-- <div class="gap"></div>-->
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
</asp:Content>
