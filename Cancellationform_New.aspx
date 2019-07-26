<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPageForNewReg.master"
    AutoEventWireup="true" CodeFile="Cancellationform_New.aspx.cs" Inherits="Cancellationform_New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form" runat="server">
    <div style="height: 20px;">
    </div>
    <script type="text/javascript">
        $("#Cnc_Amount").keyup(function () {
            debugger;
            alert("Handler for .keyup() called.");
        });
    </script>
    <%string[] Data = Finalstring.Split('~');
      string[] paxarr = Data[4].Split(','); string OutBound_flt = string.Empty; string InBound_flt = string.Empty;
      string[] flight_det_arr = Data[0].Split('^')[0].Split(',');
      string[] Fare_det_arr = Data[1].Split('`')[0].Split(':');
      string[] searchparam = Data[2].Split('!')[0].Split(';');
      string[] bookingdate = Data[2].Split('!')[1].Split(';');
      string[] pnrdetails = Data[3].Split(','); bool Rndtrip = false;
      string totalpax = Convert.ToString(Convert.ToInt32(searchparam[5]) + Convert.ToInt32(searchparam[6]) + Convert.ToInt32(searchparam[7]));
      string cityarrya = Global.CityandCountryArr;
      string[] Fare_det_Inb = null; decimal Adultfare = 0; decimal ChildFare = 0; Decimal infantfare = 0; decimal Comm = 0; decimal serviceTax = 0;
      decimal AdultfareTax = 0; decimal ChildFareTax = 0; Decimal infantfareTax = 0; decimal total_Fare = 0; decimal total_Tax = 0;decimal service_charge=0;
      bool round = false;

      if (searchparam[0].ToUpper() == "TWO" && searchparam[searchparam.Length-1]=="D")
      {
          Fare_det_Inb = Data[1].Split('`')[1].Split(':');
          Rndtrip = true;
      }    
      Adultfare = Convert.ToDecimal(Fare_det_arr[0]);
      if (Fare_det_arr[2] == "")
          Fare_det_arr[2] = "0";
      ChildFare = Convert.ToDecimal(Fare_det_arr[2]);
      if (Fare_det_arr[4] == "")
          Fare_det_arr[4] = "0";
      infantfare = Convert.ToDecimal(Fare_det_arr[4]);
      AdultfareTax = Convert.ToDecimal(Fare_det_arr[1]);
      if (Fare_det_arr[3] == "")
          Fare_det_arr[3] = "0";
      ChildFareTax = Convert.ToDecimal(Fare_det_arr[3]);
      if (Fare_det_arr[5] == "")
          Fare_det_arr[5] = "0";
      infantfareTax = Convert.ToDecimal(Fare_det_arr[5]);
      if (Fare_det_arr[6] == "")
          Fare_det_arr[6] = "0";
      Comm = Convert.ToDecimal(Fare_det_arr[6]);
      if (Fare_det_arr[7] == "")
          Fare_det_arr[7] = "0";
         service_charge=Convert.ToDecimal(Fare_det_arr[7]);
         if(Fare_det_arr[8]=="")
             Fare_det_arr[8]="0";
      serviceTax =Convert.ToDecimal(Fare_det_arr[8]);
      if (Rndtrip)
      {
          Adultfare += Convert.ToDecimal(Fare_det_Inb[0]);
          ChildFare += Convert.ToDecimal(Fare_det_Inb[2]);
          infantfare += Convert.ToDecimal(Fare_det_Inb[4]);
          AdultfareTax += Convert.ToDecimal(Fare_det_Inb[1]);
          ChildFareTax += Convert.ToDecimal(Fare_det_Inb[3]);
          infantfareTax += Convert.ToDecimal(Fare_det_Inb[5]);
          Comm += Convert.ToDecimal(Fare_det_Inb[6]);
          serviceTax += Convert.ToDecimal(Fare_det_Inb[8]);
          service_charge+=Convert.ToDecimal(Fare_det_Inb[7]);
      }
      total_Fare = (Adultfare + ChildFare + infantfare+AdultfareTax+ChildFareTax+infantfareTax);
      total_Tax = (AdultfareTax + ChildFareTax + infantfareTax);
      Cnc_Amount.Text =Convert.ToString(total_Fare + service_charge+serviceTax);
   
    %>
    <div align="center">
        <font size="5px"><b>Cancelled Form</b></font>
    </div>
    <div style="height: 20px;">
    </div>
    <div class="container" style="border: 2px solid #ccc;">
        <div class="row" style="height: 35px; font-size: medium; border-bottom: 2px solid gray;
            border-top: 2px solid gray;">
            <div class="col-md-6" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                color: #000000;">
                Reference ID :</div>
            <div class="col-md-6" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                color: Red;">
                <%=Request.QueryString["refID"] %></div>
        </div>
        <div class="row" style="height: 35px; font-size: medium; border-bottom: 1px solid gray;
            border-top: 2px solid gray;">
            <div class="col-md-6" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                color: #000000;">
                <div class="col-md-6" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                    color: #000000;">
                    Airline Pnr:</div>
                <div class="col-md-6" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                    color: #000000;">
                    <%=pnrdetails[0]%></div>
            </div>
            <div class="col-md-6" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                color: #000000;">
                <div class="col-md-6" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                    color: #000000;">
                    GDS Pnr/Ticket No:</div>
                <div class="col-md-6" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                    color: #000000;">
                    <%=pnrdetails[1]%></div>
            </div>
        </div>
        <div class="row" style="height: 35px; font-size: medium; border-bottom: 1px solid gray;
            border-top: 2px solid gray;">
            <div class="col-md-12" style="height: 33px; font-weight: bold; border-right: 2px solid gray;
                color: #000000;">
                Flight Details :</div>
        </div>
        <div class="row" style="min-height: 60px;">
            <div class="col-md-12">
                Flight Details (OutBound)</div>
            <%int cntO = 0;
                for (int i = 0; i < 3; i++)
              {
                  if (flight_det_arr[6+cntO+i] != "")
                  { %>
            <div class="col-md-4">
                <div class="col-md-12">
                    Flight Number :</div>
                <div class="col-md-12">
                    <%=flight_det_arr[6+cntO+i]%></div>
            </div>
            <div class="col-md-4">
                <div class="col-md-12">
                    Depart :</div>
                <div class="col-md-12">
                    <%=flight_det_arr[9+cntO+i]%>
                    On
                    <%=flight_det_arr[11+cntO+i]%>
                    at
                    <%=flight_det_arr[12+cntO+i]%>
                    Hrs</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-12">
                    Arrival :</div>
                <div class="col-md-12">
                    <%=flight_det_arr[10+cntO+i]%>
                    On
                    <%=flight_det_arr[13+cntO+i]%>
                    at
                    <%=flight_det_arr[14+cntO+i]%>
                    Hrs</div>
            </div>
            <%} cntO = cntO + 9;
              }%>
        </div>
        <%if (Rndtrip)
         { %>
        <div class="row" style="min-height: 60px;">
            <div class="col-md-12">
                Flight Details (InBound)</div>
            <%int cntI = 0;
              for (int j = 0; j < 3; j++)
              {
                  if (flight_det_arr[36 + cntI + j] != "")
                  {%>
            <div class="col-md-4">
                <div class="col-md-12">
                    Flight Number :</div>
                <div class="col-md-12">
                    <%=flight_det_arr[36+cntI+j]%></div>
            </div>
            <div class="col-md-4">
                <div class="col-md-12">
                    Depart :</div>
                <div class="col-md-12">
                    <%=flight_det_arr[39 + cntI + j]%>
                    On
                    <%=flight_det_arr[41 + cntI + j]%>
                    at
                    <%=flight_det_arr[42 + cntI + j]%>
                    Hrs</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-12">
                    Arrival :</div>
                <div class="col-md-12">
                    <%=flight_det_arr[40 + cntI + j]%>
                    On
                    <%=flight_det_arr[43 + cntI + j]%>
                    at
                    <%=flight_det_arr[44 + cntI + j]%>
                    Hrs</div>
            </div>
            <%}
                  cntI = cntI + 9;
              } %>
        </div>
        <%} %>
        <div class="row" style="height: 35px; font-size: medium; font-weight: bold; color: #000000;
            border-bottom: 2px solid gray; border-top: 2px solid gray;">
            <div class="col-md-12">
                Passenger Details For Cancellation</div>
        </div>
        <div class="row">
            <div class="col-md-12" style="color: #000000;">
                (OutBound)
            </div>
            <%for (int k = 0; k <PaxOut.Count; k++)
              { %>
            <div class="col-md-12" style="margin-left: 10px;">
                <%=PaxOut[k].Split('`')[0]%>
            </div>
            <%} %>
            <br />
            <%if (Rndtrip)
              { %>
            <div class="col-md-12" style="color: #000000;">
                (InBound)
            </div>
            <%for (int l = 0; l < PaxInb.Count; l++)
              { %>
            <div class="col-md-12" style="margin-left: 10px;">
                <%=PaxInb[l].Split('`')[0]%>
            </div>
            <%}
              }%>
        </div>
        <div class="row" style="height: 35px; font-size: medium; font-weight: bold; color: #000000;
            border-bottom: 2px solid gray; border-top: 2px solid gray;">
            <div class="col-md-6" style="height: 33px; border-right: 2px solid gray;">
                <div class="col-md-12">
                    Fare Breakup</div>
            </div>
            <div class="col-md-6" style="height: 33px;">
                <div class="col-md-12">
                    Cancel Reservation</div>
            </div>
        </div>
        <div class="col-md-6" style="border-right: 2px solid #ccc;">
            <div class="col-md-12">
                <div class="col-md-6">
                    Total Fare :</div>
                <div class="col-md-6">
                    <%=total_Fare %></div>
                <div class="col-md-6">
                    Total Tax :</div>
                <div class="col-md-6">
                    <%=total_Tax %></div>
                <div class="col-md-6">
                    Commission :</div>
                <div class="col-md-6">
                    <%=Comm%></div>
                <div class="col-md-6">
                    Service Tax :</div>
                <div class="col-md-6">
                    <%=serviceTax%></div>
                <div class="col-md-6">
                    TDS :</div>
                <div class="col-md-6">
                   <%decimal Tds = 0;
                     if (ConfigurationManager.AppSettings.Get("TDS") != "" && ConfigurationManager.AppSettings.Get("TDS") != null)
                     {
                         Tds = 0;
                     }
                     else
                     {
                         Tds = Convert.ToDecimal(ConfigurationManager.AppSettings.Get("TDS"));
                     } %>
                     <%=(Comm*Tds)/100 %></div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="col-md-12">
                <div class="col-md-6">
                    Amount :</div>
                <div class="col-md-6">
                    <asp:TextBox ID="Cnc_Amount" CssClass="text-default" runat="server" ReadOnly="True"></asp:TextBox></div>
                <div class="col-md-6">
                    Total Cancellation Charges :</div>
                <div class="col-md-6">
                    <asp:TextBox ID="Cnc_cnx" CssClass="text-default" runat="server"></asp:TextBox></div>
                <div class="col-md-6">
                    Total Approximate Refund :</div>
                <div class="col-md-6">
                    <asp:TextBox ID="cnc_Refund" CssClass="text-default" runat="server"></asp:TextBox></div>
                <div class="col-md-6">
                    Executive Name :</div>
                <div class="col-md-6">
                    <asp:TextBox ID="Executive" CssClass="text-default" runat="server" TextMode="MultiLine"></asp:TextBox></div>
            </div>
        </div>
        <div class="gap-small">
        </div>
        <div style="margin: auto; text-align: center;">
            <asp:Button ID="Submit" CssClass="btn-primary" Text="Cancel" runat="server" OnClick="Submit_Click" /></div>
    </div>
    <div class="gap-small">
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
