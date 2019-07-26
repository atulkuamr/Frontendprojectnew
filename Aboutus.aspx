<%@ Page Language="C#" MasterPageFile="~/Masterpages/MasterPageForNewReg.master" AutoEventWireup="true" CodeFile="Aboutus.aspx.cs" Inherits="Aboutus" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="logincss/bootstrap-slider.css" rel="stylesheet" type="text/css" />
    <link href="logincss/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="logincss/bootstap-button.css" rel="stylesheet" type="text/css" />
    <link href="logincss/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="logincss/icomoon.css" rel="stylesheet" type="text/css" />
    <link href="logincss/styles.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" /> 
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"  rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="logincss/nexus.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        @media (max-width: 991px)
        {#contact1
            {
                display:none;
            }
            #contact2
            {
                display:block !important;
                padding-bottom:20px;
                font-weight: 600;
            }
        }
        @media (max-width: 991px)
        {#contact_padding
            {
                padding-left: 30px !important;
            }
        }
        @media (max-width: 400px)
        {
            #next_line
            {
                display:block !important;
            }
        }  
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
    </style>
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
    <link href="logincss/index/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="logincss/index/css/font-awesome.css" rel="stylesheet">
    <style type="text/css">
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

    <style type="text/css">
.sliderr
{

    height: 180px;
    width: 270px;
    display: inline-block;
    border-radius: 5px;
    margin: 0px 6px 0px 6px;
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
    font-size: 34px;
    font-weight: 700;
    width: 600px;
    color: #fff;
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
    font-size: 27px;
    color: #ffffff;
    background: #1f7ff0;
    border-radius: 50%;
    width: 45px;
    height: 45px;
    text-align: center;
    line-height: 50px;
    display: inline-block;
    animation: shak 3s ease infinite;
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
            debugger;
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
    <form id="form1">
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
                <li><a class="menu_bar">ABOUT US </a></li>&nbsp;&nbsp;&nbsp;
                <li><a href="contactus.aspx" class="menu_bar">CONTACT US</a></li>
            </ul>       
        </div>
        <div class="col-md-1">
        </div>
    </div>
    <!--head close-->
    <!-- about -->
	<div class="gallery" id="food" style="background-image: url(../img/slider-3.jpg) no-repeat 0px 0px;">
		<div class="heading">
			<h3 data-aos="zoom-in" >About Us</h3>
		</div>
		<div class="container" data-aos="flip-right" style="color: black;">
			<div id="About_travstarz" runat="server">            
            <p>Welcome to RezB2B.com where Travel is our Passion.</p>
            <br />
			<p>Established in <b>2009</b> and <b>acquired by RezB2B.com, </b> a <b>CTRIP  Subsidiary</b> in <b>2018</b> to launch the group’s <b>B2B business</b> in the Indian Sub-Continent and other adjoining regions, <b>Travstarz Global Group</b> is a <b>Multi-Award Winning Outbound DMC</b> and <b>Wholesaler & Consolidator</b> for <b>Hotels & Airlines</b> offering <b>Dedicated and Exclusive B2B</b> services in the Travel & Tourism Industry. With its state of the art <b>Online Global B2B Reservation System</b> now merged with <b>RezB2B.com, </b> it holds a dominant position selling exclusively to <b>Travel Agents, Tour Operators, MICE Organizers</b> and <b>Wedding Planners.</b> It is one of the most reputed and trusted Global B2B Travel Brand today. It is a recognized <b>IATA Agency</b> with its Head Quarters at <b>Delhi/NCR</b> and presence in <b>Mumbai, Bangalore, </b> and <b>Ahmedabad. </b> Besides the India Offices, it has its overseas DMC Offices at <b>Thailand, Mauritius, UAE, Hong Kong, China, Azerbaijan and USA.</b></p>
            <br />
            </div>
            <div id="About_Whitelabel" runat="server">
                <asp:Label ID="Lblabout_whitelabel" runat="server" Text="Label"></asp:Label>               
            </div>
		</div>
		<div class="clearfix"> </div>
	</div>
    <div class="about" id="about" runat="server">
        <div class="container">
            <div class="heading">
                <h2 data-aos="zoom-in">
                    Awards and Recognition</h2>
            </div>
            <div class="about-grids">
                <div data-aos="flip-right" class="col-md-3 aboutgrid1 ">
                    <img src="logincss/img/award/a2.png"  />
                    <h5 style="font-size: 16px;">Most Dynamic Brand of the Year</h5>
                    <h4>Times Network Presents National Awards For Marketing Excellence 2018</h4>
                </div>
                
                <div class="col-md-1" style="width: 11.333333%;"></div>

                <div data-aos="flip-right" class="col-md-3 aboutgrid1 ">
                    <img src="logincss/img/award/a3.png"  />
                    <h5 style="font-size: 16px;">Mr Pankaj Nagpal (CEO of the year)</h5>
                    <h4>ETnow Stars of the Industry awards in travel and tourism category 2018</h4>
                </div>
                
                <div class="col-md-1" style="width: 11.333333%;"></div>

                <div data-aos="flip-right" class="col-md-3 aboutgrid1">
                    <img src="logincss/img/award/a6.png"  />
                    <h5 style="font-size: 16px;">Ms Sucheta Nagpal (Woman CEO of the Year)</h5>
                    <h4 style="font-size: 22px;">5th Femina World Women Leadership Congress 2018</h4>
                </div>

                <div class="clearfix">
                </div>

                <div data-aos="flip-right" class="col-md-3 aboutgrid1 ">
                    <img src="logincss/img/award/a1.png"  />
                    <h5 style="font-size: 16px;">Most Dynamic Business Couple 2017</h5>
                    <h4>India Travel Awards Critics Award</h4>
                </div>

                <div class="col-md-1" style="width: 11.333333%;"></div>

                <div data-aos="flip-right" class="col-md-3 aboutgrid1 ">
                    <img src="logincss/img/award/a11.jpeg"  />
                    <h5 style="font-size: 16px;">Best Global Wholesaler</h5>
                    <h4>India Travel Awards 2016</h4>
                </div>

                <div class="col-md-1" style="width: 11.333333%;"></div>

                <div data-aos="flip-right" class="col-md-3 aboutgrid1">
                    <img src="logincss/img/award/Ministry.jpeg"  />
                    <h5 style="font-size: 16px;">Best Travel Management Company</h5>
                    <h4 style="font-size: 22px;">Ministry of Civil Aviation 2016</h4>
                </div>

                <div class="clearfix">
                </div>
                <div data-aos="slide-up" class="col-md-3 aboutgrid1">
                    <img src="logincss/img/award/a44.jpeg"  />
                    <h5 style="font-size: 16px;">Best Global Hotel Consolidator</h5>
                    <h4>Today's Traveller Awards 2016</h4>
                </div>

                <div class="col-md-1" style="width: 11.333333%;"></div>

                <div data-aos="slide-up" class="col-md-3 aboutgrid1">
                    <img src="logincss/img/award/a11.jpeg"  />
                    <h5 style="font-size: 16px;">Best Travel Management Company</h5>
                    <h4>India Travel Awards 2015</h4>
                </div>

                <div class="col-md-1" style="width: 11.333333%;"></div>

                <div data-aos="slide-up" class="col-md-3 aboutgrid1">
                    <img src="logincss/img/award/otm.jpeg"  />
                    <h5 style="font-size: 15px;">India's Top 100 Travel Producers Award</h5>
                    <h4>OTM - NDTV Profit Awards 2015</h4>
                </div>

                <div class="clearfix">
                </div>

                <div data-aos="slide-up" class="col-md-3 aboutgrid1">
                    <img src="logincss/img/award/a11.jpeg"  />
                    <h5 style="font-size: 16px;">Best Debut Travel Portal</h5>
                    <h4>India Travel Awards 2015</h4>
                </div>

                <div class="col-md-1" style="width: 11.333333%;"></div>

                <div data-aos="slide-up" class="col-md-3 aboutgrid1">
                    <img src="logincss/img/award/a11.jpeg"  />
                    <h5 style="font-size: 16px;">Entrepreneur of The Year</h5>
                    <h4>India Travel Awards 2015</h4>
                </div>

                <div class="col-md-1" style="width: 11.333333%;"></div>

                <div data-aos="slide-up" class="col-md-3 aboutgrid1">
                    <img src="logincss/img/award/a11.jpeg"  />
                    <h5 style="font-size: 16px;">Best Travel Management Company</h5>
                    <h4>India Travel Awards 2014</h4>
                </div>

                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>
    <!-- //Awards -->
    <!-- team -->
    <div class="team" id="team" runat="server">
        <div class="container">
            <div class="heading">
                <h3 data-aos="zoom-in">Team</h3>
            </div>
            <div class="agile_team_grids">
                <div data-aos="fade-up" class="col-md-3 agile_team_grid">
                    <div class="ih-item circle effect1">
                        <div class="spinner">
                        </div>
                        <div class="img">
                            <img src="logincss/team/a4.jpg"  class="img-responsive" /></div>
                        <div class="info">
                            <div class="info-back">
                                <h4>Mr. Pankaj Nagpal</h4>
                                <p>Managing Director</p>
                            </div>
                        </div>
                    </div>
                    <h4>Mr. Pankaj Nagpal</h4>
                </div>
                <div data-aos="slide-up" class="col-md-3 agile_team_grid">
                    <div class="ih-item circle effect1">
                        <div class="spinner">
                        </div>
                        <div class="img">
                             <img src="logincss/team/a3.jpg"   class="img-responsive" /></div>
                        <div class="info">
                            <div class="info-back">
                                <h4>Ms. Sucheta Nagpal</h4>
                                <p>Director & CEO</p>
                            </div>
                        </div>
                    </div>
                    <h4>Ms. Sucheta Nagpal</h4>
                </div>
                <div data-aos="slide-up" class="col-md-3 agile_team_grid t3">
                    <div class="ih-item circle effect1">
                        <div class="spinner">
                        </div>
                        <div class="img">
                             <img src="logincss/team/a2.jpg"  class="img-responsive" /></div>
                        <div class="info">
                            <div class="info-back">
                                <h4>Ms. Hema Manghnani</h4>
                                <p>Executive Director</p>
                            </div>
                        </div>
                    </div>
                    <h4>Ms. Hema Manghnani</h4>
                </div>
                <div data-aos="slide-up" class="col-md-3 agile_team_grid">
                    <div class="ih-item circle effect1">
                        <div class="spinner">
                        </div>
                        <div class="img">
                             <img src="logincss/team/a8.jpg"  class="img-responsive" /></div>
                        <div class="info">
                            <div class="info-back">
                                <h4>Mr. Ramanpreet Singh</h4>
                                <p>GM - India Sales</p>
                            </div>
                        </div>
                    </div>
                    <h4>Mr. Ramanpreet Singh</h4>
                </div>
                <div class="clearfix"></div>

                <div data-aos="slide-up" class="col-md-3 agile_team_grid">
                    <div class="ih-item circle effect1">
                        <div class="spinner">
                        </div>
                        <div class="img">
                             <img src="logincss/team/a5.jpg"  class="img-responsive" /></div>
                        <div class="info">
                            <div class="info-back">
                                <h4>Ms. Priyanka Puri</h4>
                                <p>General Manager Operations</p>
                            </div>
                        </div>
                    </div>
                    <h4>Ms. Priyanka Puri</h4>
                </div>
                <div data-aos="slide-up" class="col-md-3 agile_team_grid">
                    <div class="ih-item circle effect1">
                        <div class="spinner">
                        </div>
                        <div class="img">
                             <img src="logincss/team/a7.jpg"  class="img-responsive" /></div>
                        <div class="info">
                            <div class="info-back">
                                <h4>Ms. Vani Singh</h4>
                                <p>GM – Liasioning & Alliances</p>
                            </div>
                        </div>
                    </div>
                    <h4>Ms. Vani Singh</h4>
                </div>
                <div data-aos="slide-up" class="col-md-3 agile_team_grid">
                    <div class="ih-item circle effect1">
                        <div class="spinner">
                        </div>
                        <div class="img">
                             <img src="logincss/team/a9.jpg"  class="img-responsive" /></div>
                        <div class="info">
                            <div class="info-back">
                                <h4>Mr. Jatin Arora</h4>
                                <p>Manager Sales</p>
                            </div>
                        </div>
                    </div>
                    <h4>Mr. Jatin Arora</h4>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!--//team-->
    <div class="row" style="margin-top:50px;margin-right: 0px;margin-left: 25px;margin-bottom: 40px;" id="affiliations" runat="server">
        <div class="colmd3" style="text-align:center;">
            <h5 style="font-weight: bold;">Domestic Offices</h5>
            <h6>NEW DELHI&nbsp;|&nbsp;BENGALURU&nbsp;|&nbsp;MUMBAI&nbsp;|&nbsp;AHMEDABAD</h6>
        </div>
        <div class="col-md-5" style="text-align:center;">
            <h5 style="font-weight: bold;">International Offices</h5>
            <h6 style="font-weight: 600; color: #484545;">TRAVSTARZ GLOBAL DMC NETWORK</h6>
            <h6>THAILAND&nbsp;|&nbsp;MAURITIUS&nbsp;|&nbsp;UAE&nbsp;|&nbsp;HONG KONG&nbsp;|&nbsp;USA&nbsp;|&nbsp;CHINA&nbsp;|&nbsp;AZERBAIJAN</h6>
        </div>
        <div class="col-md-3" style="text-align:center; width: 22%;display: initial;"><!--width: 485px; -->
            <h5 style="font-weight: bold;">Accreditation and Affiliation</h5>
            <h5 style="text-align:center;">
                <a><img src="logincss/img/ASTA.jpg" style="width:50px; height:27px;"/>&nbsp;</a>
                <a><img src="logincss/img/OTOAI.jpg" style="width:50px; height:27px;"/>&nbsp;&nbsp;</a>
                <a><img src="logincss/img/TAAI.jpg" style="width:40px; height:27px;"/>&nbsp;&nbsp;</a>
                <a><img src="logincss/img/ADTOI.jpg" style="width:40px; height:27px;"/></a>
                <a><img src="logincss/img/IAAI.jpg" style="width:40px; height:30px;"/>&nbsp;&nbsp;</a>
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
    <div class="row" style="margin-top: 25px; margin-bottom: 25px;" ><!--width: 1038px;-->		
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
                </ul></marquee>	                       				
	</div>
  <!-- Modal -->
<form id="form2" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"/> 
<%--<div>
    <asp:TextBox ID="txtHTMLContent" runat="server" TextMode="MultiLine"/>
    </div>--%>
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
                    <input id="Button1" type="button" class="btn btn-info" value="Send" style="display: none;" onserverclick="Subscribe" runat="server" />
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
                        document.getElementById("ctl00_ContentPlaceHolder1_Button1").click();
                    }
                };

                function HideLabel() {
                    var seconds = 3;
                    document.getElementById("ctl00_ContentPlaceHolder1_Button3").style.display = "none";
                    setTimeout(function () {
                        document.getElementById("<%=Label2.ClientID %>").style.display = "none";
                        document.getElementById("clse").click();
                    }, seconds * 1000);
                    btnShow();
                };

                function btnShow() {
                    var seconds = 5;
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
</form>
  <!-- Modal -->
    <script type="text/javascript" src="js/nicescroll.js"></script>
    <script src="logincss/index/js/lightbox-plus-jquery.min.js"> </script>
    <script type="text/javascript" src="logincss/index/js/jquery-2.1.4.min.js"></script>
    <script src="logincss/index/js/bootstrap.js"></script>
    <script src="logincss/index/js/responsiveslides.min.js"></script>
    <script>
        $(function () {
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
        $(function () {
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
    </form>
</body>
</asp:Content>
