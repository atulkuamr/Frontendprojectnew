<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookingdetails.aspx.cs" Inherits="bookingdetails" %>
<%@ Register Src="~/header.ascx" TagPrefix="user" TagName="head" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<%@ Register Src="~/footer.ascx" TagPrefix="user" TagName="h1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <HeadTitle:HTitle ID="thead" runat="server" />
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css'>
    <!-- /GOOGLE FONTS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/mystyles.css">
    <script src="js/modernizr.js"></script>

    <link rel="stylesheet" href="css/switcher.css" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/bright-turquoise.css" title="bright-turquoise" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/turkish-rose.css" title="turkish-rose" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/salem.css" title="salem" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/hippie-blue.css" title="hippie-blue" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/mandy.css" title="mandy" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/green-smoke.css" title="green-smoke" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/horizon.css" title="horizon" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/cerise.css" title="cerise" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/brick-red.css" title="brick-red" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/de-york.css" title="de-york" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/shamrock.css" title="shamrock" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/studio.css" title="studio" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/leather.css" title="leather" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/denim.css" title="denim" media="all" />
    <link rel="alternate stylesheet" type="text/css" href="css/schemes/scarlet.css" title="scarlet" media="all" />

    <style type="text/css">
    
      .offset-1 {
    padding-left: 5px;
    padding-right: 5px;
}
    
    </style>
    <script type="text/javascript">
        function onlyAlphabets(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }
        function lettersOnly(evt) {
            evt = (evt) ? evt : event;
            var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
        ((evt.which) ? evt.which : 0));
            if (charCode > 31 && (charCode < 65 || charCode > 90) &&
        (charCode < 97 || charCode > 122)) {

                return false;
            }
            return true;
        }
    </script>
    <script type="text/javascript">
            function Numeric(e) {
                var k;
                document.all ? k = e.keyCode : k = e.which;
                return ((k > 64 && k < 91) || k == 8 || k == 32 || (k >= 48 && k <= 57));
            }
    </script>
    <script type='text/javascript'>
        function emailValidator(element, alertMsg) {
            var emailvalid = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (element.value.match(emailvalid)) {
                element.style.color = "Green";
                return true;
            } else {
                //alert(alertMsg);
                element.focus();
                element.style.color = "Red";
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        function blockSpecialChar(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
        }
    </script>
    <script type="text/javascript">
           function selectedyes() {
               debugger;
               if (document.getElementById('Check').checked == true) {
                   document.getElementById('submit').style.visibility = 'visible';
               }
               else {
                   document.getElementById('submit').style.visibility = 'hidden';
               }
           }
    </script>
</head>

<body>
  <%--  <user:head ID="header" runat="server" />--%>

    <div id="fb-root"></div>
    <div class="global-wrap">

        <div class="gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-11">
                      <!-- passanger details section start!-->
                <div class="col-md-12 offset-1">
                    <h3 style="font-size: large;font-weight: inherit;">Customer Details</h3>
                    <%string[] adag = null;
                      string[] chdag = null;
                        var searchparam = Session["SearchVal"].ToString();
                        string[] arr = searchparam.Split('~');
                         adag = arr[1].Split('^')[1].Split(',');
                         chdag = arr[1].Split('^')[3].Split(',');
                        var fid = arr[1].Split('^');
                        
                        int Adult = Convert.ToInt16(fid[0]);
                        int Child = Convert.ToInt16(fid[2]);
                        for (var i = 0; i < Adult; i++)
                        {
                        
                         %>
                      <!-- first room details start!-->
                         <div class="row"style="margin-top:20px;">
                           <div class="col-md-1">
                                <p>Adult</p>
                            </div>

                             <div class="col-md-2 offset-1">
                                  <select class="form-control" id="agend<%=i %>" >
                                    <option>Mr</option>
                                    <option>Ms</option>
                                    <option>Mrs</option>
                                  </select>                    
                             </div>

                            <div class="col-md-2  offset-1">
                               <input class="form-control" id="afirstname<%=i %>" placeholder="First Name" onkeypress="return lettersOnly(event);" type="text"   />                            
                            </div>
                           
                            <div class="col-md-2  offset-1">
                               <input class="form-control" id="alastname<%=i %>" placeholder="Last Name " onkeypress="return lettersOnly(event);" type="text" />   
                                                        
                            </div>

                             <div class="col-md-1  offset-1">
                               <input class="form-control" id="aage<%=i %>" placeholder="Age " onkeypress="return Numeric(event)" type="text" value="<%=adag[i] %>" readonly="readonly" />                                
                            </div>

                             <div class="col-md-2  offset-1">
                               <input class="form-control"id="apass<%=i %>" placeholder="Passport " onkeypress="return blockSpecialChar(event)" type="text" />                                
                            </div>

                            <div class="col-md-2  offset-1">
                              <select class="form-control" id="anation<%=i %>" >
                                    <option>India</option>
                                    <option>US</option>
                                    <option>Greek</option>
                                    <option>UK</option>
                                   
                                  </select>                              
                            </div>

                        </div>
                        <%} %>
                        <hr />
                        <% for (var j =0; j < Child; j++) 
                           {
                           %>
                         <div class="row" style="margin-top:10px;">
                          
                            <div class="col-md-1">
                                <p>Child</p>
                            </div>

                             <div class="col-md-2 offset-1">
                               
                                  <select class="form-control" id="cgend<%=j %>">
                                    <option>Master</option>
                                    <option>Miss</option>
                                  </select>                 
                            </div>

                            <div class="col-md-2  offset-1">
                               <input class="form-control" id="cfirstname<%=j %>"  placeholder="First Name " onkeypress="return lettersOnly(event);" type="text" />                                
                            </div>
                           
                            <div class="col-md-2  offset-1">
                               <input class="form-control" id="clastname<%=j %>" placeholder="Last Name " onkeypress="return lettersOnly(event);" type="text" />                                
                            </div>

                              <div class="col-md-1  offset-1">
                               <input class="form-control" id="cage<%=j %>" placeholder="Age " onkeypress="return Numeric(event)" type="text" value="<%=chdag[j] %>" readonly="readonly" />                                
                            </div>

                             <div class="col-md-2  offset-1">
                               <input class="form-control" id="cpass<%=j %>" placeholder="Passport " onkeypress="return blockSpecialChar(event)" type="text" />                                
                            </div>

                            <div class="col-md-2  offset-1">
                              <select class="form-control" id="cnati<%=j %>">
                                    <option>India</option>
                                    <option>US</option>
                                    <option>Greek</option>
                                    <option>UK</option>
                                   
                                  </select>                              
                            </div>

                        </div>
                        <br />
                     <%} %>
                    <hr>
                </div>
                <div class="col-md-12 offset-1">
                    <h3 style="font-size: large;font-weight: inherit;"> Provide Additional Details </h3>
                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-3">
                            <div class="form-group">
                                <label> Customer Mobile No </label>
                                <input type="text" placeholder="Enter your Mobile Number" onkeypress="return Numeric(event)" class="form-control" id="Phn">
                            </div>
                            </div> 
                            <div class="col-md-3">
                            <div class="form-group">
                                <label>Email Id </label>
                                <input type="text" placeholder="Enter your Email Address" class="form-control" onblur="emailValidator(document.getElementById('email'), 'Invalid Email-Id')" id="email">
                            </div>
                            </div> 
                            <div class="col-md-3">
                            <div class="form-group">
                                <label> Hotel Check In Date (M/D eg.4/24) </label>
                                <input type="text" placeholder="Hotel Check-in Date" class="form-control" id="boref">
                            </div>
                            </div>
                            <div class="col-md-4">
                            <div class="form-group">
                                <label> Please Advise The Name Of Your Hotel </label>
                                <input type="text" placeholder="Your Hotel Name" onkeypress="return lettersOnly(event);" class="form-control" id="borem">
                            </div>
                            </div>
                    </div>
                    <hr>
                      <div class="col-md-12 offset-1" style="padding-left: 0px;">
                            <h3 style="font-size: large;font-weight: inherit;"> Payment </h3>
                            
                            <div class="checkbox">
                            <label class="">
                                <div >
                           <%--     <input type="checkbox" id="Check" class="i-check" onclick="javascript:selectedyes();" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;"></ins>--%>
                                </div> I have read and accept the rules and regulations. ( please tick to continue ) Terms and Conditions
                                <input id="Check" onclick="javascript:selectedyes();" type="checkbox" />
                  <%--              <asp:CheckBox ID="Check" onclick="javascript:selectedyes();" runat="server" />--%>
                            </label>
                        </div>
                     
                        <div style="text-align: center;padding-bottom: 15px;">
                            <input type="submit" id="submit" value="Final Checkout" class="btn btn-primary" onclick="conformation('<%=searchparam%>');" style="visibility: hidden;" /></div>

                        

                      </div>
                </div


                <%--<div class="col-md-2">
                    <div class="booking-item-payment">
                        <header class="clearfix">
                            <a class="booking-item-payment-img" href="#">
                                <img src="img/hotel_1_800x600.jpg" alt="Image not found" title="hotel 1" />
                            </a>
                            <h5 class="booking-item-payment-title"><a href="#">InterContinental New York Barclay</a></h5>
                            <ul class="icon-group booking-item-rating-stars">
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                                <li><i class="fa fa-star"></i>
                                </li>
                            </ul>
                        </header>
                        <ul class="booking-item-payment-details">
                            <li>
                                <h5>Booking for 7 nights</h5>
                                <div class="booking-item-payment-date">
                                    <p class="booking-item-payment-date-day">April, 26</p>
                                    <p class="booking-item-payment-date-weekday">Saturday</p>
                                </div><i class="fa fa-arrow-right booking-item-payment-date-separator"></i>
                                <div class="booking-item-payment-date">
                                    <p class="booking-item-payment-date-day">May, 3</p>
                                    <p class="booking-item-payment-date-weekday">Saturday</p>
                                </div>
                            </li>
                            <li>
                                <h5>Room</h5>
                                <p class="booking-item-payment-item-title">Club LVL Water View Dbl/Dbl Premier Room</p>
                                <ul class="booking-item-payment-price">
                                    <li>
                                        <p class="booking-item-payment-price-title">7 Nights</p>
                                        <p class="booking-item-payment-price-amount">$150<small>/per day</small>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="booking-item-payment-price-title">Taxes</p>
                                        <p class="booking-item-payment-price-amount">$15<small>/per day</small>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <p class="booking-item-payment-total">Total trip: <span>$1,155</span>
                        </p>
                    </div>
                </div>--%>

        </div>
           </div>

        </div> 
       
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/slimmenu.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/bootstrap-timepicker.js"></script>
        <script src="js/nicescroll.js"></script>
        <script src="js/dropit.js"></script>
        <script src="js/ionrangeslider.js"></script>
        <script src="js/icheck.js"></script>
        <script src="js/fotorama.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <script src="js/typeahead.js"></script>
        <script src="js/card-payment.js"></script>
        <script src="js/magnific.js"></script>
        <script src="js/owl-carousel.js"></script>
        <script src="js/fitvids.js"></script>
        <script src="js/tweet.js"></script>
        <script src="js/countdown.js"></script>
        <script src="js/gridrotator.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/switcher.js"></script>
        <script type="text/javascript">
        function conformation(values) {
            debugger;
            if (document.getElementById("email").value != "" && document.getElementById("email").value != null) 
            {
                var root = values.split("~");
                var arr = ""; var fna = ""; var lna = ""; var aage = ""; var passa = ""; var Nationa = ""; var salch = ""; var fnch = ""; var lnch = ""; var cage = ""; var passch = ""; var Nationch = "";
                var Phn = document.getElementById("Phn").value;
                var email = document.getElementById("email").value;
                var boref = document.getElementById("boref").value;
                var borem = document.getElementById("borem").value;
                debugger;
                var adult = root[1].split("^")[0];
                var child = root[1].split("^")[2];

                for (var i = 0; i < adult; i++) {
                    arr += document.getElementById("agend" + i).value + ",";
                    fnch += document.getElementById("afirstname" + i).value + ",";
                    lnch += document.getElementById("alastname" + i).value + ",";
                    cage += document.getElementById("aage" + i).value + ",";
                    passch += document.getElementById("apass" + i).value + ",";
                    Nationch += document.getElementById("anation" + i).value + ",";
                }

                for (var j = 0; j < child; j++) {
                    arr += document.getElementById("cgend" + j).value + ",";
                    fnch += document.getElementById("cfirstname" + j).value + ",";
                    lnch += document.getElementById("clastname" + j).value + ",";
                    cage += document.getElementById("cage" + j).value + ",";
                    passch += document.getElementById("cpass" + j).value + ",";
                    Nationch += document.getElementById("cnati" + j).value + ",";
                }

                var finaldata = arr + salch + '~' + fna + fnch + '~' + lna + lnch + '~' + aage + cage + '~' + passa + passch + '~' + Nationa + Nationch + '!' + Phn + '!' + email + '!' + boref + '!' + borem;
                window.location.href = ("ssbookingafterpayment.aspx?BookingDetails=" + finaldata);
            }

                }
                </script>
    </div> 
    
     <user:h1 ID="H1" runat="server" />
</body>

</html>
