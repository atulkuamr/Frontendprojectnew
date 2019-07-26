<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <head>


    <style type="text/css">
    .padng
    {
        padding: 9px 0px 9px 0px;
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
    .completionList
    {
        border: solid 1px #ccc;
        margin: 0px;
        height: auto;
        overflow: auto;
        background-color:white;
        color: #737373;
        border-radius: 0px 0px 6px 6px;
        line-height: 1.8em;
        font-family: "Open Sans",sans-serif;
        font-size: 1em;
        font-weight: normal;
        padding: 0px;
    }
    
    .completionList_listItem
    {
        padding-left: 5px;
    }
    .completionList_highlightedListItem
     {
        background-color: #1f7ff0;
        color:white;
        line-height: 1.8em;
        padding-top: 2px;
        padding-bottom: 2px;
        padding-left:5px;
        padding-right:5px;
    }
    
    .nav > li > a:hover, .nav > li > a:focus {
        text-decoration: none;
        background-color: #eeeeee;
        border-radius: 5px;
    }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
        color: #555555;
        background-color: #ffffff;
        border: 1px solid #dddddd;
        border-bottom-color: transparent;
        cursor: default;
        border-radius: 5px;
    }
    .search-tabs-bg > .tabbable > .nav-tabs > li > a > span > .fa {
        display: inline-block;
        width: 30px;
        height: 30px;
        line-height: 30px;
        margin-right: 2px;
        background: rgba(0,0,0,0.3);
        -webkit-border-radius: 50%;
        border-radius: 50%;
        text-align: center;
        background-color: white;
        color: #1f7ff0;
    }
    .sliderr
    {
        /*border: 6px solid #efd1d185;
        box-shadow: 0px 0px 16px 1px #736f6f;*/
    
        height: 220px;
        width: 330px;
        display: inline-block;
        border-radius: 8px;
    }

    .owl-carousel.owl-slider .owl-controls .owl-buttons div.owl-prev {
        display:none;
    }
    .owl-carousel.owl-slider .owl-controls .owl-buttons div.owl-next {
        display:none;
    }
    .nav-tabs{
        border:none !important;

    }
    </style>
    <link href="fonts/font-awesome-animation.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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



    
<script type="text/javascript">
    $(document).ready(function () {
        $('#cin').change(function () {
            var date2 = $('#cin').datepicker('getDate', '+1d');
            date2.setDate(date2.getDate() + 1);
            $('#cout').datepicker('setDate', date2);
            debugger;
            $("#cout").focus();
        });

    });
</script>
<!--move bottom to top js-->
<script type="text/javascript">
    $(document).ready(function () {
        $().UItoTop({ easingType: 'easeOutQuart' });
    });
</script>
<script type="text/javascript">
    function Tours() {
        debugger;
        var utype = '<%=loginval %>';
        var prefix = utype.split('@')[0];
        window.open('http://' + prefix + '.rezb2b.com/');
    };
</script>
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
<script type="text/javascript" src="Commonjs.js"></script>
<script type="text/javascript" src="common-show.js"></script>
<script type="text/javascript" src="js/common-show1.js"></script>
<link href="js/smartpaginator.css" rel="stylesheet" type="text/css" />
<script src="js/smartpaginator.js" type="text/javascript"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/moment-with-locales.js"></script>
<script src="HotelJs/Hotels.js" type="text/javascript"></script>

