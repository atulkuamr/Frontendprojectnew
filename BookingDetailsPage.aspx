<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookingDetailsPage.aspx.cs" Inherits="BookingDetailsPage" %>

<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<%@ Register Src="~/header.ascx" TagPrefix="user" TagName="head" %>
<%@ Register Src="ui_control/Footer.ascx" TagPrefix="uc2" TagName="uc_Footer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
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
    <link rel="stylesheet" href="css/font-awesome.css" />

    <style type="text/css">
        .container {
            width: 1300px !important;
        }

        .sizep {
            font-size: 15px;
            padding: 10px;
        }

        .emaildiv {
            margin-bottom: 20px;
            background: #ececec;
            margin-top: 16px;
            padding: 20px;
        }

        .ff {
            cursor: pointer;
        }
    </style>
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
    <style type="text/css">
        .danger {
            background-color: #ffecec; /*#ffdddd*/
            border-left: 6px solid #f44336;
            margin-bottom: 15px;
            padding: 4px 0px 4px 12px;
        }

        .stopdiv {
            background: #f8f6f6;
            text-align: center;
            padding: 6px;
        }

        .modalDialog {
            position: fixed;
            font-family: Arial, Helvetica, sans-serif;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0,0,0,0.8);
            z-index: 99999;
            opacity: 0;
            -webkit-transition: opacity 400ms ease-in;
            -moz-transition: opacity 400ms ease-in;
            transition: opacity 400ms ease-in;
            pointer-events: none;
        }

        .back {
            background: #d4050b !important;
            padding: 2px 8px !important;
            color: #fff !important;
        }

        .modalDialog:target {
            opacity: 1;
            pointer-events: auto;
        }

        .modalDialog > div {
            width: 50%;
            height: 80%;
            overflow-x: hidden;
            overflow-y: scroll;
            position: relative;
            margin: 3% auto;
            padding: 0px;
            /*padding: 5px 20px 13px 20px;*/
            border-radius: 10px;
            background: #fff;
            background: -moz-linear-gradient(#fff, #999);
            background: -webkit-linear-gradient(#fff, #999);
            background: -o-linear-gradient(#fff, #999);
        }

        .red-btn {
            background: #d4050b !important;
            padding: 6px 20px !important;
            color: #fff !important;
            border-radius: 2px;
            margin-top: 8px;
            margin-bottom: 8px;
        }

        .close {
            background: #0e0e0e !important;
            color: #FFFFFF !important;
            line-height: 25px !important;
            position: absolute !important;
            right: 8px !important;
            text-align: center !important;
            top: 6px !important;
            width: 24px !important;
            text-decoration: none !important;
            font-weight: bold !important;
            -webkit-border-radius: 12px;
            -moz-border-radius: 12px;
            border-radius: 12px !important;
            -moz-box-shadow: 1px 1px 3px #000;
            -webkit-box-shadow: 1px 1px 3px #000;
            box-shadow: 1px 1px 3px #000 !important;
        }

        .prizedetails {
            background: #f8f6f6;
            padding: 5px;
            color: #d63b05;
            font-size: 18px;
            height: 35px;
            line-height: 24px;
            font-weight: bold;
        }

        .close:hover {
            background: #00d9ff !important;
            opacity: 1 !important;
        }

        .passize {
            font-weight: bold;
        }

        .traveldetails {
            width: 100%;
            float: left;
            padding-left: 2%;
            font-size: 18px;
            color: #1a1a1a;
            height: 50px;
            line-height: 50px;
            background: #f8f6f6;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
        }


        .travelins {
            width: 100%;
            float: left;
            padding-left: 2%;
            font-size: 14px;
            color: #1a1a1a;
            height: 22px;
            background: #f8f6f6;
        }


        .adtulsdiv {
            width: 12%;
            float: left;
            font-size: 14px;
            color: #1a1a1a;
            height: 44px;
            line-height: 44px;
            font-weight: bold;
            padding-top: 20px;
            padding-left: 2%;
        }
    </style>
</head>
<body id="scroll">
    <form id="Form1" runat="server">
        <user:head ID="header" runat="server" />
        <!-- FACEBOOK WIDGET -->
        <div id="fb-root"></div>
        <script type="text/javascript"> 
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));


            function Formvalidate() {
             
                debugger;
                var count = 1;
                var adtcount = <%=adtcount%>
    var chdcount = <%=chdcount%>
    var infcount = <%=infcount%>

              
                    var check1 = '<%=domestic_check1%>';
                var check2 = '<%=domestic_check2%>';


                var Adtstring = ""; var chdstring = ""; var infstring = "";
                var email = document.getElementById('Email').value;
                var phone = document.getElementById('Phone').value;



                var adtarr = new Array(74);
                for (j = 0; j < adtcount; j++) {


                    if (document.getElementById('txtadultSex' + count).value != "Title") {
                        if (document.getElementById('txtadultSex' + count).value == "") {
                            alert("Please Select Adult Title");
                            document.getElementById('txtadultSex' + count).focus();
                            return false;
                        }
                        else {
                            Adtstring = document.getElementById('txtadultSex' + count).value;
                        }
                    } else {
                        alert("Please Select Adult Title");
                        document.getElementById('txtadultSex' + count).focus();
                        return false;
                    }





                    if (document.getElementById('txtadultName' + count) != null) {
                        if (document.getElementById('txtadultName' + count).value == "") {
                            alert("Please Enter First Name");
                            document.getElementById('txtadultName' + count).focus();
                            return false;
                        }
                        else {
                            adtarr[j] = Adtstring + " " + document.getElementById('txtadultName' + count).value;
                        }
                    }
                    if (document.getElementById('txtadultSurName' + count) != null) {
                        if (document.getElementById('txtadultSurName' + count).value == "") {
                            alert("Please Enter Last Name");
                            document.getElementById('txtadultSurName' + count).focus();
                            return false;
                        }
                        else {
                            adtarr[j + 9] = document.getElementById('txtadultSurName' + count).value;
                        }
                    }
                    if (document.getElementById('txtadultDOB' + count) != null) {
                        if (document.getElementById('txtadultDOB' + count).value == "") {
                            alert("Please Enter Adult Date Of Birth");
                            document.getElementById('txtadultDOB' + count).focus();
                            return false;
                        }
                        else {
                            var tmp = document.getElementById('txtadultDOB' + count).value.split('/');
                            var convertdate = tmp[1] + '/' + tmp[0] + '/' + tmp[2];
                            adtarr[j + 18] = convertdate;
                        }
                    }
                    if (document.getElementById('txtadultPass' + count) != null && document.getElementById('txtadultPass' + count).value) {
                        if (document.getElementById('txtadultExpiry' + count) != null && document.getElementById('txtadultExpiry' + count).value != "") {
                            if (document.getElementById('txtadultPass' + count).value != "" && document.getElementById('txtadultExpiry' + count).value != "") {
                                var tmp = document.getElementById('txtadultExpiry' + count).value.split('/');
                                var convertdate = tmp[1] + '/' + tmp[0] + '/' + tmp[2];
                                adtarr[j + 27] = convertdate + ":" + document.getElementById('txtadultPass' + count).value;
                            }
                            //                        else
                            //                        {
                            //                            alert("Please select expiry Date");
                            //                            document.getElementById('txtadultExpiry' + count).focus();
                            //                            return false;
                            //                        }                   
                        }
                    }
                    count = count + 1;
                }
                if (chdcount > 0) {
                    countc = 0;
                    for (c = 0; c < chdcount; c++) {
                        if (document.getElementById('chdsex' + countc).value != null) {
                            Adtstring = document.getElementById('chdsex' + countc).value;
                        }
                        //                    if (document.getElementById('chdsexFemale' + count) != null) {
                        //                        Adtstring = "F";
                        //                    }



                        if (document.getElementById('chdsex' + countc).value != "Title") {
                            if (document.getElementById('chdsex' + countc).value == "") {
                                alert("Please Select Child Title");
                                document.getElementById('chdsex' + countc).focus();
                                return false;
                            }
                            else {
                                Adtstring = document.getElementById('chdsex' + countc).value;
                            }
                        } else {
                            alert("Please Select child Title");
                            document.getElementById('chdsex' + countc).focus();
                            return false;
                        }









                        if (document.getElementById('txtchdname' + countc) != null) {
                            if (document.getElementById('txtchdname' + countc).value == "") {
                                alert("Please Enter Child First Name");
                                document.getElementById('txtchdname' + countc).focus();
                                return false;
                            }
                            else {
                                adtarr[c + 36] = Adtstring + " " + document.getElementById('txtchdname' + countc).value;
                            }
                        }
                        if (document.getElementById('txtchdsurname' + countc) != null) {
                            if (document.getElementById('txtchdsurname' + countc).value == "") {
                                alert("Please Enter Child Last Name");
                                document.getElementById('txtchdsurname' + countc).focus();
                                return false;
                            }
                            else {
                                adtarr[c + 40] = document.getElementById('txtchdsurname' + countc).value;
                            }
                        }
                        if (document.getElementById('txtdob' + countc) != null) {
                            if (document.getElementById('txtdob' + countc).value == "") {
                                alert("Please Select Child Date Of Birth");
                                document.getElementById('txtdob' + countc).focus();
                                return false;
                            }
                            else {
                                var tmp = document.getElementById('txtdob' + countc).value.split('/');
                                var convertdate = tmp[1] + '/' + tmp[0] + '/' + tmp[2];
                                adtarr[c + 44] = convertdate;
                            }
                        }

                        if (document.getElementById('txtexpiry' + countc) != null && document.getElementById('txtexpiry' + countc).value != "") {
                            if (document.getElementById('txtpassport' + countc) != null) {
                                //                            if(document.getElementById('txtpassport' + count).value=="")
                                //                            {
                                //                                alert("Please Select Expiry date ")
                                //                                document.getElementById('txtexpiry' + count).focus();
                                //                            }
                                //                            else
                                //                            {   
                                var tmp = document.getElementById('txtexpiry' + countc).value.split('/');
                                var convertdate = tmp[1] + '/' + tmp[0] + '/' + tmp[2];
                                adtarr[c + 48] = convertdate;
                                //                            }
                            }
                        }
                        countc = countc + 1;
                    }
                }
                if (infcount > 0) {
                    countI = 0;
                    for (i = 0; i < infcount; i++) {


                        if (document.getElementById('infage' + countI).value != "Title") {
                            if (document.getElementById('infage' + countI).value == "") {
                                alert("Please select infant title");
                                document.getElementById('infage' + countI).focus();
                                return false;
                            }
                            else {
                                Adtstring = document.getElementById('infage' + countI).value;
                            }
                        } else {
                            alert("Please select infant title");
                            document.getElementById('infage' + countI).focus();
                            return false;
                        }

                        if (document.getElementById('txtinfName' + countI) != null) {
                            if (document.getElementById('txtinfName' + countI).value == "") {
                                alert("Please enter infant first name");
                                document.getElementById('txtinfName' + countI).focus();
                                return false;
                            }
                            else {
                                adtarr[i + 56] = Adtstring + " " + document.getElementById('txtinfName' + countI).value;
                            }
                        }
                        if (document.getElementById('txtinfsurName' + countI) != null) {
                            if (document.getElementById('txtinfsurName' + countI).value == "") {
                                alert("Please enter infant first name");
                                document.getElementById('txtinfsurName' + countI).focus();
                                return false;
                            }
                            else {
                                adtarr[i + 58] = document.getElementById('txtinfsurName' + countI).value;
                            }
                        }
                        if (document.getElementById('txtinfDob' + countI) != null) {
                            if (document.getElementById('txtinfDob' + countI).value == "") {
                                alert("Please Select Infant Date Of Birth");
                                document.getElementById('txtinfDob' + countI).focus();
                                return false;
                            }
                            else {
                                var age = getAge(document.getElementById('txtinfDob' + countI).value);
                                if (age > 2) {
                                    alert("please select Infant must be less than 2 year");
                                    document.getElementById('txtinfDob' + countI).focus();
                                    return false;
                                } else {
                                    var tmp = document.getElementById('txtinfDob' + countI).value.split('/');
                                    var convertdate = tmp[1] + '/' + tmp[0] + '/' + tmp[2];

                                    adtarr[i + 60] = convertdate;
                                }
                            }
                        }
                        countI = countI + 1;
                    }
                    //count = count + 1;         
                }
                adtarr[72] = email; adtarr[73] = phone;




                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                if (!filter.test(email.trim())) {
                    alert('Please provide a valid email address')
                    return false;
                }



                if (email == null || email == "") {
                    alert('Please provide valid email address');

                    return false;
                }

                if (phone == null || phone == "") {
                    alert('Please provide phone number');
                    return false;
                }

                if (check1 == "D" && check2 == "D") {

                    if ($(':checkbox:checked').prop('checked') == true) {

                        var Addr = document.getElementById("Address").value;
                        var cit = document.getElementById("city").value;
                        var distric = document.getElementById("district").value;
                        var stat = document.getElementById("state").value;
                        var Pincod = document.getElementById("Pincode").value;
                        if (Addr == "" || Addr == null) {
                            alert('Please Fill Address for Insurance');
                            return false;
                        }
                        else if (cit == "" || cit == null) {
                            alert('Please Fill city for Insurance');
                            return false;
                        }
                        else if (distric == "" || distric == null) {
                            alert('Please Fill district for Insurance');
                            return false;
                        }
                        else if (stat == "" || stat == null) {
                            alert('Please Fill state for Insurance');
                            return false;
                        }
                        else if (Pincod == "" || Pincod == null) {
                            alert('Please Fill Pin Code for Insurance');
                            return false;
                        }
                    }
                }

                ShowProgressAnimation();

                var Address = document.getElementById('Address').value;//Shashank
                var city = document.getElementById('city').value;//Shashank
                var district = document.getElementById('district').value;//Shashank
                var State = document.getElementById('state').value;//Shashank
                var Pincode = document.getElementById('Pincode').value;//Shashank
                //var pastillness = document.getElementById('pastillness').value;//Shashank
                var pastillness = "";//Shashank bzoc TravelTag not cover for Domestic as mentioned in complince Test
                var insurence_personalDetails = Address.replace(/,/g, "") + "," + city.replace(/,/g, "") + "," + district.replace(/,/g, "") + "," + State.replace(/,/g, "") + "," + Pincode.replace(/,/g, "") + "," + pastillness.replace(/,/g, "");

                var insurence_Addedprice = document.getElementById('totlpc').innerHTML;//Shashank
                var check1 = '<%=domestic_check1%>';
                var check2 = '<%=domestic_check2%>';
                var flight_chk = check1 + "^" + check2;
                //  var total_Checkcunt = chk_Adltcunt1 + "," + chk_Adltcunt2 + "," + chk_Adltcunt3 + "," + chk_Adltcunt4 + "," + chk_Adltcunt5 + "," + chk_Adltcunt6 + "," + chk_Adltcunt7 + "," + chk_Adltcunt8 + "," + chk_Adltcunt9 + "^" + chk_Childcunt1 + "," + chk_Childcunt2 + "," + chk_Childcunt3 + "," + chk_Childcunt4 + "^" + chk_Infantcunt1 + "," + chk_Infantcunt2;   //shashank
                var total_Checkcunt = chk_Adltcunt1 + "^" + chk_Childcunt1 + "^" + chk_Infantcunt1;   //shashank


                //shashank

                window.location.href = "BookingWaitPage.aspx?bkdata=" + window.btoa(unescape(encodeURIComponent(adtarr + "@Sha@" + insurence_Addedprice + "@Sha@" + total_Checkcunt + "@Sha@" + flight_chk + "@Sha@" + insurence_personalDetails)));
                //window.location.href="BookingWaitPage.aspx?bkdata="+adtarr + "[E]" + email + "[E]" + phone;
            }
            function getAge(dateString) {

                var today = new Date();
                var birthDate = new Date(dateString);
                var age = today.getFullYear() - birthDate.getFullYear();
                var m = today.getMonth() - birthDate.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }
                return age;
            }
        </script>
        <!-- /FACEBOOK WIDGET -->
        <div class="global-wrap" style="background: #e0e0e0">
            <div class="gap"></div>
            <div class="container">
                <div class="row row-wrap">
                    <div class="col-md-8" style="background: #fff;">
                        <%         string[] Searcharr = Searchparam.Split(',', ';');
                            string cityarrya = string.Empty;
                            int adtcnt = Convert.ToInt32(Searcharr[5]);
                            int chdcnt = Convert.ToInt32(Searcharr[6]);
                            int infcnt = Convert.ToInt32(Searcharr[7]);
                            cityarrya = Global.CityandCountryArr;
                            string city = string.Empty;
                        %>
                        <div class="traveldetails">
                            <i class="fa fa-users" aria-hidden="true"></i>
                            Passengers Details
                        </div>
                        <ul class="list booking-item-passengers">
                            <%int adt = 1;
                                for (int i = 0; i < adtcnt; i++)
                                {%>
                            <li>




                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-2">
                                            <label class="passize">Adult <%=adt%></label>
                                            <select id="txtadultSex<%=adt%>" name="<%=adt%>sex" class="form-control">
                                                <option value="Title">Title</option>
                                                <option value="Mr">Mr</option>
                                                <option value="Mrs">Mrs</option>
                                                <option value="Miss">Miss</option>
                                                <option value="Ms">Ms</option>
                                            </select>

                                        </div>

                                        <div class="col-md-3 form-group">
                                            <label>First Name <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="txtadultName<%=adt%>" class="form-control" onkeypress="return alpha(event)" name="Adtname<%=adt%>" type="text" placeholder="Enter First Name " maxlength="50" />
                                        </div>

                                        <div class="col-md-3 form-group">
                                            <label>Last Name <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="txtadultSurName<%=adt%>" class="form-control" onkeypress="return alpha(event)" name="Adtsurname<%=adt%>"
                                                type="text" placeholder="Enter Last Name " maxlength="50" />

                                        </div>
                                        <div class="col-md-2 form-group">
                                            <label>Date of Birth <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="txtadultDOB<%=adt%>" class="date-pick-years-in form-control" type="text" placeholder="Enter DOB " />

                                        </div>
                                    </div>


                                </div>



                                <div class="col-md-12 form-group">


                                    <div class="col-md-5 form-group"></div>

                                    <div class="col-md-7 form-group ff">
                                        <div id="mealadd_<%=adt%>" onclick="Frequentflyer(this)">(+) Frequent flyer number and Meal preference (optional)</div>
                                        <div id="mealclose_<%=adt%>" style="display: none" onclick="Frequentflyerclose(this)">(-) Frequent flyer number and Meal preference (optional)</div>
                                    </div>
                                </div>
                                <div id="Meal_<%=adt%>" class="row" style="display: none">

                                    <div class="col-md-3 col-md-offset-3">
                                        <div class="form-group">
                                            <label>Citizenship</label>
                                            <input id="txtadultNation<%=adt%>" class="form-control" onkeypress="return alpha(event)" type="text" placeholder="Enter Citizenship" maxlength="50" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Passport Number</label>
                                            <input id="txtadultPass<%=adt%>" class="form-control" onkeypress="return blockSpecialChar(event)" type="text" placeholder="Enter Passport No" maxlength="20" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Expiry Date</label>
                                            <input id="txtadultExpiry<%=adt%>" class="date-pick-years-in form-control" type="text" placeholder="Enter Expiry Date" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12" style="background: #eeeeee; margin-bottom: 10px;">
                                    <div id="non_domestic1<%=adt%>" style="display: none1;">
                                        <div id="Adult_cbox_hide<%=adt%>">
                                            <span class="travelin s ">Travel Assistance & Insurance for Adult <%=adt%> </span></br>
                                    <input id="AdultCheckBox<%=adt%>" onclick="AdultCheck(<%=adt%>)" type="checkbox" checked="checked" />
                                            Secure your trip with TrawellTag Cover-More @&nbsp;&#8377;<%=pc%>/-&nbsp;per passenger
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <%adt += 1;
                                } %>

                            <%int chd = 0;
                                if (chdcnt >= 1)
                                    for (int c = 0; c < chdcnt; c++)
                                    { %>
                            <li>

                                <div class="row">

                                    <div class="col-md-12">

                                        <div class="col-md-1"></div>
                                        <div class="col-md-2">
                                            <label class="">Child <%=chd +1%></label>
                                            <select id="chdsex<%=chd%>" name="chdsex<%=chd%>" class="form-control">
                                                <option value="Title">Title</option>
                                                <option value="Mstr">Master</option>
                                                <option value="Miss">Miss</option>
                                                <option value="Ms">Ms</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3 form-group">
                                            <label>First Name  <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="txtchdname<%=chd%>" class="form-control" onkeypress="return alpha(event)" type="text" placeholder="Enter First Name " maxlength="50" />

                                        </div>
                                        <div class="col-md-3 form-group">
                                            <label>Last Name <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="txtchdsurname<%=chd%>" class="form-control" onkeypress="return alpha(event)" type="text" placeholder="Enter Last Name " maxlength="50" />


                                        </div>
                                        <div class="col-md-2 form-group">
                                            <label>Date of Birth <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="txtdob<%=chd%>" class="date-pick-years-in form-control" type="text" placeholder="Enter DOB" />

                                        </div>

                                    </div>



                                </div>
                                <div class="col-md-12 form-group">


                                    <div class="col-md-5 form-group "></div>
                                    <div class="ff" id="mealaddC_<%=chd%>" onclick="FrequentflyerC(this)">(+) Frequent flyer number and Meal preference (optional)</div>
                                    <div id="mealcloseC_<%=chd%>" style="display: none" onclick="FrequentflyercloseC(this)">(-) Frequent flyer number and Meal preference (optional)</div>
                                </div>
                                <div id="MealC_<%=chd%>" class="row" style="display: none">
                                    <div class="col-md-3 col-md-offset-3">
                                        <div class="form-group">
                                            <label>
                                                Citizenship</label>
                                            <input id="txtcitizenship<%=chd%>" class="form-control" onkeypress="return alpha(event)" type="text" placeholder="Enter Citizenship" maxlength="50" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                                Document Series</label>
                                            <input id="txtpassport<%=chd%>" class="form-control" onkeypress="return blockSpecialChar(event)" type="text" placeholder="Enter Document Series" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                                Expiry Date</label>
                                            <input id="txtexpiry<%=chd%>" class="date-pick-years-in form-control" type="text" placeholder="Enter Expiry Date" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12" style="background: #eeeeee; margin-bottom: 10px;">
                                    <div id="non_domestic2<%=chd%>" style="display: none1;">
                                        <div id="Child_cbox_hide<%=chd%>">
                                            <span class="travelin s">Travel Assistance & Insurance for Child <%=chd +1%></span> </br>
                                    <input id="ChildCheckBox<%=chd%>" onclick="ChildCheck(<%=chd%>)" type="checkbox" checked="checked" />
                                            Secure your trip with TrawellTag Cover-More @&nbsp;&#8377;<%=pc%>/-&nbsp;per passenger
                                        </div>

                                    </div>
                                </div>
                            </li>

                            <%chd += 1;
                                    } %>
                            <%int inf = 0;
                                if (infcnt >= 1)
                                    for (int c = 0; c < infcnt; c++)
                                    { %>
                            <li>
                                <div class="row">


                                    <div class="col-md-12"></div>
                                    <div class="col-md-1"></div>
                                    <div class="col-md-2">
                                        <label class="">Infant <%=inf+1%></label>
                                        <select id="infage<%=inf%>" name="infsex<%=inf%>" class="form-control">
                                            <option value="Title">Title</option>
                                            <option value="Mstr">Master</option>
                                            <option value="Miss">Miss</option>
                                            <option value="Ms">Ms</option>
                                        </select>

                                    </div>

                                    <div class="col-md-3 form-group">
                                        <label>First Name  <span style="color: Red; font-weight: bold;">*</span></label>
                                        <input id="txtinfName<%=inf%>" class="form-control" onkeypress="return alpha(event)" type="text" placeholder="Enter First Name " maxlength="50" />
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label>Last Name <span style="color: Red; font-weight: bold;">*</span></label>
                                        <input id="txtinfsurName<%=inf%>" class="form-control" onkeypress="return alpha(event)" type="text" placeholder="Enter Last Name " maxlength="50" />
                                    </div>
                                    <div class="col-md-2 form-group">
                                        <label>Date of Birth <span style="color: Red; font-weight: bold;">*</span></label>
                                        <input id="txtinfDob<%=inf%>" class="date-pick-years-in form-control" type="text" placeholder="Enter DOB" />
                                    </div>




                                </div>



                                <div class="col-md-12 form-group">


                                    <div class="col-md-5 form-group "></div>

                                    <div class="ff" id="mealaddI_<%=inf%>" onclick="FrequentflyerI(this)">(+) Frequent flyer number and Meal preference (optional)</div>
                                    <div id="mealcloseI_<%=inf%>" style="display: none" onclick="FrequentflyercloseI(this)">(-) Frequent flyer number and Meal preference (optional)</div>
                                </div>
                                <div id="MealI_<%=inf%>" class="row" style="display: none">

                                    <div class="col-md-3 col-md-offset-3">
                                        <div class="form-group">
                                            <label>
                                                Citizenship</label>
                                            <input id="txtinfcitizen<%=inf%>" class="form-control" onkeypress="return alpha(event)" type="text" placeholder="Enter Citizenship" maxlength="50" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                                Document Series</label>
                                            <input id="txtinfpass<%=inf%>" class="form-control" onkeypress="return alpha(event)" type="text" placeholder="Enter Document Series" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                                Expiry Date</label>
                                            <input id="txtinfExpiry<%=inf%>" class="date-pick-years-in form-control" type="text" placeholder="Enter Expiry Date" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12" style="background: #eeeeee; margin-bottom: 10px;">
                                    <div id="non_domestic3<%=inf%>" style="display: none1;">
                                        <div id="Infant_cbox_hide<%=inf%>">
                                            <span class="travelin s">Travel Assistance & Insurance for Infant <%=inf+1%></span> </br>
                                    <input id="InfantCheckBox<%=inf%>" onclick="InfantCheck(<%=inf%>)" type="checkbox" checked="checked" />
                                            Secure your trip with TrawellTag Cover-More @&nbsp;&#8377;<%=pc%>/-&nbsp;per passenger
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <%inf += 1;
                                    } %>

                            <%--<li>--%>

                            <div class="row">

                                <div class="col-md-12 emaildiv">
                                    <div class="col-md-3">Email ID <span style="color: Red; font-weight: bold;">*</span></div>
                                    <div class="col-md-3 ">
                                        <input id="Email" class="form-control" type="text" placeholder="Enter Eamil Id" maxlength="50" />
                                    </div>
                                    <div class="col-md-3">Phone Number <span style="color: Red; font-weight: bold;">*</span></div>
                                    <div class="col-md-3">
                                        <input id="Phone" class="form-control" type="text" onkeypress="return Numeric(event)" placeholder="Enter Mobile No" maxlength="10" />
                                    </div>
                                </div>


                            </div>
                            <div id="Insurence_add_info" style="background-color: #ececec; padding: 20px; border-radius: 20px; display: none1;">
                                <span style="color: Red;">Only Required for Travel Assistance & Insurance</span>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Address <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="Address" onkeypress="return blockSpecialChar(event)" class="form-control" type="text" maxlength="100" />
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>City <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="city" onkeypress="return alpha(event)" class="form-control" type="text" maxlength="50" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>District <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="district" onkeypress="return alpha(event)" class="form-control" type="text" maxlength="50" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>State <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="state" onkeypress="return alpha(event)" class="form-control" type="text" maxlength="50" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Pin code <span style="color: Red; font-weight: bold;">*</span></label>
                                            <input id="Pincode" onkeypress="return Numeric(event)" class="form-control" type="text" maxlength="6" />
                                        </div>
                                    </div>
                                    <%--<div class="col-md-4">
                                        <div class="form-group">
                                            <label>Past Illness</label>
                                            <input id="pastillness" onkeypress="return blockSpecialChar(event);" plaeholder="" class="form-control" type="text" />
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <%-- </li>--%>
                        </ul>
                        <script type="text/javascript">
                            function dobcheck() {

                                var adlt = 1;
                                var adtcount = <%=adtcount%>

                        var depd = ("<%=dat %>").toString("dd-MM-yyyy");
                                var date1 = depd;
                                var dat = new Date(date1);
                                for (j = 0; j <= adtcount; j++) {

                                    if (adtcount >= adlt) {
                                        var date2 = document.getElementById("txtadultDOB" + adlt).value;
                                        if (date2 != "") {
                                            var dat1 = new Date(date2);

                                        }

                                        $('#txtadultDOB' + adlt).on('changeDate', function (ev) {
                                            $(this).datepicker('hide');
                                        });
                                        adlt = adlt + 1;
                                    }
                                }
                                return null;
                            }
                        </script>
                        <script type="text/javascript">
                            function childdobcheck() {
                                var adlt = 1;
                                var chdcount = <%=chdcount%>
                      
                            var depd = ("<%=dat %>").toString("dd-MM-yyyy");

                                for (j = 0; j <= chdcount; j++) {

                                    if (chdcount >= adlt) {

    //                              var date1 = document.getElementById("<%=adtcount%>").value;//departure
                                        var date1 = depd;
                                        var dat = new Date(date1);
                                        var date2 = document.getElementById("txtdob" + adlt).value;
                                        if (date2 != "") {
                                            var dat1 = new Date(date2);

                                            $('#txtdob' + adlt).on('changeDate', function (ev) {
                                                $(this).datepicker('hide');
                                            });
                                            //                                    var timeDiff = Math.abs((dat.getTime()) / (365.25 * 24 * 60 * 60 * 1000)) - ((dat1.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
                                            //                                    timeDiff = timeDiff.toString().split(".")[0];
                                            //                                    debugger
                                            //                                    if ((timeDiff <= 70) && (timeDiff >= 1)) {
                                            //                                    var div = document.getElementById('Child_cbox_hide' + adlt).style.display ="block";
                                            ////                                    document.getElementById('ChildCheck' + adlt).style.display ="none";
                                            //                                    }
                                            //                                    else {
                                            //                                    var div = document.getElementById('Child_cbox_hide' + adlt).style.display ="none";
                                            //                                    }
                                        }
                                        adlt = adlt + 1;
                                    }
                                }
                                return null;
                            }
                        </script>
                        <script type="text/javascript">
                            function infantdobcheck() {
                                var adlt = 1;
                                var infcount = <%=infcount%>
                          
                            var depd = ("<%=dat %>").toString("dd-MM-yyyy");

                                for (j = 0; j <= infcount; j++) {
                                    if (infcount >= adlt) {

        //                              var date1 = document.getElementById("<%=adtcount%>").value;//departure
                                        var date1 = depd;
                                        var dat = new Date(date1);
                                        var date2 = document.getElementById("txtinfDob" + adlt).value;
                                        if (date2 != "") {
                                            var dat1 = new Date(date2);

                                            $('#txtinfDob' + adlt).on('changeDate', function (ev) {
                                                $(this).datepicker('hide');
                                            });
                                            //                                        var timeDiff = Math.abs((dat.getTime()) / (365.25 * 24 * 60 * 60 * 1000)) - ((dat1.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
                                            //                                        timeDiff = timeDiff.toString().split(".")[0];
                                            //                                        debugger
                                            //                                        if ((timeDiff <= 70) && (timeDiff >= 1)) {
                                            //                                        var div = document.getElementById('Infant_cbox_hide' + adlt).style.display ="block";
                                            ////                                        document.getElementById('InfantCheck' + adlt).style.display ="block";
                                            //                                        }
                                            //                                        else {
                                            //                                        var div = document.getElementById('Infant_cbox_hide' + adlt).style.display ="none";
                                            ////                                        document.getElementById('InfantCheck' + adlt).style.display ="none";
                                            //                                        }
                                        }
                                        adlt = adlt + 1;
                                    }
                                }
                                return null;
                            }
                        </script>
                        <div class="gap gap-small">
                        </div>

                        <div class="row" style="text-align: center;">
                            <input id="show" class="red-btn" type="submit" value="Proceed To Payment" onclick="return Formvalidate();" />
                        </div>






                        <div id="loading-div-background">
                            <div id="loading-div" class="ui-corner-all">
                                <i class="fa fa-spinner fa-spin fa-3x fa-fw ffa"></i>
                                <span class="sr-only">Loading...</span>
                                <h4 style="color: #fff;">Please wait....</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <%--  //gaurav--%>
                        <div class="booking-item-payment" style="border-radius: 4px; background: #fff;">
                            <div class="col-md-12">
                                <div class="col-md-10" style="border-radius: 10px 10px 0px 0px; padding: 12px">

                                    <h5 class="mb0">
                                        <%int index = cityarrya.IndexOf(Searcharr[1]);
                                            string srccity = cityarrya.Substring(index).Split(':')[0];%>
                                        <%=Searcharr[1]%>- <%=srccity.Split('^')[1].Split(',')[0]%>
                                                        -
                                                         <%int index1 = cityarrya.IndexOf(Searcharr[2]);
                                                             string Descity = cityarrya.Substring(index1).Split(':')[0];%>
                                        <%=Searcharr[2]%>-<%=Descity.Split('^')[1].Split(',')[0]%>
                                    </h5>

                                </div>
                                <div class="col-md-2" style="padding: 12px"><a onclick="window.history.go(-1); return false;" class="back" style="cursor: pointer">Back</a></div>

                            </div>



                            <%string[] Data = BookingString.Split(',');
                                int totalpax = adtcount + chdcount + infcount;%>
                            <div class="booking-item-payment-details">

                                <div class="stopdiv">Flight Details</div>

                                <%for (int j = 0; j < 1; j++)
                                    {%>
                                <div class="booking-item-payment-flight">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <%--  <div class="col-md-9">             --%>
                                            <div class="booking-item-flight-details">
                                                <div class="col-md-12" style="margin-bottom:10px">
                                                    <div class="col-md-6">
                                                        <%string img_src_path = "AirlineLogo/AirlineLogo/" + Data[6].Split('-')[0] + ".png";%>
                                                        <i>
                                                            <img style="width: 60px; height: 60px;" src="<%=img_src_path%>" alt="Image not found" /></i>
                                                        <span><%=Data[6]%> </span>

                                                    </div>
                                                    <div class="col-md-6">
                                                        <p class="booking-item-destination">
                                                            Duration  
                                                                <br>
                                                            <%string diff = cls.CommonClass.TimeDifference(Data[12], Data[14]);%>
                                                            <%=diff%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="booking-item-departure col-md-6">
                                                    <i class="fa fa-plane"></i>
                                                    <%--<img src="" + <%=Data[6].S style="width:15px; height:10px;"plit(AirlineLogo/AirlineLogo/',')[0] %> + ".png" title="" alt="Image not found"/>--%>
                                                    <h5><%=Data[12]%></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[11])%>
                                                    </p>
                                                    <p class="booking-item-destination">
                                                        <%int indx = cityarrya.IndexOf(Data[9]);
                                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                                <div class="booking-item-arrival col-md-6">
                                                    <i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5>
                                                        <%=Data[14]%></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[13])%>
                                                    </p>
                                                    <p class="booking-item-destination">
                                                        <%indx = cityarrya.IndexOf(Data[10]);
                                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                            </div>
                                            <%--  </div>--%>
                                            <%--<div class="col-md-3">
                                            <div class="booking-item-date">
                                              <p class="booking-item-destination">
                                                    Duration</p>
                                              <p class="booking-item-destination">
                                                    <%string diff = cls.CommonClass.TimeDifference(Data[12], Data[14]);%>
                                                    <%=diff%></p>
                                            </div>
                                        </div>--%>
                                        </div>
                                    </div>
                                    <%if (Data[16] != "")
                                        { %>
                                    <p class="stopdiv">
                                        <%int indx1 = cityarrya.IndexOf(Data[19]);
                                            city = cityarrya.Substring(indx1).Split(':')[0];%>
                                        STOP
                                        <%=diff%> <i class="fa fa-arrows-h" aria-hidden="true"></i>
                                        <%=city.Split('^')[1]%>
                                    </p>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="booking-item-flight-details">
                                                <div class="col-md-12" style="margin-bottom:10px">
                                                    <div class="col-md-6">
                                                        <%string img_src_path1 = "AirlineLogo/AirlineLogo/" + Data[16].Split('-')[0] + ".png";%>
                                                        <i>
                                                            <img style="width: 60px; height: 60px;" src="<%=img_src_path1%>" alt="Image not found" /></i>
                                                        <span><%=Data[16]%> </span>
                                                        <%--   <i class="fa fa-plane"></i>--%>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p class="booking-item-destination">
                                                            Duration       
                                                                <br>
                                                            <%string diff1 = cls.CommonClass.TimeDifference(Data[22], Data[24]);%>
                                                            <%=diff1%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="booking-item-departure col-md-6">
                                                    <i class="fa fa-plane"></i>
                                                    <h5>
                                                        <%=Data[22]%></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[21]) %>
                                                    </p>
                                                    <p class="booking-item-destination">
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                                <div class="booking-item-arrival col-md-6">
                                                    <i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5>
                                                        <%=Data[24]%></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[23]) %>
                                                    </p>
                                                    <p class="booking-item-destination">
                                                        <%indx = cityarrya.IndexOf(Data[20]);
                                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="col-md-2">
                                            <div class="booking-item-flight-duration">
                                                <p class"booking-item-destination">
                                                    Duration</p>
                                                <h5>
                                                    <%string diff0 = cls.CommonClass.TimeDifference(Data[22], Data[24]);%>
                                                    <%=diff0%></h5>
                                            </div>
                                        </div>--%>
                                    </div>
                                    <%} %>
                                    <%if (Data[26] != "")
                                        { %>
                                    <p class="stopdiv">
                                        <%indx = cityarrya.IndexOf(Data[29]);
                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                        STOP
                                        <%=city%>
                                    </p>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="booking-item-flight-details">
                                                <div class="col-md-12" style="margin-bottom:10px">
                                                    <div class="col-md-6">
                                                        <%string img_src_path12 = "AirlineLogo/AirlineLogo/" + Data[26].Split('-')[0] + ".png";%>
                                                        <i>
                                                            <img style="width: 60px; height: 60px;" src="<%=img_src_path12%>" alt="Image not found" /></i>
                                                        <span><%=Data[26]%> </span>
                                                        <%-- <i class="fa fa-plane"></i>--%>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p class="booking-item-destination">
                                                            Duration     
                                                                <br />
                                                            <%string diff1 = cls.CommonClass.TimeDifference(Data[32], Data[34]);%>
                                                            <%=diff1%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="booking-item-departure col-md-6">
                                                    <i class="fa fa-plane"></i>
                                                    <h5></h5>
                                                    <%=cls.CommonClass.DDmmyy(Data[32]) %>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[31]) %>
                                                    </p>

                                                    <p class="booking-item-destination">
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                                <div class="booking-item-arrival col-md-6">
                                                    <i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5>
                                                        <%=cls.CommonClass.DDmmyy(Data[34]) %></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[33]) %>
                                                    </p>

                                                    <p class="booking-item-destination">
                                                        <%indx = cityarrya.IndexOf(Data[30]);
                                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <%--  <div class="col-md-2">
                                            <div class="booking-item-flight-duration">
                                                <p>
                                                    Duration</p>
                                                <h5>
                                                    <%string diff1 = cls.CommonClass.TimeDifference(Data[32], Data[34]);%>
                                                    <%=diff1%></h5>
                                            </div>
                                        </div>--%>
                                    </div>
                                    <%} %>
                                </div>
                                <hr style="border: 1px dashed #ccc;" />
                                <%} %>

                                <%if (Data.Length > 49)
                                    { %>

                                <div class="stopdiv">Flight Details</div>
                                <%for (int j = 0; j < 1; j++)
                                    {%>
                                <div class="booking-item-payment-flight">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="booking-item-flight-details">
                                                <div class="col-md-12" style="margin-bottom:10px">
                                                    <div class="col-md-6">
                                                        <%string img_src_path12 = "AirlineLogo/AirlineLogo/" + Data[36].Split('-')[0] + ".png";%>
                                                        <i>
                                                            <img style="width: 60px; height: 60px;" src="<%=img_src_path12%>" alt="Image not found" /></i>
                                                        <span><%=Data[36]%> </span>
                                                        <%--   <i class="fa fa-plane"></i>--%>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p class="booking-item-destination">
                                                            Duration         
                                                                <br>
                                                            <%string diff1 = cls.CommonClass.TimeDifference(Data[42], Data[44]);%>
                                                            <%=diff1%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="booking-item-departure col-md-6">
                                                    <i class="fa fa-plane"></i>
                                                    <h5>
                                                        <%=Data[42]%></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[41]) %>
                                                    </p>
                                                    <p class="booking-item-destination">
                                                        <%int indx = cityarrya.IndexOf(Data[39]);
                                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                                <div class="booking-item-arrival col-md-6">
                                                    <i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5>
                                                        <%=Data[44]%></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[43]) %>
                                                    </p>
                                                    <p class="booking-item-destination">
                                                        <%indx = cityarrya.IndexOf(Data[40]);
                                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>
                                                    Duration</p>
                                                <h5>
                                                    <%string diff1 = cls.CommonClass.TimeDifference(Data[42], Data[44]);%>
                                                    <%=diff1%></h5>
                                            </div>
                                        </div>--%>
                                    </div>
                                    <%if (Data[46] != "")
                                        { %>
                                    <p class="stopdiv">
                                        STOP
                                        <%string diff2 = cls.CommonClass.TimeDifference(Data[42], Data[44]);%>
                                        <%=diff2%><i class="fa fa-arrows-h" aria-hidden="true"></i>
                                        <%=city.Split('^')[1] %>
                                    </p>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="booking-item-flight-details">
                                                <div class="col-md-12" style="margin-bottom:10px">
                                                    <div class="col-md-6">
                                                        <%string img_src_path121 = "AirlineLogo/AirlineLogo/" + Data[46].Split('-')[0] + ".png";%>
                                                        <i>
                                                            <img style="width: 60px; height: 60px;" src="<%=img_src_path121%>" alt="Image not found" /></i>
                                                        <span><%=Data[46]%> </span>
                                                        <%--  <i class="fa fa-plane"></i>--%>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p class="booking-item-destination">
                                                            Duration               
                                                                <br>
                                                            <%string diff12 = cls.CommonClass.TimeDifference(Data[52], Data[54]);%>
                                                            <%=diff1%>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="booking-item-departure col-md-6">
                                                    <i class="fa fa-plane"></i>
                                                    <%--<div>
                                                    <img height="40px" width="40px" src="AirlineLogo/AirlineLogo/"+<%=Data[56].Split('-')[0] %>+".png" />
                                                    </div>--%>
                                                    <h5>
                                                        <%=Data[52]%></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[51]) %>
                                                    </p>
                                                    <p class="booking-item-destination">
                                                        <%indx = cityarrya.IndexOf(Data[49]);
                                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                                <div class="booking-item-arrival col-md-6">
                                                    <i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5>
                                                        <%=Data[54]%></h5>
                                                    <p class="booking-item-date">
                                                        <%=cls.CommonClass.DDmmyy(Data[53]) %>
                                                    </p>
                                                    <p class="booking-item-destination">
                                                        <%indx = cityarrya.IndexOf(Data[50]);
                                                            city = cityarrya.Substring(indx).Split(':')[0];%>
                                                        <%=city.Split('^')[1].Split(',')[0]%>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <%-- <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>
                                                    Duration</p>
                                                <h5>
                                                    <%string diff2 = cls.CommonClass.TimeDifference(Data[52], Data[54]);%>
                                                    <%=diff2%></h5>
                                            </div>
                                        </div>--%>
                                    </div>
                                    <%} %>
                                    <%if (Data[56] != "")
                                        { %>
                                    <p>
                                        <p class="stopdiv">
                                            STOP
                                        <%string diff2 = cls.CommonClass.TimeDifference(Data[52], Data[54]);%>
                                            <%=diff2%>
                                            <%=city.Split('^')[1] %>
                                        </p>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <div class="booking-item-flight-details">
                                                    <div class="booking-item-departure">
                                                        <i class="fa fa-plane"></i>
                                                        <h5>10:25 PM</h5>
                                                        <p class="booking-item-date">
                                                            Sun, Mar 22
                                                        </p>
                                                        <p class="booking-item-destination">
                                                            <%indx = cityarrya.IndexOf(Data[50]);
                                                                city = cityarrya.Substring(indx).Split(':')[0];%>
                                                            <%=city.Split('^')[1].Split(',')[0]%>
                                                        </p>
                                                    </div>
                                                    <div class="booking-item-arrival">
                                                        <i class="fa fa-plane fa-flip-vertical"></i>
                                                        <h5>12:25 PM</h5>
                                                        <p class="booking-item-date">
                                                            Sat, Mar 23
                                                        </p>
                                                        <p class="booking-item-destination">
                                                            <%indx = cityarrya.IndexOf(Data[60]);
                                                                city = cityarrya.Substring(indx).Split(':')[0];%>
                                                            <%=city.Split('^')[1].Split(',')[0]%>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="booking-item-flight-duration">
                                                    <p>
                                                        Duration 
                                                            <br>
                                                    </p>
                                                    <h5>
                                                        <%string diff3 = cls.CommonClass.TimeDifference(Data[62], Data[64]);%>
                                                        <%=diff3%></h5>
                                                </div>
                                            </div>
                                        </div>
                                        <%} %>
                                </div>
                                <%} %>

                                <%} %>
                            </div>
                            <div style="background: #fff; height: 250px">
                                <div class="col-md-12 traveldetails">Fare Summary</div>

                                <div class="booking-item-payment-price">



                                    <div class="col-md-12">
                                        <div class="col-md-4">Adults x <%=Searcharr[5] %></div>
                                        <div class="col-md-8"><%=Data[3].Split(':')[0]%></div>

                                    </div>
                                    <%if (chdcount > 0)
                                        {%>
                                    <div class="col-md-12">
                                        <div class="col-md-4">Child x <%=Searcharr[6] %></div>
                                        <div class="col-md-8"><%=Data[3].Split(':')[1]%></div>

                                    </div>



                                    <%} %>
                                    <%if (infcount > 0)
                                        {%>
                                    <div class="col-md-12">
                                        <div class="col-md-4">Infant x <%=Searcharr[7] %></div>
                                        <div class="col-md-8"><%=Data[3].Split(':')[2]%></div>

                                    </div>
                                    <%} %>


                                    <div class="col-md-12">
                                        <div class="col-md-4">Total Tax</div>
                                        <%
                                          
                                            %>
                                        <div class="col-md-8"><%=Data[2]%></div>

                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">Commission</div>
                                        <div class="col-md-8">--</div>

                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">Txn Charge</div>
                                        <div class="col-md-8">--</div>

                                    </div>

                                    <div class="col-md-12">
                                        <div class="col-md-4">YQ</div>
                                        <div class="col-md-8"><%=Data[4]%></div>

                                    </div>

                                    <div class="col-md-12">
                                        <div class="col-md-4">TDS</div>
                                        <div class="col-md-8">--</div>

                                    </div>


                                    <div class="col-md-12 prizedetails">
                                        <div class="col-md-6">Total Amount</div>
                                        <div class="col-md-6 booking-item-payment-price-amount">
                                            <asp:Label ID="totlpc" runat="server"></asp:Label>
                                        </div>
                                    </div>

                                </div>
                            </div>



                            <%--<asp:CheckBox ID="CheckBox1"  onclick = "Check()" runat="server" Checked="True" />--%>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:HiddenField ID="hidn" runat="server" />
                            <%--<asp:HiddenField ID="finalamounttt" runat="server"/>--%>














                            <%--    
                            <script type="text/javascript">
                                var chk_Adltcunt1 = 1;
                                function AdultCheck() {
                                    debugger;

                                    var oldprc = document.getElementById('totlpc').innerHTML;
                                    var newpric = parseInt(document.getElementById("hidn").value);
                                    var Adultbox1 = document.getElementById("AdultCheckBox1");

                                    var add = parseInt(oldprc) + newpric;
                                    var remove = parseInt(oldprc) - newpric;
                                    if (Adultbox1.checked == true) {
                                        document.getElementById('totlpc').innerHTML = add;
                                        chk_Adltcunt1 = 1;
                                    }
                                    else {
                                        document.getElementById('totlpc').innerHTML = remove;
                                        chk_Adltcunt1 = 0;
                                    }
                                    insurenceCheck();
                                }
                            </script>--%>



                            <script type="text/javascript">
                                var chk_Adltcunt1 = 1;
                                function AdultCheck(data) {
                                    debugger;


                                    var oldprc = document.getElementById('totlpc').innerHTML;
                                    var newpric = parseInt(document.getElementById("hidn").value);
                                    // var Adultbox1 = document.getElementById("AdultCheckBox'" + data + "'");

                                    var add = parseInt(oldprc) + newpric;
                                    var remove = parseInt(oldprc) - newpric;
                                    if (document.getElementById("AdultCheckBox" + data + "").checked == true) {
                                        document.getElementById('totlpc').innerHTML = add;
                                        //document.getElementById("chk_Adltcunt'" + data + "'").value = 1;
                                        chk_Adltcunt1 = 1;

                                        //chk_Adltcunt1 = 1;
                                    }
                                    else {
                                        document.getElementById('totlpc').innerHTML = remove;
                                        //  document.getElementById("chk_Adltcunt'" + data + "'").value = "0";
                                        // chk_Adltcunt1 = 0;
                                        chk_Adltcunt1 = 0;
                                    }
                                    insurenceCheck();
                                }
                            </script>


                            <script type="text/javascript">
                                var chk_Childcunt1 = 1;
                                function ChildCheck(data) {
                                    debugger;

                                    var oldprc = document.getElementById('totlpc').innerHTML;
                                    var newpric = parseInt(document.getElementById("hidn").value);
                                    // var Childbox1 = document.getElementById("ChildCheckBox'" + data + "'");

                                    var add = parseInt(oldprc) + newpric;
                                    var remove = parseInt(oldprc) - newpric;
                                    if (document.getElementById("ChildCheckBox" + data + "").checked == true) {
                                        // if (document.getElementById("AdultCheckBox" + data + "").checked == true) {
                                        document.getElementById('totlpc').innerHTML = add;
                                        chk_Childcunt1 = 1;
                                    }
                                    else {
                                        document.getElementById('totlpc').innerHTML = remove;
                                        chk_Childcunt1 = 0;
                                    }
                                    insurenceCheck();
                                }
                            </script>


                            <script type="text/javascript">
                                var chk_Infantcunt1 = 1;
                                function InfantCheck(data) {
                                    debugger;
                                    var oldprc = document.getElementById('totlpc').innerHTML;
                                    var newpric = parseInt(document.getElementById("hidn").value);
                                    //var Infantbox1 = document.getElementById("InfantCheckBox'" + data + "'"");

                                    var add = parseInt(oldprc) + newpric;
                                    var remove = parseInt(oldprc) - newpric;
                                    if (document.getElementById("InfantCheckBox" + data + "").checked == true) {
                                        document.getElementById('totlpc').innerHTML = add;
                                        chk_Infantcunt1 = 1;
                                    }
                                    else {
                                        document.getElementById('totlpc').innerHTML = remove;
                                        chk_Infantcunt1 = 0;
                                    }
                                    insurenceCheck();
                                }
                            </script>


                        </div>
                    </div>
                </div>
                <div id="insurence_covrage_img" style="display: none;">
                    <a href="#openModal1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img style="width: 60%;" src="img/ins_cover.jpg" />
                    </a>
                    <div class="danger">
                        <span style="color: Red; font-size: small;">
                            <strong>Note:</strong>
                        </span>
                        <br />
                        <span style="color: Red;">* Travel Assistance & Insurance Applicable Only to Indian Citizens Below <b>70 Years</b> of Age at the time of Departure Date.</span>
                        <%--<br />
                        <span style="color:Red;">* Travel Assistance & Insurance Applicable Only to Indian Citizens <b>(Child) between 2 to 11 Years</b> of Age at the time of Departure Date.</span>
                        <br />
                        <span style="color:Red;">* Travel Assistance & Insurance Applicable Only to Indian Citizens <b>(Infant) Below 2 Years</b> of Age at the time of Departure Date.</span>--%>
                        <br />
                        <span style="color: Red;">*</span> Travel assistance & insurance is highly recommended.
                        <br />
                        <span style="color: Red;">*</span> I hereby confirm that all persons covered are citizens of india and below 70 years of age. I have read and understood the <a href="https://www.bharti-axagi.co.in/sites/default/files/downloadcenter/Revised%20Group%20Domestic%20Travel%20Policy%20Wordings_0.pdf" target="_blank">Terms & Conditions.</a>
                    </div>
                    <%--<h5 style="font-size: x-large;font-weight: initial;">
                    Insurance covers:
                </h5>
                <img style="width:;" src="img/173.jpg" />--%>
                </div>
                <div id="openModal1" class="modalDialog">
                    <div>
                        <a href="#close" title="Close" class="close" style="opacity: .5; position: sticky !important;">X</a>
                        <%--<h5 style="font-size: x-large;font-weight: initial;">
                        Insurance covers:
                    </h5>--%>
                        <%--<h2>Travel Assistance & Insurance</h2>--%>
                        <img style="width: ;" src="img/Domestic-Smart-Plan.jpg" />
                    </div>
                </div>

            </div>
            <div class="gap"></div>
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

        <!-- shashank start -->
        <script type="text/javascript">
            //1 adult   
            $(document).ready(function () {

                var check1 = '<%=domestic_check1%>';
                var check2 = '<%=domestic_check2%>';

                var adtcount = <%=adtcount%>
            var i;
                for (i = 1; i <= adtcount; i++) {
                    if (check1 == "I" && check2 == "I") {

                        document.getElementById("non_domestic1" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "I" && check2 == "D") {

                        document.getElementById("non_domestic1" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "D" && check2 == "I") {

                        document.getElementById("non_domestic1" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "D" && check2 == "D") {

                        document.getElementById("non_domestic1" + [i]).style.display = "block";
                        document.getElementById("Insurence_add_info").style.display = "block";
                        document.getElementById("insurence_covrage_img").style.display = "block";
                    }
                }
            });

            function insurenceCheck() {
                if ($(':checkbox:checked').prop('checked') == true) {
                    document.getElementById("Insurence_add_info").style.display = "block";
                }
                else {
                    document.getElementById("Insurence_add_info").style.display = "none";
                }
            }
        </script>
        <script type="text/javascript">
            //1 child    
            $(document).ready(function () {

                var check1 = '<%=domestic_check1%>';
                var check2 = '<%=domestic_check2%>';

                var chdcount = <%=chdcount%>
            var i;
                for (i = 1; i <= chdcount; i++) {
                    if (check1 == "I" && check2 == "I") {

                        document.getElementById("non_domestic2" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "I" && check2 == "D") {

                        document.getElementById("non_domestic2" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "D" && check2 == "I") {

                        document.getElementById("non_domestic2" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "D" && check2 == "D") {

                        document.getElementById("non_domestic2" + [i]).style.display = "block";
                        document.getElementById("Insurence_add_info").style.display = "block";
                        document.getElementById("insurence_covrage_img").style.display = "block";
                    }
                }
            });
        </script>
        <script type="text/javascript">
            //1 infant   
            $(document).ready(function () {

                var check1 = '<%=domestic_check1%>';
                var check2 = '<%=domestic_check2%>';

                var infcount = <%=infcount%>
            var i;
                for (i = 1; i <= infcount; i++) {
                    if (check1 == "I" && check2 == "I") {

                        document.getElementById("non_domestic3" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "I" && check2 == "D") {

                        document.getElementById("non_domestic3" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "D" && check2 == "I") {

                        document.getElementById("non_domestic3" + [i]).style.display = "none";
                        document.getElementById("Insurence_add_info").style.display = "none";
                        document.getElementById("insurence_covrage_img").style.display = "none";
                    }
                    else if (check1 == "D" && check2 == "D") {

                        document.getElementById("non_domestic3" + [i]).style.display = "block";
                        document.getElementById("Insurence_add_info").style.display = "block";
                        document.getElementById("insurence_covrage_img").style.display = "block";
                    }
                }
            });
        </script>
        <!-- shashank end -->
        <!--------  footer start  --------------->
        <div>
            <uc2:uc_Footer runat="server" ID="uc_Footer" />
        </div>
        <!--------  footer end  --------------->
    </form>
</body>
</html>

<script>

    function Frequentflyer(data) {

        var id = data.id.split('_')[1];

        try {
            document.getElementById('Meal_' + id + '').style.display = "block";
            document.getElementById('mealclose_' + id + '').style.display = "block";
            document.getElementById('mealadd_' + id + '').style.display = "none";

        } catch (e) {

        }
    }

    function Frequentflyerclose(data) {

        var id = data.id.split('_')[1];

        try {
            document.getElementById('Meal_' + id + '').style.display = "none";
            document.getElementById('mealadd_' + id + '').style.display = "block";
            document.getElementById('mealclose_' + id + '').style.display = "none";

        } catch (e) {

        }
    }

    function FrequentflyerC(data) {

        var id = data.id.split('_')[1];

        try {
            document.getElementById('MealC_' + id + '').style.display = "block";
            document.getElementById('mealcloseC_' + id + '').style.display = "block";
            document.getElementById('mealaddC_' + id + '').style.display = "none";

        } catch (e) {

        }
    }

    function FrequentflyercloseC(data) {

        var id = data.id.split('_')[1];

        try {
            document.getElementById('MealC_' + id + '').style.display = "none";
            document.getElementById('mealaddC_' + id + '').style.display = "block";
            document.getElementById('mealcloseC_' + id + '').style.display = "none";

        } catch (e) {

        }
    }

    function FrequentflyerI(data) {

        var id = data.id.split('_')[1];

        try {
            document.getElementById('MealI_' + id + '').style.display = "block";
            document.getElementById('mealcloseI_' + id + '').style.display = "block";
            document.getElementById('mealaddI_' + id + '').style.display = "none";

        } catch (e) {

        }
    }

    function FrequentflyercloseI(data) {

        var id = data.id.split('_')[1];

        try {
            document.getElementById('MealI_' + id + '').style.display = "none";
            document.getElementById('mealaddI_' + id + '').style.display = "block";
            document.getElementById('mealcloseI_' + id + '').style.display = "none";

        } catch (e) {

        }
    }



    function alpha(e) {

        var k;
        document.all ? k = e.keyCode : k = e.which;
        if ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32) {
            return true;
        }
        else {

            return false;

        }
    }





    function IsAlphaNumeric1(e) {
        var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
        var ret = ((keyCode >= 48 && keyCode <= 57) || (keyCode === 32) || (keyCode >= 65 && keyCode <= 90) || (keyCode >= 97 && keyCode <= 122) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
        return ret;
    }






</script>
<style type="text/css">
    #loading-div-background {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        background: #0e0e0e8a;
        width: 100%;
        height: 100%;
        z-index: 10000;
    }

    #loading-div {
        width: 300px;
        height: 160px;
        background-color: #0c0b0b;
        text-align: center;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -150px;
        margin-top: -101px;
        z-index: 10000;
    }

    .ffa {
        font-size: 100px;
        color: #fff
    }
</style>

<script type="text/javascript">
        $(document).ready(function () {
             $("#loading-div-background").css({ opacity: 0.8 });
         });

         function ShowProgressAnimation() {
             $("#loading-div-background").show();

         }

</script>
