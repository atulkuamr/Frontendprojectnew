using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Net.Mime;
using System.Net.Security;
using System.Net;
using System.Data.SqlClient;

public partial class citysightseeingconfirmation : System.Web.UI.Page
{
    public string finaldata3 = string.Empty;
    public string bookingid = string.Empty;
    public string bookingdetails = string.Empty;
    public string bookingdate = string.Empty;
    public string status = string.Empty;
    public string[] arr;
    public string dayinfo = string.Empty;
    public string passinfo = string.Empty;
    string login = string.Empty;
    string userid = string.Empty;
    string name = string.Empty;
    string emailid = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        login = Session["loginVal"].ToString();
        string sql1 = "Select * from adminlogin where username='" + login + "'";
        SqlDataReader sdr1 = DB.CommonDatabase.DataReader(sql1);
        if (sdr1.Read())
        {
            name = sdr1["ContactPerson"].ToString();
            emailid = sdr1["Email"].ToString();
        }

        if (login.Contains('@'))
            userid = login;
        else
            userid = emailid;

        finaldata3 = Request.QueryString["Finalstr"];
        bookingid = finaldata3;
        string sql = "select * from HopOnHopOffBookingDetails where  bookingid='" + finaldata3 + "'";
        System.Data.SqlClient.SqlDataReader sdr = DB.CommonDatabase.DataReader(sql);
        if (sdr.Read())
        {
            bookingdetails = sdr.GetString(2);
            bookingdate = sdr.GetString(3);
            status = sdr.GetString(4);
        }
        arr = bookingdetails.Split('~');
        dayinfo = bookingdetails.Split('!')[1].Split('$')[0].TrimEnd('~');
        passinfo = bookingdetails.Split('~')[0];


        MailMessage mm;
        mm = new MailMessage("packages@travstarz.com", "priyankapuri@travstarz.com"); //bookings@travstarz.com  "webqueries@travstarz.com", "info@travstarz.com"               
       // mm.Body = string.Format("Hi");
        mm.Subject = userid + " , " + name + " , " + bookingdate + " , " + arr[1];
        mm.Body = string.Format("<form id='Form1' runat='server'><div style='height: 25px;'></div>");
        mm.Body += ("<div class='row' align='center' style='font-size: x-large; font-weight: bold'>");
        mm.Body += ("SightSeeing Confirmation</div><div style='height: 15px;'></div>");
        mm.Body += ("<div class='container' style='border: 2px solid #ccc; max-width: 850px; min-height: 30px;font-size: large;'>");
        mm.Body += ("<div class='row'><div class='col-md-6' style='border-right: 2px solid #ccc;'><div class='col-md-12' style='height:15px;'></div>");
        mm.Body += ("<div class='col-md-6'><b>Booking ID :</b></div>");
        mm.Body += ("<div class='col-md-6'>" + bookingid + "</div><div class='col-md-6'>");
        mm.Body += ("<b>Booking Date :</b></div><div class='col-md-6'>" + bookingdate + "</div>");
        mm.Body += ("<div class='col-md-6'><b>Status :</b></div><div class='col-md-6'>");
        mm.Body += ("" + status + "</div><div class='col-md-12' style='height:15px;'></div></div>");
        mm.Body += ("<div class='col-md-6' align='right'><b>Travel Rez Online<br />61-C Kalu Sarai, hauz Khas,<br />Delhi-110016<br />47050000</b></div>");
        mm.Body += ("</div><div class='row' align='center' style='background-color: #808080; color: #000000;");
        mm.Body += ("min-height: 35px; margin-bottom: 5px; border-top: 2px solid #ccc;border-bottom: 2px solid #ccc;>");
        mm.Body += ("<b>SightSeeing Details:</b></div><div class='row'><div class='col-md-3'>");
        mm.Body += ("<b>Country :</b></div><div class='col-md-3'>" + arr[0].Split('/')[4] + "</div>");
        mm.Body += ("<div class='col-md-3'><b>City :</b></div><div class='col-md-3'>" + arr[1] + "</div>");
        mm.Body += ("</div><div class='row' style='margin-top: 10px; min-height: 30px;'><div class='col-md-3'><b>SightSeeing Name:</b></div><div class='col-md-3'>");
        mm.Body += (arr[1] + "</div></div>");
        for (int i = 0; i < dayinfo.Split('~').Length; i = i + 2)
        {
            mm.Body += ("<div class='row' style='margin-top: 3px'><div class='col-md-6'>");
            mm.Body += dayinfo.Split('~')[i + 1];
            mm.Body += (":</div><div class='col-md-6'>INR");
            mm.Body += ("" + dayinfo.Split('~')[i] + "</div></div>");
        }
        mm.Body += ("<div class='row' align='center' style='background-color: #808080; color: #000000;");
        mm.Body += ("border-top: 2px solid #ccc; min-height: 35px; margin-top: 5px; margin-bottom: 5px'>");
        mm.Body += ("<b>Passenger Details:</b></div>");
        for (int j = 0; j < passinfo.Split('/')[0].Split(',').Length - 1; j++)
        {
            mm.Body += ("<div class='row' style='margin-top: 3px; min-height: '><div class='col-md-4'>" + passinfo.Split('/')[0].Split(',')[j] + "</div>");
            mm.Body += ("<div class='col-md-4'>" + passinfo.Split('/')[1].Split(',')[j] + "</div><div class='col-md-4'>");
            mm.Body += ("" + passinfo.Split('/')[2].Split(',')[j] + "</div></div>");
        }
        mm.Body += ("<div class='row' align='center' style='background-color: #808080; color: #000000;border-top: 2px solid #ccc; min-height: 35px'>");
        mm.Body += ("<b>Fare Details:</b></div>");
        var total = 0;
        for (int i = 0; i < dayinfo.Split('~').Length; i = i + 2)
        {
            total += Convert.ToInt16(dayinfo.Split('~')[i]);
        }
        mm.Body += ("<div class='row' style='border-top: 2px solid #ccc;'><div class='col-md-6'></div>");
        mm.Body += ("<div class='col-md-6' align='right'><b>Total Amount:</b></div></div>");
        mm.Body += ("<div class='row' style='border-top: 2px solid #ccc;'><div class='col-md-6'></div><div class='col-md-6' align='right'>");
        mm.Body += ("INR" + total + "</div></div></div><div class='gap'></div></form>");