<script type="text/javascript">
    function myhotel() {
        debugger;
        if (document.getElementById('<%=hlttxtfromsec.ClientID %>').value == "") {
            alert("Please Select destination ");
        }
        else if (document.getElementById('cin').value == "") {
            alert("Please Select CheckInDate ");
        }
        else if (document.getElementById('cout').value == "") {
            alert("Please Select CheckOutDate ");
        }
        else if (document.getElementById('cin').value == document.getElementById('cout').value) {
            alert("CheckInDate and CheckOutDate can't be same");
        }
        else {
            var dest = document.getElementById("<%=hlttxtfromsec.ClientID %>").value;
            var chkin = document.getElementById("cin").value;
            var chkout = document.getElementById("cout").value;
            var rating = document.getElementById("starrating").value;
            var noofrooms = document.getElementById("rooms").value;
            var hotelname = document.getElementById("hotelname").value;
            var location = document.getElementById("location").value;
            var adt = [4];
            adt[0] = document.getElementById("Adult1").value;
            adt[1] = document.getElementById("Adult2").value;
            adt[2] = document.getElementById("Adult3").value;
            adt[3] = document.getElementById("Adult4").value;

            debugger;
            var totadtno = parseInt(adt[0]) + parseInt(adt[1]);

            var noofchild = [4];
            noofchild[0] = document.getElementById("R_1").value;
            noofchild[1] = document.getElementById("R_2").value;
            noofchild[2] = document.getElementById("R_3").value;
            noofchild[3] = document.getElementById("R_4").value;
            debugger;
            var childage = [[], [], [], []];
            childage[0][0] = document.getElementById("R_1_1").value;
            childage[0][1] = document.getElementById("R_1_2").value;
            childage[1][0] = document.getElementById("R_2_1").value;
            childage[1][1] = document.getElementById("R_2_2").value;
            childage[2][0] = document.getElementById("R_3_1").value;
            childage[2][1] = document.getElementById("R_3_2").value;
            childage[3][0] = document.getElementById("R_4_1").value;
            childage[3][1] = document.getElementById("R_4_2").value;
            var cc = dest.split(", ");
            if (rating == "5") {
                rating = "All";
            }

            var dt1 = new Date(chkin);
            var dt2 = new Date(chkout);
            var diffDays = dt2.getDate() - dt1.getDate();

            var param = chkin + "^" + chkout + "^" + "Days" + "^" + rating + "^" + "CityCode" + "@" + cc[0] + "^" + "CountryCode" + "@" + cc[2] + "^" + noofrooms + "^ININ~";
            for (var i = 0; i < noofrooms; i++) {
                var RoomName = "";
                var RoomCode = "";
                var children = "";
                param += adt[i] + '^' + noofchild[i] + '^';
                if (adt[i] == "1") {
                    RoomCode = "SB";
                    RoomName = "Single Room";
                }
                else if (adt[i] == "2") {
                    RoomCode = "DB";
                    RoomName = "Double Room";
                }
                else if (adt[i] == "3") {
                    RoomCode = "TR";
                    RoomName = "Triple Room";
                }
                else if (adt[i] == "4") {
                    RoomCode = "QD";
                    RoomName = "Quad Room";
                }
                var totchd = noofchild[i];

                debugger;
                for (var j = 0; j < totchd; j++) {
                    if (children == "") {
                        children += childage[i][j];
                    }
                    else {
                        children += "," + childage[i][j];
                    }
                }

                param += children + '^' + noofrooms + '^' + RoomName + '-' + RoomCode + '^' + RoomCode + '~';
            }
            debugger;
            //alert('hi');
            localStorage["current_param"] = window.btoa(unescape(encodeURIComponent(param + "$" + hotelname + "$" + location)));
            localStorage["prev_param"] = null; localStorage["prev_progressCount"] = "0";
            localStorage["progressCount"] = "0";
            localStorage["allSeen"] = "false";
            localStorage.setItem("thread_list", "[-1]");
            localStorage.setItem("pos_list", "[-1 ]");
            window.location.href = ("load.aspx?flag=true&SearchVal=" + window.btoa(unescape(encodeURIComponent(param + "$" + hotelname + "$" + location))));
        }
    }

    function sightseen() {
        debugger;
        var dest = document.getElementById("<%=destination.ClientID %>").value;
        var chkin = document.getElementById("start").value;
        var chkout = document.getElementById("end").value;
        var language = document.getElementById("laung").value;
        var totadult = document.getElementById("A_9").value;
        var adtage = [9];
        adtage[0] = document.getElementById("A_9_1").value;
        adtage[1] = document.getElementById("A_9_2").value;
        adtage[2] = document.getElementById("A_9_3").value;
        adtage[3] = document.getElementById("A_9_4").value;
        adtage[4] = document.getElementById("A_9_5").value;
        adtage[5] = document.getElementById("A_9_6").value;
        adtage[6] = document.getElementById("A_9_7").value;
        adtage[7] = document.getElementById("A_9_8").value;
        adtage[8] = document.getElementById("A_9_9").value;

        var totch = document.getElementById("R_5").value;
        var chage = [9];
        chage[0] = document.getElementById("R_5_1").value;
        chage[1] = document.getElementById("R_5_2").value;
        chage[2] = document.getElementById("R_5_3").value;
        chage[3] = document.getElementById("R_5_4").value;
        chage[4] = document.getElementById("R_5_5").value;
        chage[5] = document.getElementById("R_5_6").value;
        chage[6] = document.getElementById("R_5_7").value;
        chage[7] = document.getElementById("R_5_8").value;
        chage[8] = document.getElementById("R_5_9").value;

        var cc = dest.split(", ");
        var adt = "";
        var ch = "";
        for (var i = 0; i < totadult; i++) {
            if (adt == "") {
                adt += adtage[i];
            }
            else {
                adt += "," + adtage[i];
            }
        }
        for (var j = 0; j < totch; j++) {
            if (ch == "") {
                ch += chage[j];
            }
            else {
                ch += "," + chage[j];
            }
        }
        debugger;
        var param = chkin + "^" + chkout + "^" + "1" + "^" + "CityCode" + "@" + cc[0] + "^" + "CountryCode" + "@" + cc[2] + "~" + totadult + "^" + adt + "^" + totch + "^" + ch + "^" + "ENG";
        window.location.href = ("signtseeing_display.aspx?SearchVal=" + param);
    }
    function Validate() {
        debugger;
        var abc = "";
        var TripType = ""; var finalstring = ""; var Fromsec = ""; var tosec = ""; var fromdate = ""; var todate = ""; var flightcode = "";
        if (document.getElementById('<%=flttxtfromsec.ClientID %>').value == "") {
            alert("Please Select FromCity ");
        }
        else {
            Fromsec = document.getElementById('<%=flttxtfromsec.ClientID %>').value;
        }
        if (document.getElementById('<%=flttxttosec.ClientID %>').value == "") {
            alert("Please Select ToCity ");
        }
        else {
            tosec = document.getElementById('<%=flttxttosec.ClientID %>').value;
        }
        if (document.getElementById('txtfromdate').value == "") {
            alert("Please Select From Date ");
        }
        else {
            fromdate = document.getElementById('txtfromdate').value;
        }
        if (document.getElementById('txttodate').value == "") {
            alert("Please Select To Date ");
        }
        else {
            todate = document.getElementById('txttodate').value;
        }
        flightcode = document.getElementById('flightcode').value;

        if ($('#txttodate').is(':visible')) {
            TripType = "Two";
        }
        else {
            TripType = "One";
            todate = "";
        }
        //                var tflight = "";
        //                if (document.getElementById('=INTL.ClientID').checked) {
        //                    tflight = "INTL";
        //                }
        //                else if (document.getElementById('=DOM.ClientID ').checked) {
        //                    tflight = "DOM";
        //                }
        var index = document.getElementById('optClass').selectedIndex;
        var cabincls = "";
        if (index > -1)
            cabincls = document.getElementById('optClass').options[index].text;
        finalstring = TripType + ";" + Fromsec + ";" + tosec + ";" + fromdate + ";" + todate + ";" + document.getElementById('optAdult').value + ";" + document.getElementById('Optchild').value + ";" + document.getElementById('OptInfant').value + ";" + cabincls + ";" + ";;;;;;D" + "!" + flightcode;
        window.location.href = ("FlightWaiting.aspx?ses=" + window.btoa(unescape(encodeURIComponent(finalstring))));
        return abc;
    }
    //            function Validate() {
    //                debugger;
    //                var abc = "";
    //                var TripType = ""; var finalstring = ""; var Fromsec = ""; var tosec = ""; var fromdate = ""; var todate = "";
    //                if (document.getElementById('<%=flttxtfromsec.ClientID %>').value == "") {
    //                    alert("Please Select FromCity ");
    //                }
    //                else {
    //                    Fromsec = document.getElementById('<%=flttxtfromsec.ClientID %>').value;
    //                }
    //                if (document.getElementById('<%=flttxttosec.ClientID %>').value == "") {
    //                    alert("Please Select ToCity ");
    //                }
    //                else {
    //                    tosec = document.getElementById('<%=flttxttosec.ClientID %>').value;
    //                }
    //                if (document.getElementById('txtfromdate').value == "") {
    //                    alert("Please Select From Date ");
    //                }
    //                else {
    //                    fromdate = document.getElementById('txtfromdate').value;
    //                }
    //                if (document.getElementById('txttodate').value == "") {
    //                    alert("Please Select To Date ");
    //                }
    //                else {
    //                    todate = document.getElementById('txttodate').value;
    //                }

    //                if ($('#txttodate').is(':visible')) {
    //                    TripType = "Two";
    //                }
    //                else {
    //                    TripType = "One";
    //                    todate = "";
    //                }
    //                //                var tflight = "";
    //                //                if (document.getElementById('=INTL.ClientID').checked) {
    //                //                    tflight = "INTL";
    //                //                }
    //                //                else if (document.getElementById('=DOM.ClientID ').checked) {
    //                //                    tflight = "DOM";
    //                //                }
    //                debugger;
    //                var index = document.getElementById('optClass').selectedIndex;
    //                var cabincls = "";
    //                if (index > -1)
    //                    cabincls = document.getElementById('optClass').options[index].text;
    //                finalstring = TripType + ";" + Fromsec + ";" + tosec + ";" + fromdate + ";" + todate + ";" + document.getElementById('optAdult').value + ";" + document.getElementById('Optchild').value + ";" + document.getElementById('OptInfant').value + ";" + cabincls + ";" + ";;;;;;D";
    //                window.location.href = ("FlightWaiting.aspx?ses=" + window.btoa(unescape(encodeURIComponent(finalstring))));
    //                return abc;
    //            }

    function TransferSearch1() {
        window.parent.location.href = "SearchTransferDetail.aspx?SessionT=";
        //India-IN~AGRA/AGR~11/10/2017~0315~H~A~1~0~3~AGR~121212
    }

    function citysightseeingsearch() {
        var countryname = document.getElementById('<%=Countrysight.ClientID %>').value;
        var cityname = document.getElementById('<%=Citysight.ClientID %>').value;
        var adults = document.getElementById('<%=DropDownList5.ClientID %>').value;
        var childs = document.getElementById('<%=DropDownList6.ClientID %>').value;
        var infants = document.getElementById('<%=DropDownList7.ClientID %>').value;
        var seniors = document.getElementById('<%=DropDownList8.ClientID %>').value;
        if (countryname == null || countryname == "" || countryname == "Select Country") {
            alert("Please Select a Country");
        }
        else if (cityname == null || cityname == "" || cityname == "Select City") {
            alert("Please Select a City");
        }

        else {
            window.parent.location.href = "searchcitysightseeing.aspx?SessionT=" + countryname + "~" + cityname + "~" + adults + "~" + childs + "~" + infants + "~" + seniors;
        }
    }

    function TransferSearch() {
        debugger;

        var countryname = document.getElementById('<%=Country.ClientID %>').value;
        var cityname = document.getElementById('<%=City.ClientID %>').value;
        var PickUpDate = document.getElementById('PickUpDate').value;

        var adults = document.getElementById('<%=DropDownList1.ClientID %>').value;


        var PickUphr = document.getElementById('<%=Hour.ClientID %>').value;
        var PickUpmin = document.getElementById('<%=Min.ClientID %>').value;
        var pickup = document.getElementById('<%=PickUp.ClientID %>').value;
        var Dropoff = document.getElementById('<%=DropOff.ClientID %>').value;
        //var adults = "2", child = "0", childage = "", childage1 = "", childage2 = "", childage3 = "", childage4 = "";
        var DropOffHotel = "";
        DropOffHotel = document.getElementById('<%=DropOffPoint.ClientID %>').value;
        var PickUpHotel = "";
        PickUpHotel = document.getElementById('<%=PickUpPoint.ClientID %>').value;

        if (countryname == null || countryname == "" || countryname == "Select Country") {
            alert("Please Select a Country");
        }
        else if (cityname == null || cityname == "" || cityname == "Select City") {
            alert("Please Select a City");
        }
        else if (pickup == null || pickup == "Select") {
            alert("Please Select Pick Up Value");
        }
        else if (Dropoff == null || Dropoff == "Select") {
            alert("Please Select Drop Off Value");
        }
        else if (PickUpDate == null || PickUpDate == "") {
            alert("Please Select Pick Up Date");
        }
        else if (PickUpmin == null || PickUpmin == "Min") {
            alert("Please Select Pick Up Minutes");
        }
        else if (PickUphr == null || PickUphr == "Hour") {
            alert("Please Select Pick Up Hours");
        }
        //var cc = dest.split(", ");
        //var adt = "";
        var child = "";
        var ch1 = "";
        var totch = document.getElementById("R_6").value;
        var chage = [9];
        chage[0] = document.getElementById("R_6_1").value;
        chage[1] = document.getElementById("R_6_2").value;
        chage[2] = document.getElementById("R_6_3").value;
        chage[3] = document.getElementById("R_6_4").value;
        chage[4] = document.getElementById("R_6_5").value;
        chage[5] = document.getElementById("R_6_6").value;
        chage[6] = document.getElementById("R_6_7").value;
        chage[7] = document.getElementById("R_6_8").value;
        chage[8] = document.getElementById("R_6_9").value;
        for (var n = 0; n < totch; n++) {
            if (ch1 == "") {
                ch1 += chage[n];
            }
            else {
                ch1 += "," + chage[n];
            }

        }

        window.parent.location.href = "SearchTransferDetail.aspx?SessionT=" + countryname + "~" + cityname + "~" + PickUpDate + "~" + PickUphr + "~" + PickUpmin + "~" + "" + "~" + "" + "~" + "" + "~" + pickup + "~" + Dropoff + "~" + adults + "~" + totch + "~" + ch1 + "~" + "" + "~" + "" + "~" + "" + "~" + "" + "~" + PickUpHotel + "~" + DropOffHotel + "~" + "@";

    }
