<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPageForNewReg.master"
    AutoEventWireup="true" CodeFile="Cancellation_form.aspx.cs" Inherits="Cancellation_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form" runat="server">
    <div style="height: 20px;">
    </div>
    <div align="center">
        <font size="5px"><b>Cancelled Form</b></font>
    </div>
    <div style="height: 20px;">
    </div>
    <div class="container" style="border: 2px solid #ccc;">
       <div class="row" style="height:35px; font-size: medium; background-color:#ccc; border-bottom:2px solid gray; border-top:2px solid gray;">
            <div class="col-md-3" style="font-weight: bold; margin-top:5px; border-right:2px solid gray; color: #000000;">Reference ID :</div>
            <div class="col-md-3" style="font-weight: bold; margin-top:5px; border-right:2px solid gray; color: Red;">05426454GUJ6</div>
            <div class="col-md-3" style="font-weight: bold; margin-top:5px; border-right:2px solid gray; color: #000000;">Flight Details :</div>
            <div class="col-md-3" style="font-weight: bold; margin-top:5px; color: Red;">Mombai-BOM To Delhi-DEL</div>
       </div>
       <div class="row" style="min-height:60px;">
            <div class="col-md-4">
                <div class="col-md-12">Flight Number :</div>
                <div class="col-md-12">SG1 - 152</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-12">Depart :</div>
                <div class="col-md-12">BOM On 25/03/2017 at 07:20 Hrs</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-12">Arrival :</div>
                <div class="col-md-12">DEL On 25/03/2017 at 09:35 Hrs</div>
            </div>
       </div>
       <div class="row" style="height:35px; font-size: medium; font-weight: bold; color: #000000; background-color:#ccc; border-bottom:2px solid gray; border-top:2px solid gray;">
            <div class="col-md-12">Flight Details </div>
       </div>
       <div class="row">
            <div class="col-md-5" align="center" style="height:35px; font-size: medium; font-weight: bold; color: #000000; border-bottom:2px solid #ccc; border-right:2px solid #ccc;">Basic Fare (Per Pax)</div>
            <div class="col-md-4" align="center" style="height:35px; font-size: medium; font-weight: bold; color: #000000; border-bottom:2px solid #ccc; border-right:2px solid #ccc;">Taxes</div>
            <div class="col-md-3" align="center" style="height:35px; font-size: medium; font-weight: bold; color: #000000; border-bottom:2px solid #ccc;">Total Price</div>
            <div class="col-md-5" style="border-bottom:2px solid #ccc; border-right:2px solid #ccc; min-height:80px;">INR 1200.00 (Per Adult), INR 0.00 (Per Child), INR 0.00 (Per Infant)</div>
            <div class="col-md-4" style="border-bottom:2px solid #ccc; border-right:2px solid #ccc; min-height:80px;">
                <div class="row">
                    <div class="col-md-6">Tax</div>
                    <div class="col-md-6">INR 2152.00</div>
                </div>
                <div class="row">
                    <div class="col-md-6">Txn Fee</div>
                    <div class="col-md-6">INR 0.00</div>
                </div>
                <div class="row">
                    <div class="col-md-6">Service Tax (0%)</div>
                    <div class="col-md-6">INR 0.00</div>
                </div>
            </div>
            <div class="col-md-3" style="border-bottom:2px solid #ccc; min-height:80px;">INR 13848.00</div>
       </div>
       <%--<div class="row">
        <div class="col-md-5">
            <div class="col-md-12" align="center" style="height:35px; font-size: medium; font-weight: bold; color: #000000; border-bottom:2px solid #ccc;">Basic Fare (Per Pax)</div>
            <div class="col-md-12">INR 1200.00 (Per Adult), INR 0.00 (Per Child), INR 0.00 (Per Infant)</div>
        </div>
        <div class="col-md-4">
            <div class="col-md-12" align="center" style="height:35px; font-size: medium; font-weight: bold; color: #000000;">Taxes</div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6">Tax</div>
                    <div class="col-md-6">INR 2152.00</div>
                </div>
                <div class="row">
                    <div class="col-md-6">Txn Fee</div>
                    <div class="col-md-6">INR 0.00</div>
                </div>
                <div class="row">
                    <div class="col-md-6">Service Tax (0%)</div>
                    <div class="col-md-6">INR 0.00</div>
                </div>
            </div>
        </div>
        <div class="col-md-3" align="center" style="height:35px;">
            <div class="col-md-12" style=" font-size: medium; font-weight: bold; color: #000000;">Total Price</div>
            <div class="col-md-12">INR 13848.00</div>
        </div>
       </div>--%>
       <div class="row" style="height:35px; margin-top:30px; font-size: medium; font-weight: bold; color: #000000; background-color:#ccc; border-bottom:2px solid gray; border-top:2px solid gray;">
            <div class="col-md-12">Request For Cancellation Pax Details </div>
       </div>
       <div class="row" style="min-height:45px; font-size: medium; font-weight: bold; color: #000000; border-bottom:2px solid #ccc;">
            <div class="col-md-3">Passenger Name</div>
            <div class="col-md-1">Sector</div>
            <div class="col-md-1">Base Fare</div>
            <div class="col-md-1">Tax</div>
            <div class="col-md-1">Comm</div>
            <div class="col-md-1">S.Tax</div>
            <div class="col-md-1">TDS</div>
            <div class="col-md-1">Cnx Charges</div>
            <div class="col-md-1">Airline Charges</div>
            <div class="col-md-1">Refund</div>
       </div>
       <div class="row" style="min-height:35px; border-bottom:2px solid #ccc; margin-top:2px;">
            <div class="col-md-3">Sakhiya Nilesh Mr</div>
            <div class="col-md-1">BOM - DEL</div>
            <div class="col-md-1">
                <input type="text" id="basefare" value="0.00" style="width:100%; border-radius:5px;"/>
            </div>
            <div class="col-md-1">
                <input type="text" id="tax" value="0.00" style="width:100%; border-radius:5px;"/>
            </div>
            <div class="col-md-1">
                <input type="text" id="comm" value="0.00" style="width:100%; border-radius:5px;"/>
            </div>
            <div class="col-md-1">
                <input type="text" id="stax" value="0" style="width:100%; border-radius:5px;"/>
            </div>
            <div class="col-md-1">
                <input type="text" id="tds" value="0" style="width:100%; border-radius:5px;"/>
            </div>
            <div class="col-md-1">
                <input type="text" id="cnxcharges" value="0" style="width:100%; border-radius:5px;"/>
            </div>
            <div class="col-md-1">
                <input type="text" id="airlinecharges" value="0" style="width:100%; border-radius:5px;"/>
            </div>
            <div class="col-md-1">
                <input type="text" id="refund" value="0" style="width:100%; border-radius:5px;"/>
            </div>
       </div>
       <div class="row" style="height:35px; font-weight: bold; color: #000000; border-bottom:2px solid #ccc; margin-top:2px;">
            <div class="col-md-11" align="right">Cancellation Charges</div>
            <div class="col-md-1">
                <input type="text" id="cxncharge" value="0.00" style="width:100%; border-radius:5px;"/>
            </div>
       </div>
       <div class="row" style="height:30px; font-weight: bold; color: #000000; margin-top:2px;">
            <div class="col-md-11" align="right">Approx Refund</div>
            <div class="col-md-1">
                <input type="text" id="approxrefund" value="0.00" style="width:100%; border-radius:5px;"/>
            </div>
       </div>       
       <div class="row" style="height:35px; margin-bottom:10px; margin-top:10px; font-size: medium; font-weight: bold; color: #000000; background-color:#ccc; border-bottom:2px solid gray; border-top:2px solid gray;">
            <div class="col-md-12">Cancel Reservation</div>
       </div>
       <div class="row">
            <div class="col-md-12" style="height:35px;">
                <div class="col-md-4" align="right" style="font-weight: bold; color: #000000;">Amount :</div>
                <div class="col-md-7">
                    <input type="text" id="amount" value="0.00" style="width:50%; border-radius:5px;"/>
                </div>
            </div>
            <div class="col-md-12" style="height:35px;">
                <div class="col-md-4" align="right" style="font-weight: bold; color: #000000;">Total Cancellation Charges :</div>
                <div class="col-md-7">
                    <input type="text" id="Text1" value="0.00" style="width:50%; border-radius:5px;"/>
                </div>
            </div>
            <div class="col-md-12" style="height:35px;">
                <div class="col-md-4" align="right" style="font-weight: bold; color: #000000;">Total Approximate Refund :</div>
                <div class="col-md-7">
                    <input type="text" id="Text3" value="0.00" style="width:50%; border-radius:5px;"/>
                </div>
            </div>
            <div class="col-md-12" style="height:35px;">
                <div class="col-md-4" align="right" style="font-weight: bold; color: #000000;">Executive Name :</div>
                <div class="col-md-7">
                    <input type="text" id="Text2" value="0.00" style="width:50%; border-radius:5px;"/>
                </div>
            </div>
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
