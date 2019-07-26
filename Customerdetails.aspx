<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customerdetails.aspx.cs" Inherits="Customerdetails" %>

<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<%@ Register Src="~/header.ascx" TagPrefix="user" TagName="head" %>
<%@ Register Src="~/footer.ascx" TagPrefix="user" TagName="h1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <HeadTitle:HTitle ID="thead" runat="server" />
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="HotelJs/Header.js" type="text/javascript"></script>
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600' rel='stylesheet' type='text/css' />
    <!-- /GOOGLE FONTS -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/icomoon.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/mystyles.css" />
    <script type="text/javascript" src="js/modernizr.js"></script>
    <link rel="stylesheet" href="css/switcher.css" />

    <script src="js/dropdowncontent.js" type="text/javascript"></script>
    <style type="text/css">
        .offset-1 {
            padding-left: 5px;
            padding-right: 5px;
        }

        img {
            width: 100%;
            /*height: 170px;*/
        }

        .headingdata {
            font-size: 16px;
            padding: 9px;
         
            color: #fff;
            margin-bottom: 16px;
                background-image: radial-gradient(circle, #051937, #004770, #007884, #00a865, #92cd18);
        }

        .bck {
            background: #fff
        }

        .bb {
            border-bottom: 1px solid red;
            padding: 5px;
        }

        .hname {
            padding: 9px;
            background: #d40a0c;
            color: #fff;
            text-align: center;
        }

        .star {
            font-size: 20px;
            color: #d40a0c;
            padding: 4px;
        }

        .dec {
            font-weight: bolder;
        }

        .fare {
            padding: 10px;
            background: #d40a0c;
            color: #fff;
            margin-top: 15px;
        }

        .add {
            padding: 10px;
            background: #0b54a0;
            color: #fff;
            margin-top: 15px;
        }

        .red-btn {
            background: #d4050b !important;
            padding: 6px 20px !important;
            color: #fff !important;
            border-radius: 2px;
            margin-top: 8px;
            margin-bottom: 8px;
        }
    </style>
    <script type="text/javascript">
        function blockSpecialChar(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
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
</head>
<body>
    <!-- FACEBOOK WIDGET -->
    <user:head ID="header" runat="server" />
    <form id="form1" runat="server">
        <div id="fb-root">
        </div>
        <script>
            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        </script>
        <script type="text/javascript">
            function selectedyes() {
                if (document.getElementById('Check').checked == true) {
                    document.getElementById('cust_details').disabled = false;

                }
                else {
                    document.getElementById('cust_details').disabled = true;
                }
            }
        </script>
        <!-- /FACEBOOK WIDGET -->
        <div class="global-wrap" style="background: #eeeeee">
            <div class="gap">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-9 bck">
                        <!-- passanger details section start!-->
                        <div class="col-md-12 offset-1">

                            <div class="row headingdata" align="center">
                                Customer Details
                            </div>

                            <!-- first room details start!-->
                            <% 
                                var bookdata1 = Session["Bookingdetails"].ToString();
                                string[] sp;
                                if (testsupp == "JT")
                                {
                                    sp = bookdata1.Split('!')[17].Split('%')[0].Split('-');
                                }
                                else
                                {
                                    sp = bookdata1.Split('!')[17].Split('%')[0].Split('~');
                                }
                                //string[] rt = bookdata1.Split('!')[17].Split('%')[1].Split('@');
                                var searchparam = Session["Param"].ToString();
                                string[] fld = searchparam.Split('~');

                                if (fld.Length >= 2)
                                {%>
                            <%int adt1 = Convert.ToInt16(fld[1].Split('^')[0]);
                                int ch1 = Convert.ToInt16(fld[1].Split('^')[1]); %>
                            <div class="row">
                                <%--<p style="margin-left: 15px;">--%>
                                <div class="col-md-12 bb">
                                    Room 1: &nbsp;
                                <% if (testsupp == "JT")
                                    {%>
                                    <%=bookdata1.Split('!')[12].Split('~')[0].Split('-')[0] %>
                                    <% }
                                        else
                                        { %>
                                    <%=bookdata1.Split('!')[12].Split('~')[0]%>
                                    <% }  %>
                                    
                                    (
                                    <%=sp[0] %>
                                    )
                                </div>

                                <hr />
                                <%--</p>--%>
                                <% for (int i = 0; i < adt1; i++)
                                    { %>
                                <div class="col-md-1">
                                    <p>
                                        Adult:&nbsp;<%=i + 1 %>
                                    </p>
                                </div>
                                <div class="col-md-1 offset-1">
                                    <select class="form-control" id="title1<%=i %>" style="width: 71px;" name="text">
                                        <option>Mr</option>
                                        <option>Ms</option>
                                        <option>Mrs</option>
                                    </select>
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: 9px;">
                                    <input class="form-control" name="text" placeholder="First Name" type="text" id="FirstName1<%=i %>" onkeypress="return alpha(event)" />
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: -13px;">
                                    <input class="form-control" placeholder="Last Name " type="text" id="LastName1<%=i %>" name="text" onkeypress="return alpha(event)" />
                                </div>
                                <%  if (country.ToUpper() != "INDI")
                                    {%>
                                <div class="col-md-3 offset-1" style="margin-left: inherit; width: 180px;">
                                    <input class="form-control" placeholder="Passport (required) " type="text" id="Passport1<%=i %>" style="width: 170px;"
                                        name="text" onkeypress="return blockSpecialChar(event)" />
                                </div>
                                <%} %>
                                <div class="col-md-2  offset-1" style="margin-left: 5px; width: 120px;">
                                    <select class="form-control" id="Nationality1<%=i %>" style="width: 115px;" onkeypress="return alpha(event)">
                                        <option>India</option>
                                        <option>US</option>
                                        <option>Greek</option>
                                        <option>UK</option>
                                    </select>
                                </div>
                                <br />
                                <br />
                                <%} %>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <%for (int i = 0; i < ch1; i++)
                                    {%>
                                <div class="col-md-1">
                                    <p>
                                        Child:&nbsp;<%=i + 1 %>
                                    </p>
                                </div>
                                <br />
                                <div class="col-md-1 offset-1">
                                    <select class="form-control" id="title1<%=i + adt1 %>" style="width: 93px;" onkeypress="return alpha(event)">
                                        <option>Master</option>
                                        <option>Miss</option>
                                    </select>
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: 29px;">
                                    <input class="form-control" placeholder="First Name " type="text" id="FirstName1<%=i  + adt1%>" onkeypress="return alpha(event)" />
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: -19px;">
                                    <input class="form-control" placeholder="Last Name" type="text" id="LastName1<%=i + adt1 %>"
                                        onkeypress="return alpha(event)" />
                                </div>
                                <%  if (country.ToUpper() != "INDI")
                                    {%>
                                <div class="col-md-2  offset-1" style="margin-left: inherit;">
                                    <input class="form-control" placeholder="Passport (required) " name="text" type="text"
                                        id="Passport1<%=i + adt1 %>" onkeypress="return blockSpecialChar(event)" />
                                </div>
                                <%} %>
                                <div class="col-md-2  offset-1">
                                    <select class="form-control" id="Nationality1<%=i + adt1 %>">
                                        <option>India</option>
                                        <option>US</option>
                                        <option>Greek</option>
                                        <option>UK</option>
                                    </select>
                                </div>
                                <br />
                                <br />
                                <%} %>
                            </div>
                            <%} %>
                            <!-- first room details end!-->
                            <!-- second room details start!-->
                            <%if (fld.Length >= 3)
                                {%>
                            <%int adt1 = Convert.ToInt16(fld[2].Split('^')[0]);
                                int ch1 = Convert.ToInt16(fld[2].Split('^')[1]); %>
                            <hr />
                            <div class="row">
                                <div class="col-md-12 bb">
                                    Room 2: &nbsp;
                                   <% if (testsupp == "JT")
                                       {%>
                                    <%=bookdata1.Split('!')[12].Split('~')[0].Split('-')[1] %>
                                    <% }
                                        else
                                        { %>
                                    <%=bookdata1.Split('!')[12].Split('~')[1]%>
                                    <% }  %>
                                    (
                                    <%=sp[1] %>)
                                </div>
                                <%--<div class="col-md-3" align="right">
                                <font style="font-style: italic; font-size: x-large; right: 10px">
                                    &#8377;&nbsp;<%=rt[2] %></font></div>--%>
                                <hr />
                                <% for (int i = 0; i < adt1; i++)
                                    { %>
                                <div class="col-md-1">
                                    <p>
                                        Adult:&nbsp;<%=i + 1 %>
                                    </p>
                                </div>
                                <div class="col-md-1 offset-1">
                                    <select class="form-control" id="title2<%=i %>" style="width: 71px;">
                                        <option>Mr</option>
                                        <option>Ms</option>
                                        <option>Mrs</option>
                                    </select>
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: 9px;">
                                    <input id="FirstName2<%=i %>" class="form-control" placeholder="First Name"
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: -13px;">
                                    <input id="LastName2<%=i %>" class="form-control" placeholder="Last Name"
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <%  if (country.ToUpper() != "INDI")
                                    {%>
                                <div class="col-md-2  offset-1" style="margin-left: inherit;">
                                    <input id="Passport2<%=i %>" class="form-control" placeholder="Passport (required) "
                                        type="text" name="text" onkeypress="return blockSpecialChar(event)" />
                                </div>
                                <%} %>
                                <div class="col-md-2  offset-1" style="margin-left: 19px;">
                                    <select class="form-control" id="Nationality2<%=i %>">
                                        <option>India</option>
                                        <option>US</option>
                                        <option>Greek</option>
                                        <option>UK</option>
                                    </select>
                                </div>
                                <br />
                                <br />
                                <%} %>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <%for (int i = 0; i < ch1; i++)
                                    {%>
                                <div class="col-md-1">
                                    <p>
                                        Child:&nbsp;<%=i + 1 %>
                                    </p>
                                </div>
                                <br />
                                <div class="col-md-1 offset-1">
                                    <select class="form-control" id="title2<%=i + adt1 %>" style="width: 93px;">
                                        <option>Master</option>
                                        <option>Miss</option>
                                    </select>
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: 29px;">
                                    <input id="FirstName2<%=i + adt1 %>" class="form-control" placeholder="First Name "
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: -19px;">
                                    <input id="LastName2<%=i + adt1 %>" class="form-control" placeholder="Last Name"
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <%  if (country.ToUpper() != "INDI")
                                    {%>
                                <div class="col-md-2  offset-1" style="margin-left: inherit;">
                                    <input id="Passport2<%=i + adt1 %>" class="form-control" placeholder="Passport"
                                        name="text" type="text" onkeypress="return blockSpecialChar(event)" />
                                </div>
                                <%} %>
                                <div class="col-md-2  offset-1">
                                    <select class="form-control" id="Nationality2<%=i + adt1 %>">
                                        <option>India</option>
                                        <option>US</option>
                                        <option>Greek</option>
                                        <option>UK</option>
                                    </select>
                                </div>
                                <br />
                                <br />
                                <%} %>
                            </div>
                            <%} %>
                            <%if (fld.Length >= 4)
                                {%>
                            <%int adt1 = Convert.ToInt16(fld[3].Split('^')[0]);
                                int ch1 = Convert.ToInt16(fld[3].Split('^')[1]); %>
                            <hr />
                            <!-- second room details end!-->
                            <!-- three room details start!-->
                            <div class="row">
                                <div class="col-md-12 bb">
                                    Room 3: &nbsp;&nbsp;
                                       <% if (testsupp == "JT")
                                           {%>
                                    <%=bookdata1.Split('!')[12].Split('~')[0].Split('-')[2] %>
                                    <% }
                                        else
                                        { %>
                                    <%=bookdata1.Split('!')[12].Split('~')[2]%>
                                    <% }  %>
                                    (
                                    <%=sp[2] %>)
                                </div>
                                <%--<div class="col-md-3" align="right">
                                <font style="font-style: italic; font-size: x-large; right: 10px">
                                    &#8377;&nbsp;<%=rt[3] %></font></div>--%>
                                <hr />
                                <% for (int i = 0; i < adt1; i++)
                                    { %>
                                <div class="col-md-1">
                                    <p>
                                        Adult:&nbsp;<%=i + 1 %>
                                    </p>
                                </div>
                                <div class="col-md-1 offset-1">
                                    <select class="form-control" id="title3<%=i %>" style="width: 71px;">
                                        <option>Mr</option>
                                        <option>Ms</option>
                                        <option>Mrs</option>
                                    </select>
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: 9px;">
                                    <input id="FirstName3<%=i %>" class="form-control" placeholder="First Name"
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: -13px;">
                                    <input id="LastName3<%=i %>" class="form-control" placeholder="Last Name"
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <%  if (country.ToUpper() != "INDI")
                                    {%>
                                <div class="col-md-2  offset-1" style="margin-left: inherit;">
                                    <input id="Passport3<%=i %>" class="form-control" placeholder="Passport  "
                                        type="text" name="text" onkeypress="return blockSpecialChar(event)" />
                                </div>
                                <%} %>
                                <div class="col-md-2  offset-1" style="margin-left: 19px;">
                                    <select class="form-control" id="Nationality3<%=i %>">
                                        <option>India</option>
                                        <option>US</option>
                                        <option>Greek</option>
                                        <option>UK</option>
                                    </select>
                                </div>
                                <br />
                                <br />
                                <%} %>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <%for (int i = 0; i < ch1; i++)
                                    {%>
                                <div class="col-md-1">
                                    <p>
                                        Child:&nbsp;<%=i + 1 %>
                                    </p>
                                </div>
                                <br />
                                <div class="col-md-1 offset-1">
                                    <select class="form-control" id="title3<%=i + adt1 %>" style="width: 93px;">
                                        <option>Master</option>
                                        <option>Miss</option>
                                    </select>
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: 29px;">
                                    <input id="FirstName3<%=i + adt1 %>" class="form-control" placeholder="First Name (required) "
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: -19px;">
                                    <input id="LastName3<%=i +adt1 %>" class="form-control" placeholder="Last Name (required) "
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <%  if (country.ToUpper() != "INDI")
                                    {%>
                                <div class="col-md-2  offset-1" style="margin-left: inherit;">
                                    <input id="Passport3<%=i + adt1 %>" class="form-control" placeholder="Passport "
                                        type="text" onkeypress="return blockSpecialChar(event)" />
                                </div>
                                <%} %>
                                <div class="col-md-2  offset-1">
                                    <select class="form-control" id="Nationality3<%=i +adt1 %>">
                                        <option>India</option>
                                        <option>US</option>
                                        <option>Greek</option>
                                        <option>UK</option>
                                    </select>
                                </div>
                                <br />
                                <br />
                                <%} %>
                            </div>




                            <%} %>
                            <%if (fld.Length >= 5)
                                {%>
                            <%int adt1 = Convert.ToInt16(fld[4].Split('^')[0]);
                                int ch1 = Convert.ToInt16(fld[4].Split('^')[1]); %>
                            <hr />
                            <!-- second room details end!-->
                            <!-- three room details start!-->
                            <div class="row">
                                <div class="col-md-12 bb">
                                    Room 4: &nbsp;
                                   <% if (testsupp == "JT")
                                       {%>
                                    <%=bookdata1.Split('!')[12].Split('~')[0].Split('-')[3] %>
                                    <% }
                                        else
                                        { %>
                                    <%=bookdata1.Split('!')[12].Split('~')[3]%>
                                    <% }  %>
                                    (
                                    <%=sp[3] %>)
                                </div>

                                <hr />
                                <% for (int i = 0; i < adt1; i++)
                                    { %>
                                <div class="col-md-1">
                                    <p>
                                        Adult:&nbsp;<%=i + 1 %>
                                    </p>
                                </div>
                                <div class="col-md-1 offset-1">
                                    <select class="form-control" id="title4<%=i %>" style="width: 71px;">
                                        <option>Mr</option>
                                        <option>Ms</option>
                                        <option>Mrs</option>
                                    </select>
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: 9px;">
                                    <input id="FirstName4<%=i %>" class="form-control" placeholder="First Name"
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <div class="col-md-3  offset-1" style="margin-left: -13px;">
                                    <input id="LastName4<%=i %>" class="form-control" placeholder="Last Name"
                                        type="text" onkeypress="return alpha(event)" />
                                </div>
                                <%  if (country.ToUpper() != "INDI")
                                    {%>
                                <div class="col-md-2  offset-1" style="margin-left: inherit;">
                                    <input id="Passport4<%=i %>" class="form-control" placeholder="Passport"
                                        type="text" name="text" onkeypress="return blockSpecialChar(event)" />
                                </div>
                                <%} %>
                                <div class="col-md-2  offset-1" style="margin-left: 19px;">
                                    <select class="form-control" id="Nationality4<%=i %>">
                                        <option>India</option>
                                        <option>US</option>
                                        <option>Greek</option>
                                        <option>UK</option>
                                    </select>
                                </div>
                                <br />
                                <br />
                                <%} %>
                            </div>


                            <%--    <div class="row" style="margin-top: 10px;">
                            <%for (int i = 0; i < ch1; i++)
                              {%>
                            <div class="col-md-1">
                                <p>
                                    Child:&nbsp;<%=i + 1 %></p>
                            </div>
                            <br />
                            <div class="col-md-1 offset-1">
                                <select class="form-control" id="title4<%=i + adt1 %>" style="width: 93px;">
                                    <option>Master</option>
                                    <option>Miss</option>
                                </select>
                            </div>
                            <div class="col-md-3  offset-1" style="margin-left: 29px;">
                                <input id="FirstName4<%=i + adt1 %>" class="form-control" placeholder="First Name (required) "
                                    name="text" type="text" onkeypress="return blockSpecialChar(event);" />
                            </div>
                            <div class="col-md-3  offset-1" style="margin-left: -19px;">
                                <input id="LastName4<%=i +adt1 %>" class="form-control" placeholder="Last Name (required) "
                                    name="text" type="text" onkeypress="return blockSpecialChar(event);" />
                            </div>
                            <%  if (country.ToUpper() != "INDI")
                                {%>
                            <div class="col-md-2  offset-1" style="margin-left: inherit;">
                                <input id="Passport4<%=i + adt1 %>" class="form-control" placeholder="Passport (required) "
                                    name="text" type="text" onkeypress="return blockSpecialChar(event)" />
                            </div>
                            <%} %>
                            <div class="col-md-2  offset-1" style="margin-left: 19px;">
                                <select class="form-control" id="Nationality4<%=i +adt1 %>">
                                    <option>India</option>
                                    <option>US</option>
                                    <option>Greek</option>
                                    <option>UK</option>
                                </select>
                            </div>
                            <br />
                            <br />
                            <%} %>
                        </div>--%>


                            <%} %>
                            <hr />
                            <%var data = fld[0].Split('^');
                                var bookdata = Session["Bookingdetails"].ToString();
                                var arr = bookdata.Split('!');
                                var aar = arr[10].Split('`');
                                if (Convert.ToInt16(aar[0].Length) > 1)
                                {
                                    aar[0] = "0";
                                }  %>

                            <!-- three room details end!-->
                        </div>
                        <!-- passanger details section end!-->
                        <!-- adition details start!-->


                        <div class="col-md-12 bck">



                            <div class="row  headingdata ">Provide Additional Details </div>





                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                        Mobile No
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">

                                        <input type="text" class="form-control" runat="server" placeholder="Mobile Number (required)" id="Phno" onkeypress="return Numeric(event)" maxlength="12" required aria-required="true" />


                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                        E-mail<span class="color-red">*</span>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                        <input type="text" maxlength="60" id="TxtEmail" autocomplete="off" class="form-control effect-9 " placeholder="email@email.com" />

                                    </div>
                                </div>
                            </div>


                            <div class="gap"></div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-10">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                        Booking Reference
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">

                                        <input type="text" class="form-control" runat="server" placeholder="Ref" id="Ref" onkeypress="return Numeric(event)" maxlength="12" required aria-required="true" />
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 offset-0 m-top-10">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 col-xs-12 font-12 m-top-5">
                                        Booking Remark
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 col-xs-12 offset-0">
                                        <input type="text" class="form-control" onkeypress="return blockSpecialChar(event)" runat="server" id="Remark" placeholder="EnterRemark" />
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="gap"></div>




                        <!-- adition details end!-->

                        <div class="col-md-12 offset-1 bck" id="cancelpolicy" runat="server" style="text-align: justify;"></div>



                    </div>

                    <div class="col-md-3 bck">





                        <div class="booking-item-payment-title">
                            <div class="hname"><%=arr[0]%></div>

                        </div>


                        <div class="booking-item-payment-details">
                            <div class="booking-item-payment-img">
                                <img src="<%=aar[1] %>" alt="RezB2B" title="hotel 1" style="height: 170px;" />
                            </div>

                        </div>

                        <%try
                            {%>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 add">
                            <%=Pdata.Split('!')[9].Split('|')[0] %>
                            <%}
                                catch (Exception)
                                {%>


                            <%}%>
                        </div>
                        <ul class="icon-group booking-item-rating-stars">
                            <%for (int i = 0; i < Convert.ToInt16(aar[0]); i++)
                                {%>
                            <li><i class='fa fa-star star'></i>
                            </li>
                            <%} %>
                        </ul>




                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">Check-in</div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 dec"><%=data[0] %></div>

                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">Check-out</div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 dec"><%=data[1] %></div>

                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">Rooms</div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 dec"><%=fld.Length-1%></div>

                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">Nights</div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 dec"><%=data[2]%></div>

                        </div>






                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fare">

                            <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12">
                                Total
                            </div>
                            <div class="col-lg-7 col-md-12 col-sm-12 col-xs-12"><%=currtst%>&nbsp;<%=arr[15]%></div>


                        </div>

                        <br />
                        <%if (perroomrates != "")
                            {%>
                        <div id="searchlink" rel="subcontent" style="visibility: hidden;">Rates Per Room</div>
                        <% 
                            var perroom = perroomrates.Replace("(", "").Split(')');
                        %>


                        <div class="gap">
                        </div>

                        <%} %>
                    </div>

                    <!-- payment section start!-->
                    <div class="col-md-9 bck">



                        <div class="row  headingdata text-center ">Payment</div>




                        <div class="checkbox" id="bookdiv" runat="server">
                            <label class="">
                                <asp:CheckBox ID="Check" Checked="false" runat="server" onclick="javascript:selectedyes();" /><strong
                                    style="width: 50px;" /> I have read and accept the rules and regulations. (
                                please tick to continue ).
                            </label>
                        </div>
                        <div class="checkbox" id="holddiv" runat="server">
                            <asp:CheckBox ID="HoldBooking" Checked="false" runat="server" /><strong>
                                <asp:Label ID="lblHold" Text="Do you want to hold this booking ( please tick to continue ) "
                                    runat="server"></asp:Label>
                            </strong>
                        </div>
                        <div style="width: 40%; height: auto; padding: 5px; margin: 0 auto;" id="btndiv"
                            runat="server">
                            <input id="cust_details" type="button" value="Proceed" class="red-btn"
                                onclick="myfunc('<%=Session["Param"]%>');" disabled="disabled" />
                        </div>
                    </div>
                    <!-- payment section end!-->
                </div>
                <!-- <div class="gap"></div>-->
            </div>

            <script type="text/javascript">
                //Call dropdowncontent.init("anchorID", "positionString", glideduration, "revealBehavior") at the end of the page:

                dropdowncontent.init("searchlink", "right-bottom", 500, "mouseover")
                dropdowncontent.init("contentlink", "left-top", 300, "click")

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
            <script type="text/javascript">

                function myfunc(values) {
                    debugger;
                    var holdbooking = "";

                    var elem = document.getElementById('HoldBooking');
                    if (typeof elem == 'undefined' || elem == null) {
                        holdbooking = 'No';
                    }
                    else {
                        if (document.getElementById('HoldBooking').checked == true) {
                            holdbooking = 'Yes';
                        }
                        else {
                            holdbooking = 'No';
                        }
                    }

                    var root = values.split("~");
                    var sala = ""; var fna = ""; var lna = ""; var passa = ""; var Nationa = ""; var salch = ""; var fnch = "";
                    var lnch = ""; var passch = ""; var Nationch = "";
                    var phno = ""; var ref = ""; var remark = ""; var emailid = "";

                    for (var i = 1; i < root.length; i++) {
                        var adt = root[i].split("^")[0];
                        var ch = root[i].split("^")[1];
                        for (var j = 0; j < adt; j++) {
                            if (document.getElementById("title" + i + "" + j).value == "" || document.getElementById("title" + i + "" + j).value == null) {
                                alert("Please select title");

                                return false;

                            } else {
                                sala += document.getElementById("title" + i + "" + j).value + ",";
                            }


                            if (document.getElementById("FirstName" + i + "" + j).value == "" || document.getElementById("FirstName" + i + "" + j).value == null) {
                                alert("Please enter Adult FirstName !!!");
                                document.getElementById("FirstName" + i + "" + j).focus();
                                return false;

                            } else {
                                fna += document.getElementById("FirstName" + i + "" + j).value + ",";
                            }



                            if (document.getElementById("LastName" + i + "" + j).value == "" || document.getElementById("LastName" + i + "" + j).value == null) {
                                alert("Please enter Adult LastName !!!");
                                document.getElementById("LastName" + i + "" + j).focus();
                                return false;



                            } else {
                                lna += document.getElementById("LastName" + i + "" + j).value + ",";
                            }


                            passa += document.getElementById("Passport" + i + "" + j).value + ",";

                            Nationa += document.getElementById("Nationality" + i + "" + j).value + ",";



                        }

                        for (var k = 0; k < ch; k++) {
                            var sum = (parseInt(k) + parseInt(adt));
                            salch += document.getElementById("title" + i + "" + sum).value + ",";




                            if (document.getElementById("FirstName" + i + "" + j).value == "" || document.getElementById("FirstName" + i + "" + j).value == null) {
                                alert("Please enter Child FirstName !!!");
                                document.getElementById("FirstName" + i + "" + j).focus();
                                return false;

                            } else {

                                fnch += document.getElementById("FirstName" + i + "" + sum).value + ",";
                            }
                            if (document.getElementById("LastName" + i + "" + j).value == "" || document.getElementById("LastName" + i + "" + j).value == null) {
                                alert("Please enter Child LastName !!!");
                                document.getElementById("LastName" + i + "" + j).focus();
                                return false;

                            } else {
                                lnch += document.getElementById("LastName" + i + "" + sum).value + ",";
                            }


                            passch += document.getElementById("Passport" + i + "" + sum).value + ",";

                            Nationch += document.getElementById("Nationality" + i + sum).value + ",";



                        }
                    }


                    if (document.getElementById("Phno").value == "" || document.getElementById("Phno").value == null) {

                        alert("Please enter Mobile number !!!");
                        document.getElementById("Phno").focus();
                        return false;
                    } else {
                        phno = document.getElementById("Phno").value;
                    }




                    if (document.getElementById("TxtEmail").value == "" || document.getElementById("TxtEmail").value == null) {

                        alert("Please enter Email-id !!!");
                        document.getElementById("TxtEmail").focus();
                        return false;
                    } else {
                        emailid = document.getElementById("TxtEmail").value;
                    }

                    if (TxtEmail.value.trim() == "") {
                        alert("Please enter Email Id")
                        return false;
                    }
                    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                    if (!filter.test(TxtEmail.value.trim())) {
                        alert('Please provide a valid email address')
                        return false;
                    }



                    var finaldata = sala + salch + '/' + fna + fnch + '/' + lna + lnch + '/' + passa + passch + '/' + Nationa + Nationch + '|' + phno + '|' + ref + '|' + remark + '|' + emailid;

                    window.location.href = ("PriceCheck.aspx?BookingDetails=" + finaldata + "&HoldBooking=" + holdbooking);

                }
            </script>
            <script type="text/javascript">




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
                    return false;
                }




            </script>
    </form>
    <user:h1 ID="H1" runat="server" />
</body>
</html>