</script>
<script type="text/javascript">
    function textbx() {
        debugger;
        var city = document.getElementById('<%= Citysight.ClientID %>');
        if (city.value == "Select City")
            $(passenger).hide();
        else
            $(passenger).show();
    }
</script>
<script type="text/javascript">
    function openDP() {
        window.location.href = ("http://booksight.theholidaykingdom.com/SearchPage.aspx?Rezlogin=" + window.btoa(unescape(encodeURIComponent("<%=loginval %>"))));
        document.getElementById('myTab').style.background = 'none';
    }
</script>
<style type="text/css">
    #passenger
    {
        display: none;
    }
</style>



             </head>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<form id="Form1" runat="server" style="margin-bottom: 0px;">
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div class="global-wrap"  style="margin-top:145px;">
    <div class="top-area show-onload">
        <input type="hidden" id="CityCode" runat="server" />
        <div class="bg-holder full">
            <div class="bg-front bg-front-mob-rel">
                <div class="container">
                    <div class="search-tabs search-tabs-bg search-tabs-abs" style="width: 100%;">
                      
                        <div class="tabbable">
                            <ul class="nav nav-tabs" id="myTab" style="">
                              
                                <li  class="active" id="hotelid" runat="server">
                                    <a href="#tab-1" data-toggle="tab" onclick="document.getElementById('myTab').style.background = 'rgba(0, 0, 0, 0.72) none repeat scroll 0% 0%'">
                                        <span><i class="fa fa-hotel search_tab" style="animation: wrench 13s linear infinite;"></i></span>
                                        <span class="padng">&nbsp;&nbsp;Hotels&nbsp;&nbsp;</span>
                                    </a>
                                </li>
                                <li id="flightid" runat="server">
                                    <a href="#tab-2" data-toggle="tab" onclick="document.getElementById('myTab').style.background = 'rgba(0, 0, 0, 0.72) none repeat scroll 0% 0%'">
                                        <span><i class="fa fa-plane search_tab" style="animation: spin 15s cubic-bezier(.49,-0.24,.68,.19) infinite;"></i></span>
                                        <span class="padng">&nbsp;&nbsp;Flights&nbsp;&nbsp;</span>
                                    </a>
                                </li>
                              
                                <li id="activityid" runat="server">
                                    <a onclick="Tours()"><%--href="#tab-5" data-toggle="tab" onclick="document.getElementById('myTab').style.background = 'rgba(0, 0, 0, 0.72) none repeat scroll 0% 0%'"--%>
                                        <span><i class="fa fa-bolt search_tab" style="animation: wrench 6s linear infinite;"></i></span>
                                        <span class="padng">&nbsp;&nbsp;&nbsp;TOURS&nbsp;&nbsp;&nbsp;</span><!--SightSeeing-->
                                    </a>
                                </li>
                                <li id="Li1" runat="server">
                                    <a href="VisaFormNew.aspx" onclick="document.getElementById('myTab').style.background = 'rgba(0, 0, 0, 0.72) none repeat scroll 0% 0%'">
                                        <span><i class="fa fa-pencil-square-o search_tab" style="animation: wrench 30s linear infinite;"></i></span>
                                        <span class="padng">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VISA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    </a>
                                </li>
                                <li id="Li4" runat="server">
                                    <a onclick="openDP();">
                                        <span><i class="fa fa-suitcase search_tab" style="animation: wrench 30s linear infinite;"></i></span>
                                        <span style="line-height: 15px; margin-top: 6px;">ISLAND </br>PACKAGES</span>
                                    </a> 
                                </li>
                                <li id="Li2" runat="server">
                                    <a href="International_insurance.aspx">
                                        <span><i class="fa fa-pencil-square-o search_tab" style="animation: wrench 30s linear infinite;"></i></span>
                                        <span style="line-height: 15px; margin-top: 6px;">Travel </br>Assistance</span>
                                    </a>
                                </li>
                                
                                <li id="Li3" runat="server">
                                    <a href="Sukoon/Packagesearch.aspx">
                                        <span><i class="fa fa-heart search_tab" style="animation: wrench 30s linear infinite;"></i></span>
                                        <span style="line-height: 31px; margin-top: 6px;">Sukoon</span>
                                    </a>
                                </li>


                        



                            </ul>
                            <div class="tab-content">
                                   
                                <div class="tab-pane active " id="tab-1" style="max-width: 989px; height: 325px; overflow-x: hidden; 
                                        padding-bottom: 0px;  padding-left: 24px; padding-top: 15px; padding-right: 24px;">
                                    <%--<h4>
                                        Search and Save on Hotels</h4>--%>
                                    <%--<form id="Form1">--%>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label>
                                                Where are you going?</label>
                                            <%--<input class="typeahead form-control" id="flttxtfromsec" placeholder="City, Airport, U.S. Zip"
                                            type="text" /><br />--%>
                                            <asp:TextBox ID="hlttxtfromsec" CssClass="form-control" placeholder="Enter Your Destination City, Country"
                                                runat="server" ReadOnly="False" Style="height: 48px;"></asp:TextBox>
                                            <asp:AutoCompleteExtender ID="TextBox1_AutoCompleteExtender" runat="server" DelimiterCharacters=""
                                                Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetCompletionList" ServicePath=""
                                                TargetControlID="hlttxtfromsec" CompletionSetCount="6" CompletionInterval="3"
                                                CompletionListCssClass="completionList"
                                                CompletionListItemCssClass="completionList_listItem" 
                                                CompletionListHighlightedItemCssClass="completionList_highlightedListItem" >
                                            </asp:AutoCompleteExtender>
                                        </div>
                                        <div class="input-daterange" data-date-format="dd M yyyy">
                                            <div class="col-md-3">
                                                <div class="form-group form-group-lg form-group-icon-left">
                                                    <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                    <label>
                                                        Check-in</label>
                                                    <input id="cin" class="form-control" name="start" type="text" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group form-group-lg form-group-icon-left">
                                                    <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                    <label>
                                                        Check-out</label>
                                                    <input id="cout" class="form-control" name="end" type="text" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div>
                                                <label style="font-size: 16px;">
                                                    Star Rating</label>
                                            </div>
                                            <div>
                                                <div class="a-box">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="starmin();">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none; height: 39px;" id="starrating" value="5" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="starplus();">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2 offset-0">
                                            <div class="col-md-14">
                                                <label style="font-size: 16px;">
                                                    Rooms</label>
                                            </div>
                                            <div class="col-md-14">
                                                <div class="a-box">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="minrooms();">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none; height: 39px;" id="rooms" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addrooms();">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label style="font-size: 16px;">
                                                Hotel Name</label>
                                            <input id="hotelname" class="form-control" type="text" name="hotelname" style="height: 40px;" />
                                        </div>
                                        <div class="col-md-3">
                                            <label style="font-size: 16px;">
                                                Location</label>
                                            <input id="location" class="form-control" onkeypress="return blockSpecialChar(event);" type="text" name="location" style="height: 40px;" />
                                        </div>
                                        <%--<div class="col-md-2">
                                            <label>
                                                Nationality</label>
                                            <select class="form-control" style="height: 40px;">
                                                <option selected="selected">Indian</option>
                                                <% 
                                                    var sql = "Select Distinct CountryName from NationalityCode";
                                                    sdr = DB.CommonDatabase.DataReader(sql);
                                                    int count = 0;
                                                    try
                                                    {
                                                        while (sdr.Read())
                                                        {
                                                %>
                                                <option value="<%=count %>">
                                                    <%=sdr["CountryName"].ToString()%></option>
                                                <% }
                                                        count += 1;
                                                    }
                                                    catch (Exception)
                                                    {
                                                    }
                                                %>
                                            </select>
                                        </div>--%>
                                    </div>
                                    <div class="row">
                                        <!-- room 1 start!-->
                                        <div style="margin-top: 9px;">
                                            <div style="width: 100%; height: auto;" id="room1">
                                                <div class="col-md-12 offset-0">
                                                    <div class="col-md-2 col-xs-6 offset-1">
                                                        <span class="formlabel">&nbsp;</span>
                                                        <div class="roomnumpn">
                                                            <span class="numroompn">Room<strong>(1)</strong> </span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 col-xs-6 offset-1">
                                                        <span class="formlabel">Adult</span>
                                                        <div class="a-box">
                                                            <div class="hf_adlplus">
                                                                <p class="text-center">
                                                                    <a onclick="radult_minus(this);" id='Adult1_minus'>- </a>
                                                                </p>
                                                            </div>
                                                            <div class="hf_adlval">
                                                                <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                    box-shadow: none;" id="Adult1" value="1" readonly=""></div>
                                                            <div class="hf_adlplus">
                                                                <p class="text-center">
                                                                    <a id="Adult1_plus" onclick="radult_plus(this);">+</a>
                                                                </p>
                                                            </div>
                                                            <div class="clearfix">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 col-xs-6 offset-1">
                                                        <span class="formlabel">Children</span>
                                                        <div class="a-box">
                                                            <div class="hf_adlplus">
                                                                <p class="text-center">
                                                                    <a onclick="childagemin(this)" id="M_1">- </a>
                                                                </p>
                                                            </div>
                                                            <div class="hf_adlval">
                                                                <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                    box-shadow: none;" id="R_1" value="0" readonly=""></div>
                                                            <div class="hf_adlplus">
                                                                <p class="text-center">
                                                                    <a onclick="childageadd(this)" id="P_1">+</a>
                                                                </p>
                                                            </div>
                                                            <div class="clearfix">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="display: none;" id="c_1_1" class="col-md-2 col-xs-4  offset-1">
                                                        <span class="formlabel">Child - 1 age</span>
                                                        <div class="a-box">
                                                            <div class="hf_adlplus">
                                                                <p class="text-center">
                                                                    <a onclick="removeage('R_1_1')">- </a>
                                                                </p>
                                                            </div>
                                                            <div class="hf_adlval">
                                                                <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                    box-shadow: none;" id="R_1_1" value="1" readonly=""></div>
                                                            <div class="hf_adlplus">
                                                                <p class="text-center">
                                                                    <a onclick="addage('R_1_1')">+</a>
                                                                </p>
                                                            </div>
                                                            <div class="clearfix">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="display: none;" id="c_1_2" class="col-md-2 col-xs-4  offset-0">
                                                        <span class="formlabel">Child - 2 age</span>
                                                        <div class="a-box">
                                                            <div class="hf_adlplus">
                                                                <p class="text-center">
                                                                    <a onclick="removeage('R_1_2')">- </a>
                                                                </p>
                                                            </div>
                                                            <div class="hf_adlval">
                                                                <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                    box-shadow: none;" id="R_1_2" value="1" readonly=""></div>
                                                            <div class="hf_adlplus">
                                                                <p class="text-center">
                                                                    <a onclick="addage('R_1_2')">+</a>
                                                                </p>
                                                            </div>
                                                            <div class="clearfix">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- room 1 end!-->
                                    </div>
                                    <div class="row">
                                        <!-- rooms two start!-->
                                        <div>
                                            <div style="width: 100%; height: auto; padding-bottom: 2px; display: none;" id="room2">
                                                <div class="col-md-12 nopad childgroup offset-0">
                                                    <div class="col-md-2 col-xs-4 mefullwdhtl offset-1 ">
                                                        <span class="formlabel">&nbsp;</span>
                                                        <div class="roomnumpn">
                                                            <span class="numroompn">Room<strong>(2)</strong> </span>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div id="Row2_room2" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Adult</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a id="Adult2_minus" onclick="radult_minus(this);">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="Adult2" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a id="Adult2_plus" onclick="radult_plus(this);">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="R2_room2_ch2" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Children</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="childagemin(this)" id="M_2">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_2" value="0" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="childageadd(this)" id="P_2">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="c_2_1" style="display: none;" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Child - 1 age</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="removeage('R_2_1')">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_2_1" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="addage('R_2_1')">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="c_2_2" style="display: none;" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-0">
                                                            <span class="formlabel">Child - 2 age</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="removeage('R_2_2')">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_2_2" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="addage('R_2_2')">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- rooms two end!-->
                                    </div>
                                    <div class="row">
                                        <!-- room 3 start!-->
                                        <div>
                                            <div style="width: 100%; height: auto; padding-bottom: 2px; display: none;" id="room3">
                                                <div class="col-md-12 nopad childgroup offset-0">
                                                    <div class="col-md-2 col-xs-4 mefullwdhtl offset-1">
                                                        <span class="formlabel">&nbsp;</span>
                                                        <div class="roomnumpn">
                                                            <span class="numroompn">Room<strong>(3)</strong> </span>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div id="Row3_room3" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Adult</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a id="Adult3_minus" onclick="radult_minus(this);">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="Adult3" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a id="Adult3_plus" onclick="radult_plus(this);">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="R3_room3_ch3" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Children</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="childagemin(this)" id="M_3">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_3" value="0" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="childageadd(this)" id="P_3">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="c_3_1" style="display: none;" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Child - 1 age</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="removeage('R_3_1')">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_3_1" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="addage('R_3_1')">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="c_3_2" style="display: none;" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Child - 2 age</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="removeage('R_3_2')">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_3_2" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="addage('R_3_2')">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- room 3 end!-->
                                    </div>
                                    <div class="row">
                                        <!-- room 4 start!-->
                                        <div>
                                            <div style="width: 100%; height: auto; padding-bottom: 2px; display: none;" id="room4">
                                                <div class="col-md-12 nopad childgroup offset-0">
                                                    <div class="col-md-2 col-xs-4 mefullwdhtl offset-1">
                                                        <span class="formlabel">&nbsp;</span>
                                                        <div class="roomnumpn">
                                                            <span class="numroompn">Room<strong>(4)</strong> </span>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div id="Row4_room4" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Adult</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a id="Adult4_minus" onclick="radult_minus(this);">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="Adult4" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a id="Adult4_plus" onclick="radult_plus(this);">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="R4_room4_ch4" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Children</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="childagemin(this)" id="M_4">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_4" value="0" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="childageadd(this)" id="P_4">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="c_4_1" style="display: none;" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Child - 1 age</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="removeage('R_4_1')">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_4_1" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="addage('R_4_1')">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div id="c_4_2" style="display: none;" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                                            <span class="formlabel">Child - 2 age</span>
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="removeage('R_4_2')">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="R_4_2" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="addage('R_4_2')">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- room 4 end!-->
                                    </div>
                                    <div class="col-md-5" style="width: 78%;">
                                    </div>
                                    <input id="Hotel" class="btn btn-primary btn-lg" style="width: 180px; height: 45px;
                                        margin-top: 10px; margin-bottom: 10px;" type="button" runat="server" value="Search for Hotels"
                                        onclick="myhotel(); return false;" />
                                    <%--</form>--%>
                                </div>


                                <div class="tab-pane fade" id="tab-2" style="max-width: 989px; height: 302px; overflow-x: hidden;">
                                    <%-- <h2>
                                        Search for Cheap Flights</h2>--%>
                                    <%--<form id="Form2" runat="server">--%>
                                    <div class="tabbable" style="margin-top: -13px;">
                                        <ul class="nav nav-tabs" id="flightChooseTab">
                                            <li class="active"><a id="rndclik" class="Triptypelink" href="#flight-search-1" data-toggle="tab"
                                                onclick="roundtrip();">Round Trip</a> </li>
                                            <li><a id="Oneclik" class="Triptypelink" href="#flight-search-2" data-toggle="tab"
                                                onclick="onetrip();">One Way</a> </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade in active" id="flight-search-1">
                                                <div class="row">
                                                    <div class="col-md-6" style="height: 79px;">
                                                        <div class="form-group form-group-lg form-group-icon-left">
                                                            <i class="fa fa-map-marker input-icon"></i>
                                                            <label>
                                                                From</label>
                                                            <asp:TextBox ID="flttxtfromsec" CssClass="form-control" placeholder="Enter Your Departure City, Country" runat="server"></asp:TextBox>
                                                            <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" DelimiterCharacters=""
                                                                Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetFlight" ServicePath=""
                                                                TargetControlID="flttxtfromsec" CompletionSetCount="6" CompletionInterval="3"
                                                                CompletionListCssClass="completionList"
                                                                CompletionListItemCssClass="completionList_listItem" 
                                                                CompletionListHighlightedItemCssClass="completionList_highlightedListItem" >
                                                            </asp:AutoCompleteExtender>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6" style="height: 79px;">
                                                        <div class="form-group form-group-lg form-group-icon-left">
                                                            <i class="fa fa-map-marker input-icon"></i>
                                                            <label>
                                                                To</label>
                                                            <asp:TextBox ID="flttxttosec" CssClass="form-control" placeholder="Enter Your Destination City, Country" runat="server"></asp:TextBox>
                                                            <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" DelimiterCharacters=""
                                                                Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetFlight" ServicePath=""
                                                                TargetControlID="flttxttosec" CompletionSetCount="6" CompletionInterval="3"
                                                                CompletionListCssClass="completionList"
                                                                CompletionListItemCssClass="completionList_listItem" 
                                                                CompletionListHighlightedItemCssClass="completionList_highlightedListItem" >
                                                            </asp:AutoCompleteExtender>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="input-daterange" data-date-format="dd/M/yyyy">
                                                        <div class="col-md-3" style="height: 75px;">
                                                            <div class="form-group form-group-lg form-group-icon-left">
                                                                <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                <label>
                                                                    Departing</label>
                                                                <input class="form-control" name="start" id="txtfromdate" type="text" />
                                                            </div>
                                                        </div>
                                                        <div id="rdata" class="col-md-3" style="height: 80px;">
                                                            <div class="form-group form-group-lg form-group-icon-left">
                                                                <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                <label>
                                                                    Returning</label>
                                                                <input class="form-control" name="end" id="txttodate" type="text" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 offset-0">
                                                            <div class="col-md-12">
                                                                <label style="font-size: 16px;">
                                                                    Class</label></div>
                                                            <div class="col-md-12 ">
                                                                <div class="a-box" style="border: none;">
                                                                    <select name="optClass" size="1" id="optClass" class="form-control" style="height: 40px;
                                                                        margin-top: 2px;">
                                                                        <option value="">Any</option>
                                                                        <option value="Y">Economy</option>
                                                                        <option value="C">Business</option>
                                                                        <option value="F">First</option>
                                                                        <option value="W">Premium Economy</option>
                                                                    </select>
                                                                    </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 offset-0">
                                                            <div class="col-md-12">
                                                                <label style="font-size: 16px;">
                                                                    Flight</label></div>
                                                            <div class="col-md-12 ">
                                                                <div class="a-box" style="border: none;">
                                                                    <%--<select name="optClass" size="1" id="Select1" class="form-control" style="height: 40px;
                                                                        margin-top: 2px;">
                                                                    </select>--%>
                                                                    <input class="form-control" id="flightcode" type="text" onkeypress="return blockSpecialChar(event);" style="height: 42px;"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2 offset-0">
                                                        <div class="col-md-10">
                                                            <label style="font-size: 16px;">
                                                                Adult (12+ Yr)</label>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="agemin();">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="optAdult" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="ageplus();">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 offset-0">
                                                        <div class="col-md-13">
                                                            <label style="font-size: 16px;">
                                                                Child (Under 12 Yr)</label></div>
                                                        <div class="col-md-10">
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="chmin();">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="Optchild" value="0" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="chplus();">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 offset-0">
                                                        <div class="col-md-13">
                                                            <label style="font-size: 16px;">
                                                                Infant (Under 2 Yr)</label></div>
                                                        <div class="col-md-10">
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="infantmin();">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="OptInfant" value="0" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="infantplus();">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                    </div>
                                                    <div class="col-md-3" style="margin-top: 9px;">
                                                        <button id="Button1" class="btn btn-primary btn-lg" type="submit" runat="server"
                                                            onclick="Validate(); return false;" style="margin-top: 10px;">
                                                            Search for Flights</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

