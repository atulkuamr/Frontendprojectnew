<%@ Page Language="C#" MasterPageFile="~/Masterpages/MasterPageForNewReg.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="logincss/bootstrap-slider.css" rel="stylesheet" type="text/css" />
    <link href="logincss/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="logincss/bootstap-button.css" rel="stylesheet" type="text/css" />
    <link href="logincss/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="logincss/icomoon.css" rel="stylesheet" type="text/css" />
    <%--<link href="logincss/mystyles.css" rel="stylesheet" type="text/css" />--%>
    <link href="logincss/styles.css" rel="stylesheet" type="text/css" />
    <%--<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet'type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css' />--%>
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" /> <!-- /GOOGLE FONTS -->
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"  rel="stylesheet">
    <%--<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">--%>

    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link href="logincss/nexus.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        var clicked = false;
        function CheckBrowser() {
            if (clicked == false) {
                //Browser closed   
            } else {
                //redirected
                clicked = false;
            }
        }
        function bodyUnload() {
            debugger;
            if (clicked == false)//browser is closed  
            {
                var request = GetRequest();
                request.open("POST", "Logout.aspx?str=1", false);
                request.send();
            }
        }

        function GetRequest() {
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            return xmlhttp;
        } 
 
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link rel="stylesheet" href="logincss/index/css/lightbox.css">
    <link href="logincss/index/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="logincss/index/css/aos.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //animation effects-css-->
    <link href="logincss/index/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="logincss/index/css/font-awesome.css" rel="stylesheet">
    <!-- //googlefonts -->
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
    <style type="text/css">
    .Newsletter 
    {
        color:White;
        background:#2aace2;
        border-color:#2aace2;
    }
    .Newsletter:hover,
    .Newsletter:focus,
    .Newsletter.focus,
    .Newsletter:active
    {
        color:White;
        background:#26cc71;
        border-color:#26cc71;
    }
    .menu_bar{
	    font-weight: 600;
	    color: #777777;
	    text-decoration: none;
    }  
    .menu_bar:hover{
	    font-weight: 600;
	    color:#1f7ff0;
	    text-decoration: underline;
    }
    .row {
        margin-right: 0px;
        margin-left: 0px;
    }
    a {
        color: #777777;
        text-decoration: none;
    }
    a:hover, a:focus {
        color: #1f7ff0;
        text-decoration: underline;
    }
    body {margin:0}

    .panel-headingg {
        padding: 10px 15px;
        border-bottom: 1px solid transparent;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
    }
    .panel-default > .panel-headingg {
        color: #333;
        background-color: #f5f5f5;
        border-color: #ddd;
    }
    .icon-bar {
        width: 120px;
        background-color: #555;
    }
    .icon-bar a {
        display: block;
        text-align: center;
        padding: 16px;
        transition: all 0.3s ease;
        color: white;
        font-size: 25px;
    }
    .icon-bar a:hover {
        background-color: #000;
    }
    .active {
        background-color: #4CAF50 !important;
    }
    .contact input[type="text"], .contact input[type="email"] {
        width: 100%;
        color: #fff;
        float: left;
        background: none;
        outline: none;
        font-size: .9em;
        padding: .7em 1em;
        margin-bottom: 1.5em;
        border: none;
        border-bottom: solid 1px #fff;
        -webkit-appearance: none;
        display: inline-block;
    }
    .contact-form textarea {
        resize: none;
        width: 100%;
        background: none;
        color: #fff;
        font-size: .9em;
        outline: none;
        padding: .6em .8em;
        border: none;
        border-bottom: solid 1px #fff;
        min-height: 12em;
        -webkit-appearance: none;
    } 
    [class^="fa-"]:before,
    [class*=" fa-"]:before {
        font-family: FontAwesome;
        font-style: normal;
        font-weight: normal;
        line-height: 1;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        padding-right: 10px;
        color: white;
    }
    .input-icon {
        position: absolute;
        width: 19px;
        height: 21px;
        line-height: 22px;
        font-size: 16px;
        top: 3px;
        left: 2px;
        text-align: center;
        color: rgba(0, 0, 0, 0.79);
        -webkit-transition: 0.3s;
        -moz-transition: 0.3s;
        -o-transition: 0.3s;
        -ms-transition: 0.3s;
        transition: 0.3s;
        z-index: 2;
    }   
    /*@media (min -width: 400px)
    .agileits-banner-info h3 
    {
        text-shadow: 0 0 6px #111;
        font-family: "adelle",serif;
        font-size: 24px;
        font-weight: 700;
        width: 288px;
        color: #fff;


        text-shadow: 0 0 6px #111;
        font-family: "adelle",serif;
        font-size: 40px;
        font-weight: 700;
        color: #fff;
        width: 600px;
    }*/
    .agileits-banner-info h3 {
        text-shadow: 0 0 6px #111;
        font-family: "adelle",serif;
        font-size: 24px;
        font-weight: 700;
        width: 260px;
        color: #fff;
        text-align: center;
    }
    .agileits-banner-info h1 {
        text-shadow: 0 0 6px #111;
        font-family: "adelle",serif;
        font-size: 40px;
        font-weight: 700;
        width: 600px;
        color: #fff;
    
        /*border: 1px solid;
        text-align: center;
        line-height: 88px;*/
    }
    .service-icon {
        background: #008ec9;
        width: 60px;
        height: 57px;
        border-radius: 50%;
        position: absolute;
    }
    .fa_{
        text-shadow: none;
        font-size: 33px;
        color: #ffffff;
        background: #1f7ff0;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        text-align: center;
        line-height: 50px;
        display: inline-block;
        animation: bounce 3s ease infinite;
    }

    @media (min-width: 991px){
    .colmd3 {
        width: 30%;
        float: left;
        }
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
        function Numeric(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || k == 8 || k == 32 || (k >= 48 && k <= 57));
        }
    </script>
    <script type="text/javascript">
        function blockSpecialChar(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<body >
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"/> <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content" style="max-width:550px;"><%--width:550px;--%>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Sign up to stay in touch!</h4>
        </div>
        <div class="modal-body" ><%--style="height:280px;"--%>
                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <p >Email<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Text1" onblur="emailValidator(document.getElementById('ctl00_ContentPlaceHolder1_Text1'), 'Invalid Email-Id')" class="form-control" placeholder="Email" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <p >First Name<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Text2" onkeypress="return lettersOnly(event);" class="form-control" placeholder="First Name" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <p >Last Name<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Text3" onkeypress="return lettersOnly(event);" class="form-control" placeholder="Last Name" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md0">
                    </div>
                    <div class="col-md-4">
                        <p >Company Name<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Text4" class="form-control" placeholder="Company Name" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <p >Mobile No.<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Text5" onkeypress="return Numeric(event)" class="form-control" placeholder="Mobile No" runat="server" style="width:200px;"/>
                    </div>
                </div>
                <%-- <div class="col-md-5">
                            <asp:Label ID="Label2" runat="server" ForeColor="#003300"></asp:Label>
                    </div>--%>
                <asp:UpdatePanel ID="UpdatePanel4"  runat="server">
                <ContentTemplate>
                    <div class="col-md-12" style="text-align:center;">
                        <div class="col-md-5" id="align" style="display:none;"></div>
                        <input id="Button3" type="button" class="btn Newsletter" value="Send" style="width:100px;" onclick="sendMail();" runat="server"/>
                        <input id="Button2" type="button" class="btn btn-info" value="Send" style="display: none;" onserverclick="Subscribe" runat="server" />
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                <script type="text/javascript">
                    function sendMail() {
                        debugger;
                        if (document.getElementById('ctl00_ContentPlaceHolder1_Text1').value == "") {
                            alert("Please Enter Email..!");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_Text2').value == "") {
                            alert("Please Enter Name..!");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_Text3').value == "") {
                            alert("Please Enter Company Name");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_Text4').value == "") {
                            alert("Please Enter Mobile..!");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_Text5').value == "") {
                            alert("Please Enter Package Name..!");
                        }
                        else {
                            document.getElementById("ctl00_ContentPlaceHolder1_Label2").innerHTML = "<span style='color: red;'>Please wait..!</span>";
                            document.getElementById("ctl00_ContentPlaceHolder1_Label2").style.display = "block";
                            document.getElementById("ctl00_ContentPlaceHolder1_Button3").style.display = "none";
                            //document.getElementById("clse").click();
                            document.getElementById("ctl00_ContentPlaceHolder1_Button2").click();
                        }
                    };

                    function HideLabel() {
                        var seconds = 3;
                        debugger;
                        document.getElementById("ctl00_ContentPlaceHolder1_Button3").style.display = "none";
                        setTimeout(function () {
                            document.getElementById("<%=Label2.ClientID %>").style.display = "none";
                            document.getElementById("clse").click();
                        }, seconds * 1000);
                        btnShow();
                    };

                    function btnShow() {
                        var seconds = 5;
                        debugger;
                        setTimeout(function () {
                            document.getElementById("ctl00_ContentPlaceHolder1_Button3").style.display = "block";
                            document.getElementById("align").style.display = "block";
                            document.getElementById("align").style.textAlign = "center";

                            document.getElementById('ctl00_ContentPlaceHolder1_Text1').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Text2').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Text3').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Text4').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Text5').value = "";
                        }, seconds * 1000);
                    };
                </script>

            </div>
            <div class="modal-footer" style="border-top: 1px solid white;">
              <button id="clse" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
      </div>
    </div>
    </div>
    <!--head-->
    <div class="row" style="padding-top: 10px; padding-bottom: 10px;">
        <div class="col-md-1" style="width: 5%;"></div>
        <div class="col-md-3">
            <a>
            <asp:Image ID="ImgLogo" runat="server" style="width: 264px; height: 70px; margin: 5px;"/>
            </a>
        </div>
        <div class="col-md-8">
            <ul style="COLOR: white; list-style: none; display: inline-flex;float: right; padding: 26px; cursor: pointer;">
                <li><a id="hm" href="SearchPage.aspx" runat="server" class="menu_bar">HOME </a></li>&nbsp;&nbsp;&nbsp;
                    <a id="lg" href="loginpage1.aspx" runat="server" class="menu_bar">LOGIN</a>&nbsp;&nbsp;
                <li><a href="Aboutus.aspx" class="menu_bar">ABOUT US </a></li>&nbsp;&nbsp;&nbsp;
                <li><a class="menu_bar">CONTACT US</a></li>
            </ul>       
        </div>
        <div class="col-md-1">
        </div>
    </div>
    <!--head close-->

    <!-- contact-->
    <div class="contact" id="contact">
        <div class="container">
            <div class="heading">
                <h3 data-aos="zoom-in">
                    Get In Touch with Us</h3>
            </div>
        </div>
        <div class="Travelrez-grids">
            <div data-aos="flip-left" class="col-md-8 contact-left" style="min-height: 492px;">
            <h3 data-aos="zoom-in">Contact information</h3>
            </br >
                <div class="col-md-6">
                    <div class="contact-info">
                        <div class="contact-info-right">
                            <ul><li>Feel free to reach out to a staff person directly by email.</li></ul>
                        </div>
                    </div>
                    <div class="contact-info">
                        <div class="contact-info-right">
                            <h5>India Offices</h5>
                            <div id="ind_offices" runat="server">
                            <ul>                                
                                <li><asp:Label ID="LblIndia_Office" runat="server" Text=""></asp:Label></li>
                            </ul>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="contact-info">
                        <div class="contact-info-right">                            
                             <div id="Inter_Offices" runat="server">
                             <h5>International Offices</h5>
                            <ul>
                                <li>Thailand || Mauritius || UAE || Hong Kong || USA || China || Azerbaijan</li>
                            </ul>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="contact-info">
                        <div class="contact-info-left">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </div>
                        <div class="contact-info-right">
                            <h5>
                                E-Mail</h5>
                            <ul>
                                <li><a href=""><asp:Label ID="LblEmailID" runat="server" Text=""></asp:Label></a></li>
                            </ul>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="contact-info">
						<div class="contact-info-left">
							<i class="fa fa-map-marker" aria-hidden="true"></i>
						</div>
						<div class="contact-info-right">
							<h5>Address</h5>
                            <p>You can visit us at:</p>
                            <div id="address" runat="server">
                            <h5>Corporate Office:</h5>
                            <ul style="line-height: 12px; width: 363px;"><%--322px--%>
								<li>
                                    <i></i>Travstarz Holiday & Destinations Pvt. Ltd.
								</li>
								<li> 
                                    <i></i>Ground floor, 269, Udyog Vihar, Phase 4, Sector – 18, Gurugram - 122015, INDIA
								</li> 
                                <li>
                                    http://in.RezB2B.com
								</li>
                            </ul>
                            <br />
                            <h5>Mumbai Office:</h5>
                            <ul style="line-height: 12px; width: 363px;"><%--322px--%>
								<li>
                                    <i></i>Sumer Plaza Office no. 702, 7th floor, Marol Maroshi Road, Marol Andheri East Mumbai – 400059, India
								</li>
								<li>
                                    <i></i>+912262860900, (100 Lines)
								</li>
                            </ul>
                            <%--<h5>Kolkata Office:</h5>
                            <ul style="line-height: 12px; width: 363px;">
								<li>
                                    <i></i>42, Ushapally, Boral Main Road, Kolkata – 700084, India
								</li>
								<li>
                                    <i></i>+91-9317994078
								</li>
								<li>
                                    <i class="contact-info-right"></i>kolkata@travstarz.com
								</li>
                            </ul>--%>
                            </div>
                            <div id="Agent_Address" runat="server">
                                <asp:Label ID="LblAgent_Address" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="contact-info" style="margin: 16px 0px 10px 0px;">
                        <div class="contact-info-left">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                        </div>
                        <div class="contact-info-right">
                            <h5>Contact</h5>
                            <div id="contact_Details" runat="server">
                            <ul>
                                <li><asp:Label ID="LblContact_det" runat="server" Text=""></asp:Label></li>
                                <li><asp:Label ID="LblFax" runat="server" Text=""></asp:Label></li>
                            </ul>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <div data-aos="flip-right" class="col-md-4 contact-form">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <input id="tb_Name" onkeypress="return lettersOnly(event);" type="text" name="Name" placeholder="Name" runat="server"/>
                    <div class="clearfix"></div>
                    <input id="tb_email" onblur="emailValidator(document.getElementById('ctl00_ContentPlaceHolder1_tb_email'), 'Invalid Email-Id')" type="text" class="phone" name="phone" placeholder="Email" runat="server"/>
                    <input id="tb_phno" onkeypress="return Numeric(event)" type="text" name="Name" placeholder="Phone No" runat="server"/>
                    <textarea id="tb_Message" onkeypress="return blockSpecialChar(event)" placeholder="Message" name="Message" runat="server"></textarea>

                    <input id="Button1" type="button" class="btn btn-primary" value="SUBMIT" style="display:none;" onserverclick="btnSend_Click" runat="server"/>
                    <input id="Button5" type="button" class="btn btn-primary" value="SUBMIT" style="padding: 1em 3em; border-radius: 0px; float:right;" onclick="ContactMail();" runat="server"/>
                    <%--<asp:Button ID="Button5" CssClass="btn btn-primary" OnServerClick="sendMail();" runat="server" Text="SUBMIT" style="padding: 1em 3em; border-radius: 0px;"/>--%>
                    <%--<input type="submit" value="SUBMIT" onclick="btnSend_Click()" runat="server"            btnSend_Click/>--%>
                    <asp:Label ID="Label1" runat="server"></asp:Label>

                </ContentTemplate>
                </asp:UpdatePanel>   
                <script type="text/javascript">
                    function ContactMail() {
                        debugger;
                        if (document.getElementById('ctl00_ContentPlaceHolder1_tb_Name').value == "") {
                            alert("Please Enter Name..!");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_tb_email').value == "") {
                            alert("Please Enter Email..!");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_tb_phno').value == "") {
                            alert("Please Enter Phone No");
                        }
                        else {
                            document.getElementById("ctl00_ContentPlaceHolder1_Label1").innerHTML = "<span style='color:red; font-size:20px; font-weight:900;'>Please wait..!</span>";
                            document.getElementById("ctl00_ContentPlaceHolder1_Label1").style.display = "block";
                            document.getElementById("ctl00_ContentPlaceHolder1_Button5").style.display = "none";
                            //document.getElementById("clse").click();
                            document.getElementById("ctl00_ContentPlaceHolder1_Button1").click();
                        }
                    };

                    function Showbtn() {
                        var seconds = 3;
                        debugger;
                        setTimeout(function () {
                            document.getElementById("<%=Label1.ClientID %>").style.display = "none";

                            document.getElementById("ctl00_ContentPlaceHolder1_Button5").style.display = "block";

                            document.getElementById('ctl00_ContentPlaceHolder1_tb_Name').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_tb_email').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_tb_phno').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_tb_Message').value = "";
                        }, seconds * 1000);
                    };
                </script>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>
    <!-- end contact-->
    <!-- map -->
    <div class="map">
        <iframe src="" id="map" runat="server">
		</iframe>
    </div>
    <!-- end map -->
    <div class="row" style="margin-top:50px;margin-right: 0px;margin-left: 25px;margin-bottom: 40px;" id="affiliations" runat="server">
        <%--<div class="col-md-1" style="width:75px;">
        </div>--%>
        <div class="colmd3" style="text-align:center;">
            <h5 style="font-weight: bold;">Domestic Offices</h5>
            <h6>NEW DELHI&nbsp;|&nbsp;BENGALURU&nbsp;|&nbsp;MUMBAI&nbsp;|&nbsp;AHMEDABAD</h6>
        </div>

        <%-- <div class="col-md-1" style="width:30px;">
        </div>--%>

        <div class="col-md-5" style="text-align:center;">
            <h5 style="font-weight: bold;">International Offices</h5>
            <h6 style="font-weight: 600; color: #484545;">TRAVSTARZ GLOBAL DMC NETWORK</h6>
            <h6>THAILAND&nbsp;|&nbsp;MAURITIUS&nbsp;|&nbsp;UAE&nbsp;|&nbsp;HONG KONG&nbsp;|&nbsp;USA&nbsp;|&nbsp;CHINA&nbsp;|&nbsp;AZERBAIJAN</h6>
        </div>

        <%--<div class="col-md-1" style="width:49px;">
        </div>--%>
        <div class="col-md-3" style="text-align:center; width: 24%;display: initial;"><!--width: 485px; -->
            <h5 style="font-weight: bold;">Accreditation and Affiliation</h5>
            <h5 style="text-align:center;">
                <a><img src="logincss/img/ASTA.jpg" style="width:50px; height:27px;"/>&nbsp;</a>
                <a><img src="logincss/img/OTOAI.jpg" style="width:50px; height:27px;"/>&nbsp;&nbsp;</a>
                <a><img src="logincss/img/TAAI.jpg" style="width:40px; height:27px;"/>&nbsp;&nbsp;</a>
                <a><img src="logincss/img/ADTOI.jpg" style="width:40px; height:27px;"/></a>
                <a><img src="logincss/img/IAAI.jpg" style="width:40px; height:30px;"/>&nbsp;&nbsp;</a>

                <%--<a><img src="logincss/img/ETAA.jpg" style="width:44px; height:30px;"/>&nbsp;&nbsp;</a>--%>
                <%--<a><img src="logincss/img/IATA.jpg" style="width:45px; height:27px;"/>&nbsp;&nbsp;</a>--%>
                <%--<a><img src="logincss/img/TATO.jpg" style="width:44px; height:35px;"/></a>--%>
            </h5>
        </div>
    </div>
    <!-- subscribe -->
    <div class="agileits_Travelrez_banner_info">
        <div class="row">
            <div class="col-md-2"></div>
            <div data-aos="flip-right" class="col-md-4 subscribe-left"style="text-align:center; margin: 5px;"><%--display: initial;--%>
                <form action="#" method="post">
                    <button type="button" class="btn Newsletter" data-toggle="modal" data-target="#myModal" style="width:215px;" Font-Size="medium">Newsletter Signup</button>
                </form>
            </div>
            <div data-aos="flip-left" class="col-md-4 subscribe-right" style=" text-align:center; margin: 5px;">
                <img src="logincss/img/CreditMaster.jpg" style="width: 214px; height: 35px; border-radius: 3px;"/>  
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <!--subscribe -->

    <div class="row" style="margin-top: 25px; margin-bottom: 25px;" id="awards" runat="server"><!--width: 1038px;-->		
		<marquee behavior="alternate" direction="left" scrollamount="6" repeat onmouseover=this.stop(); onmouseout=this.start();>
            <ul >
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/1.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/2.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/3.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/7.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/6.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/9.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/10.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/11.jpeg"></a>
                </li>
                <li style="margin-right: -94px; padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/4.jpeg"></a>
                </li>

                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/1.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/2.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/3.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/7.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/6.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/9.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/10.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/11.jpeg"></a>
                </li>
                <li style="margin-right: -94px; padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/4.jpeg"></a>
                </li>

                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/1.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/2.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/3.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/7.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/6.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/9.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/10.jpeg"></a>
                </li>
                <li style="padding-left: 0px; padding-right: 0px;display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/11.jpeg"></a>
                </li>
                <li style="margin-right: -94px; padding-left: 0px; padding-right: 0px; display: inline-block;">
                    <a ><img class="award_img" src="logincss/img/award/4.jpeg"></a>
                </li>
            </ul>
        </marquee>	                       				
	</div>
    <script type="text/javascript" src="js/nicescroll.js"></script>
    <script src="logincss/index/js/lightbox-plus-jquery.min.js"> </script>
    <script type="text/javascript" src="logincss/index/js/jquery-2.1.4.min.js"></script>
    <script src="logincss/index/js/bootstrap.js"></script>
    <script src="logincss/index/js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 4
            $("#slider4").responsiveSlides({
                auto: true,
                pager: true,
                nav: false,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });

        });
    </script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 4
            $("#slider3").responsiveSlides({
                auto: true,
                pager: false,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });
        });
    </script>
    <script src="logincss/index/js/aos.js"></script>
    <script src="logincss/index/js/aos1.js"></script>
    <script src="logincss/index/js/SmoothScroll.min.js"></script>
    <script type="text/javascript" src="logincss/index/js/move-top.js"></script>
    <script type="text/javascript" src="logincss/index/js/easing.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $().UItoTop({ easingType: 'easeOutQuart' });
        });
    </script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
            });
        });
    </script>
    </form>
</body>
</asp:Content>
