using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text.RegularExpressions;//SHASHANK
using System.ServiceModel;//SHASHANK
using System.Text;
using System.Security.Cryptography;

public partial class BookingWaitPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //shashank
            string insurnc_prc = string.Empty;
            string ins_chkcunt = string.Empty;
            if (Request.QueryString["bkdata"] != null)
            {
                insurnc_prc = cls.CommonClass.Base64Decode(Request.QueryString["bkdata"]);
                insurnc_prc = Regex.Split(insurnc_prc, "@Sha@")[1];//search string
                ins_chkcunt = cls.CommonClass.Base64Decode(Request.QueryString["bkdata"]);
                ins_chkcunt = Regex.Split(ins_chkcunt, "@Sha@")[2];//search string
                Session["ins_chkcnt"] = ins_chkcunt;//shashank
                Session["insurance_bkdata"] = cls.CommonClass.Base64Decode(Request.QueryString["bkdata"]);
            }
            //shashank

            string FlightString = string.Empty; string searchparam = string.Empty; string Flightdata = string.Empty;
            string Finalstring = string.Empty;
            string Bookuserid = string.Empty;
            string Agentcode = string.Empty;
            string Usertype = string.Empty; string Cityarray = string.Empty;
            string[] srchArr = null; string[] BookingData = null;
            string Reservationid = string.Empty;
            Reservationid = cls.CommonClass.Transactionid();
            Session["Reservationid"] = Reservationid;
            string orderid = Reservationid;
            Boolean check_Bal = false;
            Session["check_Bal"] = check_Bal;
            Cityarray = Global.CityandCountryArr;
            if (Request.QueryString["bkdata"] != null)
                FlightString = cls.CommonClass.Base64Decode(Request.QueryString["bkdata"]);

            FlightString = Regex.Split(FlightString, "@Sha@")[0];//shashank

            Session["flytbkdat"] = FlightString;
            //if (Session["BookData"] != null)
            //    FlightString = Session["BookData"].ToString();
            searchparam = Session["SearchString"].ToString();
            Flightdata = Session["FlightData"].ToString();

            string ins_pc = string.Empty;//shashank
            ins_pc = Flightdata.Split(',')[0];//shashank
            Flightdata = Flightdata.Replace(ins_pc, insurnc_prc);//shashank

            Finalstring = Flightdata + "," + searchparam.Replace(",", ";") + "^" + FlightString;
            TBOv10 objtbo = new TBOv10();
            string BookingResult = string.Empty;

            srchArr = searchparam.Split(';');
            int totalpass = Convert.ToInt32(srchArr[5]) + Convert.ToInt32(srchArr[6]) + Convert.ToInt32(srchArr[7]);
            BookingData = Flightdata.Split(',');
            int adtcnt = Convert.ToInt32(srchArr[5]); int chdcnt = Convert.ToInt32(srchArr[6]); int infcnf = Convert.ToInt32(srchArr[7]);
            //----------Calculate servicetax, markup, and Commisstionn----------//
            decimal serviceTax = 0; decimal commission = 0; decimal markup = 0; decimal totalYQ = 0; decimal totalTax = 0; decimal TotalAmount = 0;
            TotalAmount = Convert.ToDecimal(BookingData[0]);
            totalTax = Convert.ToDecimal(BookingData[2]);
            //totalYQ = Convert.ToDecimal(BookingData[4]);
            //---------------calculation end-----------------------------------//

            if (Session["userid"] != "" && Session["userid"] != null)
            {
                Bookuserid = Session["userid"].ToString();
            }
            if (Session["AgentCode"] != "" && Session["userid"] != null)
            {
                Agentcode = Session["AgentCode"].ToString();
            }
            if (Session["Usertype"] != "" && Session["Usertype"] != null)
            {
                Usertype = Session["AgentCode"].ToString();
            }
            string AgencyName = string.Empty;
            if (Session["AgencyName"] != "" && Session["AgencyName"] != null)
                AgencyName = Session["AgencyName"].ToString();
            //-----------------Fare Breakup start-------------------------------//
            string Farestring = string.Empty; string[] PaxwiseBreakup = { }; string[] FarebreakupOut = null; string[] FarebreakupInb = null;
            if (Session["FareString"] != null && Session["FareString"] != "")
            {
                Farestring = HttpContext.Current.Session["FareString"].ToString();
            }
            else
                Farestring = "";
            PaxwiseBreakup = Farestring.Split('`');
            FarebreakupOut = PaxwiseBreakup[0].Split(':');
            commission = Convert.ToDecimal(FarebreakupOut[7]);
            markup = Convert.ToDecimal(FarebreakupOut[6]);
            if (searchparam.Split(',', ';')[0].ToUpper() == "TWO" && searchparam.Split(',', ';')[searchparam.Split(',', ';').Length - 1] == "D")
            {
                FarebreakupInb = PaxwiseBreakup[1].Split(':');
                commission += Convert.ToDecimal(FarebreakupInb[7]);
                markup += Convert.ToDecimal(FarebreakupInb[6]);
            }
            string AvailableCash = Session["AvlCash"].ToString();
            string price = Session["FlightData"].ToString().Split(',')[0];
            //if (Convert.ToDecimal(AvailableCash) > Convert.ToDecimal(price))
            //{
            //    check_Bal = CF.CommonFunction.Check_Balance(TotalAmount, commission, markup, 0, Bookuserid, Bookuserid, Session["AgencyName"].ToString(), Session["AgentCode"].ToString(), "");

            //}

            check_Bal = CF.CommonFunction.Check_Balance(TotalAmount, commission, markup, 0, Bookuserid, Bookuserid, Session["AgencyName"].ToString(), Session["AgentCode"].ToString(), "");
            if (check_Bal == true)
            {
                Session["check_Bal"] = true;
                Response.Redirect("flightbalcheck.aspx");
            }
            else
            {
                //  ftcash
                try
                {

                    string custdethck = Session["flytbkdat"].ToString();

                    string customername = customername = custdethck.Split(',')[0].Split(' ')[1] + " " + custdethck.Split(',')[9];
                    string email = custdethck.Split(',')[custdethck.Split(',').Length - 2];
                    string mbl = custdethck.Split(',')[custdethck.Split(',').Length - 1];
                    string amount = (Convert.ToDecimal(price)).ToString();
                    string url = ConfigurationManager.AppSettings["RedirectUrl"];
                    string mid = ConfigurationManager.AppSettings["MID"];
                    string secret = ConfigurationManager.AppSettings["SecretKey"];
                    string all = "'" + amount + "''" + orderid + "''" + mid + "'";
                    string checksum = calculateChecksum(secret, all).ToLower();
                    Session["ftcashparams"] = mid + "&" + checksum + "&" + orderid + "&" + email + "&" + customername + "&" + url + "&" + amount + "&" + mbl;
                    Response.Redirect("https://www.ftcash.com/app/temp/verifymerchant2.php?mid=" + mid + "&checksum=" + checksum + "&orderid=" + orderid + "&email=" + email + "&name=" + customername + "&redirect_url=" + url + "&amount=" + amount + "&cell=" + mbl + "");


                }
                catch (Exception ex)
                {

                }


                //ftcash
            }
        }
        catch (Exception)
        {


        }
    }

    public static string calculateChecksum(string secret_key, string all)
    {

        byte[] key_byte = Encoding.UTF8.GetBytes(secret_key);
        byte[] stringToSign_byte = Encoding.UTF8.GetBytes(all);


        HMACSHA256 hmac = new HMACSHA256(key_byte);
        byte[] hashValue = hmac.ComputeHash(stringToSign_byte);

        return BitConverter.ToString(hashValue).Replace("-", "");

    }
    public string getagencyinfo()
    {
        string Finalstring = string.Empty;
        try
        {
            String ConnectionServer = ConfigurationManager.AppSettings.Get("ConnectionServer");
            String sConn = "Server=" + ConnectionServer + ";" + ((ConfigurationManager.AppSettings.Get("ConnectionString")));
            System.Data.SqlClient.SqlConnection MyConnection = new System.Data.SqlClient.SqlConnection(sConn);
            MyConnection.Open(); string sql = "";
            sql = "Select * from tblcitycountry";
            System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand(sql, MyConnection);
            System.Data.SqlClient.SqlDataReader adoDR = command.ExecuteReader();
            try
            {
                if (adoDR.HasRows)
                {
                    while (adoDR.Read())
                    {
                        adoDR.Read();
                        Finalstring = adoDR["Agentcode"].ToString() + "," + adoDR["agencyName"].ToString() + "," + adoDR["address"].ToString() + "," + adoDR["PhoneNo"].ToString() + "," + adoDR["Emailid"].ToString() + "," + adoDR["RefAgency"].ToString();
                    }
                }
            }
            catch
            {
            }

        }
        catch
        {
        }
        return Finalstring;
    }
}