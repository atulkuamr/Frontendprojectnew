<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookingWaitPage.aspx.cs" Inherits="BookingWaitPage" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<HeadTitle:HTitle ID="thead" runat="server" />
<%--
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.0.min.js"></script>
    <script>window.setTimeout("location=('FlightPNR.aspx');", 4000)</script>--%>
</head>
     <style type="text/css">
        .wait{    width: 650px;
    height: 300px;
    display: block;
    margin: auto;
    /* border-radius: 20px; */
    /* background-color: rgb(224, 224, 224); */
    background-image: radial-gradient(circle, #b4d034, #accf2d, #a4cf27, #9bce20, #92cd18);
    /* box-shadow: rgb(179, 179, 179) 5px 5px 5px inset; */
    font-size: 18px;
    color: #fff;
}

    </style>
<body>
<%--<script type="text/javascript">
    $(document).ready(function () {
        debugger;
        $('#Waitdiv').css('display', 'block');
    });
</script>--%>
    <form id="form1" runat="server">
   <div>
    <div style="height:120px;"></div>

      <div id="Waitdiv" class="wait">
       <div style="width:100%; height:300px; margin :auto;"> 
           <div style="margin:auto; width :100%;"><center><img src="img/ajax-loader.gif" style="width: 120px; height: 100px; margin-top:45px;" /></center></div>
        <p align="center" style="font-size: large">Booking in process, <br />Do not refresh page and not back from this page ...</p></div></div>
    </div>
    </form>
</body>
</html>
