<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddNewAgent.aspx.cs" Inherits="AddNewAgent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/font-awesome.css" />
    <link rel="stylesheet" href="css/icomoon.css" />
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/mystyles.css" />
    <style type="text/css">
        .button1
        {
            display: inline-block;
            padding: 15px 25px;
            font-size: 18px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #3e8e41;
            border: none;
            border-radius: 11px;
            box-shadow: 0 5px #999;
        }
        
        .button1:hover
        {
            background-color: darkgreen;
        }
        
        .button1:active
        {
            background-color: #3e8e41;
            box-shadow: 0 5px #666;
            transform: translateY(4px);
        }
    </style>
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
    <script type="text/javascript" src="js/nicescroll.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <div class="col-md-12" style="margin-top: 20px;">
       <center><span style="font-size: x-large; font-style: normal; padding-left: 10%;"><b>New Registration</b></span></center>
    </div>
    <div class="gap">
    </div>
    <div id="container" style="width: 80%; border: 2px solid #ccc; padding: 30px; margin-left: 10%;">
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Agency Name*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="AgencyName" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controltovalidate="AgencyName" errormessage="Please enter Agency Name!" /> 
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Designation:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="Designation" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>First Name*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="FirstName" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" controltovalidate="FirstName" errormessage="Please enter FirstName!" />
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Last Name*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="LastName" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" controltovalidate="LastName" errormessage="Please enter LastName!" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Email-Id*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="UserId" runat="server" class="form-control" onblur="emailValidator(document.getElementById('ctl00_ContentPlaceHolder1_UserId'), 'Invalid Email-Id')"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" controltovalidate="UserId" errormessage="Please enter UserId!" />
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Password*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="Password" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" controltovalidate="Password" errormessage="Please enter Password!" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Address*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="Address" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" controltovalidate="Address" errormessage="Please enter Address!" />
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Country*:</b></span>
            </div>
            <div class="col-md-3">                
                <asp:DropDownList ID="Country" runat="server" class="form-control">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" controltovalidate="Country" errormessage="Please enter Country!" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>City*:</b></span>
            </div>
            <div class="col-md-3">
                <%--<asp:DropDownList ID="City" runat="server" class="form-control">
                </asp:DropDownList>--%>
                <asp:TextBox ID="City" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" controltovalidate="City" errormessage="Please enter City!" />
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>State:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="State" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>PinCode*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="PinCode" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" controltovalidate="PinCode" errormessage="Please enter PinCode!" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Pin Code. !!" ValidationExpression="^[1-9][0-9]{5}$" ControlToValidate="PinCode"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Phone*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="Phone" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" controltovalidate="Phone" errormessage="Please enter Phone Number!" />
                 <asp:RegularExpressionValidator ID="REVPhone" runat="server" ErrorMessage="Invalid Phone No. !!" ControlToValidate="Phone" ValidationExpression="(?:\s+|)((0|(?:(\+|)91))(?:\s|-)*(?:(?:\d(?:\s|-)*\d{9})|(?:\d{2}(?:\s|-)*\d{8})|(?:\d{3}(?:\s|-)*\d{7}))|\d{10})(?:\s+|)"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Mobile*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="Mobile" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" controltovalidate="Mobile" errormessage="Please enter Mobile No.!" />
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Fax:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="Fax" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Login Type:</b></span>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="LoginType" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Pan No.:*</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" controltovalidate="TextBox1" errormessage="Please enter Pan Number!" />
                <asp:RegularExpressionValidator ID="REVPAN" runat="server" ErrorMessage="Invalid Pan Card !!" ValidationExpression="[A-Z]{5}\d{4}[A-Z]{1}" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>GST No.:*</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" controltovalidate="TextBox2" errormessage="Please enter Service Tax Number!" />
                <asp:RegularExpressionValidator ID="REVGST" runat="server" ErrorMessage="Invalid GST No. !!" ValidationExpression="^((([0][1-9]|[1-2][0-9]|[3][0-7])([A-Z]{5})([0-9]{4})([A-Z]{1}[1-9A-Z]{1})([Z]{1})([0-9A-Z]{1}))|([A-Z]{5}\d{4}[A-Z]{1}))+$" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
            <span style="font-size: 14px; font-style: normal;"><b>Currency:</b></span>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="Currency" runat="server" class="form-control">
                </asp:DropDownList>
            </div>
            <%--<div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Email*:</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="Email" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" controltovalidate="Email" errormessage="Please enter your Email-ID!" />
            </div>--%>
        </div>
        <div class="row">
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Remarks</b></span>
            </div>
            <div class="col-md-3">
                <asp:TextBox ID="Remarks" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <span style="font-size: 14px; font-style: normal;"><b>Logo:</b></span>
            </div>
            <div class="col-md-3">
                <asp:FileUpload ID="FileUpload1" runat="server" class="form-control"/>
            </div>
        </div>
        <%--<div class="row" style="margin-top:25px;"></div>--%>
        <div class="row" style="margin-top: 40px;">
            <center>
                <asp:Button ID="submit" Text="Add Agent" class="btn btn-primary" runat="server" Height="43px"
                    Width="150px" OnClick="submit_Click" />
            </center>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="gap">
    </div>
    </form>
    
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
    <script src="Js/common-show.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/switcher.js"></script>
    <script type="text/javascript" src="common-show.js"></script>
</asp:Content>

