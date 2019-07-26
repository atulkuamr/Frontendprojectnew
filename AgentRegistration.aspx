<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AgentRegistration.aspx.cs" Inherits="AgentRegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/png" href="https://justclickkaro.com/image/fav-icon.png" />
    <title>B2B Agent Register
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <script src="RegImg/JS/min1.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" />

    <link href="RegImg/Css/Agentadd.css" rel="stylesheet" />
    <link href="RegImg/Css/UInew.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js" type="text/javascript"></script>

    <link href="RegImg/Css/Reg.css" rel="stylesheet" />
    <script src="RegImg/JS/Regval.js"></script>


    <script src="RegImg/JS/fmin.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />




    <style type="text/css">
        .ribbon1 {
            clear: both
        }

        .ribbon {
            clear: both;
            position: relative;
            background: #b4d034;
        }

        .ribbon {
            font-size: 14px;
            text-align: left;
            margin: 0 -15px;
            padding: 20px 21px;
            -moz-box-shadow: 0 2px 0 rgba(0,0,0,0.1);
            -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.1);
            -o-box-shadow: 0 2px 0 rgba(0,0,0,0.1);
            box-shadow: 0 2px 0 rgba(0,0,0,0.1);
            padding-top: 0px;
            padding-bottom: 29px;
            line-height: 28px;
            font-family: sans-serif;
        }

            .ribbon:before {
                content: " ";
                background: url(localhost:49942/RegImg/ribbonregi.png);
                display: block;
                width: 10px;
                height: 10px;
                position: absolute;
                bottom: 0;
                left: 0;
                margin-bottom: -10px;
                z-index: -1;
            }

            .ribbon:after {
                background: url(localhost:49942/RegImg/ribbonregi.png);
                right: 0;
                left: auto;
            }

        .width-wrap {
            width: 94% !important;
            margin: 0 auto;
            display: block;
        }

        .t_from1 {
            margin-right: 7px;
            color: #0557ab
        }

        .font-icont {
            left: 1%;
            position: absolute;
            top: 9px;
            color: #c34100;
            font-size: 14px !important
        }

        .font-icon6 {
            left: 8%;
            position: absolute;
            top: 9px;
            color: #c34100;
            font-size: 14px !important;
        }

        .font-icon1 {
            left: 2%;
            position: absolute;
            top: 7px;
            color: #c34100;
            font-size: 21px !important;
        }

        .font-icon {
            left: 2%;
            position: absolute;
            top: 9px;
            color: #c34100;
            font-size: 14px !important;
        }

        .font-icon2 {
            left: 6%;
            position: absolute;
            top: 9px;
            color: #c34100;
            font-size: 14px !important;
        }

        .form-control {
            margin-bottom: 5px;
            border: 1px solid #a2a2a2;
            border-radius: 0px;
        }

        .color-red {
            color: #d40a0a;
            font-size: 13px;
            font-weight: bold;
        }

        .tooltip .tooltiptext {
            height: 100% !important;
            width: 100% !important;
        }

        .tooltip .tooltiptext {
            height: 100% !important;
            width: 100% !important;
        }

        .tooltip .tooltiptext {
            width: 100% !important;
        }

        body {
            background-image: url('RegImg/info2.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }

        b {
            font-weight: 600;
            color: #444444;
            font-family: inherit
        }

        .box-cls {
            padding-bottom: 20px;
            border-radius: 0px;
            background-image: -webkit-linear-gradient( -30deg, rgb(255, 255, 255) 1%, rgba(224, 223, 222, 0.65) 46%, rgb(255, 255, 255) 75%);
            border: 1px solid #b4d034;
            box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
        }

        .head-cls {
            color: #fff;
            font-size: 16px;
            padding-bottom: 8px;
            padding-top: 8px;
            border-radius: 0;
            font-weight: normal;
            background: #b4d034;
            box-shadow: 0 1px 2px 0 rgba(0,0,0,.2), 0 1px 3px 0 rgba(0,0,0,.1);
            font-family: inherit;
        }

        .back-clr {
            background: none !important;
        }

        hr {
            margin-top: 22px;
            margin-bottom: 0px;
            border: 0;
            border-top: 1px solid #eee;
        }



        .form-control {
            box-shadow: none !important;
            margin-bottom: 0px !important
        }

        .tooltipsr {
            position: relative;
            display: inline-block;
        }

            .tooltipsr .tooltiptext {
                visibility: hidden;
                width: 100%;
                background-color: #2c67b5;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px 0;
                position: absolute;
                z-index: 99;
                bottom: 125%;
                left: 50%;
                margin-left: -60px;
                opacity: 0;
                transition: opacity 0.3s;
            }

                .tooltipsr .tooltiptext::after {
                    content: "";
                    position: absolute;
                    top: 100%;
                    left: 50%;
                    margin-left: -5px;
                    border-width: 5px;
                    border-style: solid;
                    border-color: #2c67b5 transparent transparent transparent;
                }

            .tooltipsr:hover .tooltiptext {
                visibility: visible;
                opacity: 1;
            }
    </style>
    <script type="text/javascript">
        try { function login() { window.parent.location.href = "Homepage.aspx"; } } catch (e) { }
    </script>
    <link href="RegImg/Css/Reg.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function () {

            setTimeout(function () {
                $('body').addClass('loaded');
                $('h1').css('color', '#fff')
            }, 100);

        });
    </script>

