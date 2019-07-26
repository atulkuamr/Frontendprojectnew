using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Xml;
using System.Xml.Xsl;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Configuration;
using System.Net.Mail;
using System.Net.Mime;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

public partial class CancelBookingPopUp : System.Web.UI.Page
{
    string supplier = "";
    string lastname = "";
    string firstname = "";
    string email = "";
    public string bookingdetails = "";
    public string Hname = "";
    public string ConfirmationID = "";
    public string BookingID = "";
    public string Email = "";
    public string CheckIndate = "";
    public string CheckOutdate = "";
    public string Bookingdate = "";
    public string Contactno = "";
    public string Status = "";
    public string currtst = string.Empty;
    public string cancellationPolicy = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginVal"].ToString() == "directorops@holidayscarnivaleurope.com")
            currtst = "€";
        else
            currtst = "INR";

        string bookref = Request.QueryString["RID"].ToString();

        string Sql = "Select a.Supplier, a.BKDetails, a.Status, a.HotelName, a.BookingId, a.PhoneNo, a.EmailID, a.CheckIn, a.CheckOut, a.BookingDate, b.Policy, b.Deadline, c.LastName, c.Firstname from HotelBookingDetails a, cancellationPolicy b, CustomerDetails c where a.BookingReference='" + bookref + "' and b.BookingRef='" + bookref + "' and c.BookingRef='" + bookref + "'";
        SqlDataReader sdr = DB.CommonDatabase.DataReader(Sql);
        try
        {
            if (sdr.Read())
            {
                Hname = sdr["HotelName"].ToString();
                supplier = sdr["Supplier"].ToString();
                ConfirmationID = bookref;
                BookingID = sdr["BookingId"].ToString();
                Contactno = sdr["PhoneNo"].ToString();
                Email = sdr["EmailID"].ToString();
                CheckIndate = sdr["CheckIn"].ToString();
                CheckOutdate = sdr["CheckOut"].ToString();
                Bookingdate = sdr["BookingDate"].ToString();
                cancellationPolicy = sdr["Policy"].ToString() + sdr["Deadline"].ToString();
                lastname = sdr["LastName"].ToString();
                email = sdr["BKDetails"].ToString().Split('|')[7].Split('$')[0];
                bookingdetails = sdr["BKDetails"].ToString();
                Status = sdr["Status"].ToString();
                firstname = sdr["Firstname"].ToString() + " "+sdr["LastName"].ToString();
            }
        }
        catch (Exception)
        {
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        cls.CommonClass obj = new cls.CommonClass();
        string Remarks = "";
        string RES = "";
        string Currency = "";
        string CancellationCharges = "";
        decimal RefundAmount = 0;
        string BookingId = "";
        string message = "";
        if (supplier.ToUpper() == "DESIYA")
        {
            RES = obj.HotelCancelBooking(BookingID, ConfirmationID + "$" + CheckIndate + "$" + CheckOutdate + "$" + email + "$" + lastname, supplier);
        }
        else if (supplier.ToUpper() == "TRAVELBULLZ")
        {
            RES = obj.HotelCancelBooking(BookingID, ConfirmationID, supplier);
        }
        else if (supplier.ToUpper() == "TBO")
        {
            RES = obj.HotelCancelBooking(BookingID, ConfirmationID, supplier);
        }
        else if (supplier.ToUpper() == "EZEEGO1")
        {
            RES = obj.HotelCancelBooking(BookingID, ConfirmationID, supplier);
        }
        else if (supplier.ToUpper() == "ABREU")
        {
            RES = obj.HotelCancelBooking(BookingID, ConfirmationID, supplier);
        }
        else if (supplier.ToUpper() == "TRAVSTARZ")
        {
            RES = obj.HotelCancelBooking(BookingID, ConfirmationID, supplier);
        }
        else
        {
            RES = obj.HotelCancelBooking(BookingID, ConfirmationID, supplier);
        }

        try
        {
            XmlDocument doc = CF.CommonFunction.JSONtoXML(RES);
            XmlNodeList hotelres = doc.GetElementsByTagName("CancelBooking");
            foreach (XmlNode rnode in hotelres)
            {
                foreach (XmlNode node in rnode)
                {
                    try
                    {
                        Currency = node["currency"].InnerText;
                    }
                    catch (Exception ex)
                    {
                    }
                    try
                    {
                        CancellationCharges = node["Cancellationcharge"].InnerText;
                    }
                    catch (Exception ex)
                    {
                    }
                    try
                    {
                        RefundAmount = Convert.ToInt32(node["NetRefund"].InnerText);
                    }
                    catch (Exception ex)
                    {
                    }
                    try
                    {
                        BookingId = node["bookingref"].InnerText;
                    }
                    catch (Exception ex)
                    {
                    }
                    try
                    {
                        Remarks = node["remark"].InnerText;
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }
        catch (Exception ex)
        {
            message = "Cancellation Failed!!";
        }

        if (Remarks.ToUpper() == "CANCELLED")
        {
            string sql = "update HotelBookingDetails set Status='" + Remarks + "' where BookingId ='" + BookingID + "' and BookingReference = '" + ConfirmationID + "'";
            try
            {
                DB.CommonDatabase.RunQuery(sql);
                message = "Cancellation Confirmed!!";

                try
                {
                    var data = bookingdetails.Split('$');
                    string City = data[2].Split('^')[4].Split('@')[1];
                    string Amount = currtst + data[0].Split('!')[15];
                    string roomtype = data[0].Split('!')[12] + " (" + data[0].Split('!')[17].Split('%')[0] + ")";

                    string Emails = email + "," + Session["loginVal"] + "," + "xmlbookings@travstarz.com";//
                    if (email != null || email != "")
                    {
                        MailMessage mm = new MailMessage();
                        mm.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                        mm.Subject = "Booking Cancelled";

                        string[] multi = Emails.Split(',');
                        foreach (string multiid in multi)
                        {
                            mm.Bcc.Add(new MailAddress(multiid));
                        }
                        mm.Body = string.Format("Your Booking Cancellation Details ,<br /><br /><div class='container' align='center'><h2>Hotel Cancel Booking Invoice</h2><table style='border: 2px solid navy;' width='750px'><tbody><tr><td style='border: 2px solid gray; padding:10px;'><b>Invoice Number: </b>" + ConfirmationID + "</td><td style='border: 2px solid gray; padding:10px;'><b>Booking Id: </b>" + BookingID + "</td></tr><tr><td style='border: 2px solid gray; padding:10px;'><b>Cancel Booking Date: </b>" + DateTime.Now.ToString("dd-MM-yyyy") + "</td><td style='border: 2px solid gray; padding:10px;'><b>Status: </b>" + Remarks + "</td></tr><tr style='height: 10px;'></tr><tr><td colspan='2' align='center'><img src=\"@@IMAGE@@\" alt=\"INLINE attachment\" height='70' width='250' /><br /><font size='2'>(A Unit of Travstarz Holiday &amp; Destinations Pvt.Ltd)</font><br /><font size='2'>61-C 2nd Floor Eagle House Kalu Sarai Sarva Priya Vihar<br />New Delhi - 110016,&nbsp;&nbsp;India<br /><i>Tel No. :</i>&nbsp;47050000&nbsp;&nbsp;<i>Mail :</i>&nbsp;info@travstarz.com</font><br /><font size='2'><b>GST No:</b>&nbsp;07AAHCA9883B1ZI&nbsp;&nbsp;&nbsp;<b>Pan No:</b>&nbsp;AAHCA9883B</font></td></tr><tr style='height: 10px;'></tr><tr><td colspan='2' align='left' style='padding:10px;'><font size='4'>" + data[data.Length - 1].Split('!')[4] + "</font><br /><%=adrs %></td></tr><tr style='height: 15px;'></tr><tr><td style='padding-left:10px; width:50%;'><b>Check In Date: </b>" + CheckIndate + "</td><td style='padding-left:10px;'><b>Check Out Date: </b>" + CheckOutdate + "</td></tr><tr><td style='padding-left:10px; width:50%;'><b>Hotel Name: </b>" + Hname + "</td><td style='padding-left:10px;'><b>City: </b> " + City + "</td></tr><tr><td style='padding-left:10px; width:50%;'><b>Pax Name: </b>" + firstname + "</td><td style='padding-left:10px;'><b>Room Type: </b>" + roomtype + "</td></tr><tr style='height: 25px;'></tr><tr><td align='center' colspan='2'><table width='100%' border='1px' cellpadding='10px'><tr><td><b>Amount (Including all Taxes)</b></td><td><b>Grand Total</b></td></tr><tr><td>" + Amount + "</td><td>" + Amount + "</td></tr></table></td><td align='center' colspan='2'></td></tr><tr style='height: 20px;'></tr><tr><td><b>Terms and Conditions</b></td><td align='right' rowspan='2'><b>Receiver's Signature</b></td></tr><tr style='height: 10px;'></tr><tr><td colspan='2' align='center'><b>This is an auto generated invoice hence no signature require.</b></td></tr></tbody></table></div><br /><br />Thank You.");
                        mm.IsBodyHtml = true;

                        string attachmentPath = Server.MapPath("~/new-travel-rez.png");
                        Attachment inline = new Attachment(attachmentPath);
                        string contentID = Path.GetFileName(attachmentPath).Replace(".", "") + "@zofm";
                        inline.ContentDisposition.Inline = true;
                        inline.ContentDisposition.DispositionType = DispositionTypeNames.Inline;
                        inline.ContentId = contentID;
                        inline.ContentType.MediaType = "image/png";
                        inline.ContentType.Name = Path.GetFileName(attachmentPath);
                        mm.Attachments.Add(inline);
                        mm.Body = mm.Body.Replace("@@IMAGE@@", "cid:" + contentID);
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = ConfigurationManager.AppSettings["Host"];

                        smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
                        ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
                        NetworkCredential NetworkCred = new NetworkCredential();
                        NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                        NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                        smtp.Send(mm);
                    }
                }
                catch (Exception)
                {
                }

            }
            catch (Exception)
            {
                message = "Cancellation Failed!!";
            }
        }

        string bkid = "";
        if (supplier.ToUpper() == "TRAVELBULLZ")
        {
            bkid = BookingID.Split('#')[0];
        }
        else
        {
            bkid = BookingID;
        }

        string nm = Session["loginVal"].ToString();
        if (Status.ToUpper() != "HOLD")
        {
            bool AddTxnSuccessTPT = CF.CommonFunction.HotelTransaction(ConfirmationID, RefundAmount + "!" + bookingdetails + "!!!!" + supplier.ToUpper(), "Online", 1, nm, "Dr", BookingID,"INR");
        }
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script type = 'text/javascript'>");
        sb.Append("window.onload =function(){");
        sb.Append("alert('");
        sb.Append(message);
        sb.Append("')};");
        sb.Append("</script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
    }
}