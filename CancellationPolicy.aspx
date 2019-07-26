<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CancellationPolicy.aspx.cs"
    Inherits="CancellationPolicy" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<HeadTitle:HTitle ID="thead" runat="server" />
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 700px; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 105%;/*width: 80%;*/
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    border-bottom-right-radius: 5px;
    border-bottom-left-radius: 5px;
}
/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}
@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}
/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: red;
    text-decoration: none;
    cursor: pointer;
}
.modal-header {
    padding: 2px 16px;
    background-color: #1f7ff0;
    color: white;
    height: 59px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
}
.modal-body {
    position: relative;
    padding: 20px;
}
.modal-footer {
    background-color: #1f7ff0;
    color: white;
    border-bottom-right-radius: 15px;
    border-bottom-left-radius: 15px;

}
</style>
<%--    <script>

        $(document).click(function (e) {
            var target = e.target; //target div recorded

            if (!jQuery(target).is('#PopUp')) {
                jQuery(this).fadeOut(); //if the click element is not the above id will hide
            }
        })</script>--%>
</head>
<body>
    <form id="form1" runat="server">
        
            <div class="col-md-12" runat="server" id='PopUp' tabindex="-1" style='font-size: 14px; left: 0px; padding: 19px; position: fixed; text-align: justify; top: 80px; max-width: 626px;margin-left: 24%;'>
                    <div class="" style="background:#1b1919f0">
                        <div class="" style="background:#92cd18">
                            <span class="close" onclick="javascript:cncly(event)">
                                <a style="width: 25px;height: 25px;">x</a></span>
                            <div style="color: #000;padding: 5px;font-size: 18px;text-align:center">
                                Cancellation Policy</div>
                        </div>
                        <br />
                        <div class="modal-body" style="color:#fff">
                            <%=response %>
                        </div>
                        
                    </div>
            </div>
    </form>
</body>
</html>
