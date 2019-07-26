<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="citysightcustdet.aspx.cs" Inherits="citysightcustdet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
    <div class="container" style="max-width: 1000px;">
        <div class="row">
            <div class="gap">
            </div>
            <div class="col-md-12" style="height: 40px; font-size: xx-large; font-weight: bold;"
                align="center">
                Customer Details:
            </div>
            <hr />
            <%for (int j = 1; j < day.Split('~').Length; j = j + 2)
              {  
            %>
            <div class="row">
                <div class="col-md-6" style="height: 40px; font-size: medium" align="left">
                    <%=day.Split('~')[j]%><%--1 day Hop On Hop Off--%>
                </div>
                <div class="col-md-6" style="height: 40px; font-size: medium" align="right">
                    INR
                    <%=day.Split('~')[j-1]%>
                    <%--<%=day.Split('~')[j]%>--%>
                </div>
            </div>
            <%} %>
            <hr />
            <%--start for senior citizen--%>
            <%for (int i = 1; i <= Convert.ToInt16(seniors); i++)
              {
            %>
            <div class="row">
                <div class="col-md-2">
                    Senior<%=i%><%=seniorage %></div>
                <div class="col-md-2">
                    <select class="form-control" id="titles<%=i %>">
                        <option>Mr</option>
                        <option>Ms</option>
                        <option>Mrs</option>
                    </select></div>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="First Name (required)" id="sf<%=i %>"
                        onkeypress="return lettersOnly(event);" required /></div>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="Last Name (required)" id="sl<%=i %>"
                        onkeypress="return lettersOnly(event);" required /></div>
                <div class="col-md-2">
                    <input type="text" class="form-control" placeholder="Age (required)" id="sa<%=i %>"
                        onkeypress="return Numeric(event)" required /></div>
            </div>
            <br />
            <%}%>
            <%--start for adult--%>
            <%for (int i = 1; i <= Convert.ToInt16(adt); i++)
              {
            %>
            <div class="row">
                <div class="col-md-2">
                    Adult<%=i%><%=adultage %>
                    </div>
                <div class="col-md-2">
                    <select class="form-control" id="titlea<%=i %>">
                        <option>Mr</option>
                        <option>Ms</option>
                        <option>Mrs</option>
                    </select></div>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="First Name (required)" id="af<%=i %>"
                        onkeypress="return lettersOnly(event);" /></div>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="Last Name (required)" id="al<%=i %>"
                        onkeypress="return lettersOnly(event);" required="required" /></div>
                <div class="col-md-2">
                    <input type="text" class="form-control" placeholder="Age (required)" id="aa<%=i %>"
                        onkeypress="return Numeric(event)" required /></div>
            </div>
            <br />
            <%}%>
            <%for (int i = 1; i <= Convert.ToInt16(chd); i++)
              {
            %>
            <%--end for adult--%>
            <%--start for child--%>
            <div class="row">
                <div class="col-md-2">
                    Child<%=i%><%=childage %></div>
                <div class="col-md-2">
                    <select class="form-control" id="titlec<%=i %>">
                        <option>Master</option>
                        <option>Miss</option>
                    </select></div>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="First Name (required)" id="cf<%=i %>"
                        onkeypress="return lettersOnly(event);" required /></div>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="Last Name (required)" id="cl<%=i %>"
                        onkeypress="return lettersOnly(event);" required /></div>
                <div class="col-md-2">
                    <input type="text" class="form-control" placeholder="Age (required)" id="ca<%=i %>"
                        onkeypress="return Numeric(event)" required /></div>
            </div>
            <br />
            <%}%>
            <%--end for child--%>
            <%--start for Infant--%>
            <%for (int i = 1; i <= Convert.ToInt16(infant); i++)
              {
            %>
            <div class="row">
                <div class="col-md-2">
                    Infant<%=i%><%=infantage %></div>
                <div class="col-md-2">
                    <select class="form-control" id="titlei<%=i %>">
                        <option>Master</option>
                        <option>Miss</option>
                    </select></div>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="First Name (required)" id="if<%=i %>"
                        onkeypress="return lettersOnly(event);" required /></div>
                <div class="col-md-3">
                    <input type="text" class="form-control" placeholder="Last Name (required)" id="il<%=i %>"
                        onkeypress="return lettersOnly(event);" required /></div>
                <div class="col-md-2">
                    <input type="text" class="form-control" placeholder="Age (required)" id="ia<%=i %>"
                        onkeypress="return Numeric(event)" required /></div>
            </div>
            <br />
            <%}%>
            <div class="row">
                <div class="col-md-2">
                    Email-Id</div>
                <div class="col-md-4">
                    <input type="text" class="form-control" placeholder="Email-Id" onblur="emailValidator(document.getElementById('emailid'), 'Invalid Email-Id')"
                        id="emailid" required /></div>
                <div class="col-md-2">
                    Mobile</div>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="phno" placeholder="Mobile" onkeypress="return Numeric(event)"
                        maxlength="12" required /></div>
            </div>
            <br />
            <br />
            <div class="row" align="center">
                <input id="Button3" class="btn btn-primary btn-lg" style="width: 250px; height: 45px;"
                    type="button" value="Book Now" onclick="confbook('<%=Session["ah"]%>')" />
                <%-- <input id="cust_details" type="button" value="Proceed Payment" class="btn btn-primary"
                                onclick="myfunc('<%=Session["Param"]%>');" style="visibility: hidden;" />--%>
                <%--end for senior citizen--%>
            </div>
        </div>
        <div class="gap-small">
        </div>
    </div>
    <script type='text/javascript'>
        function emailValidator(element, alertMsg) {
            debugger;
            var emailvalid = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (element.value.match(emailvalid)) {
                return true;
            }
            else {
                alert(alertMsg);
                document.form1.emailid.focus();
                //element.focus();
                return false;
            }
        }
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
        function Numeric(e) {
            var k;
            document.all ? k = e.keyCode : k = e.which;
            return ((k > 64 && k < 91) || k == 8 || k == 32 || (k >= 48 && k <= 57));
        }
    </script>
    <script type="text/javascript">
        function onlyAlphabets(e, t) {
            debugger;
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
            debugger;
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
    <script type="text/javascript">
            function confbook(u) {               
                debugger;
                var sala = "", fna = "", lna = "", agea = "";
                var fnm="",lnm="",ag="";
                var root = u.split("~");
                var phno = document.getElementById("phno").value;
                var emailid = document.getElementById("emailid").value;

                var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                
                debugger;
                var adt = root[2];
                var ch = root[3];
                var inf = root[4];
                var sen = root[5].split("!")[0];

                for (var m = 1; m <= sen; m++) {
                    fnm = "";
                    lnm = "";
                    ag = "";
                     fnm = document.getElementById("sf"+m).value;
                     lnm = document.getElementById("sl" + m).value;
                     ag = document.getElementById("sa" + m).value;
                     if (fnm == null || fnm == "" || lnm == null || lnm == "" || ag == null || ag == "") {
                         alert("Please Select Senior all fields");
                         return "";
                     }
                     else if (ag <60 ) {
                         alert("Please Select Valid Age For Senior");
                         return "";
                     }
                     else {
                         sala += document.getElementById("titles" + m).value + ",";
                         fna += document.getElementById("sf" + m).value + ",";
                         lna += document.getElementById("sl" + m).value + ",";
                         agea += document.getElementById("sa" + m).value + ",";
                     }
                }

                 for (var j = 1; j <= adt; j++) {
                     fnm = "";
                     lnm = "";
                     ag = "";
                     fnm = document.getElementById("af" + j).value;
                     lnm = document.getElementById("al" + j).value;
                     ag = document.getElementById("aa" + j).value;
                     if (fnm == null || fnm == "" || lnm == null || lnm == "" || ag == null || ag == "") {
                         alert("Please Select Adult all fields");
                         return "";
                     }
                     else
                     {
                    sala += document.getElementById("titlea" + j).value + ",";
                    fna += document.getElementById("af" + j).value + ",";
                    lna += document.getElementById("al" + j).value + ",";
                    agea += document.getElementById("aa" + j).value + ",";
                    }
                }

            for (var k = 1; k <= ch; k++) {
                fnm = "";
                lnm = "";
                ag = "";
                fnm = document.getElementById("cf" + k).value;
                lnm = document.getElementById("cl" + k).value;
                ag = document.getElementById("ca" + k).value;
                if (fnm == null || fnm == "" || lnm == null || lnm == "" || ag == null || ag == "") {
                    alert("Please Select Child all fields");
                    return "";
                }
                else {
                    sala += document.getElementById("titlec" + k).value + ",";
                    fna += document.getElementById("cf" + k).value + ",";
                    lna += document.getElementById("cl" + k).value + ",";
                    agea += document.getElementById("ca" + k).value + ",";
                }
                }

            for (var l = 1; l <= inf; l++) {
                fnm = "";
                lnm = "";
                ag = "";
                fnm = document.getElementById("if" + l).value;
                lnm = document.getElementById("il" + l).value;
                ag = document.getElementById("ia" + l).value;
                if (fnm == null || fnm == "" || lnm == null || lnm == "" || ag == null || ag == "") {
                    alert("Please Select Infant all fields");
                    return "";
                }
                else {
                    sala += document.getElementById("titlei" + l).value + ",";
                    fna += document.getElementById("if" + l).value + ",";
                    lna += document.getElementById("il" + l).value + ",";
                    agea += document.getElementById("ia" + l).value + ",";
                }
            }

            if ((!filter.test(emailid)) || emailid == null || emailid == "") {
                alert('Please provide valid email address');
                //email.focus;
                return "";
            }

            if (phno == null || phno == "") {
                alert('Please provide phone number');
                return "";
            }

                

                var finaldata3 = sala + "/" + fna + "/" + lna + "/" + agea+"*"+emailid+","+phno+ "/" + u;
                window.parent.location.href = "citysightbookafterpayment.aspx?Sessiond=" + finaldata3;

            }
    </script>
    </form>
</asp:Content>
