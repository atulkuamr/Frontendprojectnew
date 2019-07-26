<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cancelremark.aspx.cs" Inherits="Cancelremark" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<HeadTitle:HTitle ID="thead" runat="server" />
    <meta content="text/html;charset=utf-8" http-equiv="Content-Type">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet'
        type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600'
        rel='stylesheet' type='text/css'>
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
    <link href="css/ResponsiveTabel.css" rel="stylesheet" />
    <style type="text/css">
        .offset-1
        {
            padding-left: 5px;
            padding-right: 5px;
        }
    </style>
</head>
<body>
    <!--------Main container Start------------------>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-1">
                </div>
                <div class="col-md-10 offset-1">
                    <form id="Form2" runat="server">
                    <div class="row">
                        <!-------------------Searrching start------------->
                        <div class=" col-md-12" style="margin-top: 50px;">
                            <h4 style="text-align: center;">
                                Cancel Remark</h4>
                        </div>
                        <div class="col-md-12 col-sm-12">
                            <div class="col-md-3 col-sm-2">
                                <b>&nbsp;</b></div>
                            <div class="col-md-3 col-sm-4 col-xs-4">
                                <b>Confirmation ID:</b></div>
                            <div class="col-md-4 col-sm-4 col-xs-8">
                                <%=Request.QueryString["RefID"]%></div>
                            <div class="col-md-2 col-sm-2">
                                <b>&nbsp;</b></div>
                        </div>
                        <div class="col-md-12 col-sm-12 " style="margin-top: 10px;">
                            <div class="col-md-3 col-sm-2">
                                <b>&nbsp;Remarks:</b></div>
                            <div class="col-md-4 col-sm-3 col-xs-8">
                                <asp:TextBox ID="Remarks" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <%--<input type="text" class="form-control" id="Remarks" runat="server" textmode="MultiLine" />--%>
                        </div>
                        <div class="col-md-2 col-sm-2">
                            <b>&nbsp;</b></div>
                    </div>
                    <div class="col-md-12 text-center" style="margin-bottom: 10px;">
                        <asp:Button ID="Submit" runat="server" Text="Submit" class="btn btn-primary" Style="cursor: pointer;
                            margin-top: 10px; width: 100px; margin:auto;" onclick="Submit_Click" />
                        <%--<input type="Submit" id="Submit" class="btn btn-primary" value="Submit" style="margin-top: 30px;" />--%>
                    </div>
                    <!-------------------Searrching End--------------->
                    </form>
                </div>
            </div>
            <div class="col-md-1">
            </div>
        </div>
    </div>
    </div>
    <!--------Main container end-------------------->
</body>
</html>