</head>
<body>
    <form id="form1" runat="server">






        <div class="container-fluid offset-0">
            <!----- Header Start------->

            <div class="col-md-12 col-sm-12 col-xs-12 offset-0 back-clr">

                <div class="col-md-12 col-sm-12 col-xs-12 offset-0">


                    <link rel="icon" type="image/png" href="https://justclickkaro.com/image/fav-icon.png" />

                    <link href="RegImg/Css/SliderD.css" rel="stylesheet" type="text/css" />

                    <link href="RegImg/Css/Reghome.css" rel="stylesheet" />
                    <link href="RegImg/Css/Regheader.css" rel="stylesheet" />

                    <link rel='stylesheet' href='//fonts.googleapis.com/css?family=Poppins%3A400%2C400%2C400%2C400%2C400%2C400%2C400&#038;ver=4.8.7' type='text/css' media='all' />
                    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins%3A300%2C400%2C500%2C600%2C700&#038;subset=latin%2Clatin-ext' type='text/css' media='all' />


                    <link href="RegImg/Css/Regpulging.css" rel="stylesheet" />
                    <link href="RegImg/Css/Reghome.css" rel="stylesheet" />
                    <link href="RegImg/Css/RegResponsive.css" rel="stylesheet" />



                    <script type="text/javascript">
                        function onlyNos(e, t) {
                            try {
                                if (window.event) { var charCode = window.event.keyCode; }
                                else if (e) { var charCode = e.which; }
                                else { return true; }
                                if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                                    alert("Only Numeric values allowed");
                                    return false;
                                }
                                return true;
                            } catch (err) { alert(err.Description); }

                        }

                    </script>
                    <script type="text/javascript">
                        function echeck(str) {
                            var at = "@"
                            var dot = "."
                            var lat = str.indexOf(at)
                            var lstr = str.length
                            var ldot = str.indexOf(dot)
                            if (str.indexOf(at) == -1) {
                                //alert("Invalid E-mail ID")
                                return false
                            }

                            if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) { return false }
                            if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) { return false }
                            if (str.indexOf(at, (lat + 1)) != -1) { return false }
                            if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                                return false
                            }
                            if (str.indexOf(dot, (lat + 2)) == -1) { return false }
                            if (str.indexOf(" ") != -1) { return false }
                            return true
                        }

                    </script>
                    <script src="RegImg/JS/bootstrapmin.js"></script>
                    <script src="RegImg/JS/Viewport.js"></script>
                    <script src="RegImg/JS/Btap.js"></script>


                    <script type="text/javascript">
                        $(function () {
                            //----- OPEN
                            $('[data-popup-open]').on('click', function (e) {
                                var targeted_popup_class = jQuery(this).attr('data-popup-open');
                                $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);

                                e.preventDefault();
                            });

                            //----- CLOSE
                            $('[data-popup-close]').on('click', function (e) {
                                var targeted_popup_class = jQuery(this).attr('data-popup-close');
                                $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
                                agntemail.value = "";
                                agentpwd.value = "";
                                Enteredcaptch.value = "";
                                e.preventDefault();
                            });
                        });</script>

                    <script>
                        window.onscroll = function () { myFunction() };

                        var header = document.getElementById("myHeader");
                        var sticky = header.offsetTop;

                        function myFunction() {
                            if (window.pageYOffset > sticky) {
                                header.classList.add("sticky");
                            } else {
                                header.classList.remove("sticky");
                            }
                        }
                    </script>


                </div>
            </div>
            <div class="clearfix"></div>
            <!----- Header End------->
            <input type="hidden" name="EUID" id="EUID" />
            <input type="hidden" name="HDNUserType" id="HDNUserType" />

            <div class="row" style="padding-top: 10px; padding-bottom: 10px;">
                <div class="col-md-1"></div>
                <div class="col-md-2" style="text-align: center;">
                    <a href="loginpage1.aspx">
                        <img src="img/new-travel-rez.png" alt="Image not found" style="width: 264px; max-width: 264px; height: 75px; margin: 5px;" />
                    </a>
                </div>
                <div class="col-md-8">
                    <ul style="color: white; list-style: none; display: inline-flex; float: right; padding: 26px; cursor: pointer;">
                        <li><a id="hm" href="SearchPage.aspx" runat="server" style="font-weight: 600;">HOME </a></li>
                        &nbsp;&nbsp;&nbsp;
                    <a id="lg" href="loginpage1.aspx" runat="server" style="font-weight: 600;">LOGIN</a>&nbsp;&nbsp;
                <li><a href="Aboutus.aspx" style="font-weight: 600;">ABOUT US </a></li>
                        &nbsp;&nbsp;&nbsp;
                <li><a href="contactus.aspx" style="font-weight: 600;">CONTACT US</a></li>
                    </ul>
                </div>
                <div class="col-md-1">
                </div>
            </div>


            <div id="demo-content">
                <div id="loader-wrapper" style="font-size: 29px; text-align: center">


                    <div class="loader-section section-left" style="padding-top: 0px; background-image: -webkit-linear-gradient( -30deg, rgb(36, 94, 153) 1%, rgb(40, 134, 226) 25%, rgb(63, 110, 172) 75%)">
                        <img src="RegImg/mainregistr.png" style="height: 318px;" alt="" title="" />
                        <h1>Welcome To</h1>
                    </div>
                    <div class="loader-section section-right" style="padding-top: 187px; background: #d53439; background-image: -webkit-linear-gradient( -30deg, rgb(188,0,21) 1%, rgb(235,61,80) 25%, rgb(188,0,21) 75%)">
                        <img src="RegImg/registernowr.gif" style="height: 120px;" alt="" title="" />
                        <h1>Travel Rez Online !</h1>
                    </div>

                </div>
                <div id="div_Login" class="container-fluid offset-0 back-clr">
                    <div class="box-cls width-wrap  m-top-20">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 head-cls text-center">
                            Agent Registration
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 offset-0 mn-div1">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10 offset-0 fade-in one">
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 m-top-20">
                                    <h1 class="ribbon">Contact Details</h1>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Email/UserID</b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="UserId" runat="server" class="form-control effect-9" MaxLength="50" placeholder="User ID"></asp:TextBox>

                                            <i class="fa fa-user font-icon"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Set Password<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="Password" runat="server" class="form-control effect-9" placeholder="Password"></asp:TextBox>
                                            <i class="fa fa-mobile font-icon1"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>First Name<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="FirstName" runat="server" class="form-control effect-9" onkeypress="return alpha(event)" MaxLength="30" placeholder="First Name"></asp:TextBox>

                                            <i class="fa fa-user font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Last Name<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="LastName" runat="server" class="form-control effect-9" onkeypress="return alpha(event)" MaxLength="30" placeholder="Last Name"></asp:TextBox>

                                            <i class="fa fa-user font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Mobile<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="Phone" runat="server" class="form-control effect-9" MinLength="10" onkeypress="return isNumberKey(event,this)" placeholder="Mobile Number"></asp:TextBox>

                                            <i class="fa fa-mobile font-icon1"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>


                                </div>

                            </div>
                            <div class="clearfix"></div>
                            <hr />
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10  fade-in two offset-0">
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 m-top-20">
                                    <h1 class="ribbon">Agency Details</h1>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div id="UpdatePanel1">

                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                                <b>User Type<span class="color-red">*</span></b>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                                <asp:DropDownList ID="LoginType" runat="server" class="form-control">
                                                </asp:DropDownList>
                                                <i class="fa fa-user font-icon"></i>
                                                <span class="focus-border">
                                                    <i></i>
                                                </span>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Company Name<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="AgencyName" runat="server" MaxLength="100" oncopy="return false" onpaste="return false" class="form-control effect-9" placeholder="Company Name"></asp:TextBox>

                                            <i class="fa fa-building font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <div id="ID_stateuapd">

                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                                <b>State<span class="color-red">*</span></b>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                                <asp:TextBox ID="State" runat="server" class="form-control effect-9" placeholder="State Name" onkeypress="return alpha(event)"></asp:TextBox>
                                                <i class="fa fa-building font-icon"></i>
                                                <span class="focus-border">
                                                    <i></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                                <b>City<span class="color-red">*</span></b>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                                <%--  <select name="City" id="City" class="form-control effect-9 validate[required]">
                                                </select>--%>
                                                <asp:TextBox ID="City" runat="server" class="form-control effect-9" placeholder="City Name" onkeypress="return alpha(event)"></asp:TextBox>

                                                <i class="fa fa-building font-icon"></i>
                                                <span class="focus-border">
                                                    <i></i>
                                                </span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Country<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:DropDownList ID="Country" runat="server" class="form-control">
                                            </asp:DropDownList>
                                            <i class="fa fa-globe font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-md-4 col-sm-5 col-xs-12 font-12 m-top-5">
                                            <b>Pincode<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="PinCode" runat="server" class="form-control effect-9" placeholder="PinCode" onkeypress="return isNumberKey(event,this)"></asp:TextBox>

                                            <i class="fa fa-map-marker font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Address<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="Address" runat="server" class="form-control effect-9 " placeholder="Address" MaxLength="600"></asp:TextBox>

                                            <i class="fa fa-home font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Designation<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="Designation" runat="server" MaxLength="100" oncopy="return false" onpaste="return false" class="form-control effect-9" placeholder="Designation"></asp:TextBox>

                                            <i class="fa fa-building font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>

                                </div>



                            </div>
                            <div class="clearfix"></div>
                            <hr />
                            <div id="gstdiv" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10  fade-in two offset-0">
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 m-top-20">
                                    <h1 class="ribbon">
                                        <input type="checkbox" id="chkgst" style="display: none" />
                                        GST Details</h1>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>GST No.</b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">


                                            <asp:TextBox ID="Gstno" runat="server" class="form-control effect-9" placeholder="GST Number"></asp:TextBox>
                                            <i class="fa fa-user font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>

                                </div>
                                <div class="clearfix"></div>
                                <hr />
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10  fade-in three offset-0" id="SpecificDivHide">
                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 m-top-20">
                                    <h1 class="ribbon">Other Details</h1>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5 offset-2">
                                            <b>Pan Card Name<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <input name="TxtPanname" type="text" maxlength="60" id="TxtPanname" class="form-control effect-9" onkeypress="return alpha(event)" placeholder="Pan Card Name" />
                                            <i class="fa fa-credit-card font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 offset-2 font-12 m-top-5">
                                            <b>Pan Card No<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">

                                            <asp:TextBox ID="Pancardno" runat="server" class="form-control" placeholder="Pan Card No"></asp:TextBox>
                                            <i class="fa fa-credit-card font-icon"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div id="UpdatePanel2">

                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 offset-0 m-top-10 font-12">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 m-top-10">
                                                <b>Profile Picture<span class="color-red">*</span></b>
                                            </div>


                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-8 offset-0">
                                                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control effect-9" />
                                            </div>

                                        </div>
                                    </div>
                                </div>



                                <div class="clearfix"></div>
                                <hr />

                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  m-top-10">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 offset-0 m-top-10">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 m-top-10 font-12 offset-2">
                                        <b>Company Logo</b>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">

                                        <div class="col-md-4 col-sm-4 col-xs-12" style="display: none">
                                            <img id="cmplog" class="img-responsive" alt="" src="" style="height: 80px; width: 80px; border: 1px solid #ccc;" />
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-xs-8 m-top-10 offset-0">
                                            <input type="file" name="FUCmpnyLogo" id="FUCmpnyLogo" />
                                        </div>
                                        <div>Note : We accept JPEG, PNG, GIF file formats with 20 kb 0r less than 20 kb and Dimension (250*50).</div>
                                    </div>
                                </div>

                            </div>



                            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 m-top-20">
                                <h1 class="ribbon">For White Lable  
                                    <input id="wl_ck" onclick="wl_valid()" type="checkbox" runat="server" /></h1>



                            </div>

                            <div id="wl" style="display: none; margin-bottom: 30px;">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Title/Logo Name</b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="Title" runat="server" MaxLength="50" class="form-control effect-9" placeholder="Title"></asp:TextBox>

                                            <i class="fa fa-user font-icon"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Support Email<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="SupportEmail" runat="server" class="form-control effect-9" MinLength="100" placeholder="SupportEmail"></asp:TextBox>
                                            <i class="fa fa-email font-icon1"></i>

                                        </div>
                                    </div>
                                </div>




                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Logo</b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:FileUpload ID="Logo" runat="server" class="form-control effect-9" />
                                            <i class="fa fa-file-image-o font-icon"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Slider Images<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:FileUpload ID="Slider_Images" AllowMultiple="true" runat="server" class="form-control  effect-9" />

                                            <i class="fa fa-file-image-o font-icon1"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Map Url</b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">


                                            <asp:TextBox ID="Map_Url" runat="server" class="form-control effect-9" placeholder="Map url"></asp:TextBox>

                                            <i class="fa fa-file-image-o font-icon"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>LinkedIn Url<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="LinkedIn_Url" runat="server" class="form-control effect-9" placeholder="LinkedIn Url"></asp:TextBox>
                                            <i class="fa fa-file-image-o font-icon1"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Support Ph. no.</b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="SupportPhone" runat="server" MaxLength="10" class="form-control effect-9" onkeypress="return isNumberKey(event,this)" placeholder="Support Phone"></asp:TextBox>

                                            <i class="fa fa-mobile font-icon"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Facebook Url<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="Facebook_Url" runat="server" class="form-control effect-9" MinLength="10" placeholder="Facebook Url"></asp:TextBox>
                                            <i class="fa fa-file-image-o font-icon1"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>Mobile no.</b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="Mobile_no" runat="server" MaxLength="10" class="form-control effect-9" placeholder="Mobile Number" onkeypress="return isNumberKey(event,this)"></asp:TextBox>

                                            <i class="fa fa-mobile font-icon"></i>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                            <b>About Us<span class="color-red">*</span></b>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                            <asp:TextBox ID="About_Us" runat="server" TextMode="MultiLine" class="form-control effect-9" placeholder="About Us"></asp:TextBox>
                                            <i class="fa fa-mobile font-icon1"></i>
                                            <span class="focus-border">
                                                <i></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>









                            </div>





                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-20 ui checkbox">
                                    <input type="checkbox" name="agree" id="Check" />
                                    <span id="agreetxt" style="cursor: pointer">I have read and accepted</span>

                                    <a target="popup" class="crsr-pntr font-12" target="popup" onclick="window.open('Registerterms.htm','name','width=800,height=400,scrollbars=1')">Terms & Conditions</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-20 text-center">


                            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 m-top-20 text-center"></div>
                            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 m-top-20 text-center">
                                <asp:Button ID="Submit" Text="Submit" class="btn btn-primary sub-btnb" runat="server"
                                    OnClick="submit_Click" OnClientClick="return validateallfields()" />
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 m-top-20 text-center"></div>


                        </div>
                        <div class="clearfix"></div>


                    </div>

                </div>
        </div>


        <!--------- Footer start-------->
        <div class="col-md-12 col-sm-12 col-xs-12 offset-0">


            <link href="RegImg/Css/com.css" rel="stylesheet" />





            <div class="affiliatediv m-top-20">
                <div class="container divcntr">
                    <div class="affillogocls1">
                        <div class="afillogo1"></div>
                    </div>
                    <div class="affillogocls">
                        <div class="afillogo2"></div>
                    </div>
                    <div class="affillogocls">
                        <div class="afillogo3"></div>
                    </div>
                    <div class="affillogocls">
                        <div class="afillogo4"></div>
                    </div>
                    <div class="affillogocls">
                        <div class="afillogo5"></div>
                    </div>
                    <div class="affillogocls">
                        <div class="afillogo6"></div>
                    </div>
                    <div class="affillogocls">
                        <div class="afillogo7"></div>
                    </div>
                    <div class="affillogocls">
                        <div class="afillogo8"></div>
                    </div>
                </div>
            </div>


            <script type="text/javascript">
                try {

                    (function (i, s, o, g, r, a, m) {
                        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                            (i[r].q = i[r].q || []).push(arguments)
                        }, i[r].l = 1 * new Date(); a = s.createElement(o),
                            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
                    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
                    ga('create', 'UA-105997184-1', 'auto');
                    ga('send', 'pageview');
                    ga('set', 'userId', 'USER_ID');
                    var dimensionValue = 'SOME_DIMENSION_VALUE';
                    ga('set', 'dimension1', dimensionValue);

                } catch (e) {

                }
            </script>
            <script type="text/javascript" defer="defer">
                var _gaq = _gaq || [];
                _gaq.push(
                    ['_setAccount', 'UA-105997184-1'],
                    ['_setCustomVar', 1, 'IP', "<?php echo $_SERVER['REMOTE_ADDR']; ?>", 2],
                    ['_trackPageview']
                );
                (function () {
                    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
                })();
            </script>

        </div>
        <!--------- Footer end-------->
    </form>
    <script type="text/javascript">
        $('#FUShopPhoto').filestyle({
            buttonName: 'btn-danger',
            buttonText: '&nbsp;Choose File'
        });
        $('#INFUShopPhoto').filestyle({
            buttonName: 'btn-danger',
            buttonText: '&nbsp;Choose File'
        });
        $('#FUAgencyProof').filestyle({
            buttonName: 'btn-danger',
            buttonText: '&nbsp;Choose File'
        });
        $('#FUCmpnyLogo').filestyle({
            buttonName: 'btn-danger',
            buttonText: '&nbsp;Choose File'
        });

        $('#FUAddress').filestyle({
            buttonName: 'btn-danger',
            buttonText: '&nbsp;Choose File'
        });


        $('#FUPanCardCopy').filestyle({
            buttonName: 'btn-danger',
            buttonText: '&nbsp;Choose File'
        });
    </script>


    <script type="text/javascript">
        function wl_valid() {
            debugger;
            var wl_ckbox = document.getElementById("wl_ck");
            debugger;
            if (wl_ckbox.checked == true) {
                document.getElementById('wl').style.display = "block";
            }
            else {
                document.getElementById('wl').style.display = "none";
            }
        }
    </script>







    <script type="text/javascript">


        function validateallfields() {
            debugger;

            try {
                var msg = "";
                //if (document.getElementById('agreetxt').checked == false) {
                //    alert("Please Accept the Policy");
                //    return false;
                //}



                if (document.getElementById('UserId').value !== "") {

                }
                else {
                    msg = "Please enter Email/UserID ";
                }

                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                if (!filter.test(document.getElementById('UserId').value.trim())) {
                    alert('Please provide a valid email address')
                    return false;
                }


                if (document.getElementById('Password').value == "") {
                    msg += "Please enter password  \n";
                }
                if (document.getElementById('FirstName').value == "") {
                    msg += "Please enter First Name \n";
                }

                if (document.getElementById('LastName').value == "") {
                    msg += "Please enter Last Name \n";
                }
                if (document.getElementById('Phone').value == "") {
                    msg += "Please enter phone number  \n";
                }
                if (document.getElementById('AgencyName').value == "") {
                    msg += "Please enter Agency name \n";
                }
                if (document.getElementById('State').value == "") {
                    msg += "Please enter State \n";
                }
                if (document.getElementById('City').value == "") {
                    msg += "Please enter city \n";
                }
                if (document.getElementById('Country').value == "") {
                    msg += "Please enter Country \n";
                }
                if (document.getElementById('Address').value == "") {
                    msg += "Please enter Address  \n";
                }

                if (document.getElementById('Gstno').value == "") {
                    msg += "Please enter Gst Number  \n";
                }

                if (document.getElementById('TxtPanname').value == "") {
                    msg += "Please enter pan card name   \n";
                }

                if (document.getElementById('Pancardno').value == "") {
                    msg += "Please enter pan card number  \n";
                }


                if (Pancardno.value.trim() == "") {
                    alert("Please enter Pan Number")
                    return false;
                }

                if (Pancardno.value.trim() == null) Pancardno.value.trim() = window.event.srcElement;
                if (Pancardno.value.trim() != "") {
                    var ObjVal = Pancardno.value.trim().toUpperCase();
                    var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
                    var code = /([C,P,H,F,A,T,B,L,J,G])/;
                    var code_chk = ObjVal.substring(3, 4);
                    if (ObjVal.search(panPat) == -1) {
                        alert("Invalid Pan No");
                        return false;
                    }
                    if (code.test(code_chk) == false) {
                        alert("Invaild PAN Card No.");
                        return false;
                    }
                }


                if (document.getElementById('PinCode').value == "") {
                    msg += "Please enter PinCode  \n";
                }



            } catch (e) {

            }

            if (msg != "") {
                alert(msg);
                return false;
            } else {
                return true;
            }

        }


    </script>

</body>
</html>
