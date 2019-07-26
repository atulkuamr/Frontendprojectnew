using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Globalization;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Security;
using System.IO;
using System.Net.Mime;
using System.Security.Cryptography.X509Certificates;
using Microsoft.VisualBasic;
using System.Collections;
using Microsoft;
using System.Diagnostics;
using System.Threading;
using System.ComponentModel;
using System.Data;
using System.Text;
using System.Collections.Specialized;


public partial class BookAfterPayment : System.Web.UI.Page
{
    //public string ftorderid = null, ftamount = null, ftstatus = null, ftstatusMsg = null;
    public string ftorderid = null, ftresponseDescription = null, ftchecksum = null, ftresponseCode = null, ftamount = null, ftmid = null, ftreferenceNumber = null;
    public string currtst = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["loginVal"].ToString() == "directorops@holidayscarnivaleurope.com")
                currtst = "€";
            else
                currtst = "INR";
            // Generate booking reference number for agent, to find their bookings details.This number is unique for every agent.........
            string AvailableCash = Session["AvlCash"].ToString();

            string bookingref = Session["bookingRef"].ToString();
            //Session["bookingRef"] = bookingref;
            // Complete booking details string.......
            string BookData = Session["BookData"].ToString().Replace("(HASH)", "#");
            string CustomerDetails = BookData.Split('$')[1];
            string totpassanger = (CustomerDetails.Split('/')[0].Split(',').Length - 1).ToString();
            string agentdetails = CF.CommonFunction.agencydetails(Session["loginVal"].ToString());
            string cat = Session["Category"].ToString();

            //ftresp

            //using (var client = new WebClient())
            //{
            //    //string result = client.DownloadString("https://ftcash.com/websdkresponse/responsem.php");

            if (Session["HoldBooking"].ToString() == "No")
            {
                try
                {
                    NameValueCollection nvc = Request.Form;

                    if (!string.IsNullOrEmpty(nvc["orderid"]))
                    {
                        ftorderid = nvc["orderid"];
                    }

                    if (!string.IsNullOrEmpty(nvc["responseDescription"]))
                    {
                        ftresponseDescription = nvc["responseDescription"];
                    }

                    if (!string.IsNullOrEmpty(nvc["checksum"]))
                    {
                        ftchecksum = nvc["checksum"];
                    }

                    if (!string.IsNullOrEmpty(nvc["responseCode"]))
                    {
                        ftresponseCode = nvc["responseCode"];
                    }

                    if (!string.IsNullOrEmpty(nvc["amount"]))
                    {
                        ftamount = nvc["amount"];
                    }

                    if (!string.IsNullOrEmpty(nvc["mid"]))
                    {
                        ftmid = nvc["mid"];
                    }

                    if (!string.IsNullOrEmpty(nvc["referenceNumber"]))
                    {
                        ftreferenceNumber = nvc["referenceNumber"];
                    }




                    string ServerPath = Server.MapPath("~\\FtCash");

                    string DataFile = bookingref + ".txt";
                    FileStream fs = new FileStream(ServerPath + "/" + DataFile, FileMode.Create, FileAccess.Write);
                    StreamWriter fp = new StreamWriter(fs, Encoding.UTF8);
                    try
                    {
                        fp.WriteLine(nvc);
                    }
                    catch (Exception Ex)
                    {
                    }
                    finally
                    {
                        fp.Close();
                        fp = null;
                    }


                }
                catch (Exception ex)
                {
                    string ServerPath = Server.MapPath("ErrorLogs");
                    string DataFile1 = "BookAfterPayment" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
                    FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
                    StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
                    try
                    {

                        fp1.WriteLine(ex.Message.ToString());
                    }
                    catch (Exception Ex)
                    {
                    }
                    finally
                    {
                        fp1.Close();
                        fp1 = null;

                    }
                }

            }

            string bookingdetail = BookData + "$" + agentdetails;
            cls.CommonClass obj = new cls.CommonClass();

            string supplier = BookData.Split('$')[0].Split('!')[5];
            string bookingresponse = string.Empty;
            string price = BookData.Split('$')[0].Split('!')[15];

            try
            {
                if (ftresponseCode == "1")
                {

                    Response.Redirect("Bankissue.aspx?");

                }
            }
            catch (Exception ex)
            {

            }

            string ExtraInfo1 = "";
            if (BookData.Split('$')[0].Split('!')[5].ToUpper() == "HOTELBEDS")
            {
                string[] arr = BookData.Split('$')[0].Split('!');
                string response = "", cancellationcharge = "";

                string policydet = arr[16] + "$" + arr[11] + "$" + arr[14] + "$" + arr[5] + "$" + arr[7];
                cls.CommonClass plcy = new cls.CommonClass();
                response = plcy.GetCancelPolicy(BookData.Split('$')[2], policydet, "HOTELBEDS", cat);

                string deadln = "";

                try
                {
                    if (!string.IsNullOrEmpty(response))            //Parsing cancellation policy.......
                    {
                        XmlDocument doc = CF.CommonFunction.JSONtoXML(response);
                        XmlNodeList cnlplcy = doc.GetElementsByTagName("Cancellationpolicies");
                        foreach (XmlNode rootnode in cnlplcy)
                        {
                            foreach (XmlNode chnode in rootnode)
                            {
                                cancellationcharge = chnode["Cancellationcharge"].InnerText;
                                ExtraInfo1 = chnode["ExtraInfo1"].InnerText;
                            }
                        }
                    }
                    else
                    {
                        cancellationcharge = "No Cancellation Policy Found. Deadline: " + DateTime.Now.ToString("yyyy-MM-dd");
                    }

                    // End region of cancellation policy ...............

                    string[] policy = Regex.Split(cancellationcharge, "Deadline: ");
                    string sql1 = "Insert into cancellationPolicy(BookingRef,Policy,Deadline) values(";
                    if (policy.Length > 1)
                    {
                        DateTime daedline = DateTime.ParseExact(policy[1], "dd-MM-yyyy", CultureInfo.InvariantCulture);
                        sql1 += "'" + bookingref + "','" + policy[0] + "','" + daedline.ToString("yyyy-MM-dd") + "')";
                        deadln = daedline.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        sql1 += "'" + bookingref + "','" + policy[0] + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "')";
                        deadln = DateTime.Now.ToString("yyyy-MM-dd");
                    }
                    try
                    {
                        DB.CommonDatabase.RunQuery(sql1);
                    }
                    catch (Exception)
                    {
                        cls.CommonClass objnew = new cls.CommonClass();
                        objnew.LogFailedQuery(sql1, "cancellationPolicy_" + supplier);
                    }
                }
                catch (Exception ex)
                {
                    string ServerPath = Server.MapPath("ErrorLogs");
                    string DataFile1 = "BookAfterPayment" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
                    FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
                    StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
                    try
                    {

                        fp1.WriteLine(ex.Message.ToString());
                    }
                    catch (Exception Ex)
                    {
                    }
                    finally
                    {
                        fp1.Close();
                        fp1 = null;

                    }

                }
            }

            //End calling cancellation policy........

            //Start Calling booking method supplier wise....
            string status = ""; string bookingId = "";
            try
            {

                if (supplier.ToUpper() == "TBO")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, CustomerDetails, price, totpassanger, supplier);
                }
                if (supplier.ToUpper() == "DOTW")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger, bookingref, supplier);
                }
                else if (supplier.ToUpper() == "DESIYA")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger, bookingref, supplier);
                }
                else if (supplier.ToUpper() == "TRAVELBULLZ")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger, bookingref, supplier);
                }
                else if (supplier.ToUpper() == "EZEEGO1")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger + "," + Session["EzeeGoId"].ToString(), bookingref, supplier);
                }
                else if (supplier.ToUpper() == "ABREU")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger, bookingref, supplier);
                }
                else if (supplier.ToUpper() == "HOTELBEDS")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger + "^" + ExtraInfo1, bookingref, supplier);
                }
                else if (supplier.ToUpper() == "TRAVSTARZ")
                {
                    string id = CF.CommonFunction.NewNumber12();
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger + "`" + id, bookingref, supplier);
                }
                else if (supplier.ToUpper() == "QUANTUM")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger + "^" + ExtraInfo1, bookingref, supplier);
                }

                else if (supplier.ToUpper() == "JACTRAVEL")
                {
                    bookingresponse = obj.GetHotelBooking(bookingdetail, price, totpassanger + "," + Session["PreBookingToken"].ToString(), bookingref, supplier);
                }
                if (supplier.ToUpper() == "DESIYA")
                {
                    if (bookingresponse.Contains('{') || bookingresponse == "")
                    {
                    }
                    else
                    {
                        Session["bookingdetail"] = bookingdetail;
                        Response.Redirect("pricechange.aspx?oldprice=" + BookData.Split('$')[0].Split('!')[15] + "$" + bookingresponse);
                    }
                }

                
                if (!string.IsNullOrEmpty(bookingresponse))             // Booking Details parsing.......
                {
                    XmlDocument doc = CF.CommonFunction.JSONtoXML(bookingresponse);
                    XmlNodeList hotelres = doc.GetElementsByTagName("Booking");
                    foreach (XmlNode hnode in hotelres)
                    {
                        foreach (XmlNode chnode in hnode)
                        {
                            bookingId = chnode["booking_id"].InnerText;
                            status = chnode["confirmation"].InnerText;
                            if (bookingId != "" && status == "")
                            {
                                status = "Confirmed";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string ServerPath = Server.MapPath("ErrorLogs");
                string DataFile1 = "BookAfterPayment" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
                FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
                StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
                try
                {

                    fp1.WriteLine(ex.Message.ToString());
                }
                catch (Exception Ex)
                {
                }
                finally
                {
                    fp1.Close();
                    fp1 = null;

                }
            }


            //End .............
            if (Session["HoldBooking"].ToString() == "Yes")
            {
                status = "Hold";
            }

            string sql = ""; string title = ""; string firstname = ""; string lastname = ""; string passport = "";
            string GN = "";
            for (int i = 0; i < Convert.ToInt16(totpassanger); i++)
            {
                title = CustomerDetails.Split('/')[0].Split(',')[i];
                firstname = CustomerDetails.Split('/')[1].Split(',')[i];
                lastname = CustomerDetails.Split('/')[2].Split(',')[i];
                passport = CustomerDetails.Split('/')[3].Split(',')[i];
                GN = CustomerDetails.Split('/')[4].Split(',')[i];
                sql = "Insert into CustomerDetails(BookingRef, Title, Firstname, Lastname, BookingDate, Passport, GuestNationality) values('" + bookingref + "','" + title + "','" + firstname + "','" + lastname + "','" + DateTime.Now + "','" + passport + "','" + GN + "')";
                try
                {
                    DB.CommonDatabase.RunQuery(sql);
                }
                catch (Exception)
                {
                    cls.CommonClass objnew = new cls.CommonClass();
                    objnew.LogFailedQuery(sql, "CustomerDetails_" + supplier);
                }
            }

            if (bookingId != "")
            {
                // Calling method of cancellation policy..........

                string[] arr = BookData.Split('$')[0].Split('!');
                string response = ""; string cancellationcharge = "";
                if (arr[5].ToUpper() == "TBO")
                {
                    string policydet = arr[16] + "$" + arr[11];
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = plcy.GetCancelPolicy(policydet, "", "TBO", cat);
                }
                else if (arr[5].ToUpper() == "DOTW")
                {
                    string policydet = "$" + arr[11] + "$" + arr[14] + "$" + arr[5] + "$";
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = plcy.GetCancelPolicy(BookData.Split('$')[2], policydet, "DOTW", cat);
                }
                else if (arr[5].ToUpper() == "TRAVELBULLZ")
                {
                    string policydet = arr[16] + "$" + arr[11] + "$" + arr[14] + "$" + arr[5] + "$" + arr[7] + "~";
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = obj.GetCancelPolicy(BookData.Split('$')[2], policydet, "TRAVELBULLZ", cat);
                }
                else if (arr[5].ToUpper() == "DESIYA")
                {
                    string policydet = arr[16] + "$" + arr[11] + "$" + arr[17].Split('*')[1] + "$" + arr[13];
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = plcy.GetCancelPolicy(BookData.Split('$')[2], policydet, "DESIYA", cat);
                }

                else if (arr[5].ToUpper() == "EZEEGO1")
                {
                    string policydet = arr[16] + "$" + arr[11] + "$" + arr[8] + "$" + arr[13] + "$" + arr[7];
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = plcy.GetCancelPolicy(BookData.Split('$')[2], policydet, "EZEEGO1", cat);
                }
                else if (arr[5].ToUpper() == "ABREU")
                {
                    string policydet = arr[16] + "$" + arr[11] + "$" + arr[8] + "$" + arr[13] + "$" + arr[7] + "$" + arr[17].TrimEnd('%');
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = plcy.GetCancelPolicy(BookData.Split('$')[2], policydet, "ABREU", "INR");
                }
                else if (arr[5].ToUpper() == "HOTELBEDS")
                {
                    string policydet = arr[16] + "$" + arr[11] + "$" + arr[8] + "$" + arr[13] + "$" + arr[7];
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = plcy.GetCancelPolicy(BookData.Split('$')[2], policydet, "HOTELBEDS", cat);
                }
                else if (arr[5].ToUpper() == "QUANTUM")
                {
                    string policydet = arr[16] + "$" + arr[11] + "$" + arr[8] + "$" + arr[13] + "$" + arr[7];
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = plcy.GetCancelPolicy(BookData.Split('$')[2], policydet, "QUANTUM", cat);
                }

                else if (arr[5].ToUpper() == "JACTRAVEL")
                {
                    string policydet = arr[16] + "$" + arr[11] + "$" + arr[14] + "$" + arr[5] + "$" + arr[7] + "$" + BookData.Split('$')[0];
                    cls.CommonClass plcy = new cls.CommonClass();
                    response = obj.GetCancelPolicy(BookData.Split('$')[2], policydet, "JACTRAVEL", "INR");
                }
                else if (arr[5].ToUpper() == "TRAVSTARZ")
                {

                    //DateTime dt1 = DateTime.ParseExact(searchparam.Split('^')[0], "dd MMM yyyy", CultureInfo.InvariantCulture);
                    //DateTime dt2 = DateTime.ParseExact(searchparam.Split('^')[1], "dd MMM yyyy", CultureInfo.InvariantCulture);
                    //string formatfromdDate = dt1.ToString("yyyy-MM-dd");
                    //string formattodDate = dt2.ToString("yyyy-MM-dd");
                    //string htlid = bookdet.Split('!')[7];
                    //string rmtype = bookdet.Split('!')[12];
                    //cls.CommonClass plcy = new cls.CommonClass();
                    //for (int r = 0; r < rmtype.Split('~').Length; r++)
                    //{
                    //    response += plcy.GetCancelPolicy(htlid, rmtype.Split('~')[r], formatfromdDate, formattodDate);
                    //}
                    //policydet = "$"+arr[11] + "$" + arr[14] + "$" + arr[13] + "$" + arr[7];
                    //response = obj.GetCancelPolicy(searchparam, policydet, "TRAVSTARZ", cat);
                    // response = bookdet.Split('*')[1];//.Split('~')[0];
                }

                string deadln = "";

                try
                {
                    if (!string.IsNullOrEmpty(response))            //Parsing cancellation policy.......
                    {
                        XmlDocument doc = CF.CommonFunction.JSONtoXML(response);
                        XmlNodeList cnlplcy = doc.GetElementsByTagName("Cancellationpolicies");
                        foreach (XmlNode rootnode in cnlplcy)
                        {
                            foreach (XmlNode chnode in rootnode)
                            {
                                cancellationcharge = chnode["Cancellationcharge"].InnerText.Replace("'", "");
                            }
                        }
                    }
                    else
                    {
                        cancellationcharge = "No Cancellation Policy Found. Deadline: " + DateTime.Now.ToString("yyyy-MM-dd");
                    }

                    // End region of cancellation policy ...............

                    string[] policy = Regex.Split(cancellationcharge, "Deadline: ");
                    sql = "Insert into cancellationPolicy(BookingRef,Policy,Deadline) values(";


                    if (supplier.ToUpper() == "EZEEGO1" || supplier.ToUpper() == "DESIYA")
                    {
                        if (policy.Length > 1)
                        {
                            DateTime daedline = DateTime.Parse(policy[1]);
                            sql += "'" + bookingref + "','" + policy[0] + "','" + daedline.ToString("yyyy-MM-dd") + "')";
                            deadln = daedline.ToString("yyyy-MM-dd");
                        }
                        else
                        {
                            sql += "'" + bookingref + "','" + policy[0] + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "')";
                            deadln = DateTime.Now.ToString("yyyy-MM-dd");
                        }
                    }
                    else
                    {
                        if (policy.Length > 1)
                        {
                            DateTime daedline;
                            if (supplier == "JACTRAVEL")
                            {

                                daedline = Convert.ToDateTime(policy[1].Split('T')[0]);
                            }
                            else
                            {
                                daedline = DateTime.ParseExact(policy[1], "dd-MM-yyyy", CultureInfo.InvariantCulture);
                            }
                            sql += "'" + bookingref + "','" + policy[0] + "','" + daedline.ToString("yyyy-MM-dd") + "')";
                            deadln = daedline.ToString("yyyy-MM-dd");
                        }
                        else
                        {
                            sql += "'" + bookingref + "','" + policy[0] + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "')";
                            deadln = DateTime.Now.ToString("yyyy-MM-dd");
                        }
                    }
                    try
                    {
                        DB.CommonDatabase.RunQuery(sql);
                    }
                    catch (Exception)
                    {
                        cls.CommonClass objnew = new cls.CommonClass();
                        objnew.LogFailedQuery(sql, "cancellationPolicy_" + supplier);
                    }
                }
                catch (Exception ex)
                {
                    string ServerPath = Server.MapPath("ErrorLogs");
                    string DataFile1 = "BookAfterPayment" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
                    FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
                    StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
                    try
                    {

                        fp1.WriteLine(ex.Message.ToString());
                    }
                    catch (Exception Ex)
                    {
                    }
                    finally
                    {
                        fp1.Close();
                        fp1 = null;

                    }
                }

                string HotelName = BookData.Split('$')[0].Split('!')[0];
                string chkin = BookData.Split('$')[2].Split('^')[0];
                string chkout = BookData.Split('$')[2].Split('^')[1];
                string pno = BookData.Split('$')[1].Split('|')[1];
                string loginval = Session["loginVal"].ToString();
                string emailid = loginval.Split('^')[0];
                string address = BookData.Split('$')[0].Split('!')[9];
                string ddl = "";
                try
                {
                    ddl = Convert.ToDateTime(deadln).ToString("yyyy-MM-dd");
                }
                catch (Exception)
                {
                    ddl = "";
                }
                try
                {
                    sql = "Insert into HotelBookingDetails(BookingReference, BookingId, BkDetails, EmailID, BookingDate, Status, Supplier, CheckIn, CheckOut, HotelName, PhoneNo, Address, Deadline) values(";
                    sql += "'" + bookingref + "',";
                    sql += "'" + bookingId + "',";
                    sql += "'" + bookingdetail + "',";
                    sql += "'" + emailid + "',";
                    sql += "'" + DateTime.Now.ToString("dd-MM-yyyy") + "',";
                    sql += "'" + status + "',";
                    sql += "'" + supplier + "',";
                    sql += "'" + Convert.ToDateTime(chkin).ToString("yyyy-MM-dd") + "',";
                    sql += "'" + Convert.ToDateTime(chkout).ToString("yyyy-MM-dd") + "',";
                    sql += "'" + HotelName + "',";
                    sql += "'" + pno + "',";
                    sql += "'" + address + "',";
                    sql += "'" + ddl + "')";
                    try
                    {
                        DB.CommonDatabase.RunQuery(sql);
                    }
                    catch (Exception)
                    {
                        cls.CommonClass objnew = new cls.CommonClass();
                        objnew.LogFailedQuery(sql, "HotelBookingDetails_" + supplier);
                    }
                }
                catch (Exception ex)
                {
                    string ServerPath = Server.MapPath("ErrorLogs");
                    string DataFile1 = "BookAfterPayment" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
                    FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
                    StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
                    try
                    {

                        fp1.WriteLine(ex.Message.ToString());
                    }
                    catch (Exception Ex)
                    {
                    }
                    finally
                    {
                        fp1.Close();
                        fp1 = null;

                    }
                }

                //try
                //{
                //    string xml = string.Empty;
                //    xml += "<?xml version='1.0' encoding='utf-8'?>";
                //    xml += "<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>";
                //    xml += "<soap:Body>";
                //    xml += "<InsertHotelDetails xmlns='http://tempuri.org/'>";
                //    xml += "<ReservationID>" + bookingref + "</ReservationID>";
                //    xml += "</InsertHotelDetails>";
                //    xml += "</soap:Body>";
                //    xml += "</soap:Envelope>";

                //    string url = "http://bookingapi.theholidaykingdom.com/ApiList.asmx";
                //    cls.CommonClass obj1 = new cls.CommonClass();
                //    string responsedata = obj1.PostXml4Min(url, xml);

                //    //SAve Logs
                //    string FileDateTime = Convert.ToString(System.DateTime.Now);
                //    FileDateTime = DateTime.Now.ToString("dd-MM-yyyy HH;mm;ss");
                //    string ServerPath = Path.Combine(HttpRuntime.AppDomainAppPath, "ExcelReport");
                //    string DataFileName = "InsertHotelDetails" + "_" + FileDateTime + ".txt";
                //    try
                //    {
                //        FileStream fs = new FileStream(ServerPath + "/" + DataFileName, FileMode.Create, FileAccess.Write);
                //        StreamWriter fp = new StreamWriter(fs, Encoding.UTF8);
                //        try
                //        {
                //            fp.WriteLine(xml + "****" + responsedata + "****" + url);
                //            fp.Close();
                //        }
                //        catch (Exception Ex)
                //        { }
                //        finally
                //        { }
                //    }
                //    catch (Exception Ex)
                //    { }
                //    //SAve Logs end
                //}
                //catch (Exception ex)
                //{
                //    //SAve Logs
                //    string FileDateTime = Convert.ToString(System.DateTime.Now);
                //    FileDateTime = DateTime.Now.ToString("dd-MM-yyyy HH;mm;ss");
                //    string ServerPath = Path.Combine(HttpRuntime.AppDomainAppPath, "ExcelReport");
                //    string DataFileName = "InsertHotelDetails" + "_" + FileDateTime + ".txt";
                //    try
                //    {
                //        FileStream fs = new FileStream(ServerPath + "/" + DataFileName, FileMode.Create, FileAccess.Write);
                //        StreamWriter fp = new StreamWriter(fs, Encoding.UTF8);
                //        try
                //        {
                //            fp.WriteLine(ex.ToString());
                //            fp.Close();
                //        }
                //        catch (Exception Ex)
                //        { }
                //        finally
                //        { }
                //    }
                //    catch (Exception Ex)
                //    { }
                //    //SAve Logs end}
                //}

                if (bookingId != "" || bookingId != null)
                {
                    try
                    {
                        if (supplier.ToUpper() == "TRAVELBULLZ")
                        {
                            bookingId = bookingId.Split('#')[0];
                        }
                        string username = string.Empty;
                        string password = string.Empty;
                        string email = CustomerDetails.Split('|')[4];
                        var data = bookingdetail.Split('$');
                        string roomtype = data[0].Split('!')[12] + " (" + data[0].Split('!')[17].Split('%')[0] + ")";
                        decimal servicetaxval = Convert.ToDecimal(data[0].Split('!')[15]) * ((Convert.ToDecimal(data[0].Split('!')[2].Split('`')[1])) / 100);
                        string price1 = currtst + " " + (Convert.ToDecimal(data[0].Split('!')[15]) + servicetaxval);
                        string city = data[2].Split('^')[4].Split('@')[1];
                        string totroom = (data[2].Split('~').Length - 1).ToString();
                        string totnyt = data[2].Split('^')[2];
                        string PaxName = string.Empty;
                        int totpax = data[1].Split('/')[0].Split(',').Length - 1;
                        for (int i = 0; i < totpax; i++)
                        {
                            PaxName += data[1].Split('/')[0].Split(',')[i] + " " + data[1].Split('/')[1].Split(',')[i] + " " + data[1].Split('/')[2].Split(',')[i] + "<br />";
                        }

                        string Emails = email + "," + Session["loginVal"] + "," + "xmlbookings@travstarz.com";
                        if (email != null || email != "")
                        {
                            MailMessage mm = new MailMessage();
                            mm.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                            mm.Subject = "Booking Invoice";

                            string[] multi = Emails.Split(',');
                            foreach (string multiid in multi)
                            {
                                mm.Bcc.Add(new MailAddress(multiid));
                            }
                            mm.Body = string.Format("Your Booking Confirmation Details ,<br /><br /><div class='container' align='center'><h2>Hotel Invoice</h2><table style='border: 2px solid navy;' width='750px'><tbody><tr><td style='border: 2px solid gray; padding:10px;'><b>Invoice Number: </b>" + bookingref + "</td><td style='border: 2px solid gray; padding:10px;'><b>Booking Id: </b>" + bookingId + "</td></tr><tr><td style='border: 2px solid gray; padding:10px;'><b>Booking Date: </b>" + DateTime.Now.ToString("dd-MM-yyyy") + "</td><td style='border: 2px solid gray; padding:10px;'><b>Status: </b>" + status + "</td></tr><tr style='height: 10px;'></tr><tr><td colspan='2' align='center'><img src=\"@@IMAGE@@\" alt=\"INLINE attachment\" height='70' width='250' /><br /><font size='2'>(A Unit of Travstarz Holiday &amp; Destinations Pvt.Ltd)</font><br /><font size='2'>61-C 2nd Floor Eagle House Kalu Sarai Sarva Priya Vihar<br />New Delhi - 110016,&nbsp;&nbsp;India<br /><i>Tel No. :</i>&nbsp;47050000&nbsp;&nbsp;<i>Mail :</i>&nbsp;info@travstarz.com</font><br /><font size='2'><b>GST No:</b>&nbsp;07AAHCA9883B1ZI&nbsp;&nbsp;&nbsp;<b>Pan No:</b>&nbsp;AAHCA9883B</font></td></tr><tr style='height: 10px;'></tr><tr><td colspan='2' align='left' style='padding:10px;'><font size='4'>" + data[data.Length - 1].Split('!')[4] + "</font><br /><%=adrs %></td></tr><tr style='height: 15px;'></tr><tr><td style='padding-left:10px; width:50%;'><b>Check In Date: </b>" + chkin + "</td><td style='padding-left:10px;'><b>Check Out Date: </b>" + chkout + "</td></tr><tr><td style='padding-left:10px; width:50%;'><b>Hotel Name: </b>" + HotelName + "</td><td style='padding-left:10px;'><b>City: </b> " + city + "</td></tr><tr><td style='padding-left:10px; width:50%;'><b>No Of Night: </b>" + totnyt + "</td><td style='padding-left:10px;'><b>No Of Room(s): </b>" + totroom + "</td></tr><tr><td style='padding-left:10px; width:50%;'><b>Pax Name: </b>" + PaxName + "</td><td style='padding-left:10px;'><b>Room Type: </b>" + roomtype + "</td></tr><tr style='height: 25px;'></tr><tr><td align='center' colspan='2'><table width='100%' border='1px' cellpadding='10px'><tr><td><b>Amount (Including all Taxes)</b></td><td><b>Grand Total</b></td></tr><tr><td>" + price1 + "</td><td>" + price1 + "</td></tr></table></td><td align='center' colspan='2'></td></tr><tr style='height: 20px;'></tr><tr><td><b>Terms and Conditions</b></td><td align='right' rowspan='2'><b>Receiver's Signature</b></td></tr><tr style='height: 10px;'></tr><tr><td colspan='2' align='center'><b>This is an auto generated invoice hence no signature require.</b></td></tr></tbody></table></div><br /><br />Thank You.");
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
                        Response.Redirect("HotelBookingConfirmation.aspx");
                    }
                    catch (Exception)
                    {
                        Response.Redirect("HotelBookingConfirmation.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("Error.aspx?BookingID" + bookingId);
            }
        }
        catch (Exception ex)
        {
            string ServerPath = Server.MapPath("ErrorLogs");
            string DataFile1 = "BookAfterPayment" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
            FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
            StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
            try
            {

                fp1.WriteLine(ex.Message.ToString());
            }
            catch (Exception Ex)
            {
            }
            finally
            {
                fp1.Close();
                fp1 = null;

            }
        }
    }



}

