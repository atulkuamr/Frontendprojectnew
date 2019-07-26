<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPageForNewReg.master"
    AutoEventWireup="true" CodeFile="CancelTicket.aspx.cs" Inherits="CancelTicket" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<%@ Register Src="~/header.ascx" TagPrefix="user" TagName="head" %>
<%@ Register Src="ui_control/Footer.ascx" TagPrefix="uc2" TagName="uc_Footer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 20%;
        }
        .style2
        {
            width: 30%;
        }
        .style3
        {
            width: 30%;
        }
        .maindiv{background:#eeeeee}
         .hading{padding: 10px;
    background: #eeeeee;
    color: #000;
        margin-bottom: 12px;
}
         .hdiv{padding: 20px;
    background: #b4d034;
    color: #fff;
        margin-bottom: 12px;
        text-align:center;
        font-size:20px;
         }
 .redbtn {
    background: #d4050b!important;
    padding: 2px 19px !important;
    color: #fff!important;
    border-radius: 2px;
    margin-top: 9px;
    margin-bottom: 20px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form" runat="server">
   <user:head ID="header" runat="server" />

    <%string[] Data = Finalstring.Split('~');
      string[] paxarr = Data[4].Split(','); string OutBound_flt = string.Empty; string InBound_flt = string.Empty;
      string[] flight_det_arr = Data[0].Split('^')[0].Split(',');
      string[] Fare_det_arr = Data[1].Split('`')[0].Split(':');
      string[] searchparam = Data[2].Split('!')[0].Split(';');
      string[] bookingdate = Data[2].Split('!')[1].Split(';');
      string[] pnrdetails = Data[3].Split(','); bool Rndtrip = false;
      string totalpax = Convert.ToString(Convert.ToInt32(searchparam[5]) + Convert.ToInt32(searchparam[6]) + Convert.ToInt32(searchparam[7]));
      string cityarrya = Global.CityandCountryArr;
      string[] Fare_det_Inb = null; decimal Adultfare = 0; decimal ChildFare = 0; Decimal infantfare = 0;
      decimal AdultfareTax = 0; decimal ChildFareTax = 0; Decimal infantfareTax = 0;
      bool round = false;
      if (searchparam[0].ToUpper() == "TWO" && searchparam[searchparam.Length-1]=="D")
      {
          Fare_det_Inb = Data[1].Split('`')[1].Split(':');
          Rndtrip = true;
      }
      JournyOut.InnerText = flight_det_arr[11];
      BookingDate.InnerText = bookingdate[0];
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
      if (Rndtrip)
      {
          Adultfare += Convert.ToInt32(Fare_det_Inb[0]);
          ChildFare += Convert.ToDecimal(Fare_det_Inb[2]);
          infantfare += Convert.ToDecimal(Fare_det_Inb[4]);
          AdultfareTax += Convert.ToDecimal(Fare_det_Inb[1]);
          ChildFareTax += Convert.ToDecimal(Fare_det_Inb[3]);
          infantfareTax += Convert.ToDecimal(Fare_det_Inb[5]);
      }
      if (Rndtrip)
          JournyInb.InnerText = flight_det_arr[41];
      OutBound_flt = flight_det_arr[6];
      if (flight_det_arr[16] != "")
          OutBound_flt += "/" + flight_det_arr[16];
      if (flight_det_arr[26] != "")
          OutBound_flt += "/" + flight_det_arr[26];
      if (Rndtrip)
      {
          InBound_flt = flight_det_arr[36];
          if (flight_det_arr[46] != "")
              InBound_flt += "/" + flight_det_arr[46];
          if (flight_det_arr[56] != "")
              InBound_flt += "/" + flight_det_arr[56];
      }
      Outboundflt.InnerText = OutBound_flt;
      Inboundflt.InnerText = InBound_flt;
    %>

        <div class="maindiv">

    <div class="container" style="background:#fff;">
      
          <div class="col-lg-12 col-md-12 col-sm-12 hdiv">Cancel Ticket </div>
              
               

                        <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12"> Confirmation ID </div>
                             <div class="col-lg-6 col-md-12 col-sm-12"><%=refid%> </div>
                        </div>

                        
                           <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">  Airline Details</div>
                             <div class="col-lg-3 col-md-12 col-sm-12">  (OutBound)</div>
                                <div class="col-lg-3 col-md-12 col-sm-12">   (Inbound)</div>
                        </div>

                           <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">  Airline PNR </div>
                             <div class="col-lg-3 col-md-12 col-sm-12">
                                <%=pnrdetails[0].Split('#')[0]%>
                            </div>
                            <div class="col-lg-3 col-md-12 col-sm-12">
                                <%if (Rndtrip==true && pnrdetails[0].Split('#').Length>1)
                                  {%>
                                <%=pnrdetails[0].Split('#')[1]%>
                                <%} %>
                            </div>
                        </div>

                       
                         <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12"> Airline </div>
                             <div class="col-lg-3 col-md-12 col-sm-12">  
                                <%=flight_det_arr[7]%>
                            </div>
                             <div class="col-lg-3 col-md-12 col-sm-12">  
                                <%if (Rndtrip)
                                  { %>
                                <%=flight_det_arr[37]%>
                                <%} %>
                            </div>
                        </div>




                         <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">  Flight No </div>
                             <div class="col-lg-6 col-md-12 col-sm-12"> <%=refid%></div>
                        </div>

                        

                         <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12"> Flight No</div>
                             <div class="col-lg-3 col-md-12 col-sm-12"> <label id="Outboundflt" runat="server"></label></div>
                             <%if (Rndtrip)
	{%>
                               <div class="col-lg-3 col-md-12 col-sm-12"> <label id="Inboundflt" runat="server"></label></div>
		 
	<%} %>
                        </div>

                        

                       



                        
                     

                        
                         <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">   Booking Date </div>
                             <div class="col-lg-6 col-md-12 col-sm-12"> <label id="BookingDate" runat="server"></label></div>
                        </div>

                        
                         <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">    Journey Date </div>
                             <div class="col-lg-3 col-md-12 col-sm-12"><label id="JournyOut" runat="server"> </label></div>
                              <div class="col-lg-3 col-md-12 col-sm-12">   <label id="JournyInb" runat="server"> </label></div>
                            
                        </div>

                        
                         <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">  PNR No  </div>
                               <div class="col-lg-3 col-md-12 col-sm-12">   <%=pnrdetails[1].Split('#')[0]%></div>
                             
                            
                             <%if (Rndtrip == true && pnrdetails[1].Split('#').Length > 1)
	{%>
		<div class="col-lg-3 col-md-12 col-sm-12">   <%=pnrdetails[1].Split('#')[1]%> </div>
	<%} %>
                        </div>

                        <div class="clearfix"></div>
                         <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12"> Pax Details</div>
                             <div class="col-lg-6 col-md-12 col-sm-12">  <asp:CheckBoxList ID="paxIn" CssClass="text" runat="server">
                                </asp:CheckBoxList></div>
                        </div>
                     
                                                <div class="clearfix"></div>
                            <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">  Pax Name(OutBound)</div>
                             <div class="col-lg-6 col-md-12 col-sm-12"> <asp:CheckBoxList ID="paxOut" CssClass="text" runat="server">
                                </asp:CheckBoxList></div>
                        </div>
                       
                   
                      
                      <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">  Cancellation Mode</div>
                             <div class="col-lg-3 col-md-12 col-sm-12">  <input type="radio" runat="server" checked="true" id="radio1" />&nbsp;&nbsp;Normal Cancellation<br /></div>
                            <div class="col-lg-3 col-md-12 col-sm-12">  <input type="radio" runat="server" id="radio2" />&nbsp;&nbsp;Full Refund<br /></div>
                        </div>
                        


                           <div class="col-lg-12 col-md-12 col-sm-12 hading">
                             <div class="col-lg-6 col-md-12 col-sm-12">  Remarks</div>
                             <div class="col-lg-6 col-md-12 col-sm-12"> <asp:TextBox id="Remarks" TextMode="MultiLine" runat="server"></asp:TextBox></div>
                        </div>
                       
                    
              
                <center>
                    <asp:Button ID="Button1" Class="redbtn" runat="server" Width="120px" Text="Cancel"
                        Height="30px" OnClick="Button1_Click" />
                </center>
        
            <%--<div class="col-md-4">
                <div class="gap">
                </div>
                <input type="checkbox" runat="server" id="checkbox1" />&nbsp;&nbsp;Sumit/Tushar.Mr(Booked)<br />
                <input type="checkbox" runat="server" id="checkbox2" />&nbsp;&nbsp;Lalit/Tushar.Mr(Booked)
                <br />
                <br />
               
                <input type="radio" runat="server" id="radio3" />&nbsp;&nbsp;Part Refund<br />
                <input type="radio" runat="server" id="radio4" />&nbsp;&nbsp;Tax Refund<br />
                <div class="gap">
                </div>
               
            </div>--%>
        
        
    </div>
  </div>
    <div>
        <uc2:uc_Footer runat="server" ID="uc_Footer" />
    </div>
    </form>
    
</asp:Content>
