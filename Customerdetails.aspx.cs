using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text.RegularExpressions;
using System.IO;
using System.Globalization;
using System.Text;
using System.Data.SqlClient;

public partial class Customerdetails : System.Web.UI.Page
{
    public string perroomrates = string.Empty;
    public string country = string.Empty;
    public string testsupp = string.Empty;
    public string currtst = string.Empty;
    public string Pdata = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["Bookingdetails"] = cls.CommonClass.Base64Decode(Request.QueryString["BookingData"]);
        Session["Bookingdetails"] = cls.CommonClass.Base64Decode(Request.QueryString["BookingData"]);
        string bookdet = Session["Bookingdetails"].ToString();
        if (Session["loginVal"].ToString() == "directorops@holidayscarnivaleurope.com")
            currtst = "€";
        else
            currtst = "INR";
        //try
        //{
        //    perroomrates = Regex.Split(bookdet.Split('!')[17], "%")[1].Replace("]", "");
        //}
        //catch (Exception)
        //{
        //    perroomrates = "";
        //}
        Pdata= bookdet;
        string[] arr = bookdet.Split('!');
        string policydet = "";
        string response = "";
        string deadline = "";
        var searchparam = Session["Param"].ToString();
        cls.CommonClass obj = new cls.CommonClass();
        country = searchparam.Split('@')[2].Split('^')[0];
        //$20382005--1331-0-0--1--1 0$DOTW_Room_1210718_20160729155310.txt$DOTW$
        string cat = Session["Category"].ToString();
        try
        {
            if (arr[5].ToUpper() == "TBO")
            {
                policydet = arr[16] + "$" + arr[11];
                response = obj.GetCancelPolicy(policydet, "", "TBO", cat);
            }
            else if (arr[5].ToUpper() == "TRAVELBULLZ")
            {
                policydet = arr[16] + "$" + arr[11] + "$" + arr[14] + "$" + arr[5] + "$" + arr[7] + "~";
                response = obj.GetCancelPolicy(searchparam, policydet, "TRAVELBULLZ", cat);
            }
            else if (arr[5].ToUpper() == "DESIYA")
            {
                policydet = arr[16] + "$" + arr[11] + "$" + arr[17].Split('*')[1] + "$" + arr[13];
                response = obj.GetCancelPolicy(searchparam, policydet, "DESIYA", cat);
            }
            else if (arr[5].ToUpper() == "ABREU")
            {
                //fVbmw90AvETRGhApe7zNZkNNJ7G6vltYLR3CxMVW0UWpgV5blC1Akii/oXVwJKrSJxNvHoJIPcDGxAg5Wapi7aS W8/dTiN79EtUHDrgF1Wq6vmjD4h31nz3rtkWx4y5HtaS3LCwgEz1PYscS6kMnQ==~fVbmw90AvETRGhApe7zNZkNNJ7G6vltYLR3CxMVW0UWpgV5blC1Akii/oXVwJKrSJxNvHoJIPcDGxAg5Wapi7aS W8/dTiN79EtUHDrgF1Wq6vmjD4h31nz3rtkWx4y5HtaS3LCwgEz1PYscS6kMnQ==$4126191~4126191$Abreu_HotelAvailability_RS_20170518115530.txt$ABREU$308878$Bed and Breakfast~Bed and Breakfast
                policydet = arr[16] + "$" + arr[11] + "$" + arr[8] + "$" + arr[13] + "$" + arr[7] + "$" + arr[17]; //Shashank Gupta-- arr[17].Split('%')[0]  --old-arr[8] , new-17
                response = obj.GetCancelPolicy(searchparam, policydet, "ABREU", "INR");
            }
            else if (arr[5].ToUpper() == "EZEEGO1")
            {
                policydet = arr[16] + "$" + arr[11] + "$" + arr[8] + "$" + arr[13] + "$" + arr[7];
                response = obj.GetCancelPolicy(searchparam, policydet, "EZEEGO1", cat);
            }

            else if (arr[5].ToUpper() == "QUANTUM")
            {
                policydet = arr[16] + "$" + arr[11] + "$^" + arr[18] + "$" + arr[13] + "$" + arr[7];
                response = obj.GetCancelPolicy(searchparam, policydet.Replace("%", "").Replace("(HASH)", "#"), "QUANTUM", cat);
            }

            else if (arr[5].ToUpper() == "HOTELBEDS")
            {
                policydet = arr[16] + "$" + arr[11] + "$^" + arr[18] + "$" + arr[13] + "$" + arr[7];
                response = obj.GetCancelPolicy(searchparam, policydet.Replace("%", "").Replace("(HASH)", "#"), "HOTELBEDS", cat);
            }

            else if (arr[5].ToUpper() == "TRAVSTARZ")
            {
                DateTime dt1 = DateTime.ParseExact(searchparam.Split('^')[0], "dd MMM yyyy", CultureInfo.InvariantCulture);
                DateTime dt2 = DateTime.ParseExact(searchparam.Split('^')[1], "dd MMM yyyy", CultureInfo.InvariantCulture);
                string formatfromdDate = dt1.ToString("yyyy-MM-dd");
                string formattodDate = dt2.ToString("yyyy-MM-dd");
                string htlid = bookdet.Split('!')[7];
                string rmtype = bookdet.Split('!')[12];

                if (arr[5].ToUpper() == "TRAVSTARZ")
                {
                    response = obj.GetCancelPolicy(searchparam, rmtype + "$$" + htlid, arr[5], formatfromdDate + "^" + formattodDate);
                }
                else{
                    for (int r = 0; r < rmtype.Split('~').Length; r++)
                    {
                        response += obj.GetCancelPolicy(htlid, rmtype.Split('~')[r], arr[5], formatfromdDate + "^" + formattodDate);
                    }
                }
                //policydet = "$"+arr[11] + "$" + arr[14] + "$" + arr[13] + "$" + arr[7];
                //response = obj.GetCancelPolicy(searchparam, policydet, "TRAVSTARZ", cat);
                // response = bookdet.Split('*')[1];//.Split('~')[0];
            }
            else if (arr[5].ToUpper() == "JACTRAVEL")
            {
                testsupp = "JT";
                policydet = "$" + arr[11] + "$" + arr[13] + "$" + arr[7] + "$" + bookdet;
                //policydet = bookdet;
                response = obj.JacGetCancelPolicy(searchparam, policydet, "JACTRAVEL", "INR");
            }


            else
            {
                policydet = "$" + arr[11] + "$" + arr[14] + "$" + arr[13] + "$";
                response = obj.GetCancelPolicy(searchparam, policydet, arr[13], cat);
            }
        }
        catch (Exception ex)
        {
            string ServerPath = Server.MapPath("ErrorLogs");
            string DataFile1 = "CancellationPolicy" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
            FileStream fs1 = new FileStream(ServerPath + "/" + DataFile1, FileMode.Create, FileAccess.Write);
            StreamWriter fp1 = new StreamWriter(fs1, Encoding.UTF8);
            try
            {
                fp1.WriteLine(response);
                fp1.WriteLine(ex.Message.ToString());
            }
            catch (Exception Ex)
            {
            }
            finally
            {
                fp1.Close();
                fp1 = null;
                response = "[]";
            }
        }
        try
        {
            if (!string.IsNullOrEmpty(response) && response != "[]")
            {
                XmlDocument doc = CF.CommonFunction.JSONtoXML(response);
                XmlNodeList cnlplcy = doc.GetElementsByTagName("Cancellationpolicies");
                foreach (XmlNode rootnode in cnlplcy)
                {
                    foreach (XmlNode chnode in rootnode)
                    {
                        //if (chnode.Name == "bookingref")
                        //{
                        Session["PreBookingToken"] = chnode["bookingref"].InnerText;
                        //}
                        string cancellationcharge = chnode["Cancellationcharge"].InnerText;
                        if (arr[5].ToUpper() == "TRAVSTARZ")
                        {
                            if (cancellationcharge.Contains("~"))
                            {
                                response = cancellationcharge.Replace("~", "</li><li>").Replace("!", "");
                            }
                            else
                            {
                                response = cancellationcharge.Replace("!", "");
                            }
                        }
                        else
                        {
                            if (cancellationcharge.Contains("|"))
                            {
                                response = cancellationcharge.Replace("|", "</li><li>").Replace("!", "");
                            }
                            else
                            {
                                response = cancellationcharge.Replace("!", "");
                            }
                        }
                        if (arr[5].ToUpper() == "ABREU")
                        {
                            try
                            {
                                deadline = Regex.Split(cancellationcharge, "Deadline: ")[1];
                            }
                            catch (Exception)
                            {
                                deadline = DateTime.Now.ToString("dd-MM-yyyy"); //Regex.Split(cancellationcharge, "Deadline: ")[1];// change after certification 
                            }
                        }
                        else if (arr[5].ToUpper() == "TRAVSTARZ")
                        {
                            deadline = "";
                        }
                        else
                        {
                            deadline = Regex.Split(cancellationcharge, "Deadline: ")[1];
                        }
                        //deadline = Regex.Split(cancellationcharge, "Deadline: ")[1];
                    }
                    cancelpolicy.InnerHtml = "<div style=' font-size: 16px;padding: 9px;  background-image: radial-gradient(circle, #051937, #004770, #007884, #00a865, #92cd18);color: #fff;margin-bottom: 16px;'> Cancellation Policy Details </div><ul><li style='color: red;font-size: 16px;'>" + response + "</li></ul><hr/>";
                }
               
                try
                {
                    if (arr[5].ToUpper() == "TRAVSTARZ")//dhanu
                    {
                        int count = 0;
                        string noofrooms = searchparam.Split('^')[6];
                        string roomtype = bookdet.Split('!')[18].Split('%')[0];
                        string[] totalroomtype = roomtype.Split('~');
                        for (int i = 0; i < Convert.ToInt32(noofrooms); i++)
                        {
                            if (totalroomtype[i] == "On Request")
                            {
                                holddiv.Visible = false;
                                count = 1;
                                break;  
                            }
                        }
                        if (count == 0)
                        {
                            string hotelname = string.Empty;
                            string roomname = string.Empty;
                            DateTime dt1 = DateTime.ParseExact(searchparam.Split('^')[0], "dd MMM yyyy", CultureInfo.InvariantCulture);
                            DateTime dt2 = DateTime.ParseExact(searchparam.Split('^')[1], "dd MMM yyyy", CultureInfo.InvariantCulture);
                            string bookingdate = DateTime.Now.ToString("yyyy-MM-dd");
                            string formatfromdDate = dt1.ToString("yyyy-MM-dd");
                            string formattodDate = dt2.ToString("yyyy-MM-dd");
                            hotelname = bookdet.Split('!')[0];
                            roomname = bookdet.Split('!')[12];
                            DateTime dhanu;
                            string sqll = "select distinct Max(CancellationDayBefore) CancellationDayBefore ,HotelName,RoomType,ValidityStart,ValidityEnd,max(CancellationChargePercent) CancellationChargePercent from CancellationPolicy_Extranet where HotelName ='"
                                           + hotelname + "'and RoomType ='" + roomname + "' and ValidityStart <= '" + formatfromdDate + "' and ValidityEnd >= '" + formattodDate + "' group by HotelName,RoomType,ValidityStart,ValidityEnd";
                            SqlDataReader sdr1 = DB.CommonDatabase.DataReader(sqll);
                            int CancellationDayBefore = 0;
                            int CancellationChargePercent = 0;
                            try
                            {
                                if (sdr1.Read())
                                {
                                    CancellationDayBefore = Convert.ToInt32(sdr1["CancellationDayBefore"].ToString());
                                    CancellationChargePercent = Convert.ToInt32(sdr1["CancellationChargePercent"].ToString());
                                }
                            }
                            catch (Exception ex)
                            {
                            }
                            finally
                            {
                                sdr1.Close();
                                sdr1 = null;
                            }
                            dhanu = dt1.AddDays(-CancellationDayBefore);
                            string cancellationdeadline = dhanu.ToString("yyyy-MM-dd");
                            if (Convert.ToDateTime(cancellationdeadline) >= Convert.ToDateTime(bookingdate))
                            {
                                holddiv.Visible = true;
                            }
                        }
                    }

                    if ((Convert.ToDateTime(deadline) - DateTime.Now).TotalDays <= 15)
                    {
                        holddiv.Visible = false;
                    }
                    //if ((Convert.ToDateTime(deadline) - Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"))).TotalDays <= 15)
                    //{
                    //    holddiv.Visible = false;
                    //}
                    if (Convert.ToDateTime(deadline) <= DateTime.Now)
                    {
                        holddiv.Visible = false;
                    }
                    if (deadline == DateTime.Now.ToString("yyyy-MM-dd") || deadline == DateTime.Now.ToString("dd-MM-yyyy"))
                    {
                        holddiv.Visible = false;
                    }
                    if (arr[5].ToUpper() == "TBO" || arr[5].ToUpper() == "DESIYA" || arr[5].ToUpper() == "EZEEGO1")
                    {
                        holddiv.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    if (deadline == DateTime.Now.ToString("dd-MM-yyyy"))
                    {
                        holddiv.Visible = false;
                    }
                    if (deadline == DateTime.Now.ToString("yyyy-MM-dd") || deadline == DateTime.Now.ToString("dd-MM-yyyy"))
                    {
                        holddiv.Visible = false;
                    }
                    if (arr[5].ToUpper() == "TBO" || arr[5].ToUpper() == "DESIYA" || arr[5].ToUpper() == "EZEEGO1")
                    {
                        holddiv.Visible = false;
                    }
                }
            }
            //else if (arr[5].ToUpper() == "JACTRAVEL")
            //{
            //    cancelpolicy.InnerHtml = "";
            //}
            else
            {
                holddiv.Visible = false;
                cancelpolicy.InnerHtml = "100% Charges will be applicable. Deadline: " + DateTime.Now.ToString("yyyy-MM-dd");

            }
        }
        catch (Exception ex)
        {
            string ServerPath = Server.MapPath("ErrorLogs");
            string DataFile1 = "CustomerdetailPage" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + ".txt";
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
            holddiv.Visible = false;
        }
    }
}