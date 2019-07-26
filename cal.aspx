<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cal.aspx.cs" Inherits="cal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">

    <link href="https://client.justclickkaro.com/jct/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://client.justclickkaro.com/jct/css/jquery-ui-ddNew.css" rel="Stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/aa.js" type="text/javascript"></script>

</head>


<body>
    <form id="form1" runat="server">
        <div>


            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 offset-0">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 offset-0 m-top-10">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pdng-lft">
                        Depart On
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-5">
                        <input type="text" id="datepicker" class="form-control cal-1" placeholder="DD/MM/YYYY" readonly="readonly" />
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 offset-0 m-top-10" id="oneway" style="display: block;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pdng-lft">
                        Return On
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-top-5">
                        <input type="text" id="outdatepicker" class="form-control cal-11" placeholder="DD/MM/YYYY" readonly="readonly" />
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>


<script type="text/javascript">
    $(document).ready(function () {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
        if (dd < 10) { dd = '0' + dd }

        if (mm < 10) { mm = '0' + mm }

        today = dd + '/' + mm + '/' + yyyy;
        $('#datepicker').val(today);

        $('#outdatepicker1').val(today);
        $('#datepicker').datepicker({
            minDate: 0, maxDate: '0Y +12M +00D', dateFormat: 'dd/mm/yy', numberOfMonths: 3,
            onSelect: function (dateStr) {
                var d = $.datepicker.parseDate('dd/mm/yy', dateStr);
                $('#outdatepicker1').datepicker('setDate', d);
                var start = $(this).datepicker('getDate');
                $('#outdatepicker1').datepicker('option', 'minDate', new Date(start.getTime()));

            }
        });
    });

</script>
