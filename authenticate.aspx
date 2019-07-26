<%@ Page Language="C#" AutoEventWireup="true" CodeFile="authenticate.aspx.cs" Inherits="authenticate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <title>RezB2B</title>
    <link rel="shortcut icon" type="image/x-icon" href="img/new-travel-rez.png" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="nav/fonts5/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="nav/fonts5/iconic/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="nav/css5/util.css">
    <link rel="stylesheet" type="text/css" href="nav/css5/main.css">
</head>
<body>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100 p-b-20">
                <form runat='server' class="login100-form validate-form">
                    <span class="login100-form-title p-b-70">Hello Welcome !!! </span>
                    <%--<div class="wrap-input100 validate-input m-b-35" data-validate="Enter username">
                        <input type="text" id="otp" class="input100" placeholder="Enter OTP" runat="server" style="height: 25px; padding: 3px 3px 3px 19px;" />
                    </div>--%>
                    <div class="container-login100-form-btn">
                        <asp:Button ID="btnsubmit" OnClick="btnsubmit_Click" class="login100-form-btn" runat="server" Text="click here to continue" />
                        <asp:Label ID="ErrorMessage" runat="server" Text="" style="margin-top: 19px;"></asp:Label>
                    </div>
                    <%--<ul style="padding-top: 49px; text-align:center;">
                        <li class="m-b-8"><span class="txt1">Hello </span><a href="loginpage1.aspx" class="txt2">Back To Home Page </a></li>
                    </ul>--%>
                </form>
            </div>
        </div>
    </div>
    <div id="dropDownSelect1">
    </div>
    <script src="nav/js5/main.js"></script>
    
</body>
</html>