            //mm.Subject = aemail.Value + " , " + aname.Value + " , " + dest.Value + " , " + sdt.Value;
            //var
            //Mr,/gr,/hrh,/45,/South Africa~Cape Town~1~0~0~0!968~1 Day Hop On Hop Off~
            //Mr,/abhishek,/kumar,/34,/South Africa~Cape Town~1~0~0~0!968~                                    1 Day Hop On Hop Off
            //~$OOU!Admin Staff!TRAVREZ99!!Travstarz holidays and Destination pvt ltd!Hauz Khas!01147050034!8928129089!Abhishek Kumar
            //!INR!New Delhi!Delhi!110016!INDIA!OOU!A

        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.mailhostbox.com";
        smtp.EnableSsl = true;

        ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = "packages@travstarz.com";
        NetworkCred.Password = "%TDrLqu2";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 25;
        smtp.Send(mm);
        try
        {

        }


        catch (SmtpFailedRecipientsException ex)
        {
            for (int i = 0; i < ex.InnerExceptions.Length; i++)
            {
                SmtpStatusCode status1 = ex.InnerExceptions[i].StatusCode;
                if (status1 == SmtpStatusCode.MailboxBusy ||
                    status1 == SmtpStatusCode.MailboxUnavailable)
                {
                    Console.WriteLine("Delivery failed - retrying in 5 seconds.");
                    System.Threading.Thread.Sleep(5000);
                    smtp.Send(mm);
                }
                else
                {
                    Console.WriteLine("Failed to deliver message to {0}",
                        ex.InnerExceptions[i].FailedRecipient);
                }
            }
        }

        catch (Exception ex)
        {
            Console.WriteLine("Exception caught in RetryIfBusy(): {0}",
                    ex.ToString());
        }
       // Response.Redirect(Request.Url.AbsoluteUri);
    }
}
