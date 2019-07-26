<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register Src="ui_control/Footer.ascx" TagPrefix="uc2" TagName="uc_Footer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="https://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <title>
	Holidays, Packages, Hotel , Airline - Travstarz.com
</title>
<meta name="google-site-verification" content="2YNBES-0s78NnEhX2C-JIdM4RNGnXe0PhPsDgRNRRbk" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" type="image/png" href="http://in.rezb2b.com/img/new-travel-rez.png" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta name="keywords" content="Holidays, Indian Holidays, cheap vacation package, vacation package, honeymoon packages, cheap honeymoon, honeymoon hotel, best package, Holidays India, Tour and Travel in India, Holidays in India package" />
<meta name="description" content="Get best Discount on Flight booking, Hotel Booking online with Travstarz Global Group. Great way to grab cheap deals online, Holidays in India Tour and Travel India Holiday package family Holidays to India business tour in India honeymoon package in India" />
<meta property="og:url" content="http://www.travstarz.com/" />
<meta property="og:title" content="Travstarz Global Group - The Best Deals on Packages, Hotels and Flights" />
<meta property="og:site_name" content="Travstarz Global Group" />
<meta property="og:description" content="Deep Discounts on Packages, Holidays, Hotels and Flights.  Get Exclusive Savings with Travstarz Global Group" />
<meta property="og:image" content="http://in.rezb2b.com/img/new-travel-rez.png" />

    <link href="New_Css/Bootstrap.css" rel="stylesheet" />
 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" />
 
    <script src="New_Js/minjquery.js"></script>


    <script type="text/javascript">
        $(function () {
            $("#form1").validationEngine('attach', { promptPosition: "topRight" });
        });
    </script>
    <style type="text/css">
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            padding-top: 50px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.5);
        }

        .depuprepmodal-content1 {
            background-color: #fefefe;
            border: 1px solid #888;
            width: 30% !important;
            margin: 6% auto auto 35%;
            height: auto !important;
        }

        .close-txt {
            font-size: 27px;
        }

        .closediv {
            width: 35px !important;
            height: 35px;
            background: #d40a0a;
            color: #fff;
            border-radius: 50%;
            float: right;
            cursor: pointer;
        }

        .divclose {
            margin-right: 10px;
        }

        .color-red {
            font-size: 12px;
            font-family: Verdana;
            font-weight: bold
        }




        body{ background:#F6F4F5;}
 .box-cls{border:1px solid #ccc; background:#fff; padding-bottom:20px; border-radius:5px;}
 .head-cls{background:#92cd18; color: #fff; font-size: 16px; font-weight: bold; padding-bottom:8px; padding-top:8px; border-radius:5px 5px 0 0;}
 .list-cls{ padding-bottom:3px; padding-top:3px; text-align:center; background:#2C67B5; color:#fff}
  .width-wrap{width:94% !important; margin-left:3%}
  .mg_2 {padding: 6px 40px !important;}
  .mg_2:focus, .mg_2:focus + .fa {border-color:#92cd18; color:#92cd18;}
.mg_2:focus{ border:3px solid #92cd18}
.font-icon{font-size: 25px; left: 6%; position: absolute;top: 6px;color:#A9A9A9}
.font-icon:focus{color:#2C67B5}
.font-icon1{font-size: 20px; left: 6%; position: absolute;top: 7px;color:#A9A9A9}
.font-icon1:focus{color:#2C67B5}
.font-icon2{font-size: 18px; left: 6%; position: absolute;top: 8px;color:#A9A9A9}
.font-icon2:focus{color:#2C67B5}

 @media screen and (max-width:980px)
     {
         .font-icon{ margin-left:1%;}
         .font-icon1{ margin-left:1%;}
         .font-icon2{ margin-left:1%;}
         }
         
         @media screen and (max-width:620px)
     {
         .font-icon{ margin-left:2%;}
         .font-icon1{ margin-left:2%;}
         .font-icon2{ margin-left:2%;}
         }
         body {
    overflow-x: hidden;
}
        .clr_red
        {
            color: #d40a0a;
        }
        .font-12
        {
            font-size: 12px;
        }
        .corner-text
        {
            color: white;
            -webkit-transform: rotate(-45deg);
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -o-transform: rotate(-45deg);
            transform: rotate(-45deg);
            top: -50px;
            background-color: #ee0000;
            display: block;
            height: 100px;
            position: absolute;
            width: 100px;
            z-index: 999;
            right: -63px;
        }


        


/* Z-INDEX */
 .formError { z-index: 990; }
    .formError .formErrorContent { z-index: 991; }
    .formError .formErrorArrow { z-index: 996; }

    .ui-dialog .formError { z-index: 5000; }
    .ui-dialog .formError .formErrorContent { z-index: 5001; }
    .ui-dialog .formError .formErrorArrow { z-index: 5006; }




.inputContainer {
	position: relative;
	float: left;
}

.formError {
	position: absolute;
	top: 300px;
	left: 300px;
	display: block;
	cursor: pointer;
	text-align: left;
}

.formError.inline {
	position: relative;
	top: 0;
	left: 0;
	display: inline-block;
}

.ajaxSubmit {
	padding: 20px;
	background: #55ea55;
	border: 1px solid #999;
	display: none;
}

.formError .formErrorContent {
	width: 100%;
	background: #ee0101;
	position:relative;
	color: #fff;
	min-width: 120px;
	font-size: 11px;
	border: 2px solid #ddd;
	box-shadow: 0 0 6px #000;
	-moz-box-shadow: 0 0 6px #000;
	-webkit-box-shadow: 0 0 6px #000;
	-o-box-shadow: 0 0 6px #000;
	padding: 4px 10px 4px 10px;
	border-radius: 6px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	-o-border-radius: 6px;
}

.formError.inline .formErrorContent {
	box-shadow: none;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	-o-box-shadow: none;
	border: none;
	border-radius: 0;
	-moz-border-radius: 0;
	-webkit-border-radius: 0;
	-o-border-radius: 0;
}

.greenPopup .formErrorContent {
	background: #33be40;
}

.blackPopup .formErrorContent {
	background: #393939;
	color: #FFF;
}

.formError .formErrorArrow {
	width: 15px;
	margin: -2px 0 0 13px;
	position:relative;
}
body[dir='rtl'] .formError .formErrorArrow,
body.rtl .formError .formErrorArrow {
	margin: -2px 13px 0 0;
}

.formError .formErrorArrowBottom {
	box-shadow: none;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	-o-box-shadow: none;
	margin: 0px 0 0 12px;
	top:2px;
}

.formError .formErrorArrow div {
	border-left: 2px solid #ddd;
	border-right: 2px solid #ddd;
	box-shadow: 0 2px 3px #444;
	-moz-box-shadow: 0 2px 3px #444;
	-webkit-box-shadow: 0 2px 3px #444;
	-o-box-shadow: 0 2px 3px #444;
	font-size: 0px;
	height: 1px;
	background: #ee0101;
	margin: 0 auto;
	line-height: 0;
	font-size: 0;
	display: block;
}

.formError .formErrorArrowBottom div {
	box-shadow: none;
	-moz-box-shadow: none;
	-webkit-box-shadow: none;
	-o-box-shadow: none;
}

.greenPopup .formErrorArrow div {
	background: #33be40;
}

.blackPopup .formErrorArrow div {
	background: #393939;
	color: #FFF;
}

.formError .formErrorArrow .line10 {
	width: 15px;
	border: none;
}

.formError .formErrorArrow .line9 {
	width: 13px;
	border: none;
}

.formError .formErrorArrow .line8 {
	width: 11px;
}

.formError .formErrorArrow .line7 {
	width: 9px;
}

.formError .formErrorArrow .line6 {
	width: 7px;
}

.formError .formErrorArrow .line5 {
	width: 5px;
}

.formError .formErrorArrow .line4 {
	width: 3px;
}

.formError .formErrorArrow .line3 {
	width: 1px;
	border-left: 2px solid #ddd;
	border-right: 2px solid #ddd;
	border-bottom: 0 solid #ddd;
}

.formError .formErrorArrow .line2 {
	width: 3px;
	border: none;
	background: #ddd;
}

.formError .formErrorArrow .line1 {
	width: 1px;
	border: none;
	background: #ddd;
}


    </style>
    <script type="text/javascript">
        function Sendotp() {
        
            var oldpass = document.getElementById('oldpas').value.trim();
            if (oldpass == "") {
                alert("Please enter Old Password")
                return false;
            }
            var newpas = document.getElementById('newpas').value.trim();
            if (newpas == "") {
                alert("Please enter New Password")
                return false;
            } else if (newpas.length < 8) {
                alert("Your Password length should  be atleast 8 character long  cobination of Numbers, One Small Letter, One Capital Letter and Special character");
                return false;
            } else if (newpas.length > 15) {
                alert("Your Password length Should not exceed 15 Char");
                return false;
            } else if (newpas.search(/\d/) == -1) {
                alert("New Password Must Contains A Digit");
                return false;
            } else if (newpas.search(/[A-Z]/) == -1) {
                alert("New Password Must Contains A Capital Letter");
                return false;
            } else if (newpas.search(/[a-z]/) == -1) {
                alert("New Password Must Contains A Small Letter");
                return false;
            } else if (newpas.search(/[!"#$%&'()*+.\/:;<=>?@\[\\\]^_`{|}~-]/) == -1) {
                alert("New Password Must Contains A Special Character");
                return false;
            }
            var cnfpass = document.getElementById('cnfpass').value.trim();
            if (cnfpass == "") {
                alert("Please enter Confirm Password")
                return false;
            } else if (cnfpass.length < 8) {
                alert("Your Password length should  be atleast 8 character long  cobination of Numbers, One Small Letter, One Capital Letter and Special character");
                return false;
            } else if (cnfpass.length > 15) {
                alert("Your Password length Should not exceed 15 Char");
                return false;
            } else if (cnfpass.search(/\d/) == -1) {
                alert("Confirm Password Must Contains A Digit");
                return false;
            } else if (cnfpass.search(/[A-Z]/) == -1) {
                alert("Password Must Contains A Capital Letter");
                return false;
            } else if (cnfpass.search(/[a-z]/) == -1) {
                alert("Confirm Password Must Contains A Small Letter");
                return false;
            } else if (cnfpass.search(/[!"#$%&'()*+.\/:;<=>?@\[\\\]^_`{|}~-]/) == -1) {
                alert("Confirm Password Must Contains A Special Character");
                return false;
            }
            else if (newpas != cnfpass) {
                alert("New  Password and Confirm Password Doesnot match");
                return false;
            }
            msg = ''
            
        }
        function CheckPassword(e, obj) {
            debugger;
            var str = obj.value;
            if (str.length < 8) {
                alert("Your Password length should  be atleast 8 character long  cobination of Numbers, One Small Letter, One Capital Letter and Special character");
                return false;
            } else if (str.length > 15) {
                alert("Your Password length Should not exceed 15 Char");
                return false;
            } else if (str.search(/\d/) == -1) {
                alert("Password Must Contains A Numeric Digit");
                return false;
            } else if (str.search(/[A-Z]/) == -1) {
                alert("Password Must Contains A Capital Letter");
                return false;
            } else if (str.search(/[a-z]/) == -1) {
                alert("Password Must Contains A Small Letter");
                return false;
            } else if (str.search(/[!"#$%&'()*+.\/:;<=>?@\[\\\]^_`{|}~-]/) == -1) {
                alert("Password Must Contains A Special Character");
                return false;
            }
            else
                return true;
        }
        function isNumberKey(evt) {

            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                alert('Please Enter Only Numerical Value');
                return false;
            }
            return true;
        }
        function submitvalidation() {
            debugger;
            var otp = document.getElementById('txtotp').value;
            if (otp == "") {
                alert("Please enter OTP")
                return false;
            }
        }
        function closeupdate() {
            document.getElementById('updatepop').style.display = "none";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
      
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="col-md-12 col-sm-12 col-xs-12 offset-0 box-cls width-wrap m-top-20">
                <div class="col-md-12 col-sm-12 col-xs-12 offset-0">
                    <div class="col-md-12 col-sm-12 col-xs-12 head-cls text-center">
                        Change Password
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 offset-0">
                        <!------ Controls part--------------->
                        <div class="col-md-3 col-sm-3 col-xs-12 offset-0">
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                            <div class="col-md-12 col-sm-12 col-xs-12 offset-0 m-top-20">
                                <div class="col-md-4 col-sm-4 col-xs-12 m-top-5 font-12">
                                    <b>Old Password <span class="clr_red">*</span></b>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input id="oldpas" runat="server" class="form-control mg_2 validate[required]" placeholder="Enter Your Old Password"
                                        onclick="(this.value = '')" />
                                    <i class="fa fa-lock font-icon"></i>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12 offset-0 m-top-10">
                                <div class="col-md-4 col-sm-4 col-xs-12 m-top-5 font-12">
                                    <b>New Password <span class="clr_red">*</span></b>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <input id="newpas" runat="server" class="form-control mg_2 validate[required] password"
                                        placeholder="Enter Your New Password" type="password" onchange="return CheckPassword(event,this)"
                                        onclick="(this.value = '')" />
                                    <i class="fa fa-lock font-icon"></i>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12 offset-0 m-top-10">
                                <div class="col-md-4 col-sm-4 col-xs-12 m-top-5 font-12">
                                    <b>Confirm New Password <span class="clr_red">*</span></b>
                                </div>
                                <div class="col-md-8 col-sm-8 col-xs-12 offset-0">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <input id="cnfpass" runat="server" class="form-control mg_2 validate[required,equals[newpas]]"
                                            placeholder="Confirm New Password" type="password" onchange="return CheckPassword(event,this)"
                                            onclick="(this.value = '')" />
                                        <i class="fa fa-lock font-icon"></i>
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12 clr_red font-12">
                                        <ul style="padding-left: 15px;">
                                            <li>Your password length should be atleast 8 characters along with a combination of
                                            lower Case, uppercase, numeric and a special character.</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12 text-center m-top-20">
                                <img src="https://client.justclickkaro.com/jct/image/btn_gif.gif" id="gif" alt="" class="image_load" title="button" />
                              <%--  <input type="button" class="btn sub-btn ddclick_btn" value="Submit" onclick="return Sendotp()" />--%>
                                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn sub-btn ddclick_btn" OnClick="btnotp_Click"
                                OnClientClick="return Sendotp();" />
                            &nbsp; &nbsp;
                            <asp:Button ID="Button2" runat="server" Text="Back" class="btn sub-btn" OnClick="Button2_Click" />
                                <asp:Label ID="result" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <!------ Controls part  End--------------->
                    </div>
                </div>
            </div>
        </div>
        <div>
            <uc2:uc_Footer runat="server" ID="uc_Footer" />
     </div>
    </form>
</body>
</html>
<script type="text/javascript">
    function mouseoverPass(obj) {
        var obj = document.getElementById('newpas');
        obj.type = "text";
    }
    function mouseoutPass(obj) {
        var obj = document.getElementById('newpas');
        obj.type = "password";
    }
    function mouseoverPassn(obj) {
        var obj = document.getElementById('cnfpass');
        obj.type = "text";
    }
    function mouseoutPassn(obj) {
        var obj = document.getElementById('cnfpass');
        obj.type = "password";
    }

</script>
