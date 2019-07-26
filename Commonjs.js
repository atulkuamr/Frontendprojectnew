          



document.getElementById('autocomplete').style.visibility = "hidden";
           document.getElementById('autocomplete1').style.visibility = "hidden";
            $('#flttxtfromsec').keypress(function () {
                if ($("#flttxtfromsec").val().length > 2) {
                    var infl_value = $(this).val();
                    debugger;
                    var user = {}, ucpol = "", Mhtml = "", pagename = "";
                    var dataforall = ""; var splitdata = "";
                    // var infl_value = document.getElementById("flttxtfromsec");
                    user.domainname = infl_value.value;
                    ucpol = $.ajax({ type: "POST", url: 'Autocompletevalues.aspx/GetcityName', async: false, data: JSON.stringify({ user: $(this).val() }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json", success: function (response) { }
                    });
                    dataforall = ucpol.responseJSON.d;
                    if (dataforall != "") {
                        splitdata = dataforall.split(':');
                        var abc = Autoadd(splitdata, "fromsec");
                        //  $('#citycontent').append(splitdata);
                    }
                }
                var start = this.selectionStart,
              end = this.selectionEnd;
            });
            $('#flttxtfromsec').keydown(function () {
                if ($("#flttxtfromsec").val().length > 2) {
                    var infl_value = $(this).val();
                    debugger;
                    var user = {}, ucpol = "", Mhtml = "", pagename = "";
                    var dataforall = ""; var splitdata = "";
                    // var infl_value = document.getElementById("flttxtfromsec");
                    user.domainname = infl_value.value;
                    ucpol = $.ajax({ type: "POST", url: 'Autocompletevalues.aspx/GetcityName', async: false, data: JSON.stringify({ user: $(this).val() }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json", success: function (response) { }
                    });
                    dataforall = ucpol.responseJSON.d;
                    if (dataforall != "") {
                        splitdata = dataforall.split(':');
                        var abc = Autoadd(splitdata, "fromsec");
                        //  $('#citycontent').append(splitdata);
                    }
                }
                var start = this.selectionStart,
              end = this.selectionEnd;
            });

            $('#flttxttosec').keypress(function () {
                if ($("#flttxttosec").val().length > 2) {
                    var infl_value = $(this).val();
                    debugger;
                    var user = {}, ucpol = "", Mhtml = "", pagename = "";
                    var dataforall = ""; var splitdata = "";
                    // var infl_value = document.getElementById("flttxtfromsec");
                    user.domainname = infl_value.value;
                    ucpol = $.ajax({ type: "POST", url: 'Autocompletevalues.aspx/GetcityName', async: false, data: JSON.stringify({ user: $(this).val() }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json", success: function (response) { }
                    });
                    dataforall = ucpol.responseJSON.d;
                    if (dataforall != "") {
                        splitdata = dataforall.split(':');
                        var abc = Autoadd(splitdata, "tosec");
                        //  $('#citycontent').append(splitdata);
                    }
                }
                var start = this.selectionStart,
              end = this.selectionEnd;
            });
            $('#flttxttosec').keydown(function () {
                if ($("#flttxttosec").val().length > 2) {
                    var infl_value = $(this).val();
                    debugger;
                    var user = {}, ucpol = "", Mhtml = "", pagename = "";
                    var dataforall = ""; var splitdata = "";
                    // var infl_value = document.getElementById("flttxtfromsec");
                    user.domainname = infl_value.value;
                    ucpol = $.ajax({ type: "POST", url: 'Autocompletevalues.aspx/GetcityName', async: false, data: JSON.stringify({ user: $(this).val() }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json", success: function (response) { }
                    });
                    dataforall = ucpol.responseJSON.d;
                    if (dataforall != "") {
                        splitdata = dataforall.split(':');
                        var abc = Autoadd(splitdata, "tosec");
                        //  $('#citycontent').append(splitdata);
                    }
                }
                var start = this.selectionStart,
              end = this.selectionEnd;
            });
    
        function Autoadd(Jsonarr, flag) {
            if (Jsonarr != "") {


                var INhtml = "";
                // INhtml += "<select>";
                for (i = 0; i < Jsonarr.length; i++) {
                    INhtml += "<option value=" + Jsonarr[i] + "  id='li" + i + "' style='white-space:pre'>" + Jsonarr[i] + "</option>";
                }
                // INhtml += "</select>";
            }
            if (flag == "tosec") {
                $('#Toauto').append(INhtml);
                document.getElementById('autocomplete1').style.visibility = "visible";
            }
            else {
                $('#auto').append(INhtml);
                document.getElementById('autocomplete').style.visibility = "visible";
            }

        }
        function load() {
            debugger;
            var myindex = document.getElementById('auto').selectedIndex;
            if (myindex >= 1) {
                this.document.getElementById('flttxtfromsec').value = document.getElementById('auto').options[myindex].text;
                if (this.document.getElementById('flttxtfromsec').value != "")
                    document.getElementById('autocomplete').style.visibility = "hidden";
            }
            var myindex1 = document.getElementById('Toauto').selectedIndex;
            if (myindex1 >= 1) {
                this.document.getElementById('flttxttosec').value = document.getElementById('Toauto').options[myindex1].text;
                if (this.document.getElementById('flttxttosec').value != "")
                    document.getElementById('autocomplete1').style.visibility = "hidden";
            }
        }
//        function Validate() {
//            debugger;
//            var abc = "";
//            var TripType = ""; var finalstring = ""; var Fromsec = ""; var tosec = ""; var fromdate = ""; var todate = "";
//            if (document.getElementById('flttxtfromsec').value == "") {
//                alert("Please Select FromCity ");
//            }
//            else {
//                Fromsec = document.getElementById('flttxtfromsec').value;
//            }
//            if (document.getElementById('flttxttosec').value == "") {
//                alert("Please Select ToCity ");
//            }
//            else {
//                tosec = document.getElementById('flttxttosec').value;
//            }
//            if (document.getElementById('txtfromdate').value == "") {
//                alert("Please Select From Date ");
//            }
//            else {
//                fromdate = document.getElementById('txtfromdate').value;
//            }
//            if (document.getElementById('txttodate').value == "") {
//                alert("Please Select To Date ");
//            }
//            else {
//                todate = document.getElementById('txttodate').value;
//            }
//                       
//           if($('#txttodate').is(':visible')){
//           TripType="Two";
//           }
//           else
//           {
//            TripType="One";
//            todate="";
//            }
//            var index = document.getElementById('optClass').selectedIndex;
//            var cabincls = "";
//            if (index > -1)
//                cabincls = document.getElementById('optClass').options[index].text;
//            finalstring = TripType + ";" + Fromsec + ";" + tosec + ";" + fromdate + ";" + todate + ";" + document.getElementById('optAdult').value + ";" + document.getElementById('Optchild').value + ";" + document.getElementById('OptInfant').value + ";" + cabincls + ";" + ";;;;;;D";
//            window.location.href = ("FlightWaiting.aspx?ses=" + finalstring);
//            return abc;
//        }