<%--                                        <div class="tabbable" style="margin-top: -13px;">
                                        <ul class="nav nav-tabs" id="flightChooseTab">
                                            <li class="active"><a id="rndclik" class="Triptypelink" href="#flight-search-1" data-toggle="tab"
                                                onclick="roundtrip();">Round Trip</a> </li>
                                            <li><a id="Oneclik" class="Triptypelink" href="#flight-search-2" data-toggle="tab"
                                                onclick="onetrip();">One Way</a> </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade in active" id="flight-search-1">
                                                <div class="row">
                                                    <div class="col-md-6" style="height: 79px;">
                                                        <div class="form-group form-group-lg form-group-icon-left">
                                                            <i class="fa fa-map-marker input-icon"></i>
                                                            <label>
                                                                From</label>
                                                            <asp:TextBox ID="flttxtfromsec" CssClass="form-control" placeholder="Enter Your Destination City, Country"
                                                                runat="server"></asp:TextBox>
                                                            <asp:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" DelimiterCharacters=""
                                                                Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetFlight" ServicePath=""
                                                                TargetControlID="flttxtfromsec">
                                                            </asp:AutoCompleteExtender>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6" style="height: 79px;">
                                                        <div class="form-group form-group-lg form-group-icon-left">
                                                            <i class="fa fa-map-marker input-icon"></i>
                                                            <label>
                                                                To</label>
                                                            <asp:TextBox ID="flttxttosec" CssClass="form-control" placeholder="Enter Your Destination City, Country"
                                                                runat="server"></asp:TextBox>
                                                            <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" DelimiterCharacters=""
                                                                Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetFlight" ServicePath=""
                                                                TargetControlID="flttxttosec">
                                                            </asp:AutoCompleteExtender>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="input-daterange" data-date-format="dd/M/yyyy">
                                                        <div class="col-md-4" style="height: 75px;">
                                                            <div class="form-group form-group-lg form-group-icon-left">
                                                                <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                <label>
                                                                    Departing</label>
                                                                <input class="form-control" name="start" id="txtfromdate" type="text" />
                                                            </div>
                                                        </div>
                                                        <div id="rdata" class="col-md-4" style="height: 80px;">
                                                            <div class="form-group form-group-lg form-group-icon-left">
                                                                <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                <label>
                                                                    Returning</label>
                                                                <input class="form-control" name="end" id="txttodate" type="text" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 offset-0">
                                                            <div class="col-md-12">
                                                                <label style="font-size: 16px;">
                                                                    Class</label></div>
                                                            <div class="col-md-12 ">
                                                                <div class="a-box" style="border: none;">
                                                                    <select name="optClass" size="1" id="optClass" class="form-control" style="height: 40px;
                                                                        margin-top: 2px;">
                                                                        <option value="">Any</option>
                                                                        <option value="Y">Economy</option>
                                                                        <option value="C">Business</option>
                                                                        <option value="F">First</option>
                                                                        <option value="W">Premium Economy</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2 offset-0">
                                                        <div class="col-md-10">
                                                            <label style="font-size: 16px;">
                                                                Adult (12+ Yr)</label>
                                                        </div>
                                                        <div class="col-md-10">
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="agemin();">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="optAdult" value="1" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="ageplus();">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 offset-0">
                                                        <div class="col-md-13">
                                                            <label style="font-size: 16px;">
                                                                Child (Under 12 Yr)</label></div>
                                                        <div class="col-md-10">
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="chmin();">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="Optchild" value="0" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="chplus();">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 offset-0">
                                                        <div class="col-md-13">
                                                            <label style="font-size: 16px;">
                                                                Infant (Under 2 Yr)</label></div>
                                                        <div class="col-md-10">
                                                            <div class="a-box">
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="infantmin();">- </a>
                                                                    </p>
                                                                </div>
                                                                <div class="hf_adlval">
                                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                        box-shadow: none;" id="OptInfant" value="0" readonly=""></div>
                                                                <div class="hf_adlplus">
                                                                    <p class="text-center">
                                                                        <a onclick="infantplus();">+</a>
                                                                    </p>
                                                                </div>
                                                                <div class="clearfix">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                    </div>
                                                    <div class="col-md-3" style="margin-top: 9px;">
                                                        <button id="Button1" class="btn btn-primary btn-lg" type="submit" runat="server"
                                                            onclick="Validate(); return false;" style="margin-top: 10px;">
                                                            Search for Flights</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                    <%--</form>--%>
                                </div>
                                <div class="tab-pane fade" id="tab-3" style="max-width: 989px; height: 300px; overflow: scroll; overflow-x: hidden; overflow-y: scroll;">
                                    <div class="input-daterange" style="margin-top: -15px;">
                                    <%--<div class="input-daterange" data-date-format="dd M yyyy">--%>
                                        <div class="row">
                                        <asp:UpdatePanel ID="updatepanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="col-md-3">
                                                    <div class="form-group form-group-lg form-group-icon-left">
                                                        <i class="fa fa-map-marker input-icon"></i>
                                                        <label>
                                                            Country</label>
                                                        <asp:DropDownList ID="Country" runat="server" CssClass="form-control" AutoPostBack="true"
                                                            OnSelectedIndexChanged="Country_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group form-group-lg form-group-icon-left">
                                                        <i class="fa fa-map-marker input-icon"></i>
                                                        <label>
                                                            City</label>
                                                        <asp:DropDownList ID="City" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group form-group-lg">
                                                        <label>
                                                            Pick Up</label>
                                                        <asp:DropDownList ID="PickUp" runat="server" CssClass="form-control" AutoPostBack="true"
                                                            OnSelectedIndexChanged="PickUp_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group form-group-lg">
                                                        <label>
                                                            Pick Up Point</label>
                                                        <asp:DropDownList ID="PickUpPoint" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                        <div class="row">
                                        <div class="col-md-3">
                                            <div class="input-daterange">
                                                <div class="form-group form-group-lg form-group-icon-left" style="height: 64px;">
                                                    <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                    <label>
                                                        Pick Up Date</label>
                                                    <input class="form-control" name="start" id="PickUpDate" type="text" />
                                                </div>
                                            </div>
                                        </div>
                                        <asp:UpdatePanel ID="updatepanel2" runat="server">
                                            <ContentTemplate>
                                                <div class="col-md-2" style="width: 131px;">
                                                    <div class="form-group form-group-lg">
                                                        <label>
                                                            Pick Up Time</label>
                                                        <asp:DropDownList ID="Hour" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-2" style="width: 111px;">
                                                    <div class="form-group form-group-lg">
                                                        <label>
                                                            &nbsp;</label>
                                                        <asp:DropDownList ID="Min" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-3" style="width: 214px">
                                                    <div class="form-group form-group-lg">
                                                        <label>
                                                            Drop Off</label>
                                                        <asp:DropDownList ID="DropOff" runat="server" CssClass="form-control" AutoPostBack="true"
                                                            OnSelectedIndexChanged="DropOff_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group form-group-lg">
                                                        <label>
                                                            Drop Off Point</label>
                                                        <asp:DropDownList ID="DropOffPoint" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                        <div class="row">
                                            <div class="col-md-2" style="width: 131px;">
                                                <div class="form-group form-group-lg">
                                                    <label>
                                                        Adults</label>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                        <asp:ListItem Value="2" Selected="True">2</asp:ListItem>
                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                        <asp:ListItem Value="5">5</asp:ListItem>
                                                        <asp:ListItem Value="6">6</asp:ListItem>
                                                        <asp:ListItem Value="7">7</asp:ListItem>
                                                        <asp:ListItem Value="8">8</asp:ListItem>
                                                        <asp:ListItem Value="9">9</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-2" style="width: 150px;">
                                                <div class="form-group form-group-lg">
                                                <div class="col-md-12 col-xs-6 offset-1" style="width: 120px;" >
                                                    <span class="formlabel" style="font-size: 16px;">Children</span>
                                                    <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                        <div class="hf_adlplus">
                                                            <p class="text-center">
                                                                <a onclick="childagemin2(this)" id="M_6">- </a>
                                                            </p>
                                                        </div>
                                                        <div class="hf_adlval">
                                                            <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                                box-shadow: none;" id="R_6" value="0" readonly=""></div>
                                                        <div class="hf_adlplus">
                                                            <p class="text-center">
                                                                <a onclick="childageadd2(this)" id="P_6">+</a>
                                                            </p>
                                                        </div>
                                                        <div class="clearfix">
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                            </div>

                                                
                                            <div style="display: none;width: 120px;" id="c_6_1" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 1 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_1')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_1" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_1')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;width: 120px;" id="c_6_2" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 2 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_2')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_2" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_2')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;width: 120px;" id="c_6_3" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 3 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_3')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_3" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_3')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-3" style="float:right;">
                                                <input id="Transfer" class="btn btn-primary btn-lg" style="margin-top: 10px;" type="button"
                                                    runat="server" value="Search for Transfer" onclick="TransferSearch(this);" />
                                            </div>
                                               
                                        </div>
                                            
                                        <div class="row">
                                            <div class="col-md-2"></div>
                                            <div style="display: none;width: 120px;" id="c_6_4" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 4 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_4')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_4" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_4')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;width: 120px;" id="c_6_5" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 5 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_5')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_5" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_5')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;width: 120px;" id="c_6_6" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 6 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_6')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_6" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_6')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;width: 120px;" id="c_6_7" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 7 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_7')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_7" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_7')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;width: 120px;" id="c_6_8" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 8 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_8')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_8" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_8')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;width: 120px;" id="c_6_9" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 9 age</span>
                                                <div class="a-box" style="margin-top: 7px;width: 100px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_6_9')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_6_9" value="14" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_6_9')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            </div>

                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-5" style="max-width: 989px; height: 269px; padding: 16px;
                                    overflow: scroll; overflow-x: hidden; overflow-y: scroll;">
                                    <%--<h2>
                                        Search for Activities</h2>--%>
                                    <%--<form id="Form5" runat="server">--%>
                                    <div class="row">
                                        <!--style="height: 175px;"-->
                                        <div class="col-md-6">
                                            <div class="form-group form-group-lg form-group-icon-left">
                                                <i class="fa fa-map-marker input-icon"></i>
                                                <label>
                                                    Where are you going?</label>
                                                <%--<input id="destination" class="typeahead form-control" placeholder="City, Airport, Point of Interest or U.S. Zip Code"
                                                        name="activitydest" type="text" />--%>
                                                <asp:TextBox ID="destination" CssClass="form-control" placeholder="Enter Your Destination City, Country" runat="server"></asp:TextBox>
                                                <asp:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" DelimiterCharacters=""
                                                    Enabled="True" MinimumPrefixLength="1" ServiceMethod="GetCompletionList" ServicePath=""
                                                    TargetControlID="destination"
                                                    CompletionListCssClass="completionList"
                                                    CompletionListItemCssClass="completionList_listItem" 
                                                    CompletionListHighlightedItemCssClass="completionList_highlightedListItem" >
                                                </asp:AutoCompleteExtender>
                                            </div>
                                        </div>
                                        <div class="input-daterange" data-date-format="dd M yyyy">
                                            <div class="col-md-3">
                                                <div class="form-group form-group-lg form-group-icon-left">
                                                    <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                    <label>
                                                        From</label>
                                                    <input id="start" class="form-control" name="start" type="text" />
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group form-group-lg form-group-icon-left">
                                                    <i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                    <label>
                                                        To</label>
                                                    <input id="end" class="form-control" name="end" type="text" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2" style="height: 75px;">
                                            <div class="form-group form-group-lg form-group-icon-left">
                                                <%--<i class="fa fa-map-marker input-icon"></i>--%>
                                                <label>
                                                    Language</label>
                                                <input id="laung" class="typeahead form-control" style="padding-left: 15px;" placeholder="Eng" onkeypress="return lettersOnly(event);" name="activitydest"
                                                    type="text" />
                                            </div>
                                        </div>
                                        <div id="Div1" class="col-md-2 col-xs-4 mefullwdhtl fiveh offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult</span>
                                            <div class="a-box" style="margin-top: 7px; height: 37px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a id="B_9" onclick="adultagemin(this);">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval" style="background-color: white; height: 35px;">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9" value="1" readonly=""></div>
                                                <div class="hf_adlplus" style="height: 36px; width: 26%;">
                                                    <p class="text-center">
                                                        <a id="E_9" onclick="adultageadd(this);">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="D_9_1" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 1 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_1')">-</a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_1" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_1')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: none;" id="D_9_2" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 2 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_2')">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_2" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_2')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: none;" id="D_9_3" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 3 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_3')">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_3" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_3')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: none;" id="D_9_4" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 4 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_4')">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_4" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_4')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: none;" id="D_9_5" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 5 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_5')">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_5" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_5')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: none;" id="D_9_6" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 6 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_6')">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_6" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_6')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: none;" id="D_9_7" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 7 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_7')">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_7" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_7')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: none;" id="D_9_8" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 8 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_8')">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_8" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_8')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: none;" id="D_9_9" class="col-md-2 col-xs-4  offset-1">
                                            <span class="formlabel" style="font-size: 16px;">Adult - 9 age</span>
                                            <div class="a-box" style="margin-top: 7px; height: 38px;">
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adremoveage('A_9_9')">- </a>
                                                    </p>
                                                </div>
                                                <div class="hf_adlval">
                                                    <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                        box-shadow: none;" id="A_9_9" value="15" readonly=""></div>
                                                <div class="hf_adlplus">
                                                    <p class="text-center">
                                                        <a onclick="adaddage('A_9_9')">+</a>
                                                    </p>
                                                </div>
                                                <div class="clearfix">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="col-md-2 col-xs-6 offset-1">
                                                <span class="formlabel" style="font-size: 16px;">Children</span>
                                                <div class="a-box" style="margin-top: 7px; height: 37px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="childagemin1(this)" id="M_5">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5" value="0" readonly=""></div>
                                                    <div class="hf_adlplus" style="width: 28%;">
                                                        <p class="text-center">
                                                            <a onclick="childageadd1(this)" id="P_5">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_1" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 1 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_1')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_1" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_1')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_2" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 2 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_2')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_2" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_2')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_3" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 3 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_3')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_3" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_3')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_4" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 4 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_4')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_4" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_4')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_5" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 5 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_5')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_5" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_5')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_6" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 6 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_6')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_6" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_6')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_7" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 7 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_7')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_7" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_7')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_8" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 8 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_8')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_8" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_8')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;" id="c_5_9" class="col-md-2 col-xs-4  offset-0">
                                                <span class="formlabel" style="font-size: 16px;">Child - 9 age</span>
                                                <div class="a-box" style="margin-top: 7px; height: 40px;">
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="removeage('R_5_9')">- </a>
                                                        </p>
                                                    </div>
                                                    <div class="hf_adlval">
                                                        <input type="text" class="form-control" style="border-radius: 0px; border: none !important;
                                                            box-shadow: none;" id="R_5_9" value="1" readonly=""></div>
                                                    <div class="hf_adlplus">
                                                        <p class="text-center">
                                                            <a onclick="addage('R_5_9')">+</a>
                                                        </p>
                                                    </div>
                                                    <div class="clearfix">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <input id="Activity" class="btn btn-primary btn-lg" style="width: 155px; height: 45px;
                                            margin-top: 10px;" type="button" runat="server" value="Search Activity" onclick="sightseen(this);" />
                                    </div>
                                    <%-- </form>--%>
                                </div>
                                <div class="tab-pane fade" id="tab-6" style="max-width: 989px; height: 300px; overflow-x: hidden;">
                                    <div class="input-daterange" style="margin-top: -15px;">
                                        <div class="row">
                                            <asp:UpdatePanel ID="updatepanel3" runat="server">
                                                <ContentTemplate>
                                                    <div class="col-md-6">
                                                        <div class="form-group form-group-lg form-group-icon-left">
                                                            <i class="fa fa-map-marker input-icon"></i>
                                                            <label>
                                                                Country</label>
                                                            <asp:DropDownList ID="Countrysight" runat="server" CssClass="form-control" AutoPostBack="true"
                                                                OnSelectedIndexChanged="Countrysight_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group form-group-lg form-group-icon-left">
                                                            <i class="fa fa-map-marker input-icon"></i>
                                                            <label>
                                                                City</label>
                                                            <asp:DropDownList ID="Citysight" runat="server" CssClass="form-control" AutoPostBack="true"
                                                                OnSelectedIndexChanged="Citysight_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                        <asp:UpdatePanel ID="upWall" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div id="passenger">
                                                    <%-- adult--%>
                                                    <div class="col-md-3">
                                                        <div class="form-group form-group-lg">
                                                            <label id="ad" runat="server">
                                                                Adult</label>
                                                            <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="1" Selected="True">1</asp:ListItem>
                                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <%--chlid --%>
                                                    <div class="col-md-3">
                                                        <div class="form-group form-group-lg">
                                                            <label id="ch" runat="server">
                                                                Child</label>
                                                            <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="0" Selected="True">0</asp:ListItem>
                                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <%--Infants --%>
                                                    <div class="col-md-3">
                                                        <div class="form-group form-group-lg">
                                                            <label id="inf" runat="server">
                                                            </label>
                                                            <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="0" Selected="True">0</asp:ListItem>
                                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <%--Seniors --%>
                                                    <div class="col-md-3">
                                                        <div class="form-group form-group-lg">
                                                            <label id="sen" runat="server">
                                                            </label>
                                                            <asp:DropDownList ID="DropDownList8" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="0" Selected="True">0</asp:ListItem>
                                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                                <asp:ListItem Value="8">8</asp:ListItem>
                                                                <asp:ListItem Value="9">9</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="row">
                                            <div class="col-md-9">
                                            </div>
                                            <input id="Button2" class="btn btn-primary btn-lg" style="max-width: 215px; font-size: inherit;
                                                height: 45px; margin-top: 10px;" type="button" runat="server" value="Search For Hop On Hop Off"
                                                onclick="citysightseeingsearch(this);" />
                                            <%-- </form>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

                <div class="owl-carousel owl-slider owl-carousel-area visible-lg" id="owl-carousel-slider" style="display: block !important;margin-top:-65px !important;background-image: url(AirlineLogo/AirlineLogo/b11.jpg)">
                
        <div class="bg-img hidden-lg" style="background-image: url(AirlineLogo/AirlineLogo/banner11.jpg);">
        </div>
                    </div>
                    
                    
                
                   
             
  
       
        <div class="bg-img hidden-lg" style="background-image: url(AirlineLogo/AirlineLogo/banner11.jpg);">
        </div>
       
      
             </div>
           </div>
     </div>
<!-- Banner Start  -->





<!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
    
          <!-- Modal content-->
          <div class="modal-content" style="max-width: 550px;"><%--width:670px;--%>
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Submit your Query for Package</h4>
            </div>
            <div class="modal-body" style="height:350px;">
                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <p >Email<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Email" onblur="emailValidator(document.getElementById('ctl00_ContentPlaceHolder1_Email'), 'Invalid Email-Id')" class="form-control" placeholder="Email" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <p >Name<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="txtName" onkeypress="return lettersOnly(event);" class="form-control" placeholder="Name" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md0">
                    </div>
                    <div class="col-md-4">
                        <p >Company Name<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Company_Name" class="form-control" placeholder="Company Name" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <p >Mobile No.<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Mobile" onkeypress="return Numeric(event)" class="form-control" placeholder="Mobile No" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md0">
                    </div>
                    <div class="col-md-4">
                        <p >Package Name<sapn style="color:red;">*</sapn></p>
                    </div>
                    <div class="col-md-3">
                        <input type="text" id="Package_Name" onkeypress="return lettersOnly(event);" class="form-control" placeholder="Package Name" runat="server" style="width:200px;"/>
                    </div>
                </div>

                <div class="col-md-12" style="margin-bottom:10px;">
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-3">
                        <p >Message</p>
                    </div>
                    <div class="col-md-3">
                        <textarea id="Message" name="Message" rows="2" cols="20" title="Please Enter Your Message..!!" style="width:200px;"
                        class="form-control" placeholder="Message" runat="server"></textarea>

                       <%-- <input type="text" id="Message" class="form-control" placeholder="Message" runat="server" style="width:200px;"/>--%>
                    </div>
                </div>

                <asp:UpdatePanel ID="UpdatePanel4"  runat="server">
                <ContentTemplate>
                    <div class="col-md-12" style="text-align:center;">
                        <div class="col-md-5" id="align" style="display:none;"></div>
                        <input id="Button3" type="button" class="btn Newsletter" value="Send" style="width:100px;" onclick="sendMail();" runat="server"/>
                        <input id="mail" type="button" class="btn btn-info" value="Send" style="display: none;" onserverclick="Subscribe" runat="server" />
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                <script type="text/javascript">
                    function sendMail() {
                        debugger;
                        if (document.getElementById('ctl00_ContentPlaceHolder1_Email').value == "") {
                            alert("Please Enter Email..!");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_Name').value == "") {
                            alert("Please Enter Name..!");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_Company_Name').value == "") {
                            alert("Please Enter Company Name");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_Mobile').value == "") {
                            alert("Please Enter Mobile..!");
                        }
                        else if (document.getElementById('ctl00_ContentPlaceHolder1_Package_Name').value == "") {
                            alert("Please Enter Package Name..!");
                        }
                        else {
                            document.getElementById("ctl00_ContentPlaceHolder1_Label2").innerHTML = "<span style='color: red;'>Please wait..!</span>";
                            document.getElementById("ctl00_ContentPlaceHolder1_Label2").style.display = "block";
                            document.getElementById("ctl00_ContentPlaceHolder1_Button3").style.display = "none";
                            //document.getElementById("clse").click();
                            document.getElementById("ctl00_ContentPlaceHolder1_mail").click();
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

                            document.getElementById('ctl00_ContentPlaceHolder1_Email').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Name').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Company_Name').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Mobile').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Package_Name').value = "";
                            document.getElementById('ctl00_ContentPlaceHolder1_Message').value = "";
                        }, seconds * 1000);
                    };
                </script>

            </div>
           <%-- <div class="modal-footer" style="border-top: 1px solid white;">
                <button id="clse" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>--%>
          </div>
      
        </div>
  </div>
<!-- Modal -->
</form>




</asp:Content>